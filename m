Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26D0312117B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 18:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfLPROY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 12:14:24 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:54167 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbfLPROX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 12:14:23 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 714DF40006;
        Mon, 16 Dec 2019 17:14:18 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC 06/11] media: i2c: Break out max9271 from rdacm20 driver
Date:   Mon, 16 Dec 2019 18:16:15 +0100
Message-Id: <20191216171620.372683-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Break out from the RDACMD20 camera module driver functions to handle
Maxim MAX9271 GMSL serializer. Several GMSL-compatible camera modules
use MAX9271 as embedded serializer and breaking it out to a library
module allows reusage across different camera module drivers.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/Makefile  |   3 +-
 drivers/media/i2c/max9271.c | 212 ++++++++++++++++++++++++++
 drivers/media/i2c/max9271.h |  84 +++++++++++
 drivers/media/i2c/rdacm20.c | 286 +++++-------------------------------
 4 files changed, 332 insertions(+), 253 deletions(-)
 create mode 100644 drivers/media/i2c/max9271.c
 create mode 100644 drivers/media/i2c/max9271.h

diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index c4f47ebe498f..693b7d742827 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -118,6 +118,7 @@ obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
 obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
 obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
-obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20.o
+rdacm20-camera_module-objs	:= rdacm20.o max9271.o
+obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20-camera_module.o
 
 obj-$(CONFIG_SDR_MAX2175) += max2175.o
diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
new file mode 100644
index 000000000000..c6a9def09fcd
--- /dev/null
+++ b/drivers/media/i2c/max9271.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * IMI RDACM20 GMSL Camera Driver
+ *
+ * Copyright (C) 2017-2018 Jacopo Mondi
+ * Copyright (C) 2017-2018 Kieran Bingham
+ * Copyright (C) 2017-2018 Laurent Pinchart
+ * Copyright (C) 2017-2018 Niklas Söderlund
+ * Copyright (C) 2016 Renesas Electronics Corporation
+ * Copyright (C) 2015 Cogent Embedded, Inc.
+ *
+ * This file exports functions to control Maxim MAX9271 GMSL serializer
+ * chip. This is not a self-contained driver, as MAX9271 is usually embedded in
+ * camera modules with at least one image sensor and optional additional
+ * components, such as uController units or ISPs/DSPs.
+ *
+ * Driver for the camera modules (ie rdacm20) are expected to use functions
+ * exported from this library file to maximize code re-use across drivers.
+ */
+#include <linux/delay.h>
+#include <linux/i2c.h>
+
+#include "max9271.h"
+
+static int max9271_read(struct max9271_device *dev, u8 reg)
+{
+	int ret;
+
+	dev_dbg(&dev->client->dev, "%s(0x%02x)\n", __func__, reg);
+
+	ret = i2c_smbus_read_byte_data(dev->client, reg);
+	if (ret < 0)
+		dev_dbg(&dev->client->dev,
+			"%s: register 0x%02x read failed (%d)\n",
+			__func__, reg, ret);
+
+	return ret;
+}
+
+static int max9271_write(struct max9271_device *dev, u8 reg, u8 val)
+{
+	int ret;
+
+	dev_dbg(&dev->client->dev, "%s(0x%02x, 0x%02x)\n", __func__, reg, val);
+
+	ret = i2c_smbus_write_byte_data(dev->client, reg, val);
+	if (ret < 0)
+		dev_err(&dev->client->dev,
+			"%s: register 0x%02x write failed (%d)\n",
+			__func__, reg, ret);
+
+	return ret;
+}
+
+/*
+ * max9271_pclk_detect() - Detect valid pixel clock from image sensor
+ *
+ * Wait up to 10ms for a valid pixel clock.
+ *
+ * Returns 0 for success, < 0 for pixel clock not properly detected
+ */
+static int max9271_pclk_detect(struct max9271_device *dev)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < 100; i++) {
+		ret = max9271_read(dev, 0x15);
+		if (ret < 0)
+			return ret;
+
+		if (ret & MAX9271_PCLKDET)
+			return 0;
+
+		usleep_range(50, 100);
+	}
+
+	dev_err(&dev->client->dev, "Unable to detect valid pixel clock\n");
+	return -EIO;
+}
+
+int max9271_s_stream(struct max9271_device *dev, bool enable)
+{
+	int ret;
+
+	if (enable) {
+		ret = max9271_pclk_detect(dev);
+		if (ret)
+			return ret;
+
+		/* Enable the serial link. */
+		max9271_write(dev, 0x04, MAX9271_SEREN | MAX9271_REVCCEN |
+			      MAX9271_FWDCCEN);
+	} else {
+		/* Disable the serial link. */
+		max9271_write(dev, 0x04, MAX9271_CLINKEN | MAX9271_REVCCEN |
+			      MAX9271_FWDCCEN);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(max9271_s_stream);
+
+int max9271_configure_i2c(struct max9271_device *dev)
+{
+	/*
+	 * Configure the I2C bus:
+	 *
+	 * - Enable high thresholds on the reverse channel
+	 * - Disable artificial ACK and set I2C speed
+	 */
+	max9271_write(dev, 0x08, MAX9271_REV_HIVTH);
+	usleep_range(5000, 8000);
+
+	max9271_write(dev, 0x0d, MAX9271_I2CSLVSH_469NS_234NS |
+		      MAX9271_I2CSLVTO_1024US | MAXIM_I2C_SPEED);
+	usleep_range(5000, 8000);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(max9271_configure_i2c);
+
+int max9271_configure_gmsl_link(struct max9271_device *dev)
+{
+	/*
+	 * Disable the serial link and enable the configuration link to allow
+	 * the control channel to operate in a low-speed mode in the absence of
+	 * the serial link clock.
+	 */
+	max9271_write(dev, 0x04, MAX9271_CLINKEN | MAX9271_REVCCEN |
+		      MAX9271_FWDCCEN);
+
+	/*
+	 * The serializer temporarily disables the reverse control channel for
+	 * 350µs after starting/stopping the forward serial link, but the
+	 * deserializer synchronization time isn't clearly documented.
+	 *
+	 * According to the serializer datasheet we should wait 3ms, while
+	 * according to the deserializer datasheet we should wait 5ms.
+	 *
+	 * Short delays here appear to show bit-errors in the writes following.
+	 * Therefore a conservative delay seems best here.
+	 */
+	usleep_range(5000, 8000);
+
+	/*
+	 * Configure the GMSL link:
+	 *
+	 * - Double input mode, high data rate, 24-bit mode
+	 * - Latch input data on PCLKIN rising edge
+	 * - Enable HS/VS encoding
+	 * - 1-bit parity error detection
+	 */
+	max9271_write(dev, 0x07, MAX9271_DBL | MAX9271_HVEN |
+		      MAX9271_EDC_1BIT_PARITY);
+	usleep_range(5000, 8000);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(max9271_configure_gmsl_link);
+
+int max9271_set_gpio(struct max9271_device *dev, u8 val)
+{
+	int ret = max9271_write(dev, 0x0f, val);
+	if (ret < 0) {
+		dev_err(&dev->client->dev, "Failed to set gpio (%d)\n", ret);
+		return ret;
+	}
+
+	usleep_range(10000, 20000);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(max9271_set_gpio);
+
+int max9271_verify_id(struct max9271_device *dev)
+{
+	int ret;
+
+	ret = max9271_read(dev, 0x1e);
+	if (ret < 0) {
+		dev_err(&dev->client->dev, "MAX9271 ID read failed (%d)\n",
+			ret);
+		return ret;
+	}
+
+	if (ret != MAX9271_ID) {
+		dev_err(&dev->client->dev, "MAX9271 ID mismatch (0x%02x)\n",
+			ret);
+		return -ENXIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(max9271_verify_id);
+
+int max9271_set_address(struct max9271_device *dev, u8 addr)
+{
+	int ret;
+
+	ret = max9271_write(dev, 0x00, addr << 1);
+	if (ret < 0) {
+		dev_err(&dev->client->dev,
+			"MAX9271 I2C address change failed (%d)\n", ret);
+		return ret;
+	}
+	dev->client->addr = addr;
+	usleep_range(3500, 5000);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(max9271_set_address);
diff --git a/drivers/media/i2c/max9271.h b/drivers/media/i2c/max9271.h
new file mode 100644
index 000000000000..bfe2d3b5f826
--- /dev/null
+++ b/drivers/media/i2c/max9271.h
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * IMI RDACM20 GMSL Camera Driver
+ *
+ * Copyright (C) 2017-2018 Jacopo Mondi
+ * Copyright (C) 2017-2018 Kieran Bingham
+ * Copyright (C) 2017-2018 Laurent Pinchart
+ * Copyright (C) 2017-2018 Niklas Söderlund
+ * Copyright (C) 2016 Renesas Electronics Corporation
+ * Copyright (C) 2015 Cogent Embedded, Inc.
+ */
+
+#include <linux/i2c.h>
+
+#define MAX9271_DEFAULT_ADDR	0x40
+
+#define MAXIM_I2C_I2C_SPEED_400KHZ	MAX9271_I2CMSTBT_339KBPS
+#define MAXIM_I2C_I2C_SPEED_100KHZ	MAX9271_I2CMSTBT_105KBPS
+#define MAXIM_I2C_SPEED			MAXIM_I2C_I2C_SPEED_100KHZ
+
+/* Register 0x04 */
+#define MAX9271_SEREN			BIT(7)
+#define MAX9271_CLINKEN			BIT(6)
+#define MAX9271_PRBSEN			BIT(5)
+#define MAX9271_SLEEP			BIT(4)
+#define MAX9271_INTTYPE_I2C		(0 << 2)
+#define MAX9271_INTTYPE_UART		(1 << 2)
+#define MAX9271_INTTYPE_NONE		(2 << 2)
+#define MAX9271_REVCCEN			BIT(1)
+#define MAX9271_FWDCCEN			BIT(0)
+/* Register 0x07 */
+#define MAX9271_DBL			BIT(7)
+#define MAX9271_DRS			BIT(6)
+#define MAX9271_BWS			BIT(5)
+#define MAX9271_ES			BIT(4)
+#define MAX9271_HVEN			BIT(2)
+#define MAX9271_EDC_1BIT_PARITY		(0 << 0)
+#define MAX9271_EDC_6BIT_CRC		(1 << 0)
+#define MAX9271_EDC_6BIT_HAMMING	(2 << 0)
+/* Register 0x08 */
+#define MAX9271_INVVS			BIT(7)
+#define MAX9271_INVHS			BIT(6)
+#define MAX9271_REV_LOGAIN		BIT(3)
+#define MAX9271_REV_HIVTH		BIT(0)
+/* Register 0x09 */
+#define MAX9271_ID			0x09
+/* Register 0x0d */
+#define MAX9271_I2CLOCACK		BIT(7)
+#define MAX9271_I2CSLVSH_1046NS_469NS	(3 << 5)
+#define MAX9271_I2CSLVSH_938NS_352NS	(2 << 5)
+#define MAX9271_I2CSLVSH_469NS_234NS	(1 << 5)
+#define MAX9271_I2CSLVSH_352NS_117NS	(0 << 5)
+#define MAX9271_I2CMSTBT_837KBPS	(7 << 2)
+#define MAX9271_I2CMSTBT_533KBPS	(6 << 2)
+#define MAX9271_I2CMSTBT_339KBPS	(5 << 2)
+#define MAX9271_I2CMSTBT_173KBPS	(4 << 2)
+#define MAX9271_I2CMSTBT_105KBPS	(3 << 2)
+#define MAX9271_I2CMSTBT_84KBPS		(2 << 2)
+#define MAX9271_I2CMSTBT_28KBPS		(1 << 2)
+#define MAX9271_I2CMSTBT_8KBPS		(0 << 2)
+#define MAX9271_I2CSLVTO_NONE		(3 << 0)
+#define MAX9271_I2CSLVTO_1024US		(2 << 0)
+#define MAX9271_I2CSLVTO_256US		(1 << 0)
+#define MAX9271_I2CSLVTO_64US		(0 << 0)
+/* Register 0x0f */
+#define MAX9271_GPIO5OUT		BIT(5)
+#define MAX9271_GPIO4OUT		BIT(4)
+#define MAX9271_GPIO3OUT		BIT(3)
+#define MAX9271_GPIO2OUT		BIT(2)
+#define MAX9271_GPIO1OUT		BIT(1)
+#define MAX9271_SETGPO			BIT(0)
+/* Register 0x15 */
+#define MAX9271_PCLKDET			BIT(0)
+
+struct max9271_device {
+	struct i2c_client *client;
+};
+
+int max9271_s_stream(struct max9271_device *dev, bool enable);
+int max9271_configure_i2c(struct max9271_device *dev);
+int max9271_configure_gmsl_link(struct max9271_device *dev);
+int max9271_set_gpio(struct max9271_device *dev, u8 val);
+int max9271_verify_id(struct max9271_device *dev);
+int max9271_set_address(struct max9271_device *dev, u8 addr);
diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 96bc2b793522..1a9c8d1f9484 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -28,69 +28,10 @@
 #include <media/v4l2-subdev.h>
 
 #include "rdacm20-ov10635.h"
+#include "max9271.h"
 
 #define RDACM20_SENSOR_HARD_RESET
 
-#define MAX9271_I2C_ADDRESS		0x40
-
-/* Register 0x04 */
-#define MAX9271_SEREN			BIT(7)
-#define MAX9271_CLINKEN			BIT(6)
-#define MAX9271_PRBSEN			BIT(5)
-#define MAX9271_SLEEP			BIT(4)
-#define MAX9271_INTTYPE_I2C		(0 << 2)
-#define MAX9271_INTTYPE_UART		(1 << 2)
-#define MAX9271_INTTYPE_NONE		(2 << 2)
-#define MAX9271_REVCCEN			BIT(1)
-#define MAX9271_FWDCCEN			BIT(0)
-/* Register 0x07 */
-#define MAX9271_DBL			BIT(7)
-#define MAX9271_DRS			BIT(6)
-#define MAX9271_BWS			BIT(5)
-#define MAX9271_ES			BIT(4)
-#define MAX9271_HVEN			BIT(2)
-#define MAX9271_EDC_1BIT_PARITY		(0 << 0)
-#define MAX9271_EDC_6BIT_CRC		(1 << 0)
-#define MAX9271_EDC_6BIT_HAMMING	(2 << 0)
-/* Register 0x08 */
-#define MAX9271_INVVS			BIT(7)
-#define MAX9271_INVHS			BIT(6)
-#define MAX9271_REV_LOGAIN		BIT(3)
-#define MAX9271_REV_HIVTH		BIT(0)
-/* Register 0x09 */
-#define MAX9271_ID			0x09
-/* Register 0x0d */
-#define MAX9271_I2CLOCACK		BIT(7)
-#define MAX9271_I2CSLVSH_1046NS_469NS	(3 << 5)
-#define MAX9271_I2CSLVSH_938NS_352NS	(2 << 5)
-#define MAX9271_I2CSLVSH_469NS_234NS	(1 << 5)
-#define MAX9271_I2CSLVSH_352NS_117NS	(0 << 5)
-#define MAX9271_I2CMSTBT_837KBPS	(7 << 2)
-#define MAX9271_I2CMSTBT_533KBPS	(6 << 2)
-#define MAX9271_I2CMSTBT_339KBPS	(5 << 2)
-#define MAX9271_I2CMSTBT_173KBPS	(4 << 2)
-#define MAX9271_I2CMSTBT_105KBPS	(3 << 2)
-#define MAX9271_I2CMSTBT_84KBPS		(2 << 2)
-#define MAX9271_I2CMSTBT_28KBPS		(1 << 2)
-#define MAX9271_I2CMSTBT_8KBPS		(0 << 2)
-#define MAX9271_I2CSLVTO_NONE		(3 << 0)
-#define MAX9271_I2CSLVTO_1024US		(2 << 0)
-#define MAX9271_I2CSLVTO_256US		(1 << 0)
-#define MAX9271_I2CSLVTO_64US		(0 << 0)
-/* Register 0x0f */
-#define MAX9271_GPIO5OUT		BIT(5)
-#define MAX9271_GPIO4OUT		BIT(4)
-#define MAX9271_GPIO3OUT		BIT(3)
-#define MAX9271_GPIO2OUT		BIT(2)
-#define MAX9271_GPIO1OUT		BIT(1)
-#define MAX9271_SETGPO			BIT(0)
-/* Register 0x15 */
-#define MAX9271_PCLKDET			BIT(0)
-
-#define MAXIM_I2C_I2C_SPEED_400KHZ	MAX9271_I2CMSTBT_339KBPS
-#define MAXIM_I2C_I2C_SPEED_100KHZ	MAX9271_I2CMSTBT_105KBPS
-#define MAXIM_I2C_SPEED			MAXIM_I2C_I2C_SPEED_100KHZ
-
 #define OV10635_I2C_ADDRESS		0x30
 
 #define OV10635_SOFTWARE_RESET		0x0103
@@ -106,7 +47,8 @@
 /* #define OV10635_FORMAT			MEDIA_BUS_FMT_UYVY10_2X10 */
 
 struct rdacm20_device {
-	struct i2c_client		*client;
+	struct device			*dev;
+	struct max9271_device		*serializer;
 	struct i2c_client		*sensor;
 	struct v4l2_subdev		sd;
 	struct media_pad		pad;
@@ -123,36 +65,6 @@ static inline struct rdacm20_device *i2c_to_rdacm20(struct i2c_client *client)
 	return sd_to_rdacm20(i2c_get_clientdata(client));
 }
 
-static int max9271_read(struct rdacm20_device *dev, u8 reg)
-{
-	int ret;
-
-	dev_dbg(&dev->client->dev, "%s(0x%02x)\n", __func__, reg);
-
-	ret = i2c_smbus_read_byte_data(dev->client, reg);
-	if (ret < 0)
-		dev_dbg(&dev->client->dev,
-			"%s: register 0x%02x read failed (%d)\n",
-			__func__, reg, ret);
-
-	return ret;
-}
-
-static int max9271_write(struct rdacm20_device *dev, u8 reg, u8 val)
-{
-	int ret;
-
-	dev_dbg(&dev->client->dev, "%s(0x%02x, 0x%02x)\n", __func__, reg, val);
-
-	ret = i2c_smbus_write_byte_data(dev->client, reg, val);
-	if (ret < 0)
-		dev_err(&dev->client->dev,
-			"%s: register 0x%02x write failed (%d)\n",
-			__func__, reg, ret);
-
-	return ret;
-}
-
 static int ov10635_read16(struct rdacm20_device *dev, u16 reg)
 {
 	u8 buf[2] = { reg >> 8, reg & 0xff };
@@ -163,8 +75,7 @@ static int ov10635_read16(struct rdacm20_device *dev, u16 reg)
 		ret = i2c_master_recv(dev->sensor, buf, 2);
 
 	if (ret < 0) {
-		dev_dbg(&dev->client->dev,
-			"%s: register 0x%04x read failed (%d)\n",
+		dev_dbg(dev->dev, "%s: register 0x%04x read failed (%d)\n",
 			__func__, reg, ret);
 		return ret;
 	}
@@ -177,7 +88,7 @@ static int __ov10635_write(struct rdacm20_device *dev, u16 reg, u8 val)
 	u8 buf[3] = { reg >> 8, reg & 0xff, val };
 	int ret;
 
-	dev_dbg(&dev->client->dev, "%s(0x%04x, 0x%02x)\n", __func__, reg, val);
+	dev_dbg(dev->dev, "%s(0x%04x, 0x%02x)\n", __func__, reg, val);
 
 	ret = i2c_master_send(dev->sensor, buf, 3);
 	return ret < 0 ? ret : 0;
@@ -189,8 +100,7 @@ static int ov10635_write(struct rdacm20_device *dev, u16 reg, u8 val)
 
 	ret = __ov10635_write(dev, reg, val);
 	if (ret < 0)
-		dev_err(&dev->client->dev,
-			"%s: register 0x%04x write failed (%d)\n",
+		dev_err(dev->dev, "%s: register 0x%04x write failed (%d)\n",
 			__func__, reg, ret);
 
 	return ret;
@@ -206,7 +116,7 @@ static int ov10635_set_regs(struct rdacm20_device *dev,
 	for (i = 0; i < nr_regs; i++) {
 		ret = __ov10635_write(dev, regs[i].reg, regs[i].val);
 		if (ret) {
-			dev_err(&dev->client->dev,
+			dev_err(dev->dev,
 				"%s: register %u (0x%04x) write failed (%d)\n",
 				__func__, i, regs[i].reg, ret);
 			return ret;
@@ -216,53 +126,11 @@ static int ov10635_set_regs(struct rdacm20_device *dev,
 	return 0;
 }
 
-/*
- * rdacm20_pclk_detect() - Detect valid pixel clock from image sensor
- *
- * Wait up to 10ms for a valid pixel clock.
- *
- * Returns 0 for success, < 0 for pixel clock not properly detected
- */
-static int rdacm20_pclk_detect(struct rdacm20_device *dev)
-{
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < 100; i++) {
-		ret = max9271_read(dev, 0x15);
-		if (ret < 0)
-			return ret;
-
-		if (ret & MAX9271_PCLKDET)
-			return 0;
-
-		usleep_range(50, 100);
-	}
-
-	dev_err(&dev->client->dev, "Unable to detect valid pixel clock\n");
-	return -EIO;
-}
-
 static int rdacm20_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct rdacm20_device *dev = sd_to_rdacm20(sd);
-	int ret;
-
-	if (enable) {
-		ret = rdacm20_pclk_detect(dev);
-		if (ret)
-			return ret;
-
-		/* Enable the serial link. */
-		max9271_write(dev, 0x04, MAX9271_SEREN | MAX9271_REVCCEN |
-			      MAX9271_FWDCCEN);
-	} else {
-		/* Disable the serial link. */
-		max9271_write(dev, 0x04, MAX9271_CLINKEN | MAX9271_REVCCEN |
-			      MAX9271_FWDCCEN);
-	}
 
-	return 0;
+	return max9271_s_stream(dev->serializer, enable);
 }
 
 static int rdacm20_enum_mbus_code(struct v4l2_subdev *sd,
@@ -313,108 +181,15 @@ static struct v4l2_subdev_ops rdacm20_subdev_ops = {
 	.pad		= &rdacm20_subdev_pad_ops,
 };
 
-static int max9271_configure_i2c(struct rdacm20_device *dev)
-{
-	/*
-	 * Configure the I2C bus:
-	 *
-	 * - Enable high thresholds on the reverse channel
-	 * - Disable artificial ACK and set I2C speed
-	 */
-	max9271_write(dev, 0x08, MAX9271_REV_HIVTH);
-	usleep_range(5000, 8000);
-
-	max9271_write(dev, 0x0d, MAX9271_I2CSLVSH_469NS_234NS |
-		      MAX9271_I2CSLVTO_1024US | MAXIM_I2C_SPEED);
-	usleep_range(5000, 8000);
-
-	return 0;
-}
-
-static int max9271_configure_gmsl_link(struct rdacm20_device *dev)
-{
-	/*
-	 * Disable the serial link and enable the configuration link to allow
-	 * the control channel to operate in a low-speed mode in the absence of
-	 * the serial link clock.
-	 */
-	max9271_write(dev, 0x04, MAX9271_CLINKEN | MAX9271_REVCCEN |
-		      MAX9271_FWDCCEN);
-
-	/*
-	 * The serializer temporarily disables the reverse control channel for
-	 * 350µs after starting/stopping the forward serial link, but the
-	 * deserializer synchronization time isn't clearly documented.
-	 *
-	 * According to the serializer datasheet we should wait 3ms, while
-	 * according to the deserializer datasheet we should wait 5ms.
-	 *
-	 * Short delays here appear to show bit-errors in the writes following.
-	 * Therefore a conservative delay seems best here.
-	 */
-	usleep_range(5000, 8000);
-
-	/*
-	 * Configure the GMSL link:
-	 *
-	 * - Double input mode, high data rate, 24-bit mode
-	 * - Latch input data on PCLKIN rising edge
-	 * - Enable HS/VS encoding
-	 * - 1-bit parity error detection
-	 */
-	max9271_write(dev, 0x07, MAX9271_DBL | MAX9271_HVEN |
-		      MAX9271_EDC_1BIT_PARITY);
-	usleep_range(5000, 8000);
-
-	return 0;
-}
-
-static int max9271_verify_id(struct rdacm20_device *dev)
-{
-	int ret;
-
-	ret = max9271_read(dev, 0x1e);
-	if (ret < 0) {
-		dev_err(&dev->client->dev, "MAX9271 ID read failed (%d)\n",
-			ret);
-		return ret;
-	}
-
-	if (ret != MAX9271_ID) {
-		dev_err(&dev->client->dev, "MAX9271 ID mismatch (0x%02x)\n",
-			ret);
-		return -ENXIO;
-	}
-
-	return 0;
-}
-
-static int max9271_configure_address(struct rdacm20_device *dev, u8 addr)
-{
-	int ret;
-
-	/* Change the MAX9271 I2C address. */
-	ret = max9271_write(dev, 0x00, addr << 1);
-	if (ret < 0) {
-		dev_err(&dev->client->dev,
-			"MAX9271 I2C address change failed (%d)\n", ret);
-		return ret;
-	}
-	dev->client->addr = addr;
-	usleep_range(3500, 5000);
-
-	return 0;
-}
-
 static int rdacm20_initialize(struct rdacm20_device *dev)
 {
 	u32 addrs[2];
 	int ret;
 
-	ret = of_property_read_u32_array(dev->client->dev.of_node, "reg",
+	ret = of_property_read_u32_array(dev->dev->of_node, "reg",
 					 addrs, ARRAY_SIZE(addrs));
 	if (ret < 0) {
-		dev_err(&dev->client->dev, "Invalid DT reg property\n");
+		dev_err(dev->dev, "Invalid DT reg property\n");
 		return -EINVAL;
 	}
 
@@ -423,41 +198,42 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	 * the address specified in DT. Set the client address back to the
 	 * default for initial communication.
 	 */
+
 	/* Create a dummy device, configure to that device, then change the
 	 * address. Then delete it when the address is changed?
 	 */
-	dev->client->addr = MAX9271_I2C_ADDRESS;
+	dev->serializer->client->addr = MAX9271_DEFAULT_ADDR;
 
-	/* Verify communication with the MAX9271. */
-	i2c_smbus_read_byte(dev->client);	/* ping to wake-up */
+	/* Verify communication with the MAX9271: ping to wakeup. */
+	i2c_smbus_read_byte(dev->serializer->client);
 
 	/*
 	 *  Ensure that we have a good link configuration before attempting to
 	 *  identify the device.
 	 */
-	max9271_configure_i2c(dev);
-	max9271_configure_gmsl_link(dev);
+	max9271_configure_i2c(dev->serializer);
+	max9271_configure_gmsl_link(dev->serializer);
 
-	ret = max9271_verify_id(dev);
+	ret = max9271_verify_id(dev->serializer);
 	if (ret < 0)
 		return ret;
 
-	ret = max9271_configure_address(dev, addrs[0]);
+	ret = max9271_set_address(dev->serializer, addrs[0]);
 	if (ret < 0)
 		return ret;
 
 	/* Reset and verify communication with the OV10635. */
 #ifdef RDACM20_SENSOR_HARD_RESET
 	/* Cycle the OV10635 reset signal connected to the MAX9271 GPIO1. */
-	max9271_write(dev, 0x0f, 0xff & ~(MAX9271_GPIO1OUT | MAX9271_SETGPO));
-	usleep_range(10000, 20000);
-	max9271_write(dev, 0x0f, 0xff & ~MAX9271_SETGPO);
-	usleep_range(10000, 20000);
+	max9271_set_gpio(dev->serializer,
+			 0xff & ~(MAX9271_GPIO1OUT | MAX9271_SETGPO));
+	max9271_set_gpio(dev->serializer,
+			0xff & ~MAX9271_SETGPO);
 #else
 	/* Perform a software reset. */
 	ret = ov10635_write(dev, OV10635_SOFTWARE_RESET, 1);
 	if (ret < 0) {
-		dev_err(&dev->client->dev, "OV10635 reset failed (%d)\n", ret);
+		dev_err(dev->dev, "OV10635 reset failed (%d)\n", ret);
 		return -ENXIO;
 	}
 
@@ -466,24 +242,24 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 
 	ret = ov10635_read16(dev, OV10635_PID);
 	if (ret < 0) {
-		dev_err(&dev->client->dev, "OV10635 ID read failed (%d)\n",
+		dev_err(dev->dev, "OV10635 ID read failed (%d)\n",
 			ret);
 		return -ENXIO;
 	}
 
 	if (ret != OV10635_VERSION) {
-		dev_err(&dev->client->dev, "OV10635 ID mismatch (0x%04x)\n",
+		dev_err(dev->dev, "OV10635 ID mismatch (0x%04x)\n",
 			ret);
 		return -ENXIO;
 	}
 
-	dev_info(&dev->client->dev, "Identified MAX9271 + OV10635 device\n");
+	dev_info(dev->dev, "Identified MAX9271 + OV10635 device\n");
 
 	/* Change the sensor I2C address. */
 	ret = ov10635_write(dev, OV10635_SC_CMMN_SCCB_ID,
 			    (addrs[1] << 1) | OV10635_SC_CMMN_SCCB_ID_SELECT);
 	if (ret < 0) {
-		dev_err(&dev->client->dev,
+		dev_err(dev->dev,
 			"OV10635 I2C address change failed (%d)\n", ret);
 		return ret;
 	}
@@ -504,8 +280,14 @@ static int rdacm20_probe(struct i2c_client *client)
 	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
+	dev->dev = &client->dev;
+
+	dev->serializer = devm_kzalloc(&client->dev, sizeof(*dev->serializer),
+				       GFP_KERNEL);
+	if (!dev->serializer)
+		return -ENOMEM;
 
-	dev->client = client;
+	dev->serializer->client = client;
 
 	/* Create the dummy I2C client for the sensor. */
 	dev->sensor = i2c_new_dummy(client->adapter, OV10635_I2C_ADDRESS);
-- 
2.24.0

