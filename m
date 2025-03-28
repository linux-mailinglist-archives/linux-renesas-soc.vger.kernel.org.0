Return-Path: <linux-renesas-soc+bounces-15037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D38DFA7512C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 21:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1B0B18956E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 20:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18AF41F3BBF;
	Fri, 28 Mar 2025 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gc6bTIox"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120CF1F09B9;
	Fri, 28 Mar 2025 20:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192095; cv=none; b=kX7d+veg8+jQx2SCR/dHTwb1g/w4HuEOs8xQMCQr6mTH1qN96+cCF2MIvhAwuRaVdrnSKp7Pzl4sxxHv2SDDc1fYScelYCxfuS1EHuvpj/NG3CPiU6+0Eu4+SLcSj0ZpH6OkTG1j0KYGpfjXXa60o8aDdbAUZf/CK9YVSalwmP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192095; c=relaxed/simple;
	bh=U+t9Q2ALK7lnJq1xvyNquzDJ6+QGuiYORhdXe+k1nFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OcCbzoR9UPSjJHD+HqKlSarSXxixuZ9rCFeCbd7PeHNmq4IBBarK5Y8LHUrr29my28CfSeRgYPloCupPK8zzH/TRtVQa7XQalet6hksqVEPehjPs57uWN8q1R2210SWu0jFm8ApCK2nS7Qxr7LlrJqmPEa+AGfA0ErpwJ8OTJRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gc6bTIox; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43690d4605dso17854535e9.0;
        Fri, 28 Mar 2025 13:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743192091; x=1743796891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1fOeglNqBPsySK9Pv3vXlmCbugVsWq/fJq9OAzmtGo=;
        b=gc6bTIoxmdQ5RvTuEkFAb8/f8FoMeAA+XlA4GuidwLIBHME7FTpbg3To4HHvv4Tb0z
         kyzQmpJXeOYgmZb2LI/XVo7rhem8D/DB9zxG+L52oGjw3oOsHN3vLNMuzxOZbLZq6Su0
         gFFcbBwyDt9kZBY3+MjHdrDZ3tIrq3wmh7V6AeIsx2o1zUb+4ukehn/DIeuHxj+lOaaz
         uGfvPf6Z+OTpIgWlu7s9AZBdtfahkPSrBKILoRD95WKliLzwjFXD16Ia2j7+l1DuEwKX
         oQxApKLXEP7MiaakjpS2wf9DTdPwXqz9S4Z9uItnGBW8pj2NbEvbsbkSPhD+/qiV9dL1
         vP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743192091; x=1743796891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1fOeglNqBPsySK9Pv3vXlmCbugVsWq/fJq9OAzmtGo=;
        b=q/clfP86sgz/dqnQirhb6XBa7deSJ5RK6CRKYEM709mVA3iOAfkIM9mYV2x0YDOYOP
         RgYrEEJmcqRQKMi1sAdSDnEsjeL7wHK5I+1i6nzak+M4LEbf1vGsSg5cxhRTrbTYNXTQ
         7PkDnCzYL4zU2WYznj78LHTvstnv5uQo6issGVBCQ3JGdYEMT7vDVem4ZR1BOy0cW7D/
         ma/Rgh1gOBDvSflfp83kh62MYFnKd017XaFyBEAf91Mm+HlR/qQxGvk9VOyQtNgo3D1o
         aO/BCVGx4BVM8Ku5Os2b9pLowtln7KAT/Vu0Zzi2wwzuZF/CeEsyZlRLi0Cu67LekNxB
         +X5A==
X-Forwarded-Encrypted: i=1; AJvYcCU3QM92kMZWiuOqDUsHYfEAWu0lMAGjkD2Zk3RNB16Xvfd52v257wSwtUKLr3xP2ctIExRSx5j0i0Oq@vger.kernel.org, AJvYcCX5Tli8cy455RSsHt2BYR6HvxlmNtIK3CIWRXV0w2q+tNwp42+KMak3d4FK2w0RFVXolKZyr2mqfR0m7nMs@vger.kernel.org, AJvYcCXfu/Ki0AkW/F25984kKw4gtj5G0NfqEEzTi3Vg17Bc+uztzHkNWSnlwNWt1WAqlqWW2DoIWwU3yKJf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy5uUalFvW1eldMZLycAXuBH2UW+OuMtRX2W6scLnsgwDxrgfP
	4vAQLnaSliHM95kGiFrz4Gq5YCZvBFZvS4fFq1cgrabmLHy/g2S7QxvaE94Z
X-Gm-Gg: ASbGncs1QNYfFJ+jEenwSXDBWAE4ThI2jfYLCxZdWZ3hUHmAYeKDrc7wfMvofPDKE9E
	K43nD8nXgfPUDZUZWsnI4U11eYyM6uSlvNoVZGWZk+jffIdrXWQbg0YW0HHgyoxVV248AbTIKja
	OmAs5T0qepJN7u4bvva9BayKyIyh7I050ZesWPMjfDOe67uf7Onh37Zg1Aqx0R8i2UYI2dHVBZs
	JDtwS1qkkHhSxZmqKCTx3xXoACH5wVofkt9+o3va3yQVj57vGKdbVfhpedJaN6LbuLAzkqUkxIC
	RgBfYts52STiWvmrOnfs3IPZBvL+/mKdklwfbyZ+8F0l5o+eCMWeiWm4cYEpKJuh3I4=
