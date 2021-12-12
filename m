Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D13E471A99
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Dec 2021 15:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbhLLON6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 Dec 2021 09:13:58 -0500
Received: from lists.levonline.com ([217.70.32.42]:48112 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbhLLON6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Dec 2021 09:13:58 -0500
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id 3ACC93A0D3B
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Dec 2021 15:07:51 +0100 (CET)
X-SA-score: -1
X-Halon-ID: bd67e635-5b55-11ec-a618-0050568168d4
Received: from ormen2.djurnet.levonline.com (ormen2.djurnet.levonline.com [192.168.17.32])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id bd67e635-5b55-11ec-a618-0050568168d4;
        Sun, 12 Dec 2021 15:13:55 +0100 (CET)
Received: from [127.0.0.1] (g1-27-253-251-243.bmobile.ne.jp [27.253.251.243])
        (authenticated bits=0)
        by ormen2.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 1BCEDmVE031405;
        Sun, 12 Dec 2021 15:13:50 +0100
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-serial@vger.kernel.org
Cc:     robh@kernel.org, Magnus Damm <damm@opensource.se>,
        geert+renesas@glider.be, gregkh@linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        wsa+renesas@sang-engineering.com, jirislaby@kernel.org
Date:   Sun, 12 Dec 2021 22:21:28 +0900
Message-Id: <163931528842.27756.3665040315954968747.sendpatchset@octo>
Subject: [PATCH] serdev: BREAK/FRAME/PARITY/OVERRUN notification prototype V2
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Allow serdev device drivers get notified by hardware errors such as BREAK,
FRAME, PARITY and OVERRUN.

With this patch, in the event of an error detected in the UART device driver
the serdev_device_driver will get the newly introduced ->error() callback
invoked if serdev_device_set_error_mask() has previously been used to enable
the type of error. The errors are taken straight from the TTY layer and fed
into the serdev_device_driver after filtering out only enabled errors.

Without this patch the hardware errors never reach the serdev_device_driver.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Applies to linux-5.16-rc4

 Change since V1:
 - Use __set_bit() instead of set_bit() in ttyport_receive_buf()
 - Switch to assign_bit() in ttyport_set_error_mask()

 Thanks to Geert for feedback!

 The following prototype patch is using serdev error notifications:
 [PATCH] r8a77995 Draak SCIF0 LED and KEY Serdev prototype V2

 drivers/tty/serdev/core.c           |   11 +++++++
 drivers/tty/serdev/serdev-ttyport.c |   49 +++++++++++++++++++++++++++++++++++
 include/linux/serdev.h              |   22 +++++++++++++++
 3 files changed, 82 insertions(+)

--- 0001/drivers/tty/serdev/core.c
+++ work/drivers/tty/serdev/core.c	2021-12-12 21:36:51.756818597 +0900
@@ -349,6 +349,17 @@ unsigned int serdev_device_set_baudrate(
 }
 EXPORT_SYMBOL_GPL(serdev_device_set_baudrate);
 
+void serdev_device_set_error_mask(struct serdev_device *serdev, unsigned long mask)
+{
+	struct serdev_controller *ctrl = serdev->ctrl;
+
+	if (!ctrl || !ctrl->ops->set_error_mask)
+		return;
+
+	ctrl->ops->set_error_mask(ctrl, mask);
+}
+EXPORT_SYMBOL_GPL(serdev_device_set_error_mask);
+
 void serdev_device_set_flow_control(struct serdev_device *serdev, bool enable)
 {
 	struct serdev_controller *ctrl = serdev->ctrl;
--- 0001/drivers/tty/serdev/serdev-ttyport.c
+++ work/drivers/tty/serdev/serdev-ttyport.c	2021-12-12 21:53:42.698882261 +0900
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2016-2017 Linaro Ltd., Rob Herring <robh@kernel.org>
  */
+#include <linux/bits.h>
 #include <linux/kernel.h>
 #include <linux/serdev.h>
 #include <linux/tty.h>
@@ -9,6 +10,10 @@
 #include <linux/poll.h>
 
 #define SERPORT_ACTIVE		1
+#define SERPORT_NOTIFY_BREAK	2
+#define SERPORT_NOTIFY_FRAME	3
+#define SERPORT_NOTIFY_PARITY	4
+#define SERPORT_NOTIFY_OVERRUN	5
 
 struct serport {
 	struct tty_port *port;
@@ -27,11 +32,39 @@ static int ttyport_receive_buf(struct tt
 {
 	struct serdev_controller *ctrl = port->client_data;
 	struct serport *serport = serdev_controller_get_drvdata(ctrl);
+	unsigned long errors = 0;
+	unsigned int i;
 	int ret;
 
 	if (!test_bit(SERPORT_ACTIVE, &serport->flags))
 		return 0;
 
+	for (i = 0; fp && i < count; i++) {
+		switch (fp[i]) {
+		case TTY_BREAK:
+			if (test_bit(SERPORT_NOTIFY_BREAK, &serport->flags))
+				__set_bit(SERDEV_ERROR_BREAK, &errors);
+			break;
+
+		case TTY_FRAME:
+			if (test_bit(SERPORT_NOTIFY_FRAME, &serport->flags))
+				__set_bit(SERDEV_ERROR_FRAME, &errors);
+			break;
+
+		case TTY_PARITY:
+			if (test_bit(SERPORT_NOTIFY_PARITY, &serport->flags))
+				__set_bit(SERDEV_ERROR_PARITY, &errors);
+			break;
+
+		case TTY_OVERRUN:
+			if (test_bit(SERPORT_NOTIFY_OVERRUN, &serport->flags))
+				__set_bit(SERDEV_ERROR_OVERRUN, &errors);
+			break;
+		}
+	}
+	if (errors)
+		serdev_controller_error(ctrl, errors);
+
 	ret = serdev_controller_receive_buf(ctrl, cp, count);
 
 	dev_WARN_ONCE(&ctrl->dev, ret < 0 || ret > count,
@@ -180,6 +213,21 @@ static unsigned int ttyport_set_baudrate
 	return ktermios.c_ospeed;
 }
 
+static void ttyport_set_error_mask(struct serdev_controller *ctrl,
+				   unsigned long m)
+{
+	struct serport *sp = serdev_controller_get_drvdata(ctrl);
+
+	assign_bit(SERPORT_NOTIFY_BREAK, &sp->flags,
+		   m & BIT(SERDEV_ERROR_BREAK));
+	assign_bit(SERPORT_NOTIFY_FRAME, &sp->flags,
+		   m & BIT(SERDEV_ERROR_FRAME));
+	assign_bit(SERPORT_NOTIFY_PARITY, &sp->flags,
+		   m & BIT(SERDEV_ERROR_PARITY));
+	assign_bit(SERPORT_NOTIFY_OVERRUN, &sp->flags,
+		   m & BIT(SERDEV_ERROR_OVERRUN));
+}
+
 static void ttyport_set_flow_control(struct serdev_controller *ctrl, bool enable)
 {
 	struct serport *serport = serdev_controller_get_drvdata(ctrl);
@@ -253,6 +301,7 @@ static const struct serdev_controller_op
 	.write_room = ttyport_write_room,
 	.open = ttyport_open,
 	.close = ttyport_close,
+	.set_error_mask = ttyport_set_error_mask,
 	.set_flow_control = ttyport_set_flow_control,
 	.set_parity = ttyport_set_parity,
 	.set_baudrate = ttyport_set_baudrate,
--- 0001/include/linux/serdev.h
+++ work/include/linux/serdev.h	2021-12-12 21:36:51.757818597 +0900
@@ -19,12 +19,15 @@ struct serdev_device;
 
 /**
  * struct serdev_device_ops - Callback operations for a serdev device
+ * @error:		Function called with errors received from device;
+ *			may sleep.
  * @receive_buf:	Function called with data received from device;
  *			returns number of bytes accepted; may sleep.
  * @write_wakeup:	Function called when ready to transmit more data; must
  *			not sleep.
  */
 struct serdev_device_ops {
+	void (*error)(struct serdev_device *, unsigned long);
 	int (*receive_buf)(struct serdev_device *, const unsigned char *, size_t);
 	void (*write_wakeup)(struct serdev_device *);
 };
@@ -76,6 +79,11 @@ enum serdev_parity {
 	SERDEV_PARITY_ODD,
 };
 
+#define SERDEV_ERROR_BREAK 0
+#define SERDEV_ERROR_FRAME 1
+#define SERDEV_ERROR_PARITY 2
+#define SERDEV_ERROR_OVERRUN 3
+
 /*
  * serdev controller structures
  */
@@ -85,6 +93,7 @@ struct serdev_controller_ops {
 	int (*write_room)(struct serdev_controller *);
 	int (*open)(struct serdev_controller *);
 	void (*close)(struct serdev_controller *);
+	void (*set_error_mask)(struct serdev_controller *, unsigned long);
 	void (*set_flow_control)(struct serdev_controller *, bool);
 	int (*set_parity)(struct serdev_controller *, enum serdev_parity);
 	unsigned int (*set_baudrate)(struct serdev_controller *, unsigned int);
@@ -190,12 +199,24 @@ static inline int serdev_controller_rece
 	return serdev->ops->receive_buf(serdev, data, count);
 }
 
+static inline void serdev_controller_error(struct serdev_controller *ctrl,
+					   unsigned long errors)
+{
+	struct serdev_device *serdev = ctrl->serdev;
+
+	if (!serdev || !serdev->ops->error)
+		return;
+
+	serdev->ops->error(serdev, errors);
+}
+
 #if IS_ENABLED(CONFIG_SERIAL_DEV_BUS)
 
 int serdev_device_open(struct serdev_device *);
 void serdev_device_close(struct serdev_device *);
 int devm_serdev_device_open(struct device *, struct serdev_device *);
 unsigned int serdev_device_set_baudrate(struct serdev_device *, unsigned int);
+void serdev_device_set_error_mask(struct serdev_device *, unsigned long);
 void serdev_device_set_flow_control(struct serdev_device *, bool);
 int serdev_device_write_buf(struct serdev_device *, const unsigned char *, size_t);
 void serdev_device_wait_until_sent(struct serdev_device *, long);
@@ -238,6 +259,7 @@ static inline unsigned int serdev_device
 {
 	return 0;
 }
+static inline void serdev_device_set_error_mask(struct serdev_device *sdev, unsigned long mask) {}
 static inline void serdev_device_set_flow_control(struct serdev_device *sdev, bool enable) {}
 static inline int serdev_device_write_buf(struct serdev_device *serdev,
 					  const unsigned char *buf,
