Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3228E3FE557
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Sep 2021 00:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242638AbhIAWOl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 18:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236202AbhIAWOl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 18:14:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA23EC061575;
        Wed,  1 Sep 2021 15:13:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04F6E340;
        Thu,  2 Sep 2021 00:13:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630534422;
        bh=09bxQvWBNLZUb9b+id81hZsBnKjmRqZOhUOZz7Th8Dg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hJHOHTQLzK17Jef6QZoYnLPMw+SnzNTsso5L0cV5OBrrhVFnPjFotDyuxRe8h905Y
         1TECrmKMxxwth9d3Zsca+cSfLIaXSH9+cDz/s4cQCdl1ZCmAI9tGELHGPCR59SwbOs
         tP7dmJSeMZV90JsRRUJGnng1Sf7Ao/DCAoZ8CAL8=
Date:   Thu, 2 Sep 2021 01:13:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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
Message-ID: <YS/7BlBvEsU+rkXP@pendragon.ideasonboard.com>
References: <20210622231146.3208404-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdW8vYC3+gVCv5eG_vkX79vU8RQL-6fSJd9McetDzikzSA@mail.gmail.com>
 <22bf664e-4a28-3ae2-0106-5913a8643625@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22bf664e-4a28-3ae2-0106-5913a8643625@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Sep 01, 2021 at 11:01:11PM +0100, Kieran Bingham wrote:
> On 23/06/2021 13:53, Geert Uytterhoeven wrote:
> > On Wed, Jun 23, 2021 at 1:11 AM Kieran Bingham wrote:
> >> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>
> >> Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> >>
> >> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > Thanks for your patch!
> > 
> >> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> >> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> >> @@ -39,6 +39,7 @@ properties:
> >>        - renesas,du-r8a77980 # for R-Car V3H compatible DU
> >>        - renesas,du-r8a77990 # for R-Car E3 compatible DU
> >>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> >> +      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> >>
> >>    reg:
> >>      maxItems: 1
> >> @@ -774,6 +775,57 @@ allOf:
> >>          - reset-names
> >>          - renesas,vsps
> >>
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - renesas,du-r8a779a0
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: Functional clock for DU0
> >> +            - description: Functional clock for DU1
> >> +
> >> +        clock-names:
> >> +          items:
> >> +            - const: du.0
> >> +            - const: du.1
> > 
> > The hardware block has only a single function clock for both channels,
> > like on R-Car H1.
> 
> Indeed, but I believe both channels still need to set them, if they can
> be operated independently, the driver looks up the clock based on the
> du.%d, and so for DU1, it is simply expressed as the same clock in DT.
> 
> Is this acceptable? or is there further issues there?

Could we handle that on the driver side, like we do for H1 by not
setting RCAR_DU_FEATURE_CRTC_IRQ_CLOCK ? We would probably need to split
that flag in two, as there are two interrupts.

It's a bit annoying not knowing what the MSTP bits do exactly, we've
modelled them as gates for the functional clock, but maybe in cases like
this one the mapping isn't fully correct, I'm not sure.

> > And what about DU_DOTCLKIN?
> 
> This thread has already discussed this with Laurent, and I concur -
> There doesn't appear to be any relevant reference to DU_DOTCLKIN on the
> DU side.

-- 
Regards,

Laurent Pinchart
