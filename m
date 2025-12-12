Return-Path: <linux-renesas-soc+bounces-25722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15528CB9C90
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 21:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA39E30BC1C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 20:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59942D47E4;
	Fri, 12 Dec 2025 20:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RubSmOG+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899CF2C1595;
	Fri, 12 Dec 2025 20:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571586; cv=none; b=nJn82c3kKEcZb0JnujLq7mXiO5NsAtETDsdY69cI9fGly7xhOvZByyUsiSAWo5aIii4vADO9iGc1rPGLYGpYZ5wyLJZpJYkDklQKR6x3ir9bbbyeIvJ1fjvvSZ+KCZ5WlHgqRMKGSNHfcvXzvSfEtYaCXe/TlE7pd+MOH9ouxf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571586; c=relaxed/simple;
	bh=+xNZhb7cU1kSoX1/uAcRkBnFYKCUvz1KDDi/hO8ttg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WFMMKFypB130COs7IbUO2Nwgwv6KW5P5bQ2e7uyetzqrc8Er2uiQKc99j5/UikYGrHrKJ2rmnnXrqYs8ZGZYtrwPERIJtdADl4XqqgUdwWim9kYKB0Ulka1WIEvMt4UkgQH6f9WRjFQTNcExW/DkmqxeTGXSvFSnffToUE/mMuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RubSmOG+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64A7C16AAE;
	Fri, 12 Dec 2025 20:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765571586;
	bh=+xNZhb7cU1kSoX1/uAcRkBnFYKCUvz1KDDi/hO8ttg8=;
	h=From:To:Cc:Subject:Date:From;
	b=RubSmOG+WBJEQ/VPzF7/K9o0EhEKE1mBBAEgTcxRno2DcEqkdVBcIQaEmiZ65E8Ze
	 KWfKXldItAK3kQPsop+oTPFJa4lJRAvFN7UQ+oByMrOufACu/ioArTsSXY4MDgmmE4
	 6p5pUyBL3Tb1qe1mtH961RdqDsxoxtH5jbTxkYOaVqdkWu9TI9YDlBHHXPixxf5y8K
	 pQDpv50DcHOWGGXqoLYjIZf7w1D6ZcsO7wxOoCwH/ByA8QXKFWtUaoNtKeYMOWM87R
	 Zyt/NJSC/obib4C8EM+oKYt2jG78ZhKpAOeLoOsLr31dl/ZI9do3zlGxaDy9f2AOAR
	 SIgNnjj9dw39w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: intel: Drop pxa2xx
Date: Fri, 12 Dec 2025 14:32:10 -0600
Message-ID: <20251212203226.458694-4-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These .dtsi files are not included anywhere in the tree and can't be
tested. They have not been touched since 2018 other than clean-ups.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/intel/pxa/pxa25x.dtsi       | 118 -----------
 arch/arm/boot/dts/intel/pxa/pxa27x.dtsi       | 188 ------------------
 arch/arm/boot/dts/marvell/armada-380.dtsi     | 148 --------------
 arch/arm64/boot/dts/marvell/armada-7020.dtsi  |  10 -
 arch/arm64/boot/dts/marvell/armada-8020.dtsi  |  20 --
 .../boot/dts/marvell/armada-ap806-dual.dtsi   |  60 ------
 .../dts/marvell/cn9130-db-comexpress.dtsi     |  96 ---------
 7 files changed, 640 deletions(-)
 delete mode 100644 arch/arm/boot/dts/intel/pxa/pxa25x.dtsi
 delete mode 100644 arch/arm/boot/dts/intel/pxa/pxa27x.dtsi
 delete mode 100644 arch/arm/boot/dts/marvell/armada-380.dtsi
 delete mode 100644 arch/arm64/boot/dts/marvell/armada-7020.dtsi
 delete mode 100644 arch/arm64/boot/dts/marvell/armada-8020.dtsi
 delete mode 100644 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi
 delete mode 100644 arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi

