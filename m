Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26ABB3B1671
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 11:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhFWJI6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 05:08:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbhFWJI6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 05:08:58 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEFB649A;
        Wed, 23 Jun 2021 11:06:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624439199;
        bh=HAPDSz7k2GJWnoELzDAx7DoBuZ/LnRd0WOwW8LNLxLE=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=p63WTTiT0c2YE0obx4VhF2f0BYhnNmi2RPhIm7nXSux+u3RdV7Egp8dy+WDVb3Oyr
         My5SIv+21PmOZdGCEomlSNXAsQHMqSel9MAxx7dp0/8y604aAJRhMpjCPx5uxFqvJQ
         H4jyrjp869KWqQdttMVqQKR1/Bs0OHx6O4zVn0vI=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH 01/15] dt-bindings: display: bridge: Add binding for
 R-Car MIPI DSI/CSI-2 TX
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210623034656.10316-2-laurent.pinchart+renesas@ideasonboard.com>
Message-ID: <bc508b07-5028-b8e9-b0ac-994c9deca74d@ideasonboard.com>
Date:   Wed, 23 Jun 2021 10:06:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623034656.10316-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 23/06/2021 04:46, Laurent Pinchart wrote:
> The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
> can operate in either DSI or CSI-2 mode, with up to four data lanes.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> new file mode 100644
> index 000000000000..7e1b606a65ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car MIPI DSI/CSI-2 Encoder
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
> +  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> +  to four data lanes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r8a779a0-dsi-csi2-tx # for V3U

Only a potential nit ...

Is it worth moving the "# for V3U" over a bit to allow for extended
compatibles in the future without re-aligning the table?

Looks like 37 chars before it currently, it could at least move to
position 40.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Functional clock
> +      - description: DSI (and CSI-2) functional clock
> +      - description: PLL reference clock
> +
> +  clock-names:
> +    items:
> +      - const: fck
> +      - const: dsi
> +      - const: pll
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
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
> +        description: DSI/CSI-2 output port
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
> +  - clocks
> +  - power-domains
> +  - resets
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a779a0-sysc.h>
> +
> +    dsi0: dsi-encoder@fed80000 {
> +        compatible = "renesas,r8a779a0-dsi-csi2-tx";
> +        reg = <0xfed80000 0x10000>;
> +        power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +        clocks = <&cpg CPG_MOD 415>,
> +                 <&cpg CPG_CORE R8A779A0_CLK_DSI>,
> +                 <&cpg CPG_CORE R8A779A0_CLK_CP>;
> +        clock-names = "fck", "dsi", "pll";

is the CP/PLL clock actually needed?

I don't see any other gen3 peripheral referencing it.

Is it expected to be required for calculations in the DSI encoder?

Otherwise,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> +        resets = <&cpg 415>;
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
> +                    data-lanes = <1 2>;
> +                    remote-endpoint = <&sn65dsi86_in>;
> +                };
> +            };
> +        };
> +    };
> +...
> 
