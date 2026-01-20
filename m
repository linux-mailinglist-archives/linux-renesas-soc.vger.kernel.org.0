Return-Path: <linux-renesas-soc+bounces-27127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHCQKtjDb2lsMQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 19:05:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E53DE4911C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 19:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B0619C35E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 15:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D936D478E47;
	Tue, 20 Jan 2026 15:06:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295DE466B44;
	Tue, 20 Jan 2026 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921593; cv=none; b=tG6N4JKcx4SXIeaVzsOB/o194UlyuUCII9YD5y3GH/NWFkfeVEXHFaU8YKvLo0ZbeiVWZk/CR/wUmkRO/P86t8aELVqI/LuDwF9tDkLEE4RgfzMwNpUkXK+2UiwpYeXwm/BR57j02cooTWUkH8nyVrxn/7EqnaenxZ+TKQK9Y70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921593; c=relaxed/simple;
	bh=KZwTxLHxL1Doc3YxcrFYNw6yDZhRFqBpXb+jaGyw/bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aj5zsycpfrnhBLZiPgsmW5v+7v35VT/x5U0ZF3Q/l0fyPI2KgcHpr4lavW7j3NOBi4Xp0pxtb9NTHo76I4QqikCtKP36u2ngHbsSaRW931CIkfZuxmjCK1rCUBUwO6MSnlSTkI6biXMJHYSpNf7uD+vDMz0yDBnnauKOOAbRo1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: YUnI0gulSLa/BzAAMZY4hg==
X-CSE-MsgGUID: vkMZCOxXR+anPv7ZJhBuAg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jan 2026 00:06:26 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3171D4022B00;
	Wed, 21 Jan 2026 00:06:21 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com,
	fabrizio.castro.jz@renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 3/5] clk: versaclock3: Add freerunning 32.768kHz clock support
Date: Tue, 20 Jan 2026 15:06:04 +0000
Message-ID: <20260120150606.7356-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : No valid SPF, No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27127-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: E53DE4911C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
v2 changes: None.

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


