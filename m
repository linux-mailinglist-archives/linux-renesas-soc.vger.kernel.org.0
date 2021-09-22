Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14819415302
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 23:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238222AbhIVVrY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 17:47:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59694 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238221AbhIVVrY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 17:47:24 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FE23F1;
        Wed, 22 Sep 2021 23:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632347152;
        bh=75gjKcF/l55W9tKhyejhtHXgZe7VCUjb2G8jIAsM/nM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BgJuCGGKkkWz0BWu6Mk8ATzDLDPjqU/xb/s+gr0aYy4Iu/fCtlxi9jcgfXyWoxacB
         vWdXACqaOFe1XvymiqFgtXUEvkrtfLpZVTrJnf8cDSpcHZl8QVQZpLtjq1mg+Mry2a
         vv/VN7FW9Ld45MWbAXga4aiBaWXGtFZgaB65P4X4=
Date:   Thu, 23 Sep 2021 00:45:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: renesas,du: Provide bindings
 for r8a779a0
Message-ID: <YUukDlMKo4+RjzUS@pendragon.ideasonboard.com>
References: <20210901233655.1602308-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdXHAfg3_VoeXUBT2-QceLR9KQ3pWjz+5=-wK1QRxK14bw@mail.gmail.com>
 <YTezLHrRt/YpOlJZ@robh.at.kernel.org>
 <CAMuHMdXGK=+W=C3c9GV8br9ZvQpAhj4ePiq7m1N8YBo1vzZjvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXGK=+W=C3c9GV8br9ZvQpAhj4ePiq7m1N8YBo1vzZjvQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello everybody,

On Tue, Sep 07, 2021 at 09:17:31PM +0200, Geert Uytterhoeven wrote:
> On Tue, Sep 7, 2021 at 8:45 PM Rob Herring wrote:
> > On Mon, Sep 06, 2021 at 10:13:07AM +0200, Geert Uytterhoeven wrote:
> > > On Thu, Sep 2, 2021 at 1:39 AM Kieran Bingham wrote:
> > > > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > >
> > > > Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> > > >
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > ---
> > > > v2:
> > > >  - Collected Laurent's tag
> > > >  - Remove clock-names requirement
> > > >  - Specify only a single clock
> > >
> > > Thanks for the update!
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
> > > > @@ -773,6 +774,55 @@ allOf:
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
> > > > +            - description: Functional clock
> > > > +
> > > > +        clock-names:
> > > > +          maxItems: 1
> > > > +          items:
> > > > +            - const: du
> > > > +
> > > > +        interrupts:
> > > > +          maxItems: 2
> > > > +
> > > > +        resets:
> > > > +          maxItems: 1
> > > > +
> > > > +        reset-names:
> > > > +          items:
> > > > +            - const: du.0
> > >
> > > This is now inconsistent with clock-names, which doesn't use a suffix.
> >
> > But it is consistent with all the other cases of 'reset-names'. The
> > problem is 'clock-names' is not consistent and should be 'du.0'.
> 
> True.

Looks fine to me. The only other SoC that has a similar shared clock
architecture is H1 (R8A7779), and we use du.0 there.

> > Ideally, the if/them schemas should not be defining the names. That
> > should be at the top level and the if/them schema just limits the number
> > of entries. That's not always possible, but I think is for clocks and
> > resets in this case.
> 
> It's a bit tricky.
> For clocks, there's usually one clock per channel, but not always.
> Plus clocks for external inputs, if present.

Yes, it's mostly the external clocks that mess things up here. Each DU
channel typically has one internal clock and one optional external
clock, but not always.

> For resets, there's one reset for a group of channels, with the number
> of channels in a group depending on the SoC family.
> And then there's the special casing for SoCs where there's a gap in
> the channel numbering...

For resets, H1 and M3-N are indeed special cases. H1 has no reset-names,
while M3-N has du.0 and du.3 due to a gap in hardware channel numbering.
All other SoCs have du.0 and optionally du.2.

> Still wondering if it would be better to have one device node per
> channel, and companion links...

The hardware design would make that too messy. There are too many
cross-channel dependencies.

-- 
Regards,

Laurent Pinchart
