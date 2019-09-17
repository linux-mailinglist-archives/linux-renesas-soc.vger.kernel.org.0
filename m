Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55645B4CE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 13:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfIQL3m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 07:29:42 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38950 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfIQL3m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 07:29:42 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3D57025AD71;
        Tue, 17 Sep 2019 21:29:40 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 041519407F6; Tue, 17 Sep 2019 13:29:37 +0200 (CEST)
Date:   Tue, 17 Sep 2019 13:29:37 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: bus: simple-pm-bus: convert bindings to
 json-schema
Message-ID: <20190917112937.g3jna2kc7rw7zynd@verge.net.au>
References: <20190916153357.3880-1-horms+renesas@verge.net.au>
 <20190916153357.3880-2-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916153357.3880-2-horms+renesas@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 16, 2019 at 05:33:56PM +0200, Simon Horman wrote:
> Convert Simple Power-Managed Bus bindings documentation to json-schema.
> 
> As a side effect of this change only simple-pm-bus is used in example. A
> follow-up patch will provide an example for the separately documented
> Renesas Bus State Controller (BSC) that uses "renesas,bsc-sh73a0" and
> "renesas,bsc" compat strings.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> * Tested using:
>   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> ---
>  .../devicetree/bindings/bus/simple-pm-bus.txt      | 44 --------------
>  .../devicetree/bindings/bus/simple-pm-bus.yaml     | 68 ++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 44 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.txt
>  create mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.txt b/Documentation/devicetree/bindings/bus/simple-pm-bus.txt
> deleted file mode 100644
> index 6f15037131ed..000000000000
> --- a/Documentation/devicetree/bindings/bus/simple-pm-bus.txt
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -Simple Power-Managed Bus
> -========================
> -
> -A Simple Power-Managed Bus is a transparent bus that doesn't need a real
> -driver, as it's typically initialized by the boot loader.
> -
> -However, its bus controller is part of a PM domain, or under the control of a
> -functional clock.  Hence, the bus controller's PM domain and/or clock must be
> -enabled for child devices connected to the bus (either on-SoC or externally)
> -to function.
> -
> -While "simple-pm-bus" follows the "simple-bus" set of properties, as specified
> -in the Devicetree Specification, it is not an extension of "simple-bus".
> -
> -
> -Required properties:
> -  - compatible: Must contain at least "simple-pm-bus".
> -		Must not contain "simple-bus".
> -		It's recommended to let this be preceded by one or more
> -		vendor-specific compatible values.
> -  - #address-cells, #size-cells, ranges: Must describe the mapping between
> -		parent address and child address spaces.
> -
> -Optional platform-specific properties for clock or PM domain control (at least
> -one of them is required):
> -  - clocks: Must contain a reference to the functional clock(s),
> -  - power-domains: Must contain a reference to the PM domain.
> -Please refer to the binding documentation for the clock and/or PM domain
> -providers for more details.
> -
> -
> -Example:
> -
> -	bsc: bus@fec10000 {
> -		compatible = "renesas,bsc-sh73a0", "renesas,bsc",
> -			     "simple-pm-bus";
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges = <0 0 0x20000000>;
> -		reg = <0xfec10000 0x400>;
> -		interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&zb_clk>;
> -		power-domains = <&pd_a4s>;
> -	};
> diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> new file mode 100644
> index 000000000000..72a3644974e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> @@ -0,0 +1,68 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple Power-Managed Bus
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description: |
> +  A Simple Power-Managed Bus is a transparent bus that doesn't need a real
> +  driver, as it's typically initialized by the boot loader.
> +
> +  However, its bus controller is part of a PM domain, or under the control
> +  of a functional clock.  Hence, the bus controller's PM domain and/or
> +  clock must be enabled for child devices connected to the bus (either
> +  on-SoC or externally) to function.
> +
> +  While "simple-pm-bus" follows the "simple-bus" set of properties, as
> +  specified in the Devicetree Specification, it is not an extension of
> +  "simple-bus".
> +
> +

There is an extra blank line above, I will plan to remove it in v2.

> +properties:
> +  compatible:
> +    items:
> +       - const: simple-pm-bus

The following patch, for Renesas BSC, also
describes the simple-pm-bus but also requires other compatible
strings to be present.

In order to facilitate that I tried the following:

   compatible:
      contains:
         const: simple-pm-bus
      additionalItems: true

This allows make dtbs_check DT_SCHEMA_FILES=.../simple-pm-bus.yaml to pass
in cases where there are more compat strings pesent. However
make dtbs_check DT_SCHEMA_FILES=...renesas,bsc.yaml (schema file
introduced in following patch) fails in the case
where the only compat string is simple-pm-bus.

make dtbs_check DT_SCHEMA_FILES=...renesas,bsc.yaml also fails
due to the reg property not being present for the same compat case,
which should be valid according to simple-pm-bus.yaml.

Does anyone have any guidance on how to proceed?

> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges:
> +    # Mapping between parent address and child address spaces.
> +    maxItems: 1
> +
> +  clocks:
> +    # Functional clocks
> +    # Required if power-domains is absent, optional otherwise
> +    minItems: 1
> +
> +  power-domains:
> +    # Required if clocks is absent, optional otherwise
> +    minItems: 1
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +  - ranges
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    bsc: bus@fec10000 {
> +        compatible = "simple-pm-bus";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0 0x20000000>;
> +        reg = <0xfec10000 0x400>;
> +        interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&zb_clk>;
> +        power-domains = <&pd_a4s>;
> +    };
> -- 
> 2.11.0
> 
