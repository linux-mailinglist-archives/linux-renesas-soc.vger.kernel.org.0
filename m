Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD67039E5A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 19:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhFGRlF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 13:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhFGRlC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 13:41:02 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0585AC061795
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 10:39:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:c184:ea65:c3d6:a616])
        by laurent.telenet-ops.be with bizsmtp
        id EHf82500x1G4u2S01Hf9HH; Mon, 07 Jun 2021 19:39:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqJDQ-00E7jF-K3; Mon, 07 Jun 2021 19:39:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lqJDP-00794C-UB; Mon, 07 Jun 2021 19:39:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] arm64: dts: renesas: salvator-x(s): Factor out SATA parts
Date:   Mon,  7 Jun 2021 19:39:03 +0200
Message-Id: <87f91290ec7b523aa508e920a169ecaddccc9144.1623087028.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623087028.git.geert+renesas@glider.be>
References: <cover.1623087028.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move the common parts related to the SATA interface on Salvator-X(S)
boards to salvator-common.dtsi and salvator-xs.dtsi, to reduce current
and avoid future duplication of board descriptions.

As this interface is not present on all SoCs that can be found on
Salvator-X(S), but only on R-Car H3 and M3-N, its descriptions are
protected by the preprocessor symbol SOC_HAS_SATA, defined in
r8a77951.dtsi and r8a77965.dtsi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
After this, the SATA device node in r8a77965-salvator-x.dtb is no longer
disabled.  However, I'm not sure if SATA is actually supported on the
(rare) combination of a Salvator-X board with an R-Car M3-N SiP.
Perhaps it should be kept disabled, by undefining SOC_HAS_SATA in
arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts, right after the
inclusion of r8a77965.dtsi?
---
 .../arm64/boot/dts/renesas/r8a77950-salvator-x.dts |  4 ----
 .../arm64/boot/dts/renesas/r8a77951-salvator-x.dts |  4 ----
 .../boot/dts/renesas/r8a77951-salvator-xs.dts      | 14 --------------
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  1 +
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      | 14 --------------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  2 ++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  6 ++++++
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi       | 13 +++++++++++++
 8 files changed, 22 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
index 718d1597af03dc2e..199bd909c4008451 100644
--- a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
@@ -63,10 +63,6 @@ usb2_pins: usb2 {
 	};
 };
 
-&sata {
-	status = "okay";
-};
-
 &usb2_phy2 {
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
index d75fb9a9d3e4309d..74de36703bc02b90 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dts
@@ -63,10 +63,6 @@ usb2_pins: usb2 {
 	};
 };
 
-&sata {
-	status = "okay";
-};
-
 &usb2_phy2 {
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
index fb8734ea5bc37b49..e9d421d7fcbbc404 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
@@ -71,15 +71,6 @@ &ohci3 {
 	status = "okay";
 };
 
-&pca9654 {
-	pcie-sata-switch-hog {
-		gpio-hog;
-		gpios = <7 GPIO_ACTIVE_HIGH>;
-		output-low; /* enable SATA by default */
-		line-name = "PCIE/SATA switch";
-	};
-};
-
 &pfc {
 	usb2_pins: usb2 {
 		groups = "usb2";
@@ -104,11 +95,6 @@ usb2_ch3_pins: usb2_ch3 {
 	};
 };
 
-/* SW12-7 must be set 'Off' (MD12 set to 1) which is not the default! */
-&sata {
-	status = "okay";
-};
-
 &usb2_phy2 {
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 68e54ead31b451ca..4602ebf5d28945d2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -12,6 +12,7 @@
 #define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
 
 #define SOC_HAS_HDMI1
+#define SOC_HAS_SATA
 
 / {
 	compatible = "renesas,r8a7795";
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
index 729756c24c7479a3..a1d3c8d531cfe9ef 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
@@ -30,17 +30,3 @@ &du {
 	clock-names = "du.0", "du.1", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.3";
 };
-
-&pca9654 {
-	pcie-sata-switch-hog {
-		gpio-hog;
-		gpios = <7 GPIO_ACTIVE_HIGH>;
-		output-low; /* enable SATA by default */
-		line-name = "PCIE/SATA switch";
-	};
-};
-
-/* SW12-7 must be set 'Off' (MD12 set to 1) which is not the default! */
-&sata {
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index ad69da362a72ef99..08df75606430bd4a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -14,6 +14,8 @@
 
 #define CPG_AUDIO_CLK_I		R8A77965_CLK_S0D4
 
+#define SOC_HAS_SATA
+
 / {
 	compatible = "renesas,r8a77965";
 	#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index ea1d8693a38eacbb..11bca200cf3d8ad5 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -876,6 +876,12 @@ &rwdt {
 	status = "okay";
 };
 
+#ifdef SOC_HAS_SATA
+&sata {
+	status = "okay";
+};
+#endif /* SOC_HAS_SATA */
+
 &scif1 {
 	pinctrl-0 = <&scif1_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
index 717d42758cbc4b39..3f7f6cf4a3338125 100644
--- a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
@@ -27,3 +27,16 @@ versaclock6: clock-generator@6a {
 		clock-names = "xin";
 	};
 };
+
+#ifdef SOC_HAS_SATA
+&pca9654 {
+	pcie-sata-switch-hog {
+		gpio-hog;
+		gpios = <7 GPIO_ACTIVE_HIGH>;
+		output-low; /* enable SATA by default */
+		line-name = "PCIE/SATA switch";
+	};
+};
+
+/* SW12-7 must be set 'Off' (MD12 set to 1) which is not the default! */
+#endif /* SOC_HAS_SATA */
-- 
2.25.1