X-Google-Smtp-Source: AGHT+IG4w4ACsDcndQ7Upce7oKR1gqjBvl646Cf0+8vYVeyx/0n805sGlP0QgfEMS0tRCN9uqfxV3g==
X-Received: by 2002:a05:600c:34ce:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-43dabe23634mr9218175e9.0.1743192091027;
        Fri, 28 Mar 2025 13:01:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b400:d08:873:badd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcceaaasm37930955e9.18.2025.03.28.13.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 13:01:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/6] clk: renesas: r9a09g057: Add clock and reset entries for GBETH0/1
Date: Fri, 28 Mar 2025 20:01:05 +0000
Message-ID: <20250328200105.176129-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/clk/renesas/r9a09g057-cpg.c | 72 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     | 11 +++++
 2 files changed, 83 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 3c40e36259fe..057bfa0e2a57 100644
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
+static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0-rxc-rxclk" };
+static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0-txc-txclk" };
+static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1-rxc-rxclk" };
+static const char * const smux2_gbe1_txclk[] = { ".plleth_gbe1", "et1-txc-txclk" };
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
@@ -233,6 +271,38 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(7, BIT(10))),
 	DEF_MOD("usb2_0_pclk_usbtst1",		CLK_PLLDTY_ACPU_DIV4, 11, 7, 5, 23,
 						BUS_MSTOP(7, BIT(11))),
+	DEF_MOD_EXTERNAL("gbeth_0_clk_tx_i",	CLK_SMUX2_GBE0_TXCLK, 11, 8, 5, 24,
+						BUS_MSTOP(8, BIT(5)),
+						0x300, 8, 1),
+	DEF_MOD_EXTERNAL("gbeth_0_clk_rx_i",	CLK_SMUX2_GBE0_RXCLK, 11, 9, 5, 25,
+						BUS_MSTOP(8, BIT(5)),
+						0x300, 12, 1),
+	DEF_MOD_EXTERNAL("gbeth_0_clk_tx_180_i", CLK_SMUX2_GBE0_TXCLK, 11, 10, 5, 26,
+						BUS_MSTOP(8, BIT(5)),
+						0x300, 8, 1),
+	DEF_MOD_EXTERNAL("gbeth_0_clk_rx_180_i", CLK_SMUX2_GBE0_RXCLK, 11, 11, 5, 27,
+						BUS_MSTOP(8, BIT(5)),
+						0x300, 12, 1),
+	DEF_MOD("gbeth_0_aclk_csr_i",		CLK_PLLDTY_DIV8, 11, 12, 5, 28,
+						BUS_MSTOP(8, BIT(5))),
+	DEF_MOD("gbeth_0_aclk_i",		CLK_PLLDTY_DIV8, 11, 13, 5, 29,
+						BUS_MSTOP(8, BIT(5))),
+	DEF_MOD_EXTERNAL("gbeth_1_clk_tx_i",	CLK_SMUX2_GBE1_TXCLK, 11, 14, 5, 30,
+						BUS_MSTOP(8, BIT(6)),
+						0x304, 8, 1),
+	DEF_MOD_EXTERNAL("gbeth_1_clk_rx_i",	CLK_SMUX2_GBE1_RXCLK, 11, 15, 5, 31,
+						BUS_MSTOP(8, BIT(6)),
+						0x304, 12, 1),
+	DEF_MOD_EXTERNAL("gbeth_1_clk_tx_180_i", CLK_SMUX2_GBE1_TXCLK, 12, 0, 6, 0,
+						BUS_MSTOP(8, BIT(6)),
+						0x304, 8, 1),
+	DEF_MOD_EXTERNAL("gbeth_1_clk_rx_180_i", CLK_SMUX2_GBE1_RXCLK, 12, 1, 6, 1,
+						BUS_MSTOP(8, BIT(6)),
+						0x304, 12, 1),
+	DEF_MOD("gbeth_1_aclk_csr_i",		CLK_PLLDTY_DIV8, 12, 2, 6, 2,
+						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("gbeth_1_aclk_i",		CLK_PLLDTY_DIV8, 12, 3, 6, 3,
+						BUS_MSTOP(8, BIT(6))),
 	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
@@ -304,6 +374,8 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(10, 13, 4, 30),		/* USB2_0_U2H1_HRESETN */
 	DEF_RST(10, 14, 4, 31),		/* USB2_0_U2P_EXL_SYSRST */
 	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
+	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
+	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 0277871e298b..2250436c4c24 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -81,10 +81,13 @@ struct smuxed {
 		.width = _width, \
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
@@ -99,6 +102,14 @@ struct smuxed {
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


