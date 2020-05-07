Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917C41C844B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2020 10:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgEGIFg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 May 2020 04:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725858AbgEGIFg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 May 2020 04:05:36 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E832C061A10
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2020 01:05:36 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by laurent.telenet-ops.be with bizsmtp
        id bk5a2200P3ZRV0X01k5ath; Thu, 07 May 2020 10:05:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWbXC-0001lv-BA; Thu, 07 May 2020 10:05:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWbXC-00009h-8B; Thu, 07 May 2020 10:05:34 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
Date:   Thu,  7 May 2020 10:05:28 +0200
Message-Id: <20200507080528.547-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As upstream Linux does not support XIP, it cannot run in 8 MiB of
HyperRAM.  Hence the 64 MiB of SDRAM on the sub-board needs to be
enabled, which has the following ramifications:
  - SCIF4 connected to the on-board USB-serial can no longer be used as
    the serial console,
  - Instead, SCIF2 is used as the serial console, by connecting a 3.3V
    TTL USB-to-Serial adapter to the CMOS camera connector,
  - The first Ethernet channel can no longer be used,
  - USB Channel 1 loses the overcurrent input signal.

Based on the Linux-4.19 BSP for RZ/A2.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on commit 91e4f3d37e1a9323 ("ARM: 8972/1: boot: Obtain
start of physical memory from DTB") in linux-arm/for-next.
Hence I cannot queue this in renesas-devel before v5.8-rc1.
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 53 +++++++++++++++-----------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 0686bac4bfd8e191..d719c3a133a966fb 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -4,6 +4,28 @@
  *
  * Copyright (C) 2018 Renesas Electronics
  *
+ * As upstream Linux does not support XIP, it cannot run in 8 MiB of HyperRAM.
+ * Hence the 64 MiB of SDRAM on the sub-board needs to be enabled, which has
+ * the following ramifications:
+ *   - SCIF4 connected to the on-board USB-serial can no longer be used as the
+ *     serial console,
+ *   - Instead, SCIF2 is used as the serial console, by connecting a 3.3V TTL
+ *     USB-to-Serial adapter to the CMOS camera connector:
+ *       - RXD = CN17-9,
+ *       - TXD = CN17-10,
+ *       - GND = CN17-2 or CN17-17,
+ *   - The first Ethernet channel can no longer be used,
+ *   - USB Channel 1 loses the overcurrent input signal.
+ *
+ * Please make sure your sub-board matches the following switch settings:
+ *
+ *           SW6                SW6-1 set to SDRAM
+ *  ON                          SW6-2 set to Audio
+ * +---------------------+      SW6-3 set to DRP
+ * | =   =   = = =       |      SW6-4 set to CEU
+ * |   =   =             |      SW6-5 set to Ether2
+ * | 1 2 3 4 5 6 7 8 9 0 |      SW6-6 set to VDC6
+ * +---------------------+      SW6-7 set to VDC6
  */
 
 /dts-v1/;
@@ -17,8 +39,7 @@
 	compatible = "renesas,rza2mevb", "renesas,r7s9210";
 
 	aliases {
-		serial0 = &scif4;
-		ethernet0 = &ether0;
+		serial0 = &scif2;
 		ethernet1 = &ether1;
 	};
 
@@ -58,9 +79,9 @@
 		};
 	};
 
-	memory@40000000 {
+	memory@c000000 {
 		device_type = "memory";
-		reg = <0x40000000 0x00800000>;	 /* HyperRAM */
+		reg = <0x0c000000 0x04000000>;	/* SDRAM */
 	};
 };
 
@@ -72,17 +93,6 @@
 	status = "okay";
 };
 
-&ether0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&eth0_pins>;
-	status = "okay";
-	renesas,no-ether-link;
-	phy-handle = <&phy0>;
-	phy0: ethernet-phy@0 {
-		reg = <0>;
-	};
-};
-
 &ether1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&eth1_pins>;
@@ -142,9 +152,9 @@
 	};
 
 	/* Serial Console */
-	scif4_pins: serial4 {
-		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
-			 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
+	scif2_pins: serial2 {
+		pinmux = <RZA2_PINMUX(PORTE, 2, 3)>,	/* TxD2 */
+			 <RZA2_PINMUX(PORTE, 1, 3)>;	/* RxD2 */
 	};
 
 	sdhi0_pins: sdhi0 {
@@ -165,8 +175,7 @@
 
 	usb1_pins: usb1 {
 		pinmux = <RZA2_PINMUX(PORTC, 0, 1)>,	/* VBUSIN1 */
-			 <RZA2_PINMUX(PORTC, 5, 1)>,	/* VBUSEN1 */
-			 <RZA2_PINMUX(PORT7, 5, 5)>;	/* OVRCUR1 */
+			 <RZA2_PINMUX(PORTC, 5, 1)>;	/* VBUSEN1 */
 	};
 };
 
@@ -176,9 +185,9 @@
 };
 
 /* Serial Console */
-&scif4 {
+&scif2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&scif4_pins>;
+	pinctrl-0 = <&scif2_pins>;
 
 	status = "okay";
 };
-- 
2.17.1

