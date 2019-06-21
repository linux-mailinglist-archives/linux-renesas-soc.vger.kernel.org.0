Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 455164E2E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfFUJOT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:14:19 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfFUJOS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:14:18 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 57BE125BE67;
        Fri, 21 Jun 2019 19:13:55 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A40509413C0; Fri, 21 Jun 2019 11:13:51 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 17/22] ARM: dts: rza2mevb: sort nodes of rza2mevb board
Date:   Fri, 21 Jun 2019 11:13:44 +0200
Message-Id: <1de78ccbda7835da6e1a75d5860267afb4f393f3.1561104194.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561104194.git.horms+renesas@verge.net.au>
References: <cover.1561104194.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Yoshihiro Kaneko <ykaneko0929@gmail.com>

This patch sorts the nodes of arch/arm/boot/dts/r7s9210-rza2mevb.dts.

* Sort subnodes of root ("/") node alphabetically
* Sort following top-level nodes alphabetically
* Sort subnodes of pinctrl alphabetically

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
[simon: rebase and sort new ehci nodes]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 104 ++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index e140168da573..49c40065741b 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -26,11 +26,6 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@40000000 {
-		device_type = "memory";
-		reg = <0x40000000 0x00800000>;	 /* HyperRAM */
-	};
-
 	lbsc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -46,6 +41,41 @@
 			gpios = <&pinctrl RZA2_PIN(PORTC, 1) GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x00800000>;	 /* HyperRAM */
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ether0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth0_pins>;
+	status = "okay";
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&ether1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth1_pins>;
+	status = "okay";
+	renesas,no-ether-link;
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@1 {
+		reg = <0>;
+	};
 };
 
 /* EXTAL */
@@ -53,23 +83,16 @@
 	clock-frequency = <24000000>;	/* 24MHz */
 };
 
-/* RTC_X1 */
-&rtc_x1_clk {
-	clock-frequency = <32768>;
+/* High resolution System tick timers */
+&ostm0 {
+	status = "okay";
 };
 
-/* USB_X1 */
-&usb_x1_clk {
-	clock-frequency = <48000000>;
+&ostm1 {
+	status = "okay";
 };
 
 &pinctrl {
-	/* Serial Console */
-	scif4_pins: serial4 {
-		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
-			 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
-	};
-
 	eth0_pins: eth0 {
 		pinmux = <RZA2_PINMUX(PORTE, 0, 7)>, /* REF50CK0 */
 			 <RZA2_PINMUX(PORT6, 1, 7)>, /* RMMI0_TXDEN */
@@ -98,6 +121,12 @@
 			 <RZA2_PINMUX(PORTL, 1, 5)>; /* IRQ5 */
 	};
 
+	/* Serial Console */
+	scif4_pins: serial4 {
+		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
+			 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
+	};
+
 	sdhi0_pins: sdhi0 {
 		pinmux = <RZA2_PINMUX(PORT5, 0, 3)>,	/* SD0_CD */
 			 <RZA2_PINMUX(PORT5, 1, 3)>;	/* SD0_WP */
@@ -121,13 +150,9 @@
 	};
 };
 
-/* High resolution System tick timers */
-&ostm0 {
-	status = "okay";
-};
-
-&ostm1 {
-	status = "okay";
+/* RTC_X1 */
+&rtc_x1_clk {
+	clock-frequency = <32768>;
 };
 
 /* Serial Console */
@@ -138,28 +163,6 @@
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
-&ether1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&eth1_pins>;
-	status = "okay";
-	renesas,no-ether-link;
-	phy-handle = <&phy1>;
-	phy1: ethernet-phy@1 {
-		reg = <0>;
-	};
-};
-
 &sdhi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdhi0_pins>;
@@ -182,10 +185,6 @@
 	status = "okay";
 };
 
-&ehci0 {
-	status = "okay";
-};
-
 /* USB-1 as Host */
 &usb2_phy1 {
 	pinctrl-names = "default";
@@ -194,6 +193,7 @@
 	status = "okay";
 };
 
-&ehci1 {
-	status = "okay";
+/* USB_X1 */
+&usb_x1_clk {
+	clock-frequency = <48000000>;
 };
-- 
2.11.0

