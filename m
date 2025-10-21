Return-Path: <linux-renesas-soc+bounces-23395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 372D3BF7FBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 19:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AA8918A2C0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 17:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D058534E748;
	Tue, 21 Oct 2025 17:53:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB9634C81F;
	Tue, 21 Oct 2025 17:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761069219; cv=none; b=ObB2Lkk7c6GLsYKLk/+DIw1k9ej4iu2Ws1Ws/SDDZfeiMLQHNGkcgnRZvey8lRA/+rFQVKsftw3f1W9anTlGsStpQUFkifoha/maADWHTua4ZzaB/6l3ecamCew0O1Yj1ShA90CbfochjhiMIT5mR1eGWQ8/el/GORnXeKdVyLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761069219; c=relaxed/simple;
	bh=YQauE5nKmDe52AWOWItw3ZYniov/cEihMOi+IwGZVRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJinOpKGdM1SN6rfUM+3AFhs6UxjYopUAW6dMqHyMVclZhcavSIlI1LAAYtBxtaKBGJUiQPmrDbCb7UJKumj3Pcxp9E7wW4RRKjM3afiLZDWazDfp1moylaPZbu1cY/MfwW0saF9iGeTei+ljG6xHgYwvLqgNwWLtyE38rndJJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: IQKtWBbwQj6Ho87aSJp5ag==
X-CSE-MsgGUID: DPqetjnSQ4iZEwRryj977Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Oct 2025 02:53:30 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 730514031FFC;
	Wed, 22 Oct 2025 02:53:26 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: biju.das.jz@bp.renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/4] clk: versaclock3: Add freerunning 32.768kHz clock support
Date: Tue, 21 Oct 2025 17:53:10 +0000
Message-ID: <20251021175311.19611-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021175311.19611-1-ovidiu.panait.rb@renesas.com>
References: <20251021175311.19611-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Versa 3 clock generator has an internal 32.768kHz oscillator that can
be routed to the SE1, SE2 and SE3 outputs. This patch exposes it as a
fixed-rate clock ("vc3-clk-32k") and makes it available as a parent for
the SE1/SE2/SE3 muxes.

The 32.768kHz clock is only intended to be used when explicitly requested
(i.e. when a rate of exactly 32768Hz is set). Selecting it as a fallback
for other rates can cause issues, for example in audio configurations.

To enforce this, introduce a new helper function,
_vc3_clk_mux_determine_rate() which rejects configurations where the
32.768kHz parent would otherwise be chosen implicitly.

Two new fields are added to struct vc3_clk_data:
  - clk_32k_bitmsk: bit mask for selecting the 32.768kHz oscillator
  - clk_32k_index: index of the 32.768kHz clock in the mux parent list

They are used by clk_mux callbacks to select the appropriate parent clock.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/clk/clk-versaclock3.c | 85 +++++++++++++++++++++++++++++------
 1 file changed, 71 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index ebd9d75d7f55..b5df349f497d 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -61,8 +61,10 @@
 #define VC3_OUTPUT_CTR_DIV4_SRC_SEL	BIT(3)
 
 #define VC3_SE2_CTRL_REG0		0x1f
+#define VC3_SE2_CTRL_REG0_SE2_FREERUN_32K	BIT(7)
 
 #define VC3_SE3_DIFF1_CTRL_REG		0x21
+#define VC3_SE3_DIFF1_CTRL_REG_SE3_FREERUN_32K	BIT(7)
 #define VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL	BIT(6)
 
 #define VC3_DIFF1_CTRL_REG		0x22
@@ -72,6 +74,7 @@
 #define VC3_DIFF2_CTRL_REG_DIFF2_CLK_SEL	BIT(7)
 
 #define VC3_SE1_DIV4_CTRL		0x24
+#define VC3_SE1_DIV4_CTRL_SE1_FREERUN_32K	BIT(4)
 #define VC3_SE1_DIV4_CTRL_SE1_CLK_SEL	BIT(3)
 
 #define VC3_PLL1_VCO_MIN		300000000UL
@@ -83,6 +86,9 @@
 #define VC3_2_POW_16			(U16_MAX + 1)
 #define VC3_DIV_MASK(width)		((1 << (width)) - 1)
 
