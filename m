Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4191541BF4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Sep 2021 08:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244342AbhI2GvP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Sep 2021 02:51:15 -0400
Received: from www.zeus03.de ([194.117.254.33]:40932 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244427AbhI2GvN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Sep 2021 02:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=cddavjG7A9oJE9
        JCDmZT0+2ii4YEZddVKBRUutEkzfU=; b=JDpPG2hjTY0lNX7atglMNRaOhhPfWw
        CZpfCvpINdL7Qtyi44fkWjabOOK9wQWplD1ZoVhaTmP00oNntXtT8VKYjPHGky+E
        iOhUEz7+/CINrzUz9MHegqAHfJItrXrKM4rhoB3gGmeGkraeGMqeZssNGWJ2HToE
        tBVjN+WizSyF4=
Received: (qmail 1544803 invoked from network); 29 Sep 2021 08:49:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Sep 2021 08:49:30 +0200
X-UD-Smtp-Session: l3s3148p1@1/xkuxzNxNcgAwDPXwj5ACKF5hhAYpZw
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/4] clk: renesas: r8a779a0: Add RPC support
Date:   Wed, 29 Sep 2021 08:49:22 +0200
Message-Id: <20210929064924.1997-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929064924.1997-1-wsa+renesas@sang-engineering.com>
References: <20210929064924.1997-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index f16d125ca009..93242dbf54ae 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -36,6 +36,9 @@ enum rcar_r8a779a0_clk_types {
 	CLK_TYPE_R8A779A0_SD,
 	CLK_TYPE_R8A779A0_MDSEL,	/* Select parent/divider using mode pin */
 	CLK_TYPE_R8A779A0_OSC,	/* OSC EXTAL predivider and fixed divider */
+	CLK_TYPE_R8A779A0_RPCSRC,
+	CLK_TYPE_R8A779A0_RPC,
+	CLK_TYPE_R8A779A0_RPCD2,
 };
 
 struct rcar_r8a779a0_cpg_pll_config {
@@ -120,6 +123,10 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_FIXED(".s3",		CLK_S3,		CLK_PLL1_DIV2,	4, 1),
 	DEF_FIXED(".sdsrc",		CLK_SDSRC,	CLK_PLL5_DIV4,	1, 1),
 	DEF_RATE(".oco",		CLK_OCO,	32768),
+	DEF_BASE(".rpcsrc",	 CLK_RPCSRC,	   CLK_TYPE_R8A779A0_RPCSRC, CLK_PLL5),
+	DEF_BASE("rpc",		 R8A779A0_CLK_RPC, CLK_TYPE_R8A779A0_RPC, CLK_RPCSRC),
+	DEF_BASE("rpcd2",	 R8A779A0_CLK_RPCD2, CLK_TYPE_R8A779A0_RPCD2,
+		 R8A779A0_CLK_RPC),
 
 	/* Core Clock Outputs */
 	DEF_FIXED("zx",		R8A779A0_CLK_ZX,	CLK_PLL20_DIV2,	2, 1),
@@ -193,6 +200,7 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("msi3",		621,	R8A779A0_CLK_MSO),
 	DEF_MOD("msi4",		622,	R8A779A0_CLK_MSO),
 	DEF_MOD("msi5",		623,	R8A779A0_CLK_MSO),
+	DEF_MOD("rpc-if",	629,	R8A779A0_CLK_RPCD2),
 	DEF_MOD("scif0",	702,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
@@ -255,10 +263,16 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("vspx3",	1031,	R8A779A0_CLK_S1D1),
 };
 
+static const struct clk_div_table cpg_rpcsrc_div_table[] = {
+	{ 0, 4 }, { 1, 6 }, { 2, 5 }, { 3, 6 }, { 0, 0 },
+};
+
 static const struct rcar_r8a779a0_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
 static u32 cpg_mode __initdata;
 
+#define CPG_RPCCKCR 0x874
+
 static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
 	struct clk **clks, void __iomem *base,
@@ -322,6 +336,21 @@ static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
 		div = cpg_pll_config->osc_prediv * core->div;
 		break;
 
+	case CLK_TYPE_R8A779A0_RPCSRC:
+		return clk_register_divider_table(NULL, core->name,
+						  __clk_get_name(parent), 0,
+						  base + CPG_RPCCKCR, 3, 2, 0,
+						  cpg_rpcsrc_div_table,
+						  &cpg_lock);
+
+	case CLK_TYPE_R8A779A0_RPC:
+		return cpg_rpc_clk_register(core->name, base + CPG_RPCCKCR,
+					    __clk_get_name(parent), notifiers);
+
+	case CLK_TYPE_R8A779A0_RPCD2:
+		return cpg_rpcd2_clk_register(core->name, base + CPG_RPCCKCR,
+					      __clk_get_name(parent));
+
 	default:
 		return ERR_PTR(-EINVAL);
 	}
-- 
2.30.2

