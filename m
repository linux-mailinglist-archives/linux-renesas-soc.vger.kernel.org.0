Return-Path: <linux-renesas-soc+bounces-10669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B32969D5F24
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 13:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 448971F237FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 12:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2BB1DF72D;
	Fri, 22 Nov 2024 12:46:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F951E492;
	Fri, 22 Nov 2024 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279604; cv=none; b=O+liqkKp+ipDZg4UIlkxrSM2Q6+B0c2n0cXoyUP6idUXXdSGWzTYVCCpLEbmSO9RLYDrMFHVS6R8kxTl8tyVxoaPFYX+jAgtv3ioe2783w4m30wiDN93oyluNmM/zTaLyrLAg2qVhIyqivhYGauhGEbqb8PMdZZH/VvddeThvyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279604; c=relaxed/simple;
	bh=uu3PU+wMTreO1z6MMk0kSHVcWt55jq9HItHOLvU9r5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ph0iKBlOnKC3Xk07YaMUoZS2NnnwBCi4KcrHIfMivWeSUYqljf6AJQeB5AeEOKiWEBSWmg1WyHQJL6ug6UktZukxGrrQ/iQ723xrQCCbWM5BLmqgWuDXna3NRO3ct2DIqip0xYowC/U8LzALPTRtNmBAjd3OyXCx0rWuSb4M0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: qDOONRtTRkaZYyHUbd28Jw==
X-CSE-MsgGUID: KBYi+kAmTaOBR7r7Zpqhjw==
X-IronPort-AV: E=Sophos;i="6.12,175,1728918000"; 
   d="scan'208";a="229765871"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2024 21:46:41 +0900
Received: from localhost.localdomain (unknown [10.226.92.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 415C2423A753;
	Fri, 22 Nov 2024 21:46:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 07/12] clk: renesas: rzv2h-cpg: Add MSTOP support
Date: Fri, 22 Nov 2024 12:45:43 +0000
Message-ID: <20241122124558.149827-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bus MSTOP support for RZ/{V2H, G3E}. For some module clocks, there
are no MSTOP bits and the sequence ordering for mstop and clock on
is different compared to the RZ/G2L family.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c |   6 +-
 drivers/clk/renesas/r9a09g057-cpg.c | 117 ++++++++++++++++++----------
 drivers/clk/renesas/rzv2h-cpg.c     |  92 +++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h     |  22 ++++--
 4 files changed, 188 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 5d7611cee9bc..ab63a7e7e480 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -69,8 +69,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 };
 
 static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
-	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19),
-	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15),
+	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
+						BUS_MSTOP(3, BIT(5))),
+	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
+						BUS_MSTOP(3, BIT(14))),
 };
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 7c4507fd34e6..6abc5104972c 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -94,45 +94,84 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 };
 
 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
