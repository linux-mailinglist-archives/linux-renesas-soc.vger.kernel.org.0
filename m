Return-Path: <linux-renesas-soc+bounces-15743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66399A841CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 13:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F612189D355
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 11:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844292836BD;
	Thu, 10 Apr 2025 11:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="T0/5vBXV";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gttDr2m2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42C2281523;
	Thu, 10 Apr 2025 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744284807; cv=none; b=HRWq/Ybtuzh7AjDgbhQ9XrEwS0s6TkfWKwHIVj3M+AvFQs6C8Mwc+C+KuBhG7t4MKJFZT2CPQRo3qN74Y7Hsju2OYuFRhG+dwVzB6sg1A0rmxFYtaAbTJt81E2NCjtEtRZLcF0OsJn23x7Nun8BS7xF1phD3SaWi2tWuw7NzcHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744284807; c=relaxed/simple;
	bh=ZD/uBRej2t0bZ7GdZ09YVcqELuzXuXzAYpQjtQpX7U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRihm9B8zq1fU05QHAL/UrrRCR/hNTFWbjrrSi8MjuteJp12D3k0ScPJ7GA7CXhv+p1DCXRlmNaRoSwlxlDzHYjRAw1jZSCGeMgVZqfOFvEcm9PGXT7YcbQZU9s9ruYp2D2bwtSFnzb86QHVwAXpTV0tEcu8ICCZc0/nHx5LV48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=T0/5vBXV; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gttDr2m2 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744284803; x=1775820803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BQN2eF3zgJqeni5K47dKLL1IPlt0dyuRcNUzRPqmPVQ=;
  b=T0/5vBXVgVCZ5tezfRGTtSU1jQyR8uqk9y27W98Nk/Z1Ksp2c3YLq+T8
   IWgydJKZNNstBwvFHhuAT6YqUGlGnVB3wIp3pAseDUvZDHTVzLTLEtSyi
   r09fkH2Jo53MMexhJlxh/tHL/p6mq5JLzxg4N4MZ8A2qgpZdACxBh7JOU
   9HO/qSa3iejoSP8Z+98Ba99hSlWRFtj52wFAX2CcNdLQXkC6z9D4yMJpj
   t/zcGQjahPSeP03UT0PaPh+3vYB7+7HH08M2x7q0UlUujill2BfSAVApL
   Jv1+jEcUX9/MpYzSCZylnFWHsVqB5L+/4wDFXiaon2Ox1zx3MjoiN3fW1
   g==;
X-CSE-ConnectionGUID: aE/4wSSlSR28TBVdsMD4rA==
X-CSE-MsgGUID: PiFw3VCvRw6Gr96befCWGg==
X-IronPort-AV: E=Sophos;i="6.15,202,1739833200"; 
   d="scan'208";a="43454836"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Apr 2025 13:33:18 +0200
X-CheckPoint: {67F7AC7D-1F-2417938-F0170C2B}
X-MAIL-CPID: 5C570CC9BBC12D20EEA40C94E8760BAD_2
X-Control-Analysis: str=0001.0A006374.67F7AC71.0051,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9F6D1689D2;
	Thu, 10 Apr 2025 13:33:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744284793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BQN2eF3zgJqeni5K47dKLL1IPlt0dyuRcNUzRPqmPVQ=;
	b=gttDr2m22c5/BqIIqU1eoy5TKGgsUez4+oy7qVG4erMiI3SfFdNMOM+WbdWasfwPBpQes4
	Ve1d76r4Oei7jGvHKsA76lo2fQpfV4pRaD8LY8S3ElHumB5Vh4BgCFjYSdLkWNqCRX2fgp
	oT2nvnJmHzMv3JPhtDLYpBIUTl8sfBmyxSXU/Aa8W1uPiWuMIcO9saHt3r2DdLbowcVpaj
	/ddW8R20yDMX+gGzT3DAZBEKMZeNDLK76l2Tsk4LkKCrjdbm3v9e3fIr7Cvrl4lcC9+RDt
	G0+wMVL74rwJcXvQAy0Yge3vRw9PSW3oxn0COIjucRdLLCYiYBx/nDyMm5O+wA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dt: imx95: Add TQMa95xxSA
