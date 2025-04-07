Return-Path: <linux-renesas-soc+bounces-15511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3086A7E78C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C83413BD3AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C916621A424;
	Mon,  7 Apr 2025 16:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfT/r8YO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE082165EA;
	Mon,  7 Apr 2025 16:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044750; cv=none; b=QBS2IcZh9vk9paHFsdQ9HQZCPpRFHpFvjXKVRtvnPH165DNatOdMxySFY7FtpVUjV+lecVPPW6xqkDRrRnevyXiqDJgt5T9og8xycbzeNYZkEUAgTGb21/nZPBGuR40HUqLPVte9XvqwI+Hsd13ORfeBaGQFErNKTcJzcoLLT8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044750; c=relaxed/simple;
	bh=zBmztjqaLSQ8FjjYALCB3BVxmox429bkI2uo/uzjB6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpG6UGBVB0ER7BCcAaCMcWli551RHwGpS0RwYgWbTyO/KpEdGV7ZBSyLCCyRQgbuniVuTC4GfktW6R4kkYZM71wk478nUWz75So280IT765f7xHEL47VbMFLYk/H4YMV2ICXpl7ZKuoYNEdqFGXNiMUZMeP1kePou5GsmKH56Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfT/r8YO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so46047625e9.3;
        Mon, 07 Apr 2025 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044747; x=1744649547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THekJI9YUzNNtdWRmefKg2uKRp0jBqvId+F8Fzl+4HY=;
        b=DfT/r8YO79zerh3r/LjunBvDp6PVnS6w+HtqMLUl+l1oZ8AdDuCt6wF1pPu+hTWTVu
         ept2RWUe/M4O7Hargc2q6hAaw8DFmEK/beAoPkq5iuRb6hxCClIZAC+SBuuAbFsliseu
         3DvMW+YRlOQfyIHdjXALPsXb/tEBhMa0z7kofXNPJeVnKRV2SAw0SsbX5N46wPpYn1fn
         HxYzaKRkcHErftmzMv3gNi9VpR8ezklnnG3Ju0XO1qZysgamajeeDn3D2EJJxtE1A+3z
         xZ+UhhtKD97+K7vcAnV2shgEGh7RVQJlUlgM9dJVVPdzcs2hlm4rl08+ObSOSJDCszMX
         eDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044747; x=1744649547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THekJI9YUzNNtdWRmefKg2uKRp0jBqvId+F8Fzl+4HY=;
        b=Fn1ynlebabUb3WagReR4hI0DOVcpaTbbDOJnivxznATCjrT5KvmuW05TDVcZZ7Fkjt
         lk4Jh8GzOdGsM4sV1+JqsfddXaDwfBQh/ahDoxxAd5eUeaWru/MViBVlvL3Fvgw4uIs7
         qVJy2XOssYfysV/eZ6Bm9D8IfIt8CmGoNmdOucRH/7VmUS5iKPjzfHNPsVMx1BWxKLAB
         S7lcKVQj3pAmiAngpdrGkyMlSUiE61kh2lDfodtstNsU4DyAIppRxJ7gFXLy6rfo5eWT
         I6LkFoWgV6l91SV0yT5gBQCtGmoP/xlP2bZsJ7831GuqJ8srzg0sN6stZSR4J8ERimV2
         TXcg==
X-Forwarded-Encrypted: i=1; AJvYcCUHwf0sZVWQkYmWyz+rGgYBJBhmeSeOXgwge3JXlAmda4WRUDqFkBwovjtelvAExAbpCzg08C1f1Xj0T5Ra@vger.kernel.org, AJvYcCVh01U54uBL0QYmmvUqSu1YktU2mHfL+SDXnljS5Id8Dn4B8HtuQ87BCQvBgpNX1og+INgmWCJW7WCp@vger.kernel.org, AJvYcCXzP7n4y4dfrrJ/e27o7m9aPX06E5U1QBPhNLxjbem28UaAk73ZdBYh1Z7+pWHgKBp8aZWQRXv/mD+l@vger.kernel.org
X-Gm-Message-State: AOJu0YzeGVbFXKnirSFb7gHroI8OkdthVVCTC9GYV/8DoAHu8LOm11of
	/6su0veEOb6ViLGiVb/ZhTn6QDJPnYN3dpYKpQui3G2wqTnPFNYv
X-Gm-Gg: ASbGncvSnWzl7xoMZLTO/SrAEBntKu1a/s6KcraX5H1e5FskHlLjLZi3Wb7a94nJPF7
	bfHdeJcD3OmxX2vZ+xpa9MD1zDDsogrygXufJXM1HtSX9gbIIC/Ly5n2WsDp7qOclFrrrCYZm0G
	yJtzgCSl9S4iDoarz2MPhhxlCuf0eg1SNMtQ8yneWSAScnR5vf8a7aiFkb7T9S8Ke0tSSQPMFcy
	e5Ir1s+LfxYKpJyKAWYvxc3wzPRG8gGNOttDM3fGrc+8eiOJe6KWQoBIcWuU7tjk5CmPJq8lj43
	2DtWGtsRKCFpXbwz+Qe2AsKvVIFRaXvX4zbb+O3ExfidbWjLLVDypqwtBazZTA/C68v2fcsAHkC
	UUrkc
X-Google-Smtp-Source: AGHT+IH38nxrx51hlfO0odZaRY9B9aNs0+tJwFUxHQFmNQ1mD4yd8oltYm3RpK5U+Mch14mMo8WKOg==
X-Received: by 2002:a05:600c:3549:b0:43c:e481:3353 with SMTP id 5b1f17b1804b1-43ecf90aae2mr142732175e9.17.1744044746713;
        Mon, 07 Apr 2025 09:52:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm139272305e9.23.2025.04.07.09.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:52:26 -0700 (PDT)
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
Subject: [PATCH v2 9/9] clk: renesas: r9a09g057: Add clock and reset entries for GBETH0/1
Date: Mon,  7 Apr 2025 17:52:02 +0100
Message-ID: <20250407165202.197570-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index c64cfead6dc1..e730179d92aa 100644
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


