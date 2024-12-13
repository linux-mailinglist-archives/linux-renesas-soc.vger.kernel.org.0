Return-Path: <linux-renesas-soc+bounces-11284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C159F0C75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 13:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B64D316A95D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 12:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488661DFD80;
	Fri, 13 Dec 2024 12:36:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0162138DC0;
	Fri, 13 Dec 2024 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734093375; cv=none; b=ipVpK2ZMX096ockqafOpBDHOCiO393y6Yvy4PR8qegqyevdGYpPi402gSw8HRRJwBeyUKGdshc6fwGHvpzwKOah7TAeBnQRMqVveAxIs73MzkF/aGGkC+wkx2gNRfA4wN3xXOKY3tOUTm8zimo7I8mfgORv6rH+kXm/6oL7l7EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734093375; c=relaxed/simple;
	bh=Kh4p1/ZQJN10jKj9f7ttR7+uJwurBRKxm1VYWw2nQPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDzeeUVqxGTIBjE2tRoY6eHgnDphkCAru2M0Ap+mQMAARsUTe8QvQvrHEAFunDLxdbNBavKc1xsVp+6Z0eTRNjkXw5FQrlgVdrdUCEDrJKraXHinGHVStNgv2VlF5xlE31MVlYREYb4T9QbmdCMSEAR+kFc7W8aYmxY1Uis5meU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: e6A0wa6NS2qx4hEAxMYGjQ==
X-CSE-MsgGUID: Egl+n7JFSMq/O7c8cIMLvA==
X-IronPort-AV: E=Sophos;i="6.12,231,1728918000"; 
   d="scan'208";a="227784171"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Dec 2024 21:36:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E4735423927B;
	Fri, 13 Dec 2024 21:35:55 +0900 (JST)
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
Subject: [PATCH v3 1/3] clk: renesas: rzv2h-cpg: Add MSTOP support
Date: Fri, 13 Dec 2024 12:35:40 +0000
Message-ID: <20241213123550.289193-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213123550.289193-1-biju.das.jz@bp.renesas.com>
References: <20241213123550.289193-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MSTOP support to control buses for the individual units
on RZ/V2H.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated commit description as adding MSTOP support
   for RZ/V2H first will ease backporting.
 * Added missing MSTOP data for SD{0,1,2}
 * Replaced BUS_MSTOP_NO_DATA->BUS_MSTOP_NONE
 * Added idx, mask variable to struct rzv2h_mstop to simplify
   the code.
 * Started setting initial value of refcount with the correct value
   based on the clock's current state.
v1->v2:
 * This patch has dependency on [1]
 * Added MSTOP data for RZ/V2H CRU IP.
 * Fixed typo clock->clk in error path of rzv2h_cpg_register_mod_clk()
