Return-Path: <linux-renesas-soc+bounces-31454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMFNAR2F52m+9gEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 16:09:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA3C43BC93
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 16:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DE903001D7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 14:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2903D5663;
	Tue, 21 Apr 2026 14:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="StvfrVw8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC3E3D16FD;
	Tue, 21 Apr 2026 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776780569; cv=none; b=lvdTakJXYuhYh9uyhPpkhPb+5XeCOtz4Rfb9XsgTlpM1ju0nxYd3vmAcEiW++ZEBA2shqgbMIXSg1Z12CNPZ5ZiHUEgk44H9u0QXvO6rQABcNYVyT1yT6XkALoGqNzw08JmSJ4ElbpXjit2cExW5Q3T3D1IeNI8Co0fAvtK2XZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776780569; c=relaxed/simple;
	bh=VzCbo4lmqZ7e2KHKTyrdgC7XUm430J9Zr6r8vqyC7y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qln5oxEAcICyocEGEV9HWMNetwsR6f6rCGUF65INEPWQME8qAFnve39RPgRrk0FD9At+pr7pntrv1q4qaMmtin6lzghhOF9sdItqiad009yJyY3OgeguIE9AOYyf+ua7zEmnxlGvBNwM7qPUMtwQFPB4cw7/eD0IK7V6UWqtmkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=StvfrVw8; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=bPaRiFBjX3bV016m0mdEyx4/bU0+Ywj3JaD+TgRKbPw=; b=StvfrVw8v9Bp5h5v/pFeVX0ZKk
	EQx5sdygc89X/IIcX+wYcEnCko6kjnAqQqEd88WaxbHHfGyWot9nUISkGvL+5119MeJQOXOThucLQ
	H9lZyn/9/N6sXOa748H0pP8BTr8Pv2cejhe57aHmMHlBiFckZ4+qimTFlhd6UHjiU1cN4w0/X9cub
	y1g8JIsQb5Y/tTvv9fYqAYboUCq7TG6vHkEhX26HoFtbW6QHU1l+XqQCAyR88kQU5iToReB1WN4Nz
	pdT93NayjJ5PIkGMNfXZzLbuLZFgH7i8vv2RQQ7KRZgsPTw+FzAsHU7X6vmZaid1Uh6WcY7PM6EbC
	D2QVue9w==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wFBmv-0002g5-00;
	Tue, 21 Apr 2026 16:09:17 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wFBmt-000FAi-1o;
	Tue, 21 Apr 2026 16:09:16 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
Date: Tue, 21 Apr 2026 16:09:15 +0200
Message-ID: <2831050.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260326111803.1248934-2-alexander.stein@ew.tq-group.com>
References:
 <20260326111803.1248934-1-alexander.stein@ew.tq-group.com>
 <20260326111803.1248934-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27978/Tue Apr 21 08:26:17 2026)
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31454-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.50:email,0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ew.tq-group.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.56:email,4.196.180.0:email,0.0.0.51:email]
X-Rspamd-Queue-Id: ADA3C43BC93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Am Donnerstag, 26. M=E4rz 2026, 12:03:30 CEST schrieb Alexander Stein:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>=20
> This adds support for TQMa95xxLA modules, designed to be soldered
> on a carrier board. MBa95xxCA is a carrier reference board / starter kit
> design.
>=20
> There is a common device tree for all variants with e.g. reduced
> CPU core / feature count.
>=20
> Enable the external accessible PCIe controllers as host,
> add clocking and reset GPIO. While at it, add hogs for GPIO
> lines from the M.2 slots until M.2 connector driver is available.
>=20
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Any feedback on this? Patch 1 is already picked in commit d44627c13049e
("dt-bindings: arm: add bindings for TQMa95xxLA")

Thank and best regards,
Alexander

> ---
> Changes in v2:
> * removed useless regulator
> * added USB PD source configuration
> * Removed unused uart-has-rtscts properties (unused by LPUART)
> * Fixed RTS/CTS pullups in pinctrl
> * Added thermalzone on module
>=20
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../freescale/imx95-tqma9596la-mba95xxca.dts  | 947 ++++++++++++++++++
>  .../boot/dts/freescale/imx95-tqma9596la.dtsi  | 297 ++++++
>  3 files changed, 1245 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95x=
xca.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 2879d567dede0..df79e56771319 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -554,6 +554,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx95-15x15-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-toradex-smarc-dev.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx95-tqma9596la-mba95xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-tqma9596sa-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-var-dart-sonata.dtb
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts=
 b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> new file mode 100644
