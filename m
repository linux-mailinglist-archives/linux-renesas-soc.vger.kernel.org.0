Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 119407DDCD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 16:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731989AbfHAOY1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 10:24:27 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42434 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731986AbfHAOY0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 10:24:26 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so34156649pff.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Aug 2019 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RxfWp3KtibnlEidfAQBstCjfkG4geNc9+S2+/+3C6nA=;
        b=cul9OuS8SW0E1u5njxUptdwIyfxOA2ullsEC4cUvxiXIRtDdAhV3VPpt0CQ9U8qQDY
         ijt9Of0/niyXcnDb4uhQ/NfbU44lkSuwfAQgfHYNyT0HLHubxBz1xjaRKFg3YYOEiqJQ
         IEsx2KO/MacmR4kaA9q9ZSaFUXW6A8IDveW/kDHy9/JKoGNBUEQkfkdMdVrzKpIwGLnF
         1ZBLqo5Bey5B+5MeChbjzFK2OdYNyBFBxe8Ag0lhZvCrS/vlqr2/pZIBio/z7/JF4juM
         RLcK8RPMlnHif2B4GGNlbhQH3cJu3vTWeOKXdm4yQ/XiknFaN14hFoiDg7cDCjo7bZbK
         x6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RxfWp3KtibnlEidfAQBstCjfkG4geNc9+S2+/+3C6nA=;
        b=BmYjvOvHmlFr8KbUCwBk+3rcoccmQzb+i1NFwbVpGN34nCaFuyul5r8lPgQbw6E2AL
         uGHJDxQniSk28ZoliwimmcZsPelHcFRrCoY8JCou7vA9r71v+yNhquJ+4LGwg0tbXNko
         CVBeevv8XauB1ORhGu/otazd9ywMmss8xoDLQ/JbRI2ObN5MIeW+IMTRupHvrOS7wALK
         aLTWm+msSBBJEZYF6wUtFqABvUxhQ1a3LkndrrkTkxOfStFUI5yKs/P6WwzUw37bMFjc
         j1U0mnGcxl4n4jxupG+W9HVtVcxnMIFuEMdTS6no5E30YDwJJ/vPzziY1uXnquKjXqgq
         8u5w==
X-Gm-Message-State: APjAAAV0Ds80ew7fhB7yfXR2e36FqdQmO60Fci5t6r3UZw25nePNXYvN
        KFHfiRvOcJAPGmEiwSeF2UGJR/kn
X-Google-Smtp-Source: APXvYqyS8fO7MMJHWc8iYKLfgQ6VP7ToEEUmgRdcdRpvHE/RulfefalYCr3GNbARbwCyjtypoK6RUw==
X-Received: by 2002:a63:fe52:: with SMTP id x18mr119431029pgj.344.1564669465802;
        Thu, 01 Aug 2019 07:24:25 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id o129sm48328036pfg.1.2019.08.01.07.24.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 01 Aug 2019 07:24:25 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a77990-ebisu: sort nodes
Date:   Thu,  1 Aug 2019 23:24:12 +0900
Message-Id: <1564669452-22631-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sort nodes.

If node address is present
   * Sort by node address, grouping all nodes with the same compat string
     and sorting the group alphabetically.
Else
   * Sort alphabetically

This should not have any run-time effect.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the master branch of Geert Uytterhoeven's renesas-devel
tree.

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 202 ++++++++++++-------------
 1 file changed, 101 insertions(+), 101 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 83fc13a..69ef43b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -23,12 +23,6 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0x0 0x48000000 0x0 0x38000000>;
