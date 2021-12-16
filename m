Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A3E4770CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 12:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhLPLnO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 06:43:14 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:8078 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231464AbhLPLnN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 06:43:13 -0500
X-IronPort-AV: E=Sophos;i="5.88,211,1635174000"; 
   d="scan'208";a="104166394"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Dec 2021 20:43:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EFE6040062C0;
        Thu, 16 Dec 2021 20:43:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: rzg2l-smarc: Move pinctrl definitions
Date:   Thu, 16 Dec 2021 11:43:03 +0000
Message-Id: <20211216114305.5842-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211216114305.5842-1-biju.das.jz@bp.renesas.com>
References: <20211216114305.5842-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L and RZ/G2LC SMARC EVK use same carrier board, but the pin
mapping between RZ/G2L and RZ/G2LC SMARC SoM are different.
Therefore we need to update carrier board pin definitions based
on corresponding SoM pin mapping.

Move pinctrl definitions out of RZ/G2L SMARC common file, so that
we can reuse the common file to support RZ/G2LC SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    |   1 +
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  | 137 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 127 ----------------
 3 files changed, 138 insertions(+), 127 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
index 247b0b3f1b58..886d38886d05 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 #include "r9a07g044l2.dtsi"
 #include "rzg2l-smarc-som.dtsi"
+#include "rzg2l-smarc-pinfunction.dtsi"
 #include "rzg2l-smarc.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
new file mode 100644
index 000000000000..71d83e447670
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2L SMARC pincontrol parts
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&pinctrl {
+	pinctrl-0 = <&sound_clk_pins>;
+	pinctrl-names = "default";
+
+	can0_pins: can0 {
+		pinmux = <RZG2L_PORT_PINMUX(10, 1, 2)>, /* TX */
+			 <RZG2L_PORT_PINMUX(11, 0, 2)>; /* RX */
+	};
+
+	/* SW7 should be at position 2->3 so that GPIO8_CAN0_STB line is activated */
+	can0-stb {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(42, 2) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "can0_stb";
+	};
+
+	can1_pins: can1 {
+		pinmux = <RZG2L_PORT_PINMUX(12, 1, 2)>, /* TX */
+			 <RZG2L_PORT_PINMUX(13, 0, 2)>; /* RX */
+	};
+
+	/* SW8 should be at position 2->3 so that GPIO9_CAN1_STB line is activated */
+	can1-stb {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(42, 3) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "can1_stb";
+	};
+
+	i2c0_pins: i2c0 {
+		pins = "RIIC0_SDA", "RIIC0_SCL";
+		input-enable;
+	};
+
+	i2c1_pins: i2c1 {
+		pins = "RIIC1_SDA", "RIIC1_SCL";
+		input-enable;
+	};
+
+	i2c3_pins: i2c3 {
+		pinmux = <RZG2L_PORT_PINMUX(18, 0, 3)>, /* SDA */
+			 <RZG2L_PORT_PINMUX(18, 1, 3)>; /* SCL */
+	};
+
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
+			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
+	};
+
+	scif2_pins: scif2 {
+		pinmux = <RZG2L_PORT_PINMUX(48, 0, 1)>, /* TxD */
+			 <RZG2L_PORT_PINMUX(48, 1, 1)>, /* RxD */
+			 <RZG2L_PORT_PINMUX(48, 3, 1)>, /* CTS# */
+			 <RZG2L_PORT_PINMUX(48, 4, 1)>; /* RTS# */
+	};
+
+	sd1-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(39, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd1_pwr_en";
+	};
+
+	sdhi1_pins: sd1 {
+		sd1_data {
+			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
+			power-source = <3300>;
+		};
+
+		sd1_ctrl {
+			pins = "SD1_CLK", "SD1_CMD";
+			power-source = <3300>;
+		};
+
+		sd1_mux {
+			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
+		};
+	};
+
+	sdhi1_pins_uhs: sd1_uhs {
+		sd1_data_uhs {
+			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
+			power-source = <1800>;
+		};
+
+		sd1_ctrl_uhs {
+			pins = "SD1_CLK", "SD1_CMD";
+			power-source = <1800>;
+		};
+
+		sd1_mux_uhs {
+			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
+		};
+	};
+
+	sound_clk_pins: sound_clk {
+		pins = "AUDIO_CLK1", "AUDIO_CLK2";
+		input-enable;
+	};
+
+	spi1_pins: spi1 {
+		pinmux = <RZG2L_PORT_PINMUX(44, 0, 1)>, /* CK */
+			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* MOSI */
+			 <RZG2L_PORT_PINMUX(44, 2, 1)>, /* MISO */
+			 <RZG2L_PORT_PINMUX(44, 3, 1)>; /* SSL */
+	};
+
+	ssi0_pins: ssi0 {
+		pinmux = <RZG2L_PORT_PINMUX(45, 0, 1)>, /* BCK */
+			 <RZG2L_PORT_PINMUX(45, 1, 1)>, /* RCK */
+			 <RZG2L_PORT_PINMUX(45, 2, 1)>, /* TXD */
+			 <RZG2L_PORT_PINMUX(45, 3, 1)>; /* RXD */
+	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>, /* VBUS */
+			 <RZG2L_PORT_PINMUX(5, 0, 1)>, /* OVC */
+			 <RZG2L_PORT_PINMUX(5, 1, 1)>; /* OTG_ID */
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 1)>, /* VBUS */
+			 <RZG2L_PORT_PINMUX(42, 1, 1)>; /* OVC */
+	};
+};
+
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 6f2a8bdfa225..46abb29718cc 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -162,133 +162,6 @@
 	status = "okay";
 };
 
