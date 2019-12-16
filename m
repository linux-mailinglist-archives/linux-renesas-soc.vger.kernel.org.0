Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 130CD12117C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 18:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfLPRO0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 12:14:26 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:34905 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfLPRO0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 12:14:26 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3CC834000E;
        Mon, 16 Dec 2019 17:14:23 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC 10/11] WIP: media: i2c: rdacm20: Add RDACM21 support
Date:   Mon, 16 Dec 2019 18:16:19 +0100
Message-Id: <20191216171620.372683-11-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support to the rdacm20 driver for the RDACM21 camera module.

The RDACM21 camera modules includes a max9271 serializer, an OV490 ISP
in conjuction with an OV10640 imager.

This patch implements partial support, up to the point where
communications with the ISP chip are verified.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/imi,rdacm20.yaml       |   5 +-
 drivers/media/i2c/rdacm20.c                   | 183 +++++++++++++++---
 2 files changed, 156 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/imi,rdacm20.yaml b/Documentation/devicetree/bindings/media/i2c/imi,rdacm20.yaml
index 76740e285f44..18f8d1fbdbae 100644
--- a/Documentation/devicetree/bindings/media/i2c/imi,rdacm20.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imi,rdacm20.yaml
@@ -48,7 +48,10 @@ properties:
     const: 0
 
   compatible:
-    const: imi,rdacm20
+    items:
+      - enum:
+        - imi,rdacm20
+        - imi,rdacm21
 
   reg:
     description: -|
diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 1a9c8d1f9484..0431bbb5cbd3 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -20,6 +20,7 @@
 #include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
@@ -33,6 +34,10 @@
 #define RDACM20_SENSOR_HARD_RESET
 
 #define OV10635_I2C_ADDRESS		0x30
+#define ATTINY85_I2C_ADDRESS		0x50
+
+#define OV10640_I2C_ADDRESS		0x30
+#define OV490_I2C_ADDRESS		0x24
 
 #define OV10635_SOFTWARE_RESET		0x0103
 #define OV10635_PID			0x300a
@@ -46,15 +51,29 @@
 #define OV10635_FORMAT			MEDIA_BUS_FMT_UYVY8_2X8
 /* #define OV10635_FORMAT			MEDIA_BUS_FMT_UYVY10_2X10 */
 
+#define OV490_PID			0x300a
+#define OV490_VER			0x300b
+#define OV490_ID_VAL			0x0490
+#define OV490_ID(_p, _v)		((_p) << 8 | (_v) & 0xff)
+
+struct rdacm_data;
+
 struct rdacm20_device {
 	struct device			*dev;
 	struct max9271_device		*serializer;
 	struct i2c_client		*sensor;
+	const struct rdacm_data		*data;
 	struct v4l2_subdev		sd;
 	struct media_pad		pad;
 	struct v4l2_ctrl_handler	ctrls;
 };
 
+struct rdacm_data {
+	char *devname;
+	int (*sensor_probe)(struct rdacm20_device *dev);
+	unsigned int default_addrs[2];
+};
+
 static inline struct rdacm20_device *sd_to_rdacm20(struct v4l2_subdev *sd)
 {
 	return container_of(sd, struct rdacm20_device, sd);
@@ -181,8 +200,9 @@ static struct v4l2_subdev_ops rdacm20_subdev_ops = {
 	.pad		= &rdacm20_subdev_pad_ops,
 };
 
-static int rdacm20_initialize(struct rdacm20_device *dev)
+static int rdacm20_sensor_probe(struct rdacm20_device *dev)
 {
+	const struct rdacm_data *data = dev->data;
 	u32 addrs[2];
 	int ret;
 
@@ -193,34 +213,7 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 		return -EINVAL;
 	}
 
-	/*
-	 * FIXME: The MAX9271 boots at a default address that we will change to
-	 * the address specified in DT. Set the client address back to the
-	 * default for initial communication.
-	 */
-
-	/* Create a dummy device, configure to that device, then change the
-	 * address. Then delete it when the address is changed?
-	 */
-	dev->serializer->client->addr = MAX9271_DEFAULT_ADDR;
-
-	/* Verify communication with the MAX9271: ping to wakeup. */
-	i2c_smbus_read_byte(dev->serializer->client);
-
-	/*
-	 *  Ensure that we have a good link configuration before attempting to
-	 *  identify the device.
-	 */
-	max9271_configure_i2c(dev->serializer);
-	max9271_configure_gmsl_link(dev->serializer);
-
-	ret = max9271_verify_id(dev->serializer);
-	if (ret < 0)
-		return ret;
-
-	ret = max9271_set_address(dev->serializer, addrs[0]);
-	if (ret < 0)
-		return ret;
+	dev->sensor->addr = data->default_addrs[0];
 
 	/* Reset and verify communication with the OV10635. */
 #ifdef RDACM20_SENSOR_HARD_RESET
@@ -271,6 +264,106 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 				ARRAY_SIZE(ov10635_regs_wizard));
 }
 
