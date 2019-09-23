Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F929BB2CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 13:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393762AbfIWLat (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 07:30:49 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58740 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393257AbfIWLat (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 07:30:49 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9403D25B706;
        Mon, 23 Sep 2019 21:30:45 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 98279940310; Mon, 23 Sep 2019 13:30:43 +0200 (CEST)
Date:   Mon, 23 Sep 2019 13:30:43 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: irqchip: renesas: intc-irqpin: convert
 bindings to json-schema
Message-ID: <20190923113042.rz2ooqjrupvmt7si@verge.net.au>
References: <1569008061-10459-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569008061-10459-1-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Sep 21, 2019 at 04:34:21AM +0900, Yoshihiro Kaneko wrote:
> Convert R-/SH-Mobile IRQPin Controller bindings documentation to json-schema.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
>  .../interrupt-controller/renesas,intc-irqpin.txt   |  62 -------------
>  .../interrupt-controller/renesas,intc-irqpin.yaml  | 102 +++++++++++++++++++++
>  2 files changed, 102 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
> deleted file mode 100644
> index 772c550..0000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -DT bindings for the R-/SH-Mobile irqpin controller
> -
> -Required properties:
> -
> -- compatible: has to be "renesas,intc-irqpin-<soctype>", "renesas,intc-irqpin"
> -  as fallback.
> -  Examples with soctypes are:
> -    - "renesas,intc-irqpin-r8a7740" (R-Mobile A1)
> -    - "renesas,intc-irqpin-r8a7778" (R-Car M1A)
> -    - "renesas,intc-irqpin-r8a7779" (R-Car H1)
> -    - "renesas,intc-irqpin-sh73a0" (SH-Mobile AG5)
> -
> -- reg: Base address and length of each register bank used by the external
> -  IRQ pins driven by the interrupt controller hardware module. The base
> -  addresses, length and number of required register banks varies with soctype.
> -- interrupt-controller: Identifies the node as an interrupt controller.
> -- #interrupt-cells: has to be <2>: an interrupt index and flags, as defined in
> -  interrupts.txt in this directory.
> -- interrupts: Must contain a list of interrupt specifiers. For each interrupt
> -  provided by this irqpin controller instance, there must be one entry,
> -  referring to the corresponding parent interrupt.
> -
> -Optional properties:
> -
> -- any properties, listed in interrupts.txt, and any standard resource allocation
> -  properties
> -- sense-bitfield-width: width of a single sense bitfield in the SENSE register,
> -  if different from the default 4 bits
> -- control-parent: disable and enable interrupts on the parent interrupt
> -  controller, needed for some broken implementations
> -- clocks: Must contain a reference to the functional clock.  This property is
> -  mandatory if the hardware implements a controllable functional clock for
> -  the irqpin controller instance.
> -- power-domains: Must contain a reference to the power domain. This property is
> -  mandatory if the irqpin controller instance is part of a controllable power
> -  domain.
> -
> -
> -Example
> --------
> -
> -	irqpin1: interrupt-controller@e6900004 {
> -		compatible = "renesas,intc-irqpin-r8a7740",
> -			     "renesas,intc-irqpin";
> -		#interrupt-cells = <2>;
> -		interrupt-controller;
> -		reg = <0xe6900004 4>,
> -			<0xe6900014 4>,
> -			<0xe6900024 1>,
> -			<0xe6900044 1>,
> -			<0xe6900064 1>;
> -		interrupts = <0 149 IRQ_TYPE_LEVEL_HIGH
> -			      0 149 IRQ_TYPE_LEVEL_HIGH
> -			      0 149 IRQ_TYPE_LEVEL_HIGH
> -			      0 149 IRQ_TYPE_LEVEL_HIGH
> -			      0 149 IRQ_TYPE_LEVEL_HIGH
> -			      0 149 IRQ_TYPE_LEVEL_HIGH
> -			      0 149 IRQ_TYPE_LEVEL_HIGH
> -			      0 149 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
> -		power-domains = <&pd_a4s>;
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
> new file mode 100644
> index 0000000..d4d3cf8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/renesas,intc-irqpin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DT bindings for the R-/SH-Mobile irqpin controller
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@xxxxxxxxx>

I guess Geert's email address got fuzzed somehow.

> +  - Guennadi Liakhovetski <g.liakhovetski@gmx.de>

I believe that its been a while since Guennadi worked in this area.
I'd suggest not including him as a maintainer of this binding.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,intc-irqpin-r8a7740  # R-Mobile A1
> +          - renesas,intc-irqpin-r8a7778  # R-Car M1A
> +          - renesas,intc-irqpin-r8a7779  # R-Car H1
> +          - renesas,intc-irqpin-sh73a0   # SH-Mobile AG5
> +      - const: renesas,intc-irqpin
> +
> +  reg:
> +    # Base address and length of each register bank used by the external
> +    # IRQ pins driven by the interrupt controller hardware module. The base
> +    # addresses, length and number of required register banks varies with
> +    # soctype.
> +    minItems: 1
> +    maxItems: 6
> +
> +  interrupt-controller: true
> +    # Identifies the node as an interrupt controller.
> +
> +  '#interrupt-cells':
> +    # an interrupt index and flags, as defined in interrupts.txt in this
> +    # directory.
> +    const: 2
> +
> +  interrupts:
> +    # Must contain a list of interrupt specifiers. For each interrupt
> +    # provided by this irqpin controller instance, there must be one entry,
> +    # referring to the corresponding parent interrupt.
> +    maxItems: 1
> +
> +  sense-bitfield-width:
> +    # width of a single sense bitfield in the SENSE register, if different
> +    # from the default 4 bits
> +    maxItems: 1

I wonder if we need to give this field a type, something like this?

  sense-bitfield-width:
    # Comment
    $ref: /schemas/types.yaml#/definitions/uint32
    maxItems: 1

    Also, I wonder if there should be some constraints on the values.
    (I don't know if these constraints are correct)

    minimum: 1
    maximum: 64
    default: 4

> +
> +  control-parent:
> +    # disable and enable interrupts on the parent interrupt controller,
> +    # needed for some broken implementations
> +    maxItems: 1

I think we can describe this as a boolean.

  control-parent:
     # Comment
     type: boolean


> +
> +  clocks:
> +    # Must contain a reference to the functional clock.  This property is
> +    # mandatory if the hardware implements a controllable functional clock for
> +    # the irqpin controller instance.
> +    maxItems: 1
> +
> +  power-domains:
> +    # Must contain a reference to the power domain. This property is
> +    # mandatory if the irqpin controller instance is part of a controllable
> +    # power domain.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - interrupts

Is 'clocks' also required?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7740-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    irqpin1: interrupt-controller@e6900004 {
> +        compatible = "renesas,intc-irqpin-r8a7740",
> +                     "renesas,intc-irqpin";
> +        #interrupt-cells = <2>;
> +        interrupt-controller;
> +        reg = <0xe6900004 4>,
> +              <0xe6900014 4>,
> +              <0xe6900024 1>,
> +              <0xe6900044 1>,
> +              <0xe6900064 1>;
> +        interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
> +        power-domains = <&pd_a4s>;
> +    };
> -- 
> 1.9.1
> 