-&pinctrl {
-	pinctrl-0 = <&sound_clk_pins>;
-	pinctrl-names = "default";
-
-	can0_pins: can0 {
-		pinmux = <RZG2L_PORT_PINMUX(10, 1, 2)>, /* TX */
-			 <RZG2L_PORT_PINMUX(11, 0, 2)>; /* RX */
-	};
-
-	/* SW7 should be at position 2->3 so that GPIO8_CAN0_STB line is activated */
-	can0-stb {
-		gpio-hog;
-		gpios = <RZG2L_GPIO(42, 2) GPIO_ACTIVE_HIGH>;
-		output-low;
-		line-name = "can0_stb";
-	};
-
-	can1_pins: can1 {
-		pinmux = <RZG2L_PORT_PINMUX(12, 1, 2)>, /* TX */
-			 <RZG2L_PORT_PINMUX(13, 0, 2)>; /* RX */
-	};
-
-	/* SW8 should be at position 2->3 so that GPIO9_CAN1_STB line is activated */
-	can1-stb {
-		gpio-hog;
-		gpios = <RZG2L_GPIO(42, 3) GPIO_ACTIVE_HIGH>;
-		output-low;
-		line-name = "can1_stb";
-	};
-
-	i2c0_pins: i2c0 {
-		pins = "RIIC0_SDA", "RIIC0_SCL";
-		input-enable;
-	};
-
-	i2c1_pins: i2c1 {
-		pins = "RIIC1_SDA", "RIIC1_SCL";
-		input-enable;
-	};
-
-	i2c3_pins: i2c3 {
-		pinmux = <RZG2L_PORT_PINMUX(18, 0, 3)>, /* SDA */
-			 <RZG2L_PORT_PINMUX(18, 1, 3)>; /* SCL */
-	};
-
-	scif0_pins: scif0 {
-		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
-			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
-	};
-
-	scif2_pins: scif2 {
-		pinmux = <RZG2L_PORT_PINMUX(48, 0, 1)>, /* TxD */
-			 <RZG2L_PORT_PINMUX(48, 1, 1)>, /* RxD */
-			 <RZG2L_PORT_PINMUX(48, 3, 1)>, /* CTS# */
-			 <RZG2L_PORT_PINMUX(48, 4, 1)>; /* RTS# */
-	};
-
-	sd1-pwr-en-hog {
-		gpio-hog;
-		gpios = <RZG2L_GPIO(39, 2) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "sd1_pwr_en";
-	};
-
-	sdhi1_pins: sd1 {
-		sd1_data {
-			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
-			power-source = <3300>;
-		};
-
-		sd1_ctrl {
-			pins = "SD1_CLK", "SD1_CMD";
-			power-source = <3300>;
-		};
-
-		sd1_mux {
-			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
-		};
-	};
-
-	sdhi1_pins_uhs: sd1_uhs {
-		sd1_data_uhs {
-			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
-			power-source = <1800>;
-		};
-
-		sd1_ctrl_uhs {
-			pins = "SD1_CLK", "SD1_CMD";
-			power-source = <1800>;
-		};
-
-		sd1_mux_uhs {
-			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
-		};
-	};
-
-	sound_clk_pins: sound_clk {
-		pins = "AUDIO_CLK1", "AUDIO_CLK2";
-		input-enable;
-	};
-
-	spi1_pins: spi1 {
-		pinmux = <RZG2L_PORT_PINMUX(44, 0, 1)>, /* CK */
-			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* MOSI */
-			 <RZG2L_PORT_PINMUX(44, 2, 1)>, /* MISO */
-			 <RZG2L_PORT_PINMUX(44, 3, 1)>; /* SSL */
-	};
-
-	ssi0_pins: ssi0 {
-		pinmux = <RZG2L_PORT_PINMUX(45, 0, 1)>, /* BCK */
-			 <RZG2L_PORT_PINMUX(45, 1, 1)>, /* RCK */
-			 <RZG2L_PORT_PINMUX(45, 2, 1)>, /* TXD */
-			 <RZG2L_PORT_PINMUX(45, 3, 1)>; /* RXD */
-	};
-
-	usb0_pins: usb0 {
-		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>, /* VBUS */
-			 <RZG2L_PORT_PINMUX(5, 0, 1)>, /* OVC */
-			 <RZG2L_PORT_PINMUX(5, 1, 1)>; /* OTG_ID */
-	};
-
-	usb1_pins: usb1 {
-		pinmux = <RZG2L_PORT_PINMUX(42, 0, 1)>, /* VBUS */
-			 <RZG2L_PORT_PINMUX(42, 1, 1)>; /* OVC */
-	};
-};
-
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
-- 
2.17.1

