Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5A739E5A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 19:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbhFGRlC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 13:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbhFGRlC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 13:41:02 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A61C061766
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 10:39:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:c184:ea65:c3d6:a616])
        by michel.telenet-ops.be with bizsmtp
        id EHf82500s1G4u2S06Hf8BX; Mon, 07 Jun 2021 19:39:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqJDQ-00E7jG-Fv; Mon, 07 Jun 2021 19:39:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqJDP-00794J-V0; Mon, 07 Jun 2021 19:39:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] arm64: dts: renesas: salvator-x(s): Factor out USB ch2 parts
Date:   Mon,  7 Jun 2021 19:39:04 +0200
Message-Id: <ebc434502fc899b1f9d9640f560c3eaab6bb0927.1623087028.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623087028.git.geert+renesas@glider.be>
References: <cover.1623087028.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move the common parts related to the third USB2 interface on
Salvator-X(S) boards to salvator-common.dtsi, to reduce current and
avoid future duplication of board descriptions.

As this interface is not present on all SoCs that can be found on
Salvator-X(S), but only on R-Car H3, its descriptions are protected by
the preprocessor symbol SOC_HAS_USB2_CH2, defined in r8a77951.dtsi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../boot/dts/renesas/r8a77950-salvator-x.dts  | 22 -----------------
 .../boot/dts/renesas/r8a77951-salvator-x.dts  | 22 -----------------
 .../boot/dts/renesas/r8a77951-salvator-xs.dts | 20 ----------------
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     |  1 +
 .../boot/dts/renesas/salvator-common.dtsi     | 24 +++++++++++++++++++
 5 files changed, 25 insertions(+), 64 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
index 199bd909c4008451..c6ca61a8ed40eb9d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
@@ -47,25 +47,3 @@ &du {
 	clock-names = "du.0", "du.1", "du.2", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
 };
-
-&ehci2 {
-	status = "okay";
-};
-
-&ohci2 {
-	status = "okay";
-};
-
-&pfc {
-	usb2_pins: usb2 {
-		groups = "usb2";
-		function = "usb2";
-	};
-};
-
-&usb2_phy2 {
-	pinctrl-0 = <&usb2_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
index 74de36703bc02b90..d8e655ba81bd5939 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
@@ -47,25 +47,3 @@ &du {
 	clock-names = "du.0", "du.1", "du.2", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
 };
-
-&ehci2 {
-	status = "okay";
-};
-
-&ohci2 {
-	status = "okay";
-};
-
-&pfc {
-	usb2_pins: usb2 {
-		groups = "usb2";
-		function = "usb2";
-	};
-};
-
-&usb2_phy2 {
-	pinctrl-0 = <&usb2_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
index e9d421d7fcbbc404..bdea6f84ddb5cccd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
@@ -48,10 +48,6 @@ &du {
 		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
 };
 
-&ehci2 {
-	status = "okay";
-};
-
 &ehci3 {
 	dr_mode = "otg";
 	status = "okay";
@@ -62,21 +58,12 @@ &hsusb3 {
 	status = "okay";
 };
 
-&ohci2 {
-	status = "okay";
-};
-
 &ohci3 {
 	dr_mode = "otg";
 	status = "okay";
 };
 
 &pfc {
-	usb2_pins: usb2 {
-		groups = "usb2";
-		function = "usb2";
-	};
-
 	/*
 	 * - On Salvator-X[S], GP6_3[01] are connected to ADV7482 as irq pins
 	 *   (when SW31 is the default setting on Salvator-XS).
@@ -95,13 +82,6 @@ usb2_ch3_pins: usb2_ch3 {
 	};
 };
 
-&usb2_phy2 {
-	pinctrl-0 = <&usb2_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
 &usb2_phy3 {
 	pinctrl-0 = <&usb2_ch3_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 4602ebf5d28945d2..fd3180ddc7bff452 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -13,6 +13,7 @@
 
 #define SOC_HAS_HDMI1
 #define SOC_HAS_SATA
+#define SOC_HAS_USB2_CH2
 
 / {
 	compatible = "renesas,r8a7795";
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 11bca200cf3d8ad5..de959f28ad6ce27b 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -1029,3 +1029,27 @@ &xhci0 {
 
 	status = "okay";
 };
+
+#ifdef SOC_HAS_USB2_CH2
+&ehci2 {
+	status = "okay";
+};
+
+&ohci2 {
+	status = "okay";
+};
+
+&pfc {
+	usb2_pins: usb2 {
+		groups = "usb2";
+		function = "usb2";
+	};
+};
+
+&usb2_phy2 {
+	pinctrl-0 = <&usb2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#endif /* SOC_HAS_USB2_CH2 */
-- 
2.25.1

