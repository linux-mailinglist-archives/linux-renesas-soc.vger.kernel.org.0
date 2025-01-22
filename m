Return-Path: <linux-renesas-soc+bounces-12337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1DA191E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 13:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08AC7165C5D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 12:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E225212F93;
	Wed, 22 Jan 2025 12:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p+oNr51R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A13212F87;
	Wed, 22 Jan 2025 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737550574; cv=none; b=eXMVJCznOqrPNbyBKS6MfJ1nCjv4DnyOWPXgcZJ5hlS6AO7WLrRRIfLSpYl4Xro0JMGQjpfNsN4ivnxTiMBvw4vo467FppsJ7fQzUMV2zOhHH101LhfhE/wmRlgTGMB1PJUW9sB3+ZWXN6ysvgISx1g7RgQ5Kw+zITjzBnmwMcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737550574; c=relaxed/simple;
	bh=GCQUIkcP+8Og89IkGQwv9me/cwW9GcGvqo8AcLfkcDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UldwJqanaGgG7Dh8HuR6TBq1tXhdm3ZaF9TKzkd8ubvf9rs0NQ4XpReCXDblOebFOfjuvMWBAuzEw9OG+M4QMtJa2NgJufHavl7hEaAv/VMTPMXoWBqCmmC1zBQ6Ed/bZGUItGrMvDRTVI2arAS6so/SOojS6TyfktjEsrGPQ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p+oNr51R; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737550570;
	bh=GCQUIkcP+8Og89IkGQwv9me/cwW9GcGvqo8AcLfkcDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p+oNr51RAomQ3Ewf65Lwm3ZBEvKrccfpsMzX9P30oMRecUkbEXInwzrazu6weVOt8
	 +BJGCHC0sBLqibqYCOzzi52V1+rYEMAfkcYu0Fip+UKq65SA8x/WuEsmZZ45PLF7KJ
	 BEOgpEW3BwA5jLcWfPhtPOoDH00t5YVfu8HlkJ03gcyhq0+ssE4aQ3UDWOOXPFXb2K
	 IVT33To3SkSQWqDoIh4M7e4hXT7liPq7VBuElAfKNomSjrOxes5XyXBcM4jgO+n6s7
	 xeS5dnSSRGpXjHSpnlOyE8S16U6apT3you6Ds4v7RyDjNc5jb3WqMpG5yfiaL9P+rZ
	 gIfGEZ+kS4SGg==
