Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 501A8B78D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2019 14:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388590AbfISMDm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 08:03:42 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57370 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388575AbfISMDm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 08:03:42 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0999D25AD81;
        Thu, 19 Sep 2019 22:03:39 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 103A194444E; Thu, 19 Sep 2019 14:03:37 +0200 (CEST)
Date:   Thu, 19 Sep 2019 14:03:36 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: irqchip: renesas-irqc: convert bindings
 to json-schema
Message-ID: <20190919120333.77qabr675rne7zlu@verge.net.au>
References: <1568819121-32737-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568819121-32737-1-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 12:05:21AM +0900, Yoshihiro Kaneko wrote:
> Convert Renesas Interrupt Controller bindings documentation to json-schema.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
> 
> v2
> - Add SPDX tag.
> - Document interrupt-contoller, reg, interrupts, power-domains and resets
>   properties.
> - Add addtionalProperties.
> 
> ---
>  .../bindings/interrupt-controller/renesas,irqc.txt | 48 -------------
>  .../interrupt-controller/renesas,irqc.yaml         | 84 ++++++++++++++++++++++
>  2 files changed, 84 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> deleted file mode 100644
> index f977ea7..0000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
> -
> -Required properties:
> -
> -- compatible: must be "renesas,irqc-<soctype>" or "renesas,intc-ex-<soctype>",
> -	      and "renesas,irqc" as fallback.
> -  Examples with soctypes are:
> -    - "renesas,irqc-r8a73a4" (R-Mobile APE6)
> -    - "renesas,irqc-r8a7743" (RZ/G1M)
> -    - "renesas,irqc-r8a7744" (RZ/G1N)
> -    - "renesas,irqc-r8a7745" (RZ/G1E)
> -    - "renesas,irqc-r8a77470" (RZ/G1C)
> -    - "renesas,irqc-r8a7790" (R-Car H2)
> -    - "renesas,irqc-r8a7791" (R-Car M2-W)
> -    - "renesas,irqc-r8a7792" (R-Car V2H)
> -    - "renesas,irqc-r8a7793" (R-Car M2-N)
> -    - "renesas,irqc-r8a7794" (R-Car E2)
> -    - "renesas,intc-ex-r8a774a1" (RZ/G2M)
> -    - "renesas,intc-ex-r8a774c0" (RZ/G2E)
> -    - "renesas,intc-ex-r8a7795" (R-Car H3)
> -    - "renesas,intc-ex-r8a7796" (R-Car M3-W)
> -    - "renesas,intc-ex-r8a77965" (R-Car M3-N)
> -    - "renesas,intc-ex-r8a77970" (R-Car V3M)
> -    - "renesas,intc-ex-r8a77980" (R-Car V3H)
> -    - "renesas,intc-ex-r8a77990" (R-Car E3)
> -    - "renesas,intc-ex-r8a77995" (R-Car D3)
> -- #interrupt-cells: has to be <2>: an interrupt index and flags, as defined in
> -  interrupts.txt in this directory
> -- clocks: Must contain a reference to the functional clock.
> -
> -Optional properties:
> -
> -- any properties, listed in interrupts.txt, and any standard resource allocation
> -  properties
> -
> -Example:
> -
> -	irqc0: interrupt-controller@e61c0000 {
> -		compatible = "renesas,irqc-r8a7790", "renesas,irqc";
> -		#interrupt-cells = <2>;
> -		interrupt-controller;
> -		reg = <0 0xe61c0000 0 0x200>;
> -		interrupts = <0 0 IRQ_TYPE_LEVEL_HIGH>,
> -			     <0 1 IRQ_TYPE_LEVEL_HIGH>,
> -			     <0 2 IRQ_TYPE_LEVEL_HIGH>,
> -			     <0 3 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&mstp4_clks R8A7790_CLK_IRQC>;
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
> new file mode 100644
> index 0000000..18497c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/renesas,irqc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,irqc-r8a73a4        # R-Mobile APE6
> +          - renesas,irqc-r8a7743        # RZ/G1M
> +          - renesas,irqc-r8a7744        # RZ/G1N
> +          - renesas,irqc-r8a7745        # RZ/G1E
> +          - renesas,irqc-r8a77470       # RZ/G1C
> +          - renesas,irqc-r8a7790        # R-Car H2
> +          - renesas,irqc-r8a7791        # R-Car M2-W
> +          - renesas,irqc-r8a7792        # R-Car V2H
> +          - renesas,irqc-r8a7793        # R-Car M2-N
> +          - renesas,irqc-r8a7794        # R-Car E2
> +          - renesas,intc-ex-r8a774a1    # RZ/G2M
> +          - renesas,intc-ex-r8a774c0    # RZ/G2E
> +          - renesas,intc-ex-r8a7795     # R-Car H3
> +          - renesas,intc-ex-r8a7796     # R-Car M3-W
> +          - renesas,intc-ex-r8a77965    # R-Car M3-N
> +          - renesas,intc-ex-r8a77970    # R-Car V3M
> +          - renesas,intc-ex-r8a77980    # R-Car V3H
> +          - renesas,intc-ex-r8a77990    # R-Car E3
> +          - renesas,intc-ex-r8a77995    # R-Car D3
> +      - const: renesas,irqc
> +
> +  '#interrupt-cells':
> +    # an interrupt index and flags, as defined in interrupts.txt in
> +    # this directory
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 32

Is 'interrupts' required?

> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - '#interrupt-cells'
> +  - interrupt-controller
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/r8a7790-clock.h>
> +
> +    irqc0: interrupt-controller@e61c0000 {
> +        compatible = "renesas,irqc-r8a7790", "renesas,irqc";
> +        #interrupt-cells = <2>;
> +        interrupt-controller;
> +        reg = <0 0xe61c0000 0 0x200>;
> +        interrupts = <0 0 IRQ_TYPE_LEVEL_HIGH>,
> +                     <0 1 IRQ_TYPE_LEVEL_HIGH>,
> +                     <0 2 IRQ_TYPE_LEVEL_HIGH>,
> +                     <0 3 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&mstp4_clks R8A7790_CLK_IRQC>;
> +    };
> -- 
> 1.9.1
> 
