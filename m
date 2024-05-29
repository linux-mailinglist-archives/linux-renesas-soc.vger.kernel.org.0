Return-Path: <linux-renesas-soc+bounces-5641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1A58D33BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 11:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 838E2B21AD4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 09:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB37416A360;
	Wed, 29 May 2024 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ty0013VC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684CC16729D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716976523; cv=none; b=i4rEBy7otK2F1qbCmZ9OE7noNYhHR7ud5SRKcqTPlIofSvM/akiQ5Hn2CKJYU9griBh7ANXU/qQ+0erzfVAJ72PqV6gp0fW/IejxsrlQVEwFN2Ccyn8RxwXFP1VgyA05od5UeV08O0KHskERzIiAnH3YWd0ivbIYwK1z2jQolr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716976523; c=relaxed/simple;
	bh=CZddNhTG4PTX5QH2SWfe7je4knivXIh/sL6zBPQ2VfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vnch2CASZgHdfTlI9+8TAsPwuzEW+Y0THjA5GE3HRHYezGTSXVMZ/usTu7yy2JKvxxlwUqz/fw9mlKyvPKtuXNOaibsNHkHkHaZzc5VEjqV0KhETMx+sABsmW5XI5zc9BjP2e02grYEOykT9bpkavdCiDWtiqC2pfWLOPdgEXCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ty0013VC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 496D24AB;
	Wed, 29 May 2024 11:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716976516;
	bh=CZddNhTG4PTX5QH2SWfe7je4knivXIh/sL6zBPQ2VfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ty0013VCEBILlUifURaaerifEgaWGl5TESGJtCqzkcBuMmxYVJPz7/DVHo7vksgx9
	 Hc1lWmu79LfEPS1uyhespcZ3scRbsPKMopc0RLU8pF5BDbIdKEvbpg1JcPwTH0lU/l
	 p6qHKcZloYcWjUBFY/6WhQpkqKF0qY+oTxFZHI2Q=
Date: Wed, 29 May 2024 12:55:06 +0300
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
Message-ID: <20240529095506.GC19014@pendragon.ideasonboard.com>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
 <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
 <20240529091018.GK1436@pendragon.ideasonboard.com>
 <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>

On Wed, May 29, 2024 at 12:25:56PM +0300, Dmitry Baryshkov wrote:
> On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
> > Hi Dmitry,
> > 
> > On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
> > > On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
> > > > On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
> > > > > Add support for the drm_panic module, which displays a message on
> > > > > the screen when a kernel panic occurs.
> > > > > 
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > > Tested on Armadillo-800-EVA.
> > > > > ---
> > > > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
> > > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> > > > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
> > > > >  	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > > >  };
> > > > >  
> > > > > +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> > > > > +	.atomic_check = shmob_drm_plane_atomic_check,
> > > > > +	.atomic_update = shmob_drm_plane_atomic_update,
> > > > > +	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > > > +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> > > > > +};
> > > > > +
> > > > >  static const struct drm_plane_funcs shmob_drm_plane_funcs = {
> > > > >  	.update_plane = drm_atomic_helper_update_plane,
> > > > >  	.disable_plane = drm_atomic_helper_disable_plane,
> > > > > @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> > > > >  
> > > > >  	splane->index = index;
> > > > >  
> > > > > -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> > > > > +	if (type == DRM_PLANE_TYPE_PRIMARY)
> > > > > +		drm_plane_helper_add(&splane->base,
> > > > > +				     &shmob_drm_primary_plane_helper_funcs);
> > > > > +	else
> > > > > +		drm_plane_helper_add(&splane->base,
> > > > > +				     &shmob_drm_plane_helper_funcs);
> > > > 
> > > > It's not very nice to have to provide different operations for the
> > > > primary and overlay planes. The documentation of
> > > > drm_fb_dma_get_scanout_buffer() states
> > > > 
> > > >  * @plane: DRM primary plane
> > > > 
> > > > If the intent is that only primary planes will be used to display the
> > > > panic message, shouldn't drm_panic_register() skip overlay planes ? It
> > > > would simplify drivers.
> > > 
> > > What about the drivers where all the planes are actually universal?
> > > In such a case the planes registered as primary can easily get replaced
> > > by 'overlay' planes.
> > 
> > Good point.
> > 
> > Another option, if we wanted to avoid duplicating the drm_plane_funcs,
> > would be to add a field to drm_plane to indicate whether the plane is
> > suitable for drm_panic.
> 
> ... or maybe let the driver decide. For the fully-universal-plane
> devices we probably want to select the planes which cover the largest
> part of the CRTC.

Are there devices where certain planes can only cover a subset of the
CRTC (apart from planes meant for cursors) ?

I think that what would matter the most in the end is selecting the
plane that is on top of the stack, and that doesn't seem to be addressed
by the drm_panic infrastructure. This is getting out of scope for this
patch though :-)

> > I don't think this patch should be blocked just for this reason, but I'm
> > a bit bothered by duplicating the ops structure to indicate drm_panic
> > support.
> > 
> > > > >  
> > > > >  	return &splane->base;
> > > > >  }

-- 
Regards,

Laurent Pinchart

