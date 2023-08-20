Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2D51781CEA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 10:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbjHTIUv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 04:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbjHTIUs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 04:20:48 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 904EA10F5;
        Sun, 20 Aug 2023 01:20:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="173382663"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Aug 2023 17:20:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.18])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2BCDA400449D;
        Sun, 20 Aug 2023 17:20:08 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-leds@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] leds: pca955x: Convert enum->pointer for data in the match tables
Date:   Sun, 20 Aug 2023 09:20:05 +0100
Message-Id: <20230820082005.55124-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert enum->pointer for data in the match tables, so that
device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
bus type match support added to it.

Replace enum->struct *pca955x_chipdefs for data in the match table.
Simplify the probe() by replacing device_get_match_data() and ID lookup
for retrieving data by i2c_get_match_data().

While at it, add const definition to pca955x_chipdefs[].

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 drivers/leds/leds-pca955x.c | 45 +++++++++++++------------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index b10e1ef38db0..e28fd205678e 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -76,7 +76,7 @@ struct pca955x_chipdef {
 	int			slv_addr_shift;	/* Number of bits to ignore */
 };
 
-static struct pca955x_chipdef pca955x_chipdefs[] = {
+static const struct pca955x_chipdef pca955x_chipdefs[] = {
 	[pca9550] = {
 		.bits		= 2,
 		.slv_addr	= /* 110000x */ 0x60,
@@ -105,11 +105,11 @@ static struct pca955x_chipdef pca955x_chipdefs[] = {
 };
 
 static const struct i2c_device_id pca955x_id[] = {
-	{ "pca9550", pca9550 },
-	{ "pca9551", pca9551 },
-	{ "pca9552", pca9552 },
-	{ "ibm-pca9552", ibm_pca9552 },
-	{ "pca9553", pca9553 },
+	{ "pca9550", (kernel_ulong_t)&pca955x_chipdefs[pca9550] },
+	{ "pca9551", (kernel_ulong_t)&pca955x_chipdefs[pca9551] },
+	{ "pca9552", (kernel_ulong_t)&pca955x_chipdefs[pca9552] },
+	{ "ibm-pca9552", (kernel_ulong_t)&pca955x_chipdefs[ibm_pca9552] },
+	{ "pca9553", (kernel_ulong_t)&pca955x_chipdefs[pca9553] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca955x_id);
@@ -458,11 +458,11 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 }
 
 static const struct of_device_id of_pca955x_match[] = {
-	{ .compatible = "nxp,pca9550", .data = (void *)pca9550 },
-	{ .compatible = "nxp,pca9551", .data = (void *)pca9551 },
-	{ .compatible = "nxp,pca9552", .data = (void *)pca9552 },
-	{ .compatible = "ibm,pca9552", .data = (void *)ibm_pca9552 },
-	{ .compatible = "nxp,pca9553", .data = (void *)pca9553 },
+	{ .compatible = "nxp,pca9550", .data = &pca955x_chipdefs[pca9550] },
+	{ .compatible = "nxp,pca9551", .data = &pca955x_chipdefs[pca9551] },
+	{ .compatible = "nxp,pca9552", .data = &pca955x_chipdefs[pca9552] },
+	{ .compatible = "ibm,pca9552", .data = &pca955x_chipdefs[ibm_pca9552] },
+	{ .compatible = "nxp,pca9553", .data = &pca955x_chipdefs[pca9553] },
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_pca955x_match);
@@ -471,7 +471,7 @@ static int pca955x_probe(struct i2c_client *client)
 {
 	struct pca955x *pca955x;
 	struct pca955x_led *pca955x_led;
-	struct pca955x_chipdef *chip;
+	const struct pca955x_chipdef *chip;
 	struct led_classdev *led;
 	struct led_init_data init_data;
 	struct i2c_adapter *adapter;
@@ -480,24 +480,11 @@ static int pca955x_probe(struct i2c_client *client)
 	bool set_default_label = false;
 	bool keep_pwm = false;
 	char default_label[8];
-	enum pca955x_type chip_type;
-	const void *md = device_get_match_data(&client->dev);
-
-	if (md) {
-		chip_type = (enum pca955x_type)md;
-	} else {
-		const struct i2c_device_id *id = i2c_match_id(pca955x_id,
-							      client);
-
-		if (id) {
-			chip_type = (enum pca955x_type)id->driver_data;
-		} else {
-			dev_err(&client->dev, "unknown chip\n");
-			return -ENODEV;
-		}
-	}
 
-	chip = &pca955x_chipdefs[chip_type];
+	chip = i2c_get_match_data(&client->dev);
+	if (!chip)
+		return dev_err_probe(&client->dev, -ENODEV, "unknown chip\n");
+
 	adapter = client->adapter;
 	pdata = dev_get_platdata(&client->dev);
 	if (!pdata) {
-- 
2.25.1

