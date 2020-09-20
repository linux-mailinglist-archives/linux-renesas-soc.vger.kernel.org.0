Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E922711A5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Sep 2020 03:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgITBBR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Sep 2020 21:01:17 -0400
Received: from lists.levonline.com ([217.70.33.37]:47861 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgITBBR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Sep 2020 21:01:17 -0400
X-Greylist: delayed 423 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 21:01:16 EDT
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id 2303B3A0D5D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Sep 2020 02:50:58 +0200 (CEST)
X-SA-score: -1
X-Halon-ID: d40bdf96-fadb-11ea-9775-0050568168d4
Received: from ormen2.djurnet.levonline.com (ormen2.djurnet.levonline.com [192.168.17.32])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id d40bdf96-fadb-11ea-9775-0050568168d4;
        Sun, 20 Sep 2020 02:54:25 +0200 (CEST)
Received: from [127.0.0.1] (15.178.138.210.rev.vmobile.jp [210.138.178.15])
        (authenticated bits=0)
        by ormen2.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 08K0sLPn029371;
        Sun, 20 Sep 2020 02:54:23 +0200
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>
Date:   Sun, 20 Sep 2020 09:33:33 +0900
Message-Id: <160056201373.9912.14240039764408484073.sendpatchset@octo>
In-Reply-To: <160056199852.9912.5581183514421117508.sendpatchset@octo>
References: <160056199852.9912.5581183514421117508.sendpatchset@octo>
Subject: [PATCH 1/2] r8a77961 CMT0 device exposed via UIO
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Device Tree modifications to expose CMT0 via UIO, code to add UIO driver
debug code and also adjust the compat string matching in MODULE_DEVICE_TABLE()

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77961.dtsi |   10 ++++++++++
 drivers/uio/uio.c                         |    3 ++-
 drivers/uio/uio_pdrv_genirq.c             |   10 ++++++++--
 3 files changed, 20 insertions(+), 3 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77961.dtsi	2020-09-20 06:37:14.578864063 +0900
@@ -453,6 +453,16 @@
 			reg = <0 0xe6060000 0 0x50c>;
 		};
 
+		cmt0: timer@e60f0000 {
+			compatible = "uio_pdrv_genirq";
+			reg = <0 0xe60f0000 0 0x1004>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 303>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 303>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a77961-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
--- 0001/drivers/uio/uio.c
+++ work/drivers/uio/uio.c	2020-09-20 07:58:51.295172430 +0900
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
+++ work/drivers/uio/uio_pdrv_genirq.c	2020-09-20 07:58:07.417169667 +0900
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
