Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79B912C5211
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 11:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387946AbgKZKbF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 05:31:05 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:63230 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730004AbgKZKbF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 05:31:05 -0500
X-IronPort-AV: E=Sophos;i="5.78,371,1599490800"; 
   d="scan'208";a="63758975"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Nov 2020 19:31:04 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2CB9F40158CE;
        Thu, 26 Nov 2020 19:31:01 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out ov5640 nodes
Date:   Thu, 26 Nov 2020 10:30:52 +0000
Message-Id: <20201126103053.29881-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126103053.29881-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201126103053.29881-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The camera daughter board can also be connected to 8-bit ov7725 sensors,
so in preparation for configurable option to choose depending on the
camera's connected separate out ov5640 nodes in a dtsi file.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 159 +++++++++---------
 .../dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi    | 124 ++++++++++++++
 2 files changed, 203 insertions(+), 80 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 98c3fbd89fa6..1ab4f9771a34 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -9,6 +9,77 @@
 /dts-v1/;
 #include "r8a7742-iwg21d-q7.dts"
 
+#define SENSOR_NONE		1
+#define SENSOR_OV5640		2
+
+/* 8bit CMOS Camera 1 (J13) */
+#define CAM1_PARENT_I2C		i2c0
+#define MCLK_CAM1		mclk_cam1
+#define VIN0_EP			vin0ep
+
+/* 8bit CMOS Camera 2 (J14) */
+#define CAM2_PARENT_I2C		i2c1
+#define MCLK_CAM2		mclk_cam2
+#define VIN1_EP			vin1ep
+
+/* 8bit CMOS Camera 3 (J12) */
+#define CAM3_PARENT_I2C		i2c2
+#define MCLK_CAM3		mclk_cam3
+#define VIN2_EP			vin2ep
+
+/* 8bit CMOS Camera 4 (J11) */
+#define CAM4_PARENT_I2C		i2c3
+#define MCLK_CAM4		mclk_cam4
+#define VIN3_EP			vin3ep
+
+/*
+ * Below configuration ties VINx endpoints to ov5640_x endpoints
+ *
+ * To disable a VINx set VINx_SENSOR to SENSOR_NONE for example if no
+ * sensor is connected to VIN2 interface set the below (this disables the
+ * VIN2 interface and also the ov5640 node connected to it)
+ *      #define VIN2_SENSOR		SENSOR_NONE
+ *
+ */
+#define VIN0_SENSOR		SENSOR_OV5640
+#define VIN1_SENSOR		SENSOR_OV5640
+#define VIN2_SENSOR		SENSOR_OV5640
+#define VIN3_SENSOR		SENSOR_OV5640
+
+#include "r8a7742-iwg21d-q7-dbcm-ov5640.dtsi"
+
+#if (VIN0_SENSOR == SENSOR_NONE)
+#undef VIN0_REMOTE_EP
+#define VIN0_REMOTE_EP		0
+#define VIN0_STATUS		"disabled"
+#else
+#define VIN0_STATUS		"okay"
+#endif
+
+#if (VIN1_SENSOR == SENSOR_NONE)
+#undef VIN1_REMOTE_EP
+#define VIN1_REMOTE_EP		0
+#define VIN1_STATUS		"disabled"
+#else
+#define VIN1_STATUS		"okay"
+#endif
+
+#if (VIN2_SENSOR == SENSOR_NONE)
+#undef VIN2_REMOTE_EP
+#define VIN2_REMOTE_EP		0
+#define VIN2_STATUS		"disabled"
+#else
+#define VIN2_STATUS		"okay"
+#endif
+
+#if (VIN3_SENSOR == SENSOR_NONE)
+#undef VIN3_REMOTE_EP
+#define VIN3_REMOTE_EP		0
+#define VIN3_STATUS		"disabled"
+#else
+#define VIN3_STATUS		"okay"
+#endif
+
 / {
 	model = "iWave Systems RZ/G1H Qseven development platform with camera add-on";
 	compatible = "iwave,g21d", "iwave,g21m", "renesas,r8a7742";
@@ -91,67 +162,12 @@
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
@@ -160,23 +176,6 @@
 
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
@@ -272,13 +271,13 @@
 	 * Set SW2 switch on the SOM to 'ON'
 	 * Set SW1 switch on camera board to 'OFF' as we are using 8bit mode
 	 */
-	status = "okay";
+	status = VIN0_STATUS;
 	pinctrl-0 = <&vin0_8bit_pins>;
 	pinctrl-names = "default";
 
 	port {
 		vin0ep: endpoint {
-			remote-endpoint = <&ov5640_0>;
+			remote-endpoint = <VIN0_REMOTE_EP>;
 			bus-width = <8>;
 			bus-type = <6>;
 		};
@@ -287,13 +286,13 @@
 
 &vin1 {
 	/* Set SW1 switch on the SOM to 'ON' */
-	status = "okay";
+	status = VIN1_STATUS;
 	pinctrl-0 = <&vin1_8bit_pins>;
 	pinctrl-names = "default";
 
 	port {
 		vin1ep: endpoint {
-			remote-endpoint = <&ov5640_1>;
+			remote-endpoint = <VIN1_REMOTE_EP>;
 			bus-width = <8>;
 			bus-type = <6>;
 		};
@@ -301,13 +300,13 @@
 };
 
 &vin2 {
-	status = "okay";
+	status = VIN2_STATUS;
 	pinctrl-0 = <&vin2_pins>;
 	pinctrl-names = "default";
 
 	port {
 		vin2ep: endpoint {
-			remote-endpoint = <&ov5640_2>;
+			remote-endpoint = <VIN2_REMOTE_EP>;
 			bus-width = <8>;
 			data-shift = <8>;
 			bus-type = <6>;
@@ -316,13 +315,13 @@
 };
 
 &vin3 {
-	status = "okay";
+	status = VIN3_STATUS;
 	pinctrl-0 = <&vin3_pins>;
 	pinctrl-names = "default";
 
 	port {
 		vin3ep: endpoint {
-			remote-endpoint = <&ov5640_3>;
+			remote-endpoint = <VIN3_REMOTE_EP>;
 			bus-width = <8>;
 			bus-type = <6>;
 		};
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi
new file mode 100644
index 000000000000..fa2d55f259ec
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This include file ties VIN interfaces with ov5640 sensors on
+ * iWave-RZ/G1H Qseven board development platform connected with
+ * camera daughter board.
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#if (VIN0_SENSOR == SENSOR_OV5640)
+#define OV5640_0_STATUS		"okay"
+#define OV5640_0_REMOTE_EP	&VIN0_EP
+#define VIN0_REMOTE_EP		&ov5640_0
+#else
+#define OV5640_0_STATUS		"disabled"
+#define OV5640_0_REMOTE_EP	0
+#endif
+
+#if (VIN1_SENSOR == SENSOR_OV5640)
+#define OV5640_1_STATUS		"okay"
+#define OV5640_1_REMOTE_EP	&VIN1_EP
+#define VIN1_REMOTE_EP		&ov5640_1
+#else
+#define OV5640_1_STATUS		"disabled"
+#define OV5640_1_REMOTE_EP	0
+#endif
+
+#if (VIN2_SENSOR == SENSOR_OV5640)
+#define OV5640_2_STATUS		"okay"
+#define OV5640_2_REMOTE_EP	&VIN2_EP
+#define VIN2_REMOTE_EP		&ov5640_2
+#else
+#define OV5640_2_STATUS		"disabled"
+#define OV5640_2_REMOTE_EP	0
+#endif
+
+#if (VIN3_SENSOR == SENSOR_OV5640)
+#define OV5640_3_STATUS		"okay"
+#define OV5640_3_REMOTE_EP	&VIN3_EP
+#define VIN3_REMOTE_EP		&ov5640_3
+#else
+#define OV5640_3_STATUS		"disabled"
+#define OV5640_3_REMOTE_EP	0
+#endif
+
+&CAM1_PARENT_I2C {
+	ov5640@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&MCLK_CAM1>;
+		clock-names = "xclk";
+		status = OV5640_0_STATUS;
+
+		port {
+			ov5640_0: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <OV5640_0_REMOTE_EP>;
+			};
+		};
+	};
+};
+
+&CAM2_PARENT_I2C {
+	ov5640@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&MCLK_CAM2>;
+		clock-names = "xclk";
+		status = OV5640_1_STATUS;
+
+		port {
+			ov5640_1: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <OV5640_1_REMOTE_EP>;
+			};
+		};
+	};
+};
+
+&CAM3_PARENT_I2C {
+	ov5640@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&MCLK_CAM3>;
+		clock-names = "xclk";
+		status = OV5640_2_STATUS;
+
+		port {
+			ov5640_2: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <OV5640_2_REMOTE_EP>;
+			};
+		};
+	};
+};
+
+&CAM4_PARENT_I2C {
+	ov5640@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&MCLK_CAM4>;
+		clock-names = "xclk";
+		status = OV5640_3_STATUS;
+
+		port {
+			ov5640_3: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <OV5640_3_REMOTE_EP>;
+			};
+		};
+	};
+};
-- 
2.17.1

