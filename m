Return-Path: <linux-renesas-soc+bounces-14190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B824BA58878
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 22:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B216188DEFE
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 21:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6B3221703;
	Sun,  9 Mar 2025 21:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CclIsDMo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D1E2206BE;
	Sun,  9 Mar 2025 21:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741554871; cv=none; b=lIE+oTjhFMFFpMScW/WWLN2CwgmS9s+8Bdm09cqcE0Sq6/K6H+WoxWR8T313daPC8r637bqaSvuYjszQ5ftXb9dpNWuHfTFqIuwDcFG+IBagbMUF6UMHvjz4F9zue26tFFwamyudmYXCL96o3KDMyKMf/nehMm9UPBr6RsDeCp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741554871; c=relaxed/simple;
	bh=R/BXmOQg30jl0nVpS/h0fNQD8heiMCgc156WqboVeJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TP8dFXZgTT7Bda/Z+bloWYgJK/VxjSR54pHsukyAc8xt2J5AFhCledkAlFAVBKthv6plGBh53zJmU6M2ie9FozkQshTT6TQyfUVcyz7K1g7XiY0IAyAD+MxKJ4MYsGtswAZw/2xogJ7Dvch4y1Qeud0s43bZFqLbz8eZZ6Bnjmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CclIsDMo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so20049195e9.0;
        Sun, 09 Mar 2025 14:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741554868; x=1742159668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAShnsPUhf9cglR8slP2JBk+kW7Nxb0DmVJJ6OxiJRs=;
        b=CclIsDMo8CYB8SaqdIUXTXjHkVvuzVvZ/RjkTrk9AnH3sQbtRIaDv/aF7z/Yk/LABX
         zM19gVa7UpKMeY1U88pMFzJveOWidDg+yMVppNjkkEwMCdBmV77chqkyRFCnJiK5Noew
         6LjTwbU+I5Qv7+yCPS9MxtLMbp+tZuZ3qD4u8uVi2Ao2223Qx5QBCvRYfsBysXAvjFY2
         gdA4L378pHW05wlOSP2d5eBSBbLuz012/mkNUNp5Z1etusyzICahqWTJ4YDPUCwm2zRQ
         lJuPkr595cr3gH63Q6rHsOztYISUOlNzT0YrT6js9K4sbtfUfJhX7k6u4E3MzWDhUWns
         K2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741554868; x=1742159668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAShnsPUhf9cglR8slP2JBk+kW7Nxb0DmVJJ6OxiJRs=;
        b=bhRmUXry1EQXTs1xQuP37exo6j0J1Q9EgDqgLXNFL4xWqgP6NExJEufyX6vNtd9gtq
         E5sdRDzCnLsJs9hgzXrHHLlUUSvbSKv8kiysNgPET29oZMyXJK6L56U09nQHtVFfhjAp
         A8n7femtEJY/M4S+hxkn98cZdP0I7zgG1IDTkWYaSuV2P9adCREOPu9ygXCFqV3gcUQQ
         1oWdFBFy6P/rQ6sRUI4LTSN3A59ybL13wgkPw10N5fBWHiRSEohe7/ASyonZ5vclBjzx
         Jq5873VhphizDS8u4PHCAOsid1SIxAn/2Shjek8F0ocxCfQU2InO6XiS49MAI2umIO33
         WOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBlq5jWYtgH3vYO7hvJDoac2f1vSce3r0XIt9CHttDtkBrJxjSKHEczrS1jL6B5N+FytVI0GsyC+w6US14d61NC9Y=@vger.kernel.org, AJvYcCVRF9hb5x4rexw2wjN61cnJ3PunGjephfP2Nzer8CIz2YTxUKE9r6iCJs3VoMcfWKO+cb6y0YJCRmUpG2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc1O28GqLCSGSvMKjfIooteX+pf6NzUegh+deo4ZfJAg5w649j
	RAG3f3x2XN/aS1VboUanIp/yuJwH9BsQKqZiyURiOJfsj6Q/lCh6
