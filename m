Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06E32DAC64
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 12:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgLOLue (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 06:50:34 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:55781 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728891AbgLOLu0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 06:50:26 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 66DF1FF812;
        Tue, 15 Dec 2020 11:49:38 +0000 (UTC)
Date:   Tue, 15 Dec 2020 12:49:49 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support
 for 8-bit ov7725 sensors
Message-ID: <20201215114949.teyhlmyhejck7jw2@uno.localdomain>
References: <20201126103053.29881-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201126103053.29881-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201126103053.29881-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Thu, Nov 26, 2020 at 10:30:53AM +0000, Lad Prabhakar wrote:
> The 8-bit ov7725 sensors can also be connected to the camera daughter
> board.
>
> This patch creates a separate dtsi file for ov7725 sensors and is included
> in r8a7742-iwg21d-q7-dbcm-ca.dts. The user can set VINx_SENSOR depending
> on the cameras connected.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |   7 ++
>  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi    | 112 ++++++++++++++++++
>  2 files changed, 119 insertions(+)
>  create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi
>
> diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> index 1ab4f9771a34..915ff5fd437c 100644
> --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> @@ -11,6 +11,7 @@
>
>  #define SENSOR_NONE		1
>  #define SENSOR_OV5640		2
> +#define SENSOR_OV7725		3
>
>  /* 8bit CMOS Camera 1 (J13) */
>  #define CAM1_PARENT_I2C		i2c0
> @@ -40,6 +41,11 @@
>   * VIN2 interface and also the ov5640 node connected to it)
>   *      #define VIN2_SENSOR		SENSOR_NONE
>   *
> + * To tie VINx endpoints to ov7725_x endpoints set VINx_SENSOR to
> + * SENSOR_OV7725 for example if ov7725_3 is connected to the VIN3
> + * interface set the below (this disables the ov5640_3)
> + *      #define VIN3_SENSOR		SENSOR_OV7725
> + *
>   */
>  #define VIN0_SENSOR		SENSOR_OV5640
>  #define VIN1_SENSOR		SENSOR_OV5640
> @@ -47,6 +53,7 @@
>  #define VIN3_SENSOR		SENSOR_OV5640
>
>  #include "r8a7742-iwg21d-q7-dbcm-ov5640.dtsi"
> +#include "r8a7742-iwg21d-q7-dbcm-ov7725.dtsi"

Mmm, can't we alternatively include one .dtsi or the other depending
on a define symbol ? The .dtsi describe pluggable expansion boards,
they cannot be mixed, right ?

Thanks
  j

>

>  #if (VIN0_SENSOR == SENSOR_NONE)
>  #undef VIN0_REMOTE_EP
> diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi
> new file mode 100644
> index 000000000000..054d0a7cc5ce
> --- /dev/null
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This include file ties VIN interfaces with ov7725 sensors on
> + * iWave-RZ/G1H Qseven board development platform connected with
> + * camera daughter board.
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +#if (VIN0_SENSOR == SENSOR_OV7725)
> +#define OV7725_0_STATUS		"okay"
> +#define OV7725_0_REMOTE_EP	&VIN0_EP
> +#define VIN0_REMOTE_EP		&ov7725_0
> +#else
> +#define OV7725_0_STATUS		"disabled"
> +#define OV7725_0_REMOTE_EP	0
> +#endif
> +
> +#if (VIN1_SENSOR == SENSOR_OV7725)
> +#define OV7725_1_STATUS		"okay"
> +#define OV7725_1_REMOTE_EP	&VIN1_EP
> +#define VIN1_REMOTE_EP		&ov7725_1
> +#else
> +#define OV7725_1_STATUS		"disabled"
> +#define OV7725_1_REMOTE_EP	0
> +#endif
> +
> +#if (VIN2_SENSOR == SENSOR_OV7725)
> +#define OV7725_2_STATUS		"okay"
> +#define OV7725_2_REMOTE_EP	&VIN2_EP
> +#define VIN2_REMOTE_EP		&ov7725_2
> +#else
> +#define OV7725_2_STATUS		"disabled"
> +#define OV7725_2_REMOTE_EP	0
> +#endif
> +
> +#if (VIN3_SENSOR == SENSOR_OV7725)
> +#define OV7725_3_STATUS		"okay"
> +#define OV7725_3_REMOTE_EP	&VIN3_EP
> +#define VIN3_REMOTE_EP		&ov7725_3
> +#else
> +#define OV7725_3_STATUS		"disabled"
> +#define OV7725_3_REMOTE_EP	0
> +#endif
> +
> +&CAM1_PARENT_I2C {
> +	ov7725@21 {
> +		compatible = "ovti,ov7725";
> +		reg = <0x21>;
> +		clocks = <&MCLK_CAM1>;
> +		status = OV7725_0_STATUS;
> +
> +		port {
> +			ov7725_0: endpoint {
> +				bus-width = <8>;
> +				bus-type = <6>;
> +				remote-endpoint = <OV7725_0_REMOTE_EP>;
> +			};
> +		};
> +	};
> +};
> +
> +&CAM2_PARENT_I2C {
> +	ov7725@21 {
> +		compatible = "ovti,ov7725";
> +		reg = <0x21>;
> +		clocks = <&MCLK_CAM2>;
> +		status = OV7725_1_STATUS;
> +
> +		port {
> +			ov7725_1: endpoint {
> +				bus-width = <8>;
> +				bus-type = <6>;
> +				remote-endpoint = <OV7725_1_REMOTE_EP>;
> +			};
> +		};
> +	};
> +};
> +
> +&CAM3_PARENT_I2C {
> +	ov7725@21 {
> +		compatible = "ovti,ov7725";
> +		reg = <0x21>;
> +		clocks = <&MCLK_CAM3>;
> +		status = OV7725_2_STATUS;
> +
> +		port {
> +			ov7725_2: endpoint {
> +				bus-width = <8>;
> +				bus-type = <6>;
> +				remote-endpoint = <OV7725_2_REMOTE_EP>;
> +			};
> +		};
> +	};
> +};
> +
> +&CAM4_PARENT_I2C {
> +	ov7725@21 {
> +		compatible = "ovti,ov7725";
> +		reg = <0x21>;
> +		clocks = <&MCLK_CAM4>;
> +		status = OV7725_3_STATUS;
> +
> +		port {
> +			ov7725_3: endpoint {
> +				bus-width = <8>;
> +				bus-type = <6>;
> +				remote-endpoint = <OV7725_3_REMOTE_EP>;
> +			};
> +		};
> +	};
> +};
> --
> 2.17.1
>