-	DEF_MOD_CRITICAL("icu_0_pclk_i",	CLK_PLLCM33_DIV16, 0, 5, 0, 5),
-	DEF_MOD("gtm_0_pclk",			CLK_PLLCM33_DIV16, 4, 3, 2, 3),
-	DEF_MOD("gtm_1_pclk",			CLK_PLLCM33_DIV16, 4, 4, 2, 4),
-	DEF_MOD("gtm_2_pclk",			CLK_PLLCLN_DIV16, 4, 5, 2, 5),
-	DEF_MOD("gtm_3_pclk",			CLK_PLLCLN_DIV16, 4, 6, 2, 6),
-	DEF_MOD("gtm_4_pclk",			CLK_PLLCLN_DIV16, 4, 7, 2, 7),
-	DEF_MOD("gtm_5_pclk",			CLK_PLLCLN_DIV16, 4, 8, 2, 8),
-	DEF_MOD("gtm_6_pclk",			CLK_PLLCLN_DIV16, 4, 9, 2, 9),
-	DEF_MOD("gtm_7_pclk",			CLK_PLLCLN_DIV16, 4, 10, 2, 10),
-	DEF_MOD("wdt_0_clkp",			CLK_PLLCM33_DIV16, 4, 11, 2, 11),
-	DEF_MOD("wdt_0_clk_loco",		CLK_QEXTAL, 4, 12, 2, 12),
-	DEF_MOD("wdt_1_clkp",			CLK_PLLCLN_DIV16, 4, 13, 2, 13),
-	DEF_MOD("wdt_1_clk_loco",		CLK_QEXTAL, 4, 14, 2, 14),
-	DEF_MOD("wdt_2_clkp",			CLK_PLLCLN_DIV16, 4, 15, 2, 15),
-	DEF_MOD("wdt_2_clk_loco",		CLK_QEXTAL, 5, 0, 2, 16),
-	DEF_MOD("wdt_3_clkp",			CLK_PLLCLN_DIV16, 5, 1, 2, 17),
-	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18),
-	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15),
-	DEF_MOD("riic_8_ckm",			CLK_PLLCM33_DIV16, 9, 3, 4, 19),
-	DEF_MOD("riic_0_ckm",			CLK_PLLCLN_DIV16, 9, 4, 4, 20),
-	DEF_MOD("riic_1_ckm",			CLK_PLLCLN_DIV16, 9, 5, 4, 21),
-	DEF_MOD("riic_2_ckm",			CLK_PLLCLN_DIV16, 9, 6, 4, 22),
-	DEF_MOD("riic_3_ckm",			CLK_PLLCLN_DIV16, 9, 7, 4, 23),
-	DEF_MOD("riic_4_ckm",			CLK_PLLCLN_DIV16, 9, 8, 4, 24),
-	DEF_MOD("riic_5_ckm",			CLK_PLLCLN_DIV16, 9, 9, 4, 25),
-	DEF_MOD("riic_6_ckm",			CLK_PLLCLN_DIV16, 9, 10, 4, 26),
-	DEF_MOD("riic_7_ckm",			CLK_PLLCLN_DIV16, 9, 11, 4, 27),
-	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3),
-	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4),
-	DEF_MOD("sdhi_0_clk_hs",		CLK_PLLCLN_DIV2, 10, 5, 5, 5),
-	DEF_MOD("sdhi_0_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 6, 5, 6),
-	DEF_MOD("sdhi_1_imclk",			CLK_PLLCLN_DIV8, 10, 7, 5, 7),
-	DEF_MOD("sdhi_1_imclk2",		CLK_PLLCLN_DIV8, 10, 8, 5, 8),
-	DEF_MOD("sdhi_1_clk_hs",		CLK_PLLCLN_DIV2, 10, 9, 5, 9),
-	DEF_MOD("sdhi_1_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 10, 5, 10),
-	DEF_MOD("sdhi_2_imclk",			CLK_PLLCLN_DIV8, 10, 11, 5, 11),
-	DEF_MOD("sdhi_2_imclk2",		CLK_PLLCLN_DIV8, 10, 12, 5, 12),
-	DEF_MOD("sdhi_2_clk_hs",		CLK_PLLCLN_DIV2, 10, 13, 5, 13),
-	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14),
+	DEF_MOD_CRITICAL("icu_0_pclk_i",	CLK_PLLCM33_DIV16, 0, 5, 0, 5,
+						BUS_MSTOP_NO_DATA),
+	DEF_MOD("gtm_0_pclk",			CLK_PLLCM33_DIV16, 4, 3, 2, 3,
+						BUS_MSTOP(5, BIT(10))),
+	DEF_MOD("gtm_1_pclk",			CLK_PLLCM33_DIV16, 4, 4, 2, 4,
+						BUS_MSTOP(5, BIT(11))),
+	DEF_MOD("gtm_2_pclk",			CLK_PLLCLN_DIV16, 4, 5, 2, 5,
+						BUS_MSTOP(2, BIT(13))),
+	DEF_MOD("gtm_3_pclk",			CLK_PLLCLN_DIV16, 4, 6, 2, 6,
+						BUS_MSTOP(2, BIT(14))),
+	DEF_MOD("gtm_4_pclk",			CLK_PLLCLN_DIV16, 4, 7, 2, 7,
+						BUS_MSTOP(11, BIT(13))),
+	DEF_MOD("gtm_5_pclk",			CLK_PLLCLN_DIV16, 4, 8, 2, 8,
+						BUS_MSTOP(11, BIT(14))),
+	DEF_MOD("gtm_6_pclk",			CLK_PLLCLN_DIV16, 4, 9, 2, 9,
+						BUS_MSTOP(11, BIT(15))),
+	DEF_MOD("gtm_7_pclk",			CLK_PLLCLN_DIV16, 4, 10, 2, 10,
+						BUS_MSTOP(12, BIT(0))),
+	DEF_MOD("wdt_0_clkp",			CLK_PLLCM33_DIV16, 4, 11, 2, 11,
+						BUS_MSTOP(3, BIT(10))),
+	DEF_MOD("wdt_0_clk_loco",		CLK_QEXTAL, 4, 12, 2, 12,
+						BUS_MSTOP(3, BIT(10))),
+	DEF_MOD("wdt_1_clkp",			CLK_PLLCLN_DIV16, 4, 13, 2, 13,
+						BUS_MSTOP(1, BIT(0))),
+	DEF_MOD("wdt_1_clk_loco",		CLK_QEXTAL, 4, 14, 2, 14,
+						BUS_MSTOP(1, BIT(0))),
+	DEF_MOD("wdt_2_clkp",			CLK_PLLCLN_DIV16, 4, 15, 2, 15,
+						BUS_MSTOP(5, BIT(12))),
+	DEF_MOD("wdt_2_clk_loco",		CLK_QEXTAL, 5, 0, 2, 16,
+						BUS_MSTOP(5, BIT(12))),
+	DEF_MOD("wdt_3_clkp",			CLK_PLLCLN_DIV16, 5, 1, 2, 17,
+						BUS_MSTOP(5, BIT(13))),
+	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18,
+						BUS_MSTOP(5, BIT(13))),
+	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
+						BUS_MSTOP(3, BIT(14))),
+	DEF_MOD("riic_8_ckm",			CLK_PLLCM33_DIV16, 9, 3, 4, 19,
+						BUS_MSTOP(3, BIT(13))),
+	DEF_MOD("riic_0_ckm",			CLK_PLLCLN_DIV16, 9, 4, 4, 20,
+						BUS_MSTOP(1, BIT(1))),
+	DEF_MOD("riic_1_ckm",			CLK_PLLCLN_DIV16, 9, 5, 4, 21,
+						BUS_MSTOP(1, BIT(2))),
+	DEF_MOD("riic_2_ckm",			CLK_PLLCLN_DIV16, 9, 6, 4, 22,
+						BUS_MSTOP(1, BIT(3))),
+	DEF_MOD("riic_3_ckm",			CLK_PLLCLN_DIV16, 9, 7, 4, 23,
+						BUS_MSTOP(1, BIT(4))),
+	DEF_MOD("riic_4_ckm",			CLK_PLLCLN_DIV16, 9, 8, 4, 24,
+						BUS_MSTOP(1, BIT(5))),
+	DEF_MOD("riic_5_ckm",			CLK_PLLCLN_DIV16, 9, 9, 4, 25,
+						BUS_MSTOP(1, BIT(6))),
+	DEF_MOD("riic_6_ckm",			CLK_PLLCLN_DIV16, 9, 10, 4, 26,
+						BUS_MSTOP(1, BIT(7))),
+	DEF_MOD("riic_7_ckm",			CLK_PLLCLN_DIV16, 9, 11, 4, 27,
+						BUS_MSTOP(1, BIT(8))),
+	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3,
+						BUS_MSTOP_NO_DATA),
+	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4,
+						BUS_MSTOP_NO_DATA),
+	DEF_MOD("sdhi_0_clk_hs",		CLK_PLLCLN_DIV2, 10, 5, 5, 5,
+						BUS_MSTOP_NO_DATA),
+	DEF_MOD("sdhi_0_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 6, 5, 6,
+						BUS_MSTOP_NO_DATA),
+	DEF_MOD("sdhi_1_imclk",			CLK_PLLCLN_DIV8, 10, 7, 5, 7,
+						BUS_MSTOP_NO_DATA),
+	DEF_MOD("sdhi_1_imclk2",		CLK_PLLCLN_DIV8, 10, 8, 5, 8,
+						BUS_MSTOP_NO_DATA),
+	DEF_MOD("sdhi_1_clk_hs",		CLK_PLLCLN_DIV2, 10, 9, 5, 9,
+						BUS_MSTOP_NO_DATA),
+	DEF_MOD("sdhi_1_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 10, 5, 10,
+						BUS_MSTOP_NO_DATA),
+	DEF_MOD("sdhi_2_imclk",			CLK_PLLCLN_DIV8, 10, 11, 5, 11,
+						BUS_MSTOP_NO_DATA),
+	DEF_MOD("sdhi_2_imclk2",		CLK_PLLCLN_DIV8, 10, 12, 5, 12,
+						BUS_MSTOP_NO_DATA),
+	DEF_MOD("sdhi_2_clk_hs",		CLK_PLLCLN_DIV2, 10, 13, 5, 13,
+						BUS_MSTOP_NO_DATA),
+	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
+						BUS_MSTOP_NO_DATA),
 };
 
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index af961808f735..8f4fa155bc54 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
+#include <linux/refcount.h>
 #include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
