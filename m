Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0CDB9FCFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 10:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfH1I24 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 04:28:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34870 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfH1I2z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 04:28:55 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62F74310;
        Wed, 28 Aug 2019 10:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566980933;
        bh=yHqVMSWrsJvlNfBnMTE1NjxeNpyXRWkgKkXyuwYbZDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vmsSxbrA2kZqrww2uiRS3uDRX/7GAnSU0FPjyQmdGsgW0H8Wv6oM+JS6YMXe9mBMG
         Lp2TVbmaR343IJXXXDq6m6MwnqN0YNI7c9H1PvDT52FhYLEQakJxYj2Anti4pSMXYG
         yQqtESmSKJVDQrFps1jkMaToiaIYNz8bdtUtHvMk=
Date:   Wed, 28 Aug 2019 11:28:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>, Ulrich Hecht <uli@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 02/14] dt-bindings: display, renesas,du: Document cmms
 property
Message-ID: <20190828082846.GA27842@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-3-jacopo+renesas@jmondi.org>
 <20190827202945.GA3488@bogus>
 <CAMuHMdUP1kZF4z=NkAb5LCV74dyCMw9pZACMYjOTFE=r2vvR3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUP1kZF4z=NkAb5LCV74dyCMw9pZACMYjOTFE=r2vvR3A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 28, 2019 at 09:32:23AM +0200, Geert Uytterhoeven wrote:
> On Tue, Aug 27, 2019 at 10:29 PM Rob Herring <robh@kernel.org> wrote:
> > On Sun, Aug 25, 2019 at 03:51:42PM +0200, Jacopo Mondi wrote:
> > > Document the newly added 'cmms' property which accepts a list of phandle
> > > and channel index pairs that point to the CMM units available for each
> > > Display Unit output video channel.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> > > index c97dfacad281..c2265e2a1af2 100644
> > > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > > @@ -45,6 +45,10 @@ Required Properties:
> > >      instance that serves the DU channel, and the channel index identifies the
> > >      LIF instance in that VSP.
> > >
> > > +  - cmms: A list of phandles to the CMM instances present in the SoC, one
> > > +    for each available DU channel. The property shall not be specified for
> > > +    SoCs that do not provide any CMM (such as V3M and V3H).
> >
> > renesas,cmms
> 
> So I guess we really wanted to have the prefix for the vsps property, too?

Yes, we should have :-( My bad.

-- 
Regards,

Laurent Pinchart
