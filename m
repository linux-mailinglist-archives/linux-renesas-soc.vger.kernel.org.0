Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0360A2C56F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 15:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390428AbgKZOUn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 09:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389925AbgKZOUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 09:20:42 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F7AC061A04
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2020 06:20:42 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id x2Ld2300G4C55Sk062LdkE; Thu, 26 Nov 2020 15:20:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kiI8T-005s37-4k; Thu, 26 Nov 2020 15:20:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kiHVh-00HGZE-1q; Thu, 26 Nov 2020 14:40:33 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out ov5640 nodes
Date:   Thu, 26 Nov 2020 14:40:30 +0100
Message-Id: <20201126134031.4115211-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134031.4115211-1-geert@linux-m68k.org>
References: <20201126134031.4115211-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The camera daughter board can also be connected to 8-bit ov7725 sensors,
so in preparation for configurable option to choose depending on the
camera's connected separate out the ov5640 nodes in a dtsi file.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
[geert: describe a single camera in the .dtsi, include multiple times]
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v4:
  - Describe a single camera in the .dtsi file,
  - Include the .dtsi multiple times,

 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 151 +++++++++---------
 .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi |  30 ++++
 2 files changed, 103 insertions(+), 78 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 98c3fbd89fa6c5c7..00634eb58ce39da5 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -91,67 +91,12 @@ &hscif0 {
 	status = "okay";
 };
 
-&i2c0 {
-	ov5640@3c {
-		compatible = "ovti,ov5640";
-		reg = <0x3c>;
-		clocks = <&mclk_cam1>;
-		clock-names = "xclk";
-
-		port {
-			ov5640_0: endpoint {
-				bus-width = <8>;
-				data-shift = <2>;
-				bus-type = <6>;
-				pclk-sample = <1>;
-				remote-endpoint = <&vin0ep>;
-			};
-		};
-	};
-};
-
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins>;
 	pinctrl-names = "default";
 
 	status = "okay";
 	clock-frequency = <400000>;
