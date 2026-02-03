Return-Path: <linux-renesas-soc+bounces-27844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMEJKAz+gWk7NQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:54:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1287ADA32A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75A6030BE19B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 13:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AC63A0E8B;
	Tue,  3 Feb 2026 13:52:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6FD3A0B14;
	Tue,  3 Feb 2026 13:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126727; cv=none; b=VWTZyOWQFqhaE951AdJK4yHHVi0l6NFiaT/4Bl6sP6+ywMgM4QTER1qI823/eDWu2JiatwXcLPSpsM/mKQJvia7X8NJdcRcq60RtcgxzZLnfNQPvPWgNCxzfj9qqbjP4D9i674NiUbivip2/Hc9APr/d2R/xn2rCFJGTaI70xdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126727; c=relaxed/simple;
	bh=zG5eeBSI9aXLtOguBcjWqWF8FoQhZzbWCEPj2Ix6q+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hjcm79ii7fsaBAmDhjCHmmxN7twCVz6JTZZKQYeRDkkSEgn5mWNsaac3MLrE2U7Pdfh07YpSUFPE0DVspjRdn8LxGZv/7R1jAA0y0Rk3B9xJHOmOloUXkRKXoniz+NHf4M6HflQx2go9r6Yr1wea9vAgQp+aY/9Cb1Fn7AQV6Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 4yqFbzTrRnaCMrRd3qmrpA==
X-CSE-MsgGUID: 2cTuTKFDSOm7MpRcerYMLg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Feb 2026 22:52:03 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C8D3E421BAE7;
	Tue,  3 Feb 2026 22:51:59 +0900 (JST)
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
Subject: [PATCH v3 4/8] clk: versaclock3: Add per-device clock data structure
Date: Tue,  3 Feb 2026 13:51:35 +0000
Message-ID: <20260203135139.28151-5-ovidiu.panait.rb@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27844-lists,linux-renesas-soc=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1287ADA32A
X-Rspamd-Action: no action

Introduce struct vc3_device_data to hold per-device copies of all clock
hardware data arrays. The static clock arrays serve as templates
describing the clock topology. During probe, these templates are
referenced to initialize device-specific clock structures.

This is required to support multiple versaclock3 devices simultaneously,
as the current static arrays would be shared across all instances.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v3 changes: New patch.

 drivers/clk/clk-versaclock3.c | 114 +++++++++++++++++++++++-----------
 1 file changed, 77 insertions(+), 37 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index d3e23566a38c..eb61a2c0b49b 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -13,6 +13,14 @@
 
 #define NUM_CONFIG_REGISTERS		37
 
+#define VC3_PFD_MUX_NUM			2
+#define VC3_PFD_NUM			3
+#define VC3_PLL_NUM			3
+#define VC3_DIV_MUX_NUM			3
+#define VC3_DIV_NUM			5
+#define VC3_CLK_MUX_NUM			5
+#define VC3_CLK_OUT_NUM			6
+
 #define VC3_GENERAL_CTR			0x0
 #define VC3_GENERAL_CTR_DIV1_SRC_SEL	BIT(3)
 #define VC3_GENERAL_CTR_PLL3_REFIN_SEL	BIT(2)
@@ -200,6 +208,18 @@ struct vc3_hw_cfg {
 	u32 se2_clk_sel_msk;
 };
 
