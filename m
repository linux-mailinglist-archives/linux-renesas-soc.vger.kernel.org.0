Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDCB744308E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Nov 2021 15:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhKBOj3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Nov 2021 10:39:29 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:53977 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhKBOj2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 10:39:28 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 206041C000A;
        Tue,  2 Nov 2021 14:36:48 +0000 (UTC)
Date:   Tue, 2 Nov 2021 15:37:40 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        sakari.ailus@linux.intel.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 06/13] media: subdev: Add for_each_active_route() macro
Message-ID: <20211102143740.bu5kfmcyj5opkuxg@uno.localdomain>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-7-jacopo+renesas@jmondi.org>
 <8c16cd01-48c6-ecc8-4437-e597559f492f@ideasonboard.com>
 <20211028090331.sccuthk5h3tw22f3@uno.localdomain>
 <b029f3ad-1790-d316-dfb0-0e64e161fc2c@ideasonboard.com>
 <YXp5BKABg0lb7EZk@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YXp5BKABg0lb7EZk@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Thu, Oct 28, 2021 at 01:18:44PM +0300, Laurent Pinchart wrote:
> On Thu, Oct 28, 2021 at 01:17:10PM +0300, Tomi Valkeinen wrote:
> > On 28/10/2021 12:03, Jacopo Mondi wrote:
> > > On Thu, Oct 28, 2021 at 11:32:12AM +0300, Tomi Valkeinen wrote:
> > >> On 17/10/2021 21:24, Jacopo Mondi wrote:
> > >>> Add a for_each_active_route() macro to replace the repeated pattern
> > >>> of iterating on the active routes of a routing table.
> > >>>
> > >>> Replace the existing occurrences of such pattern in the codebase.
> > >>>
> > >>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >>> ---
> > >>>    drivers/media/i2c/ds90ub913.c             |  8 ++------
> > >>>    drivers/media/i2c/ds90ub953.c             |  7 ++-----
> > >>>    drivers/media/i2c/ds90ub960.c             |  8 ++------
> > >>>    drivers/media/i2c/max9286.c               | 10 ++--------
> > >>>    drivers/media/platform/ti-vpe/cal-video.c |  9 ++-------
> > >>>    drivers/media/v4l2-core/v4l2-subdev.c     | 18 ++++++++++++++++++
> > >>>    include/media/v4l2-subdev.h               | 11 +++++++++++
> > >>>    7 files changed, 39 insertions(+), 32 deletions(-)
> > >>>
> > >>
> > >> ...
> > >>
> > >>> +struct v4l2_subdev_route *next_active_route(const struct v4l2_subdev_krouting *routing,
> > >>> +					    struct v4l2_subdev_route *route)
> > >>> +{
> > >>> +	if (route)
> > >>> +		++route;
> > >>> +	else
> > >>> +		route = &routing->routes[0];
> > >>> +
> > >>> +	for (; route < routing->routes + routing->num_routes; ++route) {
> > >>> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> > >>> +			continue;
> > >>> +
> > >>> +		return route;
> > >>> +	}
> > >>> +
> > >>> +	return NULL;
> > >>> +}
> > >>
> > >> Also, this must be exported. I'll add that. And probably better to have a
> > >
> > > Does it ? I would rather have it in the header, as this is only
> > > meant to be called by the for_each_active_route() macro, and not by
> > > other users. However it seemed to be rather long to be defined as a
> > > static inline function in the header, so I opted to move it to the c
> > > file.
> >
> > Yes, static inline is an option. The function is a bit long-ish, though,
> > as you mention.
> >
> > > To be honest, it's not clear to me what happens if a module calls the
> > > for_each_active_route() macro that calls this non-exported function,
> > > so you're probably correct.
> >
> > The module cannot be loaded if it refers to a non-exported symbol.
> >

Yeah, dumb me, the macro will just expand and the symbol won't be
available.

> > > However exporting the symbol makes it available globally, but I guess
> >
> > Yes, thus the prefix is a good thing =).
> >
> > > that's not a big deal if it's clearly documented that drivers shall
> > > not call this directly (or maybe we want it to be available globally,
> > > why not...)
> >
> > I'll see how long helper functions similar macros have as inline in
> > other parts of the kernel. Maybe static inline is fine.
> >
> > But if not, we'll just need to document the helper function. I don't see
> > why we should say it shouldn't be called directly, though. But if that
> > is the case, we can prefix it with __.
>
> The __ prefix is exactly what I was going to propose.
>

Ack to the __ prefix and export the symbol from the .c file if it's
deemed too long to live in the header!

Thanks
   j

> --
> Regards,
>
> Laurent Pinchart