+static int rdacm21_sensor_probe(struct rdacm20_device *dev)
+{
+	const struct rdacm_data *data = dev->data;
+	u32 addrs[2];
+	u8 pid, ver;
+	int ret;
+
+	ret = of_property_read_u32_array(dev->dev->of_node, "reg",
+					 addrs, ARRAY_SIZE(addrs));
+	if (ret < 0) {
+		dev_err(dev->dev, "Invalid DT reg property\n");
+		return -EINVAL;
+	}
+
+	/* Verify communications with OV490 by reading its product ID. */
+	dev->sensor->addr = data->default_addrs[1];
+	ret = ov10635_write(dev, 0xfffd, 0x80);
+	if (ret)
+		return ret;
+
+	ret = ov10635_write(dev, 0xfffe, 0x80);
+	if (ret)
+		return ret;
+
+	ret = ov10635_read16(dev, OV490_PID);
+	if (ret < 0) {
+		dev_err(dev->dev, "OV490 PID read failed (%d)\n", ret);
+		return ret;
+	}
+	pid = ret;
+
+	ret = ov10635_read16(dev, OV490_VER);
+	if (ret < 0) {
+		dev_err(dev->dev, "OV490 VERSION read failed (%d)\n", ret);
+		return ret;
+	}
+	ver = ret;
+
+	if (OV490_ID(pid, ver) != OV490_ID_VAL) {
+		dev_dbg(dev->dev, "OV490 ID mismatch: (0x%04x)\n",
+			OV490_ID(pid, ver));
+		return -ENODEV;
+	}
+
+	dev_info(dev->dev, "Identified MAX9271 + OV490 + OV10640 device\n");
+
+	/*
+	 * TODO: program MAX9271 to perform address translation to talk with
+	 * OV490 from the SoC side.
+	 */
+
+	return 0;
+}
+
+static int rdacm20_initialize(struct rdacm20_device *dev)
+{
+	u32 addrs[2];
+	int ret;
+
+	ret = of_property_read_u32_array(dev->dev->of_node, "reg",
+					 addrs, ARRAY_SIZE(addrs));
+	if (ret < 0) {
+		dev_err(dev->dev, "Invalid DT reg property\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * FIXME: The MAX9271 boots at a default address that we will change to
+	 * the address specified in DT. Set the client address back to the
+	 * default for initial communication.
+	 */
+
+	/* Create a dummy device, configure to that device, then change the
+	 * address. Then delete it when the address is changed?
+	 */
+	dev->serializer->client->addr = MAX9271_DEFAULT_ADDR;
+
+	/* Verify communication with the MAX9271: ping to wakeup. */
+	i2c_smbus_read_byte(dev->serializer->client);
+
+	/*
+	 *  Ensure that we have a good link configuration before attempting to
+	 *  identify the device.
+	 */
+	max9271_configure_gmsl_link(dev->serializer);
+	max9271_configure_i2c(dev->serializer);
+
+	ret = max9271_verify_id(dev->serializer);
+	if (ret < 0)
+		return ret;
+
+	ret = max9271_set_address(dev->serializer, addrs[0]);
+	if (ret < 0)
+		return ret;
+
+	return dev->data->sensor_probe(dev);
+
+	return 0;
+}
+
 static int rdacm20_probe(struct i2c_client *client)
 {
 	struct rdacm20_device *dev;
@@ -282,6 +375,9 @@ static int rdacm20_probe(struct i2c_client *client)
 		return -ENOMEM;
 	dev->dev = &client->dev;
 
+
+	dev->data = of_device_get_match_data(&client->dev);
+
 	dev->serializer = devm_kzalloc(&client->dev, sizeof(*dev->serializer),
 				       GFP_KERNEL);
 	if (!dev->serializer)
@@ -289,7 +385,10 @@ static int rdacm20_probe(struct i2c_client *client)
 
 	dev->serializer->client = client;
 
-	/* Create the dummy I2C client for the sensor. */
+	/*
+	 * Create the dummy I2C client for the sensor: the right i2c address
+	 * will be overwritten later at sensor initialization time.
+	 */
 	dev->sensor = i2c_new_dummy(client->adapter, OV10635_I2C_ADDRESS);
 	if (!dev->sensor) {
 		ret = -ENXIO;
@@ -303,6 +402,9 @@ static int rdacm20_probe(struct i2c_client *client)
 
 	/* Initialize and register the subdevice. */
 	v4l2_i2c_subdev_init(&dev->sd, client, &rdacm20_subdev_ops);
+	snprintf(dev->sd.name, sizeof(dev->sd.name), "%s %d-%04x",
+		 dev->data->devname, i2c_adapter_id(dev->sensor->adapter),
+		 dev->sensor->addr);
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	v4l2_ctrl_handler_init(&dev->ctrls, 1);
@@ -375,8 +477,27 @@ static void rdacm20_shutdown(struct i2c_client *client)
 	rdacm20_s_stream(&dev->sd, 0);
 }
 
+struct rdacm_data rdacm20_data = {
+	.devname = "rdacm20",
+	.sensor_probe = rdacm20_sensor_probe,
+	.default_addrs = {
+		OV10635_I2C_ADDRESS,
+		ATTINY85_I2C_ADDRESS,
+	},
+};
+
+struct rdacm_data rdacm21_data = {
+	.devname = "rdacm21",
+	.sensor_probe = rdacm21_sensor_probe,
+	.default_addrs = {
+		OV10635_I2C_ADDRESS,
+		OV490_I2C_ADDRESS,
+	},
+};
+
 static const struct of_device_id rdacm20_of_ids[] = {
-	{ .compatible = "imi,rdacm20", },
+	{ .compatible = "imi,rdacm20", .data = &rdacm20_data },
+	{ .compatible = "imi,rdacm21", .data = &rdacm21_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rdacm20_of_ids);
-- 
2.24.0

