Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0440B41B80F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 22:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242649AbhI1UKB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 16:10:01 -0400
Received: from www.zeus03.de ([194.117.254.33]:60736 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242641AbhI1UJ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 16:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=a3VTofJ6q07YzM
        cJ7axeINyJDw4hdg1OHgnT+sNimz0=; b=AbPsXFNeBxoyZu0PMeiZc/mSg78xTY
        V5eze5xOFavDXyfSqyqxosqjdITro3J8DgsasOwGy6pl6nb96XCw4GKz/PSUeq7U
        MXgIn4n9v8/sWw27b64BK20ig91C1eGZ3ckFur8xBfcaxm3roXuRMz35r43C+L3Y
        eeuBygxmpR0G8=
Received: (qmail 1377205 invoked from network); 28 Sep 2021 22:08:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2021 22:08:16 +0200
X-UD-Smtp-Session: l3s3148p1@OVsexhPNctIgAwDPXxnDADNsFyRXxb9N
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 1/9] clk: renesas: gen3-cpg: add dummy SDnH clock
Date:   Tue, 28 Sep 2021 22:07:56 +0200
Message-Id: <20210928200804.50922-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently, SDnH is handled together with SDn. This caused lots of
problems, so we want SDnH as a seperate clock. Introduce a dummy SDnH
type here which creates a fixed-factor clock with factor 1. That allows
us to convert the per-SoC CPG drivers while keeping the old behaviour
for now. A later patch then will add the proper functionality.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/rcar-cpg-lib.c  | 9 +++++++++
 drivers/clk/renesas/rcar-cpg-lib.h  | 4 ++++
 drivers/clk/renesas/rcar-gen3-cpg.c | 4 ++++
 drivers/clk/renesas/rcar-gen3-cpg.h | 4 ++++
 4 files changed, 21 insertions(+)

diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
index 5678768ee1f2..351cb9c04f5c 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.c
+++ b/drivers/clk/renesas/rcar-cpg-lib.c
@@ -65,6 +65,15 @@ void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
 /*
  * SDn Clock
  */
+
+struct clk * __init cpg_sdh_clk_register(const char *name,
+	void __iomem *sdnckcr, const char *parent_name,
+	struct raw_notifier_head *notifiers)
+{
+	/* placeholder during transition */
+	return clk_register_fixed_factor(NULL, name, parent_name, 0, 1, 1);
+}
+
 #define CPG_SD_STP_HCK		BIT(9)
 #define CPG_SD_STP_CK		BIT(8)
 
diff --git a/drivers/clk/renesas/rcar-cpg-lib.h b/drivers/clk/renesas/rcar-cpg-lib.h
index d00c91b116ca..548cb9562f35 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.h
+++ b/drivers/clk/renesas/rcar-cpg-lib.h
@@ -26,6 +26,10 @@ void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
 
 void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set);
 
+struct clk * __init cpg_sdh_clk_register(const char *name,
+	void __iomem *sdnckcr, const char *parent_name,
+	struct raw_notifier_head *notifiers);
+
 struct clk * __init cpg_sd_clk_register(const char *name,
 	void __iomem *base, unsigned int offset, const char *parent_name,
 	struct raw_notifier_head *notifiers, bool skip_first);
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 558191c99b48..182b189bc8f4 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -486,6 +486,10 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 			mult *= 2;
 		break;
 
+	case CLK_TYPE_GEN3_SDH:
+		return cpg_sdh_clk_register(core->name, base + core->offset,
+					   __clk_get_name(parent), notifiers);
+
 	case CLK_TYPE_GEN3_SD:
 		return cpg_sd_clk_register(core->name, base, core->offset,
 					   __clk_get_name(parent), notifiers,
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index 3d949c4a3244..2bc0afadf604 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -17,6 +17,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_PLL2,
 	CLK_TYPE_GEN3_PLL3,
 	CLK_TYPE_GEN3_PLL4,
+	CLK_TYPE_GEN3_SDH,
 	CLK_TYPE_GEN3_SD,
 	CLK_TYPE_GEN3_R,
 	CLK_TYPE_GEN3_MDSEL,	/* Select parent/divider using mode pin */
@@ -32,6 +33,9 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_SOC_BASE,
 };
 
+#define DEF_GEN3_SDH(_name, _id, _parent, _offset)	\
+	DEF_BASE(_name, _id, CLK_TYPE_GEN3_SDH, _parent, .offset = _offset)
+
 #define DEF_GEN3_SD(_name, _id, _parent, _offset)	\
 	DEF_BASE(_name, _id, CLK_TYPE_GEN3_SD, _parent, .offset = _offset)
 
-- 
2.30.2

