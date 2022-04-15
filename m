Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C07950280C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Apr 2022 12:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352162AbiDOKT1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Apr 2022 06:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbiDOKT1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Apr 2022 06:19:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE45B646A;
        Fri, 15 Apr 2022 03:16:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-80-250-nat.elisa-mobile.fi [85.76.80.250])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32E9F482;
        Fri, 15 Apr 2022 12:16:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650017816;
        bh=N5czrActOay1ucRY4p9jaOGU8VLry60tUKy74HLwMug=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qtLK5EX95DnmHLF2fNvoiTXs0x6vnL7FQZn0NPAdBXSn/hBDuZ+OlsfYs6xcOSi3Q
         QLAe2SV/SVDkulc46fnjjeEXwU9ViQEffgR6eaWBzRZH4tycRMjXxB+6oYycpO89v9
         TuzjSYNz1yj+kWtwJ44FgHnrre9oY1w7K0dmfx1U=
Date:   Fri, 15 Apr 2022 13:16:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document RZ/G2L
 MIPI DSI TX bindings
Message-ID: <YllGFRx3RZjJliTS@pendragon.ideasonboard.com>
References: <20220328064931.11612-1-biju.das.jz@bp.renesas.com>
 <20220328064931.11612-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220328064931.11612-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Mon, Mar 28, 2022 at 07:49:30AM +0100, Biju Das wrote:
> The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's. It
> can operate in DSI mode, with up to four data lanes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added full path for dsi-controller.yaml
>  * Modeled DSI + D-PHY as single block and updated reg property
>  * Fixed typo D_PHY->D-PHY
>  * Updated description
>  * Added interrupts and interrupt-names and updated the example 
> RFC->v1:
>  * Added a ref to dsi-controller.yaml.
> RFC:-
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-22-biju.das.jz@bp.renesas.com/
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> new file mode 100644
> index 000000000000..eebbf617c484
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L MIPI DSI Encoder
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  This binding describes the MIPI DSI encoder embedded in the Renesas
> +  RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
> +  up to four data lanes.
> +
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,rzg2l-mipi-dsi # RZ/G2L and RZ/V2L
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Sequence operation channel 0 interrupt
> +      - description: Sequence operation channel 1 interrupt
> +      - description: Video-Input operation channel 1 interrupt
> +      - description: DSI Packet Receive interrupt
> +      - description: DSI Fatal Error interrupt
> +      - description: DSI D-PHY PPI interrupt
> +      - description: Debug interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: seq0
> +      - const: seq1
> +      - const: vin1
> +      - const: rcv
> +      - const: ferr
> +      - const: ppi
> +      - const: debug
> +
> +  clocks:
> +    items:
> +      - description: DSI D-PHY PLL multiplied clock
> +      - description: DSI D-PHY system clock
> +      - description: DSI AXI bus clock
> +      - description: DSI Register access clock
> +      - description: DSI Video clock
> +      - description: DSI D-PHY Escape mode Receive clock

Isn't this the escape mode *transmit* clock ?

> +
> +  clock-names:
> +    items:
> +      - const: pllclk
> +      - const: sysclk
> +      - const: aclk
> +      - const: pclk
> +      - const: vclk
> +      - const: lpclk
> +
> +  resets:
> +    items:
> +      - description: MIPI_DSI_CMN_RSTB
> +      - description: MIPI_DSI_ARESET_N
> +      - description: MIPI_DSI_PRESET_N
> +
> +  reset-names:
> +    items:
> +      - const: rst
> +      - const: arst
> +      - const: prst
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Parallel input port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: DSI output port
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4

You should specify the acceptable values, especially given that the
hardware doesn't seem to support lane reordering.

> +
> +            required:
> +              - data-lanes
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>

Could you please swap those two lines to get them sorted alphabetically
?

With these comments addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +    dsi0: dsi@10850000 {
> +        compatible = "renesas,rzg2l-mipi-dsi";
> +        reg = <0x10850000 0x20000>;
> +        interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "seq0", "seq1", "vin1", "rcv",
> +                          "ferr", "ppi", "debug";
> +        clocks = <&cpg CPG_MOD R9A07G044_MIPI_DSI_PLLCLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_SYSCLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_ACLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_PCLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_VCLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_LPCLK>;
> +        clock-names = "pllclk", "sysclk", "aclk", "pclk", "vclk", "lpclk";
> +        resets = <&cpg R9A07G044_MIPI_DSI_CMN_RSTB>,
> +                 <&cpg R9A07G044_MIPI_DSI_ARESET_N>,
> +                 <&cpg R9A07G044_MIPI_DSI_PRESET_N>;
> +        reset-names = "rst", "arst", "prst";
> +        power-domains = <&cpg>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dsi0_in: endpoint {
> +                    remote-endpoint = <&du_out_dsi0>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dsi0_out: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    remote-endpoint = <&adv7535_in>;
> +                };
> +            };
> +        };
> +    };
> +...

-- 
Regards,

Laurent Pinchart
