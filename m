Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C11471125
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Dec 2021 04:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244451AbhLKDPY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Dec 2021 22:15:24 -0500
Received: from lists.levonline.com ([217.70.32.42]:59586 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235171AbhLKDPW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Dec 2021 22:15:22 -0500
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id 6D2243A0D2D
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Dec 2021 04:05:40 +0100 (CET)
X-SA-score: -1
X-Halon-ID: 10e487dc-5a30-11ec-a618-0050568168d4
Received: from ormen2.djurnet.levonline.com (ormen2.djurnet.levonline.com [192.168.17.32])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id 10e487dc-5a30-11ec-a618-0050568168d4;
        Sat, 11 Dec 2021 04:11:43 +0100 (CET)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp [218.219.193.216])
        (authenticated bits=0)
        by ormen2.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 1BB3BdXE000793;
        Sat, 11 Dec 2021 04:11:40 +0100
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     robh@kernel.org, Magnus Damm <damm@opensource.se>,
        kieran.bingham@ideasonboard.com, geert+renesas@glider.be,
        johan@kernel.org
Date:   Sat, 11 Dec 2021 11:19:31 +0900
Message-Id: <163918917127.29197.12939858877075405629.sendpatchset@octo>
Subject: [PATCH] r8a77995 Draak SCIF0 LED and KEY Serdev prototype V2
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Here's V2 of a work-in-progress patch for shared pin LED and KEY functionality:
 - UART TX Serdev LED driver prototype (functional)
 - UART RX Serdev KEY driver prototype (functional)
 - r8a77995 Draak DTS modifications to use above drivers with SCIF0 and SCIF1

The Draak board has been extended with an external SN74HC05 circuit to
make a wired-OR circuit for LED control and push switch detection using
UART loopback via on-chip SCIF functionality.

For this version the hardware has been slightly modified from using SCIF0
for both TX and RX to using SCIF0 for TX and SCIF1 for RX. With this change
the LED driver and the KEY driver can coexist with serdev without any issues.
This made it possible to remove the #ifdefs in the DTS file. Also the DTS
changes have been modified to remove the baudrate configuration.

This version depends on the following serdev error notification patch:
[PATCH/RFC] serdev: BREAK/FRAME/PARITY/OVERRUN notification prototype

To silence the SCIF driver the following patch is recommended as well:
[PATCH] serial: sh-sci: Remove BREAK/FRAME/PARITY/OVERRUN printouts

This prototype on r8a77995 Draak makes use of 3 pins:
 - LED13/SW59/GP4_07 <-> EXIO_A:10 (CN46)
 - SCIF_RX1/GP4_23 <- 17 (CN50)
 - SCIF_TX0/GP4_21 -> EXIO_A:36 (CN46)

The prototype LED driver allows user space to turn on/off the LED using:
 # echo 1 > /sys/class/leds/serial0-0/brightness
 # echo 0 > /sys/class/leds/serial0-0/brightness

The prototype KEY driver may be tested using:
 # evtest /dev/input/event0

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Applies to 5.16-rc4

 arch/arm64/boot/dts/renesas/draak.dtsi |   45 ++++++++++++
 drivers/tty/serdev/Makefile            |    2 
 drivers/tty/serdev/barfoo.c            |  109 +++++++++++++++++++++++++++++
 drivers/tty/serdev/foobar.c            |  119 ++++++++++++++++++++++++++++++++
 4 files changed, 274 insertions(+), 1 deletion(-)

--- 0001/arch/arm64/boot/dts/renesas/draak.dtsi
+++ work/arch/arm64/boot/dts/renesas/draak.dtsi	2021-12-04 22:05:53.621400516 +0900
@@ -15,6 +15,8 @@
 
 	aliases {
 		serial0 = &scif2;
+		serial1 = &scif0; /* SCIF_TX0 on GP4_21 */
+		serial2 = &scif1; /* SCIF_RX1 on GP4_23 */
 		ethernet0 = &avb;
 	};
 
@@ -301,6 +303,15 @@
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
@@ -541,6 +552,16 @@
 		function = "pwm1";
 	};
 
+	scif0_pins: scif0 {
+		groups = "scif0_data_a";
+		function = "scif0";
+	};
+
+	scif1_pins: scif1 {
+		groups = "scif1_data_a";
+		function = "scif1";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data";
 		function = "scif2";
@@ -635,6 +656,30 @@
 	status = "okay";
 };
 
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	led {
+		compatible = "serdev,led";
+	};
+};
+
+&scif1 {
+	pinctrl-0 = <&scif1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	key {
+		compatible = "serdev,key";
+		label = "SW59";
+		linux,keycodes = <KEY_ENTER>;
+	};
+};
+
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
--- 0001/drivers/tty/serdev/Makefile
+++ work/drivers/tty/serdev/Makefile	2021-12-04 22:02:24.204387328 +0900
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-serdev-objs := core.o
+serdev-objs := core.o foobar.o barfoo.o
 
 obj-$(CONFIG_SERIAL_DEV_BUS) += serdev.o
 
--- /dev/null
+++ work/drivers/tty/serdev/barfoo.c	2021-12-04 22:02:25.238387393 +0900
@@ -0,0 +1,109 @@
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
+ */
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/serdev.h>
+
+struct key_priv {
+	struct serdev_device *serdev;
+	u32 bps;
+	const char *name;
+	u32 keycode;
+	struct input_dev *input;
+};
+
+static void key_press(struct serdev_device *serdev, unsigned long mask)
+{
+	struct key_priv *p = dev_get_drvdata(&serdev->dev);
+
+	printk("barfoo_key_error 0x%08lx: ", mask);
+
+	/* any error is treated as a key press */
+	input_report_key(p->input, p->keycode, 1);
+	input_sync(p->input);
+
+	/* unable to detect key release so report it right away */
+	input_report_key(p->input, p->keycode, 0);
+	input_sync(p->input);
+}
+
+static const struct serdev_device_ops key_serdev_device_ops = {
+	.error = key_press,
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
+	p->bps = 9600;
+	p->keycode = KEY_UNKNOWN; /* override with linux,keycodes */
+	dev_set_drvdata(&serdev->dev, p);
+
+	device_property_read_string(&serdev->dev, "label", &p->name);
+	device_property_read_u32(&serdev->dev, "linux,keycodes", &p->keycode);
+
+	p->input = devm_input_allocate_device(&serdev->dev);
+	if (!p->input)
+		return -ENOMEM;
+
+	input_set_drvdata(p->input, p);
+
+	p->input->name = p->name;
+	p->input->phys = "serdev-keys/input0";
+
+	input_set_capability(p->input, EV_KEY, p->keycode);
+
+	ret = input_register_device(p->input);
+	if (ret)
+		return ret;
+	
+	serdev_device_set_client_ops(serdev, &key_serdev_device_ops);
+	ret = devm_serdev_device_open(&serdev->dev, serdev);
+	if (ret)
+		return ret;
+
+	serdev_device_set_baudrate(serdev, p->bps);
+	serdev_device_set_error_mask(serdev, BIT(SERDEV_ERROR_BREAK) |
+				     BIT(SERDEV_ERROR_FRAME) |
+				     BIT(SERDEV_ERROR_PARITY));
+	serdev_device_set_flow_control(serdev, false);
+	return serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
+}
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
+};
+module_serdev_device_driver(key_driver);
--- /dev/null
+++ work/drivers/tty/serdev/foobar.c	2021-12-04 22:02:25.258387394 +0900
@@ -0,0 +1,119 @@
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
+	p->bps = 9600;
+	dev_set_drvdata(&serdev->dev, p);
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
