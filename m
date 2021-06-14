Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282F73A6E35
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 20:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbhFNS1V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 14:27:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41018 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233424AbhFNS1U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 14:27:20 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7539DA59;
        Mon, 14 Jun 2021 20:25:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623695116;
        bh=GfjoQtpKAMQHpK49iqwcirXMzOaoB4GgRBvGGrc/MEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ri9n5RjkY2HvofLPGh1W161JEGOJXzcd/sa890FlufwJENGi/kOCLi3tsq61swR+p
         PBp7fpPn8gxI/kkbgJCv0Cjv+6blQ66UpIir/5lgGlqLIM6XvxqlAGAEJ28TpAPGV1
         nrixDA9aSGXMJFY+9ZI0Y/D34///NsP9zt4G6bVs=
Date:   Mon, 14 Jun 2021 21:24:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 01/14] dt-bindings: arm: renesas: Document R-Car H3e-2G
 and M3e-2G SoCs and boards
Message-ID: <YMee+GAOoKB2rlwK@pendragon.ideasonboard.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <f79841c1881f8b9a2c10fadb3d3ad6cb5fccc6a5.1623315732.git.geert+renesas@glider.be>
 <YMVbupt4pqdl2FOc@pendragon.ideasonboard.com>
 <CAMuHMdXvB7dfcoCXOuE_oTCxaBqQyA8RVGm7SVy8iTmccvG95A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXvB7dfcoCXOuE_oTCxaBqQyA8RVGm7SVy8iTmccvG95A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Jun 14, 2021 at 01:25:49PM +0200, Geert Uytterhoeven wrote:
> On Sun, Jun 13, 2021 at 3:13 AM Laurent Pinchart wrote:
> > On Thu, Jun 10, 2021 at 11:37:14AM +0200, Geert Uytterhoeven wrote:
> > > Document the compatible values for the R-Car H3e-2G (R8A779M1) and
> > > M3e-2G (R8A779M3) SoCs.  These are different gradings of the R-Car H3
> > > ES3.0 (R8A77951) and M3-W+ (R8A77961) SoCs.
> > >
> > > All R-Car Gen3e on-SoC devices are identical to the devices on the
> > > corresponding R-Car Gen3 SoCs, and thus just use the compatible values
> > > for the latter.  The root compatible properties do gain an additional
> > > value, to sort out integration issues if they ever arise.
> > >
> > > Document the use of these SoCs on the Salvator-XS and ULCB (with and
> > > without Kingfisher) development boards.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> 
> > I however wonder if we haven't messed up the board compatible strings
> > somehow (unrelated to this patch). Aren't compatible strings supposed to
> > be ordered from most specific to most generic, with a more specific
> > compatible string being a strict subset of a more generic string ?
> > Looking at, for example,
> >
> >         compatible = "renesas,salvator-xs", "renesas,r8a779m1", "renesas,r8a7795";
> >
> > the rule is upheld by renesas,r8a779m1 being a subset of the more
> > generic renesas,r8a7795, but that's not the case for
> > renesas,salvator-xs.
> 
> That's a very interesting comment.  Originally, we had lists like:
> 
>     compatible = "renesas,koelsch", "renesas,r8a7791";
> 
> with the Koelsch board indeed being a specialization of an R-Car
> M2-W-based system. Later, we reused that system for the Salvator-X
> board with an R-Car H3 SiP:
> 
>     compatible = "renesas,salvator-x", "renesas,r8a7795";
> 
> That scheme became "broken" with the introduction of the R-Car M3-W
> SiP, which was also mounted on a Salvator-X board, leading to:
> 
>     compatible = "renesas,salvator-x", "renesas,r8a7796";
> 
> Note that we did have a similar case for R-Car M2-W and R-Car M2-N on
> the Koelsch resp. Gose boards: from the schematics (I haven't seen
> a Gose), it looks identical to Koelsch, with parts not supported by
> R-Car M2-N (like the second SDRAM bank) marked "Do not stuff".
> But in this case the boards were assigned different names, thus
> leading to different compatible values.
> 
> With Salvator-X(S), it was easier to support multiple SoCs, as they
> are mounted on SiPs, with differences like the different number of
> memory channels hidden in the SiP, and handled at a different level
> (these days memory layout information flows from ATF to U-Boot to
> the DTB passed to the kernel).
> 
> Would you feel more comfortable if we had introduced more
> board-specific compatible values, like "renesas,r8a7796-salvator-x",
> and had used
> 
>     compatible = "renesas,r8a7795-salvator-x", "renesas,salvator-x",
> "renesas,r8a7795";
> 
> or
> 
>     compatible = "renesas,r8a7795-salvator-x", "renesas,r8a7795";
> 
> ?

