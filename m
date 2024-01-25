Return-Path: <linux-renesas-soc+bounces-1815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E3E83C532
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 15:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94DB91F2694D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 14:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBEBA6E2BF;
	Thu, 25 Jan 2024 14:49:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB16E2C7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194152; cv=none; b=eZTn1ptwq1QEdVXLZdx1ZMHSMMKIVv3g1hPV8kc7lg0K7ArnL1K0VICbmLX0NTuMmCbqeCsSCjETlSOQm+r3P8b1e7miGigumhwypdxG7upipwsNDsbe4NhMdvSvDAA/ChXVav972OqneX1IlRkXnDnceleHsMZdRzX4yGxySdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194152; c=relaxed/simple;
	bh=CKQk5CkD+unbncK5fbpFeiyyv7RX7BgGXGrcw5m0mvM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jNL1o7NBjK3kSabAAoSJpEA8+DJhtImgntWRor3338AWfYmLYIv0C5uB549YpRw4TmvOCeTgqU1y11WrQxt0mC2tkWJ1jWAfJn85vmB5h73Jmjl8afDF1V8fyZkWzGJB0zj6HQMo7gPqsVN+rC/2ElKP6TP7fwuYp48HJpRnEck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:bc9e:fcb8:8aa3:5dc0])
	by baptiste.telenet-ops.be with bizsmtp
	id f2p02B00S58agq2012p0lA; Thu, 25 Jan 2024 15:49:01 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT11W-00GUsI-MC;
	Thu, 25 Jan 2024 15:49:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT12K-00FluE-Lg;
	Thu, 25 Jan 2024 15:49:00 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 6/9] arm64: dts: renesas: white-hawk-cpu: Factor out common parts
Date: Thu, 25 Jan 2024 15:48:56 +0100
Message-Id: <50676e7e9ac1c50ab450c030481f60ece4c3947e.1706192990.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706192990.git.geert+renesas@glider.be>
References: <cover.1706192990.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Factor out the parts on the White Hawk CPU board that are also present
on the White Hawk Single board, so they can be reused when introducing
support for the latter.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebase on top of commit fc67495680f60e88 ("arm64: dts: renesas:
    white-hawk-cpu: Fix missing serial console pin control",
  - Split off restoring sort order into its own patch.
---
 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 366 +-----------------
 ...wk-cpu.dtsi => white-hawk-cpu-common.dtsi} |   9 +-
 2 files changed, 4 insertions(+), 371 deletions(-)
 copy arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-cpu.dtsi => white-hawk-cpu-common.dtsi} (97%)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
index 6d53b4006db3c27f..b1fe1aedc27d151d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
@@ -6,373 +6,9 @@
  */
 
 #include "r8a779g0.dtsi"
