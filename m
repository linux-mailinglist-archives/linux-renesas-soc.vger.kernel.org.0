Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 329A0343259
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Mar 2021 13:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhCUMMl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 08:12:41 -0400
Received: from lists.levonline.com ([217.70.33.37]:46241 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhCUMMN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 08:12:13 -0400
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id 6F27C3A12E2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Mar 2021 13:12:11 +0100 (CET)
X-SA-score: -1
X-Halon-ID: a9ff634c-8a3e-11eb-a51d-0050568168d4
Received: from ormen1.djurnet.levonline.com (ormen1.djurnet.levonline.com [192.168.17.31])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id a9ff634c-8a3e-11eb-a51d-0050568168d4;
        Sun, 21 Mar 2021 13:12:11 +0100 (CET)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp [218.219.193.216])
        (authenticated bits=0)
        by ormen1.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 12LCC9LU028139;
        Sun, 21 Mar 2021 13:12:10 +0100
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>, geert+renesas@glider.be
Date:   Sun, 21 Mar 2021 20:38:43 +0900
Message-Id: <161632672360.9191.17012441985597645272.sendpatchset@octo>
In-Reply-To: <161632671592.9191.18170615656272399147.sendpatchset@octo>
References: <161632671592.9191.18170615656272399147.sendpatchset@octo>
Subject: [PATCH 1/2] sh73a0 CMT1 device exposed via UIO
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Modify the kernel slightly to expose CMT1 via UIO and print some
IRQ-related messages from UIO for debugging purpose.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/sh73a0.dtsi |    2 +-
 drivers/uio/uio.c             |    3 ++-
 drivers/uio/uio_pdrv_genirq.c |   10 ++++++++--
 3 files changed, 11 insertions(+), 4 deletions(-)

--- 0001/arch/arm/boot/dts/sh73a0.dtsi
+++ work/arch/arm/boot/dts/sh73a0.dtsi	2021-03-21 18:15:44.683760186 +0900
@@ -99,7 +99,7 @@
 	};
 
 	cmt1: timer@e6138000 {
-		compatible = "renesas,sh73a0-cmt1";
+		compatible = "uio_pdrv_genirq";
 		reg = <0xe6138000 0x200>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_CMT1>;
--- 0001/drivers/uio/uio.c
+++ work/drivers/uio/uio.c	2021-03-21 18:14:34.880755790 +0900
@@ -11,7 +11,7 @@
  *
  * Base Functions
  */
-
+#define DEBUG
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/poll.h>
@@ -975,6 +975,7 @@ int __uio_register_device(struct module
 		 * FDs at the time of unregister and therefore may not be
 		 * freed until they are released.
 		 */
+		pr_debug("uio request_irq %lu\n", info->irq);
 		ret = request_irq(info->irq, uio_interrupt,
 				  info->irq_flags, info->name, idev);
 		if (ret) {
--- 0001/drivers/uio/uio_pdrv_genirq.c
+++ work/drivers/uio/uio_pdrv_genirq.c	2021-03-21 18:15:03.120757568 +0900
@@ -10,7 +10,7 @@
  * Copyright (C) 2008 by Digi International Inc.
  * All rights reserved.
  */
-
+#define DEBUG
 #include <linux/platform_device.h>
 #include <linux/uio_driver.h>
 #include <linux/spinlock.h>
@@ -66,6 +66,8 @@ static irqreturn_t uio_pdrv_genirq_handl
 	 * remember the state so we can allow user space to enable it later.
 	 */
 
+	pr_debug("irqhandler %d\n", irq);
+
 	spin_lock(&priv->lock);
 	if (!__test_and_set_bit(UIO_IRQ_DISABLED, &priv->flags))
 		disable_irq_nosync(irq);
@@ -87,6 +89,8 @@ static int uio_pdrv_genirq_irqcontrol(st
 	 * with irq handler on SMP systems.
 	 */
 
+	pr_debug("irqcontrol %d\n", irq_on);
+	
 	spin_lock_irqsave(&priv->lock, flags);
 	if (irq_on) {
 		if (__test_and_clear_bit(UIO_IRQ_DISABLED, &priv->flags))
@@ -172,6 +176,8 @@ static int uio_pdrv_genirq_probe(struct
 		}
 	}
 
+	pr_debug("uio irq %lu\n", uioinfo->irq);
+	
 	if (uioinfo->irq) {
 		struct irq_data *irq_data = irq_get_irq_data(uioinfo->irq);
 
@@ -276,7 +282,7 @@ static const struct dev_pm_ops uio_pdrv_
 
 #ifdef CONFIG_OF
 static struct of_device_id uio_of_genirq_match[] = {
-	{ /* This is filled with module_parm */ },
+	{ .compatible = "uio_pdrv_genirq", },
 	{ /* Sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, uio_of_genirq_match);
