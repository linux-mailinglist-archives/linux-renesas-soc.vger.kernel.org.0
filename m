Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7162123A8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 00:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfLQXLv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 18:11:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56952 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfLQXLv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 18:11:51 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0023A9BF;
        Wed, 18 Dec 2019 00:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576624309;
        bh=3pXofW/87TuK7bgMn6IvC70DbbQkK6YEsubNMznQLGw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XlT2bU5R9uYScf5C60rZXMiFTNvL0veueEEQEsL2C0J5qPnlW4QMYPUD2rvrtbYdx
         sVDWZmWGGlkNFCaXFNWAf5E4o5H+xV+hPpnJeD9hwKYq0gSOU3Coz+24SeH6ygGU0r
         t0CECOV2oF67iTOZK8QBSWLK5+Imj6puIZ6ofsyw=
Date:   Wed, 18 Dec 2019 01:11:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
Message-ID: <20191217231138.GF4874@pendragon.ideasonboard.com>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
 <20190913090359.GC29992@pendragon.ideasonboard.com>
 <2eeacacc-f190-4ba8-32bc-b4103b41db46@ideasonboard.com>
 <20191213004812.GA27328@pendragon.ideasonboard.com>
 <19cb3d1c-6910-4bec-13bb-adb875ddd077@ideasonboard.com>
 <CAMuHMdWuGxy8WH9ts7iKPsRW0fUjQ3c7jdDOb9KpViwcvXC14A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWuGxy8WH9ts7iKPsRW0fUjQ3c7jdDOb9KpViwcvXC14A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 16, 2019 at 11:37:00AM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 16, 2019 at 10:47 AM Kieran Bingham wrote:
> > On 13/12/2019 00:48, Laurent Pinchart wrote:
> >> On Mon, Dec 09, 2019 at 12:41:07PM +0000, Kieran Bingham wrote:
> >>> On 13/09/2019 10:03, Laurent Pinchart wrote:
> >>>> On Fri, Sep 13, 2019 at 10:21:29AM +0200, Simon Horman wrote:
> >>>>> On Thu, Sep 12, 2019 at 01:00:41PM +0300, Sergei Shtylyov wrote:
> >>>>>> On 11.09.2019 22:25, Kieran Bingham wrote:
> >>>>>>
> >>>>>>> Add direct support for the r8a77980 (V3H).
> >>>>>>>
> >>>>>>> The V3H shares a common, compatible configuration with the r8a77970
> >>>>>>> (V3M) so that device info structure is reused.
> >>>>>>
> >>>>>>    Do we really need to add yet another compatible in this case?
> >>>>>> I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
> >>>>>> a patch like this one didn't get posted by me.
> >>>>>
> >>>>> The reason for having per-SoC compat strings is that the IP blocks
> >>>>> are not versioned and while we can observe that there are similarities
> >>>>> between, f.e. the DU on the r8a77970 and r8a77980, we can't be certain that
> >>>>> differences may not emerge at some point. By having per-SoC compat strings
> >>>>> we have the flexibility for the driver to address any such differences as
> >>>>> the need arises.
> >>>>>
> >>>>> My recollection is that this scheme has been adopted for non-versioned
> >>>>> Renesas IP blocks since June 2015 and uses of this scheme well before that.
> >>>>
> >>>> Sure, but we could use
> >>>>
> >>>>     compatible = "renesas,du-r8a77980", "renesas,du-r8a77970";
> >
> > We already do in arch/arm64/boot/dts/renesas/r8a77980.dtsi.
> >
> > However that is the *only* non r8a77980 reference in the file so it,
> > itself looks *very* much out of place.
> >
> >
> > Furthermore, the main purpose of this patch is that we clearly document
> > the driver as supporting the r8a77980 in the bindings (No mention that
> > you must use the ..970 binding), yet in actual fact - the driver could
> > not currently support loading a device with the following compatible:
> >
> >         compatible = "renesas,du-r8a77980";
> >
> >
> >>>> in DT without updating the driver. If the r8a77980 turns out to be
> >>>> different, we'll then update the driver without a need to modify DT. I'm
> >>>> fine either way, so
> >>>>
> >>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>
> >>> Thanks,
> >>>
> >>> This patch has an RB tag from you, and Simon, but alas I don't believe
> >>> it has been picked up in your drm/du/next branch.
> >>>
> >>> Is this patch acceptable? Or do I need to repost?
> >>
> >> Could you just confirm I should apply this patch, and not go for the
> >> alternative proposal above ?
> >
> > I believe the alternative proposal above is what we have today isn't it?
> >
> >
> > Yes, I do believe we should apply this patch.
> 
> +1.
> 
> I'm waiting for the driver part to go upstream, so I can apply the DTS patch.
> Note that this will lead to a messy situation in LTS, as the DTS patch will
> likely be backported, so the driver part must be backported, too.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> > I'm going to assume you haven't read the other arguments on this thread
> > so I'll paste them here:
> 
> Thanks for recollecting! ;-)

-- 
Regards,

Laurent Pinchart
