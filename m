Return-Path: <linux-renesas-soc+bounces-16302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F413A9A57B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 10:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEBBF3A9511
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 08:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E591F4174;
	Thu, 24 Apr 2025 08:14:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F11C8BE8;
	Thu, 24 Apr 2025 08:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482457; cv=none; b=GQKrBapzCvd1WkOnM2cTVtbAXiY3321pjQCvSbtagfa6k97EF5Fn+YRVYBCr4x1XF3gMox88x+wpgP9RdVPuAacmua/pbQbR3/zdWhP/eCdW/vsR/LtsaefQRa34gEBwaBcTLSC5CVJkvNRKZhD4HNUJ/nU05b744lagVgNpGv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482457; c=relaxed/simple;
	bh=TGo/SnkfnY8iIj3zjquGbt2BxRdDzSPRS9maZM3u5dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YLxMprA/kftMpmjQhRzp2n4oUrDZgM1J78mki5vPaHbTA/jgicE+O3MeSXSxWlmTsytpNaRTHNUROtiSisGsI5B0lhgFWw2OqDO8isICGSUdCoLTL/S0xCcY0zgJo607c28APsGX+jyd1VBp5ZoulNecPKmc7cUKHZF85FCmXns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: vJa5csvNQdGeXbRdMV8r9w==
X-CSE-MsgGUID: 29Unba2uSM++Ba3KtM/MjA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Apr 2025 17:14:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0EB2041BF1F9;
	Thu, 24 Apr 2025 17:14:10 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 2/3] clk: renesas: r9a09g047: Add support for xspi mux and divider
Date: Thu, 24 Apr 2025 09:13:55 +0100
Message-ID: <20250424081400.135028-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424081400.135028-1-biju.das.jz@bp.renesas.com>
References: <20250424081400.135028-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mux smux2_xspi_clk{0,1} used for selecting spi and spix2 clocks and
pllcm33_xspi divider to select different clock rates. Add support for
both.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated LAST_DT_CORE_CLK entry
 * Moved "spi_clk_spi" definitions to patch#3.
v1->v2:
 * Updated LAST_DT_CORE_CLK macro
 * Replaced DEF_SDIV->DEF_CSDIV macro
 * Added spi_clk_spi as core clk
 * Updated CSDIV0_DIVCTL3 macro.
---
 drivers/clk/renesas/r9a09g047-cpg.c | 27 ++++++++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h     |  7 +++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 88a5a1c24ade..be387548664a 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -16,7 +16,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G047_IOTOP_0_SHCLK,
+	LAST_DT_CORE_CLK = R9A09G047_GBETH_1_CLK_PTP_REF_I,
 
 	/* External Input Clocks */
 	CLK_AUDIO_EXTAL,
@@ -31,7 +31,13 @@ enum clk_ids {
 	CLK_PLLVDO,
 
 	/* Internal Core Clocks */
+	CLK_PLLCM33_DIV3,
+	CLK_PLLCM33_DIV4,
+	CLK_PLLCM33_DIV5,
 	CLK_PLLCM33_DIV16,
+	CLK_SMUX2_XSPI_CLK0,
+	CLK_SMUX2_XSPI_CLK1,
+	CLK_PLLCM33_XSPI,
 	CLK_PLLCLN_DIV2,
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
@@ -61,6 +67,14 @@ static const struct clk_div_table dtable_2_4[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_16[] = {
+	{0, 2},
+	{1, 4},
+	{2, 8},
+	{3, 16},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -70,6 +84,10 @@ static const struct clk_div_table dtable_2_64[] = {
 	{0, 0},
 };
 
+/* Mux clock tables */
+static const char * const smux2_xspi_clk0[] = { ".pllcm33_div3", ".pllcm33_div4" };
+static const char * const smux2_xspi_clk1[] = { ".smux2_xspi_clk0", ".pllcm33_div5" };
+
 static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
@@ -84,8 +102,15 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 
 	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
+	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
+	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
 
+	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
+	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
+	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
+		  dtable_2_16),
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
 	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 449f8c82e8fb..9104b1cd276c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -93,10 +93,12 @@ struct smuxed {
 		.width = (_width), \
 	})
 
+#define CPG_SSEL1		(0x304)
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
+#define CPG_CSDIV0		(0x500)
 
 #define CDDIV0_DIVCTL1	DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
@@ -111,6 +113,11 @@ struct smuxed {
 #define CDDIV4_DIVCTL1	DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
 #define CDDIV4_DIVCTL2	DDIV_PACK(CPG_CDDIV4, 8, 1, 18)
 
+#define CSDIV0_DIVCTL3	DDIV_PACK_NO_RMW(CPG_CSDIV0, 12, 2, CSDIV_NO_MON)
+
+#define SSEL1_SELCTL2	SMUX_PACK(CPG_SSEL1, 8, 1)
+#define SSEL1_SELCTL3	SMUX_PACK(CPG_SSEL1, 12, 1)
+
 #define BUS_MSTOP_IDX_MASK	GENMASK(31, 16)
 #define BUS_MSTOP_BITS_MASK	GENMASK(15, 0)
 #define BUS_MSTOP(idx, mask)	(FIELD_PREP_CONST(BUS_MSTOP_IDX_MASK, (idx)) | \
-- 
2.43.0


