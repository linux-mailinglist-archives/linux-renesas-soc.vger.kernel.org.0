Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779B733C962
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 23:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbhCOW3y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 18:29:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42164 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbhCOW3x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 18:29:53 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFB53316;
        Mon, 15 Mar 2021 23:29:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615847392;
        bh=9xkhRM0j+nX1FTTSK3uL/NgOwlSI9cxaFA4x/a0LwmA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Op1M4esyOwjY2AJLPLKc/46UfzKqU1ZAzo1pr8GPD3IdqHWchRZUUvHullidoMvf3
         K9ekN56TvFlKEfTH2xR28Ud9OmuWi7GAE7HQBdai8mbFFKr8VUZ4XPaWHIqEBwxlKR
         0k4ZdTt2YrKYz3Bg2irwd4FwrOwvCDI8WLOkodvg=
Date:   Tue, 16 Mar 2021 00:29:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: eagle: Add GMSL .dtsi
Message-ID: <YE/fvOpL3NgUOi+T@pendragon.ideasonboard.com>
References: <20210315163028.173148-1-jacopo+renesas@jmondi.org>
 <20210315163028.173148-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210315163028.173148-4-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 15, 2021 at 05:30:27PM +0100, Jacopo Mondi wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Describe the FAKRA connector available on Eagle board that allows
> connecting GMSL camera modules such as IMI RDACM20 and RDACM21.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi | 186 ++++++++++++++++++++
>  1 file changed, 186 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi
> 
> diff --git a/arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi b/arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi
> new file mode 100644
> index 000000000000..ec3e7493aa71
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Device Tree Source (overlay) for the Eagle V3M GMSL connectors
> + *
> + * Copyright (C) 2017 Ideas on Board <kieran.bingham@ideasonboard.com>
> + * Copyright (C) 2021 Jacopo Mondi <jacopo+renesas@jmondi.org>
> + *
> + * This overlay allows you to define GMSL cameras connected to the FAKRA
> + * connectors on the Eagle-V3M (or compatible) board.
> + *
> + * The following cameras are currently supported:
> + *    "imi,rdacm20"
> + *    "imi,rdacm21"
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/*
> + * Select which cameras are in use:
> + * #define EAGLE_CAMERA0_RDACM20
> + * #define EAGLE_CAMERA0_RDACM21
> + *
> + * The two camera modules are configured with different image formats
> + * and cannot be mixed.
> + */
> +#define EAGLE_CAMERA0_RDACM20
> +#define EAGLE_CAMERA1_RDACM20
> +#define EAGLE_CAMERA2_RDACM20
> +#define EAGLE_CAMERA3_RDACM20

Shouldn't this be moved out of this file, and set in the file that
includes it, in order to make this .dtsi fully parametric ?

> +
> +/* Set the compatible string based on the camera model. */
> +#if defined(EAGLE_CAMERA0_RDACM21) || defined(EAGLE_CAMERA1_RDACM21) || \
> +    defined(EAGLE_CAMERA2_RDACM21) || defined(EAGLE_CAMERA3_RDACM21)
> +#define EAGLE_CAMERA_MODEL	"imi,rdacm21"
> +#define EAGLE_USE_RDACM21
> +#elif defined(EAGLE_CAMERA0_RDACM20) || defined(EAGLE_CAMERA1_RDACM20) || \
> +    defined(EAGLE_CAMERA2_RDACM20) || defined(EAGLE_CAMERA3_RDACM20)
> +#define EAGLE_CAMERA_MODEL	"imi,rdacm20"
> +#define EAGLE_USE_RDACM20
> +#endif

It could be nice to catch errors caused by mix-and-matching different
camera models. Or, possibly even better, we could have one #define to
select the camera model, and other #define to select the ports on which
cameras are connected. That would make the error impossible in the first
place, and would scale better when we'll add support for more cameras.

