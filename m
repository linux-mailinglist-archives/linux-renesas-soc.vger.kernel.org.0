Return-Path: <linux-renesas-soc+bounces-10290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8099BC161
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 00:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE4151C21D50
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 23:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1041FE0EE;
	Mon,  4 Nov 2024 23:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XD24IWSO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578AD1FCC73;
	Mon,  4 Nov 2024 23:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730762652; cv=none; b=Kujy0lOtUAkEUHxlIDFxqt1hK7LrOcKTw6UqhECT2XMBCCtkhxVaHmrOBObbWbqTDBjBopG3PhQGtv/MaqeRmaNpXIQI+2ov+eu0bZbU0wly1r+zVgPzEG46o9Ab0qHZ5ubo0YZyWY7UJ0ZkrUp5glSjvYGgUrgLWqlJsPv0cYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730762652; c=relaxed/simple;
	bh=rZouVETtZGhmAnogkgsoInTm3VK56+MqD1INFZtJg7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvGcBnkCGD/60HAZ85r0+PXLWoZdyGQf/y1NDPfvxNwcVOdk7Ctwj9rwvcpGwSM4EwU2AKXDai+ZUW/IuXnxFN3vDbRijQbc+PAjpQwHk8xVh3glqoveg22P6sPfO4F5VhT3IFRRD4TX8/ClEazAgQ7zLQMtupcH7ws+SunLJ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XD24IWSO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so36993735e9.2;
        Mon, 04 Nov 2024 15:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730762649; x=1731367449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wPIwM40bx1j+Mxn/pS1QOU+XOTEjS6lfX8Jfkg/CQY=;
        b=XD24IWSO/JvIDEZzfQyBmJLg1UavPBfKcK9zwx4nizqJM94wy62Fz5vKoqU2ui7b53
         ZN6OU3ShRuFQInUBxuYgRZ93zMk+CSezaWElyjYcZ1/3wpoBhx9SL1fqnnEPQ+EuZ/OG
         hn6MYQEPaOf26WNhpFdgeQS4139QJlLmrtTOSafCqtSvO6GkVZGETYYLKrbd+PoFBWRQ
         bybx1551dqdvolxpVdJxq1ongNkPX0kqA2t7Lr/jRxlWS0acxztGGLTBKdve8SkIytDD
         /xduN2MEOwkX5aL80BjeWxao/yXkiVYcUdOFuM9zDgQDgHUFVb9Y3bqSChGfTsXvNmSI
         eaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730762649; x=1731367449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wPIwM40bx1j+Mxn/pS1QOU+XOTEjS6lfX8Jfkg/CQY=;
        b=xFBGd58OxeRQPL0pREA8Gv2sR0Ke3/cvr97PfH3ebRx8ldvuCERo8HYteJafgEJNgi
         wjMzbId/jYm7BNqnJxGKG9ZD6SczastH1JgE4LjyZTAuNkG9pyE2MnnygibMWSXfl9X9
         6acSqQqtkEzsE/u4WoXtWT5jwBHbMaBPK5I6TpVY3+f0rKUdNXoVd2AVwAsIPxlsnGcu
         XFuB5Rmyh5UV6sJVycOKFYrNyLgZ2CW8cG/dq2uWwBoGPtJHvAgNEC7xelr3WwrmZtwz
         4v1CZdazONSXWtnCUjEYMc3ILn2jPNeMHunv01xLumNQmzjb569yN12D6rzTo8lmIeiG
         a6Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUzFTO6NcirAInmHLPapi2uhybLmKb7sAXiTp4z46KfOoQGZsi2u/7HX/pTGEBmsxLk6ecQvJIDT5E=@vger.kernel.org, AJvYcCV0FJhGbQOIn2qHKfmydtbRaNTONp54mxXaVkTuE/86cJ1w91CGfTwUytZZ1Gl2E/5aJe0zhn8891+RGpHe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn4l5XzmdCgIkuyVNAA2S7NXLLIYa4yTk/kYZl8H7H2xJpgZcc
	jAkIOnj/v8vgfLhXsCapXeAcSy/d1aN2LhOrXPYm/kdQDhExwUOK
