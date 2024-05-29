Return-Path: <linux-renesas-soc+bounces-5655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5988D37AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 15:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87DC285D82
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 13:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0169C2ED;
	Wed, 29 May 2024 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cJ3KEzye"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8B1101E6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716989605; cv=none; b=fRPzd1YJGgXnivAGzyn1aoQhJRcUAknjwLH6rvqJPKjpDSKibj8wmVWAKj02Iz2atzVr6/YwIrWihafIaI0+djBvzHd87+pa4Z32CFBczzivGMvZsAIQReOxhAD287bWByeX7U8IGYA1RcWg8OO2GKGu3yBrD+e9aiB0edEs+L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716989605; c=relaxed/simple;
	bh=z6ZlsEJpRxBZ2JPxuY1GnhFKi9AY79jH8WoJdHabwv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQ5xAl7BRc5PX4nONWsHJdvDoM21Dg/n7uWzSpPy80dvF5R8G7QY0txPPlxNK2gBrK+jwt1XHUC6fD/O2gzO1exR3TniKsRbulrhcFnk6Kgb4GvsdncMB6Rv+nTGf5OfktMuRNjvqtRjXivd0MxvA/gCaN8HjJmJtxw+njd8fDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cJ3KEzye; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF20A4D1;
	Wed, 29 May 2024 15:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716989598;
	bh=z6ZlsEJpRxBZ2JPxuY1GnhFKi9AY79jH8WoJdHabwv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJ3KEzyev0Nufk4Dv0BccifowXIulms7AONJXFV7t7BYUbHs38NeQijnRuLCUZ+WZ
	 FAPiNnZOMxZEKIf3AU+F9bLVaSQVHIVrf45ZITeeuYGPYwOvrPMjpoaRBBYDugnSoM
	 yyTGl9r2QA+bNeqq+g/fcrCZeU2LNQ+WyeDQVLHc=
Date: Wed, 29 May 2024 16:33:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
Message-ID: <20240529133309.GO1436@pendragon.ideasonboard.com>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
 <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
 <20240529091018.GK1436@pendragon.ideasonboard.com>
 <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
 <20240529095506.GC19014@pendragon.ideasonboard.com>
 <ikryifdxh5hfbjl6c4yinyy52f2pr4pm4g4564jq4cob7ics2p@wa37stxn3sqm>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ikryifdxh5hfbjl6c4yinyy52f2pr4pm4g4564jq4cob7ics2p@wa37stxn3sqm>

On Wed, May 29, 2024 at 04:28:44PM +0300, Dmitry Baryshkov wrote:
> On Wed, May 29, 2024 at 12:55:06PM +0300, Laurent Pinchart wrote:
> > On Wed, May 29, 2024 at 12:25:56PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
> > > > Hi Dmitry,
> > > > 
> > > > On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
> > > > > > On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
> > > > > > > Add support for the drm_panic module, which displays a message on
> > > > > > > the screen when a kernel panic occurs.
> > > > > > > 
> > > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > > ---
> > > > > > > Tested on Armadillo-800-EVA.
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
> > > > > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > > > index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> > > > > > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > > > @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
> > > > > > >  	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > > > > >  };
> > > > > > >  
> > > > > > > +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> > > > > > > +	.atomic_check = shmob_drm_plane_atomic_check,
> > > > > > > +	.atomic_update = shmob_drm_plane_atomic_update,
> > > > > > > +	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > > > > > +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> > > > > > > +};
> > > > > > > +
> > > > > > >  static const struct drm_plane_funcs shmob_drm_plane_funcs = {
> > > > > > >  	.update_plane = drm_atomic_helper_update_plane,
> > > > > > >  	.disable_plane = drm_atomic_helper_disable_plane,
> > > > > > > @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> > > > > > >  
> > > > > > >  	splane->index = index;
> > > > > > >  
> > > > > > > -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> > > > > > > +	if (type == DRM_PLANE_TYPE_PRIMARY)
> > > > > > > +		drm_plane_helper_add(&splane->base,
> > > > > > > +				     &shmob_drm_primary_plane_helper_funcs);
> > > > > > > +	else
> > > > > > > +		drm_plane_helper_add(&splane->base,
> > > > > > > +				     &shmob_drm_plane_helper_funcs);
> > > > > > 
> > > > > > It's not very nice to have to provide different operations for the
> > > > > > primary and overlay planes. The documentation of
> > > > > > drm_fb_dma_get_scanout_buffer() states
> > > > > > 
> > > > > >  * @plane: DRM primary plane
> > > > > > 
> > > > > > If the intent is that only primary planes will be used to display the
> > > > > > panic message, shouldn't drm_panic_register() skip overlay planes ? It
> > > > > > would simplify drivers.
> > > > > 
> > > > > What about the drivers where all the planes are actually universal?
> > > > > In such a case the planes registered as primary can easily get replaced
> > > > > by 'overlay' planes.
> > > > 
> > > > Good point.
> > > > 
> > > > Another option, if we wanted to avoid duplicating the drm_plane_funcs,
> > > > would be to add a field to drm_plane to indicate whether the plane is
> > > > suitable for drm_panic.
> > > 
> > > ... or maybe let the driver decide. For the fully-universal-plane
> > > devices we probably want to select the planes which cover the largest
> > > part of the CRTC.
> > 
> > Are there devices where certain planes can only cover a subset of the
> > CRTC (apart from planes meant for cursors) ?
> 
> On contemporary MSM devices any plane can cover any part of the screen,
> including not having a plane that covers the full screen at all.

Ah, you meant picking the plane that is currently covering most of the
screen. I thought you were talking about devices where some planes were
restricted by the hardware to a subset of the CRTC.

I agree it would make sense to take both plane position and z-pos, as
well as visibility and other related parameters, to pick the plane that
is the most visible. Ideally this should be handled in drm_panic, not
duplicated in drivers.

> > I think that what would matter the most in the end is selecting the
> > plane that is on top of the stack, and that doesn't seem to be addressed
> > by the drm_panic infrastructure. This is getting out of scope for this
> > patch though :-)
> > 
> > > > I don't think this patch should be blocked just for this reason, but I'm
> > > > a bit bothered by duplicating the ops structure to indicate drm_panic
> > > > support.
> > > > 
> > > > > > >  
> > > > > > >  	return &splane->base;
> > > > > > >  }

-- 
Regards,

Laurent Pinchart

