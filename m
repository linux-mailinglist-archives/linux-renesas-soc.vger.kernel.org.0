Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9852C40CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 14:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729504AbgKYNCA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 08:02:00 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:61969 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729526AbgKYNCA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 08:02:00 -0500
X-IronPort-AV: E=Sophos;i="5.78,368,1599490800"; 
   d="scan'208";a="63855256"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Nov 2020 22:01:58 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C3B2C4338022;
        Wed, 25 Nov 2020 22:01:56 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out ov5640 nodes
Date:   Wed, 25 Nov 2020 13:01:47 +0000
Message-Id: <20201125130148.28724-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201125130148.28724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201125130148.28724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The camera daughter board can also be connected to 8-bit ov7725 sensors,
so in preparation for configurable option to choose depending on the
camera's connected separate out ov5640 nodes in a dtsi file.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 102 +++++-------------
 .../dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi    |  89 +++++++++++++++
 2 files changed, 115 insertions(+), 76 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 98c3fbd89fa6..a632b08a8dbb 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -9,6 +9,28 @@
 /dts-v1/;
 #include "r8a7742-iwg21d-q7.dts"
 
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
+#include "r8a7742-iwg21d-q7-dbcm-ov5640.dtsi"
+
 / {
 	model = "iWave Systems RZ/G1H Qseven development platform with camera add-on";
 	compatible = "iwave,g21d", "iwave,g21m", "renesas,r8a7742";
@@ -91,67 +113,12 @@
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
@@ -160,23 +127,6 @@
 
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
@@ -278,7 +228,7 @@
 
 	port {
 		vin0ep: endpoint {
-			remote-endpoint = <&ov5640_0>;
+			remote-endpoint = <&VIN0_REMOTE_EP>;
 			bus-width = <8>;
 			bus-type = <6>;
 		};
@@ -293,7 +243,7 @@
 
 	port {
 		vin1ep: endpoint {
-			remote-endpoint = <&ov5640_1>;
+			remote-endpoint = <&VIN1_REMOTE_EP>;
 			bus-width = <8>;
 			bus-type = <6>;
 		};
@@ -307,7 +257,7 @@
 
 	port {
 		vin2ep: endpoint {
-			remote-endpoint = <&ov5640_2>;
+			remote-endpoint = <&VIN2_REMOTE_EP>;
 			bus-width = <8>;
 			data-shift = <8>;
 			bus-type = <6>;
@@ -322,7 +272,7 @@
 
 	port {
 		vin3ep: endpoint {
-			remote-endpoint = <&ov5640_3>;
+			remote-endpoint = <&VIN3_REMOTE_EP>;
 			bus-width = <8>;
 			bus-type = <6>;
 		};
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi
new file mode 100644
index 000000000000..bd037789c6df
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This include file ties VIN interfaces with ov5640 sensors on
+ * iWave-RZ/G1H Qseven board development platform connected with
+ * camera daughter board.
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#define VIN0_REMOTE_EP		ov5640_0
+#define VIN1_REMOTE_EP		ov5640_1
+#define VIN2_REMOTE_EP		ov5640_2
+#define VIN3_REMOTE_EP		ov5640_3
+
+&CAM1_PARENT_I2C {
+	ov5640@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&MCLK_CAM1>;
+		clock-names = "xclk";
+
+		port {
+			ov5640_0: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <&VIN0_EP>;
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
+
+		port {
+			ov5640_1: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <&VIN1_EP>;
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
+
+		port {
+			ov5640_2: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <&VIN2_EP>;
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
+
+		port {
+			ov5640_3: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <&VIN3_EP>;
+			};
+		};
+	};
+};
-- 
2.17.1

