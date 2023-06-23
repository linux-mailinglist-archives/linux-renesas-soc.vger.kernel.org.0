Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F31A73B96E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jun 2023 16:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbjFWOKK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jun 2023 10:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbjFWOKI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jun 2023 10:10:08 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 33B832696
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jun 2023 07:10:06 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,152,1684767600"; 
   d="scan'208";a="168705968"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jun 2023 23:10:05 +0900
Received: from localhost.localdomain (unknown [10.226.93.107])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6A5EB4270489;
        Fri, 23 Jun 2023 23:10:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v7 02/10] regulator: Add Renesas PMIC RAA215300 driver
Date:   Fri, 23 Jun 2023 15:09:40 +0100
Message-Id: <20230623140948.384762-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623140948.384762-1-biju.das.jz@bp.renesas.com>
References: <20230623140948.384762-1-biju.das.jz@bp.renesas.com>
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
v6->v7:
 * Replaced i2c_new_ancillary_device->i2c_new_client_device for client
   instantiation.
 * Introduced raa215300_clk_present() to find crystal or clock source is
   connected to the PMIC device.
 * Registered clk_dev, so that without any code change sibling device can 
   use the same clk API's for retrieving the clk details.
 * The optional irq is shared to sibling device by struct i2c_board_info.
 * Added code changes for clearing all blocks except RTC. Currently IRQ
   handling only supported in RTC driver. Enabling other blocks will lead
   to IRQ storm, if there is any fault.
 * In probe() latched registers are cleared and PMIC interrupts are masked
   to avoid IRQ storm.
v5->v6:
 * Updated the driver header comment block in C++ style
 * Dropped cache for registers.
 * Dropped check for I2C functionality
v4->v5:
 * Dropped clk.h and started using of_property_present to check the
   clocks.
v3->v4:
 * Moved from mfd->regulator as it doesn't use MFD APIs
 * Dropped handling "renesas,rtc-enabled" property and instead used
   clock-names to determine RTC is enabled or not and then instantiating
   RTC device.
v2->v3:
 * Updated commit description
 * Added support for handling "renesas,rtc-enabled" property.
 * Based on PMIC version, it instantiates rtc device by calling i2c_new_
   ancillary_device().
RFC->V2:
 * Dropped MODULE_SOFTDEP from the driver as it is added in RTC platform
   driver.
---
 drivers/regulator/Kconfig     |   7 ++
 drivers/regulator/Makefile    |   1 +
 drivers/regulator/raa215300.c | 190 ++++++++++++++++++++++++++++++++++
 3 files changed, 198 insertions(+)
 create mode 100644 drivers/regulator/raa215300.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index c0aa3800a9e9..2c2405024ace 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1033,6 +1033,13 @@ config REGULATOR_QCOM_USB_VBUS
 	  Say M here if you want to include support for enabling the VBUS output
 	  as a module. The module will be named "qcom_usb_vbus_regulator".
 
+config REGULATOR_RAA215300
+	tristate "Renesas RAA215300 driver"
+	select REGMAP_I2C
+	depends on I2C
+	help
+	  Support for the Renesas RAA215300 PMIC.
+
 config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
 	tristate "Raspberry Pi 7-inch touchscreen panel ATTINY regulator"
 	depends on BACKLIGHT_CLASS_DEVICE
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 81747885ec97..ebfa75379c20 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -124,6 +124,7 @@ obj-$(CONFIG_REGULATOR_TPS51632) += tps51632-regulator.o
 obj-$(CONFIG_REGULATOR_PBIAS) += pbias-regulator.o
 obj-$(CONFIG_REGULATOR_PCAP) += pcap-regulator.o
 obj-$(CONFIG_REGULATOR_PCF50633) += pcf50633-regulator.o
+obj-$(CONFIG_REGULATOR_RAA215300) += raa215300.o
 obj-$(CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY)  += rpi-panel-attiny-regulator.o
 obj-$(CONFIG_REGULATOR_RC5T583)  += rc5t583-regulator.o
 obj-$(CONFIG_REGULATOR_RK808)   += rk808-regulator.o
