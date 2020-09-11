Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B66F7265C08
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 10:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbgIKIz5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 04:55:57 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:32937 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgIKIz5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 04:55:57 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id CFC4E20000B;
        Fri, 11 Sep 2020 08:55:49 +0000 (UTC)
Date:   Fri, 11 Sep 2020 10:59:39 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Leon Luo <leonl@leopardimaging.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5] dt-bindings: media: imx274: Convert to json-schema
Message-ID: <20200911085939.3fahuftw3o2hj4vw@uno.localdomain>
References: <20200910162009.613976-1-jacopo+renesas@jmondi.org>
 <f6b43803-1880-c5fe-dba1-fa94d1dbb182@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f6b43803-1880-c5fe-dba1-fa94d1dbb182@lucaceresoli.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Luca,

On Fri, Sep 11, 2020 at 09:53:23AM +0200, Luca Ceresoli wrote:
> Hi Jacopo,
>
> On 10/09/20 18:20, Jacopo Mondi wrote:
> > Convert the imx274 bindings document to json-schema and update
> > the MAINTAINERS file accordingly.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >
> > v4->v5:
> > - Add optional properties that were upstreamed in v5.9-rc2 in the textual
> >   bindings
> > - Move them to be lowercase: this patch should be fast-tracked through the
> >   fixes branch to make sure it gets in before v5.9 is released, otherwise the
> >   textual bindings will have supplies names in uppercase
> >
> > ---
> >  .../devicetree/bindings/media/i2c/imx274.txt  | 38 ---------
> >  .../bindings/media/i2c/sony,imx274.yaml       | 77 +++++++++++++++++++
> >  MAINTAINERS                                   |  2 +-
> >  3 files changed, 78 insertions(+), 39 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> > deleted file mode 100644
> > index 0727079d2410..000000000000
> > --- a/Documentation/devicetree/bindings/media/i2c/imx274.txt
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -* Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor
> > -
> > -The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor with
> > -an active array size of 3864H x 2202V. It is programmable through I2C
> > -interface. The I2C address is fixed to 0x1a as per sensor data sheet.
> > -Image data is sent through MIPI CSI-2, which is configured as 4 lanes
> > -at 1440 Mbps.
> > -
> > -
> > -Required Properties:
> > -- compatible: value should be "sony,imx274" for imx274 sensor
> > -- reg: I2C bus address of the device
> > -
> > -Optional Properties:
> > -- reset-gpios: Sensor reset GPIO
> > -- clocks: Reference to the input clock.
> > -- clock-names: Should be "inck".
> > -- VANA-supply: Sensor 2.8v analog supply.
> > -- VDIG-supply: Sensor 1.8v digital core supply.
> > -- VDDL-supply: Sensor digital IO 1.2v supply.
> > -
> > -The imx274 device node should contain one 'port' child node with
> > -an 'endpoint' subnode. For further reading on port node refer to
> > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > -
> > -Example:
> > -	sensor@1a {
> > -		compatible = "sony,imx274";
> > -		reg = <0x1a>;
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -		reset-gpios = <&gpio_sensor 0 0>;
> > -		port {
> > -			sensor_out: endpoint {
> > -				remote-endpoint = <&csiss_in>;
> > -			};
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > new file mode 100644
> > index 000000000000..fe81def68466
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx274.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony 1/2.5-Inch 8.51MP CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - Leon Luo <leonl@leopardimaging.com>
> > +
> > +description: |
> > +  The Sony IMX274 is a 1/2.5-inch CMOS active pixel digital image sensor with an
> > +  active array size of 3864H x 2202V. It is programmable through I2C interface.
> > +  Image data is sent through MIPI CSI-2, which is configured as 4 lanes at 1440
> > +  Mbps.
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx274
> > +
> > +  reg:
> > +    const: 0x1a
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +  port:
> > +    type: object
> > +    description: |
> > +      Output video port. See ../video-interfaces.txt.
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: inck
> > +
> > +  vana-supply:
> > +    description: Sensor 2.8v analog supply.
> > +    maxItems: 1
> > +
> > +  vdig-supply:
> > +    description: Sensor 2.8v analog supply.
>
> Copy-paste leftover. Should be "Sensor 1.8v digital core supply."
>

oooo :(
I've been so sloppy on this series I'm almost ashamed.

I'll send a v6 with your tag in

> > +    maxItems: 1
> > +
> > +  vddl-supply:
> > +    description: Sensor 2.8v analog supply.
>
> Same here, should be "Sensor digital IO 1.2v supply."
>
> With the above fixed you can add to v6:
>  Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
>
> --
> Luca
