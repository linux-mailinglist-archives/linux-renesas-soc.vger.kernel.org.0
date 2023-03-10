Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6A36B37D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 08:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjCJHzy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 02:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjCJHzx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 02:55:53 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A366E191A;
        Thu,  9 Mar 2023 23:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678434946; x=1709970946;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qYQPl7nGfAFl2mMjX45qVs8yCecf4A47M9vFzemDep8=;
  b=b7tvaGZ+3sPqnwnKpMsAg5N/+iC4FrzUV/HTgVqXVHLFWOipQ3UHWoni
   5oOKY3DOTYfaIy7BLkbvfrXbcqMZGBnRp5RZrBJ15WbJtt+/v+6K4l3GW
   qUALQ7LcxP3kJWoGe92IyhDaBczJ32GHyl06urtrUZW6meJo/RhaWc4Y+
   tOQP/rEhULYpSlnASatHpHnUPH3r5QE09pyu+ZMiqYW9DKaRemjVMz30t
   8GkVoMdEI3z0XGnr+wRupOW3rXzY2bRT654M7EzK+FQDJ+YMzdtaGjj30
   +cbaCeHXNag3CV5rdeaAEvY7ElHJbI1mFMl+73/WwNRMDSK+zRstW9waZ
   g==;
X-IronPort-AV: E=Sophos;i="5.98,249,1673910000"; 
   d="scan'208";a="29597121"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 Mar 2023 08:55:44 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 10 Mar 2023 08:55:43 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 10 Mar 2023 08:55:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678434944; x=1709970944;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qYQPl7nGfAFl2mMjX45qVs8yCecf4A47M9vFzemDep8=;
  b=ZjIM0xyJD/iIobliNT0P1AixALUtPbN8roF1KjoEWcRMXB9SbOE1Gce/
   BTiYbKVXLL87W0YGDVHgKJJfYNaoX4MO+DwrSamR/qWpr9bwp2r2WYDOf
   LFtqQLQATPRx1JkSFWdb8IMJbNxMNUHRcFS099HG+J73261CPU3egBxge
   VZAdlg4SKCUOBatKQdMTZ87CmBn4g800RQwuUFm6ZSzGZoI/hUjfVOvwv
   NjT4g6gcpDYI0V6lWYtTzoKSUFc5UCR7eDqMH10poVLrGvDJGLEnKXMV1
   dEAw1AVE2YjqzARuK1193r1u8M2rY5F09f//LraNkuTMhz6SCrdAWNenP
   w==;
X-IronPort-AV: E=Sophos;i="5.98,249,1673910000"; 
   d="scan'208";a="29597120"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Mar 2023 08:55:43 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6A5A4280056;
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
Subject: [PATCH v3 1/4] clk: rs9: Check for vendor/device ID
Date:   Fri, 10 Mar 2023 08:55:32 +0100
Message-Id: <20230310075535.3476580-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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

This is in preparation to support additional devices which have different
IDs as well as a slightly different register layout.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Marek Vasut <marex@denx.de>
---
Changes in v3:
* Added Marek's R-b

 drivers/clk/clk-renesas-pcie.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index f91f30560820..3873c52ad3b0 100644
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
@@ -269,6 +277,7 @@ static int rs9_probe(struct i2c_client *client)
 {
 	unsigned char name[5] = "DIF0";
 	struct rs9_driver_data *rs9;
+	unsigned int vid, did;
 	struct clk_hw *hw;
 	int i, ret;
 
@@ -305,6 +314,20 @@ static int rs9_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = regmap_read(rs9->regmap, RS9_REG_VID, &vid);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_read(rs9->regmap, RS9_REG_DID, &did);
+	if (ret < 0)
+		return ret;
+
+	if (vid != RS9_REG_VID_IDT || did != rs9->chip_info->did)
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Incorrect VID/DID: %#02x, %#02x. Expected %#02x, %#02x\n",
+				     vid, did, RS9_REG_VID_IDT,
+				     rs9->chip_info->did);
+
 	/* Register clock */
 	for (i = 0; i < rs9->chip_info->num_clks; i++) {
 		snprintf(name, 5, "DIF%d", i);
@@ -348,6 +371,7 @@ static int __maybe_unused rs9_resume(struct device *dev)
 static const struct rs9_chip_info renesas_9fgv0241_info = {
 	.model		= RENESAS_9FGV0241,
 	.num_clks	= 2,
+	.did		= RS9_REG_DID_TYPE_FGV | 0x02,
 };
 
 static const struct i2c_device_id rs9_id[] = {
-- 
2.34.1

