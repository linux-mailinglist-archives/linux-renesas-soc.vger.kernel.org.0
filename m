Return-Path: <linux-renesas-soc+bounces-19469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6024FAFF35E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 22:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1CC97AA3DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 20:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041E623B63F;
	Wed,  9 Jul 2025 20:56:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB7622F76B;
	Wed,  9 Jul 2025 20:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752094588; cv=none; b=l5u7jDUx5oK50/dTAKvIrEntaXGvp6x3qMOF/mxxggVb1boC6CrMiQWFCYEg/g/ABZ27mn+4WPcvJxVkt8bnN999n1CsrH47Sufl35gLAuAPvV6zQbNtOa71+hd8YCR0hzVPUiBUq4B155Zkutyi32odyaX+Hiv5h/RgkUqxrQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752094588; c=relaxed/simple;
	bh=8P3wjyYnbk9iG6pA9hvQcDMXirjuAeRm8tiDepNXEGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTcoocBDmiayYKwUUOJaEAc+9pAMZDPSbHU+GVFiDXoroJsC/6tvie5NA2CJUlFh8RBbcTsChzWgqnb7yH0U5uQRHl5+cKeLl/TpdLkuWSF/Mod1ytwMg8tJNayfowLYUQtxOolQdZdAvn/qvzVmyFwGZlXsqyK8MQqd7wxLQs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: M9H6feVsSm+aoGCRh1p6JA==
X-CSE-MsgGUID: /+Q9Iq1PR2+wIsrkguzfzQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jul 2025 05:56:19 +0900
Received: from lenovo-p330.. (unknown [132.158.152.96])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C0EC84095590;
	Thu, 10 Jul 2025 05:56:15 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hien Huynh <hien.huynh.px@renesas.com>,
	Nghia Vo <nghia.vo.zn@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
Date: Wed,  9 Jul 2025 16:55:31 -0400
Message-ID: <20250709205532.747596-2-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709205532.747596-1-chris.brandt@renesas.com>
References: <20250709205532.747596-1-chris.brandt@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the limited MIPI clock calculations to a full range of settings
based on math including H/W limitation validation.
Since the required DSI division setting must be specified from external
sources before calculations, expose a new API to set it.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 113 +++++++++++++++++++++++++++++---
 include/linux/clk/renesas.h     |   4 ++
 2 files changed, 107 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a8628f64a03b..317e50f5b967 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -68,6 +68,19 @@
 
 #define MAX_VCLK_FREQ		(148500000)
 
+#define PLL5_FOUTVCO_MIN	800000000
+#define PLL5_FOUTVCO_MAX	3000000000
+#define PLL5_POSTDIV_MIN	1
+#define PLL5_POSTDIV_MAX	7
+#define PLL5_POSTDIV_DEF	1
+#define PLL5_REFDIV_MIN		1
+#define PLL5_REFDIV_MAX		2
+#define PLL5_REFDIV_DEF		1
+#define PLL5_INTIN_MIN		20
+#define PLL5_INTIN_MAX		320
+#define PLL5_INTIN_DEF		125
+#define PLL5_FRACIN_DEF		0
+
 /**
  * struct clk_hw_data - clock hardware data
  * @hw: clock hw
@@ -123,6 +136,9 @@ struct rzg2l_pll5_param {
 	u8 pl5_spread;
 };
 
+/* Required division ratio for the MIPI clock */
+int dsi_div_ab;
+
 struct rzg2l_pll5_mux_dsi_div_param {
 	u8 clksrc;
 	u8 dsi_div_a;
@@ -548,24 +564,93 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
 }
 
 static unsigned long
-rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
+rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
+			       struct rzg2l_pll5_param *params,
 			       unsigned long rate)
 {
 	unsigned long foutpostdiv_rate, foutvco_rate;
+	u8 div = 1;
+	bool found = 0;
+	int a, b;
+
+	if (priv->mux_dsi_div_params.clksrc)
+		div = 2;
+
+	/* Calculate the DIV_DSI_A and DIV_DSI_B based on the final DIV DSI */
+	for (a = 0; a < 4; a++) {
+		for (b = 0; b < 16; b++) {
+			if (((1 << a) * (b + 1)) == dsi_div_ab) {
+				priv->mux_dsi_div_params.dsi_div_a = a;
+				priv->mux_dsi_div_params.dsi_div_b = b;
+
+				goto found_dsi_div;
+			}
+		}
+	}
+
+found_dsi_div:
+	/*
+	 * Below conditions must be set for PLL5 parameters:
+	 * - REFDIV must be between 1 and 2.
+	 * - POSTDIV1/2 must be between 1 and 7.
+	 * - INTIN must be between 20 and 320.
+	 * - FOUTVCO must be between 800MHz and 3000MHz.
+	 */
+	for (params->pl5_postdiv1 = PLL5_POSTDIV_MIN;
+	     params->pl5_postdiv1 < PLL5_POSTDIV_MAX + 1;
+	     params->pl5_postdiv1++) {
+		for (params->pl5_postdiv2 = PLL5_POSTDIV_MIN;
+		     params->pl5_postdiv2 < PLL5_POSTDIV_MAX + 1;
+		     params->pl5_postdiv2++) {
+			foutvco_rate = rate * ((1 << priv->mux_dsi_div_params.dsi_div_a) *
+					       (priv->mux_dsi_div_params.dsi_div_b + 1)) *
+					      div * params->pl5_postdiv1 * params->pl5_postdiv2;
+			if (foutvco_rate < PLL5_FOUTVCO_MIN + 1 ||
+			    foutvco_rate > PLL5_FOUTVCO_MAX - 1)
+				continue;
+
+			for (params->pl5_refdiv = PLL5_REFDIV_MIN;
+			     params->pl5_refdiv < PLL5_REFDIV_MAX + 1;
+			     params->pl5_refdiv++) {
+				params->pl5_intin = (foutvco_rate * params->pl5_refdiv) /
+						    (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
+				if (params->pl5_intin < PLL5_INTIN_MIN + 1 ||
+				    params->pl5_intin > PLL5_INTIN_MAX - 1)
+					continue;
+				params->pl5_fracin = div_u64(((u64)
+						     (foutvco_rate * params->pl5_refdiv) %
+						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
+						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
+				found = 1;
+				goto found_clk;
+			}
+		}
+	}
+
+found_clk:
+	if (!found) {
+		params->pl5_intin = PLL5_INTIN_DEF;
+		params->pl5_fracin = PLL5_FRACIN_DEF;
+		params->pl5_refdiv = PLL5_REFDIV_DEF;
+		params->pl5_postdiv1 = PLL5_POSTDIV_DEF;
+		params->pl5_postdiv2 = PLL5_POSTDIV_DEF;
+	}
 
-	params->pl5_intin = rate / MEGA;
-	params->pl5_fracin = div_u64(((u64)rate % MEGA) << 24, MEGA);
-	params->pl5_refdiv = 2;
-	params->pl5_postdiv1 = 1;
-	params->pl5_postdiv2 = 1;
 	params->pl5_spread = 0x16;
 
 	foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
-					   (params->pl5_intin << 24) + params->pl5_fracin),
-			       params->pl5_refdiv) >> 24;
+		       (params->pl5_intin << 24) + params->pl5_fracin),
+		       params->pl5_refdiv) >> 24;
 	foutpostdiv_rate = DIV_ROUND_CLOSEST_ULL(foutvco_rate,
 						 params->pl5_postdiv1 * params->pl5_postdiv2);
 
+	/* If foutvco is above 1.5GHz, change parent and recalculate */
+	if (priv->mux_dsi_div_params.clksrc && (foutvco_rate > 1500000000)) {
+		priv->mux_dsi_div_params.clksrc = 0;
+		dsi_div_ab *= 2;
+		return rzg2l_cpg_get_foutpostdiv_rate(priv, params, rate);
+	}
+
 	return foutpostdiv_rate;
 }
 
@@ -598,7 +683,7 @@ static unsigned long rzg2l_cpg_get_vclk_parent_rate(struct clk_hw *hw,
 	struct rzg2l_pll5_param params;
 	unsigned long parent_rate;
 
-	parent_rate = rzg2l_cpg_get_foutpostdiv_rate(&params, rate);
+	parent_rate = rzg2l_cpg_get_foutpostdiv_rate(priv, &params, rate);
 
 	if (priv->mux_dsi_div_params.clksrc)
 		parent_rate /= 2;
@@ -617,6 +702,12 @@ static int rzg2l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
+void rzg2l_cpg_dsi_div_set_divider(int divider)
+{
+	dsi_div_ab = divider;
+}
+EXPORT_SYMBOL_GPL(rzg2l_cpg_dsi_div_set_divider);
+
 static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
 				      unsigned long rate,
 				      unsigned long parent_rate)
@@ -850,7 +941,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 
 	vclk_rate = rzg2l_cpg_get_vclk_rate(hw, rate);
 	sipll5->foutpostdiv_rate =
-		rzg2l_cpg_get_foutpostdiv_rate(&params, vclk_rate);
+		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
 
 	/* Put PLL5 into standby mode */
 	writel(CPG_SIPLL5_STBY_RESETB_WEN, priv->base + CPG_SIPLL5_STBY);
@@ -940,6 +1031,8 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
 	priv->mux_dsi_div_params.clksrc = 1; /* Use clk src 1 for DSI */
 	priv->mux_dsi_div_params.dsi_div_a = 1; /* Divided by 2 */
 	priv->mux_dsi_div_params.dsi_div_b = 2; /* Divided by 3 */
+	dsi_div_ab = (1 << priv->mux_dsi_div_params.dsi_div_a) *
+		     (priv->mux_dsi_div_params.dsi_div_b + 1);
 
 	return clk_hw->clk;
 }
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 0ebbe2f0b45e..da70afa02eaf 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -33,3 +33,7 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
 #define cpg_mssr_detach_dev	NULL
 #endif
 #endif
+
+#ifdef CONFIG_CLK_RZG2L
+void rzg2l_cpg_dsi_div_set_divider(int divider);
+#endif
-- 
2.49.0


