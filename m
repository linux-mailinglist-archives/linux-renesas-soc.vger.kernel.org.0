Return-Path: <linux-renesas-soc+bounces-8424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BFC9623B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 11:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B88F31F23B2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 09:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42CD16BE35;
	Wed, 28 Aug 2024 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvF/Fm9i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEA216B38F;
	Wed, 28 Aug 2024 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837914; cv=none; b=FzHpXlVKWO5rFeTL3e76Y0DMJcw65rZSkxmF9084I56IL3ZPcOoAvX0dfccAnLOsoX30xLWsDzF6deSVATE/puBQtTn7sPUiq1uh/g3FKmT74zrMn/H5jOLVRgnWmMac7SrOfdRL4cvEu5PrLfLVEMcSmnWuZ4dP6zYkmb5NP5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837914; c=relaxed/simple;
	bh=9hegofktvKYkp2Stt9WoodHXYp4bhHgPTJR+m8FYyXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lO5b2wT2Ce8QlkJb5iT/V4HYWYQGeMOATr3PMISqhbgAnYJxuXMFn9PnRjS3mchrnS2nb1+EZD/S/hZtySECWfJ1j1Rc2jQhWsM2OzscD8/JCtVyxkP+hzX7ixp3LdmK7laoLng4Hf7iF5zCmsRAP1HxBNYcB8E/h8GcscmgxqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvF/Fm9i; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5bec4fc82b0so728294a12.1;
        Wed, 28 Aug 2024 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724837911; x=1725442711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XL4iCTuk2qMqaVeijx3eUtJKphnYa7zyQrEr475/sto=;
        b=TvF/Fm9ipI/ptOmnfw3WGz+LIBCHcjqpuvERKlsvPNn84MfGr+EBmlLQPJYO5uR0lg
         D/W0cWY5Il0MLJcDVxWKOBWET1JpmxXV7muENodLsHupggqQf9kNLFAkDfG7CjeGZHtV
         jtViNUbPkzodZWlOUb09GbGGTKrtfhMxds2E73d49U13+pETyfPJe54GNqhfYLheaB2J
         P9Wan37jE/ySX/LKgdolSsqxHiTNCeU/4L6pRcXgmnscEmXvFGLjgRVKPFQ0ylBjNClS
         EcWl93plX2G48FDtlXFfZRrpzigT5/gB3BKKx10+iw3NErW2jrPp8TdGuQbsFUaXv68c
         lb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837911; x=1725442711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XL4iCTuk2qMqaVeijx3eUtJKphnYa7zyQrEr475/sto=;
        b=huh8fN8UmxcwpjQ9v7OT5DuwblxqEQ3ox5flAOBBizNsX4hCTOEBJZBbXzA6H2v3VJ
         Qi9doqwPP9ghaytqhYlsndmz1uAqc7WeSNsyCJ/TeG83X5GzwPuUiAl3LBBhxiRwLVmB
         GYL5C/isUbeRkC1YQ3bxC9hYWYxt+7W+PFBqD/+wL1+h1uF7QXowMDM3RuP2s3y9voB1
         5hEwqhEwIyWGDUnJq7eNQahTrH1QKbOZyke2bInpoo1XvdWDjzLxPS/yJK9quWh9ImtL
         qsaDk48H9cidaUefAy8YLgdXYRXwZfWA9TXxFJiLM3JrbYyVorZRivxCtSBG9am6NVGb
         L43A==
X-Forwarded-Encrypted: i=1; AJvYcCUdiP0VLzojKEnedFPrfGxk2FXkEjIO47Rof00pdc4pv/edRnB7bKJhI4beJ5MWrkaz6iqzGn3PaGY6wwK9@vger.kernel.org, AJvYcCWtrN2dlpESGIFfLs24HG6EPbVo0rMgSpvCYkZ4NJh/LXrrB+bSyYtC87j+8fKbQ9wR4Mff0IGiKPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzns2i0/od+WMLdIZFnLkuXaGnhCf8CEEoLIfEWvvDJ1K14nLt1
	McrRmhgm3MdASe309gR4VGIoKgMZy4zG1/znWbCuDViR6FvQDqYC
