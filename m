Return-Path: <linux-renesas-soc+bounces-13252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D0AA39B45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 12:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3081F3B44FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 11:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2CB241125;
	Tue, 18 Feb 2025 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YH3SIp4i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E481723FC68;
	Tue, 18 Feb 2025 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879053; cv=none; b=dqTnpdKRPqt1qwUuAb3AJ6q+sqkIbAt+U/T2Y9MBUwhOvb6zXLq6c6qoCsYPNCfAcUvUBTexWOXlTJ7AB+0U6iYMinsoYUwOs1BQhlK71NtFFK0pjguU/y8NB7Xs/zKKOUZgyhDuwJtFK8MiUfqh5E3CswOcIZf7fXmeannhTQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879053; c=relaxed/simple;
	bh=HDFkPpu2whf5e4ZbNo5ysgFRPG5OFDIe4ivK0qObucs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpRqHH5eHLezX9MnUhBMKUiBdatizdpvngFB6BcvEh1CRRQ6X7LeNAVmjuD8FQrkwcepHPtBSDvdyVsPjGWx3UvLd4Vm1PWtnLJxdvT/5p12rM7Ffehzur/JUUjf+0AFKHDnrcyPM9YbMCv8jE/tFiyJQXPsLDSKy8Zv0acF7X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YH3SIp4i; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f3486062eso2330175f8f.0;
        Tue, 18 Feb 2025 03:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739879050; x=1740483850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUZiVpxC3Y62QC8DmKicnU4buz0UKyhm1mjU9qHoZsQ=;
        b=YH3SIp4iU+4T1ob+uqncP5grQlyKw9ausSh3knHTVCI++0AyTXDv/DzYXWQlkSAIvq
         0i17KXCzw+xZa5Cbfe9ki4yjESBYj8UIH4jhRLpmaIO7Q/RBtv9v3F73pGnWGbj7/kvS
         SrKEzl3g7RkETYQY96rIjoMeoQ1ufLnsTsjygxWZt4zE11eSzOn5UC6a23ELF3sXtUi0
         rUL9x+cYSF/DhLFlrawknS17sgfTvtwqaZcZfz5vfwC6VVFASZe3/f5LOLxoKYDJor8K
         QYLD3MXluV6XINLmJB3jyW/0LLOBXwH2trc6KI1u7ZQWiX4T/Ei77i1ugU3B/iqdD1M0
         OC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879050; x=1740483850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUZiVpxC3Y62QC8DmKicnU4buz0UKyhm1mjU9qHoZsQ=;
        b=kWgysuNUc8LVcR+vCXiz6NuvFlqtI2T49y9MXs6JAmyQpB+M1Hig7JUCUgpKJi342R
         rI29GrRg1KzAaQjdghojTXM9Cr92oJ/PhCGp7JCLPZlxPmbWFXlG4aLMeAgZdPwHb8C3
         mHgRzFIUaqh1s8a++izva3o+nvSokDBoRqqXqydMjHiwMkDC4gDyOyIX6GmO6EktWQk9
         /z/eZwUI7PJ4oCTjUSkWie5aCz30RC7yV8Ks5WNbLzsaVLupwN+usUeZ/TnfsoRsl0ig
         FXhNfM5fuK0p4evqZBIsZASjMawnLz2EpTP2Fw4fBU/KeMTkVsce/cYYTVaCuHNwW+J/
         DxPw==
X-Forwarded-Encrypted: i=1; AJvYcCUtTkry2rBQB7b6FQNBVjzeV3+xXwrbfohkKGmyJLroIYDsXqAKYNwQrMjYCC1Bhi60/pf3BaZ8OO8=@vger.kernel.org, AJvYcCXNs30KfuTqcKQQZ2i5qjFlY3zzLqCYfh/SOpVUcxD4CiuwN6z4yyNGsIff5bvkr4hLqbSCRMwchwowzNlQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyYwh6UqX1uuCj3fgxbTR0wskcOUSr67S9z+X9cB7asNJc2i4QG
	2VjuCzHa1VBur0vi5Az1JYyeEvR8MSkkkAf7kasQwff19DCZ8fkNSNPNXEVWU4w=
