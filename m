Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8692701853
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 May 2023 18:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjEMQxE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 13 May 2023 12:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjEMQxD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 May 2023 12:53:03 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3D4393C21
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 May 2023 09:52:55 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,272,1677510000"; 
   d="scan'208";a="159221932"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 14 May 2023 01:52:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.8])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 28FFC40065DF;
        Sun, 14 May 2023 01:52:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v3 4/5] mfd: Add Renesas PMIC RAA215300 driver
Date:   Sat, 13 May 2023 17:52:26 +0100
Message-Id: <20230513165227.13117-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RAA215300 is a 9-channel PMIC that consists of
 * Internally compensated regulators
 * built-in Real Time Clock (RTC)
 * 32kHz crystal oscillator
 * coin cell battery charger

The RTC on RAA215300 is similar to the IP found in the ISL1208.
The existing driver for the ISL1208 works for this PMIC too,
however the RAA215300 exposes two devices via I2C, one for the RTC
IP, and one for everything else. The RTC IP has to be enabled
by the other I2C device, therefore this driver is necessary to get
the RTC to work.

The external oscillator bit is inverted on PMIC version 0x11.

Add PMIC RAA215300 driver for enabling RTC block and instantiating
RTC device based on PMIC version.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated commit description
 * Added support for handling "renesas,rtc-enabled" property.
 * Based on PMIC version, it instantiates rtc device by calling i2c_new_
   ancillary_device().
RFC->V2:
 * Dropped MODULE_SOFTDEP from the driver as it is added in RTC platform
   driver.
---
 drivers/mfd/Kconfig     |   7 +++
 drivers/mfd/Makefile    |   2 +
 drivers/mfd/raa215300.c | 102 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 drivers/mfd/raa215300.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e90463c4441c..9071b0f27b62 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -311,6 +311,13 @@ config MFD_CS47L92
 	help
 	  Support for Cirrus Logic CS42L92, CS47L92 and CS47L93 Smart Codecs
 
+config PMIC_RAA215300
+	tristate "Renesas RAA215300 driver"
+	select REGMAP_I2C
+	depends on I2C
+	help
+	  Support for the Renesas RAA215300 PMIC.
+
 config PMIC_DA903X
 	bool "Dialog Semiconductor DA9030/DA9034 PMIC Support"
 	depends on I2C=y
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 1d2392f06f78..d9c601120bfd 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -126,6 +126,8 @@ ifeq ($(CONFIG_SA1100_ASSABET),y)
 obj-$(CONFIG_MCP_UCB1200)	+= ucb1x00-assabet.o
 endif
 
+obj-$(CONFIG_PMIC_RAA215300)	+= raa215300.o
+
 obj-$(CONFIG_PMIC_DA903X)	+= da903x.o
 
 obj-$(CONFIG_PMIC_DA9052)	+= da9052-irq.o
diff --git a/drivers/mfd/raa215300.c b/drivers/mfd/raa215300.c
new file mode 100644
index 000000000000..aa149a88e2fb
--- /dev/null
+++ b/drivers/mfd/raa215300.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RAA215300 PMIC driver
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define RAA215300_REG_BLOCK_EN	0x6c
+#define RAA215300_HW_REV	0xf8
+
+#define RAA215300_RTC_DEFAULT_ADDR 0x6f
+#define RAA215300_REG_BLOCK_EN_RTC_EN	BIT(6)
+
+static bool raa215300_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return true;
+}
+
+static const struct regmap_config raa215300_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xff,
+	.volatile_reg = raa215300_is_volatile_reg,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static void raa215300_rtc_unregister_device(void *data)
+{
+	i2c_unregister_device(data);
+}
+
+static int raa215300_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	unsigned int pmic_version;
+	struct regmap *regmap;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -EOPNOTSUPP;
+
+	regmap = devm_regmap_init_i2c(client, &raa215300_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "regmap i2c init failed\n");
+
+	ret = regmap_read(regmap, RAA215300_HW_REV, &pmic_version);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "HW rev read failed\n");
+
+	dev_dbg(dev, "RAA215300 PMIC version 0x%04x\n", pmic_version);
+
+	if (of_property_read_bool(dev->of_node, "renesas,rtc-enabled"))  {
+		struct i2c_client *rtc_client;
+
+		/* Enable RTC block */
+		regmap_update_bits(regmap, RAA215300_REG_BLOCK_EN,
+				   RAA215300_REG_BLOCK_EN_RTC_EN,
+				   RAA215300_REG_BLOCK_EN_RTC_EN);
+
+		rtc_client = i2c_new_ancillary_device(client, "rtc",
+						      RAA215300_RTC_DEFAULT_ADDR,
+						      pmic_version >= 0x12 ?
+						      "isl1208" : "rtc_a0");
+		if (IS_ERR(rtc_client))
+			return PTR_ERR(rtc_client);
+
+		ret = devm_add_action_or_reset(dev,
+					       raa215300_rtc_unregister_device,
+					       rtc_client);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id raa215300_dt_match[] = {
+	{ .compatible = "renesas,raa215300" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, raa215300_dt_match);
+
+static struct i2c_driver raa215300_i2c_driver = {
+	.driver = {
+		.name = "raa215300",
+		.of_match_table = raa215300_dt_match,
+	},
+	.probe_new = raa215300_i2c_probe,
+};
+module_i2c_driver(raa215300_i2c_driver);
+
+MODULE_DESCRIPTION("Renesas RAA215300 PMIC driver");
+MODULE_AUTHOR("Fabrizio Castro <fabrizio.castro.jz@renesas.com>");
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

