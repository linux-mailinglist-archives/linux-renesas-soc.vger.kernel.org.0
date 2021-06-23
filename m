Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046313B1ABA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 15:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbhFWNJF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 09:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhFWNJF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 09:09:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56835C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 06:06:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6DC89AA;
        Wed, 23 Jun 2021 15:06:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624453606;
        bh=NgdQ8ykOXBMeYY3iESqC9D9JcCJ/cCVN38t1VWQtFv4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e8LIAo3YMj571ZP82qRkRpvO6qPxhXyn2qu1AzBOEAfMhgLb1e5fYB4g4M7kEk2Vw
         b/j0fea3JeekiHITMY0rj/3bavkTmuQnDeJHCwotOk096OH/hAa3CJKNNddLQ0NG3I
         voEYkDHLsYH1hPO5xiJms6WvK/0x/7+x7mj7QKDQ=
Date:   Wed, 23 Jun 2021 16:06:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [RFC PATCH 01/15] dt-bindings: display: bridge: Add binding for
 R-Car MIPI DSI/CSI-2 TX
Message-ID: <YNMxyCvON4tfZzNX@pendragon.ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210623034656.10316-2-laurent.pinchart+renesas@ideasonboard.com>
 <bc508b07-5028-b8e9-b0ac-994c9deca74d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bc508b07-5028-b8e9-b0ac-994c9deca74d@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 23, 2021 at 10:06:37AM +0100, Kieran Bingham wrote:
> Hi Laurent,
> 
> On 23/06/2021 04:46, Laurent Pinchart wrote:
> > The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
> > can operate in either DSI or CSI-2 mode, with up to four data lanes.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 ++++++++++++++++++
> >  1 file changed, 118 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > new file mode 100644
> > index 000000000000..7e1b606a65ea
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > @@ -0,0 +1,118 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car MIPI DSI/CSI-2 Encoder
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > +
> > +description: |
> > +  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
> > +  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> > +  to four data lanes.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,r8a779a0-dsi-csi2-tx # for V3U
> 
> Only a potential nit ...
> 
> Is it worth moving the "# for V3U" over a bit to allow for extended
> compatibles in the future without re-aligning the table?
> 
> Looks like 37 chars before it currently, it could at least move to
> position 40.

If that's all it requires to make you happy, no problem :-)

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Functional clock
> > +      - description: DSI (and CSI-2) functional clock
> > +      - description: PLL reference clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: fck
> > +      - const: dsi
> > +      - const: pll
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Parallel input port
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: DSI/CSI-2 output port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +            required:
> > +              - data-lanes
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +  - resets
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
> > +    #include <dt-bindings/power/r8a779a0-sysc.h>
> > +
> > +    dsi0: dsi-encoder@fed80000 {
> > +        compatible = "renesas,r8a779a0-dsi-csi2-tx";
> > +        reg = <0xfed80000 0x10000>;
> > +        power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> > +        clocks = <&cpg CPG_MOD 415>,
> > +                 <&cpg CPG_CORE R8A779A0_CLK_DSI>,
> > +                 <&cpg CPG_CORE R8A779A0_CLK_CP>;
> > +        clock-names = "fck", "dsi", "pll";
> 
> is the CP/PLL clock actually needed?
> 
> I don't see any other gen3 peripheral referencing it.
> 
> Is it expected to be required for calculations in the DSI encoder?

It's listed in the datasheet as the DSI PLL input clock. The driver
still uses the old "extal" name though, which I'll fix.

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > +        resets = <&cpg 415>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                dsi0_in: endpoint {
> > +                    remote-endpoint = <&du_out_dsi0>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                dsi0_out: endpoint {
> > +                    data-lanes = <1 2>;
> > +                    remote-endpoint = <&sn65dsi86_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > 

-- 
Regards,

Laurent Pinchart
