Return-Path: <linux-renesas-soc+bounces-27051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C31C1D3AEEB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 16:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C35B93004D0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 15:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B142368294;
	Mon, 19 Jan 2026 15:23:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218FC14F112;
	Mon, 19 Jan 2026 15:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836212; cv=none; b=srMYe+SFRtEC/t580Vg+jPcIbo+LYJFvlcgMf0xktgkhjvk1w2Nw0spECiSOs3guobh6SfnmIj0XCPlaTSbJarwkaNe/DxnODGQ5L/So+HyrglPJw94Lapu2Nyq6cfG9r+rSSyHR+de4dG3tXNtWhoxucNVLkpDokSMt2xQS5g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836212; c=relaxed/simple;
	bh=vyCf16l4CUsVt0oxnwJQYi+bOAfmhKYEtr2IeaMnavA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRqeO6vah/oTkiiiyXbAwdGhoXkWldP8sHkou9lZjmaaqR/vKRigZEH0YfOch/+lPkImp8VGY3kpejvT9VX7ZRyuCbujH4YEbZZ1cNPF6l3SvodRf/J1RjC4LpuOFl7Dq93PCu0MGLyChWN7refO/j9Q/0EcZ8O0xvKa3kt81GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409CDC116C6;
	Mon, 19 Jan 2026 15:23:30 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: rs9: Convert to clk_hw_onecell_data and of_clk_hw_onecell_get()
Date: Mon, 19 Jan 2026 16:23:27 +0100
Message-ID: <a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rs9_of_clk_get() does not validate the clock index in the passed
DT clock specifier.  If DT specifies an incorrect and out-of-range
index, this may access memory beyond the end of the fixed-size clk_dif[]
array.

Instead of fixing this by adding a range check to rs9_of_clk_get(),
convert the driver to use the of_clk_hw_onecell_get() helper, which
already contains such a check.  Embedding a clk_hw_onecell_data
structure in the rs9_driver_data structure has the added benefit that
the clock array always has the correct size, and thus can no longer
become out of sync when adding support for new rs9 variants.

Fixes: 892e0ddea1aa6f70 ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
While this patch applies on top of "[PATCH v2] clk: rs9: Reserve 8
struct clk_hw slots for for 9FGV0841", it can be applied or backported
without, by ignoring the change from "clk_dif[4]" to "clk_dif[8]".

[1] https://patch.msgid.link/20260119150242.29444-1-marek.vasut+renesas@mailbox.org
---
 drivers/clk/clk-renesas-pcie.c | 39 ++++++++++++++++------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index aa108df12e44fb9f..2b8b6b82250360d5 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -64,10 +64,11 @@ struct rs9_driver_data {
 	struct i2c_client	*client;
 	struct regmap		*regmap;
 	const struct rs9_chip_info *chip_info;
-	struct clk_hw		*clk_dif[8];
 	u8			pll_amplitude;
 	u8			pll_ssc;
 	u8			clk_dif_sr;
+	/* must be last */
+	struct clk_hw_onecell_data onecell;
 };
 
 /*
@@ -271,32 +272,28 @@ static void rs9_update_config(struct rs9_driver_data *rs9)
 	}
 }
 
-static struct clk_hw *
-rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
-{
-	struct rs9_driver_data *rs9 = data;
-	unsigned int idx = clkspec->args[0];
-
-	return rs9->clk_dif[idx];
-}
-
 static int rs9_probe(struct i2c_client *client)
 {
+	const struct rs9_chip_info *chip_info;
 	unsigned char name[5] = "DIF0";
 	struct rs9_driver_data *rs9;
 	unsigned int vid, did;
 	struct clk_hw *hw;
 	int i, ret;
 
-	rs9 = devm_kzalloc(&client->dev, sizeof(*rs9), GFP_KERNEL);
+	chip_info = i2c_get_match_data(client);
+	if (!chip_info)
+		return -EINVAL;
+
+	rs9 = devm_kzalloc(&client->dev, struct_size(rs9, onecell.hws,
+			   chip_info->num_clks), GFP_KERNEL);
 	if (!rs9)
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, rs9);
 	rs9->client = client;
-	rs9->chip_info = i2c_get_match_data(client);
-	if (!rs9->chip_info)
-		return -EINVAL;
+	rs9->chip_info = chip_info;
+	rs9->onecell.num = chip_info->num_clks;
 
 	/* Fetch common configuration from DT (if specified) */
 	ret = rs9_get_common_config(rs9);
@@ -304,7 +301,7 @@ static int rs9_probe(struct i2c_client *client)
 		return ret;
 
 	/* Fetch DIFx output configuration from DT (if specified) */
-	for (i = 0; i < rs9->chip_info->num_clks; i++) {
+	for (i = 0; i < rs9->onecell.num; i++) {
 		ret = rs9_get_output_config(rs9, i);
 		if (ret)
 			return ret;
@@ -330,24 +327,24 @@ static int rs9_probe(struct i2c_client *client)
 		return ret;
 
 	vid &= RS9_REG_VID_MASK;
-	if (vid != RS9_REG_VID_IDT || did != rs9->chip_info->did)
+	if (vid != RS9_REG_VID_IDT || did != chip_info->did)
 		return dev_err_probe(&client->dev, -ENODEV,
 				     "Incorrect VID/DID: %#02x, %#02x. Expected %#02x, %#02x\n",
-				     vid, did, RS9_REG_VID_IDT,
-				     rs9->chip_info->did);
+				     vid, did, RS9_REG_VID_IDT, chip_info->did);
 
 	/* Register clock */
-	for (i = 0; i < rs9->chip_info->num_clks; i++) {
+	for (i = 0; i < rs9->onecell.num; i++) {
 		snprintf(name, 5, "DIF%d", i);
 		hw = devm_clk_hw_register_fixed_factor_index(&client->dev, name,
 						    0, 0, 4, 1);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);
 
-		rs9->clk_dif[i] = hw;
+		rs9->onecell.hws[i] = hw;
 	}
 
-	ret = devm_of_clk_add_hw_provider(&client->dev, rs9_of_clk_get, rs9);
+	ret = devm_of_clk_add_hw_provider(&client->dev, of_clk_hw_onecell_get,
+					  &rs9->onecell);
 	if (!ret)
 		rs9_update_config(rs9);
 
-- 
2.43.0