---
 drivers/clk/renesas/r9a09g057-cpg.c | 153 ++++++++++++++++++----------
 drivers/clk/renesas/rzv2h-cpg.c     |  99 +++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h     |  23 +++--
 3 files changed, 214 insertions(+), 61 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 5aa9710aa402..59dadedb2217 100644
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
+						BUS_MSTOP_NONE),
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
+						BUS_MSTOP(8, BIT(2))),
+	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4,
+						BUS_MSTOP(8, BIT(2))),
+	DEF_MOD("sdhi_0_clk_hs",		CLK_PLLCLN_DIV2, 10, 5, 5, 5,
+						BUS_MSTOP(8, BIT(2))),
+	DEF_MOD("sdhi_0_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 6, 5, 6,
+						BUS_MSTOP(8, BIT(2))),
+	DEF_MOD("sdhi_1_imclk",			CLK_PLLCLN_DIV8, 10, 7, 5, 7,
+						BUS_MSTOP(8, BIT(3))),
+	DEF_MOD("sdhi_1_imclk2",		CLK_PLLCLN_DIV8, 10, 8, 5, 8,
+						BUS_MSTOP(8, BIT(3))),
+	DEF_MOD("sdhi_1_clk_hs",		CLK_PLLCLN_DIV2, 10, 9, 5, 9,
+						BUS_MSTOP(8, BIT(3))),
+	DEF_MOD("sdhi_1_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 10, 5, 10,
+						BUS_MSTOP(8, BIT(3))),
+	DEF_MOD("sdhi_2_imclk",			CLK_PLLCLN_DIV8, 10, 11, 5, 11,
+						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("sdhi_2_imclk2",		CLK_PLLCLN_DIV8, 10, 12, 5, 12,
+						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("sdhi_2_clk_hs",		CLK_PLLCLN_DIV2, 10, 13, 5, 13,
+						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
+						BUS_MSTOP(8, BIT(4))),
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
index 1154493583a7..511df561d299 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
+#include <linux/refcount.h>
 #include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
@@ -83,6 +84,12 @@ struct rzv2h_cpg_priv {
 
 #define rcdev_to_priv(x)	container_of(x, struct rzv2h_cpg_priv, rcdev)
 
+struct rzv2h_mstop {
+	u16 idx;
+	u16 mask;
+	refcount_t ref_cnt;
+};
+
 struct pll_clk {
 	struct rzv2h_cpg_priv *priv;
 	void __iomem *base;
@@ -97,6 +104,7 @@ struct pll_clk {
  * struct mod_clock - Module clock
  *
  * @priv: CPG private data
+ * @mstop: handle to cpg bus mstop data
  * @hw: handle between common and hardware-specific interfaces
  * @no_pm: flag to indicate PM is not supported
  * @on_index: register offset
@@ -106,6 +114,7 @@ struct pll_clk {
  */
 struct mod_clock {
 	struct rzv2h_cpg_priv *priv;
+	struct rzv2h_mstop *mstop;
 	struct clk_hw hw;
 	bool no_pm;
 	u8 on_index;
@@ -433,6 +442,37 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
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
+		val = clock->mstop->mask << 16;
+		writel(val, priv->base + CPG_BUS_MSTOP(clock->mstop->idx));
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
+		val = clock->mstop->mask << 16 | clock->mstop->mask;
+		writel(val, priv->base + CPG_BUS_MSTOP(clock->mstop->idx));
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
@@ -500,6 +546,45 @@ static const struct clk_ops rzv2h_mod_clock_ops = {
 	.is_enabled = rzv2h_mod_clock_is_enabled,
 };
 
+static struct rzv2h_mstop
+*rzv2h_cpg_get_mstop(struct rzv2h_cpg_priv *priv, struct mod_clock *clock, u32 mstop_data)
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
+		if (BUS_MSTOP(clk->mstop->idx, clk->mstop->mask) == mstop_data) {
+			if (rzv2h_mod_clock_is_enabled(&clock->hw))
+				refcount_inc(&clk->mstop->ref_cnt);
+			return clk->mstop;
+		}
+	}
+
+	mstop = devm_kzalloc(priv->dev, sizeof(*mstop), GFP_KERNEL);
+	if (!mstop)
+		return NULL;
+
+	mstop->idx = (mstop_data >> 16) & 0xffff;
+	mstop->mask = mstop_data & 0xffff;
+	if (rzv2h_mod_clock_is_enabled(&clock->hw))
+		refcount_set(&mstop->ref_cnt, 1);
+	else
+		refcount_set(&mstop->ref_cnt, 0);
+
+	return mstop;
+}
+
 static void __init
 rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 			   struct rzv2h_cpg_priv *priv)
@@ -555,6 +640,14 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 
 	priv->clks[id] = clock->hw.clk;
 
+	if (mod->mstop_data != BUS_MSTOP_NONE) {
+		clock->mstop = rzv2h_cpg_get_mstop(priv, clock, mod->mstop_data);
+		if (!clock->mstop) {
+			clk = ERR_PTR(-ENOMEM);
+			goto fail;
+		}
+	}
+
 	return;
 
 fail:
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index ed8d2cad3260..503e76ee9a56 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -35,6 +35,7 @@ struct ddiv {
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
+#define CPG_BUS_1_MSTOP		(0xd00)
 
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
 #define CDDIV1_DIVCTL0	DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
@@ -46,6 +47,11 @@ struct ddiv {
 #define CDDIV4_DIVCTL1	DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
 #define CDDIV4_DIVCTL2	DDIV_PACK(CPG_CDDIV4, 8, 1, 18)
 
+#define CPG_BUS_MSTOP(m)	(CPG_BUS_1_MSTOP + ((m) - 1) * 4)
+
+#define BUS_MSTOP(idx, mask)	(((idx) & 0xffff) << 16 | (mask))
+#define BUS_MSTOP_NONE		GENMASK(31, 0)
+
 /**
  * Definitions of CPG Core Clocks
  *
@@ -104,6 +110,7 @@ enum clk_types {
  * struct rzv2h_mod_clk - Module Clocks definitions
  *
  * @name: handle between common and hardware-specific interfaces
+ * @mstop_data: packed data mstop register offset and mask
  * @parent: id of parent clock
  * @critical: flag to indicate the clock is critical
  * @no_pm: flag to indicate PM is not supported
@@ -114,6 +121,7 @@ enum clk_types {
  */
 struct rzv2h_mod_clk {
 	const char *name;
+	u32 mstop_data;
 	u16 parent;
 	bool critical;
 	bool no_pm;
@@ -123,9 +131,10 @@ struct rzv2h_mod_clk {
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
@@ -135,14 +144,14 @@ struct rzv2h_mod_clk {
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


