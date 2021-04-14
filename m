Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4F835FE8F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 01:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhDNXri (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Apr 2021 19:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhDNXrh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 19:47:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE10C061761;
        Wed, 14 Apr 2021 16:47:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1340A51E;
        Thu, 15 Apr 2021 01:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618444033;
        bh=KU83gbnQL3jFn4Ena/atI8KTxMRJFA0STYHmiS3VcfE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kExSRd+mHVC7QTDDUIOr3ySJk3zBxibaOR4gGv0ntUfLVlN1Vd1lVk3NI/J4m4kOP
         hKanaf4b8Huc/BFtGy2IRydsBXksxDD4pLaKnnxJA57/XukY05WPB2pH4QgKwpaK3g
         E1xlcWZb1QUg4t0QqyUXXX4W2dMmR3qOavEaiDng=
Date:   Thu, 15 Apr 2021 02:47:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: media: max9286: Define
 'maxim,gpio-poc'
Message-ID: <YHd/AKIfxIHhTjWO@pendragon.ideasonboard.com>
References: <20210414135128.180980-1-jacopo+renesas@jmondi.org>
 <20210414135128.180980-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210414135128.180980-2-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Apr 14, 2021 at 03:51:24PM +0200, Jacopo Mondi wrote:
> Define a new vendor property in the maxim,max9286 binding schema.
> 
> The new property allows to declare that the remote camera
> power-over-coax is controlled by one of the MAX9286 gpio lines.
> 
> As it is currently not possible to establish a regulator as consumer
> of the MAX9286 gpio controller for this purpose, the property allows to
> declare that the camera power is controlled by the MAX9286 directly.
> 
> The property accepts a gpio-index (0 or 1) and one line polarity
> flag as defined by dt-bindings/gpio/gpio.h.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml     | 53 ++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index ee16102fdfe7..480a491f3744 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -70,6 +70,24 @@ properties:
>        a remote serializer whose high-threshold noise immunity is not enabled
>        is 100000 micro volts
>  
> +  maxim,gpio-poc:

I would have written poc-gpio to match the order of the GPIO bindings
syntax.

> +    $ref: '/schemas/types.yaml#/definitions/uint32-array'
> +    minItems: 2
> +    maxItems: 2
> +    description: |
> +      Identifier of gpio line that controls Power over Coax to the cameras and

I'd write "Index of the MAX9286 GPIO output that ..." to make it clear
that this is not a generic GPIO.

> +      the associated polarity flag (GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW)
> +      as defined in <include/dt-bindings/gpio/gpio.h>.
> +
> +      When the remote cameras power is controlled by one of the MAX9286 gpio
> +      lines, this property has to be used to specify which line among the two
> +      available ones controls the remote camera power enablement.
> +
> +      When this property is used it is not possible to register a gpio
> +      controller as the gpio lines are controlled directly by the MAX9286 and
> +      not available for consumers, nor the 'poc-supply' property should be
> +      specified.

Only one of the two lines would be controlled directly. Shouldn't we
still register a GPIO controller for the other line ?

Could you also mention somewhere that the first item in the array should
be 0 or 1 ? It may be hard to express in a YAML schema, so I'm fine just
documenting it in the description.

I've been wondering whether this would be a common enough issue that it
could justify support in the GPIO core to handle consumer-provider
loops, but even if that happens at some point in the future, I think the
proposal here is good enough and we won't need to switch.

> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -182,7 +200,6 @@ required:
>    - reg
>    - ports
>    - i2c-mux
> -  - gpio-controller
>  
>  additionalProperties: false
>  
> @@ -327,4 +344,38 @@ examples:
>            };
>          };
>        };
> +
> +      /*
> +       * Example of a deserializer that controls the camera Power over Coax
> +       * through one of its gpio lines.
> +       */
> +      gmsl-deserializer@6c {
> +        compatible = "maxim,max9286";
> +        reg = <0x6c>;
> +        enable-gpios = <&gpio 14 GPIO_ACTIVE_HIGH>;
> +
> +        /*
> +         * The remote camera power is controlled by MAX9286 GPIO line #0.
> +         * No 'poc-supply' nor 'gpio-controller' are specified.
> +         */
> +        maxim,gpio-poc = <0 GPIO_ACTIVE_LOW>;
> +
> +        /*
> +         * Do not describe connections as they're the same as in the previous
> +         * example.
> +         */
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@4 {
> +            reg = <4>;
> +          };
> +        };
> +
> +        i2c-mux {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +        };
> +      };
>      };

It's customary to indent DT examples with 4 spaces. The existing
examples use two spaces, so maybe a patch on top of this would be useful
to increase readability ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
