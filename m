Return-Path: <linux-renesas-soc+bounces-16427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 171C0A9F8CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 20:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FF751A84933
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 18:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D44296168;
	Mon, 28 Apr 2025 18:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWp6ikxc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E612951BF;
	Mon, 28 Apr 2025 18:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745865729; cv=none; b=MdbM52O6UnyeW6u8lt69VCC5HJsHogMh6y+Z+9kr52/E6AN3wBeCQ2AJBYTGrNN/+xduEUFpvwzJYQObG4WMZ7cb0iWvfqxPgBa/eFDX8m4Xa1Zl3REwy9EaRmRH0/1QvIADtIEPiynP3RaKXTgKpqmgIlXawY2qLKV0xxOAXdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745865729; c=relaxed/simple;
	bh=yT527JgHDUnpV6aDGCF2b5Sd4NNNvDLYdVLfyxjg1XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWJzm2vFin1p6QuOU9zaPEJlSbwz0H+wEj1yGutXGoU28UcPnC2OIXBUXeYyM+4anm17hj+FUuWR6tIBdLTTlkFXV8oXQzrquFHGjIi8uLgijpA7r9crn6scFPQclwphZrsCyWi+bM6ym7CHWQz9mp62b+aLnjqsrXxhTss8CuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWp6ikxc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43690d4605dso38544745e9.0;
        Mon, 28 Apr 2025 11:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745865725; x=1746470525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok64YauqTMdNvCi5P0FwOimObf1fYs9wBXbW9OoJPMI=;
        b=UWp6ikxc5vXxcGhwbe5gcTfip7Ezr4bzUTz70RLZbAD4PRXzcdY5ro5MPzDwqmMeAk
         fBguLUxtZbf7RIXDZ7I/IJ6/V++eWhJqOZz1ggUYH351PFXGy54bnAZu2OcjgOPFg3pZ
         6ZHPvuR/3Mu08uip7lLIi2Vg8OnWipR41+jPRmhIqDu3FIECPyiBPjSpzvzvIqjpE9gb
         TR5fqddJhGmpmWv2OIbGAufE7rAL/rMV1mgdTl6rCQnYN9tq0HguRNdmSr9zjB6yQQws
         hevwadxnT6MPETKVse5WgT254u65vQHu/d9Qxo7mwA/do6/OkS2KCPgw3vcF2/4pB3JC
         WphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745865725; x=1746470525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ok64YauqTMdNvCi5P0FwOimObf1fYs9wBXbW9OoJPMI=;
        b=QkbfC6iG3Aq6eOdUO9ZUyDY1DhnEpYhxoPkHeyNJ6WXWa0pH6w0NELRlNO8g0ZLimm
         ybPehmTK2i4cK51+RAhXiAP1726q7YVMV0YUJT5hOnuOCFlo+tFyRqpI9hErJj48jhLU
         KuS4fnZ96GPf85ajP5tSw4yDh82PU1Rs+OMucvCj9U59iVhfSBtBH8yOkIDI/ss+vW7Q
         clcJZfcWiUd1ZQfOS1N6xlWMQQzrZsSjnTuzZEcUz02P6VUSIMqiF52Pb/LZkfck7lHH
         WQiWC+SbORd7pd5MX3v39d5yqRf8QoVmDIRk5xhVkKx/s3r6RtcjAkcjGPS8SvjPf/R7
         iHyg==
X-Forwarded-Encrypted: i=1; AJvYcCVSNjfQKaIxizLFwkQWua+QPap3kvB8iCREAhe1zd9kAXs6Fo5XPaLmmybkDjDxPJwCJ65HpQT6C7dm66Wu@vger.kernel.org, AJvYcCVw7PM54PPyykpt45ZFO5G2VbBp1vqDprz585SRPCoWL8M/0q656vGR1he6W9Y1ITN1vGMV5HekZ1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4D6ZYR1/MGg97gN0h/56CTFYFLUsAkJWvcYxbF/yuvfn094s7
	eVk2onTk/dffz7JM+mxVTJTjsjmfCKF4vZd2JpJQa9lTI+7Xoiok
X-Gm-Gg: ASbGncsf/AqOybDDA4IB0w+3axaa0q2ybwG3ZkoSJPyKd7ApiypZqvPmKP1rHEcE1k2
	wVGNp+Lbz6U2I49CognTEt+VXj6Pp383h0rt2SGukzFGkewn4Jov1ipP91FevB9BEzxKIcSiLbw
	rfR5N4dawsH/n92zRDmknkUnjHOJhrH+jnmWwj+whzdhQBDxTKocAS2S/6GGkj50Rw647B62g/B
	kDpkg5KSElTTguGdvsIqYYwpamyqq3rVGPKOXYNsntRc4FB8+W+MaJUltG7jVJGTgcZjM1AbKk1
	K9pC1sYMr2JuM2dZAg6PQATnrWcOMB9oFpebr4OrXNASUPBWqH9uQh4FmfelIB6jHOoE5CwWdQ=
	=
