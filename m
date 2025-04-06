Return-Path: <linux-renesas-soc+bounces-15423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4677AA7CE86
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Apr 2025 16:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73AEE3B0CA9
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Apr 2025 14:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD56821B19D;
	Sun,  6 Apr 2025 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VQIsi3y2";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WlU5PGls"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4291421ADDB;
	Sun,  6 Apr 2025 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743950967; cv=none; b=DlXqlnqRUjpsOSel9Yqo50q60rc8pJ1cQUAhoHh1qMjEFedYYGZoY75ewtaijjHWhi1lXnjz46zjnBJE17tOAWf5Di2u0TuUfJEhJ4ZzbSaUKCk+LwqAvag086Gg5eZRaqxV6/muu/lamI5LiYh31oLghLo2/QLmsQ2CdWJlLuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743950967; c=relaxed/simple;
	bh=VAPG95JjWvWwAvaJ4TeleL2nbuFIBlKALU8dFZRKLsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YdBfqNJTL+gQVIJ7NdgpkcCEiLkZmGcnPi3gH/9JyoEN7qZT6KXYIekmYixQP/S5NcF9bg3IjjKF25JnFKzpd6TVwLtJZtLKGQCGlEu21IgA9Oa6sbU/RLZqTiZeKkxPYBCwtDoLFDz3XhJUK3u6VzXUOQm4qRJ1N0zgPEBYo50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VQIsi3y2; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WlU5PGls; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZVwGN6Qm2z9t3B;
	Sun,  6 Apr 2025 16:49:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743950956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A3b/XIF0PJ90Q4tX/J4m+YV/IjnKoOJFKE8s5E9IIck=;
	b=VQIsi3y2jwNXoWFqwHQxFhy+GqkK9nkNkQindniAeZJn9W00X8ZUYGdYAozg2mRIRhiX7J
	ay/cdbtq8bqln5yG3V7DqQbrDreITKfkSUHRvhClClcakvOQp9Vl7in7GHd5FPQsjPbn4g
	1A3Zlcg6ucPdh4RUl1bQ5M346vEUyZ41xPa/EE9KL4Hb53IIEBBEoxqHF46U580KYgJdJ4
	W1caAki9i8U8qdwwQtKG9mI6Pn+vl/M6fjZcIHeGz0u+BdOo2C//moJSVKSFhnG7KENgVt
	ai8HY5Mpb8O3Vp4vBRgyTrjleTvHadz4RAknsLC/vCvrsEoMQQTzqtnP1wWUZw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743950954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A3b/XIF0PJ90Q4tX/J4m+YV/IjnKoOJFKE8s5E9IIck=;
	b=WlU5PGlsDArMxYBNHA6qvTKFewYRZPcW1IaLJ78oaeg9bKMVGEv7Xt0MpvzOI58jqwJNXU
	PBCiNiG2gs0klmJ9akcfL+Evzb+dTpPLUlBtvb1h512E2Hpbff/7mZufBTmXMIQJYLxBcB
	/hhmW62kZxO5zlLsm78G36uLfGGj65EnLlOwuYrlAq4W87NLevBJqZiPnonvbJJXMMiiB8
	sO1DEC2h7LH4m9Z0/S8rbA0VCYDpLH96DNn66mvkypc1jZTkywV1GaTuLtmrCX3KkYXhM8
	HvQNYyGPs4wLTOMG9g9rgKxSxNQ4RzO1YPrWhoLWv9zZMlKVdZyPjlbxMxCe7Q==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support
Date: Sun,  6 Apr 2025 16:45:24 +0200
Message-ID: <20250406144822.21784-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0f00a90f29f97f1e66e
X-MBO-RS-META: shum6gw787say6jdziwpfm9rcg1gfr8z

Add Retronix R-Car V4H Sparrow Hawk board based on Renesas R-Car V4H ES3.0
(R8A779G3) SoC. This is a single-board computer with single gigabit ethernet,
DSI-to-eDP bridge, DSI and two CSI2 interfaces, audio codec, two CANFD ports,
micro SD card slot, USB PD supply, USB 3.0 ports, M.2 Key-M slot for NVMe SSD,
debug UART and JTAG.

Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: "Rafał Miłecki" <rafal@milecki.pl>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Junhao Xie <bigfoot@classfun.cn>
Cc: Kever Yang <kever.yang@rock-chips.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Add TB from Morimoto-san
    - Enable pwm-fan and set PWM to full by default, to achieve maximum
      cooling effect unless configured otherwise. The blower fan is user
      supplied device, hence this default.
    - Add arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
      to demonstrate user supplied blower fan configuration.
    - Add TB from Niklas
    - Rename pins{_,-}mdio, pins{_,-}mii, scif{_,-}clk, sd{_,-}uhs
    - Add serial1 = &hscif1; and serial2 = &hscif3
    - Rename {Renesas,Retronix} R-Car V4H Sparrow Hawk in commit message
      and update R-Car V4H ES3.0 to Renesas R-Car V4H ES3.0
