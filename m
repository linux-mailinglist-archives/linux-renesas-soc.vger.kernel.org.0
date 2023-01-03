Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8967D65BFDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jan 2023 13:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbjACMcE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Jan 2023 07:32:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjACMcD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 07:32:03 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8FBBFCE5;
        Tue,  3 Jan 2023 04:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672749121; x=1704285121;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nLxPG5ZflyIbDiAPayFzeCH+sTmiUJr2lS1ffkhrM50=;
  b=E95jT1xHUkfaqVrIVODE0lY1hzBvQxU7cWBtiyhXfxGIj+GCEepjTCEj
   hHeJOCl43nmuWf1rskp5z8jNUfs6phz/2fuzDVKZ5RYqFvX6ZL5ZTfl8y
   Jq4BSYq+PmvwhJ+08w61qxCX4p3F6zftRLUtJb/sXzksv+mUks1H+7dH0
   GApCui5x4cHYp8HNMIcA0FqPvQoWIKFuegbS4tyTjD3RuTsnctcA/RHaf
   p36sIO4ja8yWSg0rpUwnwY/s36iJkdf7ZSedv/KYgrZVH7hn05FoT9wEK
   sH7WqXGAvvcZAK1CFy9lkPjNXgZRP3BAwdBqE3eWqIK9B7BXk5FnTmZUx
   w==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28221129"
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
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nLxPG5ZflyIbDiAPayFzeCH+sTmiUJr2lS1ffkhrM50=;
  b=QOslpDj1pxs5ofnzt6D6sf7CcgUJO+icJBRzzJzcGD+i4ZjEAti2qs0G
   s+Olt6vphiv96ZCpOmsNi5QJRs3MrCj+HTZDiENevCzW1zTgNe61JQxE6
   sGxAy/O8NoRw/6opweBLvFDh3EKTd63tfoWFVsvuXmNoA3PYrNYZabaMU
   JzytFZNP+7eeoGBee9vzOsHReVFPZOujWmFtym2L79M1NUB+JPpBVjssc
   9iCxPmzyh96Xd9yXPTZKVsuKrZ2nhjtzVtTIQqSZQpoAkslDsTRfiRKKO
   fPomBZWwgDg1LwbNj8N/N0npk95imS3ArmrmyPBdiy0LVFyk3UGCVFY5h
   g==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28221128"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Jan 2023 13:31:59 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D694B280056;
        Tue,  3 Jan 2023 13:31:58 +0100 (CET)
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
Subject: [PATCH 1/4] clk: rs9: Check for vendor/device ID
Date:   Tue,  3 Jan 2023 13:31:51 +0100
Message-Id: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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

This is in preparation to support additional devices which have different
IDs as well as a slightly different register layout.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/clk-renesas-pcie.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index e6247141d0c0..0076ed8f11b0 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -45,6 +45,13 @@
 #define RS9_REG_DID				0x6
 #define RS9_REG_BCP				0x7
 
+#define RS9_REG_VID_IDT				0x01
+
+#define RS9_REG_DID_TYPE_FGV			(0x0 << RS9_REG_DID_TYPE_SHIFT)
+#define RS9_REG_DID_TYPE_DBV			(0x1 << RS9_REG_DID_TYPE_SHIFT)
+#define RS9_REG_DID_TYPE_DMV			(0x2 << RS9_REG_DID_TYPE_SHIFT)
+#define RS9_REG_DID_TYPE_SHIFT			0x6
+
 /* Supported Renesas 9-series models. */
 enum rs9_model {
 	RENESAS_9FGV0241,
@@ -54,6 +61,7 @@ enum rs9_model {
 struct rs9_chip_info {
 	const enum rs9_model	model;
 	unsigned int		num_clks;
+	u8			did;
 };
 
 struct rs9_driver_data {
@@ -270,6 +278,7 @@ static int rs9_probe(struct i2c_client *client)
 {
 	unsigned char name[5] = "DIF0";
 	struct rs9_driver_data *rs9;
+	unsigned int vid, did;
 	struct clk_hw *hw;
 	int i, ret;
 
@@ -306,6 +315,20 @@ static int rs9_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = regmap_read(rs9->regmap, RS9_REG_VID, &vid);
+	if (ret < 0)
+		return ret;
+	ret = regmap_read(rs9->regmap, RS9_REG_DID, &did);
+	if (ret < 0)
+		return ret;
+
+	if ((vid != RS9_REG_VID_IDT) || (did != rs9->chip_info->did)) {
+		dev_err(&client->dev,
+			"Incorrect VID/DID: %#02x, %#02x. Expected %#02x, %#02x\n",
+			vid, did, RS9_REG_VID_IDT, rs9->chip_info->did);
+		return -ENODEV;
+	}
+
 	/* Register clock */
 	for (i = 0; i < rs9->chip_info->num_clks; i++) {
 		snprintf(name, 5, "DIF%d", i);
@@ -349,6 +372,7 @@ static int __maybe_unused rs9_resume(struct device *dev)
 static const struct rs9_chip_info renesas_9fgv0241_info = {
 	.model		= RENESAS_9FGV0241,
 	.num_clks	= 2,
+	.did		= RS9_REG_DID_TYPE_FGV | 0x02,
 };
 
 static const struct i2c_device_id rs9_id[] = {
-- 
2.34.1

