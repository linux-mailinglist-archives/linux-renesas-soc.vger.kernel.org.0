Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FCF220EBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 16:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732051AbgGOOGi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 10:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732039AbgGOOGh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 10:06:37 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B8EC061755;
        Wed, 15 Jul 2020 07:06:37 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id s21so2061311ilk.5;
        Wed, 15 Jul 2020 07:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7pqoZNymsQ5Vs2zZkHtK/CNFao6hfLuCG3IeukQL0Qw=;
        b=tRvjUvNSUkWes15gfH3TmJ+JXEYVuQuvNS92YWzMPiMpIF50VyICp6wjTSdEwsFrCT
         efy1MJ/rMGHFsjd0S8YKR0zTbChsPNokaOWRhEdfGFkg58mCUt9RwrRN2U/ApY7Me5aR
         JU8fnxrcWkBnnnn/Mhcaz4Kko0MvPVZCUycbF1GY0/2vnKA8QDX9jEtrPMX2e8r1JmQ/
         6LnmchwIZ3XyH8Glf28zY0F+cVrdykNjpKbmRILbFSKNfwZoE5neQM9baErqFeJevteq
         9rToTFnIMmJo/W4zvIZ9C4hwYxKBq61gRhaOJaYyr6PvyR+oaF9BeK30Jiu1KOk6nQ72
         ey+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7pqoZNymsQ5Vs2zZkHtK/CNFao6hfLuCG3IeukQL0Qw=;
        b=fEBO1NPtV0jaRVDFVVNa+xn/4Jw24hj25Yf7UXE/b8MVYJCxJSyIwc7/V6jbs1gvlY
         Rlw7zKUI557cZK3HuoEO2tNOXCtFzAwNySfYAHJw1zTA3ZDp8AC4sFVgRnsP/m1KPK+y
         XYlz3RlnSsYvMcYuuYhZcNiq0S5LzM+9D/bK3tbWvyZl3TaZ5oBO54JEV7ErGfWDBF3O
         rG7aRVo6NH3XeonHD66x+cPtK+vkR58uuS1pCtxQM5c2wLfz/obvVJgUSwpvo+YtY+di
         la0pd7M+M50pg4SrUJA4PQRsLebqxp86VCnny71NkUJ5RjXQKSNSCOAvOpFo7ZEAO480
         Lpag==
X-Gm-Message-State: AOAM531GXisJt+AOG3s4gJn2mchnZywCaRMMWld3GESEVLM7RjbcVklO
        HQV86HoFlV3NwRq0ZSYTDvnXVs7O
X-Google-Smtp-Source: ABdhPJydKOlCZd7Bj/Z0ZaaobhSYN82RxsKrHSRjgbtqBWoeX58n8tP/766/wZhy8bLIvD85Pe3Msg==
X-Received: by 2002:a05:6e02:cc4:: with SMTP id c4mr10138289ilj.69.1594821995280;
        Wed, 15 Jul 2020 07:06:35 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id q4sm1132395ils.11.2020.07.15.07.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 07:06:34 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V3] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit
Date:   Wed, 15 Jul 2020 09:06:21 -0500
Message-Id: <20200715140622.1295370-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Beacon EmebeddedWorks, formerly Logic PD is introducing a new
SOM and development kit based on the RZ/G2M SoC from Renesas.

The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
cellular radio.

The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
along with a variety of push buttons and LED's, and support for
a parallel RGB and an LVDS display.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V3:  Updated makefile so the beacon dtb reference is alphabetically in 
     order, made 'vsync-active' in lvds node a valid number, added
     power-supply for the RGB node, and changed the versaclock on the
     baseboard to state 'clock-controller@6a' The SOM cannot be named
     this yet due to how the driver extracts its name.

