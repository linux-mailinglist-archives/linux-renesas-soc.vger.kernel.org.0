Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DED2A65BFEB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jan 2023 13:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237548AbjACMcJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Jan 2023 07:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237470AbjACMcH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 07:32:07 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C20CFD38;
        Tue,  3 Jan 2023 04:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672749125; x=1704285125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iR2lg6ZkZ3TUre7N1/ae8xVuBqn+jZoTBIB9e2Z9qX8=;
  b=HDijqpnW1p8HJoZ/M+xuzBD00ijGFp35Tc8Ou0w0mpNADu7J7MUDcKBs
   DHYxmwYAeG8lDK0wK6dBN9nBd4iUWRmj3sopHhQYcMb8TnkpmRMJhBhZt
   op82v52nKLw/T7ZUc+u++C+0rDEcZIaqjvn7M+9sQu6T1dwPEUYlKyR0z
   fwkf5k8NhX6pg8KQGAdg3Cc+WSQSZhdIpBvjNz/9wCZUF5Ojpwt391mQS
   kjAc5Ti1PeyrVbqBivIdig5+LCS0xSVtuFGM3UKQjHcy+vQ2ybbehaQhX
   kJ9DHmm/NZO/txGQm0ZE0CIofSG471WLCsuXQ+6/rFD/VeL9Ej9clkCrq
   w==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28221133"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Jan 2023 13:31:59 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 03 Jan 2023 13:31:59 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 03 Jan 2023 13:31:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672749119; x=1704285119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iR2lg6ZkZ3TUre7N1/ae8xVuBqn+jZoTBIB9e2Z9qX8=;
  b=bqSkGL7eVQI9D57wr/a5mBJUa9DhsD/Fus7XL0vParEH1W0sXXZ8Ei6+
   ykdz16557VXu58FjUag20lhv73lWSwoXMq1oWXvzmgQDKrW5FFKnqJiht
   WIDpC6Ui/ZjB1hHO6uIvmMVRU7LeL1dc95nXji4P8iQ/V2yBGdw+1FXC6
   L/BEI4TMJL9td6eOScc4auRa5eBKrk7+tnXnUg6m4Bd3644KowiNIodEm
   +h66fzLlQQ8nJisByGbOTzATi4niDLt3EmTyD8E2uO8wJalQKRCw25DGv
   fO6omtBBt3CfyLJX1lPUiwgblMTAPMsIYR6mRj2iYGMBnGaJYCDpXw6xj
   g==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28221132"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Jan 2023 13:31:59 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3FE07280056;
        Tue,  3 Jan 2023 13:31:59 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marex@denx.de>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/4] clk: rs9: Support device specific dif bit calculation
Date:   Tue,  3 Jan 2023 13:31:53 +0100
Message-Id: <20230103123154.3424817-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The calculation DIFx is BIT(n) +1 is only true for 9FGV0241. With
additional devices this is getting more complicated.
Support a base bit for the DIF calculation, currently only devices
with consecutive bits are supported, e.g. the 6-channel device needs
additional logic.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/clk-renesas-pcie.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 0076ed8f11b0..d19b8e759eea 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -18,7 +18,6 @@
 #include <linux/regmap.h>
 
 #define RS9_REG_OE				0x0
-#define RS9_REG_OE_DIF_OE(n)			BIT((n) + 1)
 #define RS9_REG_SS				0x1
 #define RS9_REG_SS_AMP_0V6			0x0
 #define RS9_REG_SS_AMP_0V7			0x1
@@ -31,9 +30,6 @@
 #define RS9_REG_SS_SSC_MASK			(3 << 3)
 #define RS9_REG_SS_SSC_LOCK			BIT(5)
 #define RS9_REG_SR				0x2
-#define RS9_REG_SR_2V0_DIF(n)			0
-#define RS9_REG_SR_3V0_DIF(n)			BIT((n) + 1)
-#define RS9_REG_SR_DIF_MASK(n)		BIT((n) + 1)
 #define RS9_REG_REF				0x3
 #define RS9_REG_REF_OE				BIT(4)
 #define RS9_REG_REF_OD				BIT(5)
@@ -62,6 +58,7 @@ struct rs9_chip_info {
 	const enum rs9_model	model;
 	unsigned int		num_clks;
 	u8			did;
+	u8			(*calc_dif)(int idx);
 };
 
 struct rs9_driver_data {
@@ -160,8 +157,14 @@ static const struct regmap_config rs9_regmap_config = {
 	.reg_read = rs9_regmap_i2c_read,
 };
 
+static u8 rs9fgv0241_calc_dif(int idx)
+{
+	return BIT(idx) + 1;
+}
+
 static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
 {
+	u8 dif = rs9->chip_info->calc_dif(idx);
 	struct i2c_client *client = rs9->client;
 	unsigned char name[5] = "DIF0";
 	struct device_node *np;
@@ -169,8 +172,7 @@ static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
 	u32 sr;
 
 	/* Set defaults */
-	rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
-	rs9->clk_dif_sr |= RS9_REG_SR_3V0_DIF(idx);
+	rs9->clk_dif_sr |= dif;
 
 	snprintf(name, 5, "DIF%d", idx);
 	np = of_get_child_by_name(client->dev.of_node, name);
@@ -182,11 +184,9 @@ static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
 	of_node_put(np);
 	if (!ret) {
 		if (sr == 2000000) {		/* 2V/ns */
-			rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
-			rs9->clk_dif_sr |= RS9_REG_SR_2V0_DIF(idx);
+			rs9->clk_dif_sr &= ~dif;
 		} else if (sr == 3000000) {	/* 3V/ns (default) */
-			rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
-			rs9->clk_dif_sr |= RS9_REG_SR_3V0_DIF(idx);
+			rs9->clk_dif_sr |= dif;
 		} else
 			ret = dev_err_probe(&client->dev, -EINVAL,
 					    "Invalid renesas,slew-rate value\n");
@@ -257,11 +257,13 @@ static void rs9_update_config(struct rs9_driver_data *rs9)
 	}
 
 	for (i = 0; i < rs9->chip_info->num_clks; i++) {
-		if (rs9->clk_dif_sr & RS9_REG_SR_3V0_DIF(i))
+		u8 dif = rs9->chip_info->calc_dif(i);
+
+		if (rs9->clk_dif_sr & dif)
 			continue;
 
-		regmap_update_bits(rs9->regmap, RS9_REG_SR, RS9_REG_SR_3V0_DIF(i),
-				   rs9->clk_dif_sr & RS9_REG_SR_3V0_DIF(i));
+		regmap_update_bits(rs9->regmap, RS9_REG_SR, dif,
+				   rs9->clk_dif_sr & dif);
 	}
 }
 
@@ -373,6 +375,7 @@ static const struct rs9_chip_info renesas_9fgv0241_info = {
 	.model		= RENESAS_9FGV0241,
 	.num_clks	= 2,
 	.did		= RS9_REG_DID_TYPE_FGV | 0x02,
+	.calc_dif	= rs9fgv0241_calc_dif,
 };
 
 static const struct i2c_device_id rs9_id[] = {
-- 
2.34.1

