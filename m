Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7038735FEA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 01:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhDNXxn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Apr 2021 19:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhDNXxm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 19:53:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A23C061574;
        Wed, 14 Apr 2021 16:53:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5503451E;
        Thu, 15 Apr 2021 01:53:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618444398;
        bh=lb/5uK5Hz+6mXrJKlBYecFPOMdTJOWf7T+AFNN7/dTA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fOaFXiQgI6togrI1PNbO4TAMEchlEfr5ZoEHLWSD/X3DqQxVJfMqbtYqlJj73/p2L
         H/73m61VPg8G74H7I36icFF7DGQyRH4t8s0dOi+/R50dgJivBFk3orG8e3BdQ9RaiV
         CFvBLY+8JPlKUH2XXlRRNZ9J3KHP2n1GhDXEOjnA=
Date:   Thu, 15 Apr 2021 02:53:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] arm64: dts: renesas: eagle: Add GMSL .dtsi
Message-ID: <YHeAbbyc2oURne3G@pendragon.ideasonboard.com>
References: <20210414135128.180980-1-jacopo+renesas@jmondi.org>
 <20210414135128.180980-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210414135128.180980-5-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo and Kieran,

Thank you for the patch.

On Wed, Apr 14, 2021 at 03:51:27PM +0200, Jacopo Mondi wrote:
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
> index 000000000000..1836bca1e8b2
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
> +#define EAGLE_CAMERA0_RDACM21
> +#define EAGLE_CAMERA1_RDACM21
> +#define EAGLE_CAMERA2_RDACM21
> +#define EAGLE_CAMERA3_RDACM21

To avoid possible errors, I'd use one macro to set the camera model, and
another macro to select the ports. The second could be a bitmask if
desired.

These macros should be defined in the file that includes this file, not
here.

> +
> +/* Set the compatible string based on the camera model. */
> +#if defined(EAGLE_CAMERA0_RDACM21) || defined(EAGLE_CAMERA1_RDACM21) || \
> +    defined(EAGLE_CAMERA2_RDACM21) || defined(EAGLE_CAMERA3_RDACM21)
> +#define EAGLE_CAMERA_MODEL	"imi,rdacm21"
> +#define EAGLE_USE_RDACM21
> +#elif defined(EAGLE_CAMERA0_RDACM20) || defined(EAGLE_CAMERA1_RDACM20) || \
> +      defined(EAGLE_CAMERA2_RDACM20) || defined(EAGLE_CAMERA3_RDACM20)
> +#define EAGLE_CAMERA_MODEL	"imi,rdacm20"
> +#define EAGLE_USE_RDACM20
> +#endif
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
