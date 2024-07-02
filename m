Return-Path: <linux-renesas-soc+bounces-6974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD21B923A77
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 11:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71A4E281107
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 09:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6EA15572D;
	Tue,  2 Jul 2024 09:47:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5F513D8BA;
	Tue,  2 Jul 2024 09:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719913623; cv=none; b=lvsRix4gzzk01eDVIzWDCCXBKg+/TJbx/jGQm8vA4palA6Bvv9tUvTIr45tcwEKnwZsxZ4SJRa6MkHsJFI+CPzpvT5FBN/iZ0CPuOSbmrMcMcYf30xYsW+qA1H9rj0YUnNzJlTGiW+/azZpVTQ5LD8JdmLCdsPzI7qEDHbGFIXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719913623; c=relaxed/simple;
	bh=FfuV2OS5xT1ph2/ORBzP7nBXgiiZO8n7rjdhj/mWUUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GGCr9GX+GVhx/L02f01Sg6Om2yBc7SDIDKocGI2o8fCsPQel5rMyWlQq1YP6DkcerbxDthz1XBKJxqGkACX/8+Lixk3+th5AdUaejDEQHlSL455n3J6oPWYO3B01XRQeSUDP7nrWebKwxSl48BX1GzvXiqBOBv+3Tmr3lVsXsgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,178,1716217200"; 
   d="scan'208";a="213970934"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jul 2024 18:47:01 +0900
Received: from localhost.localdomain (unknown [10.226.93.72])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 35BF840031F9;
	Tue,  2 Jul 2024 18:46:55 +0900 (JST)
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
Subject: [PATCH 4/9] clk: renesas: r9a07g043: Add LCDC clock and reset entries
Date: Tue,  2 Jul 2024 10:46:14 +0100
Message-ID: <20240702094630.41485-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
References: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
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