Received: from apertis-1.home (2a01cb088CCA73006086F5f072c6A07A.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A3FAE17E0FC7;
	Wed, 22 Jan 2025 13:56:09 +0100 (CET)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 22 Jan 2025 13:56:06 +0100
Subject: [PATCH 2/2] arm64: renesas: add initial support for MYIR Remi Pi
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-myir-remi-pi-v1-2-0e44e1cb8a90@collabora.com>
References: <20250122-myir-remi-pi-v1-0-0e44e1cb8a90@collabora.com>
In-Reply-To: <20250122-myir-remi-pi-v1-0-0e44e1cb8a90@collabora.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

Add basic support for the MyIR Remi Pi (based on r9a07g044l2):
 - UART
 - i2c
 - emmc
 - USB host
 - HDMI output
 - Ethernet

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |   1 +
 .../arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts | 420 +++++++++++++++++++++
 2 files changed, 421 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 97228a3cb99c163d299b508ee7653aafea3d1a3a..0b69bcfa405b69c26e8072d9b62be98dc621f89a 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -130,6 +130,7 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 r9a07g044l2-smarc-cru-csi-ov5645-dtbs := r9a07g044l2-smarc.dtb r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-remi-pi.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
new file mode 100644
index 0000000000000000000000000000000000000000..e6e00afc5f5b2347f139ec4dc145fac6fd39e75d
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the MYiR Remi Pi
+ *
+ * Copyright (C) 2022 MYiR Electronics Corp.
+ * Copyright (C) 2025 Collabora Ltd.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+#include "r9a07g044l2.dtsi"
+
+/ {
+	model = "MYIR Tech Limited Remi Pi MYB-YG2LX-REMI";
+	compatible = "myir,remi-pi", "renesas,r9a07g044l2", "renesas,r9a07g044";
+
+	aliases {
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
+
+		serial0 = &scif0;
+		serial1 = &scif1;
+		serial2 = &scif2;
+		serial3 = &scif3;
+
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+	};
+
+	reg_5p0v: regulator-reg_5p0v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-5.0V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		vin-supply = <&reg_5p0v>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		vin-supply = <&reg_3p3v>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_1p1v: regulator-vdd-core {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.1V";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		regulator-always-on;
+	};
+
+	x1_clk: x1-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+		ddc-i2c-bus = <&i2c1>;
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt8912_out>;
+			};
+		};
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
+	phy0: ethernet-phy@4 {
+		compatible = "ethernet-phy-id0022.1640",
+			     "ethernet-phy-ieee802.3-c22";
+		reg = <4>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(44, 2) IRQ_TYPE_LEVEL_LOW>;
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
+&eth1 {
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy1: ethernet-phy@6 {
+		compatible = "ethernet-phy-id0022.1640",
+			     "ethernet-phy-ieee802.3-c22";
+		reg = <6>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(43, 2) IRQ_TYPE_LEVEL_LOW>;
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
+&gpu {
+	mali-supply = <&reg_1p1v>;
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
+&pinctrl {
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
+	i2c2_pins: i2c2 {
+		pinmux = <RZG2L_PORT_PINMUX(3, 0, 2)>, /* SDA */
+			 <RZG2L_PORT_PINMUX(3, 1, 2)>; /* SCL */
+	};
+
+	i2c3_pins: i2c3 {
+		pinmux = <RZG2L_PORT_PINMUX(18, 0, 3)>, /* SDA */
+			 <RZG2L_PORT_PINMUX(18, 1, 3)>; /* SCL */
+	};
+
+	spi0_pins: spi0 {
+		pinmux = <RZG2L_PORT_PINMUX(47, 0, 5)>, /* CLK */
+			 <RZG2L_PORT_PINMUX(47, 1, 5)>, /* MOSI */
+			 <RZG2L_PORT_PINMUX(47, 2, 5)>, /* MISO */
+			 <RZG2L_PORT_PINMUX(47, 3, 5)>; /* Chip Enable*/
+	};
+
+	eth0_pins: eth0 {
+		pinmux = <RZG2L_PORT_PINMUX(27, 1, 1)>, /* ET0_MDC */
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
+
+	eth1_pins: eth1 {
+		pinmux = <RZG2L_PORT_PINMUX(37, 0, 1)>, /* ET1_MDC */
+			 <RZG2L_PORT_PINMUX(37, 1, 1)>, /* ET1_MDIO */
+			 <RZG2L_PORT_PINMUX(29, 0, 1)>, /* ET1_TXC */
+			 <RZG2L_PORT_PINMUX(29, 1, 1)>, /* ET1_TX_CTL */
+			 <RZG2L_PORT_PINMUX(30, 0, 1)>, /* ET1_TXD0 */
+			 <RZG2L_PORT_PINMUX(30, 1, 1)>, /* ET1_TXD1 */
+			 <RZG2L_PORT_PINMUX(31, 0, 1)>, /* ET1_TXD2 */
+			 <RZG2L_PORT_PINMUX(31, 1, 1)>, /* ET1_TXD3 */
+			 <RZG2L_PORT_PINMUX(33, 1, 1)>, /* ET1_RXC */
+			 <RZG2L_PORT_PINMUX(34, 0, 1)>, /* ET1_RX_CTL */
+			 <RZG2L_PORT_PINMUX(34, 1, 1)>, /* ET1_RXD0 */
+			 <RZG2L_PORT_PINMUX(35, 0, 1)>, /* ET1_RXD1 */
+			 <RZG2L_PORT_PINMUX(35, 1, 1)>, /* ET1_RXD2 */
+			 <RZG2L_PORT_PINMUX(36, 0, 1)>; /* ET1_RXD3 */
+	};
+
+	sdhi0_pins: sd0 {
+		sd0_data {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+			power-source = <1800>;
+		};
+
+		sd0_ctrl {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		sd0_rst {
+			pins = "SD0_RST#";
+			power-source = <1800>;
+		};
+	};
+
+	sdhi0_pins_uhs: sd0_uhs {
+		sd0_data_uhs {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+			power-source = <1800>;
+		};
+
+		sd0_ctrl_uhs {
+			pins = "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		sd0_rst_uhs {
+			pins = "SD0_RST#";
+			power-source = <1800>;
+		};
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 1)>, /* VBUS */
+			 <RZG2L_PORT_PINMUX(42, 1, 1)>; /* OVC */
+	};
+
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>, /* TxD */
+			 <RZG2L_PORT_PINMUX(38, 1, 1)>; /* RxD */
+	};
+
+	scif1_pins: scif1 {
+		pinmux = <RZG2L_PORT_PINMUX(40, 0, 1)>, /* TxD */
+			 <RZG2L_PORT_PINMUX(40, 1, 1)>; /* RxD */
+	};
+
+	scif2_pins: scif2 {
+		pinmux = <RZG2L_PORT_PINMUX(48, 0, 1)>, /* TxD */
+			 <RZG2L_PORT_PINMUX(48, 1, 1)>; /* RxD */
+	};
+
+	scif3_pins: scif3 {
+		pinmux = <RZG2L_PORT_PINMUX(0, 0, 5)>, /* TxD */
+			 <RZG2L_PORT_PINMUX(0, 1, 5)>; /* RxD */
+	};
+};
+
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-1 = <&sdhi0_pins_uhs>;
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
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&dsi {
+	status = "okay";
+	ports {
+		port@1 {
+			dsi_out: endpoint {
+				remote-endpoint = <&lt8912_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
+	clock-frequency = <400000>;
+	status = "okay";
+
+	hdmi-bridge@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48> ;
+		reset-gpios = <&pinctrl RZG2L_GPIO(42, 2) GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt8912_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt8912_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif3 {
+	pinctrl-0 = <&scif3_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
+&mtu3 {
+	status = "okay";
+};

-- 
2.47.1


