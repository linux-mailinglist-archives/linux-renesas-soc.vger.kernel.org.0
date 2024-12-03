Return-Path: <linux-renesas-soc+bounces-10830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6E29E1B63
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 12:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B734B295D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF64E1E284B;
	Tue,  3 Dec 2024 10:55:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E91C1E2853
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223343; cv=none; b=GeDJOzv28jhtrHqSqjxsrsljiFnFK3PmcQ6DIv/fz6VBybt9N0JOj607tUEZEUnJeNexaYuZGViaxX5bHbdA2xjgC07N+FA5yUj8xz5pjRrY/jNzhxZ9KrkziCRElEn1jxdP+i64yRGAehIe+cTbZQeKamiqOIJSKgRcEeMCO5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223343; c=relaxed/simple;
	bh=NOKM2UpdCNSi2gyPVHv1gixskHLBUwR5J8wLX1RY8TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdu3uTq0VR1IDLGcy55DgsEVfIu8xAP1WwDMzxWX3oIMGgxSZTlVBzyVKhN6QVmTAK+TSie+RXd2B442eLh6Tr2yqbBR8kuhFJulit7GsGypBoZ8B5sY6JgcRjAYXd8ZD4Uxg3M5SrGMMiiX8zC04OJhZdN/efDHhApP4sMFdYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: vrqcGaudRGufhS7gClPoxg==
X-CSE-MsgGUID: umWYNNlSSeiB7hoO6QC4/g==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="230754398"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:37 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 653C040015FF;
	Tue,  3 Dec 2024 19:50:34 +0900 (JST)
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
Subject: [PATCH v2 07/13] clk: renesas: rzv2h-cpg: Add MSTOP support
Date: Tue,  3 Dec 2024 10:49:34 +0000
Message-ID: <20241203105005.103927-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * This patch has dependency on [1]
 * Added MSTOP data for RZ/V2H CRU IP.
 * Fixed typo clock->clk in error path of rzv2h_cpg_register_mod_clk()


[1] https://lore.kernel.org/all/20241202203916.48668-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/clk/renesas/r9a09g047-cpg.c |   6 +-
 drivers/clk/renesas/r9a09g057-cpg.c | 153 ++++++++++++++++++----------
 drivers/clk/renesas/rzv2h-cpg.c     |  92 ++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h     |  26 +++--
 4 files changed, 214 insertions(+), 63 deletions(-)

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
index 5aa9710aa402..5539fdb13d57 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -115,57 +115,108 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
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
-	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18),
-	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19),
-	DEF_MOD("cru_0_pclk",			CLK_PLLDTY_DIV16, 13, 4, 6, 20),
-	DEF_MOD("cru_1_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 5, 6, 21),
-	DEF_MOD_NO_PM("cru_1_vclk",		CLK_PLLVDO_CRU1, 13, 6, 6, 22),
-	DEF_MOD("cru_1_pclk",			CLK_PLLDTY_DIV16, 13, 7, 6, 23),
-	DEF_MOD("cru_2_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 8, 6, 24),
-	DEF_MOD_NO_PM("cru_2_vclk",		CLK_PLLVDO_CRU2, 13, 9, 6, 25),
-	DEF_MOD("cru_2_pclk",			CLK_PLLDTY_DIV16, 13, 10, 6, 26),
-	DEF_MOD("cru_3_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 11, 6, 27),
-	DEF_MOD_NO_PM("cru_3_vclk",		CLK_PLLVDO_CRU3, 13, 12, 6, 28),
-	DEF_MOD("cru_3_pclk",			CLK_PLLDTY_DIV16, 13, 13, 6, 29),
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
+	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
+						BUS_MSTOP(9, BIT(4))),
+	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
+						BUS_MSTOP(9, BIT(4))),
+	DEF_MOD("cru_0_pclk",			CLK_PLLDTY_DIV16, 13, 4, 6, 20,
+						BUS_MSTOP(9, BIT(4))),
+	DEF_MOD("cru_1_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 5, 6, 21,
+						BUS_MSTOP(9, BIT(5))),
+	DEF_MOD_NO_PM("cru_1_vclk",		CLK_PLLVDO_CRU1, 13, 6, 6, 22,
+						BUS_MSTOP(9, BIT(5))),
+	DEF_MOD("cru_1_pclk",			CLK_PLLDTY_DIV16, 13, 7, 6, 23,
+						BUS_MSTOP(9, BIT(5))),
+	DEF_MOD("cru_2_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 8, 6, 24,
+						BUS_MSTOP(9, BIT(6))),
+	DEF_MOD_NO_PM("cru_2_vclk",		CLK_PLLVDO_CRU2, 13, 9, 6, 25,
+						BUS_MSTOP(9, BIT(6))),
+	DEF_MOD("cru_2_pclk",			CLK_PLLDTY_DIV16, 13, 10, 6, 26,
+						BUS_MSTOP(9, BIT(6))),
+	DEF_MOD("cru_3_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 11, 6, 27,
+						BUS_MSTOP(9, BIT(7))),
+	DEF_MOD_NO_PM("cru_3_vclk",		CLK_PLLVDO_CRU3, 13, 12, 6, 28,
+						BUS_MSTOP(9, BIT(7))),
+	DEF_MOD("cru_3_pclk",			CLK_PLLDTY_DIV16, 13, 13, 6, 29,
+						BUS_MSTOP(9, BIT(7))),
 };
 
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index ef26e7760a88..fb5221faabea 100644
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
  * @no_pm: flag to indicate PM is not supported
  * @on_index: register offset
