Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0119E457F8A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Nov 2021 17:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbhKTQnq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 20 Nov 2021 11:43:46 -0500
Received: from lists.levonline.com ([217.70.32.42]:44491 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbhKTQnq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Nov 2021 11:43:46 -0500
X-Greylist: delayed 489 seconds by postgrey-1.27 at vger.kernel.org; Sat, 20 Nov 2021 11:43:45 EST
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id 520123A0CDC
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Nov 2021 17:26:43 +0100 (CET)
X-SA-score: -1
X-Halon-ID: 74b41801-4a1f-11ec-a618-0050568168d4
Received: from ormen1.djurnet.levonline.com (ormen1.djurnet.levonline.com [192.168.17.31])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id 74b41801-4a1f-11ec-a618-0050568168d4;
        Sat, 20 Nov 2021 17:32:30 +0100 (CET)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp [218.219.193.216])
        (authenticated bits=0)
        by ormen1.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 1AKGWRqx007395;
        Sat, 20 Nov 2021 17:32:28 +0100
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     robh@kernel.org, Magnus Damm <damm@opensource.se>,
        johan@kernel.org, geert+renesas@glider.be
Date:   Sun, 21 Nov 2021 00:41:46 +0900
Message-Id: <163742290656.715.15960553560678858057.sendpatchset@octo>
Subject: [PATCH] r8a77995 Draak SCIF0 LED and KEY Serdev prototype
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Here's a work-in-progress patch for shared pin LED and KEY functionality:
 - UART TX Serdev LED driver prototype (functional)
 - UART RX Serdev KEY driver prototype (partial)
 - r8a77995 Draak DTS modifications to use above drivers with SCIF0

With this code my hope is to use hardware to drive an LED and allow
detection of a key press without software performing any kind of polling.

In theory on SoCs that support UART RX and TX on the same pin (and also
open drain output) with the above software it is possible to handle boards
with single pin shared LED and KEY functionality.

This prototype on r8a77995 Draak makes use of 3 pins and an external circuit:
 - LED13/SW59/GP4_07 <-> EXIO_A:10 (CN46)
 - SCIF0_RX/GP4_20 <- EXIO_A:38 (CN46)
 - SCIF0_TX/GP4_21 -> EXIO_A:36 (CN46)
Ether-AVB PHY connector (CN23) has 3.3V on pin 54 and 56 and GND on 14
In the future SCIF1 and SCIF3 may also be used for other LEDs and switches.

Currently two inverters on SN74HC05 together with pull-ups are used to extend
the D3 SoC and the Draak board with open drain functionality and also tie
together the TX and RX pins with LED13/SW59.

The prototype LED driver allows user space to turn on/off the LED using:
 # echo 1 > /sys/class/leds/serial0-0/brightness
 # echo 0 > /sys/class/leds/serial0-0/brightness
Must be easy to extend the driver with some degree of brightness control.

Apart from some general brush up the following issues have surfaced:
 - "controller busy" error happens when more than one serdev is used
 - it is unclear how to take RX errors from serdev and generate key events
 - there seem to be no way to silence "sh-sci e6e60000.serial: frame error"
 - the DTS "current-speed" property looks like sw config and not hw description

Obviously not for upstream merge as-is. Might however be useful as SCIF error
test bench and/or as potential (corner) use case for serdev.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts |   34 ++++++
 drivers/tty/serdev/Makefile                    |    2 
 drivers/tty/serdev/barfoo.c                    |   99 +++++++++++++++++++
 drivers/tty/serdev/foobar.c                    |  121 ++++++++++++++++++++++++
 4 files changed, 254 insertions(+), 2 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77995-draak.dts	2021-11-20 23:47:14.965609878 +0900
@@ -16,6 +16,8 @@
 
 	aliases {
 		serial0 = &scif2;
+		serial1 = &scif0;
+
 		ethernet0 = &avb;
 	};
 
@@ -226,6 +228,15 @@
 	clock-frequency = <48000000>;
 };
 
