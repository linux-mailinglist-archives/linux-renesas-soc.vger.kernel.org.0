Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E132D2559
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Dec 2020 09:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgLHIEn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Dec 2020 03:04:43 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:50630 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727725AbgLHIEm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Dec 2020 03:04:42 -0500
X-IronPort-AV: E=Sophos;i="5.78,401,1599490800"; 
   d="scan'208";a="65020043"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Dec 2020 17:04:10 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C7348422927B;
        Tue,  8 Dec 2020 17:04:10 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org
Cc:     khiem.nguyen.xt@renesas.com, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] mfd: bd9571mwv: Make the driver more generic
Date:   Tue,  8 Dec 2020 17:04:02 +0900
Message-Id: <1607414643-25498-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>

Since the driver supports BD9571MWV PMIC only,
this patch makes the functions and data structure become more generic
so that it can support other PMIC variants as well.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
[shimoda: rebase and refactor]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mfd/bd9571mwv.c       | 47 ++++++++++++++++++++++++++++++++++---------
 include/linux/mfd/bd9571mwv.h | 19 +++++++++++++++++
 2 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index 80c6ef0..57bdb6a 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -3,6 +3,7 @@
  * ROHM BD9571MWV-M MFD driver
  *
  * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
+ * Copyright (C) 2020 Renesas Electronics Corporation
  *
  * Based on the TPS65086 driver
  */
@@ -102,6 +103,15 @@ static struct regmap_irq_chip bd9571mwv_irq_chip = {
 	.num_irqs	= ARRAY_SIZE(bd9571mwv_irqs),
 };
 
+static const struct bd957x_data bd9571mwv_data = {
+	.product_code_val = BD9571MWV_PRODUCT_CODE_VAL,
+	.part_number = BD9571MWV_PART_NUMBER,
+	.regmap_config = &bd9571mwv_regmap_config,
+	.irq_chip = &bd9571mwv_irq_chip,
+	.cells = bd9571mwv_cells,
+	.num_cells = ARRAY_SIZE(bd9571mwv_cells),
+};
+
 static int bd9571mwv_identify(struct bd9571mwv *bd)
 {
 	struct device *dev = bd->dev;
@@ -127,13 +137,12 @@ static int bd9571mwv_identify(struct bd9571mwv *bd)
 			ret);
 		return ret;
 	}
-
-	if (value != BD9571MWV_PRODUCT_CODE_VAL) {
+	/* Confirm the product code */
+	if (value != bd->data->product_code_val) {
 		dev_err(dev, "Invalid product code ID %02x (expected %02x)\n",
-			value, BD9571MWV_PRODUCT_CODE_VAL);
+			value, bd->data->product_code_val);
 		return -EINVAL;
 	}
-
 	ret = regmap_read(bd->regmap, BD9571MWV_PRODUCT_REVISION, &value);
 	if (ret) {
 		dev_err(dev, "Failed to read revision register (ret=%i)\n",
@@ -141,7 +150,8 @@ static int bd9571mwv_identify(struct bd9571mwv *bd)
 		return ret;
 	}
 
-	dev_info(dev, "Device: BD9571MWV rev. %d\n", value & 0xff);
+	dev_info(dev, "Device: %s rev. %d\n", bd->data->part_number,
+		 value & 0xff);
 
 	return 0;
 }
