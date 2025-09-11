Return-Path: <linux-renesas-soc+bounces-21787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F31B53897
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 18:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4986F7BE1BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 15:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65083568FE;
	Thu, 11 Sep 2025 15:58:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA61C3568EE;
	Thu, 11 Sep 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606283; cv=none; b=MxpPvHeQ9nghL8BMXdaSCtSP5Dz3AUgCmG8kMLrLxGLUcH7EhOthsH9bCbn6ybxjQGBfuIypVksP1queSDR+Qrh2Vwu8CPnIMgtccLJ5aCdekB2MvS1ivvTNTi6yNITNXybaV3OPgYn45gm3ZE36zvjja7QBX7ZxW+MhTYD7z0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606283; c=relaxed/simple;
	bh=evudM0Uyjx2S8LqxgXEnatYJA++HlRHsVUO1LLrdNnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZbvvddZTr60qvgcI787P0JajAgODN+9d6Ziw0ezKdj2gQFDZA0bSLRdr1Ns8mB49brS3T3WQrfEb//tYIpNLaE/DtY8fF+yVawSn1n/iQkrZB90mYuEFDLN6XYzOyYoVMm3p//VTbBHqk+/4Uyh8xQGlbIx/tnh9pi91zPLpS5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB423C4CEF0;
	Thu, 11 Sep 2025 15:58:01 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r9a09g05[67]: Reduce differences
Date: Thu, 11 Sep 2025 17:57:58 +0200
Message-ID: <2246d2263e8a24d1aaf653db2004cbf2263c9048.1757606097.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock drivers for RZ/V2H and RZ/V2N are very similar.
Reduce the differences between them by:
  - Moving and reformatting the PLLCM33_GEAR clock definitions,
  - Replacing spaces by TABs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be qeueued in renesas-clk-for-v6.18.

 drivers/clk/renesas/r9a09g056-cpg.c | 8 ++++----
 drivers/clk/renesas/r9a09g057-cpg.c | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index f0a8c5073fa6a48f..55f056359dd77762 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -36,10 +36,10 @@ enum clk_ids {
 	CLK_PLLCM33_DIV4,
 	CLK_PLLCM33_DIV5,
 	CLK_PLLCM33_DIV16,
+	CLK_PLLCM33_GEAR,
 	CLK_SMUX2_XSPI_CLK0,
 	CLK_SMUX2_XSPI_CLK1,
 	CLK_PLLCM33_XSPI,
-	CLK_PLLCM33_GEAR,
 	CLK_PLLCLN_DIV2,
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
@@ -120,11 +120,11 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
 	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
+	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
 	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
 	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
 	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
 		  dtable_2_16),
-	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
 
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
@@ -325,8 +325,8 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(9, 14, 4, 15),		/* RIIC_6_MRST */
 	DEF_RST(9, 15, 4, 16),		/* RIIC_7_MRST */
 	DEF_RST(10, 0, 4, 17),		/* RIIC_8_MRST */
-	DEF_RST(10, 3, 4, 20),          /* SPI_HRESETN */
-	DEF_RST(10, 4, 4, 21),          /* SPI_ARESETN */
+	DEF_RST(10, 3, 4, 20),		/* SPI_HRESETN */
+	DEF_RST(10, 4, 4, 21),		/* SPI_ARESETN */
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index e84fcd5cf648c57a..b9f5356e3e3eaaf0 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -171,9 +171,8 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
 	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
 	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
-	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR,
-		 CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
+	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
 	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
 	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
 	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
-- 
2.43.0