X-Google-Smtp-Source: AGHT+IG++EHHWRBjV1TSVZkj+MHb4zA2IzzvOSz0THRa6rd6R/cJ0d4+tjdSEW3WC+v9n1iJuU2C1g==
X-Received: by 2002:a05:600c:4712:b0:43d:224:86b5 with SMTP id 5b1f17b1804b1-440ab77d32bmr75200925e9.4.1745865725174;
        Mon, 28 Apr 2025 11:42:05 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:593b:8313:b361:2f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f89b2sm137745995e9.8.2025.04.28.11.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:42:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/2] clk: renesas: r9a09g057: Add clock and reset entries for GBETH0/1
Date: Mon, 28 Apr 2025 19:41:52 +0100
Message-ID: <20250428184152.428908-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428184152.428908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250428184152.428908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for GBETH instances. Include core clocks for
PTP, sourced from PLLETH, and add PLLs, dividers, and static mux clocks
used as clock sources for the GBETH IP.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Used DEF_MOD_MUX_EXTERNAL() macro for external MUX clocks.
- Renamed gbe0/1 external mux clock names

v1->v2:
- None
---
 drivers/clk/renesas/r9a09g057-cpg.c | 64 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     | 11 +++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 3c40e36259fe..da908e820950 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -29,6 +29,7 @@ enum clk_ids {
 	CLK_PLLDTY,
 	CLK_PLLCA55,
 	CLK_PLLVDO,
+	CLK_PLLETH,
 	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
@@ -49,6 +50,14 @@ enum clk_ids {
 	CLK_PLLVDO_CRU1,
 	CLK_PLLVDO_CRU2,
 	CLK_PLLVDO_CRU3,
+	CLK_PLLETH_DIV_250_FIX,
+	CLK_PLLETH_DIV_125_FIX,
+	CLK_CSDIV_PLLETH_GBE0,
+	CLK_CSDIV_PLLETH_GBE1,
+	CLK_SMUX2_GBE0_TXCLK,
+	CLK_SMUX2_GBE0_RXCLK,
+	CLK_SMUX2_GBE1_TXCLK,
+	CLK_SMUX2_GBE1_RXCLK,
 	CLK_PLLGPU_GEAR,
 
 	/* Module Clocks */
@@ -78,6 +87,19 @@ static const struct clk_div_table dtable_2_64[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_100[] = {
+	{0, 2},
+	{1, 10},
+	{2, 100},
+	{0, 0},
+};
+
+/* Mux clock tables */
+static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
+static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
+static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
+static const char * const smux2_gbe1_txclk[] = { ".plleth_gbe1", "et1_txclk" };
+
 static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
@@ -90,6 +112,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
+	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
@@ -115,6 +138,17 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_DDIV(".pllvdo_cru2", CLK_PLLVDO_CRU2, CLK_PLLVDO, CDDIV4_DIVCTL1, dtable_2_4),
 	DEF_DDIV(".pllvdo_cru3", CLK_PLLVDO_CRU3, CLK_PLLVDO, CDDIV4_DIVCTL2, dtable_2_4),
 
+	DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
+	DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
+	DEF_CSDIV(".plleth_gbe0", CLK_CSDIV_PLLETH_GBE0,
+		  CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL0, dtable_2_100),
+	DEF_CSDIV(".plleth_gbe1", CLK_CSDIV_PLLETH_GBE1,
+		  CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL1, dtable_2_100),
+	DEF_SMUX(".smux2_gbe0_txclk", CLK_SMUX2_GBE0_TXCLK, SSEL0_SELCTL2, smux2_gbe0_txclk),
+	DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
+	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
+	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
+
 	DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
 
 	/* Core Clocks */
@@ -130,6 +164,10 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED("iotop_0_shclk", R9A09G057_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
 	DEF_FIXED("usb2_0_clk_core0", R9A09G057_USB2_0_CLK_CORE0, CLK_QEXTAL, 1, 1),
 	DEF_FIXED("usb2_0_clk_core1", R9A09G057_USB2_0_CLK_CORE1, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("gbeth_0_clk_ptp_ref_i", R9A09G057_GBETH_0_CLK_PTP_REF_I,
+		  CLK_PLLETH_DIV_125_FIX, 1, 1),
+	DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G057_GBETH_1_CLK_PTP_REF_I,
+		  CLK_PLLETH_DIV_125_FIX, 1, 1),
 };
 
 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
@@ -233,6 +271,30 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(7, BIT(10))),
 	DEF_MOD("usb2_0_pclk_usbtst1",		CLK_PLLDTY_ACPU_DIV4, 11, 7, 5, 23,
 						BUS_MSTOP(7, BIT(11))),
+	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_tx_i", CLK_SMUX2_GBE0_TXCLK, 11, 8, 5, 24,
+						BUS_MSTOP(8, BIT(5)), 1),
+	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_rx_i", CLK_SMUX2_GBE0_RXCLK, 11, 9, 5, 25,
+						BUS_MSTOP(8, BIT(5)), 1),
+	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_tx_180_i", CLK_SMUX2_GBE0_TXCLK, 11, 10, 5, 26,
+						BUS_MSTOP(8, BIT(5)), 1),
+	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_rx_180_i", CLK_SMUX2_GBE0_RXCLK, 11, 11, 5, 27,
+						BUS_MSTOP(8, BIT(5)), 1),
+	DEF_MOD("gbeth_0_aclk_csr_i",		CLK_PLLDTY_DIV8, 11, 12, 5, 28,
+						BUS_MSTOP(8, BIT(5))),
+	DEF_MOD("gbeth_0_aclk_i",		CLK_PLLDTY_DIV8, 11, 13, 5, 29,
+						BUS_MSTOP(8, BIT(5))),
+	DEF_MOD_MUX_EXTERNAL("gbeth_1_clk_tx_i", CLK_SMUX2_GBE1_TXCLK, 11, 14, 5, 30,
+						BUS_MSTOP(8, BIT(6)), 1),
+	DEF_MOD_MUX_EXTERNAL("gbeth_1_clk_rx_i", CLK_SMUX2_GBE1_RXCLK, 11, 15, 5, 31,
+						BUS_MSTOP(8, BIT(6)), 1),
+	DEF_MOD_MUX_EXTERNAL("gbeth_1_clk_tx_180_i", CLK_SMUX2_GBE1_TXCLK, 12, 0, 6, 0,
+						BUS_MSTOP(8, BIT(6)), 1),
+	DEF_MOD_MUX_EXTERNAL("gbeth_1_clk_rx_180_i", CLK_SMUX2_GBE1_RXCLK, 12, 1, 6, 1,
+						BUS_MSTOP(8, BIT(6)), 1),
+	DEF_MOD("gbeth_1_aclk_csr_i",		CLK_PLLDTY_DIV8, 12, 2, 6, 2,
+						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("gbeth_1_aclk_i",		CLK_PLLDTY_DIV8, 12, 3, 6, 3,
+						BUS_MSTOP(8, BIT(6))),
 	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
@@ -304,6 +366,8 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(10, 13, 4, 30),		/* USB2_0_U2H1_HRESETN */
 	DEF_RST(10, 14, 4, 31),		/* USB2_0_U2P_EXL_SYSRST */
 	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
+	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
+	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 687587033688..a05fb5e7f707 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -93,10 +93,13 @@ struct smuxed {
 		.width = (_width), \
 	})
 