@@ -106,6 +113,7 @@ struct pll_clk {
  */
 struct mod_clock {
 	struct rzv2h_cpg_priv *priv;
+	struct rzv2h_mstop *mstop;
 	struct clk_hw hw;
 	bool no_pm;
 	u8 on_index;
@@ -433,6 +441,38 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
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
@@ -447,10 +487,16 @@ static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
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
@@ -500,6 +546,38 @@ static const struct clk_ops rzv2h_mod_clock_ops = {
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
@@ -555,6 +633,14 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 
 	priv->clks[id] = clock->hw.clk;
 
+	if (mod->mstop_data != BUS_MSTOP_NO_DATA) {
+		clock->mstop = rzv2h_cpg_get_mstop(priv, mod->mstop_data);
+		if (!clock->mstop) {
+			clk = ERR_PTR(-ENOMEM);
+			goto fail;
+		}
+	}
+
 	return;
 
 fail:
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 1e5bf1eb65a4..8c94a02d5147 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -35,6 +35,7 @@ struct ddiv {
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
+#define CPG_BUS_1_MSTOP		(0xd00)
 
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
 #define CDDIV1_DIVCTL0	DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
@@ -46,6 +47,14 @@ struct ddiv {
 #define CDDIV4_DIVCTL1	DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
 #define CDDIV4_DIVCTL2	DDIV_PACK(CPG_CDDIV4, 8, 1, 18)
 
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
@@ -104,6 +113,7 @@ enum clk_types {
  * struct rzv2h_mod_clk - Module Clocks definitions
  *
  * @name: handle between common and hardware-specific interfaces
+ * @mstop_data: packed data mstop register offset and mask
  * @parent: id of parent clock
  * @critical: flag to indicate the clock is critical
  * @no_pm: flag to indicate PM is not supported
@@ -114,6 +124,7 @@ enum clk_types {
  */
 struct rzv2h_mod_clk {
 	const char *name;
+	u32 mstop_data;
 	u16 parent;
 	bool critical;
 	bool no_pm;
@@ -123,9 +134,10 @@ struct rzv2h_mod_clk {
 	u8 mon_bit;
 };
 
-#define DEF_MOD_BASE(_name, _parent, _critical, _no_pm, _onindex, _onbit, _monindex, _monbit) \
+#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, _onbit, _monindex, _monbit) \
 	{ \
 		.name = (_name), \
+		.mstop_data = (_mstop), \
 		.parent = (_parent), \
 		.critical = (_critical), \
 		.no_pm = (_no_pm), \
@@ -135,14 +147,14 @@ struct rzv2h_mod_clk {
 		.mon_bit = (_monbit), \
 	}
 
-#define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit)		\
-	DEF_MOD_BASE(_name, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
+#define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
 
-#define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex, _monbit)	\
-	DEF_MOD_BASE(_name, _parent, true, false, _onindex, _onbit, _monindex, _monbit)
+#define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
+	DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex, _onbit, _monindex, _monbit)
 
-#define DEF_MOD_NO_PM(_name, _parent, _onindex, _onbit, _monindex, _monbit)		\
-	DEF_MOD_BASE(_name, _parent, false, true, _onindex, _onbit, _monindex, _monbit)
+#define DEF_MOD_NO_PM(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
+	DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex, _onbit, _monindex, _monbit)
 
 /**
  * struct rzv2h_reset - Reset definitions
-- 
2.43.0


