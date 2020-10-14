Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3307828E2A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Oct 2020 16:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731547AbgJNO4I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Oct 2020 10:56:08 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:22927 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728799AbgJNO4I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Oct 2020 10:56:08 -0400
X-IronPort-AV: E=Sophos;i="5.77,375,1596466800"; 
   d="scan'208";a="59780486"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Oct 2020 23:56:06 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1418142E69AB;
        Wed, 14 Oct 2020 23:56:04 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Enable VIN instances
Date:   Wed, 14 Oct 2020 15:55:58 +0100
Message-Id: <20201014145558.12854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable VIN instances along with OV5640 as endpoints on the adapter board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch applies on top of [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
    renesas-devel.git/log/?h=renesas-arm-dt-for-v5.11
---
 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 222 ++++++++++++++++++
 1 file changed, 222 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 961c0f2eeefb..98c3fbd89fa6 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -20,6 +20,30 @@
 		serial5 = &hscif0;
 		ethernet1 = &ether;
 	};
+
+	mclk_cam1: mclk-cam1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	mclk_cam2: mclk-cam2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	mclk_cam3: mclk-cam3 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	mclk_cam4: mclk-cam4 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
 };
 
 &avb {
@@ -47,6 +71,19 @@
 	};
 };
 
+&gpio0 {
+	/* Disable hogging GP0_18 to output LOW */
+	/delete-node/ qspi_en;
+
+	/* Hog GP0_18 to output HIGH to enable VIN2 */
+	vin2_en {
+		gpio-hog;
+		gpios = <18 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "VIN2_EN";
+	};
+};
+
 &hscif0 {
 	pinctrl-0 = <&hscif0_pins>;
 	pinctrl-names = "default";
@@ -54,6 +91,94 @@
 	status = "okay";
 };
 
+&i2c0 {
+	ov5640@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&mclk_cam1>;
+		clock-names = "xclk";
+
+		port {
+			ov5640_0: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <&vin0ep>;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ov5640@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&mclk_cam2>;
+		clock-names = "xclk";
+
+		port {
+			ov5640_1: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <&vin1ep>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	ov5640@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&mclk_cam3>;
+		clock-names = "xclk";
+
+		port {
+			ov5640_2: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <&vin2ep>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ov5640@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&mclk_cam4>;
+		clock-names = "xclk";
+
+		port {
+			ov5640_3: endpoint {
+				bus-width = <8>;
+				data-shift = <2>;
+				bus-type = <6>;
+				pclk-sample = <1>;
+				remote-endpoint = <&vin3ep>;
+			};
+		};
+	};
+};
+
 &pfc {
 	can0_pins: can0 {
 		groups = "can0_data_d";
@@ -70,6 +195,16 @@
 		function = "hscif0";
 	};
 
+	i2c1_pins: i2c1 {
+		groups = "i2c1_c";
+		function = "i2c1";
+	};
+
+	i2c3_pins: i2c3 {
+		groups = "i2c3";
+		function = "i2c3";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
@@ -84,6 +219,31 @@
 		groups = "scifb1_data";
 		function = "scifb1";
 	};
+
+	vin0_8bit_pins: vin0 {
+		groups = "vin0_data8", "vin0_clk", "vin0_sync";
+		function = "vin0";
+	};
+
+	vin1_8bit_pins: vin1 {
+		groups = "vin1_data8_b", "vin1_clk_b", "vin1_sync_b";
+		function = "vin1";
+	};
+
+	vin2_pins: vin2 {
+		groups = "vin2_g8", "vin2_clk";
+		function = "vin2";
+	};
+
+	vin3_pins: vin3 {
+		groups = "vin3_data8", "vin3_clk", "vin3_sync";
+		function = "vin3";
+	};
+};
+
+&qspi {
+	/* Pins shared with VIN2, keep status disabled */
+	status = "disabled";
 };
 
 &scif0 {
@@ -106,3 +266,65 @@
 	rts-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	cts-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
 };
+
+&vin0 {
+	/*
+	 * Set SW2 switch on the SOM to 'ON'
+	 * Set SW1 switch on camera board to 'OFF' as we are using 8bit mode
+	 */
+	status = "okay";
+	pinctrl-0 = <&vin0_8bit_pins>;
+	pinctrl-names = "default";
+
+	port {
+		vin0ep: endpoint {
+			remote-endpoint = <&ov5640_0>;
+			bus-width = <8>;
+			bus-type = <6>;
+		};
+	};
+};
+
+&vin1 {
+	/* Set SW1 switch on the SOM to 'ON' */
+	status = "okay";
+	pinctrl-0 = <&vin1_8bit_pins>;
+	pinctrl-names = "default";
+
+	port {
+		vin1ep: endpoint {
+			remote-endpoint = <&ov5640_1>;
+			bus-width = <8>;
+			bus-type = <6>;
+		};
+	};
+};
+
+&vin2 {
+	status = "okay";
+	pinctrl-0 = <&vin2_pins>;
+	pinctrl-names = "default";
+
+	port {
+		vin2ep: endpoint {
+			remote-endpoint = <&ov5640_2>;
+			bus-width = <8>;
+			data-shift = <8>;
+			bus-type = <6>;
+		};
+	};
+};
+
+&vin3 {
+	status = "okay";
+	pinctrl-0 = <&vin3_pins>;
+	pinctrl-names = "default";
+
+	port {
+		vin3ep: endpoint {
+			remote-endpoint = <&ov5640_3>;
+			bus-width = <8>;
+			bus-type = <6>;
+		};
+	};
+};
-- 
2.17.1