diff --git a/arch/arm/boot/dts/intel/pxa/pxa25x.dtsi b/arch/arm/boot/dts/intel/pxa/pxa25x.dtsi
deleted file mode 100644
index 5f8300e356ad..000000000000
--- a/arch/arm/boot/dts/intel/pxa/pxa25x.dtsi
+++ /dev/null
@@ -1,118 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2016 Robert Jarzmik <robert.jarzmik@free.fr>
- */
-#include "pxa2xx.dtsi"
-#include "dt-bindings/clock/pxa-clock.h"
-
-/ {
-	model = "Marvell PXA25x family SoC";
-	compatible = "marvell,pxa250";
-
-	clocks {
-	       /*
-		* The muxing of external clocks/internal dividers for osc* clock
-		* sources has been hidden under the carpet by now.
-		*/
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		clks: pxa2xx_clks@41300004 {
-			compatible = "marvell,pxa250-core-clocks";
-			#clock-cells = <1>;
-			status = "okay";
-		};
-
-		/* timer oscillator */
-		clktimer: oscillator {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency  = <3686400>;
-			clock-output-names = "ostimer";
-		};
-	};
-
-	pxabus {
-		pdma: dma-controller@40000000 {
-			compatible = "marvell,pdma-1.0";
-			reg = <0x40000000 0x10000>;
-			interrupts = <25>;
-			#dma-cells = <2>;
-			/* For backwards compatibility: */
-			#dma-channels = <16>;
-			dma-channels = <16>;
-			#dma-requests = <40>;
-			dma-requests = <40>;
-			status = "okay";
-		};
-
-		pxairq: interrupt-controller@40d00000 {
-			marvell,intc-priority;
-			marvell,intc-nr-irqs = <32>;
-		};
-
-		pinctrl: pinctrl@40e00000 {
-			reg = <0x40e00054 0x20 0x40e0000c 0xc 0x40e0010c 4
-			       0x40f00020 0x10>;
-			compatible = "marvell,pxa25x-pinctrl";
-		};
-
-		gpio: gpio@40e00000 {
-			compatible = "intel,pxa25x-gpio";
-			gpio-ranges = <&pinctrl 0 0 84>;
-			clocks = <&clks CLK_NONE>;
-		};
-
-		pwm0: pwm@40b00000 {
-			compatible = "marvell,pxa250-pwm";
-			reg = <0x40b00000 0x10>;
-			#pwm-cells = <1>;
-			clocks = <&clks CLK_PWM0>;
-		};
-
-		pwm1: pwm@40b00010 {
-			compatible = "marvell,pxa250-pwm";
-			reg = <0x40b00010 0x10>;
-			#pwm-cells = <1>;
-			clocks = <&clks CLK_PWM1>;
-		};
-
-		rtc@40900000 {
-			clocks = <&clks CLK_OSC32k768>;
-		};
-	};
-
-	timer@40a00000 {
-		compatible = "marvell,pxa-timer";
-		reg = <0x40a00000 0x20>;
-		interrupts = <26>;
-		clocks = <&clktimer>;
-		status = "okay";
-	};
-
-	pxa250_opp_table: opp_table0 {
-		compatible = "operating-points-v2";
-
-		opp-99532800 {
-			opp-hz = /bits/ 64 <99532800>;
-			opp-microvolt = <1000000 950000 1650000>;
-			clock-latency-ns = <20>;
-		};
-		opp-199065600 {
-			opp-hz = /bits/ 64 <199065600>;
-			opp-microvolt = <1000000 950000 1650000>;
-			clock-latency-ns = <20>;
-		};
-		opp-298598400 {
-			opp-hz = /bits/ 64 <298598400>;
-			opp-microvolt = <1100000 1045000 1650000>;
-			clock-latency-ns = <20>;
-		};
-		opp-398131200 {
-			opp-hz = /bits/ 64 <398131200>;
-			opp-microvolt = <1300000 1235000 1650000>;
-			clock-latency-ns = <20>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/intel/pxa/pxa27x.dtsi b/arch/arm/boot/dts/intel/pxa/pxa27x.dtsi
deleted file mode 100644
index a2cbfb3be609..000000000000
--- a/arch/arm/boot/dts/intel/pxa/pxa27x.dtsi
+++ /dev/null
@@ -1,188 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* The pxa3xx skeleton simply augments the 2xx version */
-#include "pxa2xx.dtsi"
-#include "dt-bindings/clock/pxa-clock.h"
-
-/ {
-	model = "Marvell PXA27x familiy SoC";
-	compatible = "marvell,pxa27x";
-
-	pxabus {
-		pdma: dma-controller@40000000 {
-			compatible = "marvell,pdma-1.0";
-			reg = <0x40000000 0x10000>;
-			interrupts = <25>;
-			#dma-cells = <2>;
-			/* For backwards compatibility: */
-			#dma-channels = <32>;
-			dma-channels = <32>;
-			#dma-requests = <75>;
-			dma-requests = <75>;
-			status = "okay";
-		};
-
-		pxairq: interrupt-controller@40d00000 {
-			marvell,intc-priority;
-			marvell,intc-nr-irqs = <34>;
-		};
-
-		pinctrl: pinctrl@40e00000 {
-			reg = <0x40e00054 0x20 0x40e0000c 0xc 0x40e0010c 4
-			       0x40f00020 0x10>;
-			compatible = "marvell,pxa27x-pinctrl";
-		};
-
-		gpio: gpio@40e00000 {
-			compatible = "intel,pxa27x-gpio";
-			gpio-ranges = <&pinctrl 0 0 128>;
-			clocks = <&clks CLK_NONE>;
-		};
-
-		usb0: usb@4c000000 {
-			compatible = "marvell,pxa-ohci";
-			reg = <0x4c000000 0x10000>;
-			interrupts = <3>;
-			clocks = <&clks CLK_USBHOST>;
-			status = "disabled";
-		};
-
-		pwm0: pwm@40b00000 {
-			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
-			reg = <0x40b00000 0x10>;
-			#pwm-cells = <1>;
-			clocks = <&clks CLK_PWM0>;
-		};
-
-		pwm1: pwm@40b00010 {
-			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
-			reg = <0x40b00010 0x10>;
-			#pwm-cells = <1>;
-			clocks = <&clks CLK_PWM1>;
-		};
-
-		pwm2: pwm@40c00000 {
-			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
-			reg = <0x40c00000 0x10>;
-			#pwm-cells = <1>;
-			clocks = <&clks CLK_PWM0>;
-		};
-
-		pwm3: pwm@40c00010 {
-			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
-			reg = <0x40c00010 0x10>;
-			#pwm-cells = <1>;
-			clocks = <&clks CLK_PWM1>;
-		};
-
-		pwri2c: i2c@40f00180 {
-			compatible = "mrvl,pxa-i2c";
-			reg = <0x40f00180 0x24>;
-			interrupts = <6>;
-			clocks = <&clks CLK_PWRI2C>;
-			#address-cells = <0x1>;
-			#size-cells = <0>;
-			status = "disabled";
-		};
-
-		pxa27x_udc: udc@40600000 {
-			compatible = "marvell,pxa270-udc";
-			reg = <0x40600000 0x10000>;
-			interrupts = <11>;
-			clocks = <&clks CLK_USB>;
-			status = "disabled";
-		};
-
-		keypad: keypad@41500000 {
-			compatible = "marvell,pxa27x-keypad";
-			reg = <0x41500000 0x4c>;
-			interrupts = <4>;
-			clocks = <&clks CLK_KEYPAD>;
-			status = "disabled";
-		};
-
-		pxa_camera: imaging@50000000 {
-			compatible = "marvell,pxa270-qci";
-			reg = <0x50000000 0x1000>;
-			interrupts = <33>;
-			dmas = <&pdma 68 0	/* Y channel */
-				&pdma 69 0	/* U channel */
-				&pdma 70 0>;	/* V channel */
-			dma-names = "CI_Y", "CI_U", "CI_V";
-
-			clocks = <&clks CLK_CAMERA>;
-			clock-names = "ciclk";
-			clock-frequency = <5000000>;
-			clock-output-names = "qci_mclk";
-
-			status = "disabled";
-		};
-
-		rtc@40900000 {
-			clocks = <&clks CLK_OSC32k768>;
-		};
-	};
-
-	clocks {
-	       /*
-		* The muxing of external clocks/internal dividers for osc* clock
-		* sources has been hidden under the carpet by now.
-		*/
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		clks: pxa2xx_clks@41300004 {
-			compatible = "marvell,pxa270-clocks";
-			#clock-cells = <1>;
-			status = "okay";
-		};
-	};
-
-	timer@40a00000 {
-		compatible = "marvell,pxa-timer";
-		reg = <0x40a00000 0x20>;
-		interrupts = <26>;
-		clocks = <&clks CLK_OSTIMER>;
-		status = "okay";
-	};
-
-	pxa270_opp_table: opp_table0 {
-		compatible = "operating-points-v2";
-
-		opp-104000000 {
-			opp-hz = /bits/ 64 <104000000>;
-			opp-microvolt = <900000 900000 1705000>;
-			clock-latency-ns = <20>;
-		};
-		opp-156000000 {
-			opp-hz = /bits/ 64 <156000000>;
-			opp-microvolt = <1000000 1000000 1705000>;
-			clock-latency-ns = <20>;
-		};
-		opp-208000000 {
-			opp-hz = /bits/ 64 <208000000>;
-			opp-microvolt = <1180000 1180000 1705000>;
-			clock-latency-ns = <20>;
-		};
-		opp-312000000 {
-			opp-hz = /bits/ 64 <312000000>;
-			opp-microvolt = <1250000 1250000 1705000>;
-			clock-latency-ns = <20>;
-		};
-		opp-416000000 {
-			opp-hz = /bits/ 64 <416000000>;
-			opp-microvolt = <1350000 1350000 1705000>;
-			clock-latency-ns = <20>;
-		};
-		opp-520000000 {
-			opp-hz = /bits/ 64 <520000000>;
-			opp-microvolt = <1450000 1450000 1705000>;
-			clock-latency-ns = <20>;
-		};
-		opp-624000000 {
-			opp-hz = /bits/ 64 <624000000>;
-			opp-microvolt = <1550000 1550000 1705000>;
-			clock-latency-ns = <20>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/marvell/armada-380.dtsi b/arch/arm/boot/dts/marvell/armada-380.dtsi
deleted file mode 100644
index e94f22b0e9b5..000000000000
--- a/arch/arm/boot/dts/marvell/armada-380.dtsi
+++ /dev/null
@@ -1,148 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Device Tree Include file for Marvell Armada 380 SoC.
- *
- * Copyright (C) 2014 Marvell
- *
- * Lior Amsalem <alior@marvell.com>
- * Gregory CLEMENT <gregory.clement@free-electrons.com>
- * Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
- */
-
-#include "armada-38x.dtsi"
-
-/ {
-	model = "Marvell Armada 380 family SoC";
-	compatible = "marvell,armada380";
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		enable-method = "marvell,armada-380-smp";
-
-		cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a9";
-			reg = <0>;
-		};
-	};
-
-	soc {
-		internal-regs {
-			pinctrl@18000 {
-				compatible = "marvell,mv88f6810-pinctrl";
-			};
-		};
-
-		pcie {
-			compatible = "marvell,armada-370-pcie";
-			status = "disabled";
-			device_type = "pci";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-
-			msi-parent = <&mpic>;
-			bus-range = <0x00 0xff>;
-
-			ranges =
-			       <0x82000000 0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x00002000
-				0x82000000 0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x00002000
-				0x82000000 0 0x44000 MBUS_ID(0xf0, 0x01) 0x44000 0 0x00002000
-				0x82000000 0 0x48000 MBUS_ID(0xf0, 0x01) 0x48000 0 0x00002000
-				0x82000000 0x1 0     MBUS_ID(0x08, 0xe8) 0 1 0 /* Port 0 MEM */
-				0x81000000 0x1 0     MBUS_ID(0x08, 0xe0) 0 1 0 /* Port 0 IO  */
-				0x82000000 0x2 0     MBUS_ID(0x04, 0xe8) 0 1 0 /* Port 1 MEM */
-				0x81000000 0x2 0     MBUS_ID(0x04, 0xe0) 0 1 0 /* Port 1 IO  */
-				0x82000000 0x3 0     MBUS_ID(0x04, 0xd8) 0 1 0 /* Port 2 MEM */
-				0x81000000 0x3 0     MBUS_ID(0x04, 0xd0) 0 1 0 /* Port 2 IO  */>;
-
-			/* x1 port */
-			pcie@1,0 {
-				device_type = "pci";
-				assigned-addresses = <0x82000800 0 0x80000 0 0x2000>;
-				reg = <0x0800 0 0 0 0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				interrupt-names = "intx";
-				interrupts-extended = <&gic GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-				#interrupt-cells = <1>;
-				ranges = <0x82000000 0 0 0x82000000 0x1 0 1 0
-					  0x81000000 0 0 0x81000000 0x1 0 1 0>;
-				bus-range = <0x00 0xff>;
-				interrupt-map-mask = <0 0 0 7>;
-				interrupt-map = <0 0 0 1 &pcie1_intc 0>,
-						<0 0 0 2 &pcie1_intc 1>,
-						<0 0 0 3 &pcie1_intc 2>,
-						<0 0 0 4 &pcie1_intc 3>;
-				marvell,pcie-port = <0>;
-				marvell,pcie-lane = <0>;
-				clocks = <&gateclk 8>;
-				status = "disabled";
-
-				pcie1_intc: interrupt-controller {
-					interrupt-controller;
-					#interrupt-cells = <1>;
-				};
-			};
-
-			/* x1 port */
-			pcie@2,0 {
-				device_type = "pci";
-				assigned-addresses = <0x82001000 0 0x40000 0 0x2000>;
-				reg = <0x1000 0 0 0 0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				interrupt-names = "intx";
-				interrupts-extended = <&gic GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
-				#interrupt-cells = <1>;
-				ranges = <0x82000000 0 0 0x82000000 0x2 0 1 0
-					  0x81000000 0 0 0x81000000 0x2 0 1 0>;
-				bus-range = <0x00 0xff>;
-				interrupt-map-mask = <0 0 0 7>;
-				interrupt-map = <0 0 0 1 &pcie2_intc 0>,
-						<0 0 0 2 &pcie2_intc 1>,
-						<0 0 0 3 &pcie2_intc 2>,
-						<0 0 0 4 &pcie2_intc 3>;
-				marvell,pcie-port = <1>;
-				marvell,pcie-lane = <0>;
-				clocks = <&gateclk 5>;
-				status = "disabled";
-
-				pcie2_intc: interrupt-controller {
-					interrupt-controller;
-					#interrupt-cells = <1>;
-				};
-			};
-
-			/* x1 port */
-			pcie@3,0 {
-				device_type = "pci";
-				assigned-addresses = <0x82001800 0 0x44000 0 0x2000>;
-				reg = <0x1800 0 0 0 0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				interrupt-names = "intx";
-				interrupts-extended = <&gic GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-				#interrupt-cells = <1>;
-				ranges = <0x82000000 0 0 0x82000000 0x3 0 1 0
-					  0x81000000 0 0 0x81000000 0x3 0 1 0>;
-				bus-range = <0x00 0xff>;
-				interrupt-map-mask = <0 0 0 7>;
-				interrupt-map = <0 0 0 1 &pcie3_intc 0>,
-						<0 0 0 2 &pcie3_intc 1>,
-						<0 0 0 3 &pcie3_intc 2>,
-						<0 0 0 4 &pcie3_intc 3>;
-				marvell,pcie-port = <2>;
-				marvell,pcie-lane = <0>;
-				clocks = <&gateclk 6>;
-				status = "disabled";
-
-				pcie3_intc: interrupt-controller {
-					interrupt-controller;
-					#interrupt-cells = <1>;
-				};
-			};
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/marvell/armada-7020.dtsi b/arch/arm64/boot/dts/marvell/armada-7020.dtsi
deleted file mode 100644
index 570f901b4f4a..000000000000
--- a/arch/arm64/boot/dts/marvell/armada-7020.dtsi
+++ /dev/null
@@ -1,10 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Copyright (C) 2016 Marvell Technology Group Ltd.
- *
- * Device Tree file for the Armada 7020 SoC, made of an AP806 Dual and
- * one CP110.
- */
-
-#include "armada-ap806-dual.dtsi"
-#include "armada-70x0.dtsi"
diff --git a/arch/arm64/boot/dts/marvell/armada-8020.dtsi b/arch/arm64/boot/dts/marvell/armada-8020.dtsi
deleted file mode 100644
index b6fc18876093..000000000000
--- a/arch/arm64/boot/dts/marvell/armada-8020.dtsi
+++ /dev/null
@@ -1,20 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Copyright (C) 2016 Marvell Technology Group Ltd.
- *
- * Device Tree file for the Armada 8020 SoC, made of an AP806 Dual and
- * two CP110.
- */
-
-#include "armada-ap806-dual.dtsi"
-#include "armada-80x0.dtsi"
-
-/* The RTC requires external oscillator. But on Aramda 80x0, the RTC clock
- * in CP master is not connected (by package) to the oscillator. So
- * disable it. However, the RTC clock in CP slave is connected to the
- * oscillator so this one is let enabled.
- */
-
-&cp0_rtc {
-	status = "disabled";
-};
diff --git a/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi
deleted file mode 100644
index 82f4dedfc25e..000000000000
--- a/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi
+++ /dev/null
@@ -1,60 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Copyright (C) 2016 Marvell Technology Group Ltd.
- *
- * Device Tree file for Marvell Armada AP806.
- */
-
-#include "armada-ap806.dtsi"
-
-/ {
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu0: cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a72";
-			reg = <0x000>;
-			enable-method = "psci";
-			#cooling-cells = <2>;
-			clocks = <&cpu_clk 0>;
-			i-cache-size = <0xc000>;
-			i-cache-line-size = <64>;
-			i-cache-sets = <256>;
-			d-cache-size = <0x8000>;
-			d-cache-line-size = <64>;
-			d-cache-sets = <256>;
-			next-level-cache = <&l2>;
-		};
-		cpu1: cpu@1 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a72";
-			reg = <0x001>;
-			enable-method = "psci";
-			#cooling-cells = <2>;
-			clocks = <&cpu_clk 0>;
-			i-cache-size = <0xc000>;
-			i-cache-line-size = <64>;
-			i-cache-sets = <256>;
-			d-cache-size = <0x8000>;
-			d-cache-line-size = <64>;
-			d-cache-sets = <256>;
-			next-level-cache = <&l2>;
-		};
-
-		l2: l2-cache {
-			compatible = "cache";
-			cache-size = <0x80000>;
-			cache-line-size = <64>;
-			cache-sets = <512>;
-			cache-level = <2>;
-			cache-unified;
-		};
-	};
-
-	thermal-zones {
-		/delete-node/ ap-thermal-cpu2;
-		/delete-node/ ap-thermal-cpu3;
-	};
-};
diff --git a/arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi b/arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi
deleted file mode 100644
index 028496ebc473..000000000000
--- a/arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi
+++ /dev/null
@@ -1,96 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Copyright (C) 2023 Marvell International Ltd.
- *
- * Device tree for the CN9130-DB Com Express CPU module board.
- */
-
-#include "cn9130-db.dtsi"
-
-/ {
-	model = "Marvell Armada CN9130-DB COM EXPRESS type 7 CPU module board";
-	compatible = "marvell,cn9130-cpu-module", "marvell,cn9130",
-		     "marvell,armada-ap807-quad", "marvell,armada-ap807";
-
-};
-
-&ap0_reg_sd_vccq {
-	regulator-max-microvolt = <1800000>;
-	states = <1800000 0x1 1800000 0x0>;
-	/delete-property/ gpios;
-};
-
-&cp0_reg_usb3_vbus0 {
-	/delete-property/ gpio;
-};
-
-&cp0_reg_usb3_vbus1 {
-	/delete-property/ gpio;
-};
-
-&cp0_reg_sd_vcc {
-	status = "disabled";
-};
-
-&cp0_reg_sd_vccq {
-	status = "disabled";
-};
-
-&cp0_sdhci0 {
-	status = "disabled";
-};
-
-&cp0_eth0 {
-	status = "disabled";
-};
-
-&cp0_eth1 {
-	status = "okay";
-	phy = <&phy0>;
-	phy-mode = "rgmii-id";
-};
-
-&cp0_eth2 {
-	status = "disabled";
-};
-
-&cp0_mdio {
-	status = "okay";
-	pinctrl-0 = <&cp0_ge_mdio_pins>;
-	phy0: ethernet-phy@0 {
-		status = "okay";
-	};
-};
-
-&cp0_syscon0 {
-	cp0_pinctrl: pinctrl {
-		compatible = "marvell,cp115-standalone-pinctrl";
-
-		cp0_ge_mdio_pins: ge-mdio-pins {
-			marvell,pins = "mpp40", "mpp41";
-			marvell,function = "ge";
-		};
-	};
-};
-
-&cp0_sdhci0 {
-	status = "disabled";
-};
-
-&cp0_spi1 {
-	status = "okay";
-};
-
-&cp0_usb3_0 {
-	status = "okay";
-	usb-phy = <&cp0_usb3_0_phy0>;
-	phy-names = "usb";
-	/delete-property/ phys;
-};
-
-&cp0_usb3_1 {
-	status = "okay";
-	usb-phy = <&cp0_usb3_0_phy1>;
-	phy-names = "usb";
-	/delete-property/ phys;
-};
-- 
2.51.0