X-Gm-Gg: ASbGnct0YGVQpyWatOLG0ktbu3KHkW4q0KSpnFr0Cm6g+n47ehIsXAegkFjkXNKBhFY
	6SuuombISq03a+nr2Mgjc6DvVDGu/1FOO1oGAJH9WmJfU6rzVfag+IBOswV0y8t5whGqR6C8xVv
	2WPQVS0BmJACLlMZKxvnQ3iz/VU3PCoG4ywE/jpLgDgJH9YCd/gdZSDDTF16Cag7rkEICR7hJUR
	8SUbQImzkuJdnodOGndst3a9Pv9nrsarGHADdvmXSR3x+b4AVrodyO9kCEQmCvfcIQAWr9PDfxk
	PQ2J39NhD963n8jWyHMVVqn/4w7T8Qi8YaPyGjglk9hrMw4KiVJ2GgyLUXEU9w3VwhVhBYjKBQ=
	=
X-Google-Smtp-Source: AGHT+IHv+w3TxswrfWotUBiLv8XrK+czTV7uOweKd1xPSuLoak2fV6j2Wg9pUQtMgecpAh+agMYb/g==
X-Received: by 2002:a05:600c:218c:b0:43c:eae0:6264 with SMTP id 5b1f17b1804b1-43ceae0630dmr25742865e9.25.1741554867984;
        Sun, 09 Mar 2025 14:14:27 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:e951:ba7a:6a53:bac5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce70d13b4sm64443845e9.38.2025.03.09.14.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 14:14:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/5] clk: renesas: r9a09g057: Add clock and reset entries for GE3D
Date: Sun,  9 Mar 2025 21:14:02 +0000
Message-ID: <20250309211402.80886-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- Dropped reviewed tag from Geert as PLLGPU macro was added
---
 drivers/clk/renesas/r9a09g057-cpg.c | 14 ++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 031f332893a1..da20dbaead1f 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -29,6 +29,7 @@ enum clk_ids {
 	CLK_PLLDTY,
 	CLK_PLLCA55,
 	CLK_PLLVDO,
+	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV4,
@@ -47,6 +48,7 @@ enum clk_ids {
 	CLK_PLLVDO_CRU1,
 	CLK_PLLVDO_CRU2,
 	CLK_PLLVDO_CRU3,
+	CLK_PLLGPU_GEAR,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -87,6 +89,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
+	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
@@ -110,6 +113,8 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_DDIV(".pllvdo_cru2", CLK_PLLVDO_CRU2, CLK_PLLVDO, CDDIV4_DIVCTL1, dtable_2_4),
 	DEF_DDIV(".pllvdo_cru3", CLK_PLLVDO_CRU3, CLK_PLLVDO, CDDIV4_DIVCTL2, dtable_2_4),
 
+	DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G057_CA55_0_CORE_CLK0, CLK_PLLCA55,
@@ -238,6 +243,12 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
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
@@ -287,6 +298,9 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(12, 14, 5, 31),		/* CRU_3_PRESETN */
 	DEF_RST(12, 15, 6, 0),		/* CRU_3_ARESETN */
 	DEF_RST(13, 0, 6, 1),		/* CRU_3_S_RESETN */
+	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
+	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
+	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
 };
 
 const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 0a99a85433bd..2f59547e69bf 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -28,6 +28,7 @@ struct pll {
 	})
 
 #define PLLCA55		PLL_PACK(0x60, 1)
+#define PLLGPU		PLL_PACK(0x120, 1)
 
 /**
  * struct ddiv - Structure for dynamic switching divider
@@ -63,6 +64,7 @@ struct ddiv {
 #define CDDIV1_DIVCTL1	DDIV_PACK(CPG_CDDIV1, 4, 2, 5)
 #define CDDIV1_DIVCTL2	DDIV_PACK(CPG_CDDIV1, 8, 2, 6)
 #define CDDIV1_DIVCTL3	DDIV_PACK(CPG_CDDIV1, 12, 2, 7)
+#define CDDIV3_DIVCTL1	DDIV_PACK(CPG_CDDIV3, 4, 3, 13)
 #define CDDIV3_DIVCTL2	DDIV_PACK(CPG_CDDIV3, 8, 3, 14)
 #define CDDIV3_DIVCTL3	DDIV_PACK(CPG_CDDIV3, 12, 1, 15)
 #define CDDIV4_DIVCTL0	DDIV_PACK(CPG_CDDIV4, 0, 1, 16)
-- 
2.43.0