X-Gm-Gg: ASbGncu3GbB/LIuJIgWW8poJJTDDzCzinpzLmTUKpbU+x60eEGtgXxyfw6vV7HtfasJ
	GdUD56hc+JU8fcPfVr8T+f5nV3po5k+qZHE7MXp9PKLj5d+JCwZ4g4F6PEApaOfJrWFQJRN5alJ
	ERVCc7xRz9gWZjHeBt0lXiaJs6ZwVaYG5vTYL80jt6obnAwNnrrCcTt6PC4Z9EP6DCfTC5+olW6
	axai+WnjqHfaRXcpesxp3KDE91s9ABH5tYsdngQn2w6JOTtCuDnYzBH7GhMQldvXcUORB32geVi
	3OdKQYPrbT7M1BaMu5ExvlpvlCETaaCMvr5Lm1tG20Nl
X-Google-Smtp-Source: AGHT+IEJMpvTa53Rd9xyP9oxOhK0CDYWE6fwZIn5ZFmWV20UunU/DE4DNYBCYwukgD59i2tFBT/lYw==
X-Received: by 2002:a05:6000:bc9:b0:38f:2c04:7a7b with SMTP id ffacd0b85a97d-38f33f27555mr10070837f8f.14.1739879050127;
        Tue, 18 Feb 2025 03:44:10 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915146sm14997029f8f.56.2025.02.18.03.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:44:09 -0800 (PST)
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
Subject: [PATCH 3/3] clk: renesas: r9a09g057: Add clock and reset entries for GE3D
Date: Tue, 18 Feb 2025 11:43:53 +0000
Message-ID: <20250218114353.406684-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add PLLGPU along with the necessary clock and reset entries for GE3D.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 14 ++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 3705e18f66ad..ad1ed4ea1e01 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -29,6 +29,7 @@ enum clk_ids {
 	CLK_PLLDTY,
 	CLK_PLLCA55,
 	CLK_PLLVDO,
+	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV16,
@@ -43,6 +44,7 @@ enum clk_ids {
 	CLK_PLLVDO_CRU1,
 	CLK_PLLVDO_CRU2,
 	CLK_PLLVDO_CRU3,
+	CLK_PLLGPU_GEAR,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -83,6 +85,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
+	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLL_CONF(0x124)),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
@@ -101,6 +104,8 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_DDIV(".pllvdo_cru2", CLK_PLLVDO_CRU2, CLK_PLLVDO, CDDIV4_DIVCTL1, dtable_2_4),
 	DEF_DDIV(".pllvdo_cru3", CLK_PLLVDO_CRU3, CLK_PLLVDO, CDDIV4_DIVCTL2, dtable_2_4),
 
+	DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G057_CA55_0_CORE_CLK0, CLK_PLLCA55,
@@ -219,6 +224,12 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(7))),
 	DEF_MOD("cru_3_pclk",			CLK_PLLDTY_DIV16, 13, 13, 6, 29,
 						BUS_MSTOP(9, BIT(7))),
+	DEF_MOD("gpu_0_clk",			CLK_PLLGPU_GEAR, 15, 0, 7, 16,
+						BUS_MSTOP(3, BIT(4))),
+	DEF_MOD("gpu_0_axi_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
+						BUS_MSTOP(3, BIT(4))),
+	DEF_MOD("gpu_0_ace_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
+						BUS_MSTOP(3, BIT(4))),
 };
 
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
@@ -263,6 +274,9 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(12, 14, 5, 31),		/* CRU_3_PRESETN */
 	DEF_RST(12, 15, 6, 0),		/* CRU_3_ARESETN */
 	DEF_RST(13, 0, 6, 1),		/* CRU_3_S_RESETN */
+	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
+	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
+	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
 };
 
 const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 81f44b94f6d5..3d3d4839d6d5 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -43,6 +43,7 @@ struct ddiv {
 #define CDDIV1_DIVCTL1	DDIV_PACK(CPG_CDDIV1, 4, 2, 5)
 #define CDDIV1_DIVCTL2	DDIV_PACK(CPG_CDDIV1, 8, 2, 6)
 #define CDDIV1_DIVCTL3	DDIV_PACK(CPG_CDDIV1, 12, 2, 7)
+#define CDDIV3_DIVCTL1	DDIV_PACK(CPG_CDDIV3, 4, 3, 13)
 #define CDDIV3_DIVCTL3	DDIV_PACK(CPG_CDDIV3, 12, 1, 15)
 #define CDDIV4_DIVCTL0	DDIV_PACK(CPG_CDDIV4, 0, 1, 16)
 #define CDDIV4_DIVCTL1	DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
-- 
2.43.0


