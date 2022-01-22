Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE8949690C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Jan 2022 02:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbiAVBFD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jan 2022 20:05:03 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:39706 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbiAVBFD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jan 2022 20:05:03 -0500
Received: by mail-oi1-f177.google.com with SMTP id e81so16012628oia.6;
        Fri, 21 Jan 2022 17:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7q+571qAmFg/5U815QvLHkl+PqoSH5bHFXvp/KLgACQ=;
        b=0F7vq5UyDIPLTU+NEibJSt7HO3k6SLFSSqdN5J8HGVI+5vjxOFg9I+3HMWCauLNY5D
         2yk2u47YYcFFkLQLefc6f7M2Z0Sj9GkSa2y9+KC8ApT1Pan4Q4SUoqiTtr2879i3ki44
         J1G5FnJTF9DPgTKTJ2g/x903AvPF2Z/gDx4ovC9PhSX6tTLXrx3SIMGT3wDRklVIJBwp
         CcRzLz7uAuhj67MHSxSOvwG12xr8NDkyMA/z1+2VQGpO9gyp6+EQn3U5I7gHq/Cl8v8s
         hxwXkbIJ+mOCaHEEz0BPuHzvjbqhps6Xxw8z5idsA2HEuFhGJB+AzSFsWyPQPtEdj6Gt
         NIzg==
X-Gm-Message-State: AOAM530cbnoZxFxDPWT2BsGaEXq6c4Bu96BUDqpPh35EHRVdTy6LOmm1
        9PB0QIQnonRMQgl/cAYvWXdu4g7P7g==
X-Google-Smtp-Source: ABdhPJwejoEzMeEvfOkZ7F3tncbAj35X0/2+Inq1VTR5xYH1uFhJsTrARUrgA7dElvPkeNol2emn9w==
X-Received: by 2002:aca:1311:: with SMTP id e17mr2600994oii.119.1642813502340;
        Fri, 21 Jan 2022 17:05:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d1sm1790288otk.70.2022.01.21.17.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 17:05:01 -0800 (PST)
Received: (nullmailer pid 1969318 invoked by uid 1000);
        Sat, 22 Jan 2022 01:05:00 -0000
Date:   Fri, 21 Jan 2022 19:05:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC 21/28] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Message-ID: <YetYPCwJeVMAO+6F@robh.at.kernel.org>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-22-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112174612.10773-22-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 12, 2022 at 05:46:05PM +0000, Biju Das wrote:
> The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's. It
> can operate in DSI mode, with up to four data lanes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 143 ++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> new file mode 100644
> index 000000000000..8e56a9c53cc5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car MIPI DSI Encoder
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  This binding describes the MIPI DSI encoder embedded in the Renesas
> +  RZ/G2L family of SoC's. The encoder can operate in DSI mode with up
> +  to four data lanes.

Need a ref to dsi-controller.yaml.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a07g044-mipi-dsi    # for RZ/G2L
> +
> +  reg:
> +    items:
> +      - description: Link register
> +      - description: D-PHY register

D-PHY isn't a separate block?

> +
> +  clocks:
> +    items:
> +      - description: DSI D-PHY PLL multiplied clock
> +      - description: DSI D-PHY system clock
> +      - description: DSI AXI bus clock
> +      - description: DSI Register access clock
> +      - description: DSI Video clock
> +      - description: DSI D_PHY Escape mode Receive clock
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
> +  power-domains:
> +    maxItems: 1
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
> +  - clock-names
> +  - power-domains
> +  - resets
> +  - reset-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> +
> +    dsi0: dsi@10860000 {
> +        compatible = "renesas,r9a07g044-mipi-dsi";
> +        reg = <0x10860000 0x10000>,
> +              <0x10850000 0x10000>;
> +        power-domains = <&cpg>;
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
> -- 
> 2.17.1
> 
> 
