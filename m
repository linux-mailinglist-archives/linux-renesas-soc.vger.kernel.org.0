Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E96B1A51
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2019 10:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387841AbfIMI54 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Sep 2019 04:57:56 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:44260 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387655AbfIMI54 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Sep 2019 04:57:56 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2F96425B7B0;
        Fri, 13 Sep 2019 18:57:54 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 268F3940513; Fri, 13 Sep 2019 10:57:52 +0200 (CEST)
Date:   Fri, 13 Sep 2019 10:57:52 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
Message-ID: <20190913085751.j743ry4ygtoyb7n6@verge.net.au>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
 <CAMuHMdU5SgQhnfoeTc1Ur+dhjrUXkEfpk+9VRQR2EKxLzEnmGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU5SgQhnfoeTc1Ur+dhjrUXkEfpk+9VRQR2EKxLzEnmGg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 13, 2019 at 10:30:45AM +0200, Geert Uytterhoeven wrote:
> On Fri, Sep 13, 2019 at 10:21 AM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Sep 12, 2019 at 01:00:41PM +0300, Sergei Shtylyov wrote:
> > > On 11.09.2019 22:25, Kieran Bingham wrote:
> > > > Add direct support for the r8a77980 (V3H).
> > > > The V3H shares a common, compatible configuration with the r8a77970
> > > > (V3M) so that device info structure is reused.
> > >
> > >    Do we really need to add yet another compatible in this case?
> > > I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
> > > a patch like this one didn't get posted by me.
> >
> > The reason for having per-SoC compat strings is that the IP blocks
> > are not versioned and while we can observe that there are similarities
> > between, f.e. the DU on the r8a77970 and r8a77980, we can't be certain that
> > differences may not emerge at some point. By having per-SoC compat strings
> > we have the flexibility for the driver to address any such differences as
> > the need arises.
> 
> Thanks, that is the generic reason, applicable to all IP blocks without
> version registers.
> 
> For the Display Unit, there are documented differences (e.g. number and type
> of ports), so we definitely need it there.

Ack.

> > My recollection is that this scheme has been adopted for non-versioned
> > Renesas IP blocks since June 2015 and uses of this scheme well before that.
> >
> > > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
