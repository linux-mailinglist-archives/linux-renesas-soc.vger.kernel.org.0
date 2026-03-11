Return-Path: <linux-renesas-soc+bounces-29217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ95OZuFsWmjCwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:09:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B122660C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D39A03077CD8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 15:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DEA3CF048;
	Wed, 11 Mar 2026 15:06:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30518362130;
	Wed, 11 Mar 2026 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241585; cv=none; b=Iz1TvJHTz9+urKywLp7WptPwc5qQ2lTmawye+Q/Mf7Xr3TgAHWIFtrKEIDZ3lUZ8Z2d3GnYXACLKQOIyZ4+mo5cA52yQHH+HlFu/shHxqkg0v68rXXYdlp7CtRKCb0o1Bh2yq9RglGvdossLPDVxIJVvNpCUu84jd4Yz4eag/cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241585; c=relaxed/simple;
	bh=1ZmxNSzK5y4YYwYPaZmtT/LizhAKrRlUbwYPaZ+wJAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MnvpAare0c5H2/8xNuPmPv0PCM4QfZcsbjococ0jDMg1w3RCIFCJW5hFq9YJh81hAPQR0SZxKKNMEWU9dbgpoN14avO+JsNgEDnEEh3RLzJ+oX7LjuzTdXgMX7zioMmYpo6hW09IWkEU/VpgBhvMIUaQm2Hn1CRT3yKy3HV/kjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D43AC19424;
	Wed, 11 Mar 2026 15:06:23 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v4 2/2] clk: rs9: Convert to clk_hw_onecell_data and of_clk_hw_onecell_get()
Date: Wed, 11 Mar 2026 16:06:11 +0100
Message-ID: <b0f36c47ea002cd72a3a67be1fad5f56e8531367.1773241119.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773241119.git.geert+renesas@glider.be>
References: <cover.1773241119.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29217-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.936];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,glider.be:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: 41B122660C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the rs9 clock driver to use the of_clk_hw_onecell_get() helper,
which requires using the clk_hw_onecell_data structure.  Embedding that
structure in the rs9_driver_data structure has the benefit that the
clock array always has the correct size, and thus can no longer become
out of sync when adding support for new rs9 variants.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
v4:
  - Add Reviewed-by,
  - Rebase on top of "clk: rs9: Add clock index range check to
    rs9_of_clk_get()", so this becomes a pure refactoring instead of a
    fix,
  - Put in a series,

(v3 and v2 do not exist)

v1:
  - https://lore.kernel.org/a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be
---
 drivers/clk/clk-renesas-pcie.c | 44 ++++++++++++++--------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index b9bee616afe8d4ef..2b8b6b82250360d5 100644
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
@@ -271,37 +272,28 @@ static void rs9_update_config(struct rs9_driver_data *rs9)
 	}
 }
 
-static struct clk_hw *
-rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
-{
-	struct rs9_driver_data *rs9 = data;
-	unsigned int idx = clkspec->args[0];
-
-	if (idx >= rs9->chip_info->num_clks) {
-		pr_err("%s: Invalid clock index %u\n", __func__, idx);
-		return ERR_PTR(-EINVAL);
-	}
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
@@ -309,7 +301,7 @@ static int rs9_probe(struct i2c_client *client)
 		return ret;
 
 	/* Fetch DIFx output configuration from DT (if specified) */
-	for (i = 0; i < rs9->chip_info->num_clks; i++) {
+	for (i = 0; i < rs9->onecell.num; i++) {
 		ret = rs9_get_output_config(rs9, i);
 		if (ret)
 			return ret;
@@ -335,24 +327,24 @@ static int rs9_probe(struct i2c_client *client)
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


