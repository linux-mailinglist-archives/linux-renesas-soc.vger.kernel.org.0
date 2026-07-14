Return-Path: <linux-renesas-soc+bounces-35212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JV3mLpNJVmqJ2wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 16:37:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D70E755EBF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 16:37:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ew.tq-group.com header.s=default2602 header.b=o18EBmM0;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ew.tq-group.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DDB1A300C7E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 14:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3203563E8;
	Tue, 14 Jul 2026 14:32:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CB9352021;
	Tue, 14 Jul 2026 14:32:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039525; cv=none; b=KM0iHte5VYuSocaDsZKvZrcBwpk9AzquhBQL0rEZhx76BmlBocUNnRhWAAgaeQX2xHsNnbyKtGgmcUxZIgoZTTlK6DHdWavP3vy9OKnCQeIu72ExtaQ9Wojqs9V9C/Vz8biXEtvtVuVBosef/jV6pVmazbX6U5ZN+OXFF1paKUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039525; c=relaxed/simple;
	bh=rEeCyCvkpehJxEa8590yd+QagRFWIDgGMPJZCq5Si1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tHVaptCYrR/wCV7o7XlTei3rva+zHisesv9Ly1GpZ9gDX5vi3qyPyYyZEIjDDlFbDSuBev4eLHnv9l217xVdk0Ov9UdI0/IqmrMDEr6jkDMJMQpWKF/zcggp8ujuQUvfgvfajv6Lh60oWXI9mTy/ddbIo9Mcgiy43CMFWcR9lQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=o18EBmM0; arc=none smtp.client-ip=188.40.3.216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=3ELupXJUyWoFFbI+CIEKfH1yvP+dEKLzClH0WHoo9K4=; b=o18EBmM0B3sXRA9YUMa/FPGn1x
	Kna6ShOoQJbdFvgawmtrwHiry/57YfyjAtTT9UzcIlLJ4c+/qzokhe1BPqpUq6ERSRoBSiZcJlxmN
	0URxqTcwq8thYCRe1J+oeLK2CPKTyB5f/ShcCZR1NiV1snSz0NC4yKI5qp2ufUV8Ox9ncvyTHO1Cx
	zjHwpUw8YXMOus0fXWP0F7tAAFzRRuBkOknzmhGSBX6KMh1DXt5a6rrLX3BF5fYu8Zh0i4rMobeyh
	0BES55+V4gQsDSuzYpYxUS90lMT0ylqFv57K6HtRjqAsxzHNOSUyuLxQK1+fRJIkBgNcUSZ3UuBVN
	KKKP8unw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjeAw-000Bhk-0X;
	Tue, 14 Jul 2026 16:31:58 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjeAv-0004lL-0E;
	Tue, 14 Jul 2026 16:31:57 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v8 1/1] arm64: dts: add tqma9596la-mba95xxca
