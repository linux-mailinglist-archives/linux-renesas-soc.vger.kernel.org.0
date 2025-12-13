Return-Path: <linux-renesas-soc+bounces-25736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78291CBB20F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Dec 2025 19:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 898B3304D490
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Dec 2025 18:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D4B23817F;
	Sat, 13 Dec 2025 18:13:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D32718AFD
	for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Dec 2025 18:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765649634; cv=none; b=CiI14kd4YhrwEhiYskhYs446WkJx29qYl0Chuu7no+MiZSM76IYZtRBYajlrceWggWzqJtU9BKx3iKqU+WVN0MZY3v5BYd+iclhOR3u6aVrCyCvtu2F3sPz4rVaxwfIE6GTgHcZNkS2pcIyOU1ky7pVTzBzb5zvoWG9QXv/H9RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765649634; c=relaxed/simple;
	bh=XB4gRrHXrRXt64MEO58BhEdoY8tPJIgTZP/D/UR0GS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RizXK/XJoTFSRQ5wG31cVQlchUSBjZXnWGqj3BWkX4oc2C5RZQtNhvwoLqTuK9vRZlUpkt5u7iV0aPqk8xt1pee1tndg5igeNKnIG/xhy9PdiNEJ2kiAbTUuMOcvAx+3Jea2gMpy43QxRh1Ea1GVEpmAX2TzRx4P3KmGAPSXklY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vUU7S-00011q-8I; Sat, 13 Dec 2025 19:13:26 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vUU7Q-005UpD-2e;
	Sat, 13 Dec 2025 19:13:24 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vUU7Q-005FlK-2A;
	Sat, 13 Dec 2025 19:13:24 +0100
Date: Sat, 13 Dec 2025 19:13:24 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, barebox@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <20251213181324.u32ztfblkknfpz44@pengutronix.de>
References: <20251212203226.458694-5-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212203226.458694-5-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

Hi Rob,

On 25-12-12, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.

not in the tree but by other projects, please see below.

> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
>  .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
>  .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ----------------
>  .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 -------------------
>  4 files changed, 123 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> deleted file mode 100644
> index 5a9b819d7ee8..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0 OR X11
> -/*
> - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
> - */
> -
> -#include "imx6dl.dtsi"
> -#include "imx6qdl-kontron-samx6i.dtsi"
> -
> -/ {
> -	model = "Kontron SMARC-sAMX6i Dual-Lite/Solo";
> -	compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
> -};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> deleted file mode 100644
> index e76963436079..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0 OR X11
> -/*
> - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
> - */
> -
> -#include "imx6q.dtsi"
> -#include "imx6qdl-kontron-samx6i.dtsi"
> -
> -/ {
> -	model = "Kontron SMARC-sAMX6i Quad/Dual";
> -	compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
> -};

I can't speak for the other two .dtsi files but both kontron .dtsi files
are used by barebox:

 - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/imx6dl-samx6i.dts#L8
 - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/imx6q-samx6i.dts#L8

Removing them here will cause a regression for barebox.

Regards,
  Marco


> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> deleted file mode 100644
> index 3a968782e854..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> -//
> -// Copyright 2017 NXP
> -
> -#include "imx6qdl-pico.dtsi"
> -
> -/ {
> -	leds {
> -		compatible = "gpio-leds";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_gpio_leds>;
> -
> -		led {
> -			label = "gpio-led";
> -			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> -
> -};
> -
> -&i2c1 {
> -	mpl3115@60 {
> -		compatible = "fsl,mpl3115";
> -		reg = <0x60>;
> -	};
> -};
> -
> -&i2c2 {
> -	io-expander@25 {
> -		compatible = "nxp,pca9554";
> -		reg = <0x25>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		#interrupt-cells = <2>;
> -	};
> -
> -};
> -
> -&iomuxc {
> -	pinctrl_gpio_leds: gpioledsgrp {
> -		fsl,pins = <
> -			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
> -		>;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> deleted file mode 100644
> index 3d56a4216448..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> -
> -#include "imx6qdl-pico.dtsi"
> -
> -/ {
> -	leds {
> -		compatible = "gpio-leds";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_gpio_leds>;
> -
> -		led {
> -			label = "gpio-led";
> -			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> -
> -};
> -
> -&i2c1 {
> -	adc@52 {
> -		compatible = "ti,adc081c";
> -		reg = <0x52>;
> -		vref-supply = <&reg_2p5v>;
> -	};
> -};
> -
> -&i2c2 {
> -	io-expander@25 {
> -		compatible = "nxp,pca9554";
> -		reg = <0x25>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		#interrupt-cells = <2>;
> -	};
> -};
> -
> -&i2c3 {
> -	rtc@68 {
> -		compatible = "dallas,ds1337";
> -		reg = <0x68>;
> -	};
> -};
> -
> -&pcie {
> -	status = "okay";
> -};
> -
> -&iomuxc {
> -	pinctrl_gpio_leds: gpioledsgrp {
> -		fsl,pins = <
> -			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
> -		>;
> -	};
> -};
> -- 
> 2.51.0
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

