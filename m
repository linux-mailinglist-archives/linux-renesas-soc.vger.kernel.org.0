Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D184084F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 08:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237357AbhIMGys (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 02:54:48 -0400
Received: from www.zeus03.de ([194.117.254.33]:37150 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237429AbhIMGyr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 02:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=DkpAcpQSKdB7Qp
        6wk21gFyTHMbV4tODzKDF2xAAAo2Y=; b=xtj0QP9w4NYCtGfMp7ME56C9U74gUT
        v3i3hGBgDaUvqgT56otIxfKRgP0zfZgrywPm1Q/0wfh6jCrzVqILbF/4g1aU8B6m
        QH4SI4Kk6E4rfEF+umZrTlLBqOygbFPEHVgYnmCVElFoQ20cKGAA4jmDzNRijhwP
        /2DgxyCkG2N2A=
Received: (qmail 2765602 invoked from network); 13 Sep 2021 08:53:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2021 08:53:30 +0200
X-UD-Smtp-Session: l3s3148p1@IC097NrL4ssgAwDPXwnUAPbX7otZ63eo
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 1/4] clk: renesas: cpg-lib: move RPC clock registration to the library
Date:   Mon, 13 Sep 2021 08:53:14 +0200
Message-Id: <20210913065317.2297-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913065317.2297-1-wsa+renesas@sang-engineering.com>
References: <20210913065317.2297-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We want to reuse this code for V3U soon. Because its RPCCKCR register is
at a different offset, the moved functions do not use the base register
as an argument anymore but the RPCCKCR register itself. Otherwise it is
a plain code move. Verified that an Eagle board with R-Car V3M still
works.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

These new library functions use CLK_SET_RATE_PARENT in
clk_register_composite() as flags. This is what the current upstream
code does. The V3U BSP, however, doesn't use this flag and passes 0 as
an argument. It doesn't matter much currently, because the RPC drivers
do not use any clk function calls. Yet, I think the flags provided
should be consistent, so I kept what was already upstream. D'accord?

 drivers/clk/renesas/rcar-cpg-lib.c  | 83 +++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-cpg-lib.h  |  7 +++
 drivers/clk/renesas/rcar-gen3-cpg.c | 89 +----------------------------
 3 files changed, 92 insertions(+), 87 deletions(-)

diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
index 5678768ee1f2..e93f0011eb07 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.c
+++ b/drivers/clk/renesas/rcar-cpg-lib.c
@@ -267,4 +267,87 @@ struct clk * __init cpg_sd_clk_register(const char *name,
 	return clk;
 }
 
+struct rpc_clock {
+	struct clk_divider div;
+	struct clk_gate gate;
+	/*
+	 * One notifier covers both RPC and RPCD2 clocks as they are both
+	 * controlled by the same RPCCKCR register...
+	 */
+	struct cpg_simple_notifier csn;
+};
+
+static const struct clk_div_table cpg_rpc_div_table[] = {
+	{ 1, 2 }, { 3, 4 }, { 5, 6 }, { 7, 8 }, { 0, 0 },
+};
+
+struct clk * __init cpg_rpc_clk_register(const char *name,
+	void __iomem *rpcckcr, const char *parent_name,
+	struct raw_notifier_head *notifiers)
+{
+	struct rpc_clock *rpc;
+	struct clk *clk;
+
+	rpc = kzalloc(sizeof(*rpc), GFP_KERNEL);
+	if (!rpc)
+		return ERR_PTR(-ENOMEM);
+
+	rpc->div.reg = rpcckcr;
+	rpc->div.width = 3;
+	rpc->div.table = cpg_rpc_div_table;
+	rpc->div.lock = &cpg_lock;
+
+	rpc->gate.reg = rpcckcr;
+	rpc->gate.bit_idx = 8;
+	rpc->gate.flags = CLK_GATE_SET_TO_DISABLE;
+	rpc->gate.lock = &cpg_lock;
+
+	rpc->csn.reg = rpcckcr;
+
+	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
+				     &rpc->div.hw,  &clk_divider_ops,
+				     &rpc->gate.hw, &clk_gate_ops,
+				     CLK_SET_RATE_PARENT);
+	if (IS_ERR(clk)) {
+		kfree(rpc);
+		return clk;
+	}
+
+	cpg_simple_notifier_register(notifiers, &rpc->csn);
+	return clk;
+}
+
+struct rpcd2_clock {
+	struct clk_fixed_factor fixed;
+	struct clk_gate gate;
+};
+
+struct clk * __init cpg_rpcd2_clk_register(const char *name,
+					   void __iomem *rpcckcr,
+					   const char *parent_name)
+{
+	struct rpcd2_clock *rpcd2;
+	struct clk *clk;
+
+	rpcd2 = kzalloc(sizeof(*rpcd2), GFP_KERNEL);
+	if (!rpcd2)
+		return ERR_PTR(-ENOMEM);
+
+	rpcd2->fixed.mult = 1;
+	rpcd2->fixed.div = 2;
+
+	rpcd2->gate.reg = rpcckcr;
+	rpcd2->gate.bit_idx = 9;
+	rpcd2->gate.flags = CLK_GATE_SET_TO_DISABLE;
+	rpcd2->gate.lock = &cpg_lock;
+
+	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
+				     &rpcd2->fixed.hw, &clk_fixed_factor_ops,
+				     &rpcd2->gate.hw, &clk_gate_ops,
+				     CLK_SET_RATE_PARENT);
+	if (IS_ERR(clk))
+		kfree(rpcd2);
+
+	return clk;
+}
 