X-Google-Smtp-Source: AGHT+IEtWQOPZftU6ReRHlVl/U1Yq1aO4TvX0Yp2ce9aRlyZWfL5SBduRoE+whERwB4OhpY0odciCA==
X-Received: by 2002:a17:907:72c7:b0:a86:a30f:4b00 with SMTP id a640c23a62f3a-a870aadd000mr174667466b.27.1724837910841;
        Wed, 28 Aug 2024 02:38:30 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:5ac5:89a0:20cd:42bc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e548967fsm222634366b.19.2024.08.28.02.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:38:30 -0700 (PDT)
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
Subject: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and reset entries for GTM/RIIC/SDHI/WDT
Date: Wed, 28 Aug 2024 10:38:22 +0100
Message-Id: <20240828093822.162855-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for GTM, RIIC, SDHI and WDT IP blocks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Moved DDIV_PACK() macro to patch #1

v1->v2
- Updated DDIV_PACK macro to accommodate width 
---
 drivers/clk/renesas/r9a09g057-cpg.c | 84 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  4 ++
 2 files changed, 88 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 9722b810e027..3ee32db5c0af 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -25,16 +25,31 @@ enum clk_ids {
 
 	/* PLL Clocks */
 	CLK_PLLCM33,
+	CLK_PLLCLN,
 	CLK_PLLDTY,
 	CLK_PLLCA55,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV16,
+	CLK_PLLCLN_DIV2,
+	CLK_PLLCLN_DIV8,
+	CLK_PLLCLN_DIV16,
+	CLK_PLLDTY_ACPU,
+	CLK_PLLDTY_ACPU_DIV4,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
 };
 
+static const struct clk_div_table dtable_2_64[] = {
+	{0, 2},
+	{1, 4},
+	{2, 8},
+	{3, 16},
+	{4, 64},
+	{0, 0},
+};
+
 static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
@@ -43,23 +58,92 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 
 	/* PLL Clocks */
 	DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
+	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
 
+	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
+	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
+	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
+
+	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
+	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_FIXED("iotop_0_shclk", R9A09G057_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
 };
 
 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
+	DEF_MOD("gtm_0_pclk",			CLK_PLLCM33_DIV16, 4, 3, 2, 3),
+	DEF_MOD("gtm_1_pclk",			CLK_PLLCM33_DIV16, 4, 4, 2, 4),
+	DEF_MOD("gtm_2_pclk",			CLK_PLLCLN_DIV16, 4, 5, 2, 5),
+	DEF_MOD("gtm_3_pclk",			CLK_PLLCLN_DIV16, 4, 6, 2, 6),
+	DEF_MOD("gtm_4_pclk",			CLK_PLLCLN_DIV16, 4, 7, 2, 7),
+	DEF_MOD("gtm_5_pclk",			CLK_PLLCLN_DIV16, 4, 8, 2, 8),
+	DEF_MOD("gtm_6_pclk",			CLK_PLLCLN_DIV16, 4, 9, 2, 9),
+	DEF_MOD("gtm_7_pclk",			CLK_PLLCLN_DIV16, 4, 10, 2, 10),
+	DEF_MOD("wdt_0_clkp",			CLK_PLLCM33_DIV16, 4, 11, 2, 11),
+	DEF_MOD("wdt_0_clk_loco",		CLK_QEXTAL, 4, 12, 2, 12),
+	DEF_MOD("wdt_1_clkp",			CLK_PLLCLN_DIV16, 4, 13, 2, 13),
+	DEF_MOD("wdt_1_clk_loco",		CLK_QEXTAL, 4, 14, 2, 14),
+	DEF_MOD("wdt_2_clkp",			CLK_PLLCLN_DIV16, 4, 15, 2, 15),
+	DEF_MOD("wdt_2_clk_loco",		CLK_QEXTAL, 5, 0, 2, 16),
+	DEF_MOD("wdt_3_clkp",			CLK_PLLCLN_DIV16, 5, 1, 2, 17),
+	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18),
 	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15),