> index 0000000000000..f75580bb91e3e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> @@ -0,0 +1,947 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2024-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + * Author: Markus Niebel
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "imx95-tqma9596la.dtsi"
> +
> +/ {
> +	model =3D "TQ-Systems i.MX95 TQMa95xxLA on MBa95xxCA";
> +	compatible =3D "tq,imx95-tqma9596la-mba95xxca", "tq,imx95-tqma9596la", =
"fsl,imx95";
> +	chassis-type =3D "embedded";
> +
> +	aliases {
> +		ethernet0 =3D &enetc_port0;
> +		ethernet1 =3D &enetc_port1;
> +		ethernet2 =3D &enetc_port2;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		gpio3 =3D &gpio4;
> +		i2c0 =3D &lpi2c1;
> +		i2c1 =3D &lpi2c2;
> +		i2c2 =3D &lpi2c3;
> +		i2c3 =3D &lpi2c4;
> +		i2c4 =3D &lpi2c5;
> +		i2c5 =3D &lpi2c6;
> +		i2c6 =3D &lpi2c7;
> +		i2c7 =3D &lpi2c8;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
> +		rtc0 =3D &pcf85063;
> +		rtc1 =3D &scmi_bbm;
> +		serial0 =3D &lpuart1;
> +		serial1 =3D &lpuart2;
> +		serial2 =3D &lpuart3;
> +		serial3 =3D &lpuart4;
> +		serial4 =3D &lpuart5;
> +		serial5 =3D &lpuart6;
> +		serial6 =3D &lpuart7;
> +		serial7 =3D &lpuart8;
> +		spi0 =3D &flexspi1;
> +	};
> +
> +	chosen {
> +		stdout-path =3D &lpuart1;
> +	};
> +
> +	backlight_lvds: backlight-lvds {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&tpm5 2 100000 0>;
> +		brightness-levels =3D <0 4 8 16 32 64 128 255>;
> +		default-brightness-level =3D <7>;
> +		enable-gpios =3D <&expander2 6 GPIO_ACTIVE_HIGH>;
> +		power-supply =3D <&reg_12v0>;
> +		status =3D "disabled";
> +	};
> +
> +	clk_eth: clk-eth {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <156250000>;
> +	};
> +
> +	/*
> +	 * TODO: gate is disabled for now and GPIO are hogged
> +	 * ENETC driver switches the clock far too late for ENETC2 + SFP
> +	 */
> +	clk_eth_gate: clk-eth-gate {
> +		compatible =3D "gpio-gate-clock";
> +		enable-gpios =3D <&expander2 0 GPIO_ACTIVE_HIGH>;
> +		clocks =3D <&clk_eth>;
> +		#clock-cells =3D <0>;
> +		status =3D "disabled";
> +	};
> +
> +	clk_xtal25: clk-xtal25 {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <25000000>;
> +	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +		autorepeat;
> +
> +		button-b {
> +			label =3D "BUTTON_B#";
> +			linux,code =3D <BTN_1>;
> +			gpios =3D <&expander1 0 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	gpio-leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-1 {
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			function =3D LED_FUNCTION_STATUS;
> +			gpios =3D <&expander2 13 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "default-on";
> +		};
> +
> +		led-2 {
> +			color =3D <LED_COLOR_ID_AMBER>;
> +			function =3D LED_FUNCTION_HEARTBEAT;
> +			gpios =3D <&expander2 14 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible =3D "iio-hwmon";
> +		io-channels =3D <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> +			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
> +	};
> +
> +	reg_v1v8_mb: regulator-v1v8-mb {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "V_1V8_MB";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_v3v3_mb: regulator-v3v3-mb {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "V_3V3_MB";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3v3a_10g: regulator-3v3a-10g {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "3V3A_10G";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&expander2 15 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us =3D <2000>;
> +		enable-active-high;
> +	};
> +
> +	reg_12v0: regulator-12v0 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "12V0";
> +		regulator-min-microvolt =3D <12000000>;
> +		regulator-max-microvolt =3D <12000000>;
> +		gpio =3D <&expander1 15 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_pwm_fan: regulator-pwm-fan {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "FAN_PWR";
> +		regulator-min-microvolt =3D <12000000>;
> +		regulator-max-microvolt =3D <12000000>;
> +		gpio =3D <&expander3 15 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		vin-supply =3D <&reg_12v0>;
> +	};
> +
> +	reg_lvds: regulator-lvds {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "LCD_PWR_EN";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&expander2 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	/* USB NC limitations, RM 162.1.2 VBUS limitations */
> +	reg_vbus_usb3: regulator-vbus-usb3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-name =3D "USB3_VBUS";
> +		gpio =3D <&gpio4 1 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	sfp_xfi: sfp-xfi {
> +		compatible =3D "sff,sfp";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_sfp>;
> +		i2c-bus =3D <&lpi2c7>;
> +		maximum-power-milliwatt =3D <2000>;
> +		mod-def0-gpios =3D <&expander1 3 GPIO_ACTIVE_LOW>;
> +		tx-fault-gpios =3D <&gpio2 30 GPIO_ACTIVE_HIGH>;
> +		los-gpios =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
> +		tx-disable-gpios =3D <&expander2 2 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	sound {
> +		compatible =3D "fsl,imx-audio-tlv320aic32x4";
> +		model =3D "tqm-tlv320aic32";
> +		audio-codec =3D <&tlv320aic3x04>;
> +		audio-cpu =3D <&sai3>;
> +		audio-routing =3D
> +			"IN3_L", "Mic Jack",
> +			"Mic Jack", "Mic Bias",
> +			"Headphone Jack", "HPL",
> +			"Headphone Jack", "HPR",
> +			"IN1_L", "Line In Jack",
> +			"IN1_R", "Line In Jack",
> +			"Line Out Jack", "LOL",
> +			"Line Out Jack", "LOR";
> +	};
> +};
> +
> +&adc1 {
> +	status =3D "okay";
> +};
> +
> +&enetc_port0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_enetc0>;
> +	phy-handle =3D <&ethphy0>;
> +	phy-mode =3D "rgmii-id";
> +	status =3D "okay";
> +};
> +
> +&enetc_port1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_enetc1>;
> +	phy-handle =3D <&ethphy1>;
> +	phy-mode =3D "rgmii-id";
> +	status =3D "okay";
> +};
> +
> +/* No support for XFI yet */
> +&enetc_port2 {
> +	sfp =3D <&sfp_xfi>;
> +	phy-mode =3D "10gbase-r";
> +	clocks =3D <&clk_eth>;
> +	clock-names =3D "enet_ref_clk";
> +	managed =3D "in-band-status";
> +	status =3D "disabled";
> +};
> +
> +&flexcan1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> +	status =3D "okay";
> +};
> +
> +&flexcan2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan2>;
> +	status =3D "okay";
> +};
> +
> +&lpi2c2 {
> +	tlv320aic3x04: audio-codec@18 {
> +		compatible =3D "ti,tlv320aic32x4";
> +		reg =3D <0x18>;
> +		clocks =3D <&scmi_clk IMX95_CLK_SAI3>;
> +		clock-names =3D "mclk";
> +		reset-gpios =3D <&expander1 14 GPIO_ACTIVE_LOW>;
> +		iov-supply =3D <&reg_v3v3_mb>;
> +		ldoin-supply =3D <&reg_v3v3_mb>;
> +	};
> +
> +	fan_controller: fan-controller@2f {
> +		compatible =3D "microchip,emc2301", "microchip,emc2305";
> +		reg =3D <0x2f>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		#pwm-cells =3D <3>;
> +		status =3D "okay";
> +
> +		fan: fan@0 {
> +			reg =3D <0x0>;
> +			pwms =3D <&fan_controller 40000 PWM_POLARITY_INVERTED 1>;
> +			#cooling-cells =3D <2>;
> +			fan-supply =3D <&reg_pwm_fan>;
> +		};
> +	};
> +
> +	ptn5110: usb-typec@50 {
> +		compatible =3D "nxp,ptn5110", "tcpci";
> +		reg =3D <0x50>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_typec>;
> +		interrupt-parent =3D <&gpio2>;
> +		interrupts =3D <28 IRQ_TYPE_LEVEL_LOW>;
> +
> +		typec_con: connector {
> +			compatible =3D "usb-c-connector";
> +			label =3D "X9";
> +			power-role =3D "source";
> +			data-role =3D "dual";
> +			source-pdos =3D <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)>;
> +			self-powered;
> +
> +			port {
> +				typec_con_hs: endpoint {
> +					remote-endpoint =3D <&typec_hs>;
> +				};
> +			};
> +		};
> +	};
> +
> +	sensor_mb: temperature-sensor@1e {
> +		compatible =3D "nxp,se97b", "jedec,jc-42.4-temp";
> +		reg =3D <0x1e>;
> +	};
> +
> +	eeprom_mb: eeprom@56 {
> +		compatible =3D "nxp,se97b", "atmel,24c02";
> +		reg =3D <0x56>;
> +		pagesize =3D <16>;
> +		vcc-supply =3D <&reg_v3v3_mb>;
> +	};
> +
> +	pcieclk: clock-generator@68 {
> +		compatible =3D "renesas,9fgv0441";
> +		reg =3D <0x68>;
> +		clocks =3D <&clk_xtal25>;
> +		#clock-cells =3D <1>;
> +	};
> +
> +	/* D39 IN/OUT 3V3 */
> +	expander1: gpio@74 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x74>;
> +		vcc-supply =3D <&reg_v3v3_mb>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_expander1>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +		interrupt-parent =3D <&gpio2>;
> +		interrupts =3D <14 IRQ_TYPE_EDGE_FALLING>;
> +
> +		gpio-line-names =3D
> +			/* 00 */ "BUTTON_B#", "CAM0_SYNC_3V3",
> +			/* 02 */ "CAM1_SYNC_3V3", "SFP_MOD_ABS",
> +			/* 04 */ "DIG_IN1", "DIG_IN2",
> +			/* 06 */ "DIG_IN3", "DIG_IN4",
> +			/* 08 */ "DIG_OUT_1_2_STATE", "DIG_OUT_3_4_STATE",
> +			/* 10 */ "DIG_OUT_1_EN", "DIG_OUT_2_EN",
> +			/* 12 */ "DIG_OUT_3_EN", "DIG_OUT_4_EN",
> +			/* 14 */ "AUDIO_RST#", "12V_EN";
> +	};
> +
> +	/* D40 OUT 3V3 */
> +	expander2: gpio@75 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x75>;
> +		vcc-supply =3D <&reg_3v3>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +
> +		gpio-line-names =3D
> +			/* 00 */ "ETH10G_REFCLK_EN", "ETH10G_REFCLK_RST#",
> +			/* 02 */ "SFP_TX_DIS", "USB3_RESET#",
> +			/* 04 */ "USB2_RESET#", "LCD_RESET#",
> +			/* 06 */ "LCD_BLT_EN", "LCD_PWR_EN",
> +			/* 08 */ "M2_KEYE_PERST#", "M2_KEYE_WDISABLE1#",
> +			/* 10 */ "M2_KEYE_WDISABLE2#", "M2_KEYB_PERST#",
> +			/* 12 */ "M2_KEYB_WDISABLE1#", "USER_LED1",
> +			/* 14 */ "USER_LED2", "3V3A_10G_EN";
> +
> +		eth10g-refclk-en-hog {
> +			gpio-hog;
> +			gpios =3D <0 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name =3D "ETH10G_REFCLK_EN";
> +		};
> +
> +		eth10g-refclk-rst-hog {
> +			gpio-hog;
> +			gpios =3D <1 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name =3D "ETH10G_REFCLK_RST#";
> +		};
> +
> +		m2_keye_wdisable1_hog: m2-keye-wdisable1-hog {
> +			gpio-hog;
> +			gpios =3D <9 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name =3D "M2_KEYE_WDISABLE1#";
> +		};
> +
> +		m2_keye_wdisable2_hog: m2-keye-wdisable2-hog {
> +			gpio-hog;
> +			gpios =3D <10 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name =3D "M2_KEYE_WDISABLE2#";
> +		};
> +
> +		m2-keyb-wdisable1-hog {
> +			gpio-hog;
> +			gpios =3D <12 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name =3D "M2_KEYB_WDISABLE1#";
> +		};
> +	};
> +
> +	/* D41 OUT 1V8 */
> +	expander3: gpio@76 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x76>;
> +		vcc-supply =3D <&reg_v1v8_mb>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +
> +		gpio-line-names =3D
> +			/* 00 */ "ENET1_RESET#", "ENET2_RESET#",
> +			/* 02 */ "M2_KEYE_SDIO_RST#", "M2_KEYE_DEV_WLAN_WAKE#",
> +			/* 04 */ "M2_KEYE_DEV_BT_WAKE", "M2_KEYB_W_DISABLE2#",
> +			/* 06 */ "M2_KEYB_RST#", "M2_KEYB_FULL_CARD_PWR_OFF#",
> +			/* 08 */ "M2_KEYB_DPR", "CAM0_PWR#",
> +			/* 10 */ "CAM1_PWR#", "CAM0_RST#",
> +			/* 12 */ "CAM1_RST#", "CAM0_TRIGGER",
> +			/* 14 */ "CAM1_TRIGGER", "FAN_PWR_EN";
> +
> +		m2-keye-sdio-rst-hog {
> +			gpio-hog;
> +			gpios =3D <2 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name =3D "M2_KEYE_SDIO_RST#";
> +		};
> +
> +		m2-keye-dev_wlan-wake-hog {
> +			gpio-hog;
> +			gpios =3D <3 GPIO_ACTIVE_LOW>;
> +			input;
> +			line-name =3D "M2_KEYE_DEV_WLAN_WAKE#";
> +		};
> +
> +		m2-keye-dev_bt-wake-hog {
> +			gpio-hog;
> +			gpios =3D <4 GPIO_ACTIVE_LOW>;
> +			input;
> +			line-name =3D "M2_KEYE_DEV_BT_WAKE#";
> +		};
> +
> +		m2-keyb-wdisable2-hog {
> +			gpio-hog;
> +			gpios =3D <5 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name =3D "M2_KEYB_WDISABLE1#";
> +		};
> +
> +		m2-keyb-rst-hog {
> +			gpio-hog;
> +			gpios =3D <6 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name =3D "M2_KEYB_RST#";
> +		};
> +
> +		m2-keyb-full-card-pwr-off-hog {
> +			gpio-hog;
> +			gpios =3D <7 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name =3D "M2_KEYB_FULL_CARD_PWR_OFF#";
> +		};
> +	};
> +};
> +
> +/* X4 + XFP */
> +&lpi2c7 {
> +	clock-frequency =3D <400000>;
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&pinctrl_lpi2c7>;
> +	pinctrl-1 =3D <&pinctrl_lpi2c7_recovery>;
> +	scl-gpios =3D <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios =3D <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status =3D "okay";
> +
> +	/* TODO: 0x19: retimer */
> +
> +	/* 0x50 / 0x51: SFP EEPROM */
> +};
> +
> +/* X4 */
> +&lpspi4 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lpspi4>;
> +	cs-gpios =3D <&gpio5 13 GPIO_ACTIVE_LOW>, <&gpio5 14 GPIO_ACTIVE_LOW>;
> +	status =3D "okay";
> +};
> +
> +&lpuart1 {
> +	/* console */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lpuart1>;
> +	status =3D "okay";
> +};
> +
> +&lpuart2 {
> +	/* SM */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lpuart2>;
> +	status =3D "reserved";
> +};
> +
> +&lpuart5 {
> +	/* X16 M.2 KEY E */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lpuart5>;
> +	status =3D "okay";
> +};
> +
> +&lpuart7 {
> +	/* X5 */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lpuart7>;
> +	status =3D "okay";
> +};
> +
> +&lpuart8 {
> +	/* X15 */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lpuart8>;
> +	linux,rs485-enabled-at-boot-time;
> +	status =3D "okay";
> +};
> +
> +&netc_blk_ctrl {
> +	status =3D "okay";
> +};
> +
> +&netc_emdio {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_emdio>;
> +	status =3D "okay";
> +
> +	/* IRQ pin is AON GPIO, not usable */
> +	ethphy0: ethernet-phy@0 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0>;
> +		reset-gpios =3D <&expander3 0 GPIO_ACTIVE_LOW>;
> +		reset-assert-us =3D <500000>;
> +		reset-deassert-us =3D <50000>;
> +		ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> +		ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> +		ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +		ti,dp83867-rxctrl-strap-quirk;
> +		ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> +	};
> +
> +	ethphy1: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <1>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_ethphy1>;
> +		reset-gpios =3D <&expander3 1 GPIO_ACTIVE_LOW>;
> +		reset-assert-us =3D <500000>;
> +		reset-deassert-us =3D <50000>;
> +		interrupt-parent =3D <&gpio4>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +		ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> +		ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> +		ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +		ti,dp83867-rxctrl-strap-quirk;
> +		ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> +	};
> +};
> +
> +&netc_timer {
> +	status =3D "okay";
> +};
> +
> +&netcmix_blk_ctrl {
> +	status =3D "okay";
> +};
> +
> +/* X16 M2 / E-Key mPCIe */
> +&pcie0 {
> +	pinctrl-0 =3D <&pinctrl_pcie0>;
> +	pinctrl-names =3D "default";
> +	clocks =3D <&scmi_clk IMX95_CLK_HSIO>,
> +		 <&scmi_clk IMX95_CLK_HSIOPLL>,
> +		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> +		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> +		 <&pcieclk 1>;
> +	clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
> +	reset-gpios =3D <&expander2 8 GPIO_ACTIVE_LOW>;
> +	/* Not supported on REV.0100 */
> +	/* supports-clkreq; */
> +	status =3D "okay";
> +};
> +
> +/* X17 M2 / B-Key PCIe */
> +&pcie1 {
> +	pinctrl-0 =3D <&pinctrl_pcie1>;
> +	pinctrl-names =3D "default";
> +	clocks =3D <&scmi_clk IMX95_CLK_HSIO>,
> +		 <&scmi_clk IMX95_CLK_HSIOPLL>,
> +		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> +		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> +		 <&pcieclk 0>;
> +	clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
> +	reset-gpios =3D <&expander2 11 GPIO_ACTIVE_LOW>;
> +	/* Not supported on REV.0100 */
> +	/* supports-clkreq; */
> +	status =3D "okay";
> +};
> +
> +&reg_sdvmmc {
> +	status =3D "okay";
> +};
> +
> +&sai3 {
> +	#sound-dai-cells =3D <0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_sai3>;
> +	assigned-clocks =3D <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX95_CLK_SAI3>;
> +	assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
> +	assigned-clock-rates =3D <3932160000>,
> +			       <3612672000>, <393216000>,
> +			       <361267200>, <12288000>;
> +	fsl,sai-mclk-direction-output;
> +	status =3D "okay";
> +};
> +
> +&scmi_bbm {
> +	linux,code =3D <KEY_POWER>;
> +};
> +
> +&thermal_zones {
> +	a55-thermal {
> +		trips {
> +			cpu_active0: trip-active0 {
> +				temperature =3D <40000>;
> +				hysteresis =3D <5000>;
> +				type =3D "active";
> +			};
> +
> +			cpu_active1: trip-active1 {
> +				temperature =3D <48000>;
> +				hysteresis =3D <3000>;
> +				type =3D "active";
> +			};
> +
> +			cpu_active2: trip-active2 {
> +				temperature =3D <60000>;
> +				hysteresis =3D <10000>;
> +				type =3D "active";
> +			};
> +		};
> +
> +		cooling-maps {
> +			map1 {
> +				trip =3D <&cpu_active0>;
> +				cooling-device =3D <&fan 0 2>;
> +			};
> +
> +			map2 {
> +				trip =3D <&cpu_active1>;
> +				cooling-device =3D <&fan 3 5>;
> +			};
> +
> +			map3 {
> +				trip =3D <&cpu_active2>;
> +				cooling-device =3D <&fan 6 10>;
> +			};
> +		};
> +	};
> +};
> +
> +&tpm3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_tpm3>;
> +	status =3D "okay";
> +};
> +
> +&tpm5 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_tpm5>;
> +};
> +
> +&usb2 {
> +	dr_mode =3D "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	disable-over-current;
> +	samsung,picophy-pre-emp-curr-control =3D <3>;
> +	samsung,picophy-dc-vol-level-adjust =3D <7>;
> +	status =3D "okay";
> +
> +	port {
> +		typec_hs: endpoint {
> +			remote-endpoint =3D <&typec_con_hs>;
> +		};
> +	};
> +};
> +
> +&usb3 {
> +	status =3D "okay";
> +};
> +
> +&usb3_dwc3 {
> +	dr_mode =3D "host";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	hub_2_0: hub@1 {
> +		compatible =3D "usb451,8142";
> +		reg =3D <1>;
> +		peer-hub =3D <&hub_3_0>;
> +		reset-gpios =3D <&expander2 3 GPIO_ACTIVE_LOW>;
> +		vdd-supply =3D <&reg_v3v3_mb>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		hub_2_1: hub@1 {
> +			compatible =3D "usb424,2514";
> +			reg =3D <1>;
> +			reset-gpios =3D <&expander2 4 GPIO_ACTIVE_LOW>;
> +			vdd-supply =3D <&reg_v3v3_mb>;
> +			vdda-supply =3D <&reg_v3v3_mb>;
> +		};
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible =3D "usb451,8140";
> +		reg =3D <2>;
> +		peer-hub =3D <&hub_2_0>;
> +		reset-gpios =3D <&expander2 3 GPIO_ACTIVE_LOW>;
> +		vdd-supply =3D <&reg_v3v3_mb>;
> +	};
> +};
> +
> +&usb3_phy {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usb3>;
> +	vbus-supply =3D <&reg_vbus_usb3>;
> +	status =3D "okay";
> +};
> +
> +/* X7 =B5SD */
> +&usdhc2 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc2>;
> +	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>;
> +	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>;
> +	vmmc-supply =3D <&reg_sdvmmc>;
> +	cd-gpios =3D <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	bus-width =3D <4>;
> +	status =3D "okay";
> +};
> +
> +&scmi_iomuxc {
> +	pinctrl_enetc0: enetc0grp {
> +		fsl,pins =3D <IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x1100>,
> +			   <IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x1100>,
> +			   <IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x1100>,
> +			   <IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x1100>,
> +			   <IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK		0x1100>,
> +			   <IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x1100>,
> +			   <IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x11e>,
> +			   <IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x11e>,
> +			   <IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x11e>,
> +			   <IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x11e>,
> +			   <IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK		0x11e>,
> +			   <IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x11e>;
> +	};
> +
> +	pinctrl_enetc1: enetc1grp {
> +		fsl,pins =3D <IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0		0x1100>,
> +			   <IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1		0x1100>,
> +			   <IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2		0x1100>,
> +			   <IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3		0x1100>,
> +			   <IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK		0x1100>,
> +			   <IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x1100>,
> +			   <IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x11e>,
> +			   <IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x11e>,
> +			   <IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x11e>,
> +			   <IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x11e>,
> +			   <IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK		0x11e>,
> +			   <IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x11e>;
> +	};
> +
> +	pinctrl_ethphy0: ethphy0grp {
> +		fsl,pins =3D <IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_GPIO1_IO_BIT9		0x1=
100>;
> +	};
> +
> +	pinctrl_ethphy1: ethphy1grp {
> +		fsl,pins =3D <IMX95_PAD_ENET1_MDC__GPIO4_IO_BIT0				0x1100>;
> +	};
> +
> +	pinctrl_expander1: expander1grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO14__GPIO2_IO_BIT14				0x1100>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins =3D <IMX95_PAD_SAI1_TXC__AONMIX_TOP_CAN1_RX		0x1300>,
> +			   <IMX95_PAD_SAI1_TXD0__AONMIX_TOP_CAN1_TX		0x31e>;
> +	};
> +
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO25__CAN2_TX		0x31e>,
> +			   <IMX95_PAD_GPIO_IO27__CAN2_RX		0x1300>;
> +	};
> +
> +	pinctrl_lpi2c7: lpi2c7grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO07__LPI2C7_SCL	0x40001b1e>,
> +			   <IMX95_PAD_GPIO_IO06__LPI2C7_SDA	0x40001b1e>;
> +	};
> +
> +	pinctrl_lpi2c7_recovery: lpi2c7recoverygrp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO07__GPIO2_IO_BIT7	0x40001b1e>,
> +			   <IMX95_PAD_GPIO_IO06__GPIO2_IO_BIT6	0x40001b1e>;
> +	};
> +
> +	pinctrl_lpspi4: lpspi4grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO37__LPSPI4_SCK	0x91e>,
> +			   <IMX95_PAD_GPIO_IO19__LPSPI5_SIN	0x191e>,
> +			   <IMX95_PAD_GPIO_IO36__LPSPI4_SOUT	0x91e>,
> +			   <IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14	0x91e>,
> +			   <IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13	0x91e>;
> +	};
> +
> +	pinctrl_lpuart1: lpuart1grp {
> +		fsl,pins =3D <IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e>,
> +			   <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x1300>;
> +	};
> +
> +	pinctrl_lpuart2: lpuart2grp {
> +		fsl,pins =3D <IMX95_PAD_UART2_TXD__AONMIX_TOP_LPUART2_TX		0x31e>,
> +			   <IMX95_PAD_UART2_RXD__AONMIX_TOP_LPUART2_RX		0x1300>;
> +	};
> +
> +	pinctrl_lpuart5: lpuart5grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO00__LPUART5_TX			0x31e>,
> +			   <IMX95_PAD_GPIO_IO01__LPUART5_RX			0x1300>,
> +			   <IMX95_PAD_GPIO_IO02__LPUART5_CTS_B			0x1300>,
> +			   <IMX95_PAD_GPIO_IO03__LPUART5_RTS_B			0x31e>;
> +	};
> +
> +	pinctrl_lpuart7: lpuart7grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO08__LPUART7_TX			0x31e>,
> +			   <IMX95_PAD_GPIO_IO09__LPUART7_RX			0x1300>,
> +			   <IMX95_PAD_GPIO_IO10__LPUART7_CTS_B			0x1300>,
> +			   <IMX95_PAD_GPIO_IO11__LPUART7_RTS_B			0x31e>;
> +	};
> +
> +	pinctrl_lpuart8: lpuart8grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO12__LPUART8_TX			0x31e>,
> +			   <IMX95_PAD_GPIO_IO13__LPUART8_RX			0x1300>,
> +			   <IMX95_PAD_GPIO_IO15__LPUART8_RTS_B			0x31e>;
> +	};
> +
> +	pinctrl_emdio: emdiogrp {
> +		fsl,pins =3D <IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC		0x51e>,
> +			   <IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO		0x51e>;
> +	};
> +
> +	pinctrl_pcie0: pcie0grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B	0x111e>;
> +	};
> +
> +	pinctrl_pcie1: pcie1grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO35__HSIOMIX_TOP_PCIE2_CLKREQ_B	0x111e>;
> +	};
> +
> +	pinctrl_sai3: sai3grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO16__SAI3_TX_BCLK			0x51e>,
> +			   <IMX95_PAD_GPIO_IO17__SAI3_MCLK			0x51e>,
> +			   <IMX95_PAD_GPIO_IO20__SAI3_RX_DATA_BIT0		0x1300>,
> +			   <IMX95_PAD_GPIO_IO21__SAI3_TX_DATA_BIT0		0x51e>,
> +			   <IMX95_PAD_GPIO_IO26__SAI3_TX_SYNC			0x51e>;
> +	};
> +
> +	pinctrl_retimer: retirmergrp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO29__GPIO2_IO_BIT29			0x1100>;
> +	};
> +
> +	pinctrl_sfp: sfpgrp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO30__GPIO2_IO_BIT30			0x1100>,
> +			   <IMX95_PAD_GPIO_IO31__GPIO2_IO_BIT31			0x1100>;
> +	};
> +
> +	pinctrl_tpm3: tpm3grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO24__TPM3_CH3			0x51e>;
> +	};
> +
> +	pinctrl_tpm5: tpm5grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO18__TPM5_CH2			0x51e>;
> +	};
> +
> +	pinctrl_typec: typcegrp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO28__GPIO2_IO_BIT28			0x1100>;
> +	};
> +
> +	pinctrl_usb3: usb3grp {
> +		fsl,pins =3D <IMX95_PAD_ENET1_MDIO__GPIO4_IO_BIT1			0x31e>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins =3D <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x1100>,
> +			   <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x51e>,
> +			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x31e>,
> +			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x131e>,
> +			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x131e>,
> +			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x131e>,
> +			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x131e>,
> +			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins =3D <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x1100>,
> +			   <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x58e>,
> +			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x38e>,
> +			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e>,
> +			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e>,
> +			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e>,
> +			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e>,
> +			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins =3D <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x1100>,
> +			   <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x5fe>,
> +			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x3fe>,
> +			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x13fe>,
> +			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x13fe>,
> +			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x13fe>,
> +			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x13fe>,
> +			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la.dtsi b/arch/a=
rm64/boot/dts/freescale/imx95-tqma9596la.dtsi
> new file mode 100644
> index 0000000000000..cc572171bf253
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la.dtsi
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2024-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + * Author: Markus Niebel
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "imx95.dtsi"
> +
> +/ {
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		/*
> +		 * DRAM base addr, size : 2048 MiB DRAM
> +		 * should be corrected by bootloader
> +		 */
> +		reg =3D <0 0x80000000 0 0x80000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		linux_cma: linux,cma {
> +			compatible =3D "shared-dma-pool";
> +			reusable;
> +			size =3D <0 0x28000000>;
> +			alloc-ranges =3D <0 0x80000000 0 0x80000000>;
> +			linux,cma-default;
> +		};
> +
> +		vpu_boot: vpu_boot@a0000000 {
> +			reg =3D <0 0xa0000000 0 0x100000>;
> +			no-map;
> +		};
> +	};
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "V_1V8";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "V_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_sdvmmc: regulator-sdvmmc {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_sdvmmc>;
> +		regulator-name =3D "SD_PWR_EN";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		off-on-delay-us =3D <12000>;
> +		enable-active-high;
> +		/* can be enabled by mainboard with SD-Card support */
> +		status =3D "disabled";
> +	};
> +};
> +
> +&adc1 {
> +	vref-supply =3D <&reg_1v8>;
> +};
> +
> +&flexspi1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexspi1>;
> +	status =3D "okay";
> +
> +	flash0: flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <66000000>;
> +		spi-tx-bus-width =3D <4>;
> +		spi-rx-bus-width =3D <4>;
> +		vcc-supply =3D <&reg_1v8>;
> +
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +		};
> +	};
> +};
> +
> +/* System Manager */
> +&gpio1 {
> +	status =3D "reserved";
> +};
> +
> +/* System Manager */
> +&lpi2c1 {
> +	status =3D "reserved";
> +};
> +
> +&lpi2c2 {
> +	clock-frequency =3D <400000>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lpi2c2>;
> +	status =3D "okay";
> +
> +	pcf85063: rtc@51 {
> +		compatible =3D "nxp,pcf85063a";
> +		reg =3D <0x51>;
> +		quartz-load-femtofarads =3D <7000>;
> +	};
> +
> +	m24c64: eeprom@54 {
> +		compatible =3D "atmel,24c64";
> +		reg =3D <0x54>;
> +		pagesize =3D <32>;
> +		vcc-supply =3D <&reg_3v3>;
> +	};
> +
> +	/* protectable identification memory (part of M24C64-D @54) */
> +	eeprom@5c {
> +		compatible =3D "atmel,24c64d-wl";
> +		reg =3D <0x5c>;
> +		pagesize =3D <32>;
> +		vcc-supply =3D <&reg_3v3>;
> +	};
> +
> +	imu@6b {
> +		compatible =3D "st,ism330dhcx";
> +		reg =3D <0x6b>;
> +		vdd-supply =3D <&reg_3v3>;
> +		vddio-supply =3D <&reg_3v3>;
> +	};
> +};
> +
> +&thermal_zones {
> +	pf09-thermal {
> +		polling-delay =3D <2000>;
> +		polling-delay-passive =3D <250>;
> +		thermal-sensors =3D <&scmi_sensor 2>;
> +
> +		trips {
> +			pf09_alert: trip0 {
> +				hysteresis =3D <2000>;
> +				temperature =3D <140000>;
> +				type =3D "passive";
> +			};
> +
> +			pf09_crit: trip1 {
> +				hysteresis =3D <2000>;
> +				temperature =3D <155000>;
> +				type =3D "critical";
> +			};
> +		};
> +	};
> +
> +	pf53arm-thermal {
> +		polling-delay =3D <2000>;
> +		polling-delay-passive =3D <250>;
> +		thermal-sensors =3D <&scmi_sensor 4>;
> +
> +		cooling-maps {
> +			map0 {
> +				trip =3D <&pf5301_alert>;
> +				cooling-device =3D
> +					<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A55_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A55_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A55_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A55_4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A55_5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +			};
> +		};
> +
> +		trips {
> +			pf5301_alert: trip0 {
> +				hysteresis =3D <2000>;
> +				temperature =3D <140000>;
> +				type =3D "passive";
> +			};
> +
> +			pf5301_crit: trip1 {
> +				hysteresis =3D <2000>;
> +				temperature =3D <155000>;
> +				type =3D "critical";
> +			};
> +		};
> +	};
> +
> +	pf53soc-thermal {
> +		polling-delay =3D <2000>;
> +		polling-delay-passive =3D <250>;
> +		thermal-sensors =3D <&scmi_sensor 3>;
> +
> +		trips {
> +			pf5302_alert: trip0 {
> +				hysteresis =3D <2000>;
> +				temperature =3D <140000>;
> +				type =3D "passive";
> +			};
> +
> +			pf5302_crit: trip1 {
> +				hysteresis =3D <2000>;
> +				temperature =3D <155000>;
> +				type =3D "critical";
> +			};
> +		};
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>;
> +	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>;
> +	bus-width =3D <8>;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +	status =3D "okay";
> +};
> +
> +&wdog3 {
> +	status =3D "okay";
> +};
> +
> +&scmi_iomuxc {
> +	pinctrl_flexspi1: flexspi1grp {
> +		fsl,pins =3D <IMX95_PAD_XSPI1_SS0_B__FLEXSPI1_A_SS0_B	0x19e>,
> +			   <IMX95_PAD_XSPI1_DATA0__FLEXSPI1_A_DATA_BIT0	0x19e>,
> +			   <IMX95_PAD_XSPI1_DATA1__FLEXSPI1_A_DATA_BIT1	0x19e>,
> +			   <IMX95_PAD_XSPI1_DATA2__FLEXSPI1_A_DATA_BIT2	0x19e>,
> +			   <IMX95_PAD_XSPI1_DATA3__FLEXSPI1_A_DATA_BIT3	0x19e>,
> +			   /* SION to allow clock loopback from pad */
> +			   <IMX95_PAD_XSPI1_SCLK__FLEXSPI1_A_SCLK	0x4000019e>,
> +			   <IMX95_PAD_XSPI1_DQS__FLEXSPI1_A_DQS		0x4000019e>;
> +	};
> +
> +	pinctrl_lpi2c2: lpi2c2grp {
> +		fsl,pins =3D <IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL	0x4000191e>,
> +			   <IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA	0x4000191e>;
> +	};
> +
> +	pinctrl_sdvmmc: sdvmmcgrp {
> +		fsl,pins =3D <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7	0x11e>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins =3D <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x158e>,
> +			   <IMX95_PAD_SD1_CMD__USDHC1_CMD	0x138e>,
> +			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0	0x138e>,
> +			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1	0x138e>,
> +			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2	0x138e>,
> +			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3	0x138e>,
> +			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4	0x138e>,
> +			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5	0x138e>,
> +			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6	0x138e>,
> +			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7	0x138e>,
> +			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE	0x158e>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins =3D <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x158e>,
> +			   <IMX95_PAD_SD1_CMD__USDHC1_CMD	0x138e>,
> +			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0	0x138e>,
> +			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1	0x138e>,
> +			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2	0x138e>,
> +			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3	0x138e>,
> +			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4	0x138e>,
> +			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5	0x138e>,
> +			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6	0x138e>,
> +			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7	0x138e>,
> +			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE	0x158e>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins =3D <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x15fe>,
> +			   <IMX95_PAD_SD1_CMD__USDHC1_CMD	0x13fe>,
> +			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0	0x13fe>,
> +			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1	0x13fe>,
> +			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2	0x13fe>,
> +			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3	0x13fe>,
> +			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4	0x13fe>,
> +			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5	0x13fe>,
> +			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6	0x13fe>,
> +			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe>,
> +			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe>;
> +	};
> +};
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