diff --git a/drivers/clk/renesas/rcar-cpg-lib.h b/drivers/clk/renesas/rcar-cpg-lib.h
index d00c91b116ca..35c0217c2f8b 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.h
+++ b/drivers/clk/renesas/rcar-cpg-lib.h
@@ -30,4 +30,11 @@ struct clk * __init cpg_sd_clk_register(const char *name,
 	void __iomem *base, unsigned int offset, const char *parent_name,
 	struct raw_notifier_head *notifiers, bool skip_first);
 
+struct clk * __init cpg_rpc_clk_register(const char *name,
+	void __iomem *rpcckcr, const char *parent_name,
+	struct raw_notifier_head *notifiers);
+
+struct clk * __init cpg_rpcd2_clk_register(const char *name,
+					   void __iomem *rpcckcr,
+					   const char *parent_name);
 #endif
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 558191c99b48..741f6e74bbcf 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -301,95 +301,10 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 	return clk;
 }
 
-struct rpc_clock {
-	struct clk_divider div;
-	struct clk_gate gate;
-	/*
-	 * One notifier covers both RPC and RPCD2 clocks as they are both
-	 * controlled by the same RPCCKCR register...
-	 */
-	struct cpg_simple_notifier csn;
-};
-
 static const struct clk_div_table cpg_rpcsrc_div_table[] = {
 	{ 2, 5 }, { 3, 6 }, { 0, 0 },
 };
 
-static const struct clk_div_table cpg_rpc_div_table[] = {
-	{ 1, 2 }, { 3, 4 }, { 5, 6 }, { 7, 8 }, { 0, 0 },
-};
-
-static struct clk * __init cpg_rpc_clk_register(const char *name,
-	void __iomem *base, const char *parent_name,
-	struct raw_notifier_head *notifiers)
-{
-	struct rpc_clock *rpc;
-	struct clk *clk;
-
-	rpc = kzalloc(sizeof(*rpc), GFP_KERNEL);
-	if (!rpc)
-		return ERR_PTR(-ENOMEM);
-
-	rpc->div.reg = base + CPG_RPCCKCR;
-	rpc->div.width = 3;
-	rpc->div.table = cpg_rpc_div_table;
-	rpc->div.lock = &cpg_lock;
-
-	rpc->gate.reg = base + CPG_RPCCKCR;
-	rpc->gate.bit_idx = 8;
-	rpc->gate.flags = CLK_GATE_SET_TO_DISABLE;
-	rpc->gate.lock = &cpg_lock;
-
-	rpc->csn.reg = base + CPG_RPCCKCR;
-
-	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
-				     &rpc->div.hw,  &clk_divider_ops,
-				     &rpc->gate.hw, &clk_gate_ops,
-				     CLK_SET_RATE_PARENT);
-	if (IS_ERR(clk)) {
-		kfree(rpc);
-		return clk;
-	}
-
-	cpg_simple_notifier_register(notifiers, &rpc->csn);
-	return clk;
-}
-
-struct rpcd2_clock {
-	struct clk_fixed_factor fixed;
-	struct clk_gate gate;
-};
-
-static struct clk * __init cpg_rpcd2_clk_register(const char *name,
-						  void __iomem *base,
-						  const char *parent_name)
-{
-	struct rpcd2_clock *rpcd2;
-	struct clk *clk;
-
-	rpcd2 = kzalloc(sizeof(*rpcd2), GFP_KERNEL);
-	if (!rpcd2)
-		return ERR_PTR(-ENOMEM);
-
-	rpcd2->fixed.mult = 1;
-	rpcd2->fixed.div = 2;
-
-	rpcd2->gate.reg = base + CPG_RPCCKCR;
-	rpcd2->gate.bit_idx = 9;
-	rpcd2->gate.flags = CLK_GATE_SET_TO_DISABLE;
-	rpcd2->gate.lock = &cpg_lock;
-
-	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
-				     &rpcd2->fixed.hw, &clk_fixed_factor_ops,
-				     &rpcd2->gate.hw, &clk_gate_ops,
-				     CLK_SET_RATE_PARENT);
-	if (IS_ERR(clk))
-		kfree(rpcd2);
-
-	return clk;
-}
-
-
 static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
 static u32 cpg_mode __initdata;
@@ -600,11 +515,11 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		break;
 
 	case CLK_TYPE_GEN3_RPC:
-		return cpg_rpc_clk_register(core->name, base,
+		return cpg_rpc_clk_register(core->name, base + CPG_RPCCKCR,
 					    __clk_get_name(parent), notifiers);
 
 	case CLK_TYPE_GEN3_RPCD2:
-		return cpg_rpcd2_clk_register(core->name, base,
+		return cpg_rpcd2_clk_register(core->name, base + CPG_RPCCKCR,
 					      __clk_get_name(parent));
 
 	default:
-- 
2.30.2