-
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/leds/common.h>
+#include "white-hawk-cpu-common.dtsi"
 
 / {
 	model = "Renesas White Hawk CPU board";
 	compatible = "renesas,white-hawk-cpu", "renesas,r8a779g0";
-
-	aliases {
-		ethernet0 = &avb0;
-		serial0 = &hscif0;
-	};
-
-	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
-		stdout-path = "serial0:921600n8";
-	};
-
-	sn65dsi86_refclk: clk-x6 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <38400000>;
-	};
-
-	keys {
-		compatible = "gpio-keys";
-
-		pinctrl-0 = <&keys_pins>;
-		pinctrl-names = "default";
-
-		key-1 {
-			gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_1>;
-			label = "SW47";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-
-		key-2 {
-			gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_2>;
-			label = "SW48";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-
-		key-3 {
-			gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_3>;
-			label = "SW49";
-			wakeup-source;
-			debounce-interval = <20>;
-		};
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		led-1 {
-			gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
-			color = <LED_COLOR_ID_GREEN>;
-			function = LED_FUNCTION_INDICATOR;
-			function-enumerator = <1>;
-		};
-
-		led-2 {
-			gpios = <&gpio7 1 GPIO_ACTIVE_HIGH>;
-			color = <LED_COLOR_ID_GREEN>;
-			function = LED_FUNCTION_INDICATOR;
-			function-enumerator = <2>;
-		};
-
-		led-3 {
-			gpios = <&gpio7 2 GPIO_ACTIVE_HIGH>;
-			color = <LED_COLOR_ID_GREEN>;
-			function = LED_FUNCTION_INDICATOR;
-			function-enumerator = <3>;
-		};
-	};
-
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0x0 0x48000000 0x0 0x78000000>;
-	};
-
-	memory@480000000 {
-		device_type = "memory";
-		reg = <0x4 0x80000000 0x0 0x80000000>;
-	};
-
-	memory@600000000 {
-		device_type = "memory";
-		reg = <0x6 0x00000000 0x1 0x00000000>;
-	};
-
-	mini-dp-con {
-		compatible = "dp-connector";
-		label = "CN5";
-		type = "mini";
-
-		port {
-			mini_dp_con_in: endpoint {
-				remote-endpoint = <&sn65dsi86_out>;
-			};
-		};
-	};
-
-	reg_1p2v: regulator-1p2v {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-1.2V";
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <1200000>;
-		regulator-boot-on;
-		regulator-always-on;
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
-};
-
-&avb0 {
-	pinctrl-0 = <&avb0_pins>;
-	pinctrl-names = "default";
-	phy-handle = <&phy0>;
-	tx-internal-delay-ps = <2000>;
-	status = "okay";
-
-	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
-		rxc-skew-ps = <1500>;
-		reg = <0>;
-		interrupt-parent = <&gpio7>;
-		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
-	};
-};
-
-&dsi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			dsi0_out: endpoint {
-				remote-endpoint = <&sn65dsi86_in>;
-				data-lanes = <1 2 3 4>;
-			};
-		};
-	};
-};
-
-&du {
-	status = "okay";
-};
-
-&extal_clk {
-	clock-frequency = <16666666>;
-};
-
-&extalr_clk {
-	clock-frequency = <32768>;
-};
-
-&hscif0 {
-	pinctrl-0 = <&hscif0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&i2c0 {
-	pinctrl-0 = <&i2c0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-	clock-frequency = <400000>;
-
-	io_expander_a: gpio@20 {
-		compatible = "onnn,pca9654";
-		reg = <0x20>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
-
-	eeprom@50 {
-		compatible = "rohm,br24g01", "atmel,24c01";
-		label = "cpu-board";
-		reg = <0x50>;
-		pagesize = <8>;
-	};
-};
-
-&i2c1 {
-	pinctrl-0 = <&i2c1_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-	clock-frequency = <400000>;
-
-	bridge@2c {
-		compatible = "ti,sn65dsi86";
-		reg = <0x2c>;
-
-		clocks = <&sn65dsi86_refclk>;
-		clock-names = "refclk";
-
-		interrupt-parent = <&intc_ex>;
-		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
-
-		enable-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
-
-		vccio-supply = <&reg_1p8v>;
-		vpll-supply = <&reg_1p8v>;
-		vcca-supply = <&reg_1p2v>;
-		vcc-supply = <&reg_1p2v>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				sn65dsi86_in: endpoint {
-					remote-endpoint = <&dsi0_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				sn65dsi86_out: endpoint {
-					remote-endpoint = <&mini_dp_con_in>;
-				};
-			};
-		};
-	};
-};
-
-&mmc0 {
-	pinctrl-0 = <&mmc_pins>;
-	pinctrl-1 = <&mmc_pins>;
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
-&pfc {
-	pinctrl-0 = <&scif_clk_pins>;
-	pinctrl-names = "default";
-
-	avb0_pins: avb0 {
-		mux {
-			groups = "avb0_link", "avb0_mdio", "avb0_rgmii",
-				 "avb0_txcrefclk";
-			function = "avb0";
-		};
-
-		pins_mdio {
-			groups = "avb0_mdio";
-			drive-strength = <21>;
-		};
-
-		pins_mii {
-			groups = "avb0_rgmii";
-			drive-strength = <21>;
-		};
-
-	};
-	hscif0_pins: hscif0 {
-		groups = "hscif0_data";
-		function = "hscif0";
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
-		pins = "GP_5_0", "GP_5_1", "GP_5_2";
-		bias-pull-up;
-	};
-
-	mmc_pins: mmc {
-		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
-		function = "mmc";
-		power-source = <1800>;
-	};
-
-	qspi0_pins: qspi0 {
-		groups = "qspi0_ctrl", "qspi0_data4";
-		function = "qspi0";
-	};
-
-	scif_clk_pins: scif_clk {
-		groups = "scif_clk";
-		function = "scif_clk";
-	};
-};
-
-&rpc {
-	pinctrl-0 = <&qspi0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	flash@0 {
-		compatible = "spansion,s25fs512s", "jedec,spi-nor";
-		reg = <0>;
-		spi-max-frequency = <40000000>;
-		spi-rx-bus-width = <4>;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			boot@0 {
-				reg = <0x0 0x1200000>;
-				read-only;
-			};
-			user@1200000 {
-				reg = <0x1200000 0x2e00000>;
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
-&scif_clk {
-	clock-frequency = <24000000>;
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
similarity index 97%
copy from arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
copy to arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index 6d53b4006db3c27f..8ac17370ff3661c2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -1,20 +1,16 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for the R-Car V4H White Hawk CPU board
+ * Device Tree Source for the common parts shared by the White Hawk CPU and
+ * White Hawk Single boards
  *
  * Copyright (C) 2022 Renesas Electronics Corp.
  */
 
-#include "r8a779g0.dtsi"
-
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 / {
-	model = "Renesas White Hawk CPU board";
-	compatible = "renesas,white-hawk-cpu", "renesas,r8a779g0";
-
 	aliases {
 		ethernet0 = &avb0;
 		serial0 = &hscif0;
@@ -303,6 +299,7 @@ pins_mii {
 		};
 
 	};
+
 	hscif0_pins: hscif0 {
 		groups = "hscif0_data";
 		function = "hscif0";
-- 
2.34.1


