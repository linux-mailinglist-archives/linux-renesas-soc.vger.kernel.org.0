Return-Path: <linux-renesas-soc+bounces-7204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E3492BBF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 15:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BCA61F21848
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 13:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CE21891DE;
	Tue,  9 Jul 2024 13:52:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7A01891D4;
	Tue,  9 Jul 2024 13:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720533146; cv=none; b=uVmhHq/esG19mE7T6zwHNqjnEUEsrVKTgtb/9Fsd3JZ7fmhpjPJg9WWJTkbkCfHgRhysXcxUKefWxq9GULavrCo/woDWKaBu3KZ3t+3g+n7LJG7JDvhbodBfR5s8isO7iOcmZM0LsySi2yTMy9DQJpNd3z4tvRwC+rLDax138bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720533146; c=relaxed/simple;
	bh=KWREAaBshbHzdY5KUeCwljWRcn8rSKpJkzi9/7oUFjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nk8pM9BIQ0ufco8e/GmMhbIAPRaDHxhqb7WOCbaTnN+Tdae7GfFhj12CZ316PvguseBZsbbXTEynvunDAoQUnHpi8lM0kJ8XhbGb0kLiLNL3/hJ8bk5jWV80c5feavUaFRzsPFE28UeP6xhA0tibW5lVsBjkTdSrgv0ruEIM3Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,195,1716217200"; 
   d="scan'208";a="210808043"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jul 2024 22:52:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.130])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 687B843DEDAE;
	Tue,  9 Jul 2024 22:52:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 4/9] clk: renesas: r9a07g043: Add LCDC clock and reset entries
Date: Tue,  9 Jul 2024 14:51:42 +0100
Message-ID: <20240709135152.185042-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add LCDC clock and reset entries to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/clk/renesas/r9a07g043-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 16acc95f3c62..f1ff3b0cb83b 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -52,6 +52,8 @@ enum clk_ids {
 	CLK_PLL5,
 	CLK_PLL5_500,
 	CLK_PLL5_250,
+	CLK_PLL5_FOUTPOSTDIV,
+	CLK_DSI_DIV,
 #endif
 	CLK_PLL6,
 	CLK_PLL6_250,
@@ -120,6 +122,7 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_FIXED(".pll5", CLK_PLL5, CLK_EXTAL, 125, 1),
 	DEF_FIXED(".pll5_500", CLK_PLL5_500, CLK_PLL5, 1, 6),
 	DEF_FIXED(".pll5_250", CLK_PLL5_250, CLK_PLL5_500, 1, 2),
+	DEF_PLL5_FOUTPOSTDIV(".pll5_foutpostdiv", CLK_PLL5_FOUTPOSTDIV, CLK_EXTAL),
 #endif
 	DEF_FIXED(".pll6", CLK_PLL6, CLK_EXTAL, 125, 6),
 	DEF_FIXED(".pll6_250", CLK_PLL6_250, CLK_PLL6, 1, 2),
@@ -146,6 +149,8 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 #ifdef CONFIG_ARM64
 	DEF_FIXED("M2", R9A07G043_CLK_M2, CLK_PLL3_533, 1, 2),
 	DEF_FIXED("M2_DIV2", CLK_M2_DIV2, R9A07G043_CLK_M2, 1, 2),
+	DEF_DSI_DIV("DSI_DIV", CLK_DSI_DIV, CLK_PLL5_FOUTPOSTDIV, CLK_SET_RATE_PARENT),
+	DEF_FIXED("M3", R9A07G043_CLK_M3, CLK_DSI_DIV, 1, 1),
 #endif
 };
 
@@ -209,6 +214,12 @@ static const struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 				0x564, 2),
 	DEF_MOD("cru_aclk",     R9A07G043_CRU_ACLK, R9A07G043_CLK_M0,
 				0x564, 3),
+	DEF_COUPLED("lcdc_clka", R9A07G043_LCDC_CLK_A, R9A07G043_CLK_M0,
+				0x56c, 0),
+	DEF_COUPLED("lcdc_clkp", R9A07G043_LCDC_CLK_P, R9A07G043_CLK_ZT,
+				0x56c, 0),
+	DEF_MOD("lcdc_clkd",	R9A07G043_LCDC_CLK_D, R9A07G043_CLK_M3,
+				0x56c, 1),
 #endif
 	DEF_MOD("ssi0_pclk",	R9A07G043_SSI0_PCLK2, R9A07G043_CLK_P0,
 				0x570, 0),
@@ -309,6 +320,7 @@ static const struct rzg2l_reset r9a07g043_resets[] = {
 	DEF_RST(R9A07G043_CRU_CMN_RSTB, 0x864, 0),
 	DEF_RST(R9A07G043_CRU_PRESETN, 0x864, 1),
 	DEF_RST(R9A07G043_CRU_ARESETN, 0x864, 2),
+	DEF_RST(R9A07G043_LCDC_RESET_N, 0x86c, 0),
 #endif
 	DEF_RST(R9A07G043_SSI0_RST_M2_REG, 0x870, 0),
 	DEF_RST(R9A07G043_SSI1_RST_M2_REG, 0x870, 1),
-- 
2.43.0


