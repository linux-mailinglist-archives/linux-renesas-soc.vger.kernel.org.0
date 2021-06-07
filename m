Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D1239E5A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 19:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhFGRlF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 13:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbhFGRlC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 13:41:02 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05136C06178B
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 10:39:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:c184:ea65:c3d6:a616])
        by laurent.telenet-ops.be with bizsmtp
        id EHf92500Q1G4u2S01Hf9HP; Mon, 07 Jun 2021 19:39:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqJDQ-00E7jH-Q2; Mon, 07 Jun 2021 19:39:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqJDQ-00794Q-0D; Mon, 07 Jun 2021 19:39:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] arm64: dts: renesas: salvator-xs: Factor out USB ch3 parts
Date:   Mon,  7 Jun 2021 19:39:05 +0200
Message-Id: <411df1adfd64ee82e5a0d1603df85d657fd4f8c0.1623087028.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623087028.git.geert+renesas@glider.be>
References: <cover.1623087028.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move the parts related to the fourth USB2 interface on Salvator-XS
boards to salvator-xs.dtsi, to avoid future duplication of board
descriptions.

As this interface is not present on all SoCs that can be found on
Salvator-X(S), but only on R-Car H3 ES2.0+, its descriptions are
protected by the preprocessor symbol SOC_HAS_USB2_CH3, defined in
r8a77951.dtsi, and undefined in r8a77950.dtsi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77950.dtsi     |  2 +
 .../boot/dts/renesas/r8a77951-salvator-xs.dts | 41 ------------------
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     |  1 +
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi  | 43 +++++++++++++++++++
 4 files changed, 46 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77950.dtsi b/arch/arm64/boot/dts/renesas/r8a77950.dtsi
index b643d3079db1e7aa..57eb88177e92880e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77950.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77950.dtsi
@@ -7,6 +7,8 @@
 
 #include "r8a77951.dtsi"
 
+#undef SOC_HAS_USB2_CH3
+
 &audma0 {
 	iommus = <&ipmmu_mp1 0>, <&ipmmu_mp1 1>,
 	       <&ipmmu_mp1 2>, <&ipmmu_mp1 3>,
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
index bdea6f84ddb5cccd..7f9fa842f01e59f0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
@@ -47,44 +47,3 @@ &du {
 	clock-names = "du.0", "du.1", "du.2", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
 };
-
-&ehci3 {
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&hsusb3 {
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&ohci3 {
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&pfc {
-	/*
-	 * - On Salvator-X[S], GP6_3[01] are connected to ADV7482 as irq pins
-	 *   (when SW31 is the default setting on Salvator-XS).
-	 * - If SW31 is the default setting, you cannot use USB2.0 ch3 on
-	 *   r8a77951 with Salvator-XS.
-	 *   Hence the SW31 setting must be changed like 2) below.
-	 *   1) Default setting of SW31: ON-ON-OFF-OFF-OFF-OFF:
-	 *	- Connect GP6_3[01] to ADV7842.
-	 *   2) Changed setting of SW31: OFF-OFF-ON-ON-ON-ON:
-	 *	- Connect GP6_3[01] to BD082065 (USB2.0 ch3's host power).
-	 *	- Connect GP6_{04,21} to ADV7842.
-	 */
-	usb2_ch3_pins: usb2_ch3 {
-		groups = "usb2_ch3";
-		function = "usb2_ch3";
-	};
-};
-
-&usb2_phy3 {
-	pinctrl-0 = <&usb2_ch3_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index fd3180ddc7bff452..1768a3e6bb8da6a1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -14,6 +14,7 @@
 #define SOC_HAS_HDMI1
 #define SOC_HAS_SATA
 #define SOC_HAS_USB2_CH2
+#define SOC_HAS_USB2_CH3
 
 / {
 	compatible = "renesas,r8a7795";
diff --git a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
index 3f7f6cf4a3338125..08b925624e129205 100644
--- a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
@@ -40,3 +40,46 @@ pcie-sata-switch-hog {
 
 /* SW12-7 must be set 'Off' (MD12 set to 1) which is not the default! */
 #endif /* SOC_HAS_SATA */
+
+#ifdef SOC_HAS_USB2_CH3
+&ehci3 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&hsusb3 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci3 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&pfc {
+	/*
+	 * - On Salvator-X[S], GP6_3[01] are connected to ADV7482 as irq pins
+	 *   (when SW31 is the default setting on Salvator-XS).
+	 * - If SW31 is the default setting, you cannot use USB2.0 ch3 on
+	 *   r8a77951 with Salvator-XS.
+	 *   Hence the SW31 setting must be changed like 2) below.
+	 *   1) Default setting of SW31: ON-ON-OFF-OFF-OFF-OFF:
+	 *	- Connect GP6_3[01] to ADV7842.
+	 *   2) Changed setting of SW31: OFF-OFF-ON-ON-ON-ON:
+	 *	- Connect GP6_3[01] to BD082065 (USB2.0 ch3's host power).
+	 *	- Connect GP6_{04,21} to ADV7842.
+	 */
+	usb2_ch3_pins: usb2_ch3 {
+		groups = "usb2_ch3";
+		function = "usb2_ch3";
+	};
+};
+
+&usb2_phy3 {
+	pinctrl-0 = <&usb2_ch3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#endif /* SOC_HAS_USB2_CH3 */
-- 
2.25.1

