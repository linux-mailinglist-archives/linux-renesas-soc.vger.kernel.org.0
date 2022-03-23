Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEFED4E5841
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 19:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243089AbiCWSS4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 14:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237766AbiCWSS4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 14:18:56 -0400
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E93F88B35;
        Wed, 23 Mar 2022 11:17:26 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id x8-20020a9d6288000000b005b22c373759so1623405otk.8;
        Wed, 23 Mar 2022 11:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UMilCH3nmO4hHuQpJXoN2BLcTlli6OsI7fhFVNJE50w=;
        b=qjnQBA5fJZYYgNBJHgj4kEJXhcpC9jeormcoKyE3VvEL6FH6rAQ5Cl2SHorPafJGSS
         AZlvCUuy0b6tTe29c4U7W/DOxFc1om+LVt21IGvLZwH1MjDE0pRqVV6BxINM4StJ8I0Q
         MmQtd3wLPV6iNO83ho797e8HZWykIIt43bTymLdHriwt6dby9TpF4DVhvYM1m8drmIH4
         YD9jkWBIPtoO3c43dirmEH+pzz2mQnoaDpN2jHJyYsGvH6JZcG6nPWXedWhLMQ2YhE++
         ouCulztTXbYhGUred/HQWS8wCi8tvr1Wl9X/Df96/sCk93G2hFQ5En/twq34ZU9Th9XJ
         JTHA==
X-Gm-Message-State: AOAM531IXJBRyvBtq0PSUTPnPl+/z8yvk86tMP7NoFHNK6uiQjRqwjh2
        yHjYzZFhA7xO7XbrNamKZQ==
X-Google-Smtp-Source: ABdhPJyY3XpjvesCfrD2gGm+p1Kf4TEmHHzEFzoS8st8x4woCgqCc8eAyWBIbIYnalhw5UQR550UAg==
X-Received: by 2002:a05:6830:1c3d:b0:5cd:97c1:2590 with SMTP id f29-20020a0568301c3d00b005cd97c12590mr584713ote.90.1648059445321;
        Wed, 23 Mar 2022 11:17:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 15-20020a056870118f00b000de58283559sm273166oau.36.2022.03.23.11.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 11:17:24 -0700 (PDT)
Received: (nullmailer pid 196157 invoked by uid 1000);
        Wed, 23 Mar 2022 18:17:23 -0000
Date:   Wed, 23 Mar 2022 13:17:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Message-ID: <YjtkMxC0X7mMvMKX@robh.at.kernel.org>
References: <20220314161004.14765-1-biju.das.jz@bp.renesas.com>
 <20220314161004.14765-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314161004.14765-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 14, 2022 at 04:10:02PM +0000, Biju Das wrote:
> The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's. It
> can operate in DSI mode, with up to four data lanes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> RFC->v1:
>  * Added a ref to dsi-controller.yaml.
> RFC:-
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-22-biju.das.jz@bp.renesas.com/
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> new file mode 100644
> index 000000000000..74bc3782d230
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -0,0 +1,146 @@
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
> +  RZ/G2L family of SoC's. The encoder can operate in DSI mode with up
> +  to four data lanes.
> +
> +allOf:
> +  - $ref: ../dsi-controller.yaml#

Full path preferred:

/schemas/display/dsi-controller.yaml#

> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,rzg2l-mipi-dsi # RZ/G2L and RZ/V2L
> +
> +  reg:
> +    items:
> +      - description: Link register
> +      - description: D-PHY register

D-PHY is not a separate block?

> +
> +  clocks:
> +    items:
> +      - description: DSI D-PHY PLL multiplied clock
> +      - description: DSI D-PHY system clock
> +      - description: DSI AXI bus clock
> +      - description: DSI Register access clock
> +      - description: DSI Video clock
> +      - description: DSI D_PHY Escape mode Receive clock

D-PHY

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
> +        compatible = "renesas,rzg2l-mipi-dsi";
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
