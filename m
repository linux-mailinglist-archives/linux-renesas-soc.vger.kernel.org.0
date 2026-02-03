Return-Path: <linux-renesas-soc+bounces-27846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHP4OsL9gWlbNgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:53:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B07E3DA2C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5367303E39E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 13:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23723A0B13;
	Tue,  3 Feb 2026 13:52:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6891C3A0B21;
	Tue,  3 Feb 2026 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126735; cv=none; b=sg8omJk+TzSGAfaXTucaFxG4xVkhqhkPIkeJZ6Z7aj4bR5Aw97Siq+ZmYF58oF6RQIpdcSkScwtcDMdUgpV3HvsF/w6aUpDkJyROebGcJI4C8a5FfL61Ic2xR2c/8+M8NbWea77pfLbswihyxvN7txQtmfuYx89mtkIXIROTMyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126735; c=relaxed/simple;
	bh=PwDS8Wf3zyu9YzfIDDnyUz8/Xcr6LwVp3uvlf76JYTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pi1UgiV2Ayrl3gJw7ON5SApylBA+D7Mva4Q6YppA4rC0P6LqSlDeoVjM4NuNr7kRbC5lyyJyCwt0rTrM9nUy2SytrIVtESWtsCY5dQk0FwKHBc7L4UVltYEU0bHM3Q3iTLojAvB5a5OycNsHfHXRzEVjALZ5vQMvjEJMRXsfu44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: YWUHCO2QQyWMOxdKhxjVtQ==
X-CSE-MsgGUID: jE+QRBB7SDCzgn1xtr+z1w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Feb 2026 22:52:13 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1EBA1421BAE7;
	Tue,  3 Feb 2026 22:52:08 +0900 (JST)
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
Subject: [PATCH v3 6/8] clk: versaclock3: Add freerunning 32.768kHz clock support
Date: Tue,  3 Feb 2026 13:51:37 +0000
Message-ID: <20260203135139.28151-7-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203135139.28151-1-ovidiu.panait.rb@renesas.com>
References: <20260203135139.28151-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27846-lists,linux-renesas-soc=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: B07E3DA2C7
X-Rspamd-Action: no action

The Versa 3 clock generator has an internal 32.768kHz oscillator that can
be routed to the SE1, SE2 and SE3 outputs. This patch exposes it as a
fixed-rate clock and makes it available as a parent for the SE1/SE2/SE3
muxes.

The 32.768kHz clock is only intended to be used when explicitly requested
(i.e. when a rate of exactly 32768Hz is set). Selecting it as a fallback
for other rates can cause issues, for example in audio configurations.

To enforce this, introduce a new helper function,
_vc3_clk_mux_determine_rate() which rejects configurations where the
32.768kHz parent would otherwise be chosen implicitly.

One new field is added to struct vc3_clk_data - clk_32k_bitmsk, which
is the bit mask used for selecting the 32.768kHz oscillator as output.
It is used by clk_mux callbacks to select the appropriate parent clock.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v3 changes:
- Rebased the patch to match the new clock registration logic and dropped
  the 32k clock parent index number (clk_32k_index).

 drivers/clk/clk-versaclock3.c | 96 +++++++++++++++++++++++++++++++----
 1 file changed, 86 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 56285c9a48ce..6f4c0e0af7d7 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -69,8 +69,10 @@
 #define VC3_OUTPUT_CTR_DIV4_SRC_SEL	BIT(3)
 
 #define VC3_SE2_CTRL_REG0		0x1f
+#define VC3_SE2_CTRL_REG0_SE2_FREERUN_32K	BIT(7)
 
 #define VC3_SE3_DIFF1_CTRL_REG		0x21
+#define VC3_SE3_DIFF1_CTRL_REG_SE3_FREERUN_32K	BIT(7)
 #define VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL	BIT(6)
 
 #define VC3_DIFF1_CTRL_REG		0x22
@@ -80,6 +82,7 @@
 #define VC3_DIFF2_CTRL_REG_DIFF2_CLK_SEL	BIT(7)
 
 #define VC3_SE1_DIV4_CTRL		0x24