-
-	ov5640@3c {
-		compatible = "ovti,ov5640";
-		reg = <0x3c>;
-		clocks = <&mclk_cam2>;
-		clock-names = "xclk";
-
-		port {
-			ov5640_1: endpoint {
-				bus-width = <8>;
-				data-shift = <2>;
-				bus-type = <6>;
-				pclk-sample = <1>;
-				remote-endpoint = <&vin1ep>;
-			};
-		};
-	};
-};
-
-&i2c2 {
-	ov5640@3c {
-		compatible = "ovti,ov5640";
-		reg = <0x3c>;
-		clocks = <&mclk_cam3>;
-		clock-names = "xclk";
-
-		port {
-			ov5640_2: endpoint {
-				bus-width = <8>;
-				data-shift = <2>;
-				bus-type = <6>;
-				pclk-sample = <1>;
-				remote-endpoint = <&vin2ep>;
-			};
-		};
-	};
 };
 
 &i2c3 {
@@ -160,23 +105,6 @@ &i2c3 {
 
 	status = "okay";
 	clock-frequency = <400000>;
-
-	ov5640@3c {
-		compatible = "ovti,ov5640";
-		reg = <0x3c>;
-		clocks = <&mclk_cam4>;
-		clock-names = "xclk";
-
-		port {
-			ov5640_3: endpoint {
-				bus-width = <8>;
-				data-shift = <2>;
-				bus-type = <6>;
-				pclk-sample = <1>;
-				remote-endpoint = <&vin3ep>;
-			};
-		};
-	};
 };
 
 &pfc {
@@ -267,6 +195,21 @@ &scifb1 {
 	cts-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
 };
 
+/*
+ * Below configuration ties VINx endpoints to ov5640/ov7725 camera endpoints
+ *
+ * Uncomment the #include statements to change configuration
+ */
+
+/* 8bit CMOS Camera 1 (J13) */
+#define CAM_PARENT_I2C		i2c0
+#define MCLK_CAM		mclk_cam1
+#define CAM_EP			cam0ep
+#define VIN_EP			vin0ep
+#undef CAM_ENABLED
+#include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
+
+#ifdef CAM_ENABLED
 &vin0 {
 	/*
 	 * Set SW2 switch on the SOM to 'ON'
@@ -278,13 +221,28 @@ &vin0 {
 
 	port {
 		vin0ep: endpoint {
-			remote-endpoint = <&ov5640_0>;
+			remote-endpoint = <&cam0ep>;
 			bus-width = <8>;
 			bus-type = <6>;
 		};
 	};
 };
-
+#endif /* CAM_ENABLED */
+
+#undef CAM_PARENT_I2C
+#undef MCLK_CAM
+#undef CAM_EP
+#undef VIN_EP
+
+/* 8bit CMOS Camera 2 (J14) */
+#define CAM_PARENT_I2C		i2c1
+#define MCLK_CAM		mclk_cam2
+#define CAM_EP			cam1ep
+#define VIN_EP			vin1ep
+#undef CAM_ENABLED
+#include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
+
+#ifdef CAM_ENABLED
 &vin1 {
 	/* Set SW1 switch on the SOM to 'ON' */
 	status = "okay";
@@ -293,13 +251,29 @@ &vin1 {
 
 	port {
 		vin1ep: endpoint {
-			remote-endpoint = <&ov5640_1>;
+			remote-endpoint = <&cam1ep>;
 			bus-width = <8>;
 			bus-type = <6>;
 		};
 	};
 };
 
+#endif /* CAM_ENABLED */
+
+#undef CAM_PARENT_I2C
+#undef MCLK_CAM
+#undef CAM_EP
+#undef VIN_EP
+
+/* 8bit CMOS Camera 3 (J12) */
+#define CAM_PARENT_I2C		i2c2
+#define MCLK_CAM		mclk_cam3
+#define CAM_EP			cam2ep
+#define VIN_EP			vin2ep
+#undef CAM_ENABLED
+#include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
+
+#ifdef CAM_ENABLED
 &vin2 {
 	status = "okay";
 	pinctrl-0 = <&vin2_pins>;
@@ -307,14 +281,29 @@ &vin2 {
 
 	port {
 		vin2ep: endpoint {
-			remote-endpoint = <&ov5640_2>;
+			remote-endpoint = <&cam2ep>;
 			bus-width = <8>;
 			data-shift = <8>;
 			bus-type = <6>;
 		};
 	};
 };
-
+#endif /* CAM_ENABLED */
+
+#undef CAM_PARENT_I2C
+#undef MCLK_CAM
+#undef CAM_EP
+#undef VIN_EP
+
+/* 8bit CMOS Camera 4 (J11) */
+#define CAM_PARENT_I2C		i2c3
+#define MCLK_CAM		mclk_cam4
+#define CAM_EP			cam3ep
+#define VIN_EP			vin3ep
+#undef CAM_ENABLED
+#include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
+
+#ifdef CAM_ENABLED
 &vin3 {
 	status = "okay";
 	pinctrl-0 = <&vin3_pins>;
@@ -322,9 +311,15 @@ &vin3 {
 
 	port {
 		vin3ep: endpoint {
-			remote-endpoint = <&ov5640_3>;
+			remote-endpoint = <&cam3ep>;
 			bus-width = <8>;
 			bus-type = <6>;
 		};
 	};
 };
+#endif /* CAM_ENABLED */
+
+#undef CAM_PARENT_I2C
+#undef MCLK_CAM
+#undef CAM_EP
+#undef VIN_EP
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
new file mode 100644
index 0000000000000000..408016620f5b1a04
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This include file ties a VIN interface with a single ov5640 sensor on
+ * the iWave-RZ/G1H Qseven board development platform connected with the
+ * camera daughter board.
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#define CAM_ENABLED	1
+
+&CAM_PARENT_I2C {
+	ov5640@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&MCLK_CAM>;
+		clock-names = "xclk";
+		status = "okay";
+
+		port {
+			CAM_EP: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <&VIN_EP>;
+			};
+		};
+	};
+};
-- 
2.25.1