+&gpio4 {
+	gp4_07_led13_sw59 {
+		gpio-hog;
+		gpios = <7 GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "gp4_07";
+	};
+};
+
 &hsusb {
 	dr_mode = "host";
 	status = "okay";
@@ -432,6 +443,11 @@
 		function = "pwm1";
 	};
 
+	scif0_pins: scif0 {
+		groups = "scif0_data_a";
+		function = "scif0";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data";
 		function = "scif2";
@@ -479,13 +495,29 @@
 	status = "okay";
 };
 
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+#if 1
+        led {
+                compatible = "serdev,led";
+                current-speed = <9600>;
+        };							       
+#else
+        key {
+                compatible = "serdev,key";
+                current-speed = <9600>;
+        };
+#endif
+};
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
-
 &sdhi2 {
 	/* used for on-board eMMC */
 	pinctrl-0 = <&sdhi2_pins>;
--- 0001/drivers/tty/serdev/Makefile
+++ work/drivers/tty/serdev/Makefile	2021-11-20 23:08:15.925462579 +0900
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-serdev-objs := core.o
+serdev-objs := core.o foobar.o barfoo.o
 
 obj-$(CONFIG_SERIAL_DEV_BUS) += serdev.o
 
--- /dev/null
+++ work/drivers/tty/serdev/barfoo.c	2021-11-20 23:42:21.628591406 +0900
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Serdev Push Switch Device Driver Prototype
+ * Copyright (C) 2021 Magnus Damm
+ *
+ * Detect a key press using the RX pin function of an UART
+ *
+ * This assumes the RX pin is kept in high state one way or the other and
+ * the push switch will pull down the pin once asserted.
+ *
+ * The idea is that any kind of RX errors will be treated as a key press:
+ * Frame errors, Parity errors and/or Break
+ *
+ * Currently with the RX line being idle asserting the switch results in:
+ * # [   18.627197] barfoo_receive_buf 1: 
+ * [   18.627283] 0x00 
+ * [   18.636261] sh-sci e6e60000.serial: frame error
+ * [   18.653335] 
+ * [   18.653335] barfoo_receive_buf - done
+ */
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/serdev.h>
+
+struct key_priv {
+	struct serdev_device *serdev;
+	u32 bps;
+};
+
+static int key_receive_buf(struct serdev_device *serdev,
+                             const unsigned char *buf, size_t size)
+{
+       int k;
+
+       printk("barfoo_receive_buf %d: ", (int)size);
+
+       for (k = 0; k < size; k++) {
+         printk("0x%02x ", buf[k]);
+       }
+       
+       printk("\nbarfoo_receive_buf - done\n");
+
+       return size;
+}
+
+static const struct serdev_device_ops key_serdev_device_ops = {
+	.receive_buf = key_receive_buf,
+	.write_wakeup = serdev_device_write_wakeup,
+};
+
+static int key_probe(struct serdev_device *serdev)
+{
+	struct key_priv *p;
+	int ret;
+
+	p = devm_kzalloc(&serdev->dev, sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	p->serdev = serdev;
+	dev_set_drvdata(&serdev->dev, p);
+
+	if (of_property_read_u32(serdev->dev.of_node, "current-speed", &p->bps))
+		return -EINVAL;
+	
+	serdev_device_set_client_ops(serdev, &key_serdev_device_ops);
+	ret = devm_serdev_device_open(&serdev->dev, serdev);
+	if (ret)
+		return ret;
+
+	serdev_device_set_baudrate(serdev, p->bps);
+	serdev_device_set_flow_control(serdev, false);
+	return serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
+}
+
+static void key_remove(struct serdev_device *serdev)
+{
+};
+
+static const struct of_device_id key_of_match[] = {
+	{ .compatible = "serdev,key" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, key_of_match);
+
+static struct serdev_device_driver key_driver = {
+	.driver	= {
+		.name		= "serdev-key",
+		.of_match_table	= of_match_ptr(key_of_match),
+	},
+	.probe	= key_probe,
+	.remove	= key_remove,
+};
+module_serdev_device_driver(key_driver);
--- /dev/null
+++ work/drivers/tty/serdev/foobar.c	2021-11-20 23:42:35.800592298 +0900
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Serdev LED Device Driver Prototype
+ * Copyright (C) 2021 Magnus Damm
+ *
+ * Control brightness of an LED using the TX pin of an UART
+ *
+ * At this time two levels of brightness are supported:
+ * Brightness 1: Make LED lit by setting UART TX pin to idle state
+ * Brightness 0: Send dim data pattern 0x01 which keeps pin mostly low
+ *
+ * The above UART data patterns may optionally be used with an external open
+ * drain circuit driving both the LED and a push switch using a single pin.
+ */
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/serdev.h>
+#include <linux/workqueue.h>
+
+struct led_priv {
+	struct serdev_device *serdev;
+	u32 bps;
+	struct led_classdev lcd;
+	unsigned int led_brightness;
+	struct delayed_work work;
+	unsigned char buf[128]; /* dim pattern data */
+};
+
+static void led_work(struct work_struct *work)
+{
+	struct led_priv *p = container_of(work, struct led_priv, work.work);
+	unsigned int bits_queued;
+	int ret;
+
+	/* wait in case all dim pattern data is not sent out yet */
+	serdev_device_wait_until_sent(p->serdev, 0);
+	
+	if (p->led_brightness) {
+		/* uart line idle state is high so do nothing */
+		return;
+	}
+
+	/* output continuous dim pattern */
+	ret = serdev_device_write_buf(p->serdev, p->buf, sizeof(p->buf));
+	bits_queued = (ret > 0 ? ret : 1) * 10;
+	schedule_delayed_work(&p->work, (HZ * bits_queued) / p->bps);
+}
+
+static void led_brightness_set(struct led_classdev *lcdp,
+			       enum led_brightness brightness)
+{
+	struct led_priv *p = container_of(lcdp, struct led_priv, lcd);
+
+	p->led_brightness = (int)brightness;
+	schedule_delayed_work(&p->work, 0);
+}
+
+static const struct serdev_device_ops led_serdev_device_ops = {
+	.write_wakeup = serdev_device_write_wakeup,
+};
+
+static int led_probe(struct serdev_device *serdev)
+{
+	struct led_priv *p;
+	int ret;
+
+	p = devm_kzalloc(&serdev->dev, sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	p->serdev = serdev;
+	dev_set_drvdata(&serdev->dev, p);
+
+	if (of_property_read_u32(serdev->dev.of_node, "current-speed", &p->bps))
+		return -EINVAL;
+	
+	memset(p->buf, sizeof(p->buf), 1); /* almost zero brightness */
+	INIT_DELAYED_WORK(&p->work, led_work);
+	p->lcd.name = dev_name(&serdev->dev);
+	p->lcd.max_brightness = 1;
+	p->lcd.brightness_set = led_brightness_set;
+
+	ret = devm_led_classdev_register_ext(&serdev->dev, &p->lcd, NULL);
+	
+	serdev_device_set_client_ops(serdev, &led_serdev_device_ops);
+	ret = devm_serdev_device_open(&serdev->dev, serdev);
+	if (ret)
+		return ret;
+
+	serdev_device_set_baudrate(serdev, p->bps);
+	serdev_device_set_flow_control(serdev, false);
+	return serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
+}
+
+static void led_remove(struct serdev_device *serdev)
+{
+	struct led_priv *p = dev_get_drvdata(&serdev->dev);
+
+	cancel_delayed_work_sync(&p->work);
+};
+
+static const struct of_device_id led_of_match[] = {
+	{ .compatible = "serdev,led" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, led_of_match);
+
+static struct serdev_device_driver led_driver = {
+	.driver	= {
+		.name		= "serdev-led",
+		.of_match_table	= of_match_ptr(led_of_match),
+	},
+	.probe	= led_probe,
+	.remove	= led_remove,
+};
+module_serdev_device_driver(led_driver);
