Return-Path: <linux-renesas-soc+bounces-5620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BED8D329F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 11:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 590F31C2334B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 09:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31796169AD8;
	Wed, 29 May 2024 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MudG43KL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90494169AD7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 09:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716973834; cv=none; b=VgB75zYcL6AI15Cpm8N1nnAP2jnUup+gEYv9546zUvUGKGWopr9X6n6KB8VAseQGf+R/Gc2z/APNPFOrG3Q8fmCW8DFjHF70pSZCNbuBtv1lu2RY8ZHzQHD1yPBBmUpbxCB8LiAOiyPR1QE/QEiPgUWIgyhgvlDkP49EWa/Q8XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716973834; c=relaxed/simple;
	bh=IEUi73jCmIHopcI+PIslSxJcfOa39sAY/95W5YG3we8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ax6UUuCzTstPIN6j7otEcHePnSEGvOw15o3WgDydXGp5CRrFSEj6eTTQhusi1OvX1Ngtw2uPGWI2bSB/hcJfj9xqZP8Fhlb7BY7qX5GSqAahiFjneVvDknJxsbebbLjYHEtTRd2Gvyd0rk2+aB41D2L182Q2E9OUyIceot9FhHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MudG43KL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDFD59CA;
	Wed, 29 May 2024 11:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716973827;
	bh=IEUi73jCmIHopcI+PIslSxJcfOa39sAY/95W5YG3we8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MudG43KLzRTZLbdMpqyA/KlvCsX3uMrEIF0Oph6sEcVNXQG+y6s0kACHcUi1rNPPT
	 jucqC5nxy7F1k0w+IA6CPMz4pfd2QKZ0LVl7b6SQ6w6r1zS3xvAxESxluz0NewFFQJ
	 L3FtvU6SJj8LA7/F/uvQYtb7oZRxb/+6ZRLJU7sI=
Date: Wed, 29 May 2024 12:10:18 +0300
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
Message-ID: <20240529091018.GK1436@pendragon.ideasonboard.com>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
 <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>

Hi Dmitry,

On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
> On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
> > On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
> > > Add support for the drm_panic module, which displays a message on
> > > the screen when a kernel panic occurs.
> > > 
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Tested on Armadillo-800-EVA.
> > > ---
> > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
> > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
> > >  	.atomic_disable = shmob_drm_plane_atomic_disable,
> > >  };
> > >  
> > > +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> > > +	.atomic_check = shmob_drm_plane_atomic_check,
> > > +	.atomic_update = shmob_drm_plane_atomic_update,
> > > +	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> > > +};
> > > +
> > >  static const struct drm_plane_funcs shmob_drm_plane_funcs = {
> > >  	.update_plane = drm_atomic_helper_update_plane,
> > >  	.disable_plane = drm_atomic_helper_disable_plane,
> > > @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> > >  
> > >  	splane->index = index;
> > >  
> > > -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> > > +	if (type == DRM_PLANE_TYPE_PRIMARY)
> > > +		drm_plane_helper_add(&splane->base,
> > > +				     &shmob_drm_primary_plane_helper_funcs);
> > > +	else
> > > +		drm_plane_helper_add(&splane->base,
> > > +				     &shmob_drm_plane_helper_funcs);
> > 
> > It's not very nice to have to provide different operations for the
> > primary and overlay planes. The documentation of
> > drm_fb_dma_get_scanout_buffer() states
> > 
> >  * @plane: DRM primary plane
> > 
> > If the intent is that only primary planes will be used to display the
> > panic message, shouldn't drm_panic_register() skip overlay planes ? It
> > would simplify drivers.
> 
> What about the drivers where all the planes are actually universal?
> In such a case the planes registered as primary can easily get replaced
> by 'overlay' planes.

Good point.

Another option, if we wanted to avoid duplicating the drm_plane_funcs,
would be to add a field to drm_plane to indicate whether the plane is
suitable for drm_panic.

I don't think this patch should be blocked just for this reason, but I'm
a bit bothered by duplicating the ops structure to indicate drm_panic
support.

> > >  
> > >  	return &splane->base;
> > >  }

-- 
Regards,

Laurent Pinchart