@@ -83,6 +84,11 @@ struct rzv2h_cpg_priv {
 
 #define rcdev_to_priv(x)	container_of(x, struct rzv2h_cpg_priv, rcdev)
 
+struct rzv2h_mstop {
+	u32 data;
+	refcount_t ref_cnt;
+};
+
 struct pll_clk {
 	struct rzv2h_cpg_priv *priv;
 	void __iomem *base;
@@ -97,6 +103,7 @@ struct pll_clk {
  * struct mod_clock - Module clock
  *
  * @priv: CPG private data
+ * @mstop: handle to cpg bus mstop data
  * @hw: handle between common and hardware-specific interfaces
  * @on_index: register offset
  * @on_bit: ON/MON bit
@@ -105,6 +112,7 @@ struct pll_clk {
  */
 struct mod_clock {
 	struct rzv2h_cpg_priv *priv;
+	struct rzv2h_mstop *mstop;
 	struct clk_hw hw;
 	u8 on_index;
 	u8 on_bit;
@@ -431,6 +439,38 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 		core->name, PTR_ERR(clk));
 }
 
+static void rzv2h_mod_clock_mstop_enable(struct rzv2h_cpg_priv *priv,
+					 struct mod_clock *clock)
+{
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->rmw_lock, flags);
+	if (!refcount_read(&clock->mstop->ref_cnt)) {
+		val = BUS_MSTOP_VAL(clock->mstop->data) << 16;
+		writel(val, priv->base + BUS_MSTOP_OFF(clock->mstop->data));
+		refcount_set(&clock->mstop->ref_cnt, 1);
+	} else {
+		refcount_inc(&clock->mstop->ref_cnt);
+	}
+	spin_unlock_irqrestore(&priv->rmw_lock, flags);
+}
+
+static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
+					  struct mod_clock *clock)
+{
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->rmw_lock, flags);
+	if (refcount_dec_and_test(&clock->mstop->ref_cnt)) {
+		val = BUS_MSTOP_VAL(clock->mstop->data) << 16 |
+			BUS_MSTOP_VAL(clock->mstop->data);
+		writel(val, priv->base + BUS_MSTOP_OFF(clock->mstop->data));
+	}
+	spin_unlock_irqrestore(&priv->rmw_lock, flags);
+}
+
 static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mod_clock *clock = to_mod_clock(hw);
