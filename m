Return-Path: <linux-renesas-soc+bounces-17956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA06AD1637
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 02:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 580B716A1B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 00:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23672F30;
	Mon,  9 Jun 2025 00:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CXern0UQ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JN8MuGZ2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2AB28F1;
	Mon,  9 Jun 2025 00:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749427701; cv=none; b=SsmgqjONg9UIt5xCDTUcxKyUrRd/y/xzU2L9C43wprmODLUijrhyfVxs9ZipEwkMTpLFHuUD21xGrEr61HR4FGiNj8ftMz3z/+Z4ppSdgYGs7SKQRj7ABwY7YGhU6SVOF1BabP9ltkMMjOsVPPXYHTi4JKtq30B7uvTgiS3eyDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749427701; c=relaxed/simple;
	bh=fED5QEN2feX+eoIgsM4la+Yh5ttUqShMYZiw5DcHxpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPc8EhQxEtDitfzkAkNGj+G7v60cNcIcfPQog5kFgohE2Ut1yD3jKsq2BtvOwh3c+oiRVpDRLv4PY+1XfZXkS2bu3W+ZYXYnLBpeu8J8SsD+ZfqqbUYIlZqawSEUqHEQZWpr4Ats7kDZYjH9BAPmFCBTZhTeO1Q9ehDZ16uSSN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CXern0UQ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JN8MuGZ2; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bFshL00cwz9tJR;
	Mon,  9 Jun 2025 02:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749427698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAweAZg4dWwJLo+81vLYXM1tyKY29Oi765eX3QjZTKI=;
	b=CXern0UQ49VkOu8XOKrXfmR6v/coq2kSf3PWwSIaII+MXEGSCG3hLXp9DuLPBM8Jx0ghoy
	Eyo8HErEg8ONWwYr3w02JM1yQjTdOEEElcwoasJte9WGmb5zLW3HI0MfUqvk/XLP6EG5UZ
	hqaq508IMI94MDgFGkkITbkEzK5d3drGjsPw7MG55NJvbS5YP9BSDI1gR+rl/sHkGyxxWk
	bdfck0g1NIprJRMBRuj/K9Xm7vN5ja/pACTH5NqnWB1QHqoHEX8VCuCZV2ibEyHg3uNCex
	3paHTIa6wOAZkexqDux3S1Bm/OIuJfSQmztfyPzluiyYPqXUvJ9H5+SOXbnsxQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749427695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAweAZg4dWwJLo+81vLYXM1tyKY29Oi765eX3QjZTKI=;
	b=JN8MuGZ2zHoYDSldhkUbm0bT+R3x6OXBRHszcUuq2gbi8URXguzRlPKao7JSYtyeDsM7Fv
	PdGAEbnbdrjmFSTVZvozN9LHheJqJk4LYOJ7zxcAMkzTGTsVEptZiZaM7EZIaOSPoH3UZj
	8hWoTiHby8aXvOwVNEtLqo+rKjsjFP1Evr6MWy0lXOKctViLvKjGGSL67r4DZ/+1pH3+vx
	DxI0aHhLR4bGzBXivFlzYEhjCKbYSxKsl4/235TdwmlfLEoSAXatWxxXdYb35fG1ZTMv/3
	bLq9Wjuu6D1fPsYJZpBc+6bl1OQfrnvHufPxIqYcW6vL7gDHMfQs1zvghYbE5Q==
To: linux-arm-kernel@lists.infradead.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH 2/2] regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280
Date: Mon,  9 Jun 2025 02:06:42 +0200
Message-ID: <20250609000748.1665219-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
References: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3e13s6q4d7cfa54f788cuqtm8x3ot3qg
X-MBO-RS-ID: a313380a87c061665cd

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Add regulator for the 7" Raspberry Pi 720x1280 DSI panel based on ili9881.
This is the Raspberry Pi DSI Panel V2. The newer Raspberry Pi 5" and 7"
panels have a slightly different register map to the original one. Add a
new driver for this "regulator" chip, this time by exposing two GPIOs and
one PWM controller, both of which can be consumed by panel driver and
pwm-backlight respectively.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Loosely based on:
https://github.com/raspberrypi/linux 3c07b87e877e ("regulator: Add a regulator for the new LCD panels")]
https://github.com/raspberrypi/linux 68c59b9e6275 ("regulator: rpi_panel_v2: Add remove and shutdown hooks")]
---
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
---
 drivers/regulator/Kconfig                  |  10 ++
 drivers/regulator/Makefile                 |   1 +
 drivers/regulator/rpi-panel-v2-regulator.c | 114 +++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 drivers/regulator/rpi-panel-v2-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 6d8988387da4..21ad6d938e4d 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1153,6 +1153,16 @@ config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
 	  touchscreen unit. The regulator is used to enable power to the
 	  TC358762, display and to control backlight.
 
