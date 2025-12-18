Return-Path: <linux-renesas-soc+bounces-25896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BCBCCC8B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 16:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82804300442E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 15:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD3D34D3B9;
	Thu, 18 Dec 2025 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jVlA8rS3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay99-hz1.antispameurope.com (mx-relay99-hz1.antispameurope.com [94.100.132.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38EE33DEE6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072785; cv=pass; b=M3EtIktJDNASyEKsjX31KSC539J5Cerf8RNKGVlFRvLmRJZdP1425nZ6+8oIn7n3oDvxZtM893LeGtatsxWwkBxc88Anupcy9BS2jHXqOeB+C3PgIGRg1AW3zGzZEF3Zz2fEKpf3RSIyRF9HYtslUJA5BmEAUVhujPM3kcu49FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072785; c=relaxed/simple;
	bh=TjirjVRMeNN724W3cnJ8MpH4cln0KMXng+KgG/ZeZ/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5UawJ5yRu2K8OV+tcxvm7g1EjnemS7qMQpPynAI9ShvHxNqWmT49nlop7A8yTWKeP6Kx6sD82ELGJNZ6iJ+YYr5zUy25xs309tlmKFfun9P+xtwr0hxmVMWZW2dfO5tO+kmH8X0exCpeHLJiFJvRAXBIAhu4Bflcl+f05Mtp3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jVlA8rS3; arc=pass smtp.client-ip=94.100.132.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate99-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=k7TywXsty9WvrmnHMsjtMRzkHHELHfro4OivmozlV88=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766072686;
 b=Ez2McJrmIwElifwERHyS5oZ4nwdaa+2NjH6ZGWzt9+eKHfJWp3sx6suVsDrR1Rc5sp7737oj
 zQSMhA9EzFuIBvsMDRNOX5SU3o3Q29OIOOlRb5dMYm2x5t1M33knL170FHx2KNcrUVKDBuUEXtt
 22+67uHSE/vaCmHY3eXBzecSSExtQvA1xcJTBwsd2F3Y0JxWXjriKtLCK8w7lgAOi5lo+kui6iH
 X9Y8KjuWhiPileybmpzrDcgtpd9wNrRtERiO4/tvTIWaP3G6qTusDLr953UKlQIpFp1diVFwDvZ
 I1OnRZhpF/IBhXqEoI8U5n6U3tb4/OXMGITV5cVIVy5gg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766072686;
 b=G4LuIgtBitmHqB+RX8Ef48IyWj8WiTPuJhQeNedfljP+SPb6l5fXz0pmz0xJGLX6BMaKs829
 PJyQpL5SrzubEs3IF1lLEINmnUl9SIuMfLwsstddlc8Xmeij6lyWom5INoSegnvAdqNgkHV7PTj
 2h+y5iUtwAn7xI786/CFjEPHS8hVLS/dHWIKJNpYf9PmVbTJw6NqvswvxcTsJO7RqI2hMXOAklg
 KioYlHJG2xJ4zq4zgJlXoPK5OWRqXFXnA6JkyS2DF2Epp17tZfO+OCZzyv6xx08AWy0BHkFtN/z
 G28QH111CpRgo8lChuUqhb2/y4aJKmWENgYVfaAISZ30g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay99-hz1.antispameurope.com;
 Thu, 18 Dec 2025 16:44:46 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A4C8F220C31;
	Thu, 18 Dec 2025 16:44:23 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
Date: Thu, 18 Dec 2025 16:44:07 +0100
Message-ID: <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay99-hz1.antispameurope.com with 4dXFMr5zdzz1X6lj
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f7be90e32b4445bc325fe1cec35ca314
X-cloud-security:scantime:2.092
DKIM-Signature: a=rsa-sha256;
 bh=k7TywXsty9WvrmnHMsjtMRzkHHELHfro4OivmozlV88=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766072686; v=1;
 b=jVlA8rS3bdAx1LzR5alFLCrGJhQwn18CI6J8YZMLaxXu763laPdwHhsT8EBeNo8MaqhO//yN
 NQHgImKpxadiIghgbH0SgkF8u2VCyAUX7NOywN1KfoIUwJaK1skxjjd5HgQkhyAXOgVKs1RNcCb
 I88CXpgprUIp0Y6nv3EiXFsdhfSHFWRtl8CxADie7A2UbGtNuJ++f/B7/LKu5VgXzBX5PTHyURq
 sTPDlQE97ejR7sfm0KfaFwlBbu9PiRe4p1ktQJDWoSP9J9PIhJPDbSN0lqoBPFu8+NZaFJByi25
 sP7FZx/y/vDfJT/ySmXmYyckum7Szuz0DvDhfe5LBYS9Q==

* TQMa8QM on MBa8x

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 908 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 315 ++++++
 3 files changed, 1224 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index dabc84be0c2e8..72f151a0cccfd 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -344,6 +344,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
 
 imx8qm-mek-ov5640-csi0-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi0.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
new file mode 100644
index 0000000000000..ba19c3c17c496
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
@@ -0,0 +1,908 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/pwm/pwm.h>
+
+#include "imx8qm-tqma8qm.dtsi"
+
+/ {
+	model = "TQ-Systems i.MX8QM TQMa8QM on MBa8x";
+	compatible = "tq,imx8qm-tqma8qm-mba8x", "tq,imx8qm-tqma8qm", "fsl,imx8qm";
+
+	aliases {
+		rtc0 = &pcf85063;
+		rtc1 = &rtc;
+	};
+
+	chosen {
+		stdout-path = &lpuart0;
+	};
+
+	adc {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>;
+	};
+
+	clk_xtal25: clk-xtal25 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwmfan>;
+		fan-supply = <&reg_pwm_fan>;
+		#cooling-cells = <2>;
+		/* typical 25 kHz -> 40.000 nsec */
+		pwms = <&lsio_pwm3 0 40000 PWM_POLARITY_INVERTED>;
+		cooling-levels = <0 32 64 128 196 240>;
+		pulses-per-revolution = <2>;
+		interrupt-parent = <&lsio_gpio2>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+		status = "disabled";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpiokeys>;
+		autorepeat;
+
+		switch-1 {
+			label = "SWITCH_A";
+			linux,code = <BTN_0>;
+			gpios = <&lsio_gpio2 11 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		switch-2 {
+			label = "SWITCH_B";
+			linux,code = <BTN_1>;
+			gpios = <&lsio_gpio1 0 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpioled>;
+
+		user-led0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&lsio_gpio5 20 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		user-led1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&lsio_gpio5 19 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
+	reg_mba8x_v3v3: regulator-mba8x-v3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3_MB";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_mba8x_12v: regulator-mba8x-12v {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_mba8x_12v>;
+		regulator-name = "MBa8x-V12";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		enable-active-high;
+		gpio = <&lsio_gpio1 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_pwm_fan: regulator-pwm-fan {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_regpwmfan>;
+		regulator-name = "FAN_PWR";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&lsio_gpio2 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_mba8x_12v>;
+	};
+
+	reg_usb_phy: regulator-usb-phy {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3000000>;
+		regulator-min-microvolt = <3000000>;
+		regulator-name = "usb-phy-dummy";
+	};
+
+	reg_v1v5_pcie: regulator-v1v5-pcie {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_pcie_v1v5>;
+		regulator-name = "V_1V5_MPCIE";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		vin-supply = <&reg_mba8x_v3v3>;
+		enable-active-high;
+		gpio = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+	};
+
+	reg_vref_v1v8: regulator-vref-v1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREF_V1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_v1v8: regulator-v1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "MBa8x-V1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_v3v3_pcie: regulator-v3v3-pcie {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_pcie_v3v3>;
+		regulator-name = "V_3V3_MPCIE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_mba8x_v3v3>;
+		enable-active-high;
+		gpio = <&lsio_gpio1 1 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+	};
+
+	reg_v3v3_sd: regulator-v3v3-sd {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_v3v3_sd>;
+		regulator-name = "V3V3_SD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_mba8x_v3v3>;
+		gpio = <&lsio_gpio4 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		off-on-delay-us = <200000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		decoder_boot: decoder-boot@84000000 {
+			reg = <0 0x84000000 0 0x2000000>;
+			no-map;
+		};
+
+		encoder1_boot: encoder1-boot@86000000 {
+			reg = <0 0x86000000 0 0x200000>;
+			no-map;
+		};
+
+		encoder2_boot: encoder2-boot@86200000 {
+			reg = <0 0x86200000 0 0x200000>;
+			no-map;
+		};
+
+		decoder_rpc: decoder-rpc@92000000 {
+			reg = <0 0x92000000 0 0x100000>;
+			no-map;
+		};
+
+		encoder1_rpc: encoder1-rpc@92100000 {
+			reg = <0 0x92100000 0 0x700000>;
+			no-map;
+		};
+
+		encoder2_rpc: encoder1-rpc@92800000 {
+			reg = <0 0x92800000 0 0x700000>;
+			no-map;
+		};
+
+		/*
+		 * global autoconfigured region for contiguous allocations
+		 * must not exceed memory size and region
+		 */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0 0x3c000000>;
+			alloc-ranges = <0 0x96000000 0 0x3c000000>;
+			linux,cma-default;
+		};
+	};
+
+	sound {
+		compatible = "fsl,imx-audio-tlv320aic32x4";
+		model = "tqm-tlv320aic32";
+		ssi-controller = <&sai1>;
+		audio-codec = <&tlv320aic3x04>;
+		audio-routing =
+			"IN3_L", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"IN1_L", "Line In Jack",
+			"IN1_R", "Line In Jack",
+			"Line Out Jack", "LOL",
+			"Line Out Jack", "LOR";
+	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "imx-audio-dp";
+		audio-cpu = <&sai5>;
+		hdmi-out;
+	};
+
+	thermal-zones {
+		cpu0-thermal {
+			trips {
+				soc_active0_0: trip-active0 {
+					temperature = <40000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				soc_active0_1: trip-active1 {
+					temperature = <48000>;
+					hysteresis = <3000>;
+					type = "active";
+				};
+
+				soc_active0_2: trip-active2 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map1 {
+					trip = <&soc_active0_0>;
+					cooling-device = <&fan0 1 1>;
+				};
+
+				map2 {
+					trip = <&soc_active0_1>;
+					cooling-device = <&fan0 2 2>;
+				};
+
+				map3 {
+					trip = <&soc_active0_2>;
+					cooling-device = <&fan0 3 3>;
+				};
+			};
+		};
+
+		cpu1-thermal {
+			trips {
+				soc_active1_0: trip-active0 {
+					temperature = <40000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				soc_active1_1: trip-active1 {
+					temperature = <48000>;
+					hysteresis = <3000>;
+					type = "active";
+				};
+
+				soc_active1_2: trip-active2 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map1 {
+					trip = <&soc_active1_0>;
+					cooling-device = <&fan0 1 1>;
+				};
+
+				map2 {
+					trip = <&soc_active1_1>;
+					cooling-device = <&fan0 2 2>;
+				};
+
+				map3 {
+					trip = <&soc_active1_2>;
+					cooling-device = <&fan0 3 3>;
+				};
+			};
+		};
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy0>;
+	nvmem-cells = <&fec_mac0>;
+	nvmem-cell-names = "mac-address";
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ethphy0>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,dp83867-rxctrl-strap-quirk;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			reset-gpios = <&lsio_gpio2 6 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500000>;
+			reset-deassert-us = <50000>;
+			enet-phy-lane-no-swap;
+			interrupt-parent = <&lsio_gpio2>;
+			interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&fec2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec2>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy3>;
+	nvmem-cells = <&fec_mac1>;
+	nvmem-cell-names = "mac-address";
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy3: ethernet-phy@3 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ethphy3>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,dp83867-rxctrl-strap-quirk;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			reset-gpios = <&lsio_gpio2 4 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500000>;
+			reset-deassert-us = <50000>;
+			enet-phy-lane-no-swap;
+		};
+	};
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	xceiver-supply = <&reg_mba8x_v3v3>;
+	status = "okay";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	xceiver-supply = <&reg_mba8x_v3v3>;
+	status = "okay";
+};
+
+&hsio_phy {
+	fsl,hsio-cfg = "pciea-pcieb-sata";
+	fsl,refclk-pad-mode = "input";
+	status = "okay";
+};
+
+/* no refclock gating */
+&hsio_refa_clk {
+	status = "disabled";
+};
+
+&hsio_refb_clk {
+	status = "disabled";
+};
+
+&i2c1 {
+	tlv320aic3x04: audio-codec@18 {
+		compatible = "ti,tlv320aic32x4";
+		reg = <0x18>;
+		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "mclk";
+		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+				<&mclkout0_lpcg IMX_LPCG_CLK_0>;
+		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
+		ldoin-supply = <&reg_mba8x_v3v3>;
+		iov-supply = <&reg_v1v8>;
+	};
+
+	sensor1: temperature-sensor@1c {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x1c>;
+	};
+
+	eeprom2: eeprom@54 {
+		compatible = "nxp,se97b", "atmel,24c02";
+		reg = <0x54>;
+		pagesize = <16>;
+		vcc-supply = <&reg_mba8x_v3v3>;
+	};
+
+	pcieclk: clock-generator@68 {
+		compatible = "renesas,9fgv0441";
+		reg = <0x68>;
+		clocks = <&clk_xtal25>;
+		#clock-cells = <1>;
+		clock-output-names = "DIF0", "DIF1", "DIF2", "DIF3";
+	};
+};
+
+&lpspi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi0 &pinctrl_lpspi0_cs>;
+	cs-gpios = <&lsio_gpio3 5 GPIO_ACTIVE_LOW>, <&lsio_gpio3 6 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&lpspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi1 &pinctrl_lpspi1_cs>;
+	cs-gpios = <&lsio_gpio3 24 GPIO_ACTIVE_LOW>, <&lsio_gpio3 25 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&lpspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi2 &pinctrl_lpspi2_cs>;
+	cs-gpios = <&lsio_gpio3 10 GPIO_ACTIVE_LOW>, <&lsio_gpio3 11 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&lpuart0 { /* console */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart0>;
+	status = "okay";
+};
+
+&lpuart1 { /* X62 pin header */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart1>;
+	status = "okay";
+};
+
+&lpuart2 { /* mikroBUS */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart2>;
+	status = "okay";
+};
+
+&lsio_gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio2>;
+	gpio-line-names = "", "", "", "",
+			  "", "PCIE0_DISABLE#", "", "";
+
+	pcie0-wdisable1-hog {
+		gpio-hog;
+		gpios = <5 0>;
+		output-high;
+		line-name = "PCIE0_DISABLE#";
+	};
+
+	pcie-clk-pd-hog {
+		gpio-hog;
+		gpios = <10 0>;
+		output-high;
+		line-name = "PCIE_CLK_PD#";
+	};
+};
+
+&lsio_pwm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lsio_pwm3>;
+	status = "okay";
+};
+
+&pciea {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pciea>;
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	reset-gpio = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcieb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	phys = <&hsio_phy 1 PHY_TYPE_PCIE 1>;
+	phy-names = "pcie-phy";
+	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&phyx1_lpcg {
+	clocks = <&pcieclk 0>, <&hsio_per_clk>,
+		 <&pcieclk 0>, <&hsio_per_clk>;
+};
+
+&phyx2_lpcg {
+	clocks = <&pcieclk 0>, <&hsio_per_clk>,
+		 <&pcieclk 0>, <&hsio_per_clk>;
+};
+
+&sai1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai1>;
+	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+			  <&sai1_lpcg IMX_LPCG_CLK_0>;
+	assigned-clock-rates = <786432000>, <49152000>, <12288000>, <49152000>;
+	status = "okay";
+};
+
+&sai5 {
+	status = "okay";
+};
+
+&sai5_lpcg {
+	status = "okay";
+};
+
+&usbphy1 {
+	phy-3p0-supply = <&reg_usb_phy>;
+	status = "okay";
+};
+
+&usbotg1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg1>;
+	srp-disable;
+	hnp-disable;
+	adp-disable;
+	power-active-high;
+	over-current-active-low;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+&usbotg3 {
+	/* over-current disabled by default */
+	status = "okay";
+};
+
+&usbotg3_cdns3 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbhub>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb451,8142";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&lsio_gpio2 7 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_mba8x_v3v3>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb451,8140";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&lsio_gpio2 7 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_mba8x_v3v3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	bus-width = <4>;
+	cd-gpios = <&lsio_gpio5 22 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&lsio_gpio5 21 GPIO_ACTIVE_HIGH>;
+	vmmc-supply = <&reg_v3v3_sd>;
+	no-mmc;
+	no-sdio;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio>;
+
+	pinctrl_adc0: adc0grp {
+		fsl,pins = <IMX8QM_ADC_IN1_DMA_ADC0_IN1		0x02000060>,
+			   <IMX8QM_ADC_IN2_DMA_ADC0_IN2		0x02000060>;
+	};
+
+	pinctrl_ethphy0: ethphy0grp {
+		fsl,pins = <IMX8QM_ESAI1_SCKR_LSIO_GPIO2_IO06	0x00000041>,
+			   <IMX8QM_ESAI1_TX0_LSIO_GPIO2_IO08	0x00000021>;
+	};
+
+	pinctrl_ethphy3: ethphy3grp {
+		fsl,pins = <IMX8QM_ESAI1_FSR_LSIO_GPIO2_IO04	0x00000041>;
+	};
+
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <IMX8QM_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB_PAD		0x000014a0>,
+			   <IMX8QM_ENET0_MDC_CONN_ENET0_MDC			0x06000041>,
+			   <IMX8QM_ENET0_MDIO_CONN_ENET0_MDIO			0x06000041>,
+			   <IMX8QM_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CTL	0x00000041>,
+			   <IMX8QM_ENET0_RGMII_TXC_CONN_ENET0_RGMII_TXC		0x00000041>,
+			   <IMX8QM_ENET0_RGMII_TXD0_CONN_ENET0_RGMII_TXD0	0x00000041>,
+			   <IMX8QM_ENET0_RGMII_TXD1_CONN_ENET0_RGMII_TXD1	0x00000041>,
+			   <IMX8QM_ENET0_RGMII_TXD2_CONN_ENET0_RGMII_TXD2	0x00000041>,
+			   <IMX8QM_ENET0_RGMII_TXD3_CONN_ENET0_RGMII_TXD3	0x00000041>,
+			   <IMX8QM_ENET0_RGMII_RXC_CONN_ENET0_RGMII_RXC		0x00000040>,
+			   <IMX8QM_ENET0_RGMII_RX_CTL_CONN_ENET0_RGMII_RX_CTL	0x00000040>,
+			   <IMX8QM_ENET0_RGMII_RXD0_CONN_ENET0_RGMII_RXD0	0x00000040>,
+			   <IMX8QM_ENET0_RGMII_RXD1_CONN_ENET0_RGMII_RXD1	0x00000040>,
+			   <IMX8QM_ENET0_RGMII_RXD2_CONN_ENET0_RGMII_RXD2	0x00000040>,
+			   <IMX8QM_ENET0_RGMII_RXD3_CONN_ENET0_RGMII_RXD3	0x00000040>;
+	};
+
+	pinctrl_fec2: fec2grp {
+		fsl,pins = <IMX8QM_COMP_CTL_GPIO_1V8_3V3_ENET_ENETA_PAD		0x000014a0>,
+			   <IMX8QM_ENET1_MDC_CONN_ENET1_MDC			0x06000041>,
+			   <IMX8QM_ENET1_MDIO_CONN_ENET1_MDIO			0x06000041>,
+			   <IMX8QM_ENET1_RGMII_TX_CTL_CONN_ENET1_RGMII_TX_CTL	0x00000041>,
+			   <IMX8QM_ENET1_RGMII_TXC_CONN_ENET1_RGMII_TXC		0x00000041>,
+			   <IMX8QM_ENET1_RGMII_TXD0_CONN_ENET1_RGMII_TXD0	0x00000041>,
+			   <IMX8QM_ENET1_RGMII_TXD1_CONN_ENET1_RGMII_TXD1	0x00000041>,
+			   <IMX8QM_ENET1_RGMII_TXD2_CONN_ENET1_RGMII_TXD2	0x00000041>,
+			   <IMX8QM_ENET1_RGMII_TXD3_CONN_ENET1_RGMII_TXD3	0x00000041>,
+			   <IMX8QM_ENET1_RGMII_RXC_CONN_ENET1_RGMII_RXC		0x00000040>,
+			   <IMX8QM_ENET1_RGMII_RX_CTL_CONN_ENET1_RGMII_RX_CTL	0x00000040>,
+			   <IMX8QM_ENET1_RGMII_RXD0_CONN_ENET1_RGMII_RXD0	0x00000040>,
+			   <IMX8QM_ENET1_RGMII_RXD1_CONN_ENET1_RGMII_RXD1	0x00000040>,
+			   <IMX8QM_ENET1_RGMII_RXD2_CONN_ENET1_RGMII_RXD2	0x00000040>,
+			   <IMX8QM_ENET1_RGMII_RXD3_CONN_ENET1_RGMII_RXD3	0x00000040>;
+	};
+
+	pinctrl_flexcan1: flexcan0grp {
+		fsl,pins = <IMX8QM_FLEXCAN0_TX_DMA_FLEXCAN0_TX	0x00000021>,
+			   <IMX8QM_FLEXCAN0_RX_DMA_FLEXCAN0_RX	0x00000021>;
+	};
+
+	pinctrl_flexcan2: flexcan1grp {
+		fsl,pins = <IMX8QM_FLEXCAN1_TX_DMA_FLEXCAN1_TX	0x00000021>,
+			   <IMX8QM_FLEXCAN1_RX_DMA_FLEXCAN1_RX	0x00000021>;
+	};
+
+	pinctrl_gpio: pingpiogrp {
+		fsl,pins = /* GPIO0_05 on X62:26 */
+			   <IMX8QM_SIM0_GPIO0_00_LSIO_GPIO0_IO05	0x00000021>,
+			   /* GPIO1_14 on X64:21 */
+			   <IMX8QM_LVDS1_I2C1_SCL_LSIO_GPIO1_IO14	0x00000021>,
+			   /* GPIO1_15 on X64:23 */
+			   <IMX8QM_LVDS1_I2C1_SDA_LSIO_GPIO1_IO15	0x00000021>,
+			   /* GPIO2_17 on X63:37 */
+			   <IMX8QM_SPI3_SCK_LSIO_GPIO2_IO17		0x00000021>,
+			   /* GPIO2_21 on X63:39 */
+			   <IMX8QM_SPI3_CS1_LSIO_GPIO2_IO21		0x00000021>,
+			   /* GPIO4_12 on X61:24 */
+			   <IMX8QM_USDHC2_CD_B_LSIO_GPIO4_IO12		0x00000021>,
+			   /* GPIO4_11 on X61:26 */
+			   <IMX8QM_USDHC2_WP_LSIO_GPIO4_IO11		0x00000021>,
+			   /* GPIO4_10 on X61:28 */
+			   <IMX8QM_USDHC2_VSELECT_LSIO_GPIO4_IO10	0x00000021>,
+			   /* GPIO4_09 on X61:30 */
+			   <IMX8QM_USDHC2_RESET_B_LSIO_GPIO4_IO09	0x00000021>,
+			   /* GPIO5_23 on X62:24 */
+			   <IMX8QM_USDHC1_STROBE_LSIO_GPIO5_IO23	0x00000021>,
+			   /* GPIO5_24 on X61:15 */
+			   <IMX8QM_USDHC2_CLK_LSIO_GPIO5_IO24		0x00000021>,
+			   /* GPIO5_25 on X61:17 */
+			   <IMX8QM_USDHC2_CMD_LSIO_GPIO5_IO25		0x00000021>,
+			   /* GPIO5_26 on X61:19 */
+			   <IMX8QM_USDHC2_DATA0_LSIO_GPIO5_IO26		0x00000021>,
+			   /* GPIO5_27 on X61:21 */
+			   <IMX8QM_USDHC2_DATA1_LSIO_GPIO5_IO27		0x00000021>,
+			   /* GPIO5_28 on X61:23 */
+			   <IMX8QM_USDHC2_DATA2_LSIO_GPIO5_IO28		0x00000021>,
+			   /* GPIO5_29 on X61:25 */
+			   <IMX8QM_USDHC2_DATA3_LSIO_GPIO5_IO29		0x00000021>;
+	};
+
+	pinctrl_gpio2: gpio2grp {
+		fsl,pins = <IMX8QM_ESAI1_FST_LSIO_GPIO2_IO05		0x00000021>,
+			   <IMX8QM_ESAI1_TX2_RX3_LSIO_GPIO2_IO10	0x00000021>;
+	};
+
+	pinctrl_gpiokeys: gpiokeysgrp {
+		fsl,pins = <IMX8QM_ESAI1_TX3_RX2_LSIO_GPIO2_IO11	0x00000021>,
+			   <IMX8QM_SCU_GPIO0_04_LSIO_GPIO1_IO00		0x00000021>;
+	};
+
+	pinctrl_gpioled: gpioledgrp {
+		fsl,pins = <IMX8QM_USDHC1_DATA4_LSIO_GPIO5_IO19		0x00000021>,
+			   <IMX8QM_USDHC1_DATA5_LSIO_GPIO5_IO20		0x00000021>;
+	};
+
+	pinctrl_lpspi0: lpspi0grp {
+		fsl,pins = <IMX8QM_SPI0_SCK_DMA_SPI0_SCK		0x0600004d>,
+			   <IMX8QM_SPI0_SDO_DMA_SPI0_SDO		0x0600004d>,
+			   <IMX8QM_SPI0_SDI_DMA_SPI0_SDI		0x0600004d>;
+	};
+
+	pinctrl_lpspi0_cs: lpspi0csgrp {
+		fsl,pins = <IMX8QM_SPI0_CS0_LSIO_GPIO3_IO05		0x00000021>,
+			   <IMX8QM_SPI0_CS1_LSIO_GPIO3_IO06		0x00000021>;
+	};
+
+	pinctrl_lpspi1: lpspi1grp {
+		fsl,pins = <IMX8QM_ADC_IN3_DMA_SPI1_SCK			0x0600004d>,
+			   <IMX8QM_ADC_IN4_DMA_SPI1_SDO			0x0600004d>,
+			   <IMX8QM_ADC_IN5_DMA_SPI1_SDI			0x0600004d>;
+	};
+
+	pinctrl_lpspi1_cs: lpspi1csgrp {
+		fsl,pins = <IMX8QM_ADC_IN6_LSIO_GPIO3_IO24		0x00000021>,
+			   <IMX8QM_ADC_IN7_LSIO_GPIO3_IO25		0x00000021>;
+	};
+
+	pinctrl_lpspi2: lpspi2grp {
+		fsl,pins = <IMX8QM_SPI2_SCK_DMA_SPI2_SCK		0x0600004d>,
+			   <IMX8QM_SPI2_SDO_DMA_SPI2_SDO		0x0600004d>,
+			   <IMX8QM_SPI2_SDI_DMA_SPI2_SDI		0x0600004d>;
+	};
+
+	pinctrl_lpspi2_cs: lpspi2sgrp {
+		fsl,pins = <IMX8QM_SPI2_CS0_LSIO_GPIO3_IO10		0x00000021>,
+			   <IMX8QM_SPI2_CS1_LSIO_GPIO3_IO11		0x00000021>;
+	};
+
+	pinctrl_lpuart0: lpuart0grp {
+		fsl,pins = <IMX8QM_UART0_RX_DMA_UART0_RX		0x06000021>,
+			   <IMX8QM_UART0_TX_DMA_UART0_TX		0x06000021>,
+			   <IMX8QM_UART0_CTS_B_DMA_UART0_CTS_B		0x00000021>,
+			   <IMX8QM_UART0_RTS_B_DMA_UART0_RTS_B		0x00000021>;
+	};
+
+	pinctrl_lpuart1: lpuart1grp {
+		fsl,pins = <IMX8QM_UART1_RX_DMA_UART1_RX		0x06000021>,
+			   <IMX8QM_UART1_TX_DMA_UART1_TX		0x06000021>,
+			   <IMX8QM_UART1_CTS_B_DMA_UART1_CTS_B		0x00000021>,
+			   <IMX8QM_UART1_RTS_B_DMA_UART1_RTS_B		0x00000021>;
+	};
+
+	pinctrl_lpuart2: lpuart2grp {
+		fsl,pins = <IMX8QM_LVDS0_I2C1_SDA_DMA_UART2_RX		0x06000021>,
+			   <IMX8QM_LVDS0_I2C1_SCL_DMA_UART2_TX		0x06000021>;
+	};
+
+	pinctrl_lsio_pwm3: lsiopwm3grp {
+		fsl,pins = <IMX8QM_GPT0_COMPARE_LSIO_PWM3_OUT		0x00000021>;
+	};
+
+	pinctrl_pciea: pcieagrp {
+		fsl,pins = <IMX8QM_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO29		0x06000021>,
+			   <IMX8QM_PCIE_CTRL0_CLKREQ_B_HSIO_PCIE0_CLKREQ_B	0x06000021>,
+			   <IMX8QM_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO28		0x04000021>;
+	};
+
+	pinctrl_pcieb: pciebgrp {
+		fsl,pins = <IMX8QM_PCIE_CTRL1_PERST_B_LSIO_GPIO5_IO00		0x06000021>,
+			   <IMX8QM_PCIE_CTRL1_CLKREQ_B_HSIO_PCIE1_CLKREQ_B	0x06000021>,
+			   <IMX8QM_PCIE_CTRL1_WAKE_B_LSIO_GPIO4_IO31		0x04000021>;
+	};
+
+	pinctrl_pwmfan: pwmfangrp {
+		fsl,pins = <IMX8QM_SPI3_CS0_LSIO_GPIO2_IO20		0x30>;
+	};
+
+	pinctrl_reg_mba8x_12v: mba12vgrp {
+		fsl,pins = <IMX8QM_SCU_GPIO0_06_LSIO_GPIO1_IO02		0x00000021>;
+	};
+
+	pinctrl_reg_pcie_v1v5: regpcie1v5grp {
+		fsl,pins = <IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31		0x00000021>;
+	};
+
+	pinctrl_reg_pcie_v3v3: regpcie3v3grp {
+		fsl,pins = <IMX8QM_SCU_GPIO0_05_LSIO_GPIO1_IO01		0x00000021>;
+	};
+
+	pinctrl_regpwmfan: regpwmfangrp {
+		fsl,pins = <IMX8QM_ESAI1_TX4_RX1_LSIO_GPIO2_IO12	0x00000021>;
+	};
+
+	pinctrl_reg_v3v3_sd: reg3v3sdgrp {
+		fsl,pins = <IMX8QM_USDHC1_RESET_B_LSIO_GPIO4_IO07	0x00000021>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <IMX8QM_SAI1_RXD_AUD_SAI1_RXD		0x06000041>,
+			   <IMX8QM_SAI1_RXC_AUD_SAI1_RXC		0x06000041>,
+			   <IMX8QM_SAI1_RXFS_AUD_SAI1_RXFS		0x06000041>,
+			   <IMX8QM_SAI1_TXD_AUD_SAI1_TXD		0x06000061>,
+			   <IMX8QM_SAI1_TXC_AUD_SAI1_TXC		0x06000041>,
+			   <IMX8QM_MCLK_OUT0_AUD_ACM_MCLK_OUT0		0x0600004d>;
+	};
+
+	pinctrl_usbotg1: usbotg1grp {
+		fsl,pins = <IMX8QM_USB_SS3_TC2_CONN_USB_OTG1_OC		0x00000021>,
+			   <IMX8QM_USB_SS3_TC0_CONN_USB_OTG1_PWR	0x00000021>;
+	};
+
+	pinctrl_usbhub: usbhubgrp {
+		fsl,pins = <IMX8QM_ESAI1_SCKT_LSIO_GPIO2_IO07		0x00000021>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
+		fsl,pins = <IMX8QM_USDHC1_DATA6_LSIO_GPIO5_IO21		0x00000021>,
+			   <IMX8QM_USDHC1_DATA7_LSIO_GPIO5_IO22		0x00000021>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <IMX8QM_USDHC1_CLK_CONN_USDHC1_CLK		0x06000041>,
+			   <IMX8QM_USDHC1_CMD_CONN_USDHC1_CMD		0x00000021>,
+			   <IMX8QM_USDHC1_DATA0_CONN_USDHC1_DATA0	0x00000021>,
+			   <IMX8QM_USDHC1_DATA1_CONN_USDHC1_DATA1	0x00000021>,
+			   <IMX8QM_USDHC1_DATA2_CONN_USDHC1_DATA2	0x00000021>,
+			   <IMX8QM_USDHC1_DATA3_CONN_USDHC1_DATA3	0x00000021>,
+			   <IMX8QM_USDHC1_VSELECT_CONN_USDHC1_VSELECT	0x00000021>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <IMX8QM_USDHC1_CLK_CONN_USDHC1_CLK		0x06000041>,
+			   <IMX8QM_USDHC1_CMD_CONN_USDHC1_CMD		0x00000021>,
+			   <IMX8QM_USDHC1_DATA0_CONN_USDHC1_DATA0	0x00000021>,
+			   <IMX8QM_USDHC1_DATA1_CONN_USDHC1_DATA1	0x00000021>,
+			   <IMX8QM_USDHC1_DATA2_CONN_USDHC1_DATA2	0x00000021>,
+			   <IMX8QM_USDHC1_DATA3_CONN_USDHC1_DATA3	0x00000021>,
+			   <IMX8QM_USDHC1_VSELECT_CONN_USDHC1_VSELECT	0x00000021>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <IMX8QM_USDHC1_CLK_CONN_USDHC1_CLK		0x06000041>,
+			   <IMX8QM_USDHC1_CMD_CONN_USDHC1_CMD		0x00000021>,
+			   <IMX8QM_USDHC1_DATA0_CONN_USDHC1_DATA0	0x00000021>,
+			   <IMX8QM_USDHC1_DATA1_CONN_USDHC1_DATA1	0x00000021>,
+			   <IMX8QM_USDHC1_DATA2_CONN_USDHC1_DATA2	0x00000021>,
+			   <IMX8QM_USDHC1_DATA3_CONN_USDHC1_DATA3	0x00000021>,
+			   <IMX8QM_USDHC1_VSELECT_CONN_USDHC1_VSELECT	0x00000021>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
new file mode 100644
index 0000000000000..718c792259a65
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include "imx8qm.dtsi"
+
+/ {
+	model = "TQ-Systems i.MX8QM TQMa8QM";
+	compatible = "tq,imx8qm-tqma8qm", "fsl,imx8qm";
+
+	memory@80000000 {
+		device_type = "memory";
+		/*
+		 * DRAM base addr, size : 1024 MiB DRAM
+		 * should be corrected by bootloader
+		 */
+		reg = <0x00000000 0x80000000 0 0x40000000>;
+	};
+
+	reg_tqma8x_v3v3: regulator-tqma8x-v3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	/* SW7 controlled by SCU */
+	reg_1v8_io1: regulator-v1v8-io1 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_1V8_IO1";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	/* LDO4 controlled by SCU */
+	reg_3v3_emmc: regulator-v3v3-emmc {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3_EMMC";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&acm {
+	status = "okay";
+};
+
+&adc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0>;
+	vref-supply = <&reg_vref_v1v8>;
+	status = "okay";
+};
+
+/* TQMa8QM only uses industrial grade, reduce trip points accordingly */
+&cpu_alert0 {
+	temperature = <95000>;
+};
+
+&cpu_crit0 {
+	temperature = <100000>;
+};
+
+&cpu_alert1 {
+	temperature = <95000>;
+};
+
+&cpu_crit1 {
+	temperature = <100000>;
+};
+
+&gpu_alert0 {
+	temperature = <95000>;
+};
+
+&gpu_crit0 {
+	temperature = <100000>;
+};
+
+&gpu_alert1 {
+	temperature = <95000>;
+};
+
+&gpu_crit1 {
+	temperature = <100000>;
+};
+
+&drc_alert0 {
+	temperature = <95000>;
+};
+
+&drc_crit0 {
+	temperature = <100000>;
+};
+/* end of temperature grade adjustments */
+
+&flexspi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexspi0>;
+	status = "okay";
+
+	flash0: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <66000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		vcc-supply = <&reg_1v8_io1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-1 = <&pinctrl_lpi2c1gpio>;
+	scl-gpios = <&lsio_gpio0 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&lsio_gpio0 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	/* NXP SE97BTP with temperature sensor + eeprom */
+	se97: temperature-sensor@1b {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x1b>;
+	};
+
+	pcf85063: rtc@51 {
+		compatible = "nxp,pcf85063a";
+		reg = <0x51>;
+		quartz-load-femtofarads = <7000>;
+	};
+
+	at24c02: eeprom@53 {
+		compatible = "nxp,se97b", "atmel,24c02";
+		reg = <0x53>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&reg_tqma8x_v3v3>;
+	};
+
+	m24c64: eeprom@57 {
+		compatible = "atmel,24c64";
+		reg = <0x57>;
+		pagesize = <32>;
+		vcc-supply = <&reg_tqma8x_v3v3>;
+	};
+};
+
+&mu_m0 {
+	status = "okay";
+};
+
+&mu1_m0 {
+	status = "okay";
+};
+
+&mu2_m0 {
+	status = "okay";
+};
+
+&thermal_zones {
+	pmic0-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&tsens IMX_SC_R_PMIC_0>;
+
+		trips {
+			pmic_alert0: trip0 {
+				temperature = <110000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+			pmic_crit0: trip1 {
+				temperature = <125000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&pmic_alert0>;
+				cooling-device =
+					<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	bus-width = <8>;
+	vmmc-supply = <&reg_3v3_emmc>;
+	vqmmc-supply = <&reg_1v8_io1>;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+&vpu {
+	compatible = "nxp,imx8qm-vpu";
+	status = "okay";
+};
+
+&vpu_core0 {
+	memory-region = <&decoder_boot>, <&decoder_rpc>;
+	status = "okay";
+};
+
+&vpu_core1 {
+	memory-region = <&encoder1_boot>, <&encoder1_rpc>;
+	status = "okay";
+};
+
+&vpu_core2 {
+	memory-region = <&encoder2_boot>, <&encoder2_rpc>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <IMX8QM_GPT0_CAPTURE_DMA_I2C1_SDA	0x0600004d>,
+			   <IMX8QM_GPT0_CLK_DMA_I2C1_SCL	0x0600004d>;
+	};
+
+	pinctrl_lpi2c1gpio: lpi2c1gpiogrp {
+		fsl,pins = <IMX8QM_GPT0_CAPTURE_LSIO_GPIO0_IO15	0x0600004d>,
+			   <IMX8QM_GPT0_CLK_LSIO_GPIO0_IO14	0x0600004d>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK		0x06000041>,
+			   <IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD		0x00000021>,
+			   <IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0		0x00000021>,
+			   <IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1		0x00000021>,
+			   <IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2		0x00000021>,
+			   <IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3		0x00000021>,
+			   <IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4		0x00000021>,
+			   <IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5		0x00000021>,
+			   <IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6		0x00000021>,
+			   <IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7		0x00000021>,
+			   <IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041>,
+			   <IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B	0x00000021>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK		0x06000040>,
+			   <IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD		0x00000021>,
+			   <IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0		0x00000021>,
+			   <IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1		0x00000021>,
+			   <IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2		0x00000021>,
+			   <IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3		0x00000021>,
+			   <IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4		0x00000021>,
+			   <IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5		0x00000021>,
+			   <IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6		0x00000021>,
+			   <IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7		0x00000021>,
+			   <IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041>,
+			   <IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B	0x00000021>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK		0x06000040>,
+			   <IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD		0x00000021>,
+			   <IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0		0x00000021>,
+			   <IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1		0x00000021>,
+			   <IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2		0x00000021>,
+			   <IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3		0x00000021>,
+			   <IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4		0x00000021>,
+			   <IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5		0x00000021>,
+			   <IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6		0x00000021>,
+			   <IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7		0x00000021>,
+			   <IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041>,
+			   <IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B	0x00000021>;
+	};
+
+	pinctrl_flexspi0: flexspi0grp {
+		fsl,pins = <IMX8QM_QSPI0A_DATA0_LSIO_QSPI0A_DATA0	0x0000004d>,
+			   <IMX8QM_QSPI0A_DATA1_LSIO_QSPI0A_DATA1	0x0000004d>,
+			   <IMX8QM_QSPI0A_DATA2_LSIO_QSPI0A_DATA2	0x0000004d>,
+			   <IMX8QM_QSPI0A_DATA3_LSIO_QSPI0A_DATA3	0x0000004d>,
+			   <IMX8QM_QSPI0A_DQS_LSIO_QSPI0A_DQS		0x0000004d>,
+			   <IMX8QM_QSPI0A_SS0_B_LSIO_QSPI0A_SS0_B	0x0000004d>,
+			   <IMX8QM_QSPI0A_SS1_B_LSIO_QSPI0A_SS1_B	0x0000004d>,
+			   <IMX8QM_QSPI0A_SCLK_LSIO_QSPI0A_SCLK		0x0000004d>,
+			   <IMX8QM_QSPI0B_SCLK_LSIO_QSPI0B_SCLK		0x0000004d>,
+			   <IMX8QM_QSPI0B_DATA0_LSIO_QSPI0B_DATA0	0x0000004d>,
+			   <IMX8QM_QSPI0B_DATA1_LSIO_QSPI0B_DATA1	0x0000004d>,
+			   <IMX8QM_QSPI0B_DATA2_LSIO_QSPI0B_DATA2	0x0000004d>,
+			   <IMX8QM_QSPI0B_DATA3_LSIO_QSPI0B_DATA3	0x0000004d>,
+			   <IMX8QM_QSPI0B_DQS_LSIO_QSPI0B_DQS		0x0000004d>,
+			   <IMX8QM_QSPI0B_SS0_B_LSIO_QSPI0B_SS0_B	0x0000004d>,
+			   <IMX8QM_QSPI0B_SS1_B_LSIO_QSPI0B_SS1_B	0x0000004d>;
+	};
+};
-- 
2.43.0


