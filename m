Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942973602DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 08:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbhDOHAO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 03:00:14 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52349 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhDOHAN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 03:00:13 -0400
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3EABA20000E;
        Thu, 15 Apr 2021 06:59:47 +0000 (UTC)
Date:   Thu, 15 Apr 2021 09:00:27 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] arm64: dts: renesas: eagle: Add GMSL .dtsi
Message-ID: <20210415070027.t3p5mlxnwq2qazao@uno.localdomain>
References: <20210414135128.180980-1-jacopo+renesas@jmondi.org>
 <20210414135128.180980-5-jacopo+renesas@jmondi.org>
 <YHeAbbyc2oURne3G@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YHeAbbyc2oURne3G@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Apr 15, 2021 at 02:53:17AM +0300, Laurent Pinchart wrote:
> Hi Jacopo and Kieran,
>
> Thank you for the patch.
>
> On Wed, Apr 14, 2021 at 03:51:27PM +0200, Jacopo Mondi wrote:
> > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >
> > Describe the FAKRA connector available on Eagle board that allows
> > connecting GMSL camera modules such as IMI RDACM20 and RDACM21.
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi | 186 ++++++++++++++++++++
> >  1 file changed, 186 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi b/arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi
> > new file mode 100644
> > index 000000000000..1836bca1e8b2
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi
> > @@ -0,0 +1,186 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Device Tree Source (overlay) for the Eagle V3M GMSL connectors
> > + *
> > + * Copyright (C) 2017 Ideas on Board <kieran.bingham@ideasonboard.com>
> > + * Copyright (C) 2021 Jacopo Mondi <jacopo+renesas@jmondi.org>
> > + *
> > + * This overlay allows you to define GMSL cameras connected to the FAKRA
> > + * connectors on the Eagle-V3M (or compatible) board.
> > + *
> > + * The following cameras are currently supported:
> > + *    "imi,rdacm20"
> > + *    "imi,rdacm21"
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/*
> > + * Select which cameras are in use:
> > + * #define EAGLE_CAMERA0_RDACM20
> > + * #define EAGLE_CAMERA0_RDACM21
> > + *
> > + * The two camera modules are configured with different image formats
> > + * and cannot be mixed.
> > + */
> > +#define EAGLE_CAMERA0_RDACM21
> > +#define EAGLE_CAMERA1_RDACM21
> > +#define EAGLE_CAMERA2_RDACM21
> > +#define EAGLE_CAMERA3_RDACM21
>
> To avoid possible errors, I'd use one macro to set the camera model, and
> another macro to select the ports. The second could be a bitmask if
> desired.
>
> These macros should be defined in the file that includes this file, not
> here.

Don't worry, I have quite some comments from you on the dts patches
from the previous versio of the series still to address... As said in
the cover letter I was mostly interested in a validation of the new
property and the driver support.

Thanks
  j