Date: Tue, 14 Jul 2026 16:31:52 +0200
Message-ID: <20260714143154.787825-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28060/Tue Jul 14 08:25:07 2026)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35212-lists,linux-renesas-soc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,pengutronix.de,gmail.com,kernel.org,glider.be];
	FORGED_SENDER(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:Markus.Niebel@ew.tq-group.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux@ew.tq-group.com,m:linux-renesas-soc@vger.kernel.org,m:alexander.stein@ew.tq-group.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ew.tq-group.com:from_mime,ew.tq-group.com:dkim,ew.tq-group.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D70E755EBF

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

This adds support for TQMa95xxLA modules, designed to be soldered
on a carrier board. MBa95xxCA is a carrier reference board / starter kit
design.

There is a common device tree for all variants with e.g. reduced
CPU core / feature count.

Enable the external accessible PCIe controllers as host,
add clocking and reset GPIO. While at it, add hogs for GPIO
lines from the M.2 slots until M.2 connector driver is available.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v8:
* Remove GPIO hog for M2_KEYE_SDIO_RST# (already specified in wifi-connector)
* Mark reg_pwm_fan as alway-on for now, until the fan driver supports
  fan-supply

Changes in v7:
* Remove ethphy0grp (GPIO1 owned by System Manager)

Changes in v6:
* Remove spi-max-frequency from SPI controller (only device property)
* Add comment about maximum speed instead
* Sort I2C devices per address
* Fix clock-names for enetc_port2
* Fix vcc-supply for GPIO expander
* Fix typo for M2_KEYB_WDISABLE2#
* Fix typo in pinxtrl groups
* Add comment about vendor-specific pins for GPIO hogs on PCIe M.2 E-Key

Changes in v5:
* Limit LPSPI4 max frequency
* Replace PCIe M2 Key-E GPIO hogs with dedicated connector node
* Fix PCIe clock configuration

Changes in v4:
* Fix LPSPI4 pad muxing and control

Changes in v3:
* Moved reserved-memory to board-lebel
* Remove VPU reserved memory (unused for now)
* Fix typo in connector comment

Changes in v2:
* removed useless regulator
* added USB PD source configuration
* Removed unused uart-has-rtscts properties (unused by LPUART)
* Fixed RTS/CTS pullups in pinctrl
* Added thermalzone on module

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx95-tqma9596la-mba95xxca.dts  | 958 ++++++++++++++++++
 .../boot/dts/freescale/imx95-tqma9596la.dtsi  | 278 +++++
 3 files changed, 1237 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 842c98a91bb72..9dfcaf9bc78ba 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -672,6 +672,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
new file mode 100644
index 0000000000000..1d745d66997cb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
@@ -0,0 +1,958 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2024-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ * Author: Markus Niebel
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx95-tqma9596la.dtsi"
+
+/ {
+	model = "TQ-Systems i.MX95 TQMa95xxLA on MBa95xxCA";
+	compatible = "tq,imx95-tqma9596la-mba95xxca", "tq,imx95-tqma9596la", "fsl,imx95";
+	chassis-type = "embedded";
+
+	aliases {
+		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port2;
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
+		spi0 = &flexspi1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	backlight_lvds: backlight-lvds {
+		compatible = "pwm-backlight";
+		pwms = <&tpm5 2 100000 0>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+		enable-gpios = <&expander2 6 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_12v0>;
+		status = "disabled";
+	};
+
+	clk_eth: clk-eth {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <156250000>;
+	};
+
+	/*
+	 * TODO: gate is disabled for now and GPIO are hogged
+	 * ENETC driver switches the clock far too late for ENETC2 + SFP
+	 */
+	clk_eth_gate: clk-eth-gate {
+		compatible = "gpio-gate-clock";
+		enable-gpios = <&expander2 0 GPIO_ACTIVE_HIGH>;
+		clocks = <&clk_eth>;
+		#clock-cells = <0>;
+		status = "disabled";
+	};
+
+	clk_xtal25: clk-xtal25 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		button-b {
+			label = "BUTTON_B#";
+			linux,code = <BTN_1>;
+			gpios = <&expander1 0 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&expander2 13 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&expander2 14 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+
+	reg_v1v8_mb: regulator-v1v8-mb {
+		compatible = "regulator-fixed";
+		regulator-name = "V_1V8_MB";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_v3v3_mb: regulator-v3v3-mb {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3_MB";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_3v3a_10g: regulator-3v3a-10g {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3A_10G";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander2 15 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <2000>;
+		enable-active-high;
+	};
+
+	reg_12v0: regulator-12v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "12V0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&expander1 15 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_pwm_fan: regulator-pwm-fan {
+		compatible = "regulator-fixed";
+		regulator-name = "FAN_PWR";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&expander3 15 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_12v0>;
+		/*
+		 * emc2305 fan driver lacks support for fan-supply, so
+		 * alway enable it for now.
+		 * Remove this line once support is added
+		 */
+		regulator-always-on;
+	};
+
+	reg_lvds: regulator-lvds {
+		compatible = "regulator-fixed";
+		regulator-name = "LCD_PWR_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander2 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* USB NC limitations, RM 162.1.2 VBUS limitations */
+	reg_vbus_usb3: regulator-vbus-usb3 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "USB3_VBUS";
+		gpio = <&gpio4 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
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
+	};
+
+	sfp_xfi: sfp-xfi {
+		compatible = "sff,sfp";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sfp>;
+		i2c-bus = <&lpi2c7>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander1 3 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&gpio2 31 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&expander2 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	sound {
+		compatible = "fsl,imx-audio-tlv320aic32x4";
+		model = "tqm-tlv320aic32";
+		audio-codec = <&tlv320aic3x04>;
+		audio-cpu = <&sai3>;
+		audio-routing =
+			"IN3_L", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"IN1_L", "Line In Jack",
+			"IN1_R", "Line In Jack",
+			"Line Out Jack", "LOL",
+			"Line Out Jack", "LOR";
+	};
+
+	wifi-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&reg_v3v3_mb>;
+		vpcie1v8-supply = <&reg_v1v8_mb>;
+		i2c-parent = <&lpi2c2>;
+		w-disable1-gpios = <&expander2 9 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&expander2 10 GPIO_ACTIVE_LOW>;
+		/* UART_WAKE is connected to SM */
+		/* SDIO_WAKE is connected to SM */
+		sdio-reset-gpios = <&expander3 2 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&adc1 {
+	status = "okay";
+};
+
+&enetc_port0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&enetc_port1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enetc1>;
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+/* No support for XFI yet */
+&enetc_port2 {
+	sfp = <&sfp_xfi>;
+	phy-mode = "10gbase-r";
+	clocks = <&clk_eth>;
+	managed = "in-band-status";
+	status = "disabled";
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	status = "okay";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
+&lpi2c2 {
+	tlv320aic3x04: audio-codec@18 {
+		compatible = "ti,tlv320aic32x4";
+		reg = <0x18>;
+		clocks = <&scmi_clk IMX95_CLK_SAI3>;
+		clock-names = "mclk";
+		reset-gpios = <&expander1 14 GPIO_ACTIVE_LOW>;
+		iov-supply = <&reg_v3v3_mb>;
+		ldoin-supply = <&reg_v3v3_mb>;
+	};
+
+	sensor_mb: temperature-sensor@1e {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x1e>;
+	};
+
+	fan_controller: fan-controller@2f {
+		compatible = "microchip,emc2301", "microchip,emc2305";
+		reg = <0x2f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#pwm-cells = <3>;
+		status = "okay";
+
+		fan: fan@0 {
+			reg = <0x0>;
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED 1>;
+			#cooling-cells = <2>;
+			fan-supply = <&reg_pwm_fan>;
+		};
+	};
+
+	ptn5110: usb-typec@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "X9";
+			power-role = "source";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)>;
+			self-powered;
+
+			port {
+				typec_con_hs: endpoint {
+					remote-endpoint = <&typec_hs>;
+				};
+			};
+		};
+	};
+
+	eeprom_mb: eeprom@56 {
+		compatible = "nxp,se97b", "atmel,24c02";
+		reg = <0x56>;
+		pagesize = <16>;
+		vcc-supply = <&reg_v3v3_mb>;
+	};
+
+	pcieclk: clock-generator@68 {
+		compatible = "renesas,9fgv0441";
+		reg = <0x68>;
+		clocks = <&clk_xtal25>;
+		#clock-cells = <1>;
+	};
+
+	/* D39 IN/OUT 3V3 */
+	expander1: gpio@74 {
+		compatible = "ti,tca9539";
+		reg = <0x74>;
+		vcc-supply = <&reg_v3v3_mb>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_expander1>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+
+		gpio-line-names =
+			/* 00 */ "BUTTON_B#", "CAM0_SYNC_3V3",
+			/* 02 */ "CAM1_SYNC_3V3", "SFP_MOD_ABS",
+			/* 04 */ "DIG_IN1", "DIG_IN2",
+			/* 06 */ "DIG_IN3", "DIG_IN4",
+			/* 08 */ "DIG_OUT_1_2_STATE", "DIG_OUT_3_4_STATE",
+			/* 10 */ "DIG_OUT_1_EN", "DIG_OUT_2_EN",
+			/* 12 */ "DIG_OUT_3_EN", "DIG_OUT_4_EN",
+			/* 14 */ "AUDIO_RST#", "12V_EN";
+	};
+
+	/* D40 OUT 3V3 */
+	expander2: gpio@75 {
+		compatible = "ti,tca9539";
+		reg = <0x75>;
+		vcc-supply = <&reg_v3v3_mb>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			/* 00 */ "ETH10G_REFCLK_EN", "ETH10G_REFCLK_RST#",
+			/* 02 */ "SFP_TX_DIS", "USB3_RESET#",
+			/* 04 */ "USB2_RESET#", "LCD_RESET#",
+			/* 06 */ "LCD_BLT_EN", "LCD_PWR_EN",
+			/* 08 */ "M2_KEYE_PERST#", "M2_KEYE_WDISABLE1#",
+			/* 10 */ "M2_KEYE_WDISABLE2#", "M2_KEYB_PERST#",
+			/* 12 */ "M2_KEYB_WDISABLE1#", "USER_LED1",
+			/* 14 */ "USER_LED2", "3V3A_10G_EN";
+
+		eth10g-refclk-en-hog {
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "ETH10G_REFCLK_EN";
+		};
+
+		eth10g-refclk-rst-hog {
+			gpio-hog;
+			gpios = <1 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "ETH10G_REFCLK_RST#";
+		};
+
+		m2-keyb-wdisable1-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "M2_KEYB_WDISABLE1#";
+		};
+	};
+
+	/* D41 OUT 1V8 */
+	expander3: gpio@76 {
+		compatible = "ti,tca9539";
+		reg = <0x76>;
+		vcc-supply = <&reg_v1v8_mb>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			/* 00 */ "ENET1_RESET#", "ENET2_RESET#",
+			/* 02 */ "M2_KEYE_SDIO_RST#", "M2_KEYE_DEV_WLAN_WAKE#",
+			/* 04 */ "M2_KEYE_DEV_BT_WAKE", "M2_KEYB_W_DISABLE2#",
+			/* 06 */ "M2_KEYB_RST#", "M2_KEYB_FULL_CARD_PWR_OFF#",
+			/* 08 */ "M2_KEYB_DPR", "CAM0_PWR#",
+			/* 10 */ "CAM1_PWR#", "CAM0_RST#",
+			/* 12 */ "CAM1_RST#", "CAM0_TRIGGER",
+			/* 14 */ "CAM1_TRIGGER", "FAN_PWR_EN";
+
+		/* vendor defined pin 42 */
+		m2-keye-dev_wlan-wake-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_LOW>;
+			input;
+			line-name = "M2_KEYE_DEV_WLAN_WAKE#";
+		};
+
+		/* vendor defined pin 40 */
+		m2-keye-dev_bt-wake-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_LOW>;
+			input;
+			line-name = "M2_KEYE_DEV_BT_WAKE#";
+		};
+
+		m2-keyb-wdisable2-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "M2_KEYB_WDISABLE2#";
+		};
+
+		m2-keyb-rst-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "M2_KEYB_RST#";
+		};
+
+		m2-keyb-full-card-pwr-off-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "M2_KEYB_FULL_CARD_PWR_OFF#";
+		};
+	};
+};
+
+/* X4 + SFP */
+&lpi2c7 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c7>;
+	pinctrl-1 = <&pinctrl_lpi2c7_recovery>;
+	scl-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	/* TODO: 0x19: retimer */
+
+	/* 0x50 / 0x51: SFP EEPROM */
+};
+
+/* X4 */
+&lpspi4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi4>;
+	cs-gpios = <&gpio5 14 GPIO_ACTIVE_LOW>, <&gpio5 13 GPIO_ACTIVE_LOW>;
+	/* max 30 MHz as per datasheet, without SCK loopback via pad (LPSPI_CFGR1[SAMPLE]) */
+	status = "okay";
+};
+
+&lpuart1 {
+	/* console */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart1>;
+	status = "okay";
+};
+
+&lpuart2 {
+	/* SM */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart2>;
+	status = "reserved";
+};
+
+&lpuart5 {
+	/* X16 M.2 KEY E */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart5>;
+	status = "okay";
+};
+
+&lpuart7 {
+	/* X5 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart7>;
+	status = "okay";
+};
+
+&lpuart8 {
+	/* X15 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart8>;
+	linux,rs485-enabled-at-boot-time;
+	status = "okay";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_emdio>;
+	status = "okay";
+
+	/* IRQ pin is AON GPIO, not usable */
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+		reset-gpios = <&expander3 0 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <500000>;
+		reset-deassert-us = <50000>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,dp83867-rxctrl-strap-quirk;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+	};
+
+	ethphy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ethphy1>;
+		reset-gpios = <&expander3 1 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <500000>;
+		reset-deassert-us = <50000>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,dp83867-rxctrl-strap-quirk;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+	};
+};
+
+&netc_timer {
+	status = "okay";
+};
+
+&netcmix_blk_ctrl {
+	status = "okay";
+};
+
+/* X16 M2 / E-Key mPCIe */
+&pcie0 {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX95_CLK_HSIO>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
+		 <&hsio_blk_ctl 0>,
+		 <&pcieclk 1>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref", "extref";
+	reset-gpios = <&expander2 8 GPIO_ACTIVE_LOW>;
+	/* Not supported on REV.0100 */
+	/* supports-clkreq; */
+	status = "okay";
+};
+
+/* X17 M2 / B-Key PCIe */
+&pcie1 {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX95_CLK_HSIO>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
+		 <&hsio_blk_ctl 0>,
+		 <&pcieclk 0>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref", "extref";
+	reset-gpios = <&expander2 11 GPIO_ACTIVE_LOW>;
+	/* Not supported on REV.0100 */
+	/* supports-clkreq; */
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
+&scmi_bbm {
+	linux,code = <KEY_POWER>;
+};
+
+&thermal_zones {
+	a55-thermal {
+		trips {
+			cpu_active0: trip-active0 {
+				temperature = <40000>;
+				hysteresis = <5000>;
+				type = "active";
+			};
+
+			cpu_active1: trip-active1 {
+				temperature = <48000>;
+				hysteresis = <3000>;
+				type = "active";
+			};
+
+			cpu_active2: trip-active2 {
+				temperature = <60000>;
+				hysteresis = <10000>;
+				type = "active";
+			};
+		};
+
+		cooling-maps {
+			map1 {
+				trip = <&cpu_active0>;
+				cooling-device = <&fan 0 2>;
+			};
+
+			map2 {
+				trip = <&cpu_active1>;
+				cooling-device = <&fan 3 5>;
+			};
+
+			map3 {
+				trip = <&cpu_active2>;
+				cooling-device = <&fan 6 10>;
+			};
+		};
+	};
+};
+
+&tpm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm3>;
+	status = "okay";
+};
+
+&tpm5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm5>;
+};
+
+&usb2 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		typec_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
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
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb451,8142";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&expander2 3 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_v3v3_mb>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hub_2_1: hub@1 {
+			compatible = "usb424,2514";
+			reg = <1>;
+			reset-gpios = <&expander2 4 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&reg_v3v3_mb>;
+			vdda-supply = <&reg_v3v3_mb>;
+		};
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb451,8140";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&expander2 3 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_v3v3_mb>;
+	};
+};
+
+&usb3_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb3>;
+	vbus-supply = <&reg_vbus_usb3>;
+	status = "okay";
+};
+
+/* X7 µSD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	vmmc-supply = <&reg_sdvmmc>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&scmi_iomuxc {
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
+			   <IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x11e>;
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
+			   <IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x11e>;
+	};
+
+	pinctrl_ethphy1: ethphy1grp {
+		fsl,pins = <IMX95_PAD_ENET1_MDC__GPIO4_IO_BIT0				0x1100>;
+	};
+
+	pinctrl_expander1: expander1grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO14__GPIO2_IO_BIT14				0x1100>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <IMX95_PAD_SAI1_TXC__AONMIX_TOP_CAN1_RX		0x1300>,
+			   <IMX95_PAD_SAI1_TXD0__AONMIX_TOP_CAN1_TX		0x31e>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO25__CAN2_TX		0x31e>,
+			   <IMX95_PAD_GPIO_IO27__CAN2_RX		0x1300>;
+	};
+
+	pinctrl_lpi2c7: lpi2c7grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO07__LPI2C7_SCL	0x40001b1e>,
+			   <IMX95_PAD_GPIO_IO06__LPI2C7_SDA	0x40001b1e>;
+	};
+
+	pinctrl_lpi2c7_recovery: lpi2c7recoverygrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO07__GPIO2_IO_BIT7	0x40001b1e>,
+			   <IMX95_PAD_GPIO_IO06__GPIO2_IO_BIT6	0x40001b1e>;
+	};
+
+	pinctrl_lpspi4: lpspi4grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO37__LPSPI4_SCK	0x11e>,
+			   <IMX95_PAD_GPIO_IO19__LPSPI4_SIN	0x111e>,
+			   <IMX95_PAD_GPIO_IO36__LPSPI4_SOUT	0x11e>,
+			   <IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14	0x11e>,
+			   <IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13	0x11e>;
+	};
+
+	pinctrl_lpuart1: lpuart1grp {
+		fsl,pins = <IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e>,
+			   <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x1300>;
+	};
+
+	pinctrl_lpuart2: lpuart2grp {
+		fsl,pins = <IMX95_PAD_UART2_TXD__AONMIX_TOP_LPUART2_TX		0x31e>,
+			   <IMX95_PAD_UART2_RXD__AONMIX_TOP_LPUART2_RX		0x1300>;
+	};
+
+	pinctrl_lpuart5: lpuart5grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO00__LPUART5_TX			0x31e>,
+			   <IMX95_PAD_GPIO_IO01__LPUART5_RX			0x1300>,
+			   <IMX95_PAD_GPIO_IO02__LPUART5_CTS_B			0x1300>,
+			   <IMX95_PAD_GPIO_IO03__LPUART5_RTS_B			0x31e>;
+	};
+
+	pinctrl_lpuart7: lpuart7grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO08__LPUART7_TX			0x31e>,
+			   <IMX95_PAD_GPIO_IO09__LPUART7_RX			0x1300>,
+			   <IMX95_PAD_GPIO_IO10__LPUART7_CTS_B			0x1300>,
+			   <IMX95_PAD_GPIO_IO11__LPUART7_RTS_B			0x31e>;
+	};
+
+	pinctrl_lpuart8: lpuart8grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO12__LPUART8_TX			0x31e>,
+			   <IMX95_PAD_GPIO_IO13__LPUART8_RX			0x1300>,
+			   <IMX95_PAD_GPIO_IO15__LPUART8_RTS_B			0x31e>;
+	};
+
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC		0x51e>,
+			   <IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO		0x51e>;
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
+	pinctrl_retimer: retimergrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO29__GPIO2_IO_BIT29			0x1100>;
+	};
+
+	pinctrl_sfp: sfpgrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO30__GPIO2_IO_BIT30			0x1100>,
+			   <IMX95_PAD_GPIO_IO31__GPIO2_IO_BIT31			0x1100>;
+	};
+
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO24__TPM3_CH3			0x51e>;
+	};
+
+	pinctrl_tpm5: tpm5grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO18__TPM5_CH2			0x51e>;
+	};
+
+	pinctrl_typec: typecgrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO28__GPIO2_IO_BIT28			0x1100>;
+	};
+
+	pinctrl_usb3: usb3grp {
+		fsl,pins = <IMX95_PAD_ENET1_MDIO__GPIO4_IO_BIT1			0x31e>;
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
+			   <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x58e>,
+			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x38e>,
+			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e>,
+			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e>,
+			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e>,
+			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e>,
+			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x1100>,
+			   <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x5fe>,
+			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x3fe>,
+			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x13fe>,
+			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x13fe>,
+			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x13fe>,
+			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x13fe>,
+			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596la.dtsi
new file mode 100644
index 0000000000000..aa2756c14e461
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la.dtsi
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2024-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ * Author: Markus Niebel
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx95.dtsi"
+
+/ {
+	memory@80000000 {
+		device_type = "memory";
+		/*
+		 * DRAM base addr, size : 2048 MiB DRAM
+		 * should be corrected by bootloader
+		 */
+		reg = <0 0x80000000 0 0x80000000>;
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
+	reg_sdvmmc: regulator-sdvmmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sdvmmc>;
+		regulator-name = "SD_PWR_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <12000>;
+		enable-active-high;
+		/* can be enabled by mainboard with SD-Card support */
+		status = "disabled";
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_1v8>;
+};
+
+&flexspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexspi1>;
+	status = "okay";
+
+	flash0: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <66000000>;
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
+/* System Manager */
+&gpio1 {
+	status = "reserved";
+};
+
+/* System Manager */
+&lpi2c1 {
+	status = "reserved";
+};
+
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	status = "okay";
+
+	pcf85063: rtc@51 {
+		compatible = "nxp,pcf85063a";
+		reg = <0x51>;
+		quartz-load-femtofarads = <7000>;
+	};
+
+	m24c64: eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+		pagesize = <32>;
+		vcc-supply = <&reg_3v3>;
+	};
+
+	/* protectable identification memory (part of M24C64-D @54) */
+	eeprom@5c {
+		compatible = "atmel,24c64d-wl";
+		reg = <0x5c>;
+		pagesize = <32>;
+		vcc-supply = <&reg_3v3>;
+	};
+
+	imu@6b {
+		compatible = "st,ism330dhcx";
+		reg = <0x6b>;
+		vdd-supply = <&reg_3v3>;
+		vddio-supply = <&reg_3v3>;
+	};
+};
+
+&thermal_zones {
+	pf09-thermal {
+		polling-delay = <2000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&scmi_sensor 2>;
+
+		trips {
+			pf09_alert: trip0 {
+				hysteresis = <2000>;
+				temperature = <140000>;
+				type = "passive";
+			};
+
+			pf09_crit: trip1 {
+				hysteresis = <2000>;
+				temperature = <155000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pf53arm-thermal {
+		polling-delay = <2000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&scmi_sensor 4>;
+
+		cooling-maps {
+			map0 {
+				trip = <&pf5301_alert>;
+				cooling-device =
+					<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+
+		trips {
+			pf5301_alert: trip0 {
+				hysteresis = <2000>;
+				temperature = <140000>;
+				type = "passive";
+			};
+
+			pf5301_crit: trip1 {
+				hysteresis = <2000>;
+				temperature = <155000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pf53soc-thermal {
+		polling-delay = <2000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&scmi_sensor 3>;
+
+		trips {
+			pf5302_alert: trip0 {
+				hysteresis = <2000>;
+				temperature = <140000>;
+				type = "passive";
+			};
+
+			pf5302_crit: trip1 {
+				hysteresis = <2000>;
+				temperature = <155000>;
+				type = "critical";
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
+	pinctrl_flexspi1: flexspi1grp {
+		fsl,pins = <IMX95_PAD_XSPI1_SS0_B__FLEXSPI1_A_SS0_B	0x19e>,
+			   <IMX95_PAD_XSPI1_DATA0__FLEXSPI1_A_DATA_BIT0	0x19e>,
+			   <IMX95_PAD_XSPI1_DATA1__FLEXSPI1_A_DATA_BIT1	0x19e>,
+			   <IMX95_PAD_XSPI1_DATA2__FLEXSPI1_A_DATA_BIT2	0x19e>,
+			   <IMX95_PAD_XSPI1_DATA3__FLEXSPI1_A_DATA_BIT3	0x19e>,
+			   /* SION to allow clock loopback from pad */
+			   <IMX95_PAD_XSPI1_SCLK__FLEXSPI1_A_SCLK	0x4000019e>,
+			   <IMX95_PAD_XSPI1_DQS__FLEXSPI1_A_DQS		0x4000019e>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL	0x4000191e>,
+			   <IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA	0x4000191e>;
+	};
+
+	pinctrl_sdvmmc: sdvmmcgrp {
+		fsl,pins = <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7	0x11e>;
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
+};
-- 
2.54.0


