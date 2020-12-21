Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E0D2DFD95
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 16:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgLUPbA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 10:31:00 -0500
Received: from lists.levonline.com ([217.70.33.37]:48935 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgLUPbA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 10:31:00 -0500
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Dec 2020 10:30:59 EST
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id 028733A0E02
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Dec 2020 16:19:07 +0100 (CET)
X-SA-score: -1
X-Halon-ID: 8fdbd16c-43a0-11eb-821e-0050568168d4
Received: from ormen1.djurnet.levonline.com (ormen1.djurnet.levonline.com [192.168.17.31])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id 8fdbd16c-43a0-11eb-821e-0050568168d4;
        Mon, 21 Dec 2020 16:24:05 +0100 (CET)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp [220.157.214.90])
        (authenticated bits=0)
        by ormen1.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 0BLFO2Rd027361;
        Mon, 21 Dec 2020 16:24:03 +0100
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>
Date:   Mon, 21 Dec 2020 23:56:49 +0900
Message-Id: <160856260968.18420.18181463640865928753.sendpatchset@octo>
Subject: [PATCH] r8a77965 CMT test setup using UIO
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch contains kernel modificatons to allow some basic testing from
user space of the CMT0 device included on the r8a77965 SoC.

Not suitable for upstream merge. No attempt has been made to turn this into
somewhat clean code, so consider this a rough hack. The patch is a combination
of the following:
 - Device Tree modifications to expose CMT0 via UIO
 - code to add UIO driver debug code
 - adjustment for the compat string matching in MODULE_DEVICE_TABLE()

As Geert kindly pointed out there might be better ways to do this.

For the kernel, simply apply the kernel patch (including a few debug printouts)
and make sure to extend your kernel config with CONFIG_UIO_PDRV_GENIRQ=y.

The code in this patch is similar to earlier posted series but has been
ported from r8a77965 to r8a77961.

[PATCH 0/2] r8a77961 CMT test setup using UIO
[PATCH 1/2] r8a77961 CMT0 device exposed via UIO
[PATCH 2/2] UIO CMT test program

The most tricky challenge was to trim down the kernel size to be able to
boot with the old boot loader. The user space UIO test app remains the same
as for r8a77961 and can be located in the mailing list archives.

The following log shows how to execute the test program once on the target:

# ./uio-cmt-test
found matching UIO device at /sys/class/uio/uio0/
CLKE
CMCSR
CMCOR
[  227.228333] irqhandler 24
waiting 10sUIO write
CLKE
UIO read
got CMT IRQ
CLKE

Please note that only a few registers of a single channel of the CMT0 device
has been exercised. The kernel debug printout and /proc/interrupts may be
used to verify that at least one interrupt has been delivered.

One limitation with the current setup is that the UIO kernel driver only
supports a single interrupt however the CMT devices come with one interrupt
per channel on R-Car Gen3. Currently the code only uses a single IRQ.

If it turns out that the current test coverage should be extended then perhaps
it would be wise to also extend the UIO kernel driver with support for multiple
interrupts as well. To maintain the same user space interface the UIO driver
can simply have a list of interrupts associated with each device and then
enable/disable all of them on each IRQ. Not fast but good enough for testing.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Built on top of renesas-drivers-2020-12-15-v5.10
 Testing has been performed remotely on r8a77965 Salvator-X.

 arch/arm64/boot/dts/renesas/r8a77965.dtsi |   23 ++++++++++-------------
 drivers/uio/uio.c                         |    3 ++-
 drivers/uio/uio_pdrv_genirq.c             |   10 ++++++++--
 3 files changed, 20 insertions(+), 16 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77965.dtsi	2020-12-21 22:20:47.036998593 +0900
@@ -334,19 +334,6 @@
 			reg = <0 0xe6060000 0 0x50c>;
 		};
 
-		cmt0: timer@e60f0000 {
-			compatible = "renesas,r8a77965-cmt0",
-				     "renesas,rcar-gen3-cmt0";
-			reg = <0 0xe60f0000 0 0x1004>;
-			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 303>;
-			clock-names = "fck";
-			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
-			resets = <&cpg 303>;
-			status = "disabled";
-		};
-
 		cmt1: timer@e6130000 {
 			compatible = "renesas,r8a77965-cmt1",
 				     "renesas,rcar-gen3-cmt1";
@@ -414,6 +401,16 @@
 			#reset-cells = <1>;
 		};
 
+		cmt0: timer@e60f0000 {
+			compatible = "uio_pdrv_genirq";
+			reg = <0 0xe60f0000 0 0x1004>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 303>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 303>;
+		};
+
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a77965-rst";
 			reg = <0 0xe6160000 0 0x0200>;
--- 0001/drivers/uio/uio.c
+++ work/drivers/uio/uio.c	2020-12-21 22:16:51.680983772 +0900
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
+++ work/drivers/uio/uio_pdrv_genirq.c	2020-12-21 22:16:51.680983772 +0900
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