>
> > +
> > +/* Set the compatible string based on the camera model. */
> > +#if defined(EAGLE_CAMERA0_RDACM21) || defined(EAGLE_CAMERA1_RDACM21) || \
> > +    defined(EAGLE_CAMERA2_RDACM21) || defined(EAGLE_CAMERA3_RDACM21)
> > +#define EAGLE_CAMERA_MODEL	"imi,rdacm21"
> > +#define EAGLE_USE_RDACM21
> > +#elif defined(EAGLE_CAMERA0_RDACM20) || defined(EAGLE_CAMERA1_RDACM20) || \
> > +      defined(EAGLE_CAMERA2_RDACM20) || defined(EAGLE_CAMERA3_RDACM20)
> > +#define EAGLE_CAMERA_MODEL	"imi,rdacm20"
> > +#define EAGLE_USE_RDACM20
> > +#endif
> > +
> > +/* Define which cameras are available. */
> > +#if defined(EAGLE_CAMERA0_RDACM21) || defined(EAGLE_CAMERA0_RDACM20)
> > +#define EAGLE_USE_CAMERA_0
> > +#endif
> > +
> > +#if defined(EAGLE_CAMERA1_RDACM21) || defined(EAGLE_CAMERA1_RDACM20)
> > +#define EAGLE_USE_CAMERA_1
> > +#endif
> > +
> > +#if defined(EAGLE_CAMERA2_RDACM21) || defined(EAGLE_CAMERA2_RDACM20)
> > +#define EAGLE_USE_CAMERA_2
> > +#endif
> > +
> > +#if defined(EAGLE_CAMERA3_RDACM21) || defined(EAGLE_CAMERA3_RDACM20)
> > +#define EAGLE_USE_CAMERA_3
> > +#endif
> > +
> > +/* Define the endpoint links. */
> > +#ifdef EAGLE_USE_CAMERA_0
> > +&max9286_in0 {
> > +	remote-endpoint = <&fakra_con0>;
> > +};
> > +#endif
> > +
> > +#ifdef EAGLE_USE_CAMERA_1
> > +&max9286_in1 {
> > +	remote-endpoint = <&fakra_con1>;
> > +};
> > +#endif
> > +
> > +#ifdef EAGLE_USE_CAMERA_2
> > +&max9286_in2 {
> > +	remote-endpoint = <&fakra_con2>;
> > +};
> > +#endif
> > +
> > +#ifdef EAGLE_USE_CAMERA_3
> > +&max9286_in3 {
> > +	remote-endpoint = <&fakra_con3>;
> > +};
> > +#endif
> > +
> > +/* Populate the GMSL i2c-mux bus with camera nodes. */
> > +#if defined(EAGLE_USE_RDACM21) || defined(EAGLE_USE_RDACM20)
> > +
> > +#ifdef EAGLE_USE_CAMERA_0
> > +&vin0 {
> > +	status = "okay";
> > +};
> > +#endif
> > +
> > +#ifdef EAGLE_USE_CAMERA_1
> > +&vin1 {
> > +	status = "okay";
> > +};
> > +#endif
> > +
> > +#ifdef EAGLE_USE_CAMERA_2
> > +&vin2 {
> > +	status = "okay";
> > +};
> > +#endif
> > +
> > +#ifdef EAGLE_USE_CAMERA_3
> > +&vin3 {
> > +	status = "okay";
> > +};
> > +#endif
> > +
> > +&gmsl {
> > +
> > +	status = "okay";
> > +	maxim,reverse-channel-microvolt = <100000>;
> > +
> > +	i2c-mux {
> > +#ifdef EAGLE_USE_CAMERA_0
> > +		i2c@0 {
> > +			status = "okay";
> > +
> > +			camera@51 {
> > +				compatible = EAGLE_CAMERA_MODEL;
> > +				reg = <0x51>, <0x61>;
> > +
> > +				port {
> > +					fakra_con0: endpoint {
> > +						remote-endpoint = <&max9286_in0>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +#endif
> > +
> > +#ifdef EAGLE_USE_CAMERA_1
> > +		i2c@1 {
> > +			status = "okay";
> > +
> > +			camera@52 {
> > +				compatible = EAGLE_CAMERA_MODEL;
> > +				reg = <0x52>, <0x62>;
> > +
> > +				port {
> > +					fakra_con1: endpoint {
> > +						remote-endpoint = <&max9286_in1>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +#endif
> > +
> > +#ifdef EAGLE_USE_CAMERA_2
> > +		i2c@2 {
> > +			status = "okay";
> > +
> > +			camera@53 {
> > +				compatible = EAGLE_CAMERA_MODEL;
> > +				reg = <0x53>, <0x63>;
> > +
> > +				port {
> > +					fakra_con2: endpoint {
> > +						remote-endpoint = <&max9286_in2>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +#endif
> > +
> > +#ifdef EAGLE_USE_CAMERA_3
> > +		i2c@3 {
> > +			status = "okay";
> > +
> > +			camera@54 {
> > +				compatible = EAGLE_CAMERA_MODEL;
> > +				reg = <0x54>, <0x64>;
> > +
> > +				port {
> > +					fakra_con3: endpoint {
> > +						remote-endpoint = <&max9286_in3>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +#endif
> > +	};
> > +};
> > +#endif
>
> --
> Regards,
>
> Laurent Pinchart