@@ -445,10 +485,16 @@ static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
 		enable ? "ON" : "OFF");
 
 	value = bitmask << 16;
-	if (enable)
+	if (enable) {
 		value |= bitmask;
-
-	writel(value, priv->base + reg);
+		writel(value, priv->base + reg);
+		if (clock->mstop)
+			rzv2h_mod_clock_mstop_enable(priv, clock);
+	} else {
+		if (clock->mstop)
+			rzv2h_mod_clock_mstop_disable(priv, clock);
+		writel(value, priv->base + reg);
+	}
 
 	if (!enable || clock->mon_index < 0)
 		return 0;
@@ -498,6 +544,38 @@ static const struct clk_ops rzv2h_mod_clock_ops = {
 	.is_enabled = rzv2h_mod_clock_is_enabled,
 };
 
+static struct rzv2h_mstop
+*rzv2h_cpg_get_mstop(struct rzv2h_cpg_priv *priv, u32 mstop_data)
+{
+	struct rzv2h_mstop *mstop;
+	unsigned int i;
+
+	for (i = 0; i < priv->num_mod_clks; i++) {
+		struct mod_clock *clk;
+		struct clk_hw *hw;
+
+		if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
+			continue;
+
+		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
+		clk = to_mod_clock(hw);
+		if (!clk->mstop)
+			continue;
+
+		if (clk->mstop->data == mstop_data)
+			return clk->mstop;
+	}
+
+	mstop = devm_kzalloc(priv->dev, sizeof(*mstop), GFP_KERNEL);
+	if (!mstop)
+		return NULL;
+
+	mstop->data = mstop_data;
+	refcount_set(&mstop->ref_cnt, 0);
+
+	return mstop;
+}
+
 static void __init
 rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 			   struct rzv2h_cpg_priv *priv)
