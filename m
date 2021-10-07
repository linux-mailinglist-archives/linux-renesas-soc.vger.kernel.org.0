Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDCF342572E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 17:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242128AbhJGP44 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Oct 2021 11:56:56 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:1473 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232589AbhJGP4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 11:56:55 -0400
X-IronPort-AV: E=Sophos;i="5.85,355,1624287600"; 
   d="scan'208";a="96455070"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Oct 2021 00:55:01 +0900
Received: from localhost.localdomain (unknown [10.226.93.49])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id EF217400F5D0;
        Fri,  8 Oct 2021 00:54:58 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC on SMARC platform
Date:   Thu,  7 Oct 2021 16:54:50 +0100
Message-Id: <20211007155451.10654-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211007155451.10654-1-biju.das.jz@bp.renesas.com>
References: <20211007155451.10654-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L SoM has both 64Gb eMMC and micro SD connected to SDHI0.

Both these interfaces are mutually exclusive and the SD0 device
selection is based on the XOR between GPIO_SD0_DEV_SEL and SW1[2]
switch position.

This patch sets GPIO_SD0_DEV_SEL to high in DT. Use the below switch
setting logic for device selection between eMMC and microSD slot
connected to SDHI0.

Set SW1[2] to position 2/OFF for selecting eMMC
Set SW1[2] to position 3/ON for selecting micro SD

This patch enables eMMC on RZ/G2L SMARC platform by default.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch has dependency upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=559045
---
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index da1ee2206e1a..d83072009225 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -5,14 +5,55 @@
  * Copyright (C) 2021 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
+/* SW1[2] should be at position 2/OFF to enable 64Gb eMMC */
+#define EMMC	1
+
+/*
+ * To enable uSD card on CN3,
+ * SW1[2] should be at position 3/ON.
+ * Disable eMMC by setting "#define EMMC	0" above.
+ */
+#define SDHI	(!EMMC)
+
 / {
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
+
+	reg_1p8v: regulator0 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator1 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vccq_sdhi0: regulator-vccq-sdhi0 {
+		compatible = "regulator-gpio";
+
+		regulator-name = "SDHI0 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		states = <3300000 1 1800000 0>;
+		regulator-boot-on;
+		gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+	};
 };
 
 &adc {
@@ -32,4 +73,108 @@
 	adc_pins: adc {
 		pinmux = <RZG2L_PORT_PINMUX(9, 0, 2)>; /* ADC_TRG */
 	};
+
+	/*
+	 * SDO device selection is XOR between GPIO_SD0_DEV_SEL and SW1[2]
+	 * The below switch logic can be used to select the device between
+	 * eMMC and microSD, after setting GPIO_SD0_DEV_SEL to high in DT.
+	 * SW1[2] should be at position 2/OFF to enable 64Gb eMMC
+	 * SW1[2] should be at position 3/ON to enable uSD card CN3
+	 */
+	gpio_sd0_dev_sel {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(41, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "gpio_sd0_dev_sel";
+	};
+
+	sd0_pwr_en {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(4, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd0_pwr_en";
+	};
+
+	sdhi0_emmc_pins: sd0emmc {
+		sd0_emmc_data {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+			power-source  = <1800>;
+		};
+
+		sd0_emmc_ctrl {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source  = <1800>;
+		};
+
+		sd0_emmc_rst {
+			pins = "SD0_RST#";
+			power-source  = <1800>;
+		};
+	};
+
+	sdhi0_pins: sd0 {
+		sd0_data {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3";
+			power-source  = <3300>;
+		};
+
+		sd0_ctrl {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source  = <3300>;
+		};
+
+		sd0_mux {
+			pinmux = <RZG2L_PORT_PINMUX(47, 0, 2)>; /* SD0_CD */
+		};
+	};
+
+	sdhi0_pins_uhs: sd0_uhs {
+		sd1_data_uhs {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3";
+			power-source  = <1800>;
+		};
+
+		sd0_ctrl_uhs {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source  = <1800>;
+		};
+
+		sd0_mux_uhs {
+			pinmux = <RZG2L_PORT_PINMUX(47, 0, 2)>; /* SD0_CD */
+		};
+	};
+
 };
+
+#if SDHI
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-1 = <&sdhi0_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vccq_sdhi0>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+#endif
+
+#if EMMC
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_emmc_pins>;
+	pinctrl-1 = <&sdhi0_emmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	non-removable;
+	fixed-emmc-driver-type = <1>;
+	status = "okay";
+};
+#endif
+
-- 
2.17.1

