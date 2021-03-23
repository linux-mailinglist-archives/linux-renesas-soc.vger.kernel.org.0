Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46007346DB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 00:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbhCWXDl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 19:03:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45128 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234127AbhCWXDh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 19:03:37 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 290D2510;
        Wed, 24 Mar 2021 00:03:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616540616;
        bh=iUuZGWZxmpZLF4RuxEGDzAwOuCZh48VN9LgUyEIq51A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Oi5pPXPd3K8zXaayOxHal03kZqGh5aNDKmTtvxt7KwcWcpsLdMbaTgWvib1W7YeCT
         F9Db0FNWzFNl/hKVf9r2lis1rAdQK8CnMdcXy6g7DXWWekrIXS3S+hokDI98Xm8Doz
         bTJMtDS8/PBLfr9Af4FMxVaW/kZeEugMdWwG8QL4=
Date:   Wed, 24 Mar 2021 01:02:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [RFC PATCH 03/11] drm/bridge: ti-sn65dsi86: Unregister AUX
 adapter in remove()
Message-ID: <YFpznvA/m3KfEEqz@pendragon.ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=W-+aS25wtnSmF8tWSDHTdNCjbFj0x02-1iqZ2p5qYzyA@mail.gmail.com>
 <YFpgfBW+U5R6urk0@pendragon.ideasonboard.com>
 <CAD=FV=W76DXDsy_Ug5cQUVUfz18MzYp92hPKOiRm3Hf1jknPgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=W76DXDsy_Ug5cQUVUfz18MzYp92hPKOiRm3Hf1jknPgQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Doug,

On Tue, Mar 23, 2021 at 03:55:05PM -0700, Doug Anderson wrote:
> On Tue, Mar 23, 2021 at 2:42 PM Laurent Pinchart wrote:
> > On Tue, Mar 23, 2021 at 02:08:42PM -0700, Doug Anderson wrote:
> > > On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> > > >
> > > > The AUX adapter registered in probe() need to be unregistered in
> > > > remove(). Do so.
> > > >
> > > > Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > index da78a12e58b5..c45420a50e73 100644
> > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > @@ -1307,6 +1307,9 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
> > > >                 return -EINVAL;
> > > >
> > > >         kfree(pdata->edid);
> > > > +
> > > > +       drm_dp_aux_unregister(&pdata->aux);
> > > > +
> > > >         ti_sn_debugfs_remove(pdata);
> > > >
> > > >         of_node_put(pdata->host_node);
> > >
> > > Good catch. One question, though. I know DRM sometimes has different
> > > conventions than the rest of the kernel, but I always look for the
> > > "remove" to be backwards of probe. That means that your code (and
> > > probably most of the remove function) should come _after_ the
> > > drm_bridge_remove(), right?  ...since drm_bridge_add() was the last
> > > thing in probe then drm_bridge_remove() should be the first thing in
> > > remove?
> >
> > I agree in theory, yes. However, in practice, if you remove a bridge
> > that is currently in use, all hell will break lose. And if the bridge
> > isn't being used, it makes no difference. Still, it's worth changing the
> > order of operations to move drm_bridge_remove() first, as it won't hurt
> > in any case and is logically better. It's not an issue introduced by
> > this series though, so how how about it on top, or in parallel ?
> 
> Sure, it can be a separate patch. I'd kinda prefer it be a patch
> _before_ ${SUBJECT} patch, though. Specifically it's harder for me to
> reason about whether your new function call is in the right place and
> won't cause any problems with the order being all jumbled. If we fix
> the order first then it's easy to reason about your patch.
> 
> > You can
> > even submit a patch if you want :-)
> 
> Happy to post it up if it won't cause more confusion w/ you posting
> your next version and trying to figure out what to base it on (since
> it will definitely conflict with your series).

I'll need quite a bit of time before v2, as I'd like to test it, and
that requires finishing support for the DSI bridge and the display
controller :-) Please feel free to post a patch if you have time, I
think it could get merged in drm-misc quite quickly.

-- 
Regards,

Laurent Pinchart
