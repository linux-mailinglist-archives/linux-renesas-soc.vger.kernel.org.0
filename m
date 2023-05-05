Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 011C36F878F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 May 2023 19:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbjEERZw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 May 2023 13:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjEERZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 May 2023 13:25:51 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 37D27160BE
        for <linux-renesas-soc@vger.kernel.org>; Fri,  5 May 2023 10:25:50 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,252,1677510000"; 
   d="scan'208";a="161757935"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 May 2023 02:25:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.145])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3483B4073785;
        Sat,  6 May 2023 02:25:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
Date:   Fri,  5 May 2023 18:25:29 +0100
Message-Id: <20230505172530.357455-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently, it is not possible to instantiate the i2c client driver using
MFD cell as it is not a platform driver. Add support for Renesas PMIC
RAA215300 RTC platform driver, so that it can be instantiated by MFD API.
The rtc device is created by using i2c_new_ancillary_device() and 
it register as the rtc device by the helper function provided by
rtc-isl2108 driver.

The PMIC driver enables RTC device and share the PMIC revision to
RTC platform driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch
---
 drivers/mfd/Kconfig         |  7 +++++
 drivers/mfd/Makefile        |  1 +
 drivers/mfd/raa215300-rtc.c | 52 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/raa215300.c     | 38 ++++++++++++++++++++++++---
 4 files changed, 95 insertions(+), 3 deletions(-)
 create mode 100644 drivers/mfd/raa215300-rtc.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 9071b0f27b62..cec20c1f143d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -318,6 +318,13 @@ config PMIC_RAA215300
 	help
 	  Support for the Renesas RAA215300 PMIC.
 
+config PMIC_RAA215300_RTC
+	tristate "Renesas RAA215300 RTC driver"
+	depends on PMIC_RAA215300
+	select RTC_DRV_ISL1208
+	help
+	  Select this to get support for the Renesas RAA215300 RTC
+
 config PMIC_DA903X
 	bool "Dialog Semiconductor DA9030/DA9034 PMIC Support"
 	depends on I2C=y
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index d9c601120bfd..ed4b760e564e 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -127,6 +127,7 @@ obj-$(CONFIG_MCP_UCB1200)	+= ucb1x00-assabet.o
 endif
 
 obj-$(CONFIG_PMIC_RAA215300)	+= raa215300.o
+obj-$(CONFIG_PMIC_RAA215300_RTC)	+= raa215300-rtc.o
 
 obj-$(CONFIG_PMIC_DA903X)	+= da903x.o
 
diff --git a/drivers/mfd/raa215300-rtc.c b/drivers/mfd/raa215300-rtc.c
new file mode 100644
index 000000000000..309ed34d6cd7
--- /dev/null
+++ b/drivers/mfd/raa215300-rtc.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RAA215300 RTC Driver
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rtc/isl1208.h>
+
+#define RAA215300_RTC_DEFAULT_ADDR 0x6f
+
+static void raa215300_rtc_unregister_device(void *data)
+{
+	i2c_unregister_device(data);
+}
+
+static int raa215300_rtc_probe(struct platform_device *pdev)
+{
+	unsigned int *pmic_version = dev_get_drvdata(pdev->dev.parent);
+	struct i2c_client *client;
+	int ret;
+
+	client = i2c_new_ancillary_device(to_i2c_client(pdev->dev.parent),
+					  "rtc", RAA215300_RTC_DEFAULT_ADDR);
+	if (IS_ERR(client))
+		return PTR_ERR(client);
+
+	ret = devm_add_action_or_reset(&pdev->dev,
+				       raa215300_rtc_unregister_device, client);
+	if (ret < 0)
+		return ret;
+
+	return raa215300_rtc_probe_helper(client, *pmic_version);
+}
+
+static struct platform_driver raa215300_rtc_driver = {
+	.probe = raa215300_rtc_probe,
+	.driver = {
+		.name = "raa215300-rtc",
+	},
+};
+module_platform_driver(raa215300_rtc_driver);
+
+MODULE_DESCRIPTION("Renesas RAA215300 MFD RTC Driver");
+MODULE_ALIAS("platform:raa215300-rtc");
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_LICENSE("GPL");
+MODULE_SOFTDEP("post: rtc_isl1208");
diff --git a/drivers/mfd/raa215300.c b/drivers/mfd/raa215300.c
index 5cdd3213e99c..c8bdf96b203f 100644
--- a/drivers/mfd/raa215300.c
+++ b/drivers/mfd/raa215300.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/mfd/core.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
 
@@ -29,13 +30,26 @@ static const struct regmap_config raa215300_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const struct mfd_cell raa215300_rtc_dev[] = {
+	{ .name = "raa215300-rtc" }
+};
+
+static void raa215300_remove_devices(void *data)
+{
+	mfd_remove_devices(data);
+}
+
 static int raa215300_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	unsigned int pmic_version;
+	unsigned int *pmic_version;
 	struct regmap *regmap;
 	int ret;
 
+	pmic_version = devm_kzalloc(dev, sizeof(*pmic_version), GFP_KERNEL);
+	if (!pmic_version)
+		return -ENOMEM;
+
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -EOPNOTSUPP;
 
@@ -44,11 +58,29 @@ static int raa215300_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "regmap i2c init failed\n");
 
-	ret = regmap_read(regmap, RAA215300_HW_REV, &pmic_version);
+	ret = regmap_read(regmap, RAA215300_HW_REV, pmic_version);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "HW rev read failed\n");
 
-	dev_dbg(dev, "RAA215300 PMIC version 0x%04x\n", pmic_version);
+	dev_dbg(dev, "RAA215300 PMIC version 0x%04x\n", *pmic_version);
+	dev_set_drvdata(dev, pmic_version);
+
+	if (of_property_read_bool(dev->of_node, "renesas,rtc-enabled"))  {
+		/* Enable RTC block */
+		regmap_update_bits(regmap, RAA215300_REG_BLOCK_EN,
+				   RAA215300_REG_BLOCK_EN_RTC_EN,
+				   RAA215300_REG_BLOCK_EN_RTC_EN);
+
+		ret = mfd_add_devices(dev, 0, raa215300_rtc_dev,
+				      ARRAY_SIZE(raa215300_rtc_dev), NULL,
+				      0, NULL);
+		if (ret < 0)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, raa215300_remove_devices, dev);
+		if (ret < 0)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.25.1