+	DEF_MOD("riic_8_ckm",			CLK_PLLCM33_DIV16, 9, 3, 4, 19),
+	DEF_MOD("riic_0_ckm",			CLK_PLLCLN_DIV16, 9, 4, 4, 20),
+	DEF_MOD("riic_1_ckm",			CLK_PLLCLN_DIV16, 9, 5, 4, 21),
+	DEF_MOD("riic_2_ckm",			CLK_PLLCLN_DIV16, 9, 6, 4, 22),
+	DEF_MOD("riic_3_ckm",			CLK_PLLCLN_DIV16, 9, 7, 4, 23),
+	DEF_MOD("riic_4_ckm",			CLK_PLLCLN_DIV16, 9, 8, 4, 24),
+	DEF_MOD("riic_5_ckm",			CLK_PLLCLN_DIV16, 9, 9, 4, 25),
+	DEF_MOD("riic_6_ckm",			CLK_PLLCLN_DIV16, 9, 10, 4, 26),
+	DEF_MOD("riic_7_ckm",			CLK_PLLCLN_DIV16, 9, 11, 4, 27),
+	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3),
+	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4),
+	DEF_MOD("sdhi_0_clk_hs",		CLK_PLLCLN_DIV2, 10, 5, 5, 5),
+	DEF_MOD("sdhi_0_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 6, 5, 6),
+	DEF_MOD("sdhi_1_imclk",			CLK_PLLCLN_DIV8, 10, 7, 5, 7),
+	DEF_MOD("sdhi_1_imclk2",		CLK_PLLCLN_DIV8, 10, 8, 5, 8),
+	DEF_MOD("sdhi_1_clk_hs",		CLK_PLLCLN_DIV2, 10, 9, 5, 9),
+	DEF_MOD("sdhi_1_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 10, 5, 10),
+	DEF_MOD("sdhi_2_imclk",			CLK_PLLCLN_DIV8, 10, 11, 5, 11),
+	DEF_MOD("sdhi_2_imclk2",		CLK_PLLCLN_DIV8, 10, 12, 5, 12),
+	DEF_MOD("sdhi_2_clk_hs",		CLK_PLLCLN_DIV2, 10, 13, 5, 13),
+	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14),
 };
 
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
+	DEF_RST(6, 13, 2, 30),		/* GTM_0_PRESETZ */
+	DEF_RST(6, 14, 2, 31),		/* GTM_1_PRESETZ */
+	DEF_RST(6, 15, 3, 0),		/* GTM_2_PRESETZ */
+	DEF_RST(7, 0, 3, 1),		/* GTM_3_PRESETZ */
+	DEF_RST(7, 1, 3, 2),		/* GTM_4_PRESETZ */
+	DEF_RST(7, 2, 3, 3),		/* GTM_5_PRESETZ */
+	DEF_RST(7, 3, 3, 4),		/* GTM_6_PRESETZ */
+	DEF_RST(7, 4, 3, 5),		/* GTM_7_PRESETZ */
+	DEF_RST(7, 5, 3, 6),		/* WDT_0_RESET */
+	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
+	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
+	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
 	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
+	DEF_RST(9, 8, 4, 9),		/* RIIC_0_MRST */
+	DEF_RST(9, 9, 4, 10),		/* RIIC_1_MRST */
+	DEF_RST(9, 10, 4, 11),		/* RIIC_2_MRST */
+	DEF_RST(9, 11, 4, 12),		/* RIIC_3_MRST */
+	DEF_RST(9, 12, 4, 13),		/* RIIC_4_MRST */
+	DEF_RST(9, 13, 4, 14),		/* RIIC_5_MRST */
+	DEF_RST(9, 14, 4, 15),		/* RIIC_6_MRST */
+	DEF_RST(9, 15, 4, 16),		/* RIIC_7_MRST */
+	DEF_RST(10, 0, 4, 17),		/* RIIC_8_MRST */
+	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
+	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
+	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
 };
 
 const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 1c7a979ab790..1bd406c69015 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -31,6 +31,10 @@ struct ddiv {
 		.monbit = _monbit \
 	})
 
+#define CPG_CDDIV0		(0x400)
+
+#define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
+
 /**
  * Definitions of CPG Core Clocks
  *
-- 
2.34.1


