Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01C6F714AAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 May 2023 15:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjE2NuY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 May 2023 09:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjE2NuX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 May 2023 09:50:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D385107;
        Mon, 29 May 2023 06:50:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126255106133.24.openmobile.ne.jp [126.255.106.133])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 614A0836;
        Mon, 29 May 2023 15:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685368191;
        bh=Z5YaI4FQ4nsu1kJlSC+REgzPugOlcWreD0VGwhXFugU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DfUOhJEn3jJ8hZGyuHKR6cZM1Pk9DNtw6KtaAouAzEjQpD9TFVN0U31Dr9+zXGG2S
         2ppxSsf70NTxWVukFTs0J/EEN1hME65gkv0tSZx+pO8qTT9BSrz3guMMWhhNBjGh6x
         0ZMQsLmYUdWs0rBrw5sOuYx0+QuLJhVCoCDyewfk=
Date:   Mon, 29 May 2023 16:49:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 RESEND 2/5] dt-bindings: display: Document Renesas
 RZ/G2L DU bindings
Message-ID: <20230529134959.GA27467@pendragon.ideasonboard.com>
References: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
 <20230502100912.143114-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230502100912.143114-3-biju.das.jz@bp.renesas.com>
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

On Tue, May 02, 2023 at 11:09:09AM +0100, Biju Das wrote:
> The RZ/G2L LCD controller is composed of Frame Compression Processor
> (FCPVD), Video Signal Processor (VSPD), and Display Unit (DU).
> 
> The DU module supports the following hardware features
> − Display Parallel Interface (DPI) and MIPI LINK Video Interface
> − Display timing master
> − Generates video timings
> − Selecting the polarity of output DCLK, HSYNC, VSYNC, and DE
> − Supports Progressive
> − Input data format (from VSPD): RGB888, RGB666
> − Output data format: same as Input data format
> − Supporting Full HD (1920 pixels x 1080 lines) for MIPI-DSI Output
> − Supporting WXGA (1280 pixels x 800 lines) for Parallel Output
> 
> This patch document DU module found on RZ/G2L LCDC.

s/document/documents the/

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v8->v9:
>  * No change
> v7->v8:
>  * No change
> v6->v7:
>  * No change
> v5->v6:
>  * No change.
> v4->v5:
>  * Added Rb tag from Rob.
> v3->v4:
>  * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-du
>  * started using same compatible for RZ/G2{L,LC}
> v3: New patch
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> new file mode 100644
> index 000000000000..ab99e7d57a7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -0,0 +1,124 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/renesas,rzg2l-du.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L Display Unit (DU)
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  These DT bindings describe the Display Unit embedded in the Renesas RZ/G2L
> +  and RZ/V2L SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a07g044-du # RZ/G2{L,LC}
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main clock
> +      - description: Register access clock
> +      - description: Video clock
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: pclk
> +      - const: vclk
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      The connections to the DU output video ports are modeled using the OF
> +      graph bindings specified in Documentation/devicetree/bindings/graph.txt.

The file has moved to graph.yaml in the dt-schema repo. I'll drop the
last part of the sentence, starting with "specified by".

> +      The number of ports and their assignment are model-dependent. Each port
> +      shall have a single endpoint.
> +
> +    patternProperties:
> +      "^port@[0-1]$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false
> +
> +    required:
> +      - port@0
> +
> +    unevaluatedProperties: false
> +
> +  renesas,vsps:
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    items:
> +      items:
> +        - description: phandle to VSP instance that serves the DU channel
> +        - description: Channel index identifying the LIF instance in that VSP
> +    description:
> +      A list of phandle and channel index tuples to the VSPs that handle the
> +      memory interfaces for the DU channels.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - power-domains
> +  - ports
> +  - renesas,vsps
> +
> +additionalProperties: false
> +
> +examples:
> +  # RZ/G2L DU
> +  - |
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    display@10890000 {
> +        compatible = "renesas,r9a07g044-du";
> +        reg = <0x10890000 0x10000>;
> +        interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
> +                 <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
> +                 <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;
> +        clock-names = "aclk", "pclk", "vclk";
> +        resets = <&cpg R9A07G044_LCDC_RESET_N>;
> +        power-domains = <&cpg>;
> +
> +        renesas,vsps = <&vspd0 0>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                endpoint {
> +                    remote-endpoint = <&dsi0_in>;
> +                };
> +            };
> +            port@1 {
> +                reg = <1>;
> +                endpoint {
> +                };

Endpoints shouldn't be empty, you can just drop the endpoint here.

I'll fix all this locally.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