+struct vc3_device_data {
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct vc3_hw_data clk_pfd_mux[VC3_PFD_MUX_NUM];
+	struct vc3_hw_data clk_pfd[VC3_PFD_NUM];
+	struct vc3_hw_data clk_pll[VC3_PLL_NUM];
+	struct vc3_hw_data clk_div_mux[VC3_DIV_MUX_NUM];
+	struct vc3_hw_data clk_div[VC3_DIV_NUM];
+	struct vc3_hw_data clk_mux[VC3_CLK_MUX_NUM];
+	struct clk_hw *clk_out[VC3_CLK_OUT_NUM];
+};
+
 static const struct clk_div_table div1_divs[] = {
 	{ .val = 0, .div = 1, }, { .val = 1, .div = 4, },
 	{ .val = 2, .div = 5, }, { .val = 3, .div = 6, },
@@ -236,8 +256,6 @@ static const struct clk_div_table div3_divs[] = {
 	{}
 };
 
-static struct clk_hw *clk_out[6];
-
 static u8 vc3_pfd_mux_get_parent(struct clk_hw *hw)
 {
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
@@ -1067,30 +1085,31 @@ static struct vc3_hw_data clk_mux[] = {
 	}
 };
 
-static struct clk_hw *vc3_clk_get_hw(const struct vc3_clk_parent *parent)
+static struct clk_hw *vc3_clk_get_hw(struct vc3_device_data *vc3,
+				     const struct vc3_clk_parent *parent)
 {
 	switch (parent->type) {
 	case VC3_CLK_EXT:
 		return NULL;
 	case VC3_CLK_PFD_MUX:
-		return &clk_pfd_mux[parent->idx].hw;
+		return &vc3->clk_pfd_mux[parent->idx].hw;
 	case VC3_CLK_PFD:
-		return &clk_pfd[parent->idx].hw;
+		return &vc3->clk_pfd[parent->idx].hw;
 	case VC3_CLK_PLL:
-		return &clk_pll[parent->idx].hw;
+		return &vc3->clk_pll[parent->idx].hw;
 	case VC3_CLK_DIV_MUX:
-		return &clk_div_mux[parent->idx].hw;
+		return &vc3->clk_div_mux[parent->idx].hw;
 	case VC3_CLK_DIV:
-		return &clk_div[parent->idx].hw;
+		return &vc3->clk_div[parent->idx].hw;
 	case VC3_CLK_CLK_MUX:
-		return &clk_mux[parent->idx].hw;
+		return &vc3->clk_mux[parent->idx].hw;
 	}
 
 	return NULL;
 }
 
 static struct clk_parent_data *
-vc3_setup_parent_data(struct vc3_hw_data *hw_data)
+vc3_setup_parent_data(struct vc3_device_data *vc3, struct vc3_hw_data *hw_data)
 {
 	const struct vc3_parent_info *pinfo = hw_data->parent_info;
 	struct clk_parent_data *pd;
@@ -1105,28 +1124,34 @@ vc3_setup_parent_data(struct vc3_hw_data *hw_data)
 		if (parent->type == VC3_CLK_EXT)
 			pd[i].index = parent->idx;
 		else
-			pd[i].hw = vc3_clk_get_hw(parent);
+			pd[i].hw = vc3_clk_get_hw(vc3, parent);
 	}
 
 	return pd;
 }
 
