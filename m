Return-Path: <linux-renesas-soc+bounces-25719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8488FCB9C5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 21:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F12B304FB8C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 20:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6139528FA91;
	Fri, 12 Dec 2025 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUkCal4/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FB92264C7;
	Fri, 12 Dec 2025 20:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571576; cv=none; b=cNFjFhmmp8NnZ7V6mY3fbUHzt5YzfstLsOPenWpuj35dW4pVyS1VfHhMSnU1W2tCwp87YCYlQFr59qdq8E8T/ICP5BtzNGQUYXCNp+73cfP9Aux80x4hC0bqXXSaxN2aIO2kWAOyjNgNZtnj426pQ71EV/XClvAvZS0oUtbw/2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571576; c=relaxed/simple;
	bh=nl8jmuaQIUkcFjUouN8lEYy4SPb817zy3BHjAt3d+lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HlPFISbrqdWZUJZE8L2i4Ujr4PeejYjFPV2ggnsseK4/o9MeCcr99cWLSYOWos3VCssWuZixvTaetm3xcAaMMH+xQyS2AATybQos1fhEZyp3UudFeC5L4WgNFhXkFIIEc9C9kQeRYOxuonaHmr0k1oYlfMLgMLptvpH9FQtAW9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUkCal4/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96931C4CEF1;
	Fri, 12 Dec 2025 20:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765571575;
	bh=nl8jmuaQIUkcFjUouN8lEYy4SPb817zy3BHjAt3d+lc=;
	h=From:To:Cc:Subject:Date:From;
	b=oUkCal4/400MJYY0Kjb8N2b15SRhztgEnKHbhVoZ1NfwFmxZ1JTLlxuxFMcjhZlZN
	 s8bfYqgFyD3kvMbbwdubRaILRbWvFYLNFbnCPXZx1POOduID+YfC6Q70sdAbjjczwA
	 sb/vvPcRNRmd5+IZuOzbVJdonldF6ri3jgZXB4Xv5vE31h1GyzVqaJa1SoSOc/CU9c
	 WVb/S/FStsb852I7Zax9lGr6tFWZ8NvczaMwKNaty/rNofd8qaSofzNG1zAdfq1z3I
	 42TFXRfozm80rJ2yavnHxdbZAAeZHtfOFwpUyCATVuSQ3+J5aS4ngOJt6sLPefQwHO
	 IUiOh6v3kvvGg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm/arm64: dts: renesas: Drop unused .dtsi
Date: Fri, 12 Dec 2025 14:32:07 -0600
Message-ID: <20251212203226.458694-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These .dtsi files are not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../renesas/gr-peach-audiocamerashield.dtsi   |  75 ----
 .../dts/renesas/r8a77xx-aa121td01-panel.dtsi  |  39 --
 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi | 332 ------------------
 arch/arm64/boot/dts/renesas/r8a779m0.dtsi     |  12 -
 arch/arm64/boot/dts/renesas/r8a779m2.dtsi     |  12 -
 arch/arm64/boot/dts/renesas/r8a779m4.dtsi     |  12 -
 arch/arm64/boot/dts/renesas/r8a779m6.dtsi     |  12 -
 arch/arm64/boot/dts/renesas/r8a779m7.dtsi     |  12 -
 arch/arm64/boot/dts/renesas/r8a779m8.dtsi     |  17 -
 arch/arm64/boot/dts/renesas/r8a779mb.dtsi     |  12 -
 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi  |  25 --
 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi  |  18 -
 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi  |  18 -
 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi |  18 -
 14 files changed, 614 deletions(-)
 delete mode 100644 arch/arm/boot/dts/renesas/gr-peach-audiocamerashield.dtsi
 delete mode 100644 arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m0.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m2.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m4.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m6.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m7.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m8.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779mb.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi

diff --git a/arch/arm/boot/dts/renesas/gr-peach-audiocamerashield.dtsi b/arch/arm/boot/dts/renesas/gr-peach-audiocamerashield.dtsi
deleted file mode 100644
index 8d77579807ec..000000000000
--- a/arch/arm/boot/dts/renesas/gr-peach-audiocamerashield.dtsi
+++ /dev/null
@@ -1,75 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Device Tree Source for the GR-Peach audiocamera shield expansion board
- *
- * Copyright (C) 2017 Jacopo Mondi <jacopo+renesas@jmondi.org>
- */
-
-#include "r7s72100.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
-
-/ {
-	/* On-board camera clock. */
-	camera_clk: camera_clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <27000000>;
-	};
-};
-
-&pinctrl {
-	i2c1_pins: i2c1 {
-		/* P1_2 as SCL; P1_3 as SDA */
-		pinmux = <RZA1_PINMUX(1, 2, 1)>, <RZA1_PINMUX(1, 3, 1)>;
-	};
-
-	vio_pins: vio {
-		/* CEU pins: VIO_D[0-10], VIO_VD, VIO_HD, VIO_CLK */
-		pinmux = <RZA1_PINMUX(1, 0, 5)>, /* VIO_VD */
-			 <RZA1_PINMUX(1, 1, 5)>, /* VIO_HD */
-			 <RZA1_PINMUX(2, 0, 7)>, /* VIO_D0 */
-			 <RZA1_PINMUX(2, 1, 7)>, /* VIO_D1 */
-			 <RZA1_PINMUX(2, 2, 7)>, /* VIO_D2 */
-			 <RZA1_PINMUX(2, 3, 7)>, /* VIO_D3 */
-			 <RZA1_PINMUX(2, 4, 7)>, /* VIO_D4 */
-			 <RZA1_PINMUX(2, 5, 7)>, /* VIO_D5 */
-			 <RZA1_PINMUX(2, 6, 7)>, /* VIO_D6 */
-			 <RZA1_PINMUX(2, 7, 7)>, /* VIO_D7 */
-			 <RZA1_PINMUX(10, 0, 6)>; /* VIO_CLK */
-	};
-};
-
-&i2c1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c1_pins>;
-
-	status = "okay";
-	clock-frequency = <100000>;
-
-	camera@48 {
-		compatible = "aptina,mt9v111";
-		reg = <0x48>;
-
-		clocks = <&camera_clk>;
-
-		port {
-			mt9v111_out: endpoint {
-				remote-endpoint = <&ceu_in>;
-			};
-		};
-	};
-};
-
-&ceu {
-	pinctrl-names = "default";
-	pinctrl-0 = <&vio_pins>;
-
-	status = "okay";
-
-	port {
-		ceu_in: endpoint {
-			remote-endpoint = <&mt9v111_out>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi b/arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi
deleted file mode 100644
index 6e7589ea7562..000000000000
--- a/arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi
+++ /dev/null
@@ -1,39 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Common file for the AA121TD01 panel connected to Renesas R-Car boards
- *
- * Copyright (C) 2015 Renesas Electronics Corp.
- */
-
-/ {
-	panel {
-		compatible = "mitsubishi,aa121td01", "panel-lvds";
-
-		width-mm = <261>;
-		height-mm = <163>;
-		data-mapping = "jeida-18";
-
-		panel-timing {
-			/* 1280x800 @60Hz */
-			clock-frequency = <71000000>;
-			hactive = <1280>;
-			vactive = <800>;
-			hsync-len = <70>;
-			hfront-porch = <20>;
-			hback-porch = <70>;
-			vsync-len = <5>;
-			vfront-porch = <3>;
-			vback-porch = <15>;
-		};
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&lvds_connector>;
-			};
-		};
-	};
-};
-
-&lvds_connector {
-	remote-endpoint = <&panel_in>;
-};
diff --git a/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi b/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
deleted file mode 100644
index e0930d1ba3aa..000000000000
--- a/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
+++ /dev/null
@@ -1,332 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2017 Ideas on Board <kieran.bingham@ideasonboard.com>
- * Copyright (C) 2021 Jacopo Mondi <jacopo+renesas@jmondi.org>
- *
- * Device Tree Source (overlay) that describes GMSL camera connected to
- * Fakra connectors for the Eagle V3M and Condor V3H (and compatible) boards.
- *
- * The following cameras are currently supported: RDACM20 and RDACM21.
- *
- * The board .dts file that include this has to select which cameras are in use
- * by specifying the camera model with:
- *
- * #define GMSL_CAMERA_RDACM20
- * or
- * #define GMSL_CAMERA_RDACM21
- *
- * And which cameras are connected to the board by defining:
- * for GMSL channel 0:
- *	   #define GMSL_CAMERA_0
- *	   #define GMSL_CAMERA_1
- *	   #define GMSL_CAMERA_2
- *	   #define GMSL_CAMERA_3
- *
- * for GMSL channel 1:
- *	   #define GMSL_CAMERA_4
- *	   #define GMSL_CAMERA_5
- *	   #define GMSL_CAMERA_6
- *	   #define GMSL_CAMERA_7
- */
-
-#include <dt-bindings/gpio/gpio.h>
-
-/* Validate the board file settings. */
-#if !defined(GMSL_CAMERA_RDACM20) && !defined(GMSL_CAMERA_RDACM21)
-#error "Camera model should be defined by the board file"
-#endif
-
-#if defined(GMSL_CAMERA_RDACM20) && defined(GMSL_CAMERA_RDACM21)
-#error "A single camera model should be selected"
-#endif
-
-#if !defined(GMSL_CAMERA_0) && !defined(GMSL_CAMERA_1) && \
-    !defined(GMSL_CAMERA_2) && !defined(GMSL_CAMERA_3) && \
-    !defined(GMSL_CAMERA_4) && !defined(GMSL_CAMERA_5) && \
-    !defined(GMSL_CAMERA_6) && !defined(GMSL_CAMERA_7)
-#error "At least one camera should be selected"
-#endif
-
-/* Deduce from the enabled cameras which GMSL channels are active. */
-#if defined(GMSL_CAMERA_0) || defined(GMSL_CAMERA_1) || \
-    defined(GMSL_CAMERA_2) || defined(GMSL_CAMERA_3)
-#define GMSL_0
-#endif
-
-#if defined(GMSL_CAMERA_4) || defined(GMSL_CAMERA_5) || \
-    defined(GMSL_CAMERA_6) || defined(GMSL_CAMERA_7)
-#define GMSL_1
-#endif
-
-/* Deduce the camera model compatible string. */
-#if defined(GMSL_CAMERA_RDACM20)
-#define GMSL_CAMERA_MODEL "imi,rdacm20"
-#elif defined(GMSL_CAMERA_RDACM21)
-#define GMSL_CAMERA_MODEL "imi,rdacm21"
-#endif
-
-#ifdef GMSL_0
-&vin0 {
-	status = "okay";
-};
-
-&vin1 {
-	status = "okay";
-};
-
-&vin2 {
-	status = "okay";
-};
-
-&vin3 {
-	status = "okay";
-};
-
-&gmsl0 {
-	status = "okay";
-
-#if defined(GMSL_CAMERA_RDACM21)
-	maxim,reverse-channel-microvolt = <100000>;
-#endif
-
-	ports {
-#ifdef GMSL_CAMERA_0
-		port@0 {
-			max9286_in0: endpoint {
-				remote-endpoint = <&fakra_con0>;
-			};
-		};
-#endif
-
-#ifdef GMSL_CAMERA_1
-		port@1 {
-			max9286_in1: endpoint {
-				remote-endpoint = <&fakra_con1>;
-			};
-
-		};
-#endif
-
-#ifdef GMSL_CAMERA_2
-		port@2 {
-			max9286_in2: endpoint {
-				remote-endpoint = <&fakra_con2>;
-			};
-
-		};
-#endif
-
-#ifdef GMSL_CAMERA_3
-		port@3 {
-			max9286_in3: endpoint {
-				remote-endpoint = <&fakra_con3>;
-			};
-
-		};
-#endif
-	};
-
-	i2c-mux {
-#ifdef GMSL_CAMERA_0
-		i2c@0 {
-			status = "okay";
-
-			camera@51 {
-				compatible = GMSL_CAMERA_MODEL;
-				reg = <0x51>, <0x61>;
-
-				port {
-					fakra_con0: endpoint {
-						remote-endpoint = <&max9286_in0>;
-					};
-				};
-			};
-		};
-#endif
-
-#ifdef GMSL_CAMERA_1
-		i2c@1 {
-			status = "okay";
-
-			camera@52 {
-				compatible = GMSL_CAMERA_MODEL;
-				reg = <0x52>, <0x62>;
-
-				port {
-					fakra_con1: endpoint {
-						remote-endpoint = <&max9286_in1>;
-					};
-				};
-			};
-		};
-#endif
-
-#ifdef GMSL_CAMERA_2
-		i2c@2 {
-			status = "okay";
-
-			camera@53 {
-				compatible = GMSL_CAMERA_MODEL;
-				reg = <0x53>, <0x63>;
-
-				port {
-					fakra_con2: endpoint {
-						remote-endpoint = <&max9286_in2>;
-					};
-				};
-			};
-		};
-#endif
-
-#ifdef GMSL_CAMERA_3
-		i2c@3 {
-			status = "okay";
-
-			camera@54 {
-				compatible = GMSL_CAMERA_MODEL;
-				reg = <0x54>, <0x64>;
-
-				port {
-					fakra_con3: endpoint {
-						remote-endpoint = <&max9286_in3>;
-					};
-				};
-			};
-		};
-#endif
-	};
-};
-#endif /* ifdef GMSL_0 */
-
-#ifdef GMSL_1
-&vin4 {
-	status = "okay";
-};
-
-&vin5 {
-	status = "okay";
-};
-
-&vin6 {
-	status = "okay";
-};
-
-&vin7 {
-	status = "okay";
-};
-
-&gmsl1 {
-	status = "okay";
-
-#if defined(GMSL_CAMERA_RDACM21)
-	maxim,reverse-channel-microvolt = <100000>;
-#endif
-
-	ports {
-#ifdef GMSL_CAMERA_4
-		port@0 {
-			max9286_in4: endpoint {
-				remote-endpoint = <&fakra_con4>;
-			};
-		};
-#endif
-
-#ifdef GMSL_CAMERA_5
-		port@1 {
-			max9286_in5: endpoint {
-				remote-endpoint = <&fakra_con5>;
-			};
-
-		};
-#endif
-
-#ifdef GMSL_CAMERA_6
-		port@2 {
-			max9286_in6: endpoint {
-				remote-endpoint = <&fakra_con6>;
-			};
-
-		};
-#endif
-
-#ifdef GMSL_CAMERA_7
-		port@3 {
-			max9286_in7: endpoint {
-				remote-endpoint = <&fakra_con7>;
-			};
-
-		};
-#endif
-	};
-
-	i2c-mux {
-#ifdef GMSL_CAMERA_4
-		i2c@0 {
-			status = "okay";
-
-			camera@55 {
-				compatible = GMSL_CAMERA_MODEL;
-				reg = <0x55>, <0x65>;
-
-				port {
-					fakra_con4: endpoint {
-						remote-endpoint = <&max9286_in4>;
-					};
-				};
-			};
-		};
-#endif
-
-#ifdef GMSL_CAMERA_5
-		i2c@1 {
-			status = "okay";
-
-			camera@56 {
-				compatible = GMSL_CAMERA_MODEL;
-				reg = <0x56>, <0x66>;
-
-				port {
-					fakra_con5: endpoint {
-						remote-endpoint = <&max9286_in5>;
-					};
-				};
-			};
-		};
-#endif
-
-#ifdef GMSL_CAMERA_6
-		i2c@2 {
-			status = "okay";
-
-			camera@57 {
-				compatible = GMSL_CAMERA_MODEL;
-				reg = <0x57>, <0x67>;
-
-				port {
-					fakra_con6: endpoint {
-						remote-endpoint = <&max9286_in6>;
-					};
-				};
-			};
-		};
-#endif
-
-#ifdef GMSL_CAMERA_7
-		i2c@3 {
-			status = "okay";
-
-			camera@58 {
-				compatible = GMSL_CAMERA_MODEL;
-				reg = <0x58>, <0x68>;
-
-				port {
-					fakra_con7: endpoint {
-						remote-endpoint = <&max9286_in7>;
-					};
-				};
-			};
-		};
-#endif
-	};
-};
-#endif /* ifdef GMSL_1 */
diff --git a/arch/arm64/boot/dts/renesas/r8a779m0.dtsi b/arch/arm64/boot/dts/renesas/r8a779m0.dtsi
deleted file mode 100644
index 38978360e722..000000000000
--- a/arch/arm64/boot/dts/renesas/r8a779m0.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Device Tree Source for the R-Car H3e (R8A779M0) SoC
- *
- * Copyright (C) 2021 Glider bv
- */
-
-#include "r8a77951.dtsi"
-
-/ {
-	compatible = "renesas,r8a779m0", "renesas,r8a7795";
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a779m2.dtsi b/arch/arm64/boot/dts/renesas/r8a779m2.dtsi
deleted file mode 100644
index bced12764c69..000000000000
--- a/arch/arm64/boot/dts/renesas/r8a779m2.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Device Tree Source for the R-Car M3e (R8A779M2) SoC
- *
- * Copyright (C) 2021 Glider bv
- */
-
-#include "r8a77961.dtsi"
-
-/ {
-	compatible = "renesas,r8a779m2", "renesas,r8a77961";
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a779m4.dtsi b/arch/arm64/boot/dts/renesas/r8a779m4.dtsi
deleted file mode 100644
index ae8486056962..000000000000
--- a/arch/arm64/boot/dts/renesas/r8a779m4.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Device Tree Source for the R-Car M3Ne (R8A779M4) SoC
- *
- * Copyright (C) 2021 Glider bv
- */
-
-#include "r8a77965.dtsi"
-
-/ {
-	compatible = "renesas,r8a779m4", "renesas,r8a77965";
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a779m6.dtsi b/arch/arm64/boot/dts/renesas/r8a779m6.dtsi
deleted file mode 100644
index 94d6a6cf503e..000000000000
--- a/arch/arm64/boot/dts/renesas/r8a779m6.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Device Tree Source for the R-Car E3e (R8A779M6) SoC
- *
- * Copyright (C) 2021 Glider bv
- */
-
-#include "r8a77990.dtsi"
-
-/ {
-	compatible = "renesas,r8a779m6", "renesas,r8a77990";
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a779m7.dtsi b/arch/arm64/boot/dts/renesas/r8a779m7.dtsi
deleted file mode 100644
index 0580fa614034..000000000000
--- a/arch/arm64/boot/dts/renesas/r8a779m7.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Device Tree Source for the R-Car D3e (R8A779M7) SoC
- *
- * Copyright (C) 2021 Glider bv
- */
-
-#include "r8a77995.dtsi"
-
-/ {
-	compatible = "renesas,r8a779m7", "renesas,r8a77995";
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a779m8.dtsi b/arch/arm64/boot/dts/renesas/r8a779m8.dtsi
deleted file mode 100644
index dfccc080fb3e..000000000000
--- a/arch/arm64/boot/dts/renesas/r8a779m8.dtsi
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Device Tree Source for the R-Car H3Ne (R8A779M8) SoC
- *
- * Copyright (C) 2021 Glider bv
- */
-
-#include "r8a77951.dtsi"
-
-/ {
-	compatible = "renesas,r8a779m8", "renesas,r8a7795";
-};
-
-&cluster0_opp {
-	/delete-node/ opp-1600000000;
-	/delete-node/ opp-1700000000;
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a779mb.dtsi b/arch/arm64/boot/dts/renesas/r8a779mb.dtsi
deleted file mode 100644
index 181b737c91cd..000000000000
--- a/arch/arm64/boot/dts/renesas/r8a779mb.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Device Tree Source for the R-Car H3Ne-1.7G (R8A779MB) SoC
- *
- * Copyright (C) 2022 Glider bv
- */
-
-#include "r8a77951.dtsi"
-
-/ {
-	compatible = "renesas,r8a779mb", "renesas,r8a7795";
-};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
deleted file mode 100644
index 56a979e82c4f..000000000000
--- a/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
+++ /dev/null
@@ -1,25 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-/*
- * Device Tree Source for the RZ/G2LC R9A07G044C1 SoC specific parts
- *
- * Copyright (C) 2021 Renesas Electronics Corp.
- */
-
-/dts-v1/;
-#include "r9a07g044.dtsi"
-
-/ {
-	compatible = "renesas,r9a07g044c1", "renesas,r9a07g044";
-
-	cpus {
-		/delete-node/ cpu-map;
-		/delete-node/ cpu@100;
-	};
-};
-
-&soc {
-	/delete-node/ ssi@1004a800;
-	/delete-node/ serial@1004c800;
-	/delete-node/ adc@10059000;
-	/delete-node/ ethernet@11c30000;
-};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
deleted file mode 100644
index 9cf27ca9f1d2..000000000000
--- a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
+++ /dev/null
@@ -1,18 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-/*
- * Device Tree Source for the RZ/G2L R9A07G044L1 SoC specific parts
- *
- * Copyright (C) 2021 Renesas Electronics Corp.
- */
-
-/dts-v1/;
-#include "r9a07g044.dtsi"
-
-/ {
-	compatible = "renesas,r9a07g044l1", "renesas,r9a07g044";
-
-	cpus {
-		/delete-node/ cpu-map;
-		/delete-node/ cpu@100;
-	};
-};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
deleted file mode 100644
index d85a6ac0f024..000000000000
--- a/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
+++ /dev/null
@@ -1,18 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-/*
- * Device Tree Source for the RZ/V2L R9A07G054L1 SoC specific parts
- *
- * Copyright (C) 2021 Renesas Electronics Corp.
- */
-
-/dts-v1/;
-#include "r9a07g054.dtsi"
-
-/ {
-	compatible = "renesas,r9a07g054l1", "renesas,r9a07g054";
-
-	cpus {
-		/delete-node/ cpu-map;
-		/delete-node/ cpu@100;
-	};
-};
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
deleted file mode 100644
index e50d9159e832..000000000000
--- a/arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
+++ /dev/null
@@ -1,18 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-/*
- * Device Tree Source for the RZ/G3E R9A09G047E37 SoC specific parts
- *
- * Copyright (C) 2024 Renesas Electronics Corp.
- */
-
-/dts-v1/;
-#include "r9a09g047.dtsi"
-
-/ {
-	compatible = "renesas,r9a09g047e37", "renesas,r9a09g047";
-
-	cpus {
-		/delete-node/ cpu@200;
-		/delete-node/ cpu@300;
-	};
-};
-- 
2.51.0


