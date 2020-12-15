Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0422DB286
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 18:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730409AbgLORWw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 12:22:52 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:36663 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730187AbgLORWp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 12:22:45 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 80AE21BF207;
        Tue, 15 Dec 2020 17:22:00 +0000 (UTC)
Date:   Tue, 15 Dec 2020 18:22:11 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out
 ov5640 nodes
Message-ID: <20201215172211.srhbkulj653eweu2@uno.localdomain>
References: <20201126134031.4115211-1-geert@linux-m68k.org>
 <20201126134031.4115211-2-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201126134031.4115211-2-geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Nov 26, 2020 at 02:40:30PM +0100, Geert Uytterhoeven wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The camera daughter board can also be connected to 8-bit ov7725 sensors,
> so in preparation for configurable option to choose depending on the
> camera's connected separate out the ov5640 nodes in a dtsi file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> [geert: describe a single camera in the .dtsi, include multiple times]
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v4:
>   - Describe a single camera in the .dtsi file,
>   - Include the .dtsi multiple times,
>
>  .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 151 +++++++++---------
>  .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi |  30 ++++
>  2 files changed, 103 insertions(+), 78 deletions(-)
>  create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
>
> diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> index 98c3fbd89fa6c5c7..00634eb58ce39da5 100644
> --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> @@ -91,67 +91,12 @@ &hscif0 {
>  	status = "okay";
>  };
>
> -&i2c0 {
> -	ov5640@3c {
> -		compatible = "ovti,ov5640";
> -		reg = <0x3c>;
> -		clocks = <&mclk_cam1>;
> -		clock-names = "xclk";
> -
> -		port {
> -			ov5640_0: endpoint {
> -				bus-width = <8>;
> -				data-shift = <2>;
> -				bus-type = <6>;
> -				pclk-sample = <1>;
> -				remote-endpoint = <&vin0ep>;
> -			};
> -		};
> -	};
> -};
> -
>  &i2c1 {
>  	pinctrl-0 = <&i2c1_pins>;
>  	pinctrl-names = "default";
>
>  	status = "okay";
>  	clock-frequency = <400000>;

i2c1 and i2c3 are here unconditionally enabled, while i2c0 and i2c2
seem to be already enabled and configured already in the included
.dtsi

Wouldn't it be more approriate to enable and configure i2c1 and i2c3
in the r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi only if a camera
is there connected ?

> -
> -	ov5640@3c {
> -		compatible = "ovti,ov5640";
> -		reg = <0x3c>;
> -		clocks = <&mclk_cam2>;
> -		clock-names = "xclk";
> -
> -		port {
> -			ov5640_1: endpoint {
> -				bus-width = <8>;
> -				data-shift = <2>;
> -				bus-type = <6>;
> -				pclk-sample = <1>;
> -				remote-endpoint = <&vin1ep>;
> -			};
> -		};
> -	};
> -};
> -
> -&i2c2 {
> -	ov5640@3c {
> -		compatible = "ovti,ov5640";
> -		reg = <0x3c>;
> -		clocks = <&mclk_cam3>;
> -		clock-names = "xclk";
> -
> -		port {
> -			ov5640_2: endpoint {
> -				bus-width = <8>;
> -				data-shift = <2>;
> -				bus-type = <6>;
> -				pclk-sample = <1>;
> -				remote-endpoint = <&vin2ep>;
> -			};
> -		};
> -	};
>  };
>
>  &i2c3 {
> @@ -160,23 +105,6 @@ &i2c3 {
>
>  	status = "okay";
>  	clock-frequency = <400000>;
> -
> -	ov5640@3c {
> -		compatible = "ovti,ov5640";
> -		reg = <0x3c>;
> -		clocks = <&mclk_cam4>;
> -		clock-names = "xclk";
> -
> -		port {
> -			ov5640_3: endpoint {
> -				bus-width = <8>;
> -				data-shift = <2>;
> -				bus-type = <6>;
> -				pclk-sample = <1>;
> -				remote-endpoint = <&vin3ep>;
> -			};
> -		};
> -	};
>  };
>
>  &pfc {
> @@ -267,6 +195,21 @@ &scifb1 {
>  	cts-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
>  };
>
> +/*
> + * Below configuration ties VINx endpoints to ov5640/ov7725 camera endpoints
> + *
> + * Uncomment the #include statements to change configuration
> + */
> +
> +/* 8bit CMOS Camera 1 (J13) */
> +#define CAM_PARENT_I2C		i2c0
> +#define MCLK_CAM		mclk_cam1
> +#define CAM_EP			cam0ep
> +#define VIN_EP			vin0ep
> +#undef CAM_ENABLED
> +#include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
> +
> +#ifdef CAM_ENABLED
>  &vin0 {
>  	/*
>  	 * Set SW2 switch on the SOM to 'ON'
> @@ -278,13 +221,28 @@ &vin0 {
>
>  	port {
>  		vin0ep: endpoint {
> -			remote-endpoint = <&ov5640_0>;
> +			remote-endpoint = <&cam0ep>;
>  			bus-width = <8>;
>  			bus-type = <6>;
>  		};
>  	};
>  };
> -
> +#endif /* CAM_ENABLED */
> +
> +#undef CAM_PARENT_I2C
> +#undef MCLK_CAM
> +#undef CAM_EP
> +#undef VIN_EP
> +
> +/* 8bit CMOS Camera 2 (J14) */
> +#define CAM_PARENT_I2C		i2c1
> +#define MCLK_CAM		mclk_cam2
> +#define CAM_EP			cam1ep
> +#define VIN_EP			vin1ep
> +#undef CAM_ENABLED
> +#include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
> +
> +#ifdef CAM_ENABLED
>  &vin1 {
>  	/* Set SW1 switch on the SOM to 'ON' */
>  	status = "okay";
> @@ -293,13 +251,29 @@ &vin1 {
>
>  	port {
>  		vin1ep: endpoint {
> -			remote-endpoint = <&ov5640_1>;
> +			remote-endpoint = <&cam1ep>;
>  			bus-width = <8>;
>  			bus-type = <6>;
>  		};
>  	};
>  };
>
> +#endif /* CAM_ENABLED */
> +
> +#undef CAM_PARENT_I2C
> +#undef MCLK_CAM
> +#undef CAM_EP
> +#undef VIN_EP
> +
> +/* 8bit CMOS Camera 3 (J12) */
> +#define CAM_PARENT_I2C		i2c2
> +#define MCLK_CAM		mclk_cam3
> +#define CAM_EP			cam2ep
> +#define VIN_EP			vin2ep
> +#undef CAM_ENABLED
> +#include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
> +
> +#ifdef CAM_ENABLED
>  &vin2 {
>  	status = "okay";
>  	pinctrl-0 = <&vin2_pins>;
> @@ -307,14 +281,29 @@ &vin2 {
>
>  	port {
>  		vin2ep: endpoint {
> -			remote-endpoint = <&ov5640_2>;
> +			remote-endpoint = <&cam2ep>;
>  			bus-width = <8>;
>  			data-shift = <8>;
>  			bus-type = <6>;
>  		};
>  	};
>  };
> -
> +#endif /* CAM_ENABLED */
> +
> +#undef CAM_PARENT_I2C
> +#undef MCLK_CAM
> +#undef CAM_EP
> +#undef VIN_EP
> +
> +/* 8bit CMOS Camera 4 (J11) */
> +#define CAM_PARENT_I2C		i2c3
> +#define MCLK_CAM		mclk_cam4
> +#define CAM_EP			cam3ep
> +#define VIN_EP			vin3ep
> +#undef CAM_ENABLED
> +#include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
> +
> +#ifdef CAM_ENABLED
>  &vin3 {
>  	status = "okay";
>  	pinctrl-0 = <&vin3_pins>;
> @@ -322,9 +311,15 @@ &vin3 {
>
>  	port {
>  		vin3ep: endpoint {
> -			remote-endpoint = <&ov5640_3>;
> +			remote-endpoint = <&cam3ep>;
>  			bus-width = <8>;
>  			bus-type = <6>;
>  		};
>  	};
>  };
> +#endif /* CAM_ENABLED */
> +
> +#undef CAM_PARENT_I2C
> +#undef MCLK_CAM
> +#undef CAM_EP
> +#undef VIN_EP
> diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> new file mode 100644
> index 0000000000000000..408016620f5b1a04
> --- /dev/null
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This include file ties a VIN interface with a single ov5640 sensor on
> + * the iWave-RZ/G1H Qseven board development platform connected with the
> + * camera daughter board.
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +#define CAM_ENABLED	1
> +
> +&CAM_PARENT_I2C {
> +	ov5640@3c {
> +		compatible = "ovti,ov5640";
> +		reg = <0x3c>;
> +		clocks = <&MCLK_CAM>;
> +		clock-names = "xclk";
> +		status = "okay";
> +
> +		port {
> +			CAM_EP: endpoint {
> +				bus-width = <8>;
> +				data-shift = <2>;
> +				bus-type = <6>;
> +				pclk-sample = <1>;
> +				remote-endpoint = <&VIN_EP>;
> +			};
> +		};
> +	};
> +};
> --
> 2.25.1
>
