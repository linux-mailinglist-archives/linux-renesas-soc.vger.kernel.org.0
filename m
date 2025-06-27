Return-Path: <linux-renesas-soc+bounces-18867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA57AEC147
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 22:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A55118871BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 20:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5E42EE983;
	Fri, 27 Jun 2025 20:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GF90QWAV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524F72EE5EC;
	Fri, 27 Jun 2025 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056974; cv=none; b=EqJJMpBe9p4q6IQGLKZmUtbUuj/H8jHJJN6NrbR9ms0eyVJKXhx2RBDLUDVtDJZTfCRMSYBlUtO44xxxufe/kBJJsHD/V+IE1uRVsbijug0Ws0T/cigrpALdBm/YyX8JdkXorwjm49iA7nZz6QlKIg5iqb67DmW7M1Ki6aprGJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056974; c=relaxed/simple;
	bh=8QkcunE7avjR4ETyOBJIS9ShZo4Feau4QzXVbObg1+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j0vLy2lt76BXhaKrDJQ/4EocOwM00MhRIRC1gDXpasBfWJdmCBiOhs2BKqnARzjZviUt74YGgkB+sJXzl0RTEFmvSGkpZTe3y+LYU5iJErd8u7g51szG/mGma3omT4QDIt6/6znus3uNR1OzMFWKtIbv23IiUiNiy0vsrgqUXLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GF90QWAV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d3f72391so2755425e9.3;
        Fri, 27 Jun 2025 13:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751056971; x=1751661771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFogUEFPDwoe5zvFZR9IXlLvXXTdFdqsNR9k44UIfj0=;
        b=GF90QWAV51pa8Iw+otH4m3OzGDs63mSSnOI1zv7whIQlohRmidLtHXKbzabu0g+nPF
         7mOgk0BW20leeT3C+jsGwjwH/OgY6nwo/7OVB8QzEL/7Rr/nnjL7khBIRBfeLutVBW1D
         P+SZ5/Z4aDklQ0RTPshqyVTDJh16SPNeZPUGdXeh/3ktQcj2svRKMgZTZc8osXI15kRo
         QoIU7HNkxpHH5HmpJr/vV7ZUNuJ9qh/bjSL0g4K2N3Gb7VWDg6zTOgvk0qxJxvfJhDBI
         vkW82QE1M+Vb87hmdt5o6SzL9KepdQ0IkhBKpztn3QrV+yd9vsU1yL6SfGHCI6NnBrEV
         /L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056971; x=1751661771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFogUEFPDwoe5zvFZR9IXlLvXXTdFdqsNR9k44UIfj0=;
        b=JrqQLbNknp47g+RfIfhTOKT7Yn3ceeCRxOgYSyCvSZBdkG3vANJHOYNUecqEvyigTf
         JeyZ3d6AZC7UWFjOuzqcldMCSePdqELQDdyq8qLOWlNGJ6z/Yl7wl5DMP0nX3BScOkjV
         j6fnP0rBhZ0/zf4Lb50lef3M5tzgFIxd/rPaUTuNaXulDfBOXX0UsH1HhzD0WO/qT+cI
         ekbGLW/xj4XBJ0ZL5EBAt0HVfvy8XEv0D1YWsVsR9BxBAiv9Ohu5ietaTtLSY3epJRzL
         32A9YSrPdqeCQOuppfibFdr1DN5TINEyytaq33OPrkehXNhiTke3SvdfxzSjNlEvLnZH
         lBRw==
X-Forwarded-Encrypted: i=1; AJvYcCU/PkG/W34xQhdmEaGJ/rPBh9mb+FZuUDae26RCbgd977tjSqi/gsJpA5yP5Dhh7GmR/559hblVAG74@vger.kernel.org, AJvYcCUWxa1a0OjS1Ai0zX488H2oiolMFMGZw2a/1ZXx5VBHCRoVQ2XIl09cPb6Molm0T+lDVuCErV6ueUYc50Rp@vger.kernel.org, AJvYcCUbJeX+MAFiSxScAwl+1WZsvEvKwXcDzAe3M4B0C58ALtTOzCSSQWQO8gEzhX/l8cK5HTH8anC1J6+f@vger.kernel.org
X-Gm-Message-State: AOJu0YwQgPGOPxx3ASUTD+ZxgLAXXtARkxfOvWXYe8tLM9zCQ/7TdAW/
	BGciufrjRb7d5Wi3zMVNJm09c7JkGkjsZ4B/DWS2Eub9afItShs+vX+Z