+#define VC3_SE1_DIV4_CTRL_SE1_FREERUN_32K	BIT(4)
 #define VC3_SE1_DIV4_CTRL_SE1_CLK_SEL	BIT(3)
 
 #define VC3_PLL1_VCO_MIN		300000000UL
@@ -91,6 +94,8 @@
 #define VC3_2_POW_16			(U16_MAX + 1)
 #define VC3_DIV_MASK(width)		((1 << (width)) - 1)
 
+#define VC3_CLK_32K_FREQ		32768
+
 #define VC3_CLK_PARENT(t, i)		{ .type = VC3_CLK_##t, .idx = (i) }
 
 enum vc3_pfd_mux {
@@ -149,6 +154,7 @@ enum vc3_clk_type {
 	VC3_CLK_DIV_MUX,
 	VC3_CLK_DIV,
 	VC3_CLK_CLK_MUX,
+	VC3_CLK_32K,
 };
 
 struct vc3_clk_parent {
@@ -164,6 +170,7 @@ struct vc3_parent_info {
 struct vc3_clk_data {
 	u8 offs;
 	u8 bitmsk;
+	u8 clk_32k_bitmsk;
 };
 
 struct vc3_pfd_data {
@@ -217,6 +224,7 @@ struct vc3_device_data {
 	struct vc3_hw_data clk_div_mux[VC3_DIV_MUX_NUM];
 	struct vc3_hw_data clk_div[VC3_DIV_NUM];
 	struct vc3_hw_data clk_mux[VC3_CLK_MUX_NUM];
+	struct clk_hw *clk_32k;
 	struct clk_hw *clk_out[VC3_CLK_OUT_NUM];
 };
 
@@ -587,19 +595,52 @@ static const struct clk_ops vc3_div_ops = {
 	.set_rate = vc3_div_set_rate,
 };
 
+static int vc3_get_32k_parent_index(const struct vc3_hw_data *hw_data)
+{
+	const struct vc3_parent_info *pinfo = hw_data->parent_info;
+
+	for (int i = 0; i < pinfo->num_parents; i++) {
+		if (pinfo->parents[i].type == VC3_CLK_32K)
+			return i;
+	}
+
+	return -1;
+}
+
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
 
@@ -610,10 +651,15 @@ static u8 vc3_clk_mux_get_parent(struct clk_hw *hw)
 {
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
 	const struct vc3_clk_data *clk_mux = vc3->data;
+	int clk_32k_index;
 	u32 val;
 
 	regmap_read(vc3->regmap, clk_mux->offs, &val);
 
+	clk_32k_index = vc3_get_32k_parent_index(vc3);
+	if (clk_32k_index >= 0 && !(val & clk_mux->clk_32k_bitmsk))
+		return clk_32k_index;
+
 	return !!(val & clk_mux->bitmsk);
 }
 
@@ -621,9 +667,17 @@ static int vc3_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
 	const struct vc3_clk_data *clk_mux = vc3->data;
+	unsigned int bitmsk = clk_mux->clk_32k_bitmsk;
+	unsigned int val = 0;
+	int clk_32k_index;
+
+	clk_32k_index = vc3_get_32k_parent_index(vc3);
+	if (index != clk_32k_index) {
+		bitmsk |= clk_mux->bitmsk;
+		val = clk_mux->clk_32k_bitmsk | (index ? clk_mux->bitmsk : 0);
+	}
 
-	return regmap_update_bits(vc3->regmap, clk_mux->offs, clk_mux->bitmsk,
-				  index ? clk_mux->bitmsk : 0);
+	return regmap_update_bits(vc3->regmap, clk_mux->offs, bitmsk, val);
 }
 
 static const struct clk_ops vc3_clk_mux_ops = {
@@ -990,22 +1044,25 @@ static const struct vc3_parent_info clk_mux_parents[] = {
 		.parents = (const struct vc3_clk_parent[]) {
 			VC3_CLK_PARENT(DIV, VC3_DIV5),
 			VC3_CLK_PARENT(DIV, VC3_DIV4),
+			VC3_CLK_PARENT(32K, 0),
 		},
-		.num_parents = 2,
+		.num_parents = 3,
 	},
 	[VC3_SE2_MUX] = {
 		.parents = (const struct vc3_clk_parent[]) {
 			VC3_CLK_PARENT(DIV, VC3_DIV5),
 			VC3_CLK_PARENT(DIV, VC3_DIV4),
+			VC3_CLK_PARENT(32K, 0),
 		},
-		.num_parents = 2,
+		.num_parents = 3,
 	},
 	[VC3_SE3_MUX] = {
 		.parents = (const struct vc3_clk_parent[]) {
 			VC3_CLK_PARENT(DIV, VC3_DIV2),
 			VC3_CLK_PARENT(DIV, VC3_DIV4),
+			VC3_CLK_PARENT(32K, 0),
 		},
-		.num_parents = 2,
+		.num_parents = 3,
 	},
 	[VC3_DIFF1_MUX] = {
 		.parents = (const struct vc3_clk_parent[]) {
@@ -1027,7 +1084,8 @@ static struct vc3_hw_data clk_mux[] = {
 	[VC3_SE1_MUX] = {
 		.data = &(struct vc3_clk_data) {
 			.offs = VC3_SE1_DIV4_CTRL,
-			.bitmsk = VC3_SE1_DIV4_CTRL_SE1_CLK_SEL
+			.bitmsk = VC3_SE1_DIV4_CTRL_SE1_CLK_SEL,
+			.clk_32k_bitmsk = VC3_SE1_DIV4_CTRL_SE1_FREERUN_32K,
 		},
 		.hw.init = &(struct clk_init_data) {
 			.name = "se1_mux",
@@ -1039,6 +1097,7 @@ static struct vc3_hw_data clk_mux[] = {
 	[VC3_SE2_MUX] = {
 		.data = &(struct vc3_clk_data) {
 			.offs = VC3_SE2_CTRL_REG0,
+			.clk_32k_bitmsk = VC3_SE2_CTRL_REG0_SE2_FREERUN_32K,
 		},
 		.hw.init = &(struct clk_init_data) {
 			.name = "se2_mux",
@@ -1050,7 +1109,8 @@ static struct vc3_hw_data clk_mux[] = {
 	[VC3_SE3_MUX] = {
 		.data = &(struct vc3_clk_data) {
 			.offs = VC3_SE3_DIFF1_CTRL_REG,
-			.bitmsk = VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL
+			.bitmsk = VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL,
+			.clk_32k_bitmsk = VC3_SE3_DIFF1_CTRL_REG_SE3_FREERUN_32K,
 		},
 		.hw.init = &(struct clk_init_data) {
 			.name = "se3_mux",
@@ -1103,6 +1163,8 @@ static struct clk_hw *vc3_clk_get_hw(struct vc3_device_data *vc3,
 		return &vc3->clk_div[parent->idx].hw;
 	case VC3_CLK_CLK_MUX:
 		return &vc3->clk_mux[parent->idx].hw;
+	case VC3_CLK_32K:
+		return vc3->clk_32k;
 	}
 
 	return NULL;
@@ -1224,6 +1286,20 @@ static int vc3_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	/* Register internal 32.768kHz oscillator */
+	name = kasprintf(GFP_KERNEL, "%pOFn.clk_32k", dev->of_node);
+	if (!name)
+		return -ENOMEM;
+
+	vc3->clk_32k = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0,
+						       VC3_CLK_32K_FREQ);
+	kfree(name);
+
+	if (IS_ERR(vc3->clk_32k))
+		return dev_err_probe(dev, PTR_ERR(vc3->clk_32k),
+				     "Failed to register %dHz fixed clock\n",
+				     VC3_CLK_32K_FREQ);
+
 	/* Register pfd muxes */
 	for (i = 0; i < ARRAY_SIZE(clk_pfd_mux); i++) {
 		name = clk_pfd_mux[i].hw.init->name;
-- 
2.51.0