---
 arch/arm64/boot/dts/renesas/Makefile          |   4 +
 .../r8a779g3-sparrow-hawk-fan-pwm.dtso        |  43 ++
 .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 685 ++++++++++++++++++
 3 files changed, 732 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d25e665ee4bfb..abf3df588092c 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -94,6 +94,10 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single.dtb
 r8a779g2-white-hawk-single-ard-audio-da7212-dtbs := r8a779g2-white-hawk-single.dtb white-hawk-ard-audio-da7212.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
 
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
+r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
+
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single.dtb
 r8a779g3-white-hawk-single-ard-audio-da7212-dtbs := r8a779g3-white-hawk-single.dtb white-hawk-ard-audio-da7212.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single-ard-audio-da7212.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
new file mode 100644
index 0000000000000..50d53c8d76c5b
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for the PWM controlled blower fan in connector J3:FAN
+ * on R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2025 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ *
+ * Example usage:
+ *
+ * # Localize hwmon sysfs directory that matches the PWM fan,
+ * # enable the PWM fan, and configure the fan speed manually.
+ * r8a779g3-sparrow-hawk$ grep -H . /sys/class/hwmon/hwmon?/name
+ * /sys/class/hwmon/hwmon0/name:sensor1_thermal
+ * /sys/class/hwmon/hwmon1/name:sensor2_thermal
+ * /sys/class/hwmon/hwmon2/name:sensor3_thermal
+ * /sys/class/hwmon/hwmon3/name:sensor4_thermal
+ * /sys/class/hwmon/hwmon4/name:pwmfan
+ *                       ^      ^^^^^^
+ *
+ * # Select mode 2 , enable fan PWM and regulator and keep them enabled.
+ * # For details, see Linux Documentation/hwmon/pwm-fan.rst
+ * r8a779g3-sparrow-hawk$ echo 2 > /sys/class/hwmon/hwmon4/pwm1_enable
+ *
+ * # Configure PWM fan speed in range 0..255 , 0 is stopped , 255 is full speed .
+ * # Fan speed 101 is about 2/5 of the PWM fan speed:
+ * r8a779g3-sparrow-hawk$ echo 101 > /sys/class/hwmon/hwmon4/pwm1
+ */
+
+/dts-v1/;
+/plugin/;
+
+/*
+ * Override default PWM fan settings. For a list of available properties,
+ * see schema Documentation/devicetree/bindings/hwmon/pwm-fan.yaml .
+ */
+&fan {
+	/* Available cooling levels */
+	cooling-levels = <0 50 100 150 200 255>;
+	/* Four pulses of tacho signal per one revolution */
+	pulses-per-revolution = <4>;
+	/* PWM period: 100us ~= 10 kHz */
+	pwms = <&pwm0 0 100000>;
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
new file mode 100644
index 0000000000000..b54d45115a856
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -0,0 +1,685 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2025 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+
+#include "r8a779g3.dtsi"
+
+/ {
+	model = "Retronix Sparrow Hawk board based on r8a779g3";
+	compatible = "retronix,sparrow-hawk", "renesas,r8a779g3",
+		     "renesas,r8a779g0";
+
+	aliases {
+		ethernet0 = &avb0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		serial0 = &hscif0;
+		serial1 = &hscif1;
+		serial2 = &hscif3;
+		spi0 = &rpc;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
+		stdout-path = "serial0:921600n8";
+	};
+
+	/* Page 31 / FAN */
+	fan: pwm-fan {
+		pinctrl-0 = <&irq4_pins>;
+		pinctrl-names = "default";
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		interrupts-extended = <&intc_ex 4 IRQ_TYPE_EDGE_FALLING>;
+		/*
+		 * The fan model connected to this device can be selected
+		 * by user. Set "cooling-levels" DT property to single 255
+		 * entry to force the fan PWM into constant HIGH, which
+		 * forces the fan to spin at maximum RPM, thus providing
+		 * maximum cooling to this device and protection against
+		 * misconfigured PWM duty cycle to the fan.
+		 *
+		 * User has to configure "pwms" and "pulses-per-revolution"
+		 * DT properties according to fan datasheet first, and then
+		 * extend "cooling-levels = <0 m n ... 255>" property to
+		 * achieve proper fan control compatible with fan model
+		 * installed by user.
+		 */
+		cooling-levels = <255>;
+		pulses-per-revolution = <2>;
+		pwms = <&pwm0 0 50000>;
+	};
+
+	/*
+	 * Page 15 / LPDDR5
+	 *
+	 * This configuration listed below is for the 8 GiB board variant
+	 * with MT62F1G64D8EK-023 WT:C LPDDR5 part populated on the board.
+	 *
+	 * A variant with 16 GiB MT62F2G64D8EK-023 WT:C part populated on
+	 * the board is automatically handled by the bootloader, which
+	 * adjusts the correct DRAM size into the memory nodes below.
+	 */
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	memory@480000000 {
+		device_type = "memory";
+		reg = <0x4 0x80000000 0x0 0x80000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x1 0x00000000>;
+	};
+
+	/* Page 27 / DSI to Display */
+	mini-dp-con {
+		compatible = "dp-connector";
+		label = "CN6";
+		type = "full-size";
+
+		port {
+			mini_dp_con_in: endpoint {
+				remote-endpoint = <&sn65dsi86_out>;
+			};
+		};
+	};
+
+	reg_1p2v: regulator-1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	/* Page 27 / DSI to Display */
+	sn65dsi86_refclk: clk-x9 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <38400000>;
+	};
+
+	/* Page 26 / PCIe.0/1 CLK */
+	pcie_refclk: clk-x8 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
+	/* Page 17 uSD-Slot */
+	vcc_sdhi: regulator-vcc-sdhi {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio8 13 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 0>, <1800000 1>;
+	};
+};
+
+/* Page 22 / Ether_AVB0 */
+&avb0 {
+	pinctrl-0 = <&avb0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&avb0_phy>;
+	tx-internal-delay-ps = <2000>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		avb0_phy: ethernet-phy@0 {	/* KSZ9031RNXVB */
+			compatible = "ethernet-phy-id0022.1622",
+				     "ethernet-phy-ieee802.3-c22";
+			rxc-skew-ps = <1500>;
+			reg = <0>;
+			/* AVB0_PHY_INT_V */
+			interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
+			/* GP7_10/AVB0_RESETN_V */
+			reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <300>;
+		};
+	};
+};
+
+/* Page 28 / CANFD_IF */
+&can_clk {
+	clock-frequency = <40000000>;
+};
+
+/* Page 28 / CANFD_IF */
+&canfd {
+	pinctrl-0 = <&canfd3_pins>, <&canfd4_pins>, <&can_clk_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	channel3 {
+		status = "okay";
+	};
+
+	channel4 {
+		status = "okay";
+	};
+};
+
+/* Page 27 / DSI to Display */
+&dsi1 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			dsi1_out: endpoint {
+				remote-endpoint = <&sn65dsi86_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+/* Page 27 / DSI to Display */
+&du {
+	status = "okay";
+};
+
+/* Page 5 / R-Car V4H_INT_I2C */
+&extal_clk {	/* X3 */
+	clock-frequency = <16666666>;
+};
+
+/* Page 5 / R-Car V4H_INT_I2C */
+&extalr_clk {	/* X2 */
+	clock-frequency = <32768>;
+};
+
+/* Page 26 / 2230 Key M M.2 */
+&gpio4 {
+	/* 9FGV0441 nOE inputs 0 and 1 */
+	pcie-m2-oe-hog {
+		gpio-hog;
+		gpios = <21 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "PCIe-CLK-nOE-M2";
+	};
+
+	/* 9FGV0441 nOE inputs 2 and 3 */
+	pcie-usb-oe-hog {
+		gpio-hog;
+		gpios = <22 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "PCIe-CLK-nOE-USB";
+	};
+};
+
+/* Page 23 / DEBUG */
+&hscif0 {	/* FTDI ADBUS[3:0] */
+	pinctrl-0 = <&hscif0_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	bootph-all;
+
+	status = "okay";
+};
+
+/* Page 23 / DEBUG */
+&hscif1 {	/* FTDI BDBUS[3:0] */
+	pinctrl-0 = <&hscif1_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	status = "okay";
+};
+
+/* Page 24 / UART */
+&hscif3 {	/* CN7 pins 8 (TX) and 10 (RX) */
+	pinctrl-0 = <&hscif3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+/* Page 24 / I2C SWITCH */
+&i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+
+	mux@71 {
+		compatible = "nxp,pca9544";	/* TCA9544 */
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		vdd-supply = <&reg_3p3v>;
+
+		i2c0_mux0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* Page 27 / DSI to Display */
+			bridge@2c {
+				pinctrl-0 = <&irq0_pins>;
+				pinctrl-names = "default";
+
+				compatible = "ti,sn65dsi86";
+				reg = <0x2c>;
+
+				clocks = <&sn65dsi86_refclk>;
+				clock-names = "refclk";
+
+				interrupts-extended = <&intc_ex 0 IRQ_TYPE_LEVEL_HIGH>;
+
+				enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+
+				vccio-supply = <&reg_1p8v>;
+				vpll-supply = <&reg_1p8v>;
+				vcca-supply = <&reg_1p2v>;
+				vcc-supply = <&reg_1p2v>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						sn65dsi86_in: endpoint {
+							remote-endpoint = <&dsi1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						sn65dsi86_out: endpoint {
+							remote-endpoint = <&mini_dp_con_in>;
+						};
+					};
+				};
+			};
+		};
+
+		i2c0_mux1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c0_mux2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* Page 26 / PCIe.0/1 CLK */
+			pcie_clk: clk@68 {
+				compatible = "renesas,9fgv0441";
+				reg = <0x68>;
+				clocks = <&pcie_refclk>;
+				#clock-cells = <1>;
+			};
+		};
+
+		i2c0_mux3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+/* Page 29 / CSI_IF_CN / CAM_CN0 */
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+};
+
+/* Page 29 / CSI_IF_CN / CAM_CN1 */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+};
+
+/* Page 31 / IO_CN */
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+};
+
+/* Page 31 / IO_CN */
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-names = "default";
+};
+
+/* Page 18 / POWER_CORE and Page 19 / POWER_PMIC */
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-0 = <&i2c5_pins>;
+	pinctrl-names = "default";
+};
+
+/* Page 17 uSD-Slot */
+&mmc0 {
+	pinctrl-0 = <&sd_pins>;
+	pinctrl-1 = <&sd_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+	bus-width = <4>;
+	cd-gpios = <&gpio3 11 GPIO_ACTIVE_LOW>;	/* SD_CD */
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vcc_sdhi>;
+	status = "okay";
+};
+
+/* Page 26 / 2230 Key M M.2 */
+&pcie0_clkref {
+	status = "disabled";
+};
+
+&pciec0 {
+	clocks = <&cpg CPG_MOD 624>, <&pcie_clk 0>, <&pcie_clk 1>;
+	clock-names = "core", "ref", "aux";
+	reset-gpios = <&gpio2 2 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+/* Page 25 / PCIe to USB */
+&pcie1_clkref {
+	status = "disabled";
+};
+
+&pciec1 {
+	clocks = <&cpg CPG_MOD 625>, <&pcie_clk 2>, <&pcie_clk 3>;
+	clock-names = "core", "ref", "aux";
+	/* uPD720201 is PCIe Gen2 x1 device */
+	num-lanes = <1>;
+	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pfc {
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
+	/* Page 22 / Ether_AVB0 */
+	avb0_pins: avb0 {
+		mux {
+			groups = "avb0_link", "avb0_mdio", "avb0_rgmii",
+				 "avb0_txcrefclk";
+			function = "avb0";
+		};
+
+		pins-mdio {
+			groups = "avb0_mdio";
+			drive-strength = <21>;
+		};
+
+		pins-mii {
+			groups = "avb0_rgmii";
+			drive-strength = <21>;
+		};
+
+	};
+
+	/* Page 28 / CANFD_IF */
+	can_clk_pins: can-clk {
+		groups = "can_clk";
+		function = "can_clk";
+	};
+
+	/* Page 28 / CANFD_IF */
+	canfd3_pins: canfd3 {
+		groups = "canfd3_data";
+		function = "canfd3";
+	};
+
+	/* Page 28 / CANFD_IF */
+	canfd4_pins: canfd4 {
+		groups = "canfd4_data";
+		function = "canfd4";
+	};
+
+	/* Page 23 / DEBUG */
+	hscif0_pins: hscif0 {
+		groups = "hscif0_data", "hscif0_ctrl";
+		function = "hscif0";
+	};
+
+	/* Page 23 / DEBUG */
+	hscif1_pins: hscif1 {
+		groups = "hscif1_data_a", "hscif1_ctrl_a";
+		function = "hscif1";
+	};
+
+	/* Page 24 / UART */
+	hscif3_pins: hscif3 {
+		groups = "hscif3_data_a";
+		function = "hscif3";
+	};
+
+	/* Page 24 / I2C SWITCH */
+	i2c0_pins: i2c0 {
+		groups = "i2c0";
+		function = "i2c0";
+	};
+
+	/* Page 29 / CSI_IF_CN / CAM_CN0 */
+	i2c1_pins: i2c1 {
+		groups = "i2c1";
+		function = "i2c1";
+	};
+
+	/* Page 29 / CSI_IF_CN / CAM_CN1 */
+	i2c2_pins: i2c2 {
+		groups = "i2c2";
+		function = "i2c2";
+	};
+
+	/* Page 31 / IO_CN */
+	i2c3_pins: i2c3 {
+		groups = "i2c3";
+		function = "i2c3";
+	};
+
+	/* Page 31 / IO_CN */
+	i2c4_pins: i2c4 {
+		groups = "i2c4";
+		function = "i2c4";
+	};
+
+	/* Page 18 / POWER_CORE */
+	i2c5_pins: i2c5 {
+		groups = "i2c5";
+		function = "i2c5";
+	};
+
+	/* Page 27 / DSI to Display */
+	irq0_pins: irq0 {
+		groups = "intc_ex_irq0_a";
+		function = "intc_ex";
+	};
+
+	/* Page 31 / FAN */
+	irq4_pins: irq4 {
+		groups = "intc_ex_irq4_b";
+		function = "intc_ex";
+	};
+
+	/* Page 31 / FAN */
+	pwm0_pins: pwm0 {
+		groups = "pwm0";
+		function = "pwm0";
+	};
+
+	/* Page 31 / CN7 pin 12 */
+	pwm1_pins: pwm1 {
+		groups = "pwm1_b";
+		function = "pwm1";
+	};
+
+	/* Page 31 / CN7 pin 32 */
+	pwm6_pins: pwm6 {
+		groups = "pwm6";
+		function = "pwm6";
+	};
+
+	/* Page 31 / CN7 pin 33 */
+	pwm7_pins: pwm7 {
+		groups = "pwm7";
+		function = "pwm7";
+	};
+
+	/* Page 16 / QSPI_FLASH */
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+		bootph-all;
+	};
+
+	/* Page 6 / SCIF_CLK_SOC_V */
+	scif_clk_pins: scif-clk {
+		groups = "scif_clk";
+		function = "scif_clk";
+	};
+
+	/* Page 17 uSD-Slot */
+	sd_pins: sd {
+		groups = "mmc_data4", "mmc_ctrl";
+		function = "mmc";
+		power-source = <3300>;
+	};
+
+	/* Page 17 uSD-Slot */
+	sd_uhs_pins: sd-uhs {
+		groups = "mmc_data4", "mmc_ctrl";
+		function = "mmc";
+		power-source = <1800>;
+	};
+};
+
+/* Page 31 / FAN */
+&pwm0 {
+	pinctrl-0 = <&pwm0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* Page 31 / CN7 pin 12 */
+&pwm1 {
+	pinctrl-0 = <&pwm1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* Page 31 / CN7 pin 32 */
+&pwm6 {
+	pinctrl-0 = <&pwm6_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* Page 31 / CN7 pin 33 */
+&pwm7 {
+	pinctrl-0 = <&pwm7_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* Page 16 / QSPI_FLASH */
+&rpc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+	bootph-all;
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		bootph-all;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			boot@0 {
+				reg = <0x0 0x1000000>;
+				read-only;
+			};
+
+			user@1000000 {
+				reg = <0x1000000 0x2f80000>;
+			};
+
+			env1@3f80000 {
+				reg = <0x3f80000 0x40000>;
+			};
+
+			env2@3fc0000 {
+				reg = <0x3fc0000 0x40000>;
+			};
+		};
+	};
+};
+
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
+/* Page 6 / SCIF_CLK_SOC_V */
+&scif_clk {	/* X12 */
+	clock-frequency = <24000000>;
+};
-- 
2.47.2