@@ -552,6 +630,14 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 
 	priv->clks[id] = clock->hw.clk;
 
+	if (mod->mstop_data != BUS_MSTOP_NO_DATA) {
+		clock->mstop = rzv2h_cpg_get_mstop(priv, mod->mstop_data);
+		if (!clock->mstop) {
+			clock = ERR_PTR(-ENOMEM);
+			goto fail;
+		}
+	}
+
 	return;
 
 fail:
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 8a676813f7bb..c75f98861165 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -33,6 +33,7 @@ struct ddiv {
 
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
+#define CPG_BUS_1_MSTOP		(0xd00)
 
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
 #define CDDIV1_DIVCTL0	DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
@@ -40,6 +41,14 @@ struct ddiv {
 #define CDDIV1_DIVCTL2	DDIV_PACK(CPG_CDDIV1, 8, 2, 6)
 #define CDDIV1_DIVCTL3	DDIV_PACK(CPG_CDDIV1, 12, 2, 7)
 
+#define CPG_BUS_MSTOP_START	(CPG_BUS_1_MSTOP - 4)
+#define CPG_BUS_MSTOP(x)	(CPG_BUS_MSTOP_START + (x) * 4)
+
+#define BUS_MSTOP(index, mask)	((CPG_BUS_MSTOP(index) & 0xffff) << 16 | (mask))
+#define BUS_MSTOP_OFF(val)	(((val) >> 16) & 0xffff)
+#define BUS_MSTOP_VAL(val)	((val) & 0xffff)
+#define BUS_MSTOP_NO_DATA	GENMASK(31, 0)
+
 /**
  * Definitions of CPG Core Clocks
  *
@@ -98,6 +107,7 @@ enum clk_types {
  * struct rzv2h_mod_clk - Module Clocks definitions
  *
  * @name: handle between common and hardware-specific interfaces
+ * @mstop_data: packed data mstop register offset and mask
  * @parent: id of parent clock
  * @critical: flag to indicate the clock is critical
  * @on_index: control register index
@@ -107,6 +117,7 @@ enum clk_types {
  */
 struct rzv2h_mod_clk {
 	const char *name;
+	u32 mstop_data;
 	u16 parent;
 	bool critical;
 	u8 on_index;
@@ -115,9 +126,10 @@ struct rzv2h_mod_clk {
 	u8 mon_bit;
 };
 
-#define DEF_MOD_BASE(_name, _parent, _critical, _onindex, _onbit, _monindex, _monbit) \
+#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _onindex, _onbit, _monindex, _monbit) \
 	{ \
 		.name = (_name), \
+		.mstop_data = (_mstop), \
 		.parent = (_parent), \
 		.critical = (_critical), \
 		.on_index = (_onindex), \
@@ -126,11 +138,11 @@ struct rzv2h_mod_clk {
 		.mon_bit = (_monbit), \
 	}
 
-#define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit)		\
-	DEF_MOD_BASE(_name, _parent, false, _onindex, _onbit, _monindex, _monbit)
+#define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
+	DEF_MOD_BASE(_name, _mstop, _parent, false, _onindex, _onbit, _monindex, _monbit)
 
-#define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex, _monbit)	\
-	DEF_MOD_BASE(_name, _parent, true, _onindex, _onbit, _monindex, _monbit)
+#define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
+	DEF_MOD_BASE(_name, _mstop, _parent, true, _onindex, _onbit, _monindex, _monbit)
 
 /**
  * struct rzv2h_reset - Reset definitions
-- 
2.43.0