+config REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2
+	tristate "Raspberry Pi 7-inch touchscreen panel V2 regulator"
+	depends on I2C
+	select GPIO_REGMAP
+	select REGMAP_I2C
+	help
+	  This driver supports regulator on the V2 Raspberry Pi touchscreen
+	  unit. The regulator is used to enable power to the display and to
+	  control backlight PWM.
+
 config REGULATOR_RC5T583
 	tristate "RICOH RC5T583 Power regulators"
 	depends on MFD_RC5T583
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index c0bc7a0f4e67..be98b29d6675 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -136,6 +136,7 @@ obj-$(CONFIG_REGULATOR_PBIAS) += pbias-regulator.o
 obj-$(CONFIG_REGULATOR_PCAP) += pcap-regulator.o
 obj-$(CONFIG_REGULATOR_RAA215300) += raa215300.o
 obj-$(CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY)  += rpi-panel-attiny-regulator.o
+obj-$(CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2)  += rpi-panel-v2-regulator.o
 obj-$(CONFIG_REGULATOR_RC5T583)  += rc5t583-regulator.o
 obj-$(CONFIG_REGULATOR_RK808)   += rk808-regulator.o
 obj-$(CONFIG_REGULATOR_RN5T618) += rn5t618-regulator.o
diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
new file mode 100644
index 000000000000..b77383584a3a
--- /dev/null
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Raspberry Pi Ltd.
+ * Copyright (C) 2025 Marek Vasut
+ */
+
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+
+/* I2C registers of the microcontroller. */
+#define REG_ID		0x01
+#define REG_POWERON	0x02
+#define REG_PWM		0x03
+
+/* Bits for poweron register */
+#define LCD_RESET_BIT	BIT(0)
+#define CTP_RESET_BIT	BIT(1)
+
+/* Bits for the PWM register */
+#define PWM_BL_ENABLE	BIT(7)
+#define PWM_BL_MASK	GENMASK(4, 0)
+
+/* Treat LCD_RESET and CTP_RESET as GPIOs */
+#define NUM_GPIO	2
+
+static const struct regmap_config rpi_panel_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = REG_PWM,
+	.can_sleep = true,
+};
+
+static int rpi_panel_v2_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+				  const struct pwm_state *state)
+{
+	struct regmap *regmap = pwmchip_get_drvdata(chip);
+	unsigned int duty;
+
+	if (state->polarity != PWM_POLARITY_NORMAL)
+		return -EINVAL;
+
+	if (!state->enabled)
+		return regmap_write(regmap, REG_PWM, 0);
+
+	duty = pwm_get_relative_duty_cycle(state, PWM_BL_MASK);
+	return regmap_write(regmap, REG_PWM, duty | PWM_BL_ENABLE);
+}
+
+static const struct pwm_ops rpi_panel_v2_pwm_ops = {
+	.apply = rpi_panel_v2_pwm_apply,
+};
+
+/*
+ * I2C driver interface functions
+ */
+static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
+{
+	struct gpio_regmap_config gconfig = {
+		.ngpio		= NUM_GPIO,
+		.ngpio_per_reg	= NUM_GPIO,
+		.parent		= &i2c->dev,
+		.reg_set_base	= REG_POWERON,
+	};
+	struct regmap *regmap;
+	struct pwm_chip *pc;
+	int ret;
+
+	pc = devm_pwmchip_alloc(&i2c->dev, 1, 0);
+	if (IS_ERR(pc))
+		return PTR_ERR(pc);
+
+	pc->ops = &rpi_panel_v2_pwm_ops;
+
+	regmap = devm_regmap_init_i2c(i2c, &rpi_panel_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&i2c->dev, PTR_ERR(regmap), "Failed to allocate regmap\n");
+
+	pwmchip_set_drvdata(pc, regmap);
+
+	regmap_write(regmap, REG_POWERON, 0);
+
+	gconfig.regmap = regmap;
+	ret = PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&i2c->dev, &gconfig));
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret, "Failed to create gpiochip\n");
+
+	return devm_pwmchip_add(&i2c->dev, pc);
+}
+
+static const struct of_device_id rpi_panel_v2_dt_ids[] = {
+	{ .compatible = "raspberrypi,touchscreen-panel-regulator-v2" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, rpi_panel_v2_dt_ids);
+
+static struct i2c_driver rpi_panel_v2_regulator_driver = {
+	.driver = {
+		.name = "rpi_touchscreen_v2",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = of_match_ptr(rpi_panel_v2_dt_ids),
+	},
+	.probe = rpi_panel_v2_i2c_probe,
+};
+
+module_i2c_driver(rpi_panel_v2_regulator_driver);
+
+MODULE_AUTHOR("Dave Stevenson <dave.stevenson@raspberrypi.com>");
+MODULE_DESCRIPTION("Regulator device driver for Raspberry Pi 7-inch V2 touchscreen");
+MODULE_LICENSE("GPL");
-- 
2.47.2


