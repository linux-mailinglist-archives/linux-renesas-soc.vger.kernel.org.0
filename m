Return-Path: <linux-renesas-soc+bounces-1690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F91838DB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 12:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C4F728A776
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 11:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B145D74F;
	Tue, 23 Jan 2024 11:44:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6732E4BAA8;
	Tue, 23 Jan 2024 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706010264; cv=none; b=luPE7aEv7jYHrIx9BY+kXZeOjYv7kcfTI5z2g6VUmBHXA9lEhFEG/vheLoH87d79IcFM/oIrY1Y1zkvO/V9mBW2P2PCLQdel4JpFcrGEoLbjodYx+6b/1d+3b8S00XznAX/lnw4BLfFfH5XbYMjiTW149nFr1hZ69/72wiVBjj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706010264; c=relaxed/simple;
	bh=X4mMyFI3RghAkMBtfdzaNp0sZuAlPrkixjUHHEbetFc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mAuRzQnrFHE01yIaJ3Aczhsl6MFtCpTOJRkBS2kKQnWYfOqHXC/1OmwHowGvS/PMgcBSJrVQsdm2JDaX79bI7X+v089PZn9Obxk1Vrhea7BwI8hH0SoCCpHs4I8PeYajawSth6Gycw6rm9Vjdl4ddfbyas7pqBSSfbhKvP10aIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,214,1701097200"; 
   d="scan'208";a="195341123"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jan 2024 20:44:20 +0900
Received: from localhost.localdomain (unknown [10.226.93.36])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4F23A400197E;
	Tue, 23 Jan 2024 20:44:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] clk: renesas: r9a07g043: Add clock and reset entries for CRU
Date: Tue, 23 Jan 2024 11:44:15 +0000
Message-Id: <20240123114415.290918-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CRU clock and reset entries to CPG driver.

CRU_SYSCLK and CRU_VCLK clocks need to be turned ON/OFF in particular
sequence for the CRU block hence add these clocks to
r9a07g043_no_pm_mod_clks[] array and pass it as part of CPG data for
RZ/G2UL SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index b70bb378ab46..acfb06cad441 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -48,6 +48,7 @@ enum clk_ids {
 	CLK_SEL_PLL3_3,
 	CLK_DIV_PLL3_C,
 #ifdef CONFIG_ARM64
+	CLK_M2_DIV2,
 	CLK_PLL5,
 	CLK_PLL5_500,
 	CLK_PLL5_250,
@@ -142,6 +143,10 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 		   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
 	DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G043_CLK_SD0, 1, 4),
 	DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G043_CLK_SD1, 1, 4),
+#ifdef CONFIG_ARM64
+	DEF_FIXED("M2", R9A07G043_CLK_M2, CLK_PLL3_533, 1, 2),
+	DEF_FIXED("M2_DIV2", CLK_M2_DIV2, R9A07G043_CLK_M2, 1, 2),
+#endif
 };
 
 static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
@@ -195,6 +200,16 @@ static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 				0x554, 6),
 	DEF_MOD("sdhi1_aclk",	R9A07G043_SDHI1_ACLK, R9A07G043_CLK_P1,
 				0x554, 7),
+#ifdef CONFIG_ARM64
+	DEF_MOD("cru_sysclk",   R9A07G043_CRU_SYSCLK, CLK_M2_DIV2,
+				0x564, 0),
+	DEF_MOD("cru_vclk",     R9A07G043_CRU_VCLK, R9A07G043_CLK_M2,
+				0x564, 1),
+	DEF_MOD("cru_pclk",     R9A07G043_CRU_PCLK, R9A07G043_CLK_ZT,
+				0x564, 2),
+	DEF_MOD("cru_aclk",     R9A07G043_CRU_ACLK, R9A07G043_CLK_M0,
+				0x564, 3),
+#endif
 	DEF_MOD("ssi0_pclk",	R9A07G043_SSI0_PCLK2, R9A07G043_CLK_P0,
 				0x570, 0),
 	DEF_MOD("ssi0_sfr",	R9A07G043_SSI0_PCLK_SFR, R9A07G043_CLK_P0,
@@ -286,6 +301,11 @@ static struct rzg2l_reset r9a07g043_resets[] = {
 	DEF_RST(R9A07G043_SPI_RST, 0x850, 0),
 	DEF_RST(R9A07G043_SDHI0_IXRST, 0x854, 0),
 	DEF_RST(R9A07G043_SDHI1_IXRST, 0x854, 1),
+#ifdef CONFIG_ARM64
+	DEF_RST(R9A07G043_CRU_CMN_RSTB, 0x864, 0),
+	DEF_RST(R9A07G043_CRU_PRESETN, 0x864, 1),
+	DEF_RST(R9A07G043_CRU_ARESETN, 0x864, 2),
+#endif
 	DEF_RST(R9A07G043_SSI0_RST_M2_REG, 0x870, 0),
 	DEF_RST(R9A07G043_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A07G043_SSI2_RST_M2_REG, 0x870, 2),
@@ -331,6 +351,13 @@ static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G043_DMAC_ACLK,
 };
 
+#ifdef CONFIG_ARM64
+static const unsigned int r9a07g043_no_pm_mod_clks[] = {
+	MOD_CLK_BASE + R9A07G043_CRU_SYSCLK,
+	MOD_CLK_BASE + R9A07G043_CRU_VCLK,
+};
+#endif
+
 const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a07g043_core_clks,
@@ -347,6 +374,10 @@ const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	.num_mod_clks = ARRAY_SIZE(r9a07g043_mod_clks),
 #ifdef CONFIG_ARM64
 	.num_hw_mod_clks = R9A07G043_TSU_PCLK + 1,
+
+	/* No PM Module Clocks */
+	.no_pm_mod_clks = r9a07g043_no_pm_mod_clks,
+	.num_no_pm_mod_clks = ARRAY_SIZE(r9a07g043_no_pm_mod_clks),
 #endif
 #ifdef CONFIG_RISCV
 	.num_hw_mod_clks = R9A07G043_IAX45_PCLK + 1,
-- 
2.25.1


