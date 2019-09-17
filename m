Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C833B4CF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 13:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfIQLcz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 07:32:55 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39002 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfIQLcz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 07:32:55 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 44FCB25AD71;
        Tue, 17 Sep 2019 21:32:52 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4D2609407F6; Tue, 17 Sep 2019 13:32:50 +0200 (CEST)
Date:   Tue, 17 Sep 2019 13:32:50 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: thermal: rcar-thermal: convert bindings to
 json-schema
Message-ID: <20190917113250.6q4mmyiaa7pdkbeb@verge.net.au>
References: <20190916100717.31472-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190916100717.31472-1-horms+renesas@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 16, 2019 at 12:07:17PM +0200, Simon Horman wrote:
> Convert Renesas R-Car Thermal bindings documentation to json-schema.
> Also name bindings documentation file according to the compat string
> being documented.
> 
> As a side effect of this change all currently supported/used compat
> strings are listed while no while card compat string is documented.
> This, in my opinion, is desirable as only supported hardware should
> be documented.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> Tested using:
>   ARCH=arm make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/thermal/renesas,rcar-thermal.yaml
> ---
>  .../devicetree/bindings/thermal/rcar-thermal.txt   |  78 ---------------
>  .../bindings/thermal/renesas,rcar-thermal.yaml     | 110 +++++++++++++++++++++
>  2 files changed, 110 insertions(+), 78 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/thermal/rcar-thermal.txt
>  create mode 100644 Documentation/devicetree/bindings/thermal/renesas,rcar-thermal.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> deleted file mode 100644
> index 196112d23b1e..000000000000
> --- a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -* Renesas R-Car Thermal
> -
> -Required properties:
> -- compatible		: "renesas,thermal-<soctype>",
> -			   "renesas,rcar-gen2-thermal" (with thermal-zone) or
> -			   "renesas,rcar-thermal" (without thermal-zone) as
> -                           fallback except R-Car V3M/E3/D3 and RZ/G2E.
> -			  Examples with soctypes are:
> -			    - "renesas,thermal-r8a73a4" (R-Mobile APE6)
> -			    - "renesas,thermal-r8a7743" (RZ/G1M)
> -			    - "renesas,thermal-r8a7744" (RZ/G1N)
> -			    - "renesas,thermal-r8a774c0" (RZ/G2E)
> -			    - "renesas,thermal-r8a7779" (R-Car H1)
> -			    - "renesas,thermal-r8a7790" (R-Car H2)
> -			    - "renesas,thermal-r8a7791" (R-Car M2-W)
> -			    - "renesas,thermal-r8a7792" (R-Car V2H)
> -			    - "renesas,thermal-r8a7793" (R-Car M2-N)
> -			    - "renesas,thermal-r8a77970" (R-Car V3M)
> -			    - "renesas,thermal-r8a77990" (R-Car E3)
> -			    - "renesas,thermal-r8a77995" (R-Car D3)
> -- reg			: Address range of the thermal registers.
> -			  The 1st reg will be recognized as common register
> -			  if it has "interrupts".
> -
> -Option properties:
> -
> -- interrupts		: If present should contain 3 interrupts for
> -                          R-Car V3M/E3/D3 and RZ/G2E or 1 interrupt otherwise.
> -
> -Example (non interrupt support):
> -
> -thermal@ffc48000 {
> -	compatible = "renesas,thermal-r8a7779", "renesas,rcar-thermal";
> -	reg = <0xffc48000 0x38>;
> -};
> -
> -Example (interrupt support):
> -
> -thermal@e61f0000 {
> -	compatible = "renesas,thermal-r8a73a4", "renesas,rcar-thermal";
> -	reg = <0xe61f0000 0x14
> -		0xe61f0100 0x38
> -		0xe61f0200 0x38
> -		0xe61f0300 0x38>;
> -	interrupts = <0 69 IRQ_TYPE_LEVEL_HIGH>;
> -};
> -
> -Example (with thermal-zone):
> -
> -thermal-zones {
> -	cpu_thermal: cpu-thermal {
> -		polling-delay-passive	= <1000>;
> -		polling-delay		= <5000>;
> -
> -		thermal-sensors = <&thermal>;
> -
> -		trips {
> -			cpu-crit {
> -				temperature	= <115000>;
> -				hysteresis	= <0>;
> -				type		= "critical";
> -			};
> -		};
> -		cooling-maps {
> -		};
> -	};
> -};
> -
> -thermal: thermal@e61f0000 {
> -	compatible =	"renesas,thermal-r8a7790",
> -			"renesas,rcar-gen2-thermal",
> -			"renesas,rcar-thermal";
> -	reg = <0 0xe61f0000 0 0x14>, <0 0xe61f0100 0 0x38>;
> -	interrupts = <0 69 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks = <&mstp5_clks R8A7790_CLK_THERMAL>;
> -	power-domains = <&cpg_clocks>;
> -	#thermal-sensor-cells = <0>;
> -};
> diff --git a/Documentation/devicetree/bindings/thermal/renesas,rcar-thermal.yaml b/Documentation/devicetree/bindings/thermal/renesas,rcar-thermal.yaml
> new file mode 100644
> index 000000000000..ab4cc3c35410
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/renesas,rcar-thermal.yaml
> @@ -0,0 +1,110 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/renesas,rcar-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Thermal
> +
> +maintainers:
> +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,thermal-r8a73a4       # R-Mobile APE6
> +              - renesas,thermal-r8a7743       # RZ/G1M
> +              - renesas,thermal-r8a7744       # RZ/G1N
> +              - renesas,thermal-r8a7779       # R-Car H1
> +              - renesas,thermal-r8a774c0      # RZ/G2E
> +              - renesas,thermal-r8a77970      # R-Car V3M
> +              - renesas,thermal-r8a77990      # R-Car E3
> +              - renesas,thermal-r8a77995      # R-Car D3
> +          - const: renesas,rcar-thermal       # Without thermal-zone
> +
> +      - items:
> +          - enum:
> +              - renesas,thermal-r8a7790       # R-Car H2
> +              - renesas,thermal-r8a7791       # R-Car M2-W
> +              - renesas,thermal-r8a7792       # R-Car V2H
> +              - renesas,thermal-r8a7793       # R-Car M2-N
> +          - const: renesas,rcar-gen2-thermal  # With thermal-zone
> +          - const: renesas,rcar-thermal       # Without thermal-zone