-	};
-
 	audio_clkout: audio-clkout {
 		/*
 		 * This is same as <&rcar_sound 0>
@@ -107,36 +101,10 @@
 		};
 	};
 
-	vga {
-		compatible = "vga-connector";
-
-		port {
-			vga_in: endpoint {
-				remote-endpoint = <&adv7123_out>;
-			};
-		};
-	};
-
-	vga-encoder {
-		compatible = "adi,adv7123";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				adv7123_in: endpoint {
-					remote-endpoint = <&du_out_rgb>;
-				};
-			};
-			port@1 {
-				reg = <1>;
-				adv7123_out: endpoint {
-					remote-endpoint = <&vga_in>;
-				};
-			};
-		};
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
 
 	reg_1p8v: regulator0 {
@@ -157,15 +125,13 @@
 		regulator-always-on;
 	};
 
-	vbus0_usb2: regulator-vbus0-usb2 {
+	reg_12p0v: regulator2 {
 		compatible = "regulator-fixed";
-
-		regulator-name = "USB20_VBUS_CN";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-
-		gpio = <&gpio6 4 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
+		regulator-name = "D12.0V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
 	};
 
 	rsnd_ak4613: sound {
@@ -185,25 +151,15 @@
 		};
 	};
 
-	x12_clk: x12 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24576000>;
-	};
-
-	reg_12p0v: regulator2 {
+	vbus0_usb2: regulator-vbus0-usb2 {
 		compatible = "regulator-fixed";
-		regulator-name = "D12.0V";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
 
-	x13_clk: x13 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <74250000>;
+		regulator-name = "USB20_VBUS_CN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio6 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 
 	vcc_sdhi0: regulator-vcc-sdhi0 {
@@ -253,6 +209,50 @@
 		states = <3300000 1
 			  1800000 0>;
 	};
+
+	vga {
+		compatible = "vga-connector";
+
+		port {
+			vga_in: endpoint {
+				remote-endpoint = <&adv7123_out>;
+			};
+		};
+	};
+
+	vga-encoder {
+		compatible = "adi,adv7123";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7123_in: endpoint {
+					remote-endpoint = <&du_out_rgb>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				adv7123_out: endpoint {
+					remote-endpoint = <&vga_in>;
+				};
+			};
+		};
+	};
+
+	x12_clk: x12 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24576000>;
+	};
+
+	x13_clk: x13 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <74250000>;
+	};
 };
 
 &audio_clk_a {
@@ -547,6 +547,11 @@
 		function = "pwm5";
 	};
 
+	scif2_pins: scif2 {
+		groups = "scif2_data_a";
+		function = "scif2";
+	};
+
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
@@ -577,20 +582,15 @@
 		power-source = <1800>;
 	};
 
-	sound_pins: sound {
-		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data";
-		function = "ssi";
-	};
-
 	sound_clk_pins: sound_clk {
 		groups = "audio_clk_a", "audio_clk_b_a", "audio_clk_c_a",
 			 "audio_clkout_a", "audio_clkout1_a";
 		function = "audio_clk";
 	};
 
-	scif2_pins: scif2 {
-		groups = "scif2_data_a";
-		function = "scif2";
+	sound_pins: sound {
+		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data";
+		function = "ssi";
 	};
 
 	usb0_pins: usb {
@@ -671,38 +671,6 @@
 	status = "okay";
 };
 
-&ssi1 {
-	shared-pin;
-};
-
-&usb2_phy0 {
-	pinctrl-0 = <&usb0_pins>;
-	pinctrl-names = "default";
-
-	vbus-supply = <&vbus0_usb2>;
-	status = "okay";
-};
-
-&usb3_peri0 {
-	companion = <&xhci0>;
-	status = "okay";
-};
-
-&vin4 {
-	status = "okay";
-};
-
-&vin5 {
-	status = "okay";
-};
-
-&xhci0 {
-	pinctrl-0 = <&usb30_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
 	pinctrl-1 = <&sdhi0_pins_uhs>;
@@ -746,3 +714,35 @@
 	non-removable;
 	status = "okay";
 };
+
+&ssi1 {
+	shared-pin;
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&vbus0_usb2>;
+	status = "okay";
+};
+
+&usb3_peri0 {
+	companion = <&xhci0>;
+	status = "okay";
+};
+
+&vin4 {
+	status = "okay";
+};
+
+&vin5 {
+	status = "okay";
+};
+
+&xhci0 {
+	pinctrl-0 = <&usb30_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
1.9.1

