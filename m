Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC1A6B37DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 08:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjCJHz5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 02:55:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbjCJHz4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 02:55:56 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94EC1DD597;
        Thu,  9 Mar 2023 23:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678434955; x=1709970955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bo3atwmlhwGhcSeKSjFNoq2khdipfGDBT2znWilnFDg=;
  b=hWUyKITNyFtd9Qhqh0yFKtOdcXTSmxOQpFWEBsv9DANnlW5NS5NS2rnL
   qcrxiyPpWdJ7YriviQkZ9a6WBtVjcbPg1vJTfNNGd4iTAiojYjdMbdfrf
   yWOVTITJDnt6pubsiZbaEyf3CgET4DsqBMrMomKC6xcOaDNUrffl64Q+V
   YT2knYMClibzO9fmCJJ/SSJYu2fu0qLneH0hOhqSfVSDKw99jl2JCnhJH
   tH41pnyy5Pic3B14bH4/VmROZpwnRIvngk2qi6SD4qNhQ7w63fTHqKe86
   v7XWMASSDzKO/Ntk1/YihtcU3B+KcwJfXQZ6zSR5aoG3dAmljvZLvGv5H
   w==;
X-IronPort-AV: E=Sophos;i="5.98,249,1673910000"; 
   d="scan'208";a="29597126"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 Mar 2023 08:55:44 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 10 Mar 2023 08:55:44 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 10 Mar 2023 08:55:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678434944; x=1709970944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bo3atwmlhwGhcSeKSjFNoq2khdipfGDBT2znWilnFDg=;
  b=dM5gCAKq9tovsJ+ZI4MY0HfEuVX7MR4afbQMnQiA95gV19lTggokmDrK
   UykMzKMoUxqDuWC5ckR8GRGRwMaMCTCiSq9x3/7Z1BNk7q2Uq2yDPjskF
   eeBxY8Euv0SQ3rvfSB1Dq5WfsobQySsKY0FCFty/60LEB27YNw4Izdn3D
   b4+isgHJQbT1+p1nKkuJP9OsC69ZBYFr97iUSysC7yEMZeJILPVtpZ4nW
   zb+ucoZiN1cmiSdxX1ewYCUo8nm96AopPdz1H7knHPbGdVjT5V2I0jYEA
   8b+wmcbT/cd+OmaAMB5fVveLzVUYmFDla5XsCEIBFUcArFQdrWhqrw6V7
   w==;
X-IronPort-AV: E=Sophos;i="5.98,249,1673910000"; 
   d="scan'208";a="29597125"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Mar 2023 08:55:44 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D9FC1280056;
        Fri, 10 Mar 2023 08:55:43 +0100 (CET)
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
Subject: [PATCH v3 3/4] clk: rs9: Support device specific dif bit calculation
Date:   Fri, 10 Mar 2023 08:55:34 +0100
Message-Id: <20230310075535.3476580-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310075535.3476580-1-alexander.stein@ew.tq-group.com>
References: <20230310075535.3476580-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Marek Vasut <marex@denx.de>
---
Changes in v3:
* Added Marek's R-b

 drivers/clk/clk-renesas-pcie.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 3873c52ad3b0..0036bd18c559 100644
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
@@ -159,17 +155,27 @@ static const struct regmap_config rs9_regmap_config = {
 	.reg_read = rs9_regmap_i2c_read,
 };
 
+static u8 rs9_calc_dif(const struct rs9_driver_data *rs9, int idx)
+{
+	enum rs9_model model = rs9->chip_info->model;
+
+	if (model == RENESAS_9FGV0241)
+		return BIT(idx) + 1;
+
+	return 0;
+}
+
 static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
 {
 	struct i2c_client *client = rs9->client;
+	u8 dif = rs9_calc_dif(rs9, idx);
 	unsigned char name[5] = "DIF0";
 	struct device_node *np;
 	int ret;
 	u32 sr;
 
 	/* Set defaults */
-	rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
-	rs9->clk_dif_sr |= RS9_REG_SR_3V0_DIF(idx);
+	rs9->clk_dif_sr |= dif;
 
 	snprintf(name, 5, "DIF%d", idx);
 	np = of_get_child_by_name(client->dev.of_node, name);
@@ -181,11 +187,9 @@ static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
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
@@ -256,11 +260,13 @@ static void rs9_update_config(struct rs9_driver_data *rs9)
 	}
 
 	for (i = 0; i < rs9->chip_info->num_clks; i++) {
-		if (rs9->clk_dif_sr & RS9_REG_SR_3V0_DIF(i))
+		u8 dif = rs9_calc_dif(rs9, i);
+
+		if (rs9->clk_dif_sr & dif)
 			continue;
 
-		regmap_update_bits(rs9->regmap, RS9_REG_SR, RS9_REG_SR_3V0_DIF(i),
-				   rs9->clk_dif_sr & RS9_REG_SR_3V0_DIF(i));
+		regmap_update_bits(rs9->regmap, RS9_REG_SR, dif,
+				   rs9->clk_dif_sr & dif);
 	}
 }
 
-- 
2.34.1

