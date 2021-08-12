Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625463EA39E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236880AbhHLLZG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236720AbhHLLYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:54 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF89C061382
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 04:24:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by xavier.telenet-ops.be with bizsmtp
        id gbQR2500P1gJxCh01bQR3E; Thu, 12 Aug 2021 13:24:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oz-002Fio-4t; Thu, 12 Aug 2021 13:24:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8ox-007439-J4; Thu, 12 Aug 2021 13:24:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 04/29] arm64: dts: renesas: Factor out Ebisu board support
Date:   Thu, 12 Aug 2021 13:23:54 +0200
Message-Id: <df275772dea0a4fa88d1bffa96ce048eaa7d5308.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move the common parts for the Renesas Ebisu board to ebisu.dtsi, to
avoid future duplication of board descriptions.

Change a reference in a comment from "r8a77990" to "R-Car E3(e)", to
prepare for the advent of "R-Car E3e".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Replace "E3" by "E3(e)",
  - Add Reviewed-by,
  - Rebased.
---
 .../{r8a77990-ebisu.dts => ebisu.dtsi}        |  10 +-
 .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 788 +-----------------
 2 files changed, 5 insertions(+), 793 deletions(-)
 copy arch/arm64/boot/dts/renesas/{r8a77990-ebisu.dts => ebisu.dtsi} (98%)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/ebisu.dtsi
similarity index 98%
copy from arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
copy to arch/arm64/boot/dts/renesas/ebisu.dtsi
index 9c7146084ea1c779..54f88bb7e5920296 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -1,18 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the Ebisu board with R-Car E3
+ * Device Tree Source for the Ebisu board
  *
  * Copyright (C) 2018 Renesas Electronics Corp.
  */
 