Date: Thu, 10 Apr 2025 13:31:03 +0200
Message-ID: <20250410113107.2057426-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410113107.2057426-1-alexander.stein@ew.tq-group.com>
References: <20250410113107.2057426-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add initial support for TQMa95xxSA module compatible to SMARC-2.
There is a common device tree for all variants with e.g. reduced CPU count.
It supports LPUART7 for console, CAN, PCIe I2C, SPI, USB3.0, Audio,
SDHC1/2 and QSPI as storage.

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxsa/

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx95-tqma9596sa-mb-smarc-2.dts | 314 ++++++++
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  | 698 ++++++++++++++++++
 3 files changed, 1013 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d6212..d23cce37aa2d7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -303,6 +303,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
new file mode 100644
index 0000000000000..1af72b5b7e35f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2024 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include "imx95-tqma9596sa.dtsi"
+
+/ {
+	model = "TQ-Systems i.MX95 TQMa95xxSA on MB-SMARC-2";
+	compatible = "tq,imx95-tqma9596sa-mb-smarc-2", "tq,imx95-tqma9596sa", "fsl,imx95";
+
+	aliases {
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		i2c3 = &lpi2c4;
+		i2c4 = &lpi2c5;
+		i2c5 = &lpi2c6;
+		i2c6 = &lpi2c7;
+		i2c7 = &lpi2c8;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		rtc0 = &pcf85063;
+		rtc1 = &scmi_bbm;
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial2 = &lpuart3;
+		serial3 = &lpuart4;
+		serial4 = &lpuart5;
+		serial5 = &lpuart6;
+		serial6 = &lpuart7;
+		serial7 = &lpuart8;
+	};
+
+	chosen {
+		stdout-path = &lpuart7;
+	};
+
+	backlight_lvds0: backlight-lvds0 {
+		compatible = "pwm-backlight";
+		pwms = <&tpm3 0 100000 0>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+		enable-gpios = <&expander2 1 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_12v0>;
+		status = "disabled";
+	};
+
+	backlight_lvds1: backlight-lvds1 {
+		compatible = "pwm-backlight";
+		pwms = <&tpm4 0 100000 0>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+		enable-gpios = <&expander2 3 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_12v0>;
+		status = "disabled";
+	};
+
+	panel_lvds0: panel-lvds0 {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT
+		 */
+		backlight = <&backlight_lvds0>;
+		power-supply = <&reg_lvds0>;
+		status = "disabled";
+
+		port {
+			panel_in_lvds0: endpoint {
+				// TODO: LVDS0 out
+			};
+		};
+	};
+
+	panel_lvds1: panel-lvds1 {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT
+		 */
+		backlight = <&backlight_lvds1>;
+		power-supply = <&reg_lvds1>;
+		status = "disabled";
+
+		port {
+			panel_in_lvds1: endpoint {
+				// TODO: LVDS1 out
+			};
+		};
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_12v0: regulator-12v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "12V0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+	};
+
+	reg_lvds0: regulator-lvds0 {
+		compatible = "regulator-fixed";
+		regulator-name = "LCD0_VDD_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander2 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_lvds1: regulator-lvds1 {
+		compatible = "regulator-fixed";
+		regulator-name = "LCD1_VDD_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander2 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	sound {
+		compatible = "fsl,imx-audio-tlv320aic32x4";
+		model = "tqm-tlv320aic32";
+		audio-codec = <&tlv320aic3x04>;
+		audio-cpu = <&sai3>;
+	};
+};
+
+&enetc_port0 {
+	status = "okay";
+};
+
+&enetc_port1 {
+	status = "okay";
+};
+
+&expander2 {
+	pcie1-clk-en-hog {
+		gpio-hog;
+		gpios = <14 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "PCIE1_CLK_EN";
+	};
+
+	pcie2-clk-en-hog {
+		gpio-hog;
+		gpios = <15 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "PCIE2_CLK_EN";
+	};
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	xceiver-supply = <&reg_3v3>;
+	status = "okay";
+};
+
+&flexcan3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan3>;
+	xceiver-supply = <&reg_3v3>;
+	status = "okay";
+};
+
+&lpi2c1 {
+	tlv320aic3x04: audio-codec@18 {
+		compatible = "ti,tlv320aic32x4";
+		reg = <0x18>;
+		clocks = <&scmi_clk IMX95_CLK_SAI3>;
+		clock-names = "mclk";
+		iov-supply = <&reg_1v8>;
+		ldoin-supply = <&reg_3v3>;
+	};
+
+	eeprom2: eeprom@57 {
+		compatible = "atmel,24c32";
+		reg = <0x57>;
+		pagesize = <32>;
+		vcc-supply = <&reg_3v3>;
+	};
+};
+
+&lpspi3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi3>;
+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>, <&gpio2 7 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+/* SER0 */
+&lpuart1 {
+	status = "disabled";
+};
+
+/* SER3 */
+&lpuart5 {
+	status = "okay";
+};
+
+/* SER1 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* SER2 */
+&lpuart8 {
+	status = "okay";
+};
+
+/* X44 mPCIe */
+&pcie0 {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX95_CLK_HSIO>,
+		 <&pcieclk 1>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+	reset-gpio = <&expander2 9 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+/* X22 PCIe x1 socket */
+&pcie1 {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX95_CLK_HSIO>,
+		 <&pcieclk 0>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+	reset-gpio = <&expander2 10 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&reg_sdvmmc {
+	status = "okay";
+};
+
+&sai3 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&sai5 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai5>;
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI5>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+};
+
+/* TODO: USB2 */
+
+/* X16 */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc2>;
+	vmmc-supply = <&reg_sdvmmc>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	bus-width = <4>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
new file mode 100644
index 0000000000000..3fcd7bb2b0ee5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -0,0 +1,698 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2024 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx95.dtsi"
+
+/ {
+	aliases {
+		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port1;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/*
+		 * DRAM base addr, size : 2048 MiB DRAM
+		 * should be corrected by bootloader
+		 */
+		reg = <0 0x80000000 0 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux_cma: linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0 0x28000000>;
+			alloc-ranges = <0 0x80000000 0 0x80000000>;
+			linux,cma-default;
+		};
+
+		vpu_boot: vpu_boot@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
+	};
+
+	clk_dp: clk-dp {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	clk_xtal25: clk-xtal25 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	/* Controlled by system manager */
+	reg_sdvmmc: regulator-sdvmmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sdvmmc>;
+		regulator-name = "SDIO_PWR_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		status = "disabled";
+	};
+};
+
+&enetc_port0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+};
+
+&enetc_port1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enetc1>;
+	phy-handle = <&ethphy3>;
+	phy-mode = "rgmii-id";
+};
+
+&netc_timer {
+	status = "okay";
+};
+
+&flexspi1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_flexspi1>;
+	pinctrl-1 = <&pinctrl_flexspi1>;
+	status = "okay";
+
+	flash0: flash@0 {
+		reg = <0>;
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <80000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		vcc-supply = <&reg_1v8>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
+
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio1>;
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "GPIO7", "GPIO8",
+			  "", "GPIO9", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio2>;
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "SLEEP", "GPIO5",
+			  "", "", "GPIO6", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&lpi2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-1 = <&pinctrl_lpi2c1>;
+	status = "okay";
+
+	tmp1075: temperature-sensor@4a {
+		compatible = "ti,tmp1075";
+		reg = <0x4a>;
+		vs-supply = <&reg_1v8>;
+	};
+
+	eeprom_smarc: eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&reg_1v8>;
+	};
+
+	pcf85063: rtc@51 {
+		compatible = "nxp,pcf85063a";
+		reg = <0x51>;
+		quartz-load-femtofarads = <7000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcf85063>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	m24c64: eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+		pagesize = <32>;
+		vcc-supply = <&reg_1v8>;
+	};
+
+	/* protectable identification memory (part of M24C64-D @50) */
+	eeprom@58 {
+		compatible = "atmel,24c64d-wl";
+		reg = <0x58>;
+		vcc-supply = <&reg_1v8>;
+	};
+
+	/* protectable identification memory (part of M24C64-D @54) */
+	eeprom@5c {
+		compatible = "atmel,24c64d-wl";
+		reg = <0x5c>;
+		vcc-supply = <&reg_1v8>;
+	};
+
+	pcieclk: clock-generator@6a {
+		compatible = "renesas,9fgv0441";
+		reg = <0x6a>;
+		clocks = <&clk_xtal25>;
+		#clock-cells = <1>;
+	};
+
+	imu@6b {
+		compatible = "st,ism330dhcx";
+		reg = <0x6b>;
+		vdd-supply = <&reg_3v3>;
+		vddio-supply = <&reg_3v3>;
+	};
+
+	/* D23 */
+	expander2: gpio@74 {
+		compatible = "ti,tca9539";
+		reg = <0x74>;
+		vcc-supply = <&reg_1v8>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "GPIO4", "LCD0_BLKT_EN", "LCD0_VDD_EN", "LCD1_BLKT_EN",
+				  "LCD1_VDD_EN", "ENET1_RESET#", "ENET2_RESET#", "GBE0_SDP_DIR",
+				  "GBE1_SDP_DIR", "PCIE1_RST#", "PCIE2_RST#", "DP_BRIDGE_EN",
+				  "HUB_RST#", "QSPI_RESET#", "PCIE1_CLK_EN", "PCIE2_CLK_EN";
+	};
+
+	/* D21 */
+	expander1: gpio@75 {
+		compatible = "ti,tca9539";
+		reg = <0x75>;
+		vcc-supply = <&reg_1v8>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_expander1>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+		gpio-line-names = "GPIO10", "GPIO11", "GPIO12", "GPIO13",
+				  "CHG_PRSNT#", "CHARGING", "LID", "BATLOW#",
+				  "TEMP_EVENT#", "PGOOD_ARM", "PGOOD_SOC", "PCIE_WAKE#_1V8",
+				  "GPIO0", "GPIO1", "GPIO2", "GPIO3";
+	};
+};
+
+/* I2C_CAM0 */
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3>;
+	status = "okay";
+
+	dp_bridge: dp-bridge@f {
+		compatible = "toshiba,tc9595", "toshiba,tc358767";
+		reg = <0x0f>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_tc9595>;
+		clock-names = "ref";
+		clocks = <&clk_dp>;
+		reset-gpios = <&expander2 11 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+		toshiba,hpd-pin = <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dp_dsi_in: endpoint {
+					// TODO: DSI out
+					data-lanes = <1 2 3 4>;
+				};
+			};
+		};
+	};
+};
+
+/* I2C_CAM1 */
+&lpi2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c4>;
+	pinctrl-1 = <&pinctrl_lpi2c4>;
+	status = "okay";
+};
+
+/* I2C_LCD */
+&lpi2c6 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c6>;
+	pinctrl-1 = <&pinctrl_lpi2c6>;
+	status = "okay";
+};
+
+/* SER0 */
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart1>;
+};
+
+/* SER3 */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart5>;
+};
+
+/* SER1 */
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart7>;
+};
+
+/* SER2 */
+&lpuart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart8>;
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio>;
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ethphy0>;
+		reset-gpios = <&expander2 5 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <500000>;
+		reset-deassert-us = <50000>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,dp83867-rxctrl-strap-quirk;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+	};
+
+	ethphy3: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <3>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ethphy3>;
+		reset-gpios = <&expander2 6 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <500000>;
+		reset-deassert-us = <50000>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,dp83867-rxctrl-strap-quirk;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+	};
+};
+
+&scmi_bbm {
+	linux,code = <KEY_POWER>;
+};
+
+&tpm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm3>;
+};
+
+&tpm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm4>;
+};
+
+&tpm5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm5>;
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb451,8142";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&expander2 12 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_3v3>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb451,8140";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&expander2 12 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_3v3>;
+	};
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&wdog3 {
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_ethphy0: ethphy0grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13				0x1100>;
+	};
+
+	pinctrl_ethphy3: ethphy3grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14				0x1100>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x1100>,
+			   <IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x1100>,
+			   <IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x1100>,
+			   <IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x1100>,
+			   <IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK		0x1100>,
+			   <IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x1100>,
+			   <IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x11e>,
+			   <IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x11e>,
+			   <IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x11e>,
+			   <IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x11e>,
+			   <IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK		0x11e>,
+			   <IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x11e>,
+			   <IMX95_PAD_GPIO_IO23__GPIO2_IO_BIT23				0x51e>;
+	};
+
+	pinctrl_enetc1: enetc1grp {
+		fsl,pins = <IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0		0x1100>,
+			   <IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1		0x1100>,
+			   <IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2		0x1100>,
+			   <IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3		0x1100>,
+			   <IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK		0x1100>,
+			   <IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x1100>,
+			   <IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x11e>,
+			   <IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x11e>,
+			   <IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x11e>,
+			   <IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x11e>,
+			   <IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK		0x11e>,
+			   <IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x11e>,
+			   <IMX95_PAD_GPIO_IO24__GPIO2_IO_BIT24				0x51e>;
+	};
+
+	pinctrl_expander1: expander1grp {
+		fsl,pins = <IMX95_PAD_CCM_CLKO2__GPIO3_IO_BIT27				0x1100>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_CAN1_RX	0x1300>,
+			   <IMX95_PAD_PDM_CLK__AONMIX_TOP_CAN1_TX		0x31e>;
+	};
+
+	pinctrl_flexcan3: flexcan3grp {
+		fsl,pins = <IMX95_PAD_CCM_CLKO3__CAN3_TX		0x31e>,
+			   <IMX95_PAD_CCM_CLKO4__CAN3_RX		0x1300>;
+	};
+
+	pinctrl_flexspi1: flexspi1grp {
+		fsl,pins = <IMX95_PAD_SD3_CLK__FLEXSPI1_A_SCLK		0x11e>,
+			   <IMX95_PAD_SD3_CMD__FLEXSPI1_A_SS0_B		0x11e>,
+			   <IMX95_PAD_SD3_DATA0__FLEXSPI1_A_DATA_BIT0	0x11e>,
+			   <IMX95_PAD_SD3_DATA1__FLEXSPI1_A_DATA_BIT1	0x11e>,
+			   <IMX95_PAD_SD3_DATA2__FLEXSPI1_A_DATA_BIT2	0x11e>,
+			   <IMX95_PAD_SD3_DATA3__FLEXSPI1_A_DATA_BIT3	0x11e>;
+	};
+
+	pinctrl_gpio1: gpio1grp {
+		fsl,pins = <IMX95_PAD_PDM_BIT_STREAM1__AONMIX_TOP_GPIO1_IO_BIT10	0x111e>,
+			   <IMX95_PAD_SAI1_TXD0__AONMIX_TOP_GPIO1_IO_BIT13		0x111e>,
+			   <IMX95_PAD_SAI1_TXFS__AONMIX_TOP_GPIO1_IO_BIT11		0x111e>;
+	};
+
+	pinctrl_gpio2: gpio2grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO18__GPIO2_IO_BIT18		0x1100>,
+			   <IMX95_PAD_GPIO_IO19__GPIO2_IO_BIT19		0x111e>,
+			   <IMX95_PAD_GPIO_IO22__GPIO2_IO_BIT22		0x111e>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <IMX95_PAD_I2C1_SCL__AONMIX_TOP_LPI2C1_SCL		0x4000191e>,
+			   <IMX95_PAD_I2C1_SDA__AONMIX_TOP_LPI2C1_SDA		0x4000191e>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO28__LPI2C3_SDA			0x4000191e>,
+			   <IMX95_PAD_GPIO_IO29__LPI2C3_SCL			0x4000191e>;
+	};
+
+	pinctrl_lpi2c4: lpi2c4grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO30__LPI2C4_SDA             0x4000191e>,
+			   <IMX95_PAD_GPIO_IO31__LPI2C4_SCL             0x4000191e>;
+	};
+
+	pinctrl_lpi2c6: lpi2c6grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO02__LPI2C6_SDA             0x4000191e>,
+			   <IMX95_PAD_GPIO_IO03__LPI2C6_SCL             0x4000191e>;
+	};
+
+	pinctrl_lpspi3: lpspi3grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO07__GPIO2_IO_BIT7		0x51e>,
+			   <IMX95_PAD_GPIO_IO08__GPIO2_IO_BIT8		0x51e>,
+			   <IMX95_PAD_GPIO_IO09__LPSPI3_SIN		0x51e>,
+			   <IMX95_PAD_GPIO_IO10__LPSPI3_SOUT		0x51e>,
+			   <IMX95_PAD_GPIO_IO11__LPSPI3_SCK		0x51e>;
+	};
+
+	pinctrl_lpuart1: lpuart1grp {
+		fsl,pins = <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x1300>,
+			   <IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e>,
+			   <IMX95_PAD_UART2_TXD__AONMIX_TOP_LPUART1_RTS_B	0x1300>,
+			   <IMX95_PAD_UART2_RXD__AONMIX_TOP_LPUART1_CTS_B	0x31e>;
+	};
+
+	pinctrl_lpuart5: lpuart5grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO00__LPUART5_TX			0x31e>,
+			   <IMX95_PAD_GPIO_IO01__LPUART5_RX			0x1300>;
+	};
+
+	pinctrl_lpuart7: lpuart7grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO36__LPUART7_TX			0x31e>,
+			   <IMX95_PAD_GPIO_IO37__LPUART7_RX			0x1300>;
+	};
+
+	pinctrl_lpuart8: lpuart8grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO12__LPUART8_TX			0x31e>,
+			   <IMX95_PAD_GPIO_IO13__LPUART8_RX			0x1300>,
+			   <IMX95_PAD_GPIO_IO14__LPUART8_CTS_B			0x31e>,
+			   <IMX95_PAD_GPIO_IO15__LPUART8_RTS_B			0x1300>;
+	};
+
+	pinctrl_mdio: mdiogrp {
+		fsl,pins = <IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x51e>,
+			   <IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x51e>;
+	};
+
+	pinctrl_pcf85063: pcf85063grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO27__GPIO2_IO_BIT27			0x1100>;
+	};
+
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B	0x111e>;
+	};
+
+	pinctrl_pcie1: pcie1grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO35__HSIOMIX_TOP_PCIE2_CLKREQ_B	0x111e>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO16__SAI3_TX_BCLK			0x51e>,
+			   <IMX95_PAD_GPIO_IO17__SAI3_MCLK			0x51e>,
+			   <IMX95_PAD_GPIO_IO20__SAI3_RX_DATA_BIT0		0x1300>,
+			   <IMX95_PAD_GPIO_IO21__SAI3_TX_DATA_BIT0		0x51e>,
+			   <IMX95_PAD_GPIO_IO26__SAI3_TX_SYNC			0x51e>;
+	};
+
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <IMX95_PAD_XSPI1_DATA4__SAI5_TX_DATA_BIT0		0x51e>,
+			   <IMX95_PAD_XSPI1_DATA5__SAI5_TX_SYNC			0x51e>,
+			   <IMX95_PAD_XSPI1_DATA6__SAI5_TX_BCLK			0x51e>,
+			   <IMX95_PAD_XSPI1_DATA7__SAI5_RX_DATA_BIT0		0x1300>;
+	};
+
+	pinctrl_sdvmmc: sdvmmcgrp {
+		fsl,pins = <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x11e>;
+	};
+
+	pinctrl_tc9595: tc9595grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO25__GPIO2_IO_BIT25			0x1500>;
+	};
+
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO04__TPM3_CH0			0x51e>;
+	};
+
+	pinctrl_tpm4: tpm4grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO05__TPM4_CH0			0x51e>;
+	};
+
+	pinctrl_tpm5: tpm4grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO06__TPM5_CH0			0x51e>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x158e>,
+			   <IMX95_PAD_SD1_CMD__USDHC1_CMD	0x138e>,
+			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0	0x138e>,
+			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1	0x138e>,
+			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2	0x138e>,
+			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3	0x138e>,
+			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4	0x138e>,
+			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5	0x138e>,
+			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6	0x138e>,
+			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7	0x138e>,
+			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE	0x158e>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x158e>,
+			   <IMX95_PAD_SD1_CMD__USDHC1_CMD	0x138e>,
+			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0	0x138e>,
+			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1	0x138e>,
+			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2	0x138e>,
+			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3	0x138e>,
+			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4	0x138e>,
+			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5	0x138e>,
+			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6	0x138e>,
+			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7	0x138e>,
+			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE	0x158e>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x15fe>,
+			   <IMX95_PAD_SD1_CMD__USDHC1_CMD	0x13fe>,
+			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0	0x13fe>,
+			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1	0x13fe>,
+			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2	0x13fe>,
+			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3	0x13fe>,
+			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4	0x13fe>,
+			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5	0x13fe>,
+			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6	0x13fe>,
+			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe>,
+			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x1100>,
+			   <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x51e>,
+			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x31e>,
+			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x131e>,
+			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x131e>,
+			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x131e>,
+			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x131e>,
+			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x1100>,
+			   <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e>,
+			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e>,
+			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e>,
+			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e>,
+			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e>,
+			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e>,
+			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x1100>,
+			   <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x15fe>,
+			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x13fe>,
+			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x13fe>,
+			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x13fe>,
+			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x13fe>,
+			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x13fe>,
+			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
+	};
+};
-- 
2.43.0