diff --git a/drivers/regulator/raa215300.c b/drivers/regulator/raa215300.c
new file mode 100644
index 000000000000..24a1c89f5dbc
--- /dev/null
+++ b/drivers/regulator/raa215300.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Renesas RAA215300 PMIC driver
+//
+// Copyright (C) 2023 Renesas Electronics Corporation
+//
+
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define RAA215300_FAULT_LATCHED_STATUS_1	0x59
+#define RAA215300_FAULT_LATCHED_STATUS_2	0x5a
+#define RAA215300_FAULT_LATCHED_STATUS_3	0x5b
+#define RAA215300_FAULT_LATCHED_STATUS_4	0x5c
+#define RAA215300_FAULT_LATCHED_STATUS_6	0x5e
+
+#define RAA215300_INT_MASK_1	0x64
+#define RAA215300_INT_MASK_2	0x65
+#define RAA215300_INT_MASK_3	0x66
+#define RAA215300_INT_MASK_4	0x67
+#define RAA215300_INT_MASK_6	0x68
+
+#define RAA215300_REG_BLOCK_EN	0x6c
+#define RAA215300_HW_REV	0xf8
+
+#define RAA215300_INT_MASK_1_ALL	GENMASK(5, 0)
+#define RAA215300_INT_MASK_2_ALL	GENMASK(3, 0)
+#define RAA215300_INT_MASK_3_ALL	GENMASK(5, 0)
+#define RAA215300_INT_MASK_4_ALL	BIT(0)
+#define RAA215300_INT_MASK_6_ALL	GENMASK(7, 0)
+
+#define RAA215300_REG_BLOCK_EN_RTC_EN	BIT(6)
+#define RAA215300_RTC_DEFAULT_ADDR	0x6f
+
+const char *clkin_name = "clkin";
+const char *xin_name = "xin";
+static struct clk *clk;
+
+static const struct regmap_config raa215300_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xff,
+};
+
+static void raa215300_rtc_unregister_device(void *data)
+{
+	i2c_unregister_device(data);
+	if (!clk) {
+		clk_unregister_fixed_rate(clk);
+		clk = NULL;
+	}
+}
+
+static int raa215300_clk_present(struct i2c_client *client, const char *name)
+{
+	struct clk *clk;
+
+	clk = devm_clk_get_optional(&client->dev, name);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	return !!clk;
+}
+
+static int raa215300_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	const char *clk_name = xin_name;
+	unsigned int pmic_version, val;
+	struct regmap *regmap;
+	int ret;
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
+	/* Clear all blocks except RTC, if enabled */
+	regmap_read(regmap, RAA215300_REG_BLOCK_EN, &val);
+	val &= RAA215300_REG_BLOCK_EN_RTC_EN;
+	regmap_write(regmap, RAA215300_REG_BLOCK_EN, val);
+
+	/*Clear the latched registers */
+	regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_1, &val);
+	regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_1, val);
+	regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_2, &val);
+	regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_2, val);
+	regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_3, &val);
+	regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_3, val);
+	regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_4, &val);
+	regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_4, val);
+	regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_6, &val);
+	regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_6, val);
+
+	/* Mask all the PMIC interrupts */
+	regmap_write(regmap, RAA215300_INT_MASK_1, RAA215300_INT_MASK_1_ALL);
+	regmap_write(regmap, RAA215300_INT_MASK_2, RAA215300_INT_MASK_2_ALL);
+	regmap_write(regmap, RAA215300_INT_MASK_3, RAA215300_INT_MASK_3_ALL);
+	regmap_write(regmap, RAA215300_INT_MASK_4, RAA215300_INT_MASK_4_ALL);
+	regmap_write(regmap, RAA215300_INT_MASK_6, RAA215300_INT_MASK_6_ALL);
+
+	ret = raa215300_clk_present(client, xin_name);
+	if (ret < 0) {
+		return ret;
+	} else if (!ret) {
+		ret = raa215300_clk_present(client, clkin_name);
+		if (ret < 0)
+			return ret;
+
+		clk_name = clkin_name;
+	}
+
+	if (ret) {
+		char *name = pmic_version >= 0x12 ? "isl1208" : "raa215300_a0";
+		struct device_node *np = client->dev.of_node;
+		u32 addr = RAA215300_RTC_DEFAULT_ADDR;
+		struct i2c_board_info info = {};
+		struct i2c_client *rtc_client;
+		ssize_t size;
+
+		clk = clk_register_fixed_rate(NULL, clk_name, NULL, 0, 32000);
+		clk_register_clkdev(clk, clk_name, NULL);
+
+		if (np) {
+			int i;
+
+			i = of_property_match_string(np, "reg-names", "rtc");
+			if (i >= 0)
+				of_property_read_u32_index(np, "reg", i, &addr);
+		}
+
+		info.addr = addr;
+		if (client->irq > 0)
+			info.irq = client->irq;
+
+		size = strscpy(info.type, name, sizeof(info.type));
+		if (size < 0)
+			return dev_err_probe(dev, size,
+					     "Invalid device name: %s\n", name);
+
+		/* Enable RTC block */
+		regmap_update_bits(regmap, RAA215300_REG_BLOCK_EN,
+				   RAA215300_REG_BLOCK_EN_RTC_EN,
+				   RAA215300_REG_BLOCK_EN_RTC_EN);
+
+		rtc_client = i2c_new_client_device(client->adapter, &info);
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