V2:  Add support for RGB display, second backlight, fix clock references,
     fix Makefile, remove unsupported versaclock features, and fix typos.

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 9b4e7074557c..d7902294faf3 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-beacon-rzg2m-kit.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb
diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
new file mode 100644
index 000000000000..66c9153b3101
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -0,0 +1,758 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020, Compass Electronics Group, LLC
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	backlight_lvds: backlight-lvds {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_lcd>;
+		enable-gpios = <&gpio_exp1 3 GPIO_ACTIVE_LOW>;
+		pwms = <&pwm2 0 50000>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
+
+	backlight_rgb: backlight-rgb {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_lcd>;
+		enable-gpios = <&gpio_exp1 7 GPIO_ACTIVE_LOW>;
+		pwms = <&pwm0 0 50000>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
+
+	hdmi0-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con: endpoint {
+				remote-endpoint = <&rcar_dw_hdmi0_out>;
+			};
+		};
+	};
+
+	keys {
+		compatible = "gpio-keys";
+
+		key-1 {
+			gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_1>;
+			label = "Switch-1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-2 {
+			gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_2>;
+			label = "Switch-2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-3 {
+			gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "Switch-3";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-4 {
+			gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_4>;
+			label = "Switch-4";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-5 {
+			gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_5>;
+			label = "Switch-4";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&led_pins>;
+		pinctrl-names = "default";
+
+		led0 {
+			gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+			label = "LED0";
+			linux,default-trigger = "heartbeat";
+		};
+		led1 {
+			gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
+			label = "LED1";
+		};
+		led2 {
+			gpios = <&gpio7 1 GPIO_ACTIVE_HIGH>;
+			label = "LED2";
+		};
+		led3 {
+			gpios = <&gpio7 3 GPIO_ACTIVE_HIGH>;
+			label = "LED3";
+		};
+	};
+
+	lvds {
+		compatible = "panel-lvds";
+		power-supply = <&reg_lcd_reset>;
+		width-mm = <223>;
+		height-mm = <125>;
+		backlight = <&backlight_lvds>;
+		data-mapping = "vesa-24";
+
+		panel-timing {
+			/* 800x480@60Hz */
+			clock-frequency = <30000000>;
+			hactive = <800>;
+			vactive = <480>;
+			hsync-len = <48>;
+			hfront-porch = <40>;
+			hback-porch = <40>;
+			vfront-porch = <13>;
+			vback-porch = <29>;
+			vsync-len = <3>;
+			hsync-active = <1>;
+			vsync-active = <1>;
+			de-active = <1>;
+			pixelclk-active = <0>;
+		};
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+
+	rgb {
+		/* Different LCD with compatible timings */
+		compatible = "rocktech,rk070er9427";
+		backlight = <&backlight_rgb>;
+		enable-gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_lcd>;
+		port {
+			rgb_panel: endpoint {
+				remote-endpoint = <&du_out_rgb>;
+			};
+		};
+	};
+
+	reg_audio: regulator_audio {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio_exp2 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_lcd: regulator-lcd {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_panel_pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio_exp1 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_lcd_reset: regulator-lcd-reset {
+		compatible = "regulator-fixed";
+		regulator-name = "nLCD_RESET";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio5 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_lcd>;
+	};
+
+	reg_cam0: regulator_camera {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam0";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio_exp2 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_cam1: regulator_camera {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam1";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio_exp2 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <100000>;
+	};
+
+	sound_card {
+		compatible = "audio-graph-card";
+		label = "rcar-sound";
+		dais = <&rsnd_port0>, <&rsnd_port1>;
+	};
+
+	vccq_sdhi0: regulator-vccq-sdhi0 {
+		compatible = "regulator-gpio";
+
+		regulator-name = "SDHI0 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&gpio6 30 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 1>, <1800000 0>;
+		regulator-always-on;
+	};
+
+	/* External DU dot clocks */
+	x302_clk: x302-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <33000000>;
+	};
+
+	x304_clk: x304-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&audio_clk_a {
+	clock-frequency = <24576000>;
+	assigned-clocks = <&versaclock6_bb 4>;
+	assigned-clock-rates = <24576000>;
+};
+
+&audio_clk_b {
+	clock-frequency = <22579200>;
+};
+
+&can0 {
+	pinctrl-0 = <&can0_pins>;
+	pinctrl-names = "default";
+	renesas,can-clock-select = <0x0>;
+	status = "okay";
+};
+
+&can1 {
+	pinctrl-0 = <&can1_pins>;
+	pinctrl-names = "default";
+	renesas,can-clock-select = <0x0>;
+	status = "okay";
+};
+
+&du {
+	pinctrl-0 = <&du_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	clocks = <&cpg CPG_MOD 724>,
+		<&cpg CPG_MOD 723>,
+		<&cpg CPG_MOD 722>,
+		<&versaclock5 1>,
+		<&x302_clk>,
+		<&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.2",
+		"dclkin.0", "dclkin.1", "dclkin.2";
+};
+
+&du_out_rgb {
+	remote-endpoint = <&rgb_panel>;
+};
+
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
+};
+
+&ehci1 {
+	status = "okay";
+	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
+};
+
+&hdmi0 {
+	status = "okay";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			dw_hdmi0_in: endpoint {
+				remote-endpoint = <&du_out_hdmi0>;
+			};
+		};
+		port@1 {
+			reg = <1>;
+			rcar_dw_hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi0_con>;
+			};
+		};
+		port@2 {
+			reg = <2>;
+			dw_hdmi0_snd_in: endpoint {
+				remote-endpoint = <&rsnd_endpoint1>;
+			};
+		};
+	};
+};
+
+&hscif1 {
+	pinctrl-0 = <&hscif1_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	gpio_exp2: gpio@21 {
+		compatible = "onnn,pca9654";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio_exp3: gpio@22 {
+		compatible = "onnn,pca9654";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio_exp4: gpio@23 {
+		compatible = "onnn,pca9654";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	versaclock6_bb: clock-controller@6a {
+		compatible = "idt,5p49v6965";
+		reg = <0x6a>;
+		#clock-cells = <1>;
+		clocks = <&x304_clk>;
+		clock-names = "xin";
+		/* CSI0_MCLK, CSI1_MCLK, AUDIO_CLKIN, USB_HUB_MCLK_BB */
+		assigned-clocks = <&versaclock6_bb 1>,
+				   <&versaclock6_bb 2>,
+				   <&versaclock6_bb 3>,
+				   <&versaclock6_bb 4>;
+		assigned-clock-rates =	<24000000>, <24000000>, <24000000>, <24576000>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+};
+
+&i2c5 {
+	status = "okay";
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c5_pins>;
+	pinctrl-names = "default";
+
+	codec: wm8962@1a {
+		compatible = "wlf,wm8962";
+		reg = <0x1a>;
+		DCVDD-supply = <&reg_audio>;
+		DBVDD-supply = <&reg_audio>;
+		AVDD-supply = <&reg_audio>;
+		CPVDD-supply = <&reg_audio>;
+		MICVDD-supply = <&reg_audio>;
+		PLLVDD-supply = <&reg_audio>;
+		SPKVDD1-supply = <&reg_audio>;
+		SPKVDD2-supply = <&reg_audio>;
+		gpio-cfg = <
+			0x0000 /* 0:Default */
+			0x0000 /* 1:Default */
+			0x0000 /* 2:Default */
+			0x0000 /* 3:Default */
+			0x0000 /* 4:Default */
+			0x0000 /* 5:Default */
+		>;
+		port {
+			wm8962_endpoint: endpoint {
+				remote-endpoint = <&rsnd_endpoint0>;
+			};
+		};
+	};
+
+	/* 0 - lcd_reset */
+	/* 1 - lcd_pwr */
+	/* 2 - lcd_select */
+	/* 3 - backlight-enable */
+	/* 4 - Touch_shdwn */
+	/* 5 - LCD_H_pol */
+	/* 6 - lcd_V_pol */
+	gpio_exp1: gpio@20 {
+		compatible = "onnn,pca9654";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen@26 {
+		compatible = "ilitek,ili2117";
+		reg = <0x26>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <9 IRQ_TYPE_EDGE_RISING>;
+		wakeup-source;
+	};
+
+	hd3ss3220@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+					hd3ss3220_ep: endpoint {
+						remote-endpoint = <&usb3_role_switch>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&lvds0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&pciec0 {
+	status = "okay";
+};
+
+&pciec1 {
+	status = "okay";
+};
+
+&pcie_bus_clk {
+	clock-frequency = <100000000>;
+};
+
+&pfc {
+	can0_pins: can0 {
+		groups = "can0_data_a";
+		function = "can0";
+	};
+
+	can1_pins: can1 {
+		groups = "can1_data";
+		function = "can1";
+	};
+
+	du_pins: du {
+		groups = "du_rgb888", "du_sync", "du_clk_out_1", "du_disp";
+		function = "du";
+	};
+
+	i2c2_pins: i2c2 {
+		groups = "i2c2_a";
+		function = "i2c2";
+	};
+
+	i2c5_pins: i2c5 {
+		groups = "i2c5";
+		function = "i2c5";
+	};
+
+	led_pins: leds {
+		/* GP_0_4 , AVS1, AVS2, GP_7_3 */
+		pins = "GP_0_4", "GP_7_0", "GP_7_1", "GP_7_3";
+		bias-pull-down;
+	};
+
+	pwm0_pins: pwm0 {
+		groups = "pwm0";
+		function = "pwm0";
+	};
+
+	pwm2_pins: pwm2 {
+		groups = "pwm2_a";
+		function = "pwm2_a";
+	};
+
+	sdhi0_pins: sd0 {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+		power-source = <3300>;
+	};
+
+	sdhi0_pins_uhs: sd0_uhs {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+		power-source = <1800>;
+	};
+
+	sound_pins: sound {
+		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a";
+		function = "ssi";
+	};
+
+	sound_clk_pins: sound_clk {
+		groups = "audio_clk_a_a";
+		function = "audio_clk";
+	};
+
+	usb0_pins: usb0 {
+		mux {
+			groups = "usb0";
+			function = "usb0";
+		};
+	};
+
+	usb1_pins: usb1 {
+		mux {
+			groups = "usb1";
+			function = "usb1";
+		};
+	};
+
+	usb30_pins: usb30 {
+		mux {
+			groups = "usb30";
+			function = "usb30";
+		};
+	};
+};
+
+&pwm0 {
+	pinctrl-0 = <&pwm0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-0 = <&pwm2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&rcar_sound {
+	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-names = "default";
+
+	/* Single DAI */
+	#sound-dai-cells = <0>;
+
+	/* audio_clkout0/1/2/3 */
+	#clock-cells = <1>;
+	clock-frequency = <11289600>;
+
+	status = "okay";
+
+	clocks = <&cpg CPG_MOD 1005>,
+		 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
+		 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
+		 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
+		 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
+		 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
+		 <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
+		 <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
+		 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
+		 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
+		 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+		 <&audio_clk_a>, <&audio_clk_b>, <&audio_clk_c>,
+		 <&cpg CPG_CORE R8A774A1_CLK_S0D4>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		rsnd_port0: port@0 {
+			reg = <0>;
+			rsnd_endpoint0: endpoint {
+				remote-endpoint = <&wm8962_endpoint>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint0>;
+				frame-master = <&rsnd_endpoint0>;
+
+				playback = <&ssi1 &dvc1 &src1>;
+				capture = <&ssi0>;
+			};
+		};
+		rsnd_port1: port@1 {
+		    reg = <0x01>;
+			rsnd_endpoint1: endpoint {
+				remote-endpoint = <&dw_hdmi0_snd_in>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint1>;
+				frame-master = <&rsnd_endpoint1>;
+
+				playback = <&ssi2>;
+			};
+		};
+	};
+};
+
+&rwdt {
+	status = "okay";
+	timeout-sec = <60>;
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif5 {
+	pinctrl-0 = <&scif5_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <14745600>;
+};
+
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-1 = <&sdhi0_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vccq_sdhi0>;
+	cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&ssi1 {
+	shared-pin;
+};
+
+&tmu0 {
+	status = "okay";
+};
+
+&tmu1 {
+	status = "okay";
+};
+
+&tmu2 {
+	status = "okay";
+};
+
+&tmu3 {
+	status = "okay";
+};
+
+&tmu4 {
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb3_peri0 {
+	companion = <&xhci0>;
+	status = "okay";
+	usb-role-switch;
+
+	port {
+		usb3_role_switch: endpoint {
+			remote-endpoint = <&hd3ss3220_ep>;
+		};
+	};
+};
+
+&usb3_phy0 {
+	status = "okay";
+};
+
+&vin0 {
+	status = "okay";
+};
+&vin1 {
+	status = "okay";
+};
+&vin2 {
+	status = "okay";
+};
+&vin3 {
+	status = "okay";
+};
+&vin4 {
+	status = "okay";
+};
+&vin5 {
+	status = "okay";
+};
+&vin6 {
+	status = "okay";
+};
+&vin7 {
+	status = "okay";
+};
+
+&xhci0
+{
+	pinctrl-0 = <&usb30_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
new file mode 100644
index 000000000000..97272f5fa0ab
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -0,0 +1,312 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020, Compass Electronics Group, LLC
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x80000000>;
+	};
+
+	osc_32k: osc_32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "osc_32k";
+	};
+
+	reg_1p8v: regulator0 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator1 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	wlan_pwrseq: wlan_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pca9654 1 GPIO_ACTIVE_LOW>;
+		clocks = <&osc_32k>;
+		clock-names = "ext_clock";
+		post-power-on-delay-ms = <80>;
+	};
+};
+
+&avb {
+	pinctrl-0 = <&avb_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <16666666>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&gpio6 {
+	usb_hub_reset {
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "usb-hub-reset";
+	};
+};
+
+&hscif0 {
+	pinctrl-0 = <&hscif0_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+	max-speed = <4000000>;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&pca9654 2 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&pca9654 5 GPIO_ACTIVE_HIGH>;
+		clocks = <&osc_32k>;
+		clock-names = "extclk";
+	};
+};
+
+&hscif2 {
+	status = "okay";
+	pinctrl-0 = <&hscif2_pins>;
+	pinctrl-names = "default";
+};
+
+&i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	pca9654: gpio@20 {
+		compatible = "onnn,pca9654";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"i2c4_20_0",
+			"wl_reg_on",
+			"bt_reg_on",
+			"i2c4_20_3",
+			"i2c4_20_4",
+			"bt_dev_wake",
+			"i2c4_20_6",
+			"i2c4_20_7";
+	};
+
+	pca9654_lte: gpio@21 {
+		compatible = "onnn,pca9654";
+		reg = <0x21>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"i2c4_21_0",
+			"zoe_pwr_on",
+			"zoe_extint",
+			"zoe_reset_n",
+			"sara_reset",
+			"i2c4_21_5",
+			"sara_pwr_off",
+			"sara_networking_status";
+	};
+
+	eeprom@50 {
+		compatible = "microchip,at24c64", "atmel,24c64";
+		pagesize = <32>;
+		read-only;	/* Manufacturing EEPROM programmed at factory */
+		reg = <0x50>;
+	};
+
+	rtc@51 {
+		compatible = "nxp,pcf85263";
+		reg = <0x51>;
+	};
+
+	versaclock5: versaclock_som@6a {
+		compatible = "idt,5p49v6965";
+		reg = <0x6a>;
+		#clock-cells = <1>;
+		clocks = <&x304_clk>;
+		clock-names = "xin";
+		/* du_dotclkin0, du_dotclkin2, usb_extal, avb_txcrefclk */
+		assigned-clocks = <&versaclock5 1>,
+				   <&versaclock5 2>,
+				   <&versaclock5 3>,
+				   <&versaclock5 4>;
+		assigned-clock-rates = <33333333>, <33333333>, <50000000>, <125000000>;
+	};
+};
+
+&pfc {
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
+	avb_pins: avb {
+		mux {
+			groups = "avb_link", "avb_mdio", "avb_mii";
+			function = "avb";
+		};
+
+		pins_mdio {
+			groups = "avb_mdio";
+			drive-strength = <24>;
+		};
+
+		pins_mii_tx {
+			pins = "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN_AVB_TD0",
+			       "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_TD3";
+			drive-strength = <12>;
+		};
+	};
+
+	scif2_pins: scif2 {
+		groups = "scif2_data_a";
+		function = "scif2";
+	};
+
+	hscif0_pins: hscif0 {
+		groups = "hscif0_data", "hscif0_ctrl";
+		function = "hscif0";
+	};
+
+	hscif1_pins: hscif1 {
+		groups = "hscif1_data_a", "hscif1_ctrl_a";
+		function = "hscif1";
+	};
+
+	hscif2_pins: hscif2 {
+		groups = "hscif2_data_a";
+		function = "hscif2";
+	};
+
+	scif0_pins: scif0 {
+		groups = "scif0_data";
+		function = "scif0";
+	};
+
+	scif5_pins: scif5 {
+		groups = "scif5_data_a";
+		function = "scif5";
+	};
+
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk_a";
+		function = "scif_clk";
+	};
+
+	i2c0_pins: i2c0 {
+		groups = "i2c0";
+		function = "i2c0";
+	};
+
+	sdhi2_pins: sd2 {
+		groups = "sdhi2_data4", "sdhi2_ctrl";
+		function = "sdhi2";
+		power-source = <1800>;
+	};
+
+	sdhi3_pins: sd3 {
+		groups = "sdhi3_data8", "sdhi3_ctrl", "sdhi3_ds";
+		function = "sdhi3";
+		power-source = <1800>;
+	};
+};
+
+&scif_clk {
+	clock-frequency = <14745600>;
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdhi2_pins>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	non-removable;
+	cap-power-off-card;
+	pm-ignore-notify;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&wlan_pwrseq>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	brcmf: bcrmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&gpio1>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "host-wake";
+	};
+};
+
+&sdhi3 {
+	pinctrl-0 = <&sdhi3_pins>;
+	pinctrl-1 = <&sdhi3_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	non-removable;
+	fixed-emmc-driver-type = <1>;
+	status = "okay";
+};
+
+&usb_extal_clk {
+	clock-frequency = <50000000>;
+};
+
+&usb3s0_clk {
+	clock-frequency = <100000000>;
+};
+
+&vspb {
+	status = "okay";
+};
+
+&vspi0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts b/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
new file mode 100644
index 000000000000..2c5b057c30c6
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020, Compass Electronics Group, LLC
+ */
+
+/dts-v1/;
+
+#include "r8a774a1.dtsi"
+#include "beacon-renesom-som.dtsi"
+#include "beacon-renesom-baseboard.dtsi"
+
+/ {
+	model = "Beacon EmbeddedWorks RZ/G2M Development Kit";
+	compatible = "beacon,beacon-rzg2m", "renesas,r8a774a1";
+
+	aliases {
+		serial0 = &scif2;
+		serial1 = &hscif0;
+		serial2 = &hscif1;
+		serial3 = &scif0;
+		serial4 = &hscif2;
+		serial5 = &scif5;
+		ethernet0 = &avb;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
-- 
2.25.1

