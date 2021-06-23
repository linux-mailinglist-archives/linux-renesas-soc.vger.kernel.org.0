Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBA93B1AE5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 15:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhFWNRc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 09:17:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38832 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbhFWNRb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 09:17:31 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDAA69AA;
        Wed, 23 Jun 2021 15:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624454112;
        bh=GVMK38SrPGTYbsOKUOPXSrEWY3ARN0rb2JGcAOPGBtQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sd76KXBNzmD/7FV+Gt4wR9mi4Lxk/zMoruxdN9MF5tC8iXo8ltWBUF35E1592qlms
         jN8Na4J3N87rM+phQYcEEJTQ1uGI1z0adgrZhbaygPV3/NXk9Co5H+OQZsMDv3lMJ0
         XmoXHC9TPgp4lAqcG56vFOC6WVe7hFc/7DIUThxE=
Date:   Wed, 23 Jun 2021 16:14:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Provide bindings for
 r8a779a0
Message-ID: <YNMzwtTqhfOzdJ56@pendragon.ideasonboard.com>
References: <20210622231146.3208404-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdW8vYC3+gVCv5eG_vkX79vU8RQL-6fSJd9McetDzikzSA@mail.gmail.com>
 <YNMv2KSjbwX5aAK2@pendragon.ideasonboard.com>
 <CAMuHMdXJTCyfMX3nN6pbAHeqqf5OCqJR4+7GJ=71+o1iKRrHhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXJTCyfMX3nN6pbAHeqqf5OCqJR4+7GJ=71+o1iKRrHhg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Jun 23, 2021 at 03:09:06PM +0200, Geert Uytterhoeven wrote:
> On Wed, Jun 23, 2021 at 2:58 PM Laurent Pinchart wrote:
> > On Wed, Jun 23, 2021 at 02:53:33PM +0200, Geert Uytterhoeven wrote:
> > > On Wed, Jun 23, 2021 at 1:11 AM Kieran Bingham wrote:
> > > > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > >
> > > > Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> > > >
> > > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > > @@ -39,6 +39,7 @@ properties:
> > > >        - renesas,du-r8a77980 # for R-Car V3H compatible DU
> > > >        - renesas,du-r8a77990 # for R-Car E3 compatible DU
> > > >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> > > > +      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> > > >
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -774,6 +775,57 @@ allOf:
> > > >          - reset-names
> > > >          - renesas,vsps
> > > >
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - renesas,du-r8a779a0
> > > > +    then:
> > > > +      properties:
> > > > +        clocks:
> > > > +          items:
> > > > +            - description: Functional clock for DU0
> > > > +            - description: Functional clock for DU1
> > > > +
> > > > +        clock-names:
> > > > +          items:
> > > > +            - const: du.0
> > > > +            - const: du.1
> > >
> > > The hardware block has only a single function clock for both channels,
> > > like on R-Car H1.
> > >
> > > And what about DU_DOTCLKIN?
> >
> > As far as I can tell, there's no DU_DOTCLKIN in V3U.
> 
> See Table 6.13 of the Hardware User's Manual, pin IPC_CLKIN.

Maybe that's incorrect ? There's no mention of DU_DOTCLKIN anywhere
else, and the DU bits that allow selection of the input clocks list the
value documented for Gen3 SoCs as selected DU_DOTCLKIN as reserved.

> Note that the register bits to configure it are present in
> drivers/pinctrl/renesas/pfc-r8a779a0.c, but the actual pin group is
> missing.

-- 
Regards,

Laurent Pinchart