-static int vc3_register_clk(struct device *dev, struct vc3_hw_data *hw_data,
-			    struct regmap *regmap)
+static int vc3_register_clk(struct vc3_device_data *vc3,
+			    struct vc3_hw_data *hw_data,
+			    const struct vc3_hw_data *template)
 {
+	struct device *dev = &vc3->client->dev;
 	struct clk_parent_data *pd;
 	struct clk_init_data init;
 	int ret;
 
-	pd = vc3_setup_parent_data(hw_data);
+	if (!hw_data->data)
+		hw_data->data = template->data;
+	hw_data->parent_info = template->parent_info;
+
+	pd = vc3_setup_parent_data(vc3, hw_data);
 	if (!pd)
 		return -ENOMEM;
 
-	init = *hw_data->hw.init;
+	init = *template->hw.init;
 	init.parent_data = pd;
 	init.num_parents = hw_data->parent_info->num_parents;
 
-	hw_data->regmap = regmap;
+	hw_data->regmap = vc3->regmap;
 	hw_data->hw.init = &init;
 
 	ret = devm_clk_hw_register(dev, &hw_data->hw);
@@ -1142,7 +1167,7 @@ static struct clk_hw *vc3_of_clk_get(struct of_phandle_args *clkspec,
 	unsigned int idx = clkspec->args[0];
 	struct clk_hw **clkout_hw = data;
 
-	if (idx >= ARRAY_SIZE(clk_out)) {
+	if (idx >= VC3_CLK_OUT_NUM) {
 		pr_err("invalid clk index %u for provider %pOF\n", idx, clkspec->np);
 		return ERR_PTR(-EINVAL);
 	}
@@ -1155,13 +1180,18 @@ static int vc3_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	u8 settings[NUM_CONFIG_REGISTERS];
 	const struct vc3_hw_cfg *data;
-	struct regmap *regmap;
+	struct vc3_device_data *vc3;
 	const char *name;
 	int ret, i;
 
-	regmap = devm_regmap_init_i2c(client, &vc3_regmap_config);
-	if (IS_ERR(regmap))
-		return dev_err_probe(dev, PTR_ERR(regmap),
+	vc3 = devm_kzalloc(dev, sizeof(*vc3), GFP_KERNEL);
+	if (!vc3)
+		return -ENOMEM;
+
+	vc3->client = client;
+	vc3->regmap = devm_regmap_init_i2c(client, &vc3_regmap_config);
+	if (IS_ERR(vc3->regmap))
+		return dev_err_probe(dev, PTR_ERR(vc3->regmap),
 				     "failed to allocate register map\n");
 
 	ret = of_property_read_u8_array(dev->of_node, "renesas,settings",
@@ -1172,7 +1202,7 @@ static int vc3_probe(struct i2c_client *client)
 		 * settings to the device immediately.
 		 */
 		for  (i = 0; i < NUM_CONFIG_REGISTERS; i++) {
-			ret = regmap_write(regmap, i, settings[i]);
+			ret = regmap_write(vc3->regmap, i, settings[i]);
 			if (ret) {
 				dev_err(dev, "error writing to chip (%i)\n", ret);
 				return ret;
@@ -1187,7 +1217,7 @@ static int vc3_probe(struct i2c_client *client)
 	/* Register pfd muxes */
 	for (i = 0; i < ARRAY_SIZE(clk_pfd_mux); i++) {
 		name = clk_pfd_mux[i].hw.init->name;
-		ret = vc3_register_clk(dev, &clk_pfd_mux[i], regmap);
+		ret = vc3_register_clk(vc3, &vc3->clk_pfd_mux[i], &clk_pfd_mux[i]);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "failed to register clock %s\n",
@@ -1197,7 +1227,7 @@ static int vc3_probe(struct i2c_client *client)
 	/* Register pfd's */
 	for (i = 0; i < ARRAY_SIZE(clk_pfd); i++) {
 		name = clk_pfd[i].hw.init->name;
-		ret = vc3_register_clk(dev, &clk_pfd[i], regmap);
+		ret = vc3_register_clk(vc3, &vc3->clk_pfd[i], &clk_pfd[i]);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "failed to register clock %s\n",
@@ -1209,12 +1239,17 @@ static int vc3_probe(struct i2c_client *client)
 	/* Register pll's */
 	for (i = 0; i < ARRAY_SIZE(clk_pll); i++) {
 		if (i == VC3_PLL2) {
-			struct vc3_pll_data *pll_data = clk_pll[i].data;
+			struct vc3_pll_data *pll_data;
 
+			pll_data = devm_kmemdup(dev, clk_pll[i].data,
+						sizeof(*pll_data), GFP_KERNEL);
+			if (!pll_data)
+				return -ENOMEM;
 			pll_data->vco = data->pll2_vco;
+			vc3->clk_pll[i].data = pll_data;
 		}
 		name = clk_pll[i].hw.init->name;
-		ret = vc3_register_clk(dev, &clk_pll[i], regmap);
+		ret = vc3_register_clk(vc3, &vc3->clk_pll[i], &clk_pll[i]);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "failed to register clock %s\n",
@@ -1224,7 +1259,7 @@ static int vc3_probe(struct i2c_client *client)
 	/* Register divider muxes */
 	for (i = 0; i < ARRAY_SIZE(clk_div_mux); i++) {
 		name = clk_div_mux[i].hw.init->name;
-		ret = vc3_register_clk(dev, &clk_div_mux[i], regmap);
+		ret = vc3_register_clk(vc3, &vc3->clk_div_mux[i], &clk_div_mux[i]);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "failed to register clock %s\n",
@@ -1234,7 +1269,7 @@ static int vc3_probe(struct i2c_client *client)
 	/* Register dividers */
 	for (i = 0; i < ARRAY_SIZE(clk_div); i++) {
 		name = clk_div[i].hw.init->name;
-		ret = vc3_register_clk(dev, &clk_div[i], regmap);
+		ret = vc3_register_clk(vc3, &vc3->clk_div[i], &clk_div[i]);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "failed to register clock %s\n",
@@ -1244,12 +1279,17 @@ static int vc3_probe(struct i2c_client *client)
 	/* Register clk muxes */
 	for (i = 0; i < ARRAY_SIZE(clk_mux); i++) {
 		if (i == VC3_SE2_MUX) {
-			struct vc3_clk_data *clk_data = clk_mux[i].data;
+			struct vc3_clk_data *clk_data;
 
+			clk_data = devm_kmemdup(dev, clk_mux[i].data,
+						sizeof(*clk_data), GFP_KERNEL);
+			if (!clk_data)
+				return -ENOMEM;
 			clk_data->bitmsk = data->se2_clk_sel_msk;
+			vc3->clk_mux[i].data = clk_data;
 		}
 		name = clk_mux[i].hw.init->name;
-		ret = vc3_register_clk(dev, &clk_mux[i], regmap);
+		ret = vc3_register_clk(vc3, &vc3->clk_mux[i], &clk_mux[i]);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "failed to register clock %s\n",
@@ -1257,7 +1297,7 @@ static int vc3_probe(struct i2c_client *client)
 	}
 
 	/* Register clk outputs */
-	for (i = 0; i < ARRAY_SIZE(clk_out); i++) {
+	for (i = 0; i < ARRAY_SIZE(vc3->clk_out); i++) {
 		switch (i) {
 		case VC3_DIFF2:
 			name = "diff2";
@@ -1282,17 +1322,17 @@ static int vc3_probe(struct i2c_client *client)
 		}
 
 		if (i == VC3_REF)
-			clk_out[i] = devm_clk_hw_register_fixed_factor_index(dev,
+			vc3->clk_out[i] = devm_clk_hw_register_fixed_factor_index(dev,
 				name, 0, CLK_SET_RATE_PARENT, 1, 1);
 		else
-			clk_out[i] = devm_clk_hw_register_fixed_factor_parent_hw(dev,
-				name, &clk_mux[i - 1].hw, CLK_SET_RATE_PARENT, 1, 1);
+			vc3->clk_out[i] = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+				name, &vc3->clk_mux[i - 1].hw, CLK_SET_RATE_PARENT, 1, 1);
 
-		if (IS_ERR(clk_out[i]))
-			return PTR_ERR(clk_out[i]);
+		if (IS_ERR(vc3->clk_out[i]))
+			return PTR_ERR(vc3->clk_out[i]);
 	}
 
-	ret = devm_of_clk_add_hw_provider(dev, vc3_of_clk_get, clk_out);
+	ret = devm_of_clk_add_hw_provider(dev, vc3_of_clk_get, vc3->clk_out);
 	if (ret)
 		return dev_err_probe(dev, ret, "unable to add clk provider\n");
 
-- 
2.51.0


