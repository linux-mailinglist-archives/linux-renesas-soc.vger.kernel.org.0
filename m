Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B06D3EA3A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236861AbhHLLZH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236862AbhHLLYx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:53 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC73C0617BE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 04:24:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by andre.telenet-ops.be with bizsmtp
        id gbQQ2500i1gJxCh01bQQYS; Thu, 12 Aug 2021 13:24:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-002Fin-2Y; Thu, 12 Aug 2021 13:24:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8ox-007432-I5; Thu, 12 Aug 2021 13:24:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 03/29] arm64: dts: renesas: Factor out Draak board support
Date:   Thu, 12 Aug 2021 13:23:53 +0200
Message-Id: <32618abb48004793f2e030d29b3a038edc05f136.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move the common parts for the Renesas Draak board to draak.dtsi, to
avoid future duplication of board descriptions.

Change a reference in a comment from "r8a77995" to "R-Car D3(e)", to
prepare for the advent of "R-Car D3e".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Drop bogus "based" in model name,
  - Replace "D3" by "D3(e)",
  - Add Reviewed-by,
  - Rebased.
---
 .../{r8a77995-draak.dts => draak.dtsi}        |  10 +-
 .../arm64/boot/dts/renesas/r8a77995-draak.dts | 671 +-----------------
 2 files changed, 5 insertions(+), 676 deletions(-)
 copy arch/arm64/boot/dts/renesas/{r8a77995-draak.dts => draak.dtsi} (97%)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/draak.dtsi
similarity index 97%
copy from arch/arm64/boot/dts/renesas/r8a77995-draak.dts
copy to arch/arm64/boot/dts/renesas/draak.dtsi
index 1ac15aa05b823ba9..ff799ab73f8a479d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -1,19 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the Draak board with R-Car D3
+ * Device Tree Source for the Draak board
  *
  * Copyright (C) 2016-2018 Renesas Electronics Corp.
  * Copyright (C) 2017 Glider bvba
  */
 