I missread the original bindings document and somehow missed
warnings emitted by dtbs_check. I now think the compat property should be
described as:

  compatible:
    oneOf:
      - items:
          - enum:
              - renesas,thermal-r8a73a4       # R-Mobile APE6
              - renesas,thermal-r8a7779       # R-Car H1
          - const: renesas,rcar-thermal       # Without thermal-zone

      - items:
          - enum:
              - renesas,thermal-r8a7790       # R-Car H2
              - renesas,thermal-r8a7791       # R-Car M2-W
              - renesas,thermal-r8a7792       # R-Car V2H
              - renesas,thermal-r8a7793       # R-Car M2-N
          - const: renesas,rcar-gen2-thermal  # With thermal-zone
          - const: renesas,rcar-thermal       # Without thermal-zone

      - items:
          - enum:
              - renesas,thermal-r8a7743       # RZ/G1M
              - renesas,thermal-r8a7744       # RZ/G1N
          - const: renesas,rcar-gen2-thermal  # With thermal-zone

      - items:
          - enum:
              - renesas,thermal-r8a774c0      # RZ/G2E
              - renesas,thermal-r8a77970      # R-Car V3M
              - renesas,thermal-r8a77990      # R-Car E3
              - renesas,thermal-r8a77995      # R-Car D3

> +
> +  reg:
> +    # Address range of the thermal registers.
> +    # The 1st reg will be recognized as common register if it has "interrupts".
> +    minItems: 1

There may be any number of register blocks present and the
"# Address range of the thermal registers." is very generic.
So I think the above should be updated to:

  reg: true
    # The 1st reg will be recognized as common register if it has "interrupts".

> +
> +  interrupts:
> +    # If present should contain 3 interrupts for R-Car V3M/E3/D3 and RZ/G2E,
> +    # otherwise 1 interrupt.
> +    minItems: 1
> +    maxItems: 3
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples :
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/r8a7790-clock.h>
> +
> + # Example (non interrupt support):
> +  - |
> +    thermal@ffc48000 {
> +        compatible = "renesas,thermal-r8a7779", "renesas,rcar-thermal";
> +        reg = <0xffc48000 0x38>;
> +    };
> +
> +  # Example (interrupt support):
> +  - |
> +    thermal@e61f0000 {
> +        compatible = "renesas,thermal-r8a73a4", "renesas,rcar-thermal";
> +        reg = <0xe61f0000 0x14
> +               0xe61f0100 0x38
> +               0xe61f0200 0x38
> +               0xe61f0300 0x38>;
> +        interrupts = <0 69 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +  # Example (with thermal-zone):
> +  - |
> +    thermal-zones {
> +        cpu_thermal: cpu-thermal {
> +            polling-delay-passive = <1000>;
> +            polling-delay = <5000>;
> +
> +            thermal-sensors = <&thermal>;
> +
> +            trips {
> +                cpu-crit {
> +                    temperature = <115000>;
> +                    hysteresis = <0>;
> +                    type = "critical";
> +                };
> +            };
> +            cooling-maps {
> +            };
> +        };
> +    };
> +
> +    thermal: thermal@e61f0000 {
> +        compatible = "renesas,thermal-r8a7790",
> +                     "renesas,rcar-gen2-thermal",
> +                     "renesas,rcar-thermal";
> +        reg = <0 0xe61f0000 0 0x14>, <0 0xe61f0100 0 0x38>;
> +        interrupts = <0 69 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&mstp5_clks R8A7790_CLK_THERMAL>;
> +        power-domains = <&cpg_clocks>;
> +        #thermal-sensor-cells = <0>;
> +    };
> -- 
> 2.11.0
> 
