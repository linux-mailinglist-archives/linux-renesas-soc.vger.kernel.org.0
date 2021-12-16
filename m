Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5AF4770D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 12:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233316AbhLPLnT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 06:43:19 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:8013 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232241AbhLPLnS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 06:43:18 -0500
X-IronPort-AV: E=Sophos;i="5.88,211,1635174000"; 
   d="scan'208";a="103716764"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Dec 2021 20:43:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id F34F640121C6;
        Thu, 16 Dec 2021 20:43:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: Add initial device tree for RZ/G2LC SMARC EVK
Date:   Thu, 16 Dec 2021 11:43:05 +0000
Message-Id: <20211216114305.5842-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211216114305.5842-1-biju.das.jz@bp.renesas.com>
References: <20211216114305.5842-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add basic support for RZ/G2LC SMARC EVK (based on R9A07G044C2):
- memory
- External input clock
- SCIF
- GbEthernet
- Audio Clock

It shares the same carrier board with RZ/G2L, but the pin mapping is
different. Disable the device nodes which is not tested and
delete the corresponding pinctrl definitions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../boot/dts/renesas/r9a07g044c2-smarc.dts    | 99 +++++++++++++++++++
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi | 25 +++++
 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi    | 76 ++++++++++++++
 4 files changed, 201 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 5bc8065a7864..8e696a38c560 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -76,3 +76,4 @@ dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
new file mode 100644
index 000000000000..53845823d0dc
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC SMARC EVK board
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a07g044c2.dtsi"
+#include "rzg2lc-smarc-som.dtsi"
+#include "rzg2lc-smarc-pinfunction.dtsi"
+#include "rzg2l-smarc.dtsi"
+
+/ {
+	model = "Renesas SMARC EVK based on r9a07g044c2";
+	compatible = "renesas,smarc-evk", "renesas,r9a07g044c2", "renesas,r9a07g044";
+
+};
+
+&canfd {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&ehci0 {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&ehci1 {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&hsusb {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&i2c0 {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&i2c1 {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&i2c3 {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&ohci0 {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&ohci1 {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&phyrst {
+	status = "disabled";
+};
+
+&scif2 {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&sdhi1 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-1;
+	/delete-property/ vmmc-supply;
+	status = "disabled";
+};
+
+&spi1 {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&ssi0 {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&usb2_phy0 {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+
+&usb2_phy1 {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
new file mode 100644
index 000000000000..5333a1f9a0e7
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC SMARC pincontrol parts
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
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
+			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
+	};
+
+	sound_clk_pins: sound_clk {
+		pins = "AUDIO_CLK1", "AUDIO_CLK2";
+		input-enable;
+	};
+};
+
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
new file mode 100644
index 000000000000..e1d7a3a689c6
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC SMARC SOM common parts
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/ {
+	aliases {
+		ethernet0 = &eth0;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+	};
+};
+
+&eth0 {
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy0: ethernet-phy@7 {
+		compatible = "ethernet-phy-id0022.1640",
+			     "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+		rxc-skew-psec = <2400>;
+		txc-skew-psec = <2400>;
+		rxdv-skew-psec = <0>;
+		txdv-skew-psec = <0>;
+		rxd0-skew-psec = <0>;
+		rxd1-skew-psec = <0>;
+		rxd2-skew-psec = <0>;
+		rxd3-skew-psec = <0>;
+		txd0-skew-psec = <0>;
+		txd1-skew-psec = <0>;
+		txd2-skew-psec = <0>;
+		txd3-skew-psec = <0>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
+
+&pinctrl {
+	eth0_pins: eth0 {
+		pinmux = <RZG2L_PORT_PINMUX(28, 1, 1)>, /* ET0_LINKSTA */
+			 <RZG2L_PORT_PINMUX(27, 1, 1)>, /* ET0_MDC */
+			 <RZG2L_PORT_PINMUX(28, 0, 1)>, /* ET0_MDIO */
+			 <RZG2L_PORT_PINMUX(20, 0, 1)>, /* ET0_TXC */
+			 <RZG2L_PORT_PINMUX(20, 1, 1)>, /* ET0_TX_CTL */
+			 <RZG2L_PORT_PINMUX(20, 2, 1)>, /* ET0_TXD0 */
+			 <RZG2L_PORT_PINMUX(21, 0, 1)>, /* ET0_TXD1 */
+			 <RZG2L_PORT_PINMUX(21, 1, 1)>, /* ET0_TXD2 */
+			 <RZG2L_PORT_PINMUX(22, 0, 1)>, /* ET0_TXD3 */
+			 <RZG2L_PORT_PINMUX(24, 0, 1)>, /* ET0_RXC */
+			 <RZG2L_PORT_PINMUX(24, 1, 1)>, /* ET0_RX_CTL */
+			 <RZG2L_PORT_PINMUX(25, 0, 1)>, /* ET0_RXD0 */
+			 <RZG2L_PORT_PINMUX(25, 1, 1)>, /* ET0_RXD1 */
+			 <RZG2L_PORT_PINMUX(26, 0, 1)>, /* ET0_RXD2 */
+			 <RZG2L_PORT_PINMUX(26, 1, 1)>; /* ET0_RXD3 */
+	};
+};
+
-- 
2.17.1