+#define CPG_SSEL0		(0x300)
+#define CPG_SSEL1		(0x304)
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
+#define CPG_CSDIV0		(0x500)
 
 #define CDDIV0_DIVCTL1	DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
@@ -111,6 +114,14 @@ struct smuxed {
 #define CDDIV4_DIVCTL1	DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
 #define CDDIV4_DIVCTL2	DDIV_PACK(CPG_CDDIV4, 8, 1, 18)
 
+#define CSDIV0_DIVCTL0	DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
+#define CSDIV0_DIVCTL1	DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
+
+#define SSEL0_SELCTL2	SMUX_PACK(CPG_SSEL0, 8, 1)
+#define SSEL0_SELCTL3	SMUX_PACK(CPG_SSEL0, 12, 1)
+#define SSEL1_SELCTL0	SMUX_PACK(CPG_SSEL1, 0, 1)
+#define SSEL1_SELCTL1	SMUX_PACK(CPG_SSEL1, 4, 1)
+
 #define BUS_MSTOP_IDX_MASK	GENMASK(31, 16)
 #define BUS_MSTOP_BITS_MASK	GENMASK(15, 0)
 #define BUS_MSTOP(idx, mask)	(FIELD_PREP_CONST(BUS_MSTOP_IDX_MASK, (idx)) | \
-- 
2.49.0


