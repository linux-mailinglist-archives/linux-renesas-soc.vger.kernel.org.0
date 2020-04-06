Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 931C719F427
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 13:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgDFLJg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Apr 2020 07:09:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43648 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgDFLJg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Apr 2020 07:09:36 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8429780E;
        Mon,  6 Apr 2020 13:09:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586171373;
        bh=wOa46SkDs0zPYtO0Mk2Rt7HQJtUozoqbzU6t9dIdgmk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QToKcaKzf7LnS/uQ79TxJ8EaLZH33OBk4yS8/eGWK0P/4Xk9yiHYT+L65Oo4zEQ52
         GmXdtQBkP74hSzCnnJuWDEVkR8hpA1XLbNrBs1TS9o6RjlOZr9fb5T4FcfMs944BQV
         jPKrcnJDVFFhKds6IjQh+F1QdNShVxJzT+Mffsp4=
Date:   Mon, 6 Apr 2020 14:09:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas,lvds: Convert
 binding to YAML
Message-ID: <20200406110924.GB4757@pendragon.ideasonboard.com>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXJcw0eGY7J=JcGv6Hs9E_GCybsYSeKKeH5pAH8nkdTrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXJcw0eGY7J=JcGv6Hs9E_GCybsYSeKKeH5pAH8nkdTrg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Apr 06, 2020 at 10:47:37AM +0200, Geert Uytterhoeven wrote:
> On Mon, Apr 6, 2020 at 1:24 AM Laurent Pinchart wrote:
> > Convert the Renesas R-Car LVDS encoder text binding to YAML.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > @@ -0,0 +1,248 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/renesas,lvds.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car LVDS Encoder
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > +
> > +description: |
> > +  These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
> > +  Gen2, R-Car Gen3 and RZ/G SoCs.
> 
> RZ/G1 and RZ/G2 (no idea what'll RZ/G3 will bring ;-)

Fixed.

> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,r8a7743-lvds # for R8A7743 (RZ/G1M) compatible LVDS encoders
> > +      - renesas,r8a7744-lvds # for R8A7744 (RZ/G1N) compatible LVDS encoders
> > +      - renesas,r8a774a1-lvds # for R8A774A1 (RZ/G2M) compatible LVDS encoders
> > +      - renesas,r8a774b1-lvds # for R8A774B1 (RZ/G2N) compatible LVDS encoders
> > +      - renesas,r8a774c0-lvds # for R8A774C0 (RZ/G2E) compatible LVDS encoders
> > +      - renesas,r8a7790-lvds # for R8A7790 (R-Car H2) compatible LVDS encoders
> > +      - renesas,r8a7791-lvds # for R8A7791 (R-Car M2-W) compatible LVDS encoders
> > +      - renesas,r8a7793-lvds # for R8A7793 (R-Car M2-N) compatible LVDS encoders
> > +      - renesas,r8a7795-lvds # for R8A7795 (R-Car H3) compatible LVDS encoders
> > +      - renesas,r8a7796-lvds # for R8A7796 (R-Car M3-W) compatible LVDS encoders
> 
> R8A77960 (I know you don't have support for R8A77961 yet ;-)
> 
> > +      - renesas,r8a77965-lvds # for R8A77965 (R-Car M3-N) compatible LVDS encoders
> > +      - renesas,r8a77970-lvds # for R8A77970 (R-Car V3M) compatible LVDS encoders
> > +      - renesas,r8a77980-lvds # for R8A77980 (R-Car V3H) compatible LVDS encoders
> > +      - renesas,r8a77990-lvds # for R8A77990 (R-Car E3) compatible LVDS encoders
> > +      - renesas,r8a77995-lvds # for R8A77995 (R-Car D3) compatible LVDS encoders
> 
> Wouldn't it be sufficient to just have the SoC name (e.g. "R-Car D3") in
> the comments?

Good idea. I've thus dropped R8A7796(0) :-)

> > +if:
> > +  properties:
> > +    compatible:
> > +      enum:
> > +        - renesas,r8a774c0-lvds
> > +        - renesas,r8a77990-lvds
> > +        - renesas,r8a77995-lvds
> > +then:
> > +  properties:
> > +    clocks:
> > +      minItems: 1
> > +      maxItems: 4
> > +      items:
> > +        - description: Functional clock
> > +        - description: EXTAL input clock
> > +        - description: DU_DOTCLKIN0 input clock
> > +        - description: DU_DOTCLKIN1 input clock
> > +
> > +    clock-names:
> > +      minItems: 1
> > +      maxItems: 4
> > +      items:
> > +        - const: fck
> > +        # The LVDS encoder can use the EXTAL or DU_DOTCLKINx clocks.
> > +        # These clocks are optional.
> > +        - enum:
> > +          - extal
> > +          - dclkin.0
> > +          - dclkin.1
> > +        - enum:
> > +          - extal
> > +          - dclkin.0
> > +          - dclkin.1
> > +        - enum:
> > +          - extal
> > +          - dclkin.0
> > +          - dclkin.1
> 
> Can the duplication of the last 3 entries be avoided?
> Perhaps like in
> Documentation/devicetree/bindings/serial/renesas,scif.yaml?

I'd love to, if you can tell me how to make sure the fck entry is
mandatory. The following

  minItems: 1
  maxItems: 4
  items:
    enum:
      - fck
      - extal
      - dclkin.0
      - dclkin.1

passes the checks, but would accept

	clock-names = "extal";

which is not valid. Your
Documentation/devicetree/bindings/serial/renesas,scif.yaml bindings
suffer from the same problem :-)

> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > +    #include <dt-bindings/power/r8a7795-sysc.h>
> > +
> > +    lvds@feb90000 {
> > +        compatible = "renesas,r8a7795-lvds";
> > +        reg = <0 0xfeb90000 0 0x14>;
> 
> Examples are built with #{address,size}-cells = <1>.

Are they ? I don't get any failure from make dt_binding_check.

> > +    lvds0: lvds@feb90000 {
> > +        compatible = "renesas,r8a77990-lvds";
> > +        reg = <0 0xfeb90000 0 0x20>;
> 
> Likewise.
> 
> > +    lvds1: lvds@feb90100 {
> > +        compatible = "renesas,r8a77990-lvds";
> > +        reg = <0 0xfeb90100 0 0x20>;
> 
> Likewise.

-- 
Regards,

Laurent Pinchart