I think I would prefer that, yes. The idea of specifying separate board
and an SoC identifiers is interesting and, I believe, useful, but it
seems to be a bit of an abuse of what the "compatible" property is meant
for.

All of this will probably never be handled by code not specific to
Renesas, so it's probably a theoretical issue only.

> If the need ever arises, Linux can still identify the exact combination
> by checking for both the board- and the SoC-specific values.
> So far we didn't have that need for Salvator-X(S) yet (we do have
> board-specific checks in
> arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c).
> 
> > > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > > @@ -238,17 +238,29 @@ properties:
> > >            - const: renesas,r8a77961
> > >
> > >        - description: Kingfisher (SBEV-RCAR-KF-M03)
> > > -        items:
> > > -          - const: shimafuji,kingfisher
> > > -          - enum:
> > > -              - renesas,h3ulcb
> > > -              - renesas,m3ulcb
> > > -              - renesas,m3nulcb
> > > -          - enum:
> > > -              - renesas,r8a7795
> > > -              - renesas,r8a7796
> > > -              - renesas,r8a77961
> > > -              - renesas,r8a77965
> > > +        oneOf:
> > > +          - items:
> > > +              - const: shimafuji,kingfisher
> > > +              - enum:
> > > +                  - renesas,h3ulcb
> > > +                  - renesas,m3ulcb
> > > +                  - renesas,m3nulcb
> > > +              - enum:
> > > +                  - renesas,r8a7795
> > > +                  - renesas,r8a7796
> > > +                  - renesas,r8a77961
> > > +                  - renesas,r8a77965
> > > +          - items:
> > > +              - const: shimafuji,kingfisher
> > > +              - enum:
> > > +                  - renesas,h3ulcb
> > > +                  - renesas,m3ulcb
> > > +              - enum:
> > > +                  - renesas,r8a779m1
> > > +                  - renesas,r8a779m3
> > > +              - enum:
> > > +                  - renesas,r8a7795
> > > +                  - renesas,r8a77961
> > >
> > >        - description: R-Car M3-N (R8A77965)
> > >          items:
> > > @@ -296,6 +308,22 @@ properties:
> > >            - const: renesas,falcon-cpu
> > >            - const: renesas,r8a779a0
> > >
> > > +      - description: R-Car H3e-2G (R8A779M1)
> > > +        items:
> > > +          - enum:
> > > +              - renesas,h3ulcb      # H3ULCB (R-Car Starter Kit Premier)
> > > +              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
> > > +          - const: renesas,r8a779m1
> > > +          - const: renesas,r8a7795
> > > +
> > > +      - description: R-Car M3e-2G (R8A779M3)
> > > +        items:
> > > +          - enum:
> > > +              - renesas,m3ulcb      # M3ULCB (R-Car Starter Kit Pro)
> > > +              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
> > > +          - const: renesas,r8a779m3
> > > +          - const: renesas,r8a77961
> > > +
> > >        - description: RZ/N1D (R9A06G032)
> > >          items:
> > >            - enum:

-- 
Regards,

Laurent Pinchart
