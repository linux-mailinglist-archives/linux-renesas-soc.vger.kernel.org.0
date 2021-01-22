Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685BA3001BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 12:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727203AbhAVLiD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 06:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728285AbhAVLfL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 06:35:11 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B489C061786
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 03:34:30 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id KnaU2400H4C55Sk01naU8Y; Fri, 22 Jan 2021 12:34:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l2uhw-005lFX-5O; Fri, 22 Jan 2021 12:34:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l2uhv-00Bt2T-Nd; Fri, 22 Jan 2021 12:34:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out ov5640 nodes
Date:   Fri, 22 Jan 2021 12:34:23 +0100
Message-Id: <20210122113424.2833127-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122113424.2833127-1-geert+renesas@glider.be>
References: <20210122113424.2833127-1-geert+renesas@glider.be>
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
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - Only enable i2c buses when needed,

v4:
  - Describe a single camera in the .dtsi file,
  - Include the .dtsi multiple times.
---
 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 155 +++++++++---------
 .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi |  32 ++++
 2 files changed, 107 insertions(+), 80 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 98c3fbd89fa6c5c7..bc8280b2ac47e3ec 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -91,92 +91,20 @@ &hscif0 {
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
 
-	status = "okay";
+	/* status set to "okay" when needed by camera configuration below */
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
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
 
-	status = "okay";
+	/* status set to "okay" when needed by camera configuration below */
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
index 0000000000000000..70c72ba4fe724a70
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
@@ -0,0 +1,32 @@
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
+	status = "okay";
+
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

