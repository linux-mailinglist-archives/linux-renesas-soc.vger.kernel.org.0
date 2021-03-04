Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F158532D00E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Mar 2021 10:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237837AbhCDJv1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Mar 2021 04:51:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237859AbhCDJu6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Mar 2021 04:50:58 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C443C06175F
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Mar 2021 01:50:07 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:403a:b688:43fc:72a5])
        by michel.telenet-ops.be with bizsmtp
        id c9q1240020zmvuD069q16K; Thu, 04 Mar 2021 10:50:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHkcK-004dMG-Ir; Thu, 04 Mar 2021 10:50:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHkcK-00GnOs-3Z; Thu, 04 Mar 2021 10:50:00 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
Date:   Thu,  4 Mar 2021 10:49:45 +0100
Message-Id: <20210304094945.4003097-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As upstream Linux does not support XIP (eXecute-In-Place) for ARMv7-A
platforms that are part of the ARCH_MULTIPLATFORM framework, it cannot
run in the 8 MiB of HyperRAM present on the RZ/A2M CPU board.  Hence the
64 MiB of SDRAM on the sub-board needs to be enabled, which has the
following ramifications:
  - SCIF4 connected to the on-board USB-serial can no longer be used as
    the serial console,
  - Instead, SCIF2 is used as the serial console, by connecting a 3.3V
    TTL USB-to-Serial adapter to the CMOS camera connector,
  - The first Ethernet channel can no longer be used,
  - USB Channel 1 loses the overcurrent input signal.

Based on the Linux-4.19 BSP for RZ/A2.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I'm happy to queue this in renesas-devel for v5.13, now commit
0673cb3895121506 ("ARM: 9045/1: uncompress: Validate start of physical
memory against passed DTB") has entered v5.12-rc1, after 2 years of
development.

v2:
  - Drop RFC,
  - Reword description.
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 55 +++++++++++++++-----------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index d062d02865e7dfbb..68498ce2aec0ebd9 100644
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
@@ -17,9 +39,8 @@ / {
 	compatible = "renesas,rza2mevb", "renesas,r7s9210";
 
 	aliases {
-		serial0 = &scif4;
-		ethernet0 = &ether0;
-		ethernet1 = &ether1;
+		serial0 = &scif2;
+		ethernet0 = &ether1;
 	};
 
 	chosen {
@@ -58,9 +79,9 @@ green {
 		};
 	};
 
-	memory@40000000 {
+	memory@c000000 {
 		device_type = "memory";
-		reg = <0x40000000 0x00800000>;	 /* HyperRAM */
+		reg = <0x0c000000 0x04000000>;	/* SDRAM */
 	};
 };
 
@@ -72,17 +93,6 @@ &ehci1 {
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
@@ -142,9 +152,9 @@ keyboard_pins: keyboard {
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
@@ -165,8 +175,7 @@ usb0_pins: usb0 {
 
 	usb1_pins: usb1 {
 		pinmux = <RZA2_PINMUX(PORTC, 0, 1)>,	/* VBUSIN1 */
-			 <RZA2_PINMUX(PORTC, 5, 1)>,	/* VBUSEN1 */
-			 <RZA2_PINMUX(PORT7, 5, 5)>;	/* OVRCUR1 */
+			 <RZA2_PINMUX(PORTC, 5, 1)>;	/* VBUSEN1 */
 	};
 };
 
@@ -176,9 +185,9 @@ &rtc_x1_clk {
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
2.25.1

