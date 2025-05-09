Return-Path: <linux-renesas-soc+bounces-16908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B52BAB19E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 18:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD74E169B25
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 16:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3E62356A9;
	Fri,  9 May 2025 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8d/NTXo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7554823BF9B;
	Fri,  9 May 2025 16:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806493; cv=none; b=r9pkY9F/Fb2FUTPZ/ZdDX6LvqunWhlfD9iePdj+tgeeWaFu5I09xdjZEtL/nssfkj2TLTpddTqB/fP5Y8kow6K+a578BBokZvlpjcFNtuozhg5uRr/xc5dMTIXKK+nfyazGlcnDfJfLxyH9Gu/9C2vtIYmn6VQ0C43uhNq7M0nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806493; c=relaxed/simple;
	bh=1sO2q7isXcOVdKyyFEPtOhXb2RC9r2hkfe+fIhU8X10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VGVk8MMohnIXq18diacC7bUY243vkkYCUIDRxMQxyjO38ZnXIPNL8c30qQ88C3QmE1065e7nrcE/dirE50aA5VhCbEHZxm2PYH3Bk300CitSLRR3harWTzHGdh9Lm4ADal1UQulHvoTQnjBmktYv8blcfYPHkDti/Rqz05M83/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8d/NTXo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so22947055e9.2;
        Fri, 09 May 2025 09:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806490; x=1747411290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0fd0oIK5jgXt5kHPH3hhe9fXOJEwV245s5QgJQePWY=;
        b=j8d/NTXow5VCWPYPYcHTgyXp78LtTrYXwO6LS76VLyPvGMTtug5+vOVkAtnYQwIkBj
         81l0E3xYdxe4b/MfvpGTZ+1WLuVMxXEBsZVIiuY0KOqeT/7HVSjIAJ0z7VNpIn2Ent0L
         AjWsA2OfodErWDSu9pT0VLsON+6G7QeyoL5Tyu8Fc/l2ZABgDHcqP/1yFVTt3feNj9kc
         4c10N/SWkDHBYIJwr8msiQwvvgXRjZRIsh8YaPRWIa8zRGV/eiGxN48PoDdzn/ojuXZ5
         XGeQHIfhT8PVjS+DoAD7ZIVBku+BVWmeGFFAbJa1UPswImk4tivjOi/thY7s7c0nZA80
         asoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806490; x=1747411290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0fd0oIK5jgXt5kHPH3hhe9fXOJEwV245s5QgJQePWY=;
        b=D26VApw/wkb4Wh0Hhgfw/W55e/GyuuH3D1AZK0Fd0bZVPrHSDOPFVFZaXfQj4EzbpE
         Fu2P9FXa4wliPU9ANccST07HLgWSh81Qvwz4CVKSdeinAqwS+LSqeoiRzP29xMNMuPfe
         zULbJJ6e3Itf6g/EV3C7RVtWcUCD+dUHLrR5j/9brgQ+JDcNjWsgC6Z8/sC8tm+Vzvkf
         +Tfc6lyI98jidyGcFbPZG7N0FnNbOYM+NCLp4N0xWwFZtcyVeHQ9fRgbXXSlNM7km4y8
         Uz6T1R9pTYRE0CzYS/0wY0rNNqCVVwky6O45v1J2wJ3afgAptbvPjogLIB7ZXTYmb0UW
         PjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+SCd+dBALXXzKnWDuWQ2tA+jI+rJpAX414fpyvpPbGubzm2jX+SzUr2WyshSJrCzaokd1BYKjmt0aE4DD@vger.kernel.org, AJvYcCX8ppbCzlFRZlNramF+7PZLkdUmHGIoI25wupQDGyHtXUD8JzVOoNzarhJnNfE7Qvx9y0kVAGmvJ1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzohpiMf0cb6vhhnumvEaAv6/SStHGXRm+Qm+Wyhvvuv1a141Rc
	kd1uVohuDEx63P4b5SCoTqAKoam7Ri8+9pTPfMfH9AbG8j6KLAFR
X-Gm-Gg: ASbGnctPrXN6n3zlBFfQ+WxB1qkwsAzus31rqHbD2AUshz0Lr07uaRDGotJQ3XFi95z
	0PbIlfUWPDgKhOF7/kQb5p5Cr65WzM6+vSjvTYeMZK2gHZFjF40a6lctp/aeCof8VHiH8kJE+ai
	psW13fMvcpo+WPHE8dzTI4iUB3IEAFswSavmhlADOPYcIXWQFVcu7zAuIHGaIjt3xkGh/dCvRU5
	Fg0QCrULM/rwx3tZdV54EVjcQq6yWqv7ecR/8ameFj/kJ1m80EtrPdcR3FM4oZCW+vX+bYdPQu/
	meJqwgVLKuij6+/znYDrubPYw417ucU3DcZ3zXJXsIo2/BuSyQiey9YN3/Wbe/D5vA==
X-Google-Smtp-Source: AGHT+IE5ZGCvwY1usd/9AvsedxkXUQxg/voCx9GuGS6JXjEURS4mO+Dp+AmECOO1fBaFnzQ3Bh/WgA==
X-Received: by 2002:a05:600c:46c3:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-442d6d18bdcmr37694525e9.2.1746806489270;
        Fri, 09 May 2025 09:01:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:40e3:34f3:a241:140c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ac8csm33244475e9.33.2025.05.09.09.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:01:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/2] clk: renesas: r9a09g057: Add clock and reset entries for GBETH0/1
Date: Fri,  9 May 2025 17:01:21 +0100
Message-ID: <20250509160121.331073-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509160121.331073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250509160121.331073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4:
- Dropped adding CPG_SSEL1 and CPG_CSDIV0 macros in rzv2h-cpg.h
  as they were already added by XSPI clocks patch

v2->v3:
- Used DEF_MOD_MUX_EXTERNAL() macro for external MUX clocks.
- Renamed gbe0/1 external mux clock names

v1->v2:
- None
---
 drivers/clk/renesas/r9a09g057-cpg.c | 64 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  9 ++++
 2 files changed, 73 insertions(+)

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
index 68c223373916..cd6bcd4f2901 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -93,6 +93,7 @@ struct smuxed {
 		.width = (_width), \
 	})
 
+#define CPG_SSEL0		(0x300)
 #define CPG_SSEL1		(0x304)
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
@@ -118,6 +119,14 @@ struct smuxed {
 #define SSEL1_SELCTL2	SMUX_PACK(CPG_SSEL1, 8, 1)
 #define SSEL1_SELCTL3	SMUX_PACK(CPG_SSEL1, 12, 1)
 
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