X-Gm-Gg: ASbGncsOk9hy1x8/8ffzVTu+KHTy9ag2ROSZS/JXMUkd6gGOEiMFw1qrWFC4J3JfdAW
	YcSxze0xU2HE37HZfPyjtyIUMf1W/0rmbtnGap2+0yGPgqndLB9aL6xg395lFf9tUebN+Kh5YZo
	YO9s8l5hY4GwCV8hi3FHhA45V9NDK018ALJtRfWjVD4J4sYjhPVYUH5bVg8c7BSgddmSbO/jl6m
	OfyXXJk2XbvA8JfUgczSfxvPofY2b0m4r1AAvitEvn0Egt9b/odn+17+4f+hloggmKNy2Kyn6iZ
	8hpkast/tOzijPniwUsh3ZECLySHG8vOeHj1LBK0KwPtkkYGdsy3SD/cVbX85h/bgEdkTMqgvhh
	pSlWlYKgIAw==
X-Google-Smtp-Source: AGHT+IHreqXziLECND4E146z9XCfLLQ7bEVfI+nB28X5sGu6INUIfUxfhFQlKoKmti/oMpVcdTkrXg==
X-Received: by 2002:a05:6000:2082:b0:3a5:2875:f985 with SMTP id ffacd0b85a97d-3a90066afb5mr4907750f8f.59.1751056970518;
        Fri, 27 Jun 2025 13:42:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3b46:edb1:4d0:593b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab7asm3609322f8f.24.2025.06.27.13.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 13:42:49 -0700 (PDT)
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
Subject: [PATCH v2 6/6] clk: renesas: r9a09g057: Add XSPI clock/reset
Date: Fri, 27 Jun 2025 21:42:37 +0100
Message-ID: <20250627204237.214635-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for the XSPI interface on the R9A09G057 SoC.

While at it, rename CLK_PLLCM33_DIV4_PLLCM33 to CLK_PLLCM33_GEAR to align
with the terminology used in the hardware manual.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1-> v2:
- No change.
---
 drivers/clk/renesas/r9a09g057-cpg.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 39065d63df61..687c25f76852 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -36,8 +36,8 @@ enum clk_ids {
 	CLK_PLLCM33_DIV3,
 	CLK_PLLCM33_DIV4,
 	CLK_PLLCM33_DIV5,
-	CLK_PLLCM33_DIV4_PLLCM33,
 	CLK_PLLCM33_DIV16,
+	CLK_PLLCM33_GEAR,
 	CLK_SMUX2_XSPI_CLK0,
 	CLK_SMUX2_XSPI_CLK1,
 	CLK_PLLCM33_XSPI,
@@ -134,7 +134,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
 	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
 	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
-	DEF_DDIV(".pllcm33_div4_pllcm33", CLK_PLLCM33_DIV4_PLLCM33,
+	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR,
 		 CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
 	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
@@ -189,10 +189,12 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
 	DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G057_GBETH_1_CLK_PTP_REF_I,
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
+	DEF_FIXED_MOD_STATUS("spi_clk_spi", R9A09G057_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1, 2,
+			     FIXED_MOD_CONF_XSPI),
 };
 
 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
-	DEF_MOD("dmac_0_aclk",			CLK_PLLCM33_DIV4_PLLCM33, 0, 0, 0, 0,
+	DEF_MOD("dmac_0_aclk",			CLK_PLLCM33_GEAR, 0, 0, 0, 0,
 						BUS_MSTOP(5, BIT(9))),
 	DEF_MOD("dmac_1_aclk",			CLK_PLLDTY_ACPU_DIV2, 0, 1, 0, 1,
 						BUS_MSTOP(3, BIT(2))),
@@ -258,6 +260,12 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(1, BIT(7))),
 	DEF_MOD("riic_7_ckm",			CLK_PLLCLN_DIV16, 9, 11, 4, 27,
 						BUS_MSTOP(1, BIT(8))),
+	DEF_MOD("spi_hclk",			CLK_PLLCM33_GEAR, 9, 15, 4, 31,
+						BUS_MSTOP(4, BIT(5))),
+	DEF_MOD("spi_aclk",			CLK_PLLCM33_GEAR, 10, 0, 5, 0,
+						BUS_MSTOP(4, BIT(5))),
+	DEF_MOD("spi_clk_spix2",		CLK_PLLCM33_XSPI, 10, 1, 5, 2,
+						BUS_MSTOP(4, BIT(5))),
 	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3,
 						BUS_MSTOP(8, BIT(2))),
 	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4,
@@ -380,6 +388,8 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(9, 14, 4, 15),		/* RIIC_6_MRST */
 	DEF_RST(9, 15, 4, 16),		/* RIIC_7_MRST */
 	DEF_RST(10, 0, 4, 17),		/* RIIC_8_MRST */
+	DEF_RST(10, 3, 4, 20),		/* SPI_HRESETN */
+	DEF_RST(10, 4, 4, 21),		/* SPI_ARESETN */
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
-- 
2.49.0


