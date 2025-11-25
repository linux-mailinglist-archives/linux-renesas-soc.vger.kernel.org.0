Return-Path: <linux-renesas-soc+bounces-25137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E810DC874CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 23:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2272835401C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 22:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA7D33CE89;
	Tue, 25 Nov 2025 22:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7IfojUb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65B033BBBA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 22:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764108877; cv=none; b=hlLMKD5mUNLrJzLmJrqrS/jxR4LJQW1+/2eo/a52alzRAuDZdBJkjW1luK/2SZS8iiD9SFORn6bqdQWqqIpManEbo10Jp5DTSy5IM8tMkRteJedkqjDAW8858uyJv6PrPCb2DbtushfSLtozSE5SB64PAI53/RFjaAUtM9jvSsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764108877; c=relaxed/simple;
	bh=025uKoxgb9agv16k3xbIpHgeqVzMK0siTkQxlO+uuV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EpMGMA/W2Uk8bm/E3jNwVlCNd9H9pXTDHxcWlrZjI8yA4NV57Ne67VYorUI0iQ8nEhhowb3lWdqEbicheDQ+9hCcAS8tCUM1iDxo5aGgg451ddSbkpzKvglfVGBVKGOroD1SG9s7XC3G4teulOV+lqf7no41uudc1EVyghbjwWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7IfojUb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3108f41fso3674486f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 14:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764108874; x=1764713674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAfcPBqPXedAJhplXHd1LAHPhzxCFkLFqsJc935i9XA=;
        b=F7IfojUbWzI2PtjpjlCeK7+g0ZEb7Ok51mKg1nPkY41JAMZmeocbAU1/f6KKO6oh7c
         K/g37FRxgNUtb92gbSoujD7m/RrIQ5sKidMITdZP5yw4cGJeYZ9oS8K2JqXKJ8+5ionr
         E+I2GO6MM8hewicgU171/eBbCDgnpVyDxuvHB8XYZZmPtSGgFsAxeV4s6QP22jD70m82
         l5bjwK4SRHJTQxeWRcyQgZTLPHpdeK2GffR75ovTyOpnSppffZR9i53ZTXBg2BuBdzBp
         FPbS+khDLMyIekqgtANWtcPpc3aX1e1tospX/tnXOR7q/DdJCSGzPUfpf4H4Iqa3uF3U
         l1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764108874; x=1764713674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zAfcPBqPXedAJhplXHd1LAHPhzxCFkLFqsJc935i9XA=;
        b=GGhPiZ66mHI1QvxI2wxw0KCWCgU9AjrwG5hEKIb5QwDOVbQ0Ijxwklbq6wDtSRoSGK
         4uupXo714MsdVdm0YPDAXLVpcQ4ry80BbylCkYJ/RxX43vbxtWpQu+sXKpOSi22dLjkj
         ckK37jxtfPEOP4x46jkjjsAs93GmtofZ4LhEnoe71GXqG1rxlq+S1bX8U8ZzhFDZAVgc
         W2DA8i6brujNaQbZlWYX9eeR9lMs4197iS7lL4gxKa791UEpyx8UjRP5cAcMMail/DSP
         e5Q3ADn1dxhQ63Cpw/Nd4tx/7noM4ukq5k/b8/qjB59KN5xGbwatJKUBV40oMXU8UJAI
         ZfEQ==
X-Gm-Message-State: AOJu0YzxFZW6inRbotLgHQOa6xZouVYaygXsmquqhu4DAYzmt5TfVWTT
	iUxC8q37S7hhbGWrgCTPg6Vfv1YVRMmcQ4gF1BJQs2QuplgFgvMMQLMf
