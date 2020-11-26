Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAEC22C5214
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 11:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387996AbgKZKbI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 05:31:08 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:63230 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730004AbgKZKbH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 05:31:07 -0500
X-IronPort-AV: E=Sophos;i="5.78,371,1599490800"; 
   d="scan'208";a="63758983"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Nov 2020 19:31:07 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6754E40138F1;
        Thu, 26 Nov 2020 19:31:04 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support for 8-bit ov7725 sensors
Date:   Thu, 26 Nov 2020 10:30:53 +0000
Message-Id: <20201126103053.29881-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126103053.29881-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201126103053.29881-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The 8-bit ov7725 sensors can also be connected to the camera daughter
board.

This patch creates a separate dtsi file for ov7725 sensors and is included
in r8a7742-iwg21d-q7-dbcm-ca.dts. The user can set VINx_SENSOR depending
on the cameras connected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |   7 ++
 .../dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi    | 112 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 1ab4f9771a34..915ff5fd437c 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -11,6 +11,7 @@
 
 #define SENSOR_NONE		1
 #define SENSOR_OV5640		2
+#define SENSOR_OV7725		3
 
 /* 8bit CMOS Camera 1 (J13) */
 #define CAM1_PARENT_I2C		i2c0
@@ -40,6 +41,11 @@
  * VIN2 interface and also the ov5640 node connected to it)
  *      #define VIN2_SENSOR		SENSOR_NONE
  *
+ * To tie VINx endpoints to ov7725_x endpoints set VINx_SENSOR to
+ * SENSOR_OV7725 for example if ov7725_3 is connected to the VIN3
+ * interface set the below (this disables the ov5640_3)
+ *      #define VIN3_SENSOR		SENSOR_OV7725
+ *
  */
 #define VIN0_SENSOR		SENSOR_OV5640
 #define VIN1_SENSOR		SENSOR_OV5640
@@ -47,6 +53,7 @@
 #define VIN3_SENSOR		SENSOR_OV5640
 
 #include "r8a7742-iwg21d-q7-dbcm-ov5640.dtsi"
+#include "r8a7742-iwg21d-q7-dbcm-ov7725.dtsi"
 
 #if (VIN0_SENSOR == SENSOR_NONE)
 #undef VIN0_REMOTE_EP
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi
new file mode 100644
index 000000000000..054d0a7cc5ce
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This include file ties VIN interfaces with ov7725 sensors on
+ * iWave-RZ/G1H Qseven board development platform connected with
+ * camera daughter board.
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#if (VIN0_SENSOR == SENSOR_OV7725)
+#define OV7725_0_STATUS		"okay"
+#define OV7725_0_REMOTE_EP	&VIN0_EP
+#define VIN0_REMOTE_EP		&ov7725_0
+#else
+#define OV7725_0_STATUS		"disabled"
+#define OV7725_0_REMOTE_EP	0
+#endif
+
+#if (VIN1_SENSOR == SENSOR_OV7725)
+#define OV7725_1_STATUS		"okay"
+#define OV7725_1_REMOTE_EP	&VIN1_EP
+#define VIN1_REMOTE_EP		&ov7725_1
+#else
+#define OV7725_1_STATUS		"disabled"
+#define OV7725_1_REMOTE_EP	0
+#endif
+
+#if (VIN2_SENSOR == SENSOR_OV7725)
+#define OV7725_2_STATUS		"okay"
+#define OV7725_2_REMOTE_EP	&VIN2_EP
+#define VIN2_REMOTE_EP		&ov7725_2
+#else
+#define OV7725_2_STATUS		"disabled"
+#define OV7725_2_REMOTE_EP	0
+#endif
+
+#if (VIN3_SENSOR == SENSOR_OV7725)
+#define OV7725_3_STATUS		"okay"
+#define OV7725_3_REMOTE_EP	&VIN3_EP
+#define VIN3_REMOTE_EP		&ov7725_3
+#else
+#define OV7725_3_STATUS		"disabled"
+#define OV7725_3_REMOTE_EP	0
+#endif
+
+&CAM1_PARENT_I2C {
+	ov7725@21 {
+		compatible = "ovti,ov7725";
+		reg = <0x21>;
+		clocks = <&MCLK_CAM1>;
+		status = OV7725_0_STATUS;
+
+		port {
+			ov7725_0: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				remote-endpoint = <OV7725_0_REMOTE_EP>;
+			};
+		};
+	};
+};
+
+&CAM2_PARENT_I2C {
+	ov7725@21 {
+		compatible = "ovti,ov7725";
+		reg = <0x21>;
+		clocks = <&MCLK_CAM2>;
+		status = OV7725_1_STATUS;
+
+		port {
+			ov7725_1: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				remote-endpoint = <OV7725_1_REMOTE_EP>;
+			};
+		};
+	};
+};
+
+&CAM3_PARENT_I2C {
+	ov7725@21 {
+		compatible = "ovti,ov7725";
+		reg = <0x21>;
+		clocks = <&MCLK_CAM3>;
+		status = OV7725_2_STATUS;
+
+		port {
+			ov7725_2: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				remote-endpoint = <OV7725_2_REMOTE_EP>;
+			};
+		};
+	};
+};
+
+&CAM4_PARENT_I2C {
+	ov7725@21 {
+		compatible = "ovti,ov7725";
+		reg = <0x21>;
+		clocks = <&MCLK_CAM4>;
+		status = OV7725_3_STATUS;
+
+		port {
+			ov7725_3: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				remote-endpoint = <OV7725_3_REMOTE_EP>;
+			};
+		};
+	};
+};
-- 
2.17.1