X-Google-Smtp-Source: AGHT+IEUmKor5n8Xnoxg6kVUSU4uH5QfZKnYbpvS3fhkkbLuoae9ahdbdfdvKwCVrJhzPyqQj+hxkw==
X-Received: by 2002:a05:600c:1f82:b0:430:57f2:bae2 with SMTP id 5b1f17b1804b1-431bb9d14afmr176084295e9.23.1730762648610;
        Mon, 04 Nov 2024 15:24:08 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b000:5e71:8a91:bce5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab254sm167156675e9.3.2024.11.04.15.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 15:24:08 -0800 (PST)
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
Subject: [PATCH v2 2/2] clk: renesas: r9a09g057: Add support for PLLVDO, CRU clocks, and resets
Date: Mon,  4 Nov 2024 23:24:01 +0000
Message-ID: <20241104232401.290423-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241104232401.290423-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241104232401.290423-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the PLLVDO clock and its related CRU clocks and reset
entries in the r9a09g057 CPG driver. Introduce `CLK_PLLVDO` and associated
clocks like `CLK_PLLVDO_CRU0`, `CLK_PLLVDO_CRU1`, `CLK_PLLVDO_CRU2`, and
`CLK_PLLVDO_CRU3`, along with their corresponding dividers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
- Replaced r9a09g057-cpg with r9a09g057 in commit header
- Collected RB tag from Geert
---
 drivers/clk/renesas/r9a09g057-cpg.c | 45 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  6 ++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 7c4507fd34e6..5aa9710aa402 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -28,6 +28,7 @@ enum clk_ids {
 	CLK_PLLCLN,
 	CLK_PLLDTY,
 	CLK_PLLCA55,
+	CLK_PLLVDO,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV16,
@@ -35,7 +36,13 @@ enum clk_ids {
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
 	CLK_PLLDTY_ACPU,
+	CLK_PLLDTY_ACPU_DIV2,
 	CLK_PLLDTY_ACPU_DIV4,
+	CLK_PLLDTY_DIV16,
+	CLK_PLLVDO_CRU0,
+	CLK_PLLVDO_CRU1,
+	CLK_PLLVDO_CRU2,
+	CLK_PLLVDO_CRU3,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -49,6 +56,12 @@ static const struct clk_div_table dtable_1_8[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_4[] = {
+	{0, 2},
+	{1, 4},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -69,6 +82,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
+	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
@@ -78,7 +92,14 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
 
 	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
+	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
+	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
+
+	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
+	DEF_DDIV(".pllvdo_cru1", CLK_PLLVDO_CRU1, CLK_PLLVDO, CDDIV4_DIVCTL0, dtable_2_4),
+	DEF_DDIV(".pllvdo_cru2", CLK_PLLVDO_CRU2, CLK_PLLVDO, CDDIV4_DIVCTL1, dtable_2_4),
+	DEF_DDIV(".pllvdo_cru3", CLK_PLLVDO_CRU3, CLK_PLLVDO, CDDIV4_DIVCTL2, dtable_2_4),
 
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
@@ -133,6 +154,18 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 	DEF_MOD("sdhi_2_imclk2",		CLK_PLLCLN_DIV8, 10, 12, 5, 12),
 	DEF_MOD("sdhi_2_clk_hs",		CLK_PLLCLN_DIV2, 10, 13, 5, 13),
 	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14),
+	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18),
+	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19),
+	DEF_MOD("cru_0_pclk",			CLK_PLLDTY_DIV16, 13, 4, 6, 20),
+	DEF_MOD("cru_1_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 5, 6, 21),
+	DEF_MOD_NO_PM("cru_1_vclk",		CLK_PLLVDO_CRU1, 13, 6, 6, 22),
+	DEF_MOD("cru_1_pclk",			CLK_PLLDTY_DIV16, 13, 7, 6, 23),
+	DEF_MOD("cru_2_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 8, 6, 24),
+	DEF_MOD_NO_PM("cru_2_vclk",		CLK_PLLVDO_CRU2, 13, 9, 6, 25),
+	DEF_MOD("cru_2_pclk",			CLK_PLLDTY_DIV16, 13, 10, 6, 26),
+	DEF_MOD("cru_3_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 11, 6, 27),
+	DEF_MOD_NO_PM("cru_3_vclk",		CLK_PLLVDO_CRU3, 13, 12, 6, 28),
+	DEF_MOD("cru_3_pclk",			CLK_PLLDTY_DIV16, 13, 13, 6, 29),
 };
 
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
@@ -162,6 +195,18 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
+	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
+	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
+	DEF_RST(12, 8, 5, 25),		/* CRU_1_PRESETN */
+	DEF_RST(12, 9, 5, 26),		/* CRU_1_ARESETN */
+	DEF_RST(12, 10, 5, 27),		/* CRU_1_S_RESETN */
+	DEF_RST(12, 11, 5, 28),		/* CRU_2_PRESETN */
+	DEF_RST(12, 12, 5, 29),		/* CRU_2_ARESETN */
+	DEF_RST(12, 13, 5, 30),		/* CRU_2_S_RESETN */
+	DEF_RST(12, 14, 5, 31),		/* CRU_3_PRESETN */
+	DEF_RST(12, 15, 6, 0),		/* CRU_3_ARESETN */
+	DEF_RST(13, 0, 6, 1),		/* CRU_3_S_RESETN */
 };
 
 const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 0723df4c1134..ed8d2cad3260 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -33,12 +33,18 @@ struct ddiv {
 
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
+#define CPG_CDDIV3		(0x40C)
+#define CPG_CDDIV4		(0x410)
 
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
 #define CDDIV1_DIVCTL0	DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
 #define CDDIV1_DIVCTL1	DDIV_PACK(CPG_CDDIV1, 4, 2, 5)
 #define CDDIV1_DIVCTL2	DDIV_PACK(CPG_CDDIV1, 8, 2, 6)
 #define CDDIV1_DIVCTL3	DDIV_PACK(CPG_CDDIV1, 12, 2, 7)
+#define CDDIV3_DIVCTL3	DDIV_PACK(CPG_CDDIV3, 12, 1, 15)
+#define CDDIV4_DIVCTL0	DDIV_PACK(CPG_CDDIV4, 0, 1, 16)
+#define CDDIV4_DIVCTL1	DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
+#define CDDIV4_DIVCTL2	DDIV_PACK(CPG_CDDIV4, 8, 1, 18)
 
 /**
  * Definitions of CPG Core Clocks
-- 
2.43.0