-/dts-v1/;
-#include "r8a77995.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 
 / {
-	model = "Renesas Draak board based on r8a77995";
-	compatible = "renesas,draak", "renesas,r8a77995";
+	model = "Renesas Draak board";
+	compatible = "renesas,draak";
 
 	aliases {
 		serial0 = &scif2;
@@ -253,7 +251,7 @@ phy0: ethernet-phy@0 {
 		 * TX clock internal delay mode is required for reliable
 		 * 1Gbps communication using the KSZ9031RNX phy present on
 		 * the Draak board, however, TX clock internal delay mode
-		 * isn't supported on r8a77995.  Thus, limit speed to
+		 * isn't supported on R-Car D3(e).  Thus, limit speed to
 		 * 100Mbps for reliable communication.
 		 */
 		max-speed = <100>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 1ac15aa05b823ba9..384825617fcff1ff 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -8,678 +8,9 @@
 
 /dts-v1/;
 #include "r8a77995.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
+#include "draak.dtsi"
 
 / {
 	model = "Renesas Draak board based on r8a77995";
 	compatible = "renesas,draak", "renesas,r8a77995";
-
-	aliases {
-		serial0 = &scif2;
-		ethernet0 = &avb;
-	};
-
-	audio_clkout: audio-clkout {
-		/*
-		 * This is same as <&rcar_sound 0>
-		 * but needed to avoid cs2000/rcar_sound probe dead-lock
-		 */
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <12288000>;
-	};
-
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm1 0 50000>;
-
-		brightness-levels = <512 511 505 494 473 440 392 327 241 133 0>;
-		default-brightness-level = <10>;
-
-		power-supply = <&reg_12p0v>;
-		enable-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
-	};
-
-	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
-		stdout-path = "serial0:115200n8";
-	};
-
-	composite-in {
-		compatible = "composite-video-connector";
-
-		port {
-			composite_con_in: endpoint {
-				remote-endpoint = <&adv7180_in>;
-			};
-		};
-	};
-
-	hdmi-in {
-		compatible = "hdmi-connector";
-		type = "a";
-
-		port {
-			hdmi_con_in: endpoint {
-				remote-endpoint = <&adv7612_in>;
-			};
-		};
-	};
-
-	hdmi-out {
-		compatible = "hdmi-connector";
-		type = "a";
-
-		port {
-			hdmi_con_out: endpoint {
-				remote-endpoint = <&adv7511_out>;
-			};
-		};
-	};
-
-	keys {
-		compatible = "gpio-keys";
-
-		pinctrl-0 = <&keys_pins>;
-		pinctrl-names = "default";
-
-		key-1 {
-			gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_1>;
-			label = "SW56-1";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-		key-2 {
-			gpios = <&gpio4 13 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_2>;
-			label = "SW56-2";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-		key-3 {
-			gpios = <&gpio4 14 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_3>;
-			label = "SW56-3";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-		key-4 {
-			gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_4>;
-			label = "SW56-4";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-	};
-
-	lvds-decoder {
-		compatible = "thine,thc63lvd1024";
-		vcc-supply = <&reg_3p3v>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				thc63lvd1024_in: endpoint {
-					remote-endpoint = <&lvds0_out>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-				thc63lvd1024_out: endpoint {
-					remote-endpoint = <&adv7511_in>;
-				};
-			};
-		};
-	};
-
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0x0 0x48000000 0x0 0x18000000>;
-	};
-
-	reg_1p8v: regulator-1p8v {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-1.8V";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	reg_3p3v: regulator-3p3v {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-3.3V";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	reg_12p0v: regulator-12p0v {
-		compatible = "regulator-fixed";
-		regulator-name = "D12.0V";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	sound_card: sound {
-		compatible = "audio-graph-card";
-
-		dais = <&rsnd_port0	/* ak4613 */
-			/* HDMI is not yet supported */
-		>;
-	};
-
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
-	};
-
-	x12_clk: x12 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <74250000>;
-	};
-
-	x19_clk: x19 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24576000>;
-	};
-};
-
-&audio_clk_b {
-	/*
-	 * X11 is connected to VI4_FIELD/SCIF_CLK/AUDIO_CLKB,
-	 * and R-Car Sound uses AUDIO_CLKB.
-	 * Note is that schematic indicates VI4_FIELD conection only
-	 * not AUDIO_CLKB at SoC page.
-	 * And this VI4_FIELD/SCIF_CLK/AUDIO_CLKB is connected to SW60.
-	 * SW60 should be 1-2.
-	 */
-
-	clock-frequency = <22579200>;
-};
-
-&avb {
-	pinctrl-0 = <&avb0_pins>;
-	pinctrl-names = "default";
-	renesas,no-ether-link;
-	phy-handle = <&phy0>;
-	status = "okay";
-
-	phy0: ethernet-phy@0 {
-		rxc-skew-ps = <1500>;
-		reg = <0>;
-		interrupt-parent = <&gpio5>;
-		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
-		/*
-		 * TX clock internal delay mode is required for reliable
-		 * 1Gbps communication using the KSZ9031RNX phy present on
-		 * the Draak board, however, TX clock internal delay mode
-		 * isn't supported on r8a77995.  Thus, limit speed to
-		 * 100Mbps for reliable communication.
-		 */
-		max-speed = <100>;
-	};
-};
-
-&can0 {
-	pinctrl-0 = <&can0_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&can1 {
-	pinctrl-0 = <&can1_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&du {
-	pinctrl-0 = <&du_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	clocks = <&cpg CPG_MOD 724>,
-		 <&cpg CPG_MOD 723>,
-		 <&x12_clk>;
-	clock-names = "du.0", "du.1", "dclkin.0";
-
-	ports {
-		port@0 {
-			endpoint {
-				remote-endpoint = <&adv7123_in>;
-			};
-		};
-	};
-};
-
-&ehci0 {
-	dr_mode = "host";
-	status = "okay";
-};
-
-&extal_clk {
-	clock-frequency = <48000000>;
-};
-
-&hsusb {
-	dr_mode = "host";
-	status = "okay";
-};
-
-&i2c0 {
-	pinctrl-0 = <&i2c0_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	ak4613: codec@10 {
-		compatible = "asahi-kasei,ak4613";
-		#sound-dai-cells = <0>;
-		reg = <0x10>;
-		clocks = <&rcar_sound 0>; /* audio_clkout */
-
-		asahi-kasei,in1-single-end;
-		asahi-kasei,in2-single-end;
-		asahi-kasei,out1-single-end;
-		asahi-kasei,out2-single-end;
-		asahi-kasei,out3-single-end;
-		asahi-kasei,out4-single-end;
-		asahi-kasei,out5-single-end;
-		asahi-kasei,out6-single-end;
-
-		port {
-			ak4613_endpoint: endpoint {
-				remote-endpoint = <&rsnd_for_ak4613>;
-			};
-		};
-	};
-
-	composite-in@20 {
-		compatible = "adi,adv7180cp";
-		reg = <0x20>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				adv7180_in: endpoint {
-					remote-endpoint = <&composite_con_in>;
-				};
-			};
-
-			port@3 {
-				reg = <3>;
-
-				/*
-				 * The VIN4 video input path is shared between
-				 * CVBS and HDMI inputs through SW[49-53]
-				 * switches.
-				 *
-				 * CVBS is the default selection, link it to
-				 * VIN4 here.
-				 */
-				adv7180_out: endpoint {
-					remote-endpoint = <&vin4_in>;
-				};
-			};
-		};
-
-	};
-
-	hdmi-encoder@39 {
-		compatible = "adi,adv7511w";
-		reg = <0x39>, <0x3f>, <0x3c>, <0x38>;
-		reg-names = "main", "edid", "cec", "packet";
-		interrupt-parent = <&gpio1>;
-		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
-
-		adi,input-depth = <8>;
-		adi,input-colorspace = "rgb";
-		adi,input-clock = "1x";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				adv7511_in: endpoint {
-					remote-endpoint = <&thc63lvd1024_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				adv7511_out: endpoint {
-					remote-endpoint = <&hdmi_con_out>;
-				};
-			};
-		};
-	};
-
-	hdmi-decoder@4c {
-		compatible = "adi,adv7612";
-		reg = <0x4c>;
-		default-input = <0>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				adv7612_in: endpoint {
-					remote-endpoint = <&hdmi_con_in>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				/*
-				 * The VIN4 video input path is shared between
-				 * CVBS and HDMI inputs through SW[49-53]
-				 * switches.
-				 *
-				 * CVBS is the default selection, leave HDMI
-				 * not connected here.
-				 */
-				adv7612_out: endpoint {
-					pclk-sample = <0>;
-					hsync-active = <0>;
-					vsync-active = <0>;
-				};
-			};
-		};
-	};
-
-	cs2000: clk-multiplier@4f {
-		#clock-cells = <0>;
-		compatible = "cirrus,cs2000-cp";
-		reg = <0x4f>;
-		clocks = <&audio_clkout>, <&x19_clk>; /* audio_clkout_1, x19 */
-		clock-names = "clk_in", "ref_clk";
-
-		assigned-clocks = <&cs2000>;
-		assigned-clock-rates = <24576000>; /* 1/1 divide */
-	};
-
-	eeprom@50 {
-		compatible = "rohm,br24t01", "atmel,24c01";
-		reg = <0x50>;
-		pagesize = <8>;
-	};
-};
-
-&i2c1 {
-	pinctrl-0 = <&i2c1_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&lvds0 {
-	status = "okay";
-
-	clocks = <&cpg CPG_MOD 727>,
-		 <&x12_clk>,
-		 <&extal_clk>;
-	clock-names = "fck", "dclkin.0", "extal";
-
-	ports {
-		port@1 {
-			lvds0_out: endpoint {
-				remote-endpoint = <&thc63lvd1024_in>;
-			};
-		};
-	};
-};
-
-&lvds1 {
-	/*
-	 * Even though the LVDS1 output is not connected, the encoder must be
-	 * enabled to supply a pixel clock to the DU for the DPAD output when
-	 * LVDS0 is in use.
-	 */
-	status = "okay";
-
-	clocks = <&cpg CPG_MOD 727>,
-		 <&x12_clk>,
-		 <&extal_clk>;
-	clock-names = "fck", "dclkin.0", "extal";
-};
-
-&ohci0 {
-	dr_mode = "host";
-	status = "okay";
-};
-
-&pfc {
-	avb0_pins: avb {
-		groups = "avb0_link", "avb0_mdio", "avb0_mii";
-		function = "avb0";
-	};
-
-	can0_pins: can0 {
-		groups = "can0_data_a";
-		function = "can0";
-	};
-
-	can1_pins: can1 {
-		groups = "can1_data_a";
-		function = "can1";
-	};
-
-	du_pins: du {
-		groups = "du_rgb888", "du_sync", "du_disp", "du_clk_out_0";
-		function = "du";
-	};
-
-	i2c0_pins: i2c0 {
-		groups = "i2c0";
-		function = "i2c0";
-	};
-
-	i2c1_pins: i2c1 {
-		groups = "i2c1";
-		function = "i2c1";
-	};
-
-	keys_pins: keys {
-		pins = "GP_4_12", "GP_4_13", "GP_4_14", "GP_4_15";
-		bias-pull-up;
-	};
-
-	pwm0_pins: pwm0 {
-		groups = "pwm0_c";
-		function = "pwm0";
-	};
-
-	pwm1_pins: pwm1 {
-		groups = "pwm1_c";
-		function = "pwm1";
-	};
-
-	scif2_pins: scif2 {
-		groups = "scif2_data";
-		function = "scif2";
-	};
-
-	sdhi2_pins: sd2 {
-		groups = "mmc_data8", "mmc_ctrl";
-		function = "mmc";
-		power-source = <1800>;
-	};
-
-	sdhi2_pins_uhs: sd2_uhs {
-		groups = "mmc_data8", "mmc_ctrl";
-		function = "mmc";
-		power-source = <1800>;
-	};
-
-	sound_pins: sound {
-		groups = "ssi34_ctrl", "ssi3_data", "ssi4_data_a";
-		function = "ssi";
-	};
-
-	sound_clk_pins: sound-clk {
-		groups = "audio_clk_a", "audio_clk_b",
-			 "audio_clkout", "audio_clkout1";
-		function = "audio_clk";
-	};
-
-	usb0_pins: usb0 {
-		groups = "usb0";
-		function = "usb0";
-	};
-
-	vin4_pins_cvbs: vin4 {
-		groups = "vin4_data8", "vin4_sync", "vin4_clk";
-		function = "vin4";
-	};
-};
-
-&pwm0 {
-	pinctrl-0 = <&pwm0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pwm1 {
-	pinctrl-0 = <&pwm1_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&rcar_sound {
-	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
-	pinctrl-names = "default";
-
-	/* Single DAI */
-	#sound-dai-cells = <0>;
-
-	/* audio_clkout0/1 */
-	#clock-cells = <1>;
-	clock-frequency = <12288000 11289600>;
-
-	status = "okay";
-
-	clocks = <&cpg CPG_MOD 1005>,
-		 <&cpg CPG_MOD 1011>, <&cpg CPG_MOD 1012>,
-		 <&cpg CPG_MOD 1025>, <&cpg CPG_MOD 1026>,
-		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
-		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
-		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
-		 <&cs2000>, <&audio_clk_b>,
-		 <&cpg CPG_CORE R8A77995_CLK_ZA2>;
-
-	ports {
-		rsnd_port0: port {
-			rsnd_for_ak4613: endpoint {
-				remote-endpoint = <&ak4613_endpoint>;
-				dai-format = "left_j";
-				bitclock-master = <&rsnd_for_ak4613>;
-				frame-master = <&rsnd_for_ak4613>;
-				playback = <&ssi3>, <&src5>, <&dvc0>;
-				capture  = <&ssi4>, <&src6>, <&dvc1>;
-			};
-		};
-	};
-};
-
-&rwdt {
-	timeout-sec = <60>;
-	status = "okay";
-};
-
-&scif2 {
-	pinctrl-0 = <&scif2_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&sdhi2 {
-	/* used for on-board eMMC */
-	pinctrl-0 = <&sdhi2_pins>;
-	pinctrl-1 = <&sdhi2_pins_uhs>;
-	pinctrl-names = "default", "state_uhs";
-
-	vmmc-supply = <&reg_3p3v>;
-	vqmmc-supply = <&reg_1p8v>;
-	bus-width = <8>;
-	mmc-hs200-1_8v;
-	no-sd;
-	no-sdio;
-	non-removable;
-	status = "okay";
-};
-
-&ssi4 {
-	shared-pin;
-};
-
-&usb2_phy0 {
-	pinctrl-0 = <&usb0_pins>;
-	pinctrl-names = "default";
-
-	renesas,no-otg-pins;
-	status = "okay";
-};
-
-&vin4 {
-	pinctrl-0 = <&vin4_pins_cvbs>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	ports {
-		port {
-			vin4_in: endpoint {
-				remote-endpoint = <&adv7180_out>;
-			};
-		};
-	};
 };
-- 
2.25.1