-/dts-v1/;
-#include "r8a77990.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 
 / {
-	model = "Renesas Ebisu board based on r8a77990";
-	compatible = "renesas,ebisu", "renesas,r8a77990";
+	model = "Renesas Ebisu board";
+	compatible = "renesas,ebisu";
 
 	aliases {
 		serial0 = &scif2;
@@ -313,7 +311,7 @@ phy0: ethernet-phy@0 {
 		 * TX clock internal delay mode is required for reliable
 		 * 1Gbps communication using the KSZ9031RNX phy present on
 		 * the Ebisu board, however, TX clock internal delay mode
-		 * isn't supported on r8a77990.  Thus, limit speed to
+		 * isn't supported on R-Car E3(e).  Thus, limit speed to
 		 * 100Mbps for reliable communication.
 		 */
 		max-speed = <100>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 9c7146084ea1c779..9da0fd08f8c46b35 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -7,795 +7,9 @@
 
 /dts-v1/;
 #include "r8a77990.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
+#include "ebisu.dtsi"
 
 / {
 	model = "Renesas Ebisu board based on r8a77990";
 	compatible = "renesas,ebisu", "renesas,r8a77990";
-
-	aliases {
-		serial0 = &scif2;
-		ethernet0 = &avb;
-		mmc0 = &sdhi3;
-		mmc1 = &sdhi0;
-		mmc2 = &sdhi1;
-	};
-
-	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
-		stdout-path = "serial0:115200n8";
-	};
-
-	audio_clkout: audio-clkout {
-		/*
-		 * This is same as <&rcar_sound 0>
-		 * but needed to avoid cs2000/rcar_sound probe dead-lock
-		 */
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <11289600>;
-	};
-
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm3 0 50000>;
-
-		brightness-levels = <512 511 505 494 473 440 392 327 241 133 0>;
-		default-brightness-level = <10>;
-
-		power-supply = <&reg_12p0v>;
-	};
-
-	cvbs-in {
-		compatible = "composite-video-connector";
-		label = "CVBS IN";
-
-		port {
-			cvbs_con: endpoint {
-				remote-endpoint = <&adv7482_ain7>;
-			};
-		};
-	};
-
-	hdmi-in {
-		compatible = "hdmi-connector";
-		label = "HDMI IN";
-		type = "a";
-
-		port {
-			hdmi_in_con: endpoint {
-				remote-endpoint = <&adv7482_hdmi>;
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
-			gpios = <&gpio5 10 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_1>;
-			label = "SW4-1";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-		key-2 {
-			gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_2>;
-			label = "SW4-2";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-		key-3 {
-			gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_3>;
-			label = "SW4-3";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-		key-4 {
-			gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_4>;
-			label = "SW4-4";
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
-		reg = <0x0 0x48000000 0x0 0x38000000>;
-	};
-
-	reg_1p8v: regulator0 {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-1.8V";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	reg_3p3v: regulator1 {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-3.3V";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	reg_12p0v: regulator2 {
-		compatible = "regulator-fixed";
-		regulator-name = "D12.0V";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	rsnd_ak4613: sound {
-		compatible = "simple-audio-card";
-
-		simple-audio-card,name = "rsnd-ak4613";
-		simple-audio-card,format = "left_j";
-		simple-audio-card,bitclock-master = <&sndcpu>;
-		simple-audio-card,frame-master = <&sndcpu>;
-
-		sndcodec: simple-audio-card,codec {
-			sound-dai = <&ak4613>;
-		};
-
-		sndcpu: simple-audio-card,cpu {
-			sound-dai = <&rcar_sound>;
-		};
-	};
-
-	vbus0_usb2: regulator-vbus0-usb2 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "USB20_VBUS_CN";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-
-		gpio = <&gpio6 4 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	vcc_sdhi0: regulator-vcc-sdhi0 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "SDHI0 Vcc";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&gpio5 17 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	vccq_sdhi0: regulator-vccq-sdhi0 {
-		compatible = "regulator-gpio";
-
-		regulator-name = "SDHI0 VccQ";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
-		gpios-states = <1>;
-		states = <3300000 1>, <1800000 0>;
-	};
-
-	vcc_sdhi1: regulator-vcc-sdhi1 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "SDHI1 Vcc";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&gpio0 4 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	vccq_sdhi1: regulator-vccq-sdhi1 {
-		compatible = "regulator-gpio";
-
-		regulator-name = "SDHI1 VccQ";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
-		gpios-states = <1>;
-		states = <3300000 1>, <1800000 0>;
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
-		clock-frequency = <24576000>;
-	};
-
-	x13_clk: x13 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <74250000>;
-	};
-};
-
-&audio_clk_a {
-	clock-frequency = <22579200>;
-};
-
-&avb {
-	pinctrl-0 = <&avb_pins>;
-	pinctrl-names = "default";
-	phy-handle = <&phy0>;
-	status = "okay";
-
-	phy0: ethernet-phy@0 {
-		rxc-skew-ps = <1500>;
-		reg = <0>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
-		/*
-		 * TX clock internal delay mode is required for reliable
-		 * 1Gbps communication using the KSZ9031RNX phy present on
-		 * the Ebisu board, however, TX clock internal delay mode
-		 * isn't supported on r8a77990.  Thus, limit speed to
-		 * 100Mbps for reliable communication.
-		 */
-		max-speed = <100>;
-	};
-};
-
-&canfd {
-	pinctrl-0 = <&canfd0_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	channel0 {
-		status = "okay";
-	};
-};
-
-&csi40 {
-	status = "okay";
-
-	ports {
-		port@0 {
-			csi40_in: endpoint {
-				clock-lanes = <0>;
-				data-lanes = <1 2>;
-				remote-endpoint = <&adv7482_txa>;
-			};
-		};
-	};
-};
-
-&du {
-	pinctrl-0 = <&du_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	clocks = <&cpg CPG_MOD 724>,
-		 <&cpg CPG_MOD 723>,
-		 <&x13_clk>;
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
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&extal_clk {
-	clock-frequency = <48000000>;
-};
-
-&hsusb {
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&i2c0 {
-	status = "okay";
-
-	io_expander: gpio@20 {
-		compatible = "onnn,pca9654";
-		reg = <0x20>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
-	};
-
-	hdmi-encoder@39 {
-		compatible = "adi,adv7511w";
-		reg = <0x39>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
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
-	video-receiver@70 {
-		compatible = "adi,adv7482";
-		reg = <0x70>;
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		interrupt-parent = <&gpio0>;
-		interrupt-names = "intrq1", "intrq2";
-		interrupts = <7 IRQ_TYPE_LEVEL_LOW>,
-			     <17 IRQ_TYPE_LEVEL_LOW>;
-
-		port@7 {
-			reg = <7>;
-
-			adv7482_ain7: endpoint {
-				remote-endpoint = <&cvbs_con>;
-			};
-		};
-
-		port@8 {
-			reg = <8>;
-
-			adv7482_hdmi: endpoint {
-				remote-endpoint = <&hdmi_in_con>;
-			};
-		};
-
-		port@a {
-			reg = <10>;
-
-			adv7482_txa: endpoint {
-				clock-lanes = <0>;
-				data-lanes = <1 2>;
-				remote-endpoint = <&csi40_in>;
-			};
-		};
-	};
-};
-
-&i2c3 {
-	status = "okay";
-
-	ak4613: codec@10 {
-		compatible = "asahi-kasei,ak4613";
-		#sound-dai-cells = <0>;
-		reg = <0x10>;
-		clocks = <&rcar_sound 3>;
-
-		asahi-kasei,in1-single-end;
-		asahi-kasei,in2-single-end;
-		asahi-kasei,out1-single-end;
-		asahi-kasei,out2-single-end;
-		asahi-kasei,out3-single-end;
-		asahi-kasei,out4-single-end;
-		asahi-kasei,out5-single-end;
-		asahi-kasei,out6-single-end;
-	};
-
-	cs2000: clk-multiplier@4f {
-		#clock-cells = <0>;
-		compatible = "cirrus,cs2000-cp";
-		reg = <0x4f>;
-		clocks = <&audio_clkout>, <&x12_clk>;
-		clock-names = "clk_in", "ref_clk";
-
-		assigned-clocks = <&cs2000>;
-		assigned-clock-rates = <24576000>; /* 1/1 divide */
-	};
-};
-
-&i2c_dvfs {
-	status = "okay";
-
-	clock-frequency = <400000>;
-
-	pmic: pmic@30 {
-		pinctrl-0 = <&irq0_pins>;
-		pinctrl-names = "default";
-
-		compatible = "rohm,bd9571mwv";
-		reg = <0x30>;
-		interrupt-parent = <&intc_ex>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		rohm,ddr-backup-power = <0x1>;
-		rohm,rstbmode-level;
-	};
-
-	eeprom@50 {
-		compatible = "rohm,br24t01", "atmel,24c01";
-		reg = <0x50>;
-		pagesize = <8>;
-	};
-};
-
-&lvds0 {
-	status = "okay";
-
-	clocks = <&cpg CPG_MOD 727>,
-		 <&x13_clk>,
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
-		 <&x13_clk>,
-		 <&extal_clk>;
-	clock-names = "fck", "dclkin.0", "extal";
-};
-
-&ohci0 {
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&pcie_bus_clk {
-	clock-frequency = <100000000>;
-};
-
-&pciec0 {
-	status = "okay";
-};
-
-&pfc {
-	avb_pins: avb {
-		groups = "avb_link", "avb_mii";
-		function = "avb";
-	};
-
-	canfd0_pins: canfd0 {
-		groups = "canfd0_data";
-		function = "canfd0";
-	};
-
-	du_pins: du {
-		groups = "du_rgb888", "du_sync", "du_disp", "du_clk_out_0";
-		function = "du";
-	};
-
-	irq0_pins: irq0 {
-		groups = "intc_ex_irq0";
-		function = "intc_ex";
-	};
-
-	keys_pins: keys {
-		pins = "GP_5_10", "GP_5_11", "GP_5_12", "GP_5_13";
-		bias-pull-up;
-	};
-
-	pwm3_pins: pwm3 {
-		groups = "pwm3_b";
-		function = "pwm3";
-	};
-
-	pwm5_pins: pwm5 {
-		groups = "pwm5_a";
-		function = "pwm5";
-	};
-
-	scif2_pins: scif2 {
-		groups = "scif2_data_a";
-		function = "scif2";
-	};
-
-	sdhi0_pins: sd0 {
-		groups = "sdhi0_data4", "sdhi0_ctrl";
-		function = "sdhi0";
-		power-source = <3300>;
-	};
-
-	sdhi0_pins_uhs: sd0_uhs {
-		groups = "sdhi0_data4", "sdhi0_ctrl";
-		function = "sdhi0";
-		power-source = <1800>;
-	};
-
-	sdhi1_pins: sd1 {
-		groups = "sdhi1_data4", "sdhi1_ctrl";
-		function = "sdhi1";
-		power-source = <3300>;
-	};
-
-	sdhi1_pins_uhs: sd1_uhs {
-		groups = "sdhi1_data4", "sdhi1_ctrl";
-		function = "sdhi1";
-		power-source = <1800>;
-	};
-
-	sdhi3_pins: sd3 {
-		groups = "sdhi3_data8", "sdhi3_ctrl", "sdhi3_ds";
-		function = "sdhi3";
-		power-source = <1800>;
-	};
-
-	sound_clk_pins: sound_clk {
-		groups = "audio_clk_a", "audio_clk_b_a", "audio_clk_c_a",
-			 "audio_clkout_a", "audio_clkout1_a";
-		function = "audio_clk";
-	};
-
-	sound_pins: sound {
-		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data";
-		function = "ssi";
-	};
-
-	usb0_pins: usb {
-		groups = "usb0_b", "usb0_id";
-		function = "usb0";
-	};
-
-	usb30_pins: usb30 {
-		groups = "usb30";
-		function = "usb30";
-	};
-};
-
-&pwm3 {
-	pinctrl-0 = <&pwm3_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pwm5 {
-	pinctrl-0 = <&pwm5_pins>;
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
-	/* audio_clkout0/1/2/3 */
-	#clock-cells = <1>;
-	clock-frequency = <12288000 11289600>;
-
-	status = "okay";
-
-	/* update <audio_clk_b> to <cs2000> */
-	clocks = <&cpg CPG_MOD 1005>,
-		 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
-		 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
-		 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
-		 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
-		 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
-		 <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
-		 <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
-		 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
-		 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
-		 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
-		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
-		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
-		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
-		 <&audio_clk_a>, <&cs2000>, <&audio_clk_c>,
-		 <&cpg CPG_CORE R8A77990_CLK_ZA2>;
-
-	rcar_sound,dai {
-		dai0 {
-			playback = <&ssi0>, <&src0>, <&dvc0>;
-			capture  = <&ssi1>, <&src1>, <&dvc1>;
-		};
-	};
-
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
-&sdhi0 {
-	pinctrl-0 = <&sdhi0_pins>;
-	pinctrl-1 = <&sdhi0_pins_uhs>;
-	pinctrl-names = "default", "state_uhs";
-
-	vmmc-supply = <&vcc_sdhi0>;
-	vqmmc-supply = <&vccq_sdhi0>;
-	cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
-	wp-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
-	bus-width = <4>;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	status = "okay";
-};
-
-&sdhi1 {
-	pinctrl-0 = <&sdhi1_pins>;
-	pinctrl-1 = <&sdhi1_pins_uhs>;
-	pinctrl-names = "default", "state_uhs";
-
-	vmmc-supply = <&vcc_sdhi1>;
-	vqmmc-supply = <&vccq_sdhi1>;
-	cd-gpios = <&gpio3 14 GPIO_ACTIVE_LOW>;
-	bus-width = <4>;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	status = "okay";
-};
-
-&sdhi3 {
-	/* used for on-board 8bit eMMC */
-	pinctrl-0 = <&sdhi3_pins>;
-	pinctrl-1 = <&sdhi3_pins>;
-	pinctrl-names = "default", "state_uhs";
-
-	vmmc-supply = <&reg_3p3v>;
-	vqmmc-supply = <&reg_1p8v>;
-	mmc-hs200-1_8v;
-	mmc-hs400-1_8v;
-	bus-width = <8>;
-	no-sd;
-	no-sdio;
-	non-removable;
-	full-pwr-cycle-in-suspend;
-	status = "okay";
-};
-
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
 };
-- 
2.25.1