X-Gm-Gg: ASbGncvuxN9bIYV7jcENuokdDOTw+h3TeG3ZPw+i2PbvmSNGrsKRJkap8DzgV85UjVt
	bfSw/SFOgJIY1Ub8E2HIg6phftrymUG8SIAs7IrrEJLmsw9AZIQEM0/m0HUBnswAd2KIEuFvavm
	1vGfMDLDA0s2U2AYzklBirfMwH66/efb6Nn7oztK03ULahV6EFGFtCbF2+excbM7E/NBtHAakJK
	omIhAz3bVxsw2dukFcJp4ffVJJlweVnVojIJk1/9PAFlVO1KHJu3K4//WnnlxwUzbdp5ztOTCFL
	+fsraBGVS2fnlaipQwdcBMkfjlw6eoTyy6kJU+HJ0VVC+CWS44WCtIqAVbJK0Gjj1Fz+aw7vecu
	Q0LGSwPbfK7zhpeIdrzpOQGH7phZajSioRf/NDZGnIUVLDsUHlqGbDfyub0e7ZKSFB9rgmJrzwF
	MWbrVSysRy0QvN44YtKo2B8M3CJxH3u2HtQg==
X-Google-Smtp-Source: AGHT+IHeYijo6crepCkWnrnoOyYhRhPTzweFIbO0qTtkUZYTTZWSlat+fZmv0thBXenNU0jzXi2ysQ==
X-Received: by 2002:a05:6000:3102:b0:429:d565:d7df with SMTP id ffacd0b85a97d-42cc1d0ce28mr17375594f8f.42.1764108874051;
        Tue, 25 Nov 2025 14:14:34 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm37462121f8f.11.2025.11.25.14.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:14:33 -0800 (PST)
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
Subject: [PATCH 3/3] clk: renesas: r9a09g056: Add entries for the RSPIs
Date: Tue, 25 Nov 2025 22:14:20 +0000
Message-ID: <20251125221420.288809-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for the RSPI IPs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 1c6228b0544e..4b068199edde 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -281,6 +281,24 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(5, BIT(13))),
 	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18,
 						BUS_MSTOP(5, BIT(13))),
+	DEF_MOD("rspi_0_pclk",			CLK_PLLCLN_DIV8, 5, 4, 2, 20,
+						BUS_MSTOP(11, BIT(0))),
+	DEF_MOD("rspi_0_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 5, 2, 21,
+						BUS_MSTOP(11, BIT(0))),
+	DEF_MOD("rspi_0_tclk",			CLK_PLLCLN_DIV8, 5, 6, 2, 22,
+						BUS_MSTOP(11, BIT(0))),
+	DEF_MOD("rspi_1_pclk",			CLK_PLLCLN_DIV8, 5, 7, 2, 23,
+						BUS_MSTOP(11, BIT(1))),
+	DEF_MOD("rspi_1_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 8, 2, 24,
+						BUS_MSTOP(11, BIT(1))),
+	DEF_MOD("rspi_1_tclk",			CLK_PLLCLN_DIV8, 5, 9, 2, 25,
+						BUS_MSTOP(11, BIT(1))),
+	DEF_MOD("rspi_2_pclk",			CLK_PLLCLN_DIV8, 5, 10, 2, 26,
+						BUS_MSTOP(11, BIT(2))),
+	DEF_MOD("rspi_2_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 11, 2, 27,
+						BUS_MSTOP(11, BIT(2))),
+	DEF_MOD("rspi_2_tclk",			CLK_PLLCLN_DIV8, 5, 12, 2, 28,
+						BUS_MSTOP(11, BIT(2))),
 	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
 						BUS_MSTOP(3, BIT(14))),
 	DEF_MOD("i3c_0_pclkrw",			CLK_PLLCLN_DIV16, 9, 0, 4, 16,
@@ -437,6 +455,12 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
 	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
 	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
+	DEF_RST(7, 11, 3, 12),		/* RSPI_0_PRESETN */
+	DEF_RST(7, 12, 3, 13),		/* RSPI_0_TRESETN */
+	DEF_RST(7, 13, 3, 14),		/* RSPI_1_PRESETN */
+	DEF_RST(7, 14, 3, 15),		/* RSPI_1_TRESETN */
+	DEF_RST(7, 15, 3, 16),		/* RSPI_2_PRESETN */
+	DEF_RST(8, 0, 3, 17),		/* RSPI_2_TRESETN */
 	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
 	DEF_RST(9, 6, 4, 7),		/* I3C_0_PRESETN */
 	DEF_RST(9, 7, 4, 8),		/* I3C_0_TRESETN */
-- 
2.52.0


