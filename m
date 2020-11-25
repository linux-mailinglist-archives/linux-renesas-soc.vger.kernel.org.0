Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 905122C40D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 14:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729553AbgKYNCB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 08:02:01 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:48489 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729535AbgKYNCB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 08:02:01 -0500
X-IronPort-AV: E=Sophos;i="5.78,368,1599490800"; 
   d="scan'208";a="63639443"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Nov 2020 22:02:00 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 05D1A4338022;
        Wed, 25 Nov 2020 22:01:58 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support for 8-bit ov7725 sensors
Date:   Wed, 25 Nov 2020 13:01:48 +0000
Message-Id: <20201125130148.28724-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201125130148.28724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201125130148.28724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The 8-bit ov7725 sensors can also be connected to the camera daughter
board.

This patch creates a separate dtsi file for ov7725 sensors and is included
in r8a7742-iwg21d-q7-dbcm-ca.dts (which is commented out as by default
ov5640 is enabled)

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |  2 +
 .../dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi    | 77 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index a632b08a8dbb..6216a6b0f927 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -29,7 +29,9 @@
 #define MCLK_CAM4		mclk_cam4
 #define VIN3_EP			vin3ep
 
+/* Comment the below according to connected cameras */
 #include "r8a7742-iwg21d-q7-dbcm-ov5640.dtsi"
+/* #include "r8a7742-iwg21d-q7-dbcm-ov7725.dtsi" */
 
 / {
 	model = "iWave Systems RZ/G1H Qseven development platform with camera add-on";
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi
new file mode 100644
index 000000000000..28b509942702
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This include file ties VIN interfaces with ov7725 sensors on
+ * iWave-RZ/G1H Qseven board development platform connected with
+ * camera daughter board.
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#define VIN0_REMOTE_EP		ov7725_0
+#define VIN1_REMOTE_EP		ov7725_1
+#define VIN2_REMOTE_EP		ov7725_2
+#define VIN3_REMOTE_EP		ov7725_3
+
+&CAM1_PARENT_I2C {
+	ov7725@21 {
+		compatible = "ovti,ov7725";
+		reg = <0x21>;
+		clocks = <&MCLK_CAM1>;
+
+		port {
+			ov7725_0: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				remote-endpoint = <&VIN0_EP>;
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
+
+		port {
+			ov7725_1: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				remote-endpoint = <&VIN1_EP>;
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
+
+		port {
+			ov7725_2: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				remote-endpoint = <&VIN2_EP>;
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
+
+		port {
+			ov7725_3: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				remote-endpoint = <&VIN3_EP>;
+			};
+		};
+	};
+};
-- 
2.17.1

