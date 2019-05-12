Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 136901ABC3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 May 2019 12:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfELKWr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 May 2019 06:22:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54472 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfELKWr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 May 2019 06:22:47 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 988EF2B6;
        Sun, 12 May 2019 12:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557656564;
        bh=DDR03bYg2ePZF7d5mgZhH20vPXhFxdLu/MQ9njF3CQQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ubY5jB/68AMS9OBdxqPuH2LdmYqEgpccxeh4DGF/Ps1H0SqQFd58RbwOfcM6pwTMI
         LgAvyNImm36i4hXultF85+27UlkRBIr9N6KytTIPPpZesoVBVdKyy2I2LN/aWUlOzR
         PbLKAaJ0SjZvG7Bcb7lZbCSOcSTXYodwgx6mSDoc=
Date:   Sun, 12 May 2019 13:22:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
Message-ID: <20190512102228.GB4960@pendragon.ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-3-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXtg3Kv+zt6kS9tViu93AjaHsOrSSotemt8T=8XVJcdyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXtg3Kv+zt6kS9tViu93AjaHsOrSSotemt8T=8XVJcdyA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Sun, May 12, 2019 at 10:58:54AM +0200, Geert Uytterhoeven wrote:
> On Sat, May 11, 2019 at 11:07 PM Laurent Pinchart wrote:
> > The THC63LVD1024 LVDS decoder can operate in two modes, single-link or
> > dual-link. In dual-link mode both input ports are used to carry even-
> > and odd-numbered pixels separately. Document this in the DT bindings,
> > along with the related rules governing port and usage.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../bindings/display/bridge/thine,thc63lvd1024.txt          | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > index 37f0c04d5a28..d17d1e5820d7 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > @@ -28,6 +28,12 @@ Optional video port nodes:
> >  - port@1: Second LVDS input port
> >  - port@3: Second digital CMOS/TTL parallel output
> >
> > +The device can operate in single-link mode or dual-link mode. In single-link
> > +mode, all pixels are received on port@0, and port@1 shall not contain any
> > +endpoint. In dual-link mode, even-numbered pixels are received on port@0 and
> > +odd-numbered pixels on port@1, and both port@0 and port@1 shall contain
> > +endpoints.
> 
> This describes single/dual input.
> Does single/dual output need to be described, too?

Jacopo asked the same question on v1 :-) Dual-output should be described
as well, but as I have no hardware setup where to test that, I decided
to leave it out of the DT bindings to start with, as it's generally a
bad idea to specify untested DT bindings (as in having no end-to-end
implementation). I don't think it will be a big deal though, there is
already a port for the second output, it should just be a matter of
connecting it.

> BTW, I see the second input/output set is optional, wile the first set
> is required.  Could it happen the hardware is wired for the second
> set only?

Not to my knowledge. In dual-in, dual-out the two input/output pairs are
not independent, the two inputs are used together to create a higher
bandwidth link, and the odd- and even-pixels are then sent to separate
routes.

-- 
Regards,

Laurent Pinchart