@@ -150,6 +160,7 @@ static int bd9571mwv_probe(struct i2c_client *client,
 			  const struct i2c_device_id *ids)
 {
 	struct bd9571mwv *bd;
+	unsigned int product_code;
 	int ret;
 
 	bd = devm_kzalloc(&client->dev, sizeof(*bd), GFP_KERNEL);
@@ -160,7 +171,25 @@ static int bd9571mwv_probe(struct i2c_client *client,
 	bd->dev = &client->dev;
 	bd->irq = client->irq;
 
-	bd->regmap = devm_regmap_init_i2c(client, &bd9571mwv_regmap_config);
+	/* Read the PMIC product code */
+	ret = i2c_smbus_read_byte_data(client, BD9571MWV_PRODUCT_CODE);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed reading at 0x%02x\n",
+			BD9571MWV_PRODUCT_CODE);
+		return ret;
+	}
+
+	product_code = (unsigned int)ret;
+	if (product_code == BD9571MWV_PRODUCT_CODE_VAL)
+		bd->data = &bd9571mwv_data;
+
+	if (!bd->data) {
+		dev_err(bd->dev, "No found supported device %d\n",
+			product_code);
+		return -ENOENT;
+	}
+
+	bd->regmap = devm_regmap_init_i2c(client, bd->data->regmap_config);
 	if (IS_ERR(bd->regmap)) {
 		dev_err(bd->dev, "Failed to initialize register map\n");
 		return PTR_ERR(bd->regmap);
@@ -171,14 +200,14 @@ static int bd9571mwv_probe(struct i2c_client *client,
 		return ret;
 
 	ret = regmap_add_irq_chip(bd->regmap, bd->irq, IRQF_ONESHOT, 0,
-				  &bd9571mwv_irq_chip, &bd->irq_data);
+				  bd->data->irq_chip, &bd->irq_data);
 	if (ret) {
 		dev_err(bd->dev, "Failed to register IRQ chip\n");
 		return ret;
 	}
 
-	ret = mfd_add_devices(bd->dev, PLATFORM_DEVID_AUTO, bd9571mwv_cells,
-			      ARRAY_SIZE(bd9571mwv_cells), NULL, 0,
+	ret = mfd_add_devices(bd->dev, PLATFORM_DEVID_AUTO, bd->data->cells,
+			      bd->data->num_cells, NULL, 0,
 			      regmap_irq_get_domain(bd->irq_data));
 	if (ret) {
 		regmap_del_irq_chip(bd->irq, bd->irq_data);
diff --git a/include/linux/mfd/bd9571mwv.h b/include/linux/mfd/bd9571mwv.h
index bcc7092..0126b52 100644
--- a/include/linux/mfd/bd9571mwv.h
+++ b/include/linux/mfd/bd9571mwv.h
@@ -3,6 +3,7 @@
  * ROHM BD9571MWV-M driver
  *
  * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
+ * Copyright (C) 2019 Renesas Electronics Corporation
  *
  * Based on the TPS65086 driver
  */
@@ -11,6 +12,7 @@
 #define __LINUX_MFD_BD9571MWV_H
 
 #include <linux/device.h>
+#include <linux/mfd/core.h>
 #include <linux/regmap.h>
 
 /* List of registers for BD9571MWV */
@@ -83,6 +85,8 @@
 
 #define BD9571MWV_ACCESS_KEY			0xff
 
+#define BD9571MWV_PART_NUMBER			"BD9571MWV"
+
 /* Define the BD9571MWV IRQ numbers */
 enum bd9571mwv_irqs {
 	BD9571MWV_IRQ_MD1,
@@ -96,6 +100,20 @@ enum bd9571mwv_irqs {
 };
 
 /**
+ * struct bd957x_data - internal data for the bd957x driver
+ *
+ * Internal data to distinguish bd9571mwv chip and bd9574mwf chip
+ */
+struct bd957x_data {
+	int product_code_val;
+	char *part_number;
+	const struct regmap_config *regmap_config;
+	const struct regmap_irq_chip *irq_chip;
+	const struct mfd_cell *cells;
+	int num_cells;
+};
+
+/**
  * struct bd9571mwv - state holder for the bd9571mwv driver
  *
  * Device data may be used to access the BD9571MWV chip
@@ -103,6 +121,7 @@ enum bd9571mwv_irqs {
 struct bd9571mwv {
 	struct device *dev;
 	struct regmap *regmap;
+	const struct bd957x_data *data;
 
 	/* IRQ Data */
 	int irq;
-- 
2.7.4