+#define VC3_CLK_32K_NAME		"vc3-clk-32k"
+#define VC3_CLK_32K_FREQ		32768
+
 enum vc3_pfd_mux {
 	VC3_PFD2_MUX,
 	VC3_PFD3_MUX,
@@ -134,6 +140,9 @@ enum vc3_clk_mux {
 struct vc3_clk_data {
 	u8 offs;
 	u8 bitmsk;
+
+	u8 clk_32k_bitmsk;
+	u8 clk_32k_index;
 };
 
 struct vc3_pfd_data {
@@ -213,6 +222,7 @@ static const struct clk_div_table div3_divs[] = {
 	{}
 };
 
+static struct clk_hw *clk_32k;
 static struct clk_hw *clk_out[6];
 
 static u8 vc3_pfd_mux_get_parent(struct clk_hw *hw)
@@ -549,19 +559,40 @@ static const struct clk_ops vc3_div_ops = {
 	.set_rate = vc3_div_set_rate,
 };
 
+static int _vc3_clk_mux_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
+{
+	bool is_32k_req = (req->rate == VC3_CLK_32K_FREQ);
+	struct clk_rate_request tmp_req;
+	int ret;
+
+	clk_hw_init_rate_request(hw, &tmp_req, req->rate);
+
+	ret = clk_mux_determine_rate_flags(hw, &tmp_req, CLK_SET_RATE_PARENT);
+	if (ret)
+		return ret;
+
+	/* Select the 32.768 kHz parent only when explicitly requested. */
+	if ((tmp_req.best_parent_rate == VC3_CLK_32K_FREQ) && !is_32k_req)
+		return -EINVAL;
+
+	memcpy(req, &tmp_req, sizeof(*req));
+
+	return 0;
+}
+
 static int vc3_clk_mux_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req)
 {
 	int frc;
 
-	if (clk_mux_determine_rate_flags(hw, req, CLK_SET_RATE_PARENT)) {
+	if (_vc3_clk_mux_determine_rate(hw, req)) {
 		/* The below check is equivalent to (best_parent_rate/rate) */
 		if (req->best_parent_rate >= req->rate) {
 			frc = DIV_ROUND_CLOSEST_ULL(req->best_parent_rate,
 						    req->rate);
 			req->rate *= frc;
-			return clk_mux_determine_rate_flags(hw, req,
-							    CLK_SET_RATE_PARENT);
+			return _vc3_clk_mux_determine_rate(hw, req);
 		}
 	}
 
@@ -576,6 +607,9 @@ static u8 vc3_clk_mux_get_parent(struct clk_hw *hw)
 
 	regmap_read(vc3->regmap, clk_mux->offs, &val);
 
+	if (clk_mux->clk_32k_bitmsk && !(val & clk_mux->clk_32k_bitmsk))
+		return clk_mux->clk_32k_index;
+
 	return !!(val & clk_mux->bitmsk);
 }
 
@@ -583,9 +617,15 @@ static int vc3_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
 	const struct vc3_clk_data *clk_mux = vc3->data;
+	unsigned int bitmsk = clk_mux->clk_32k_bitmsk;
+	unsigned int val = 0;
+
+	if (index != clk_mux->clk_32k_index) {
+		bitmsk |= clk_mux->bitmsk;
+		val = clk_mux->clk_32k_bitmsk | (index ? clk_mux->bitmsk : 0);
+	}
 
-	return regmap_update_bits(vc3->regmap, clk_mux->offs, clk_mux->bitmsk,
-				  index ? clk_mux->bitmsk : 0);
+	return regmap_update_bits(vc3->regmap, clk_mux->offs, bitmsk, val);
 }
 
 static const struct clk_ops vc3_clk_mux_ops = {
@@ -900,18 +940,21 @@ static struct vc3_hw_data clk_div[] = {
 	}
 };
 
-static const struct clk_parent_data clk_mux_parent_data[][2] = {
+static const struct clk_parent_data clk_mux_parent_data[][3] = {
 	[VC3_SE1_MUX] = {
 		{ .hw = &clk_div[VC3_DIV5].hw },
-		{ .hw = &clk_div[VC3_DIV4].hw }
+		{ .hw = &clk_div[VC3_DIV4].hw },
+		{ .name = VC3_CLK_32K_NAME, .index = -1 }
 	},
 	[VC3_SE2_MUX] = {
 		{ .hw = &clk_div[VC3_DIV5].hw },
-		{ .hw = &clk_div[VC3_DIV4].hw }
+		{ .hw = &clk_div[VC3_DIV4].hw },
+		{ .name = VC3_CLK_32K_NAME, .index = -1 }
 	},
 	[VC3_SE3_MUX] = {
 		{ .hw = &clk_div[VC3_DIV2].hw },
-		{ .hw = &clk_div[VC3_DIV4].hw }
+		{ .hw = &clk_div[VC3_DIV4].hw },
+		{ .name = VC3_CLK_32K_NAME, .index = -1 }
 	},
 	[VC3_DIFF1_MUX] = {
 		{ .hw = &clk_div[VC3_DIV1].hw },
@@ -927,38 +970,44 @@ static struct vc3_hw_data clk_mux[] = {
 	[VC3_SE1_MUX] = {
 		.data = &(struct vc3_clk_data) {
 			.offs = VC3_SE1_DIV4_CTRL,
-			.bitmsk = VC3_SE1_DIV4_CTRL_SE1_CLK_SEL
+			.bitmsk = VC3_SE1_DIV4_CTRL_SE1_CLK_SEL,
+			.clk_32k_bitmsk = VC3_SE1_DIV4_CTRL_SE1_FREERUN_32K,
+			.clk_32k_index = 2
 		},
 		.hw.init = &(struct clk_init_data) {
 			.name = "se1_mux",
 			.ops = &vc3_clk_mux_ops,
 			.parent_data = clk_mux_parent_data[VC3_SE1_MUX],
-			.num_parents = 2,
+			.num_parents = 3,
 			.flags = CLK_SET_RATE_PARENT
 		}
 	},
 	[VC3_SE2_MUX] = {
 		.data = &(struct vc3_clk_data) {
 			.offs = VC3_SE2_CTRL_REG0,
+			.clk_32k_bitmsk = VC3_SE2_CTRL_REG0_SE2_FREERUN_32K,
+			.clk_32k_index = 2
 		},
 		.hw.init = &(struct clk_init_data) {
 			.name = "se2_mux",
 			.ops = &vc3_clk_mux_ops,
 			.parent_data = clk_mux_parent_data[VC3_SE2_MUX],
-			.num_parents = 2,
+			.num_parents = 3,
 			.flags = CLK_SET_RATE_PARENT
 		}
 	},
 	[VC3_SE3_MUX] = {
 		.data = &(struct vc3_clk_data) {
 			.offs = VC3_SE3_DIFF1_CTRL_REG,
-			.bitmsk = VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL
+			.bitmsk = VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL,
+			.clk_32k_bitmsk = VC3_SE3_DIFF1_CTRL_REG_SE3_FREERUN_32K,
+			.clk_32k_index = 2
 		},
 		.hw.init = &(struct clk_init_data) {
 			.name = "se3_mux",
 			.ops = &vc3_clk_mux_ops,
 			.parent_data = clk_mux_parent_data[VC3_SE3_MUX],
-			.num_parents = 2,
+			.num_parents = 3,
 			.flags = CLK_SET_RATE_PARENT
 		}
 	},
@@ -1038,6 +1087,14 @@ static int vc3_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	/* Register fixed 32.768kHz clock */
+	clk_32k = devm_clk_hw_register_fixed_rate(dev, VC3_CLK_32K_NAME, NULL,
+						  0, VC3_CLK_32K_FREQ);
+	if (IS_ERR(clk_32k))
+		return dev_err_probe(dev, PTR_ERR(clk_32k),
+				     "Failed to register %dHz fixed clock\n",
+				     VC3_CLK_32K_FREQ);
+
 	/* Register pfd muxes */
 	for (i = 0; i < ARRAY_SIZE(clk_pfd_mux); i++) {
 		clk_pfd_mux[i].regmap = regmap;
-- 
2.51.0