> +
> +/* Define which cameras are available. */
> +#if defined(EAGLE_CAMERA0_RDACM21) || defined(EAGLE_CAMERA0_RDACM20)
> +#define EAGLE_USE_CAMERA_0
> +#endif
> +
> +#if defined(EAGLE_CAMERA1_RDACM21) || defined(EAGLE_CAMERA1_RDACM20)
> +#define EAGLE_USE_CAMERA_1
> +#endif
> +
> +#if defined(EAGLE_CAMERA2_RDACM21) || defined(EAGLE_CAMERA2_RDACM20)
> +#define EAGLE_USE_CAMERA_2
> +#endif
> +
> +#if defined(EAGLE_CAMERA3_RDACM21) || defined(EAGLE_CAMERA3_RDACM20)
> +#define EAGLE_USE_CAMERA_3
> +#endif
> +
> +/* Define the endpoint links. */
> +#ifdef EAGLE_USE_CAMERA_0
> +&max9286_in0 {
> +	remote-endpoint = <&fakra_con0>;
> +};
> +#endif
> +
> +#ifdef EAGLE_USE_CAMERA_1
> +&max9286_in1 {
> +	remote-endpoint = <&fakra_con1>;
> +};
> +#endif
> +
> +#ifdef EAGLE_USE_CAMERA_2
> +&max9286_in2 {
> +	remote-endpoint = <&fakra_con2>;
> +};
> +#endif
> +
> +#ifdef EAGLE_USE_CAMERA_3
> +&max9286_in3 {
> +	remote-endpoint = <&fakra_con3>;
> +};
> +#endif
> +
> +/* Populate the GMSL i2c-mux bus with camera nodes. */
> +#if defined(EAGLE_USE_RDACM21) || defined(EAGLE_USE_RDACM20)
> +
> +#ifdef EAGLE_USE_CAMERA_0
> +&vin0 {
> +	status = "okay";
> +};
> +#endif
> +
> +#ifdef EAGLE_USE_CAMERA_1
> +&vin1 {
> +	status = "okay";
> +};
> +#endif
> +
> +#ifdef EAGLE_USE_CAMERA_2
> +&vin2 {
> +	status = "okay";
> +};
> +#endif
> +
> +#ifdef EAGLE_USE_CAMERA_3
> +&vin3 {
> +	status = "okay";
> +};
> +#endif

As routing is supposed to be dynamic (even if fully dynamic routing of
VCs and DTs may not be supported in the driver yet), shouldn't we enable
all VIN instances unconditionally ?

> +
> +&gmsl {
> +
> +	status = "okay";
> +	maxim,reverse-channel-microvolt = <100000>;
> +
> +	i2c-mux {
> +#ifdef EAGLE_USE_CAMERA_0
> +		i2c@0 {
> +			status = "okay";
> +
> +			camera@51 {
> +				compatible = EAGLE_CAMERA_MODEL;
> +				reg = <0x51>, <0x61>;
> +
> +				port {
> +					fakra_con0: endpoint {
> +						remote-endpoint = <&max9286_in0>;
> +					};
> +				};
> +			};
> +		};
> +#endif
> +
> +#ifdef EAGLE_USE_CAMERA_1
> +		i2c@1 {
> +			status = "okay";
> +
> +			camera@52 {
> +				compatible = EAGLE_CAMERA_MODEL;
> +				reg = <0x52>, <0x62>;
> +
> +				port {
> +					fakra_con1: endpoint {
> +						remote-endpoint = <&max9286_in1>;
> +					};
> +				};
> +			};
> +		};
> +#endif
> +
> +#ifdef EAGLE_USE_CAMERA_2
> +		i2c@2 {
> +			status = "okay";
> +
> +			camera@53 {
> +				compatible = EAGLE_CAMERA_MODEL;
> +				reg = <0x53>, <0x63>;
> +
> +				port {
> +					fakra_con2: endpoint {
> +						remote-endpoint = <&max9286_in2>;
> +					};
> +				};
> +			};
> +		};
> +#endif
> +
> +#ifdef EAGLE_USE_CAMERA_3
> +		i2c@3 {
> +			status = "okay";
> +
> +			camera@54 {
> +				compatible = EAGLE_CAMERA_MODEL;
> +				reg = <0x54>, <0x64>;
> +
> +				port {
> +					fakra_con3: endpoint {
> +						remote-endpoint = <&max9286_in3>;
> +					};
> +				};
> +			};
> +		};
> +#endif
> +	};
> +};
> +#endif

-- 
Regards,

Laurent Pinchart
