Return-Path: <linux-renesas-soc+bounces-5654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A28448D3796
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 15:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30E901F234D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 13:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D8412B8B;
	Wed, 29 May 2024 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9KK1bcG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDE612B82
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716989330; cv=none; b=oqAw4a4INH6Oa8vYdzmq3Cna+plJKutbmxCq07jyH0zugmhMLpuf62ZHeDnIKLQr7OGpAu4+ozHNDxH+4sAPjE3dt1+VKI5hvji9KXSswGHcWe+rBGsiatydd5Gp4ujy1I7Lc+XIdM4gxyMCCRpDN/HKvXX0DOQBmcUEQaBO2ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716989330; c=relaxed/simple;
	bh=rpRdMZcQuAq0s3KYtpCUpLu51SObVjwsJB5gDLKe9Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUXSan2kUBdhwRa/ku6aoUcBmwGTvHmAVwtcH9/uPTTfrzFEIKqP1QqSP6GPHOaEC5V6u9dFObt+PruOryc6Y2TpWUjhdjs09hkkHuAF5c0RZ+/t2s5MhSvTGktU1wxf4cPup9zG9vKHBcqnHFqKAdy9cThHdqx//Cdlxux4XIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9KK1bcG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ac0c4b62cso845806e87.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 06:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716989326; x=1717594126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yDdiOo4TTHc8+02UhzIfTg8BY6rDz9ZcFTfXoUUsFkk=;
        b=Z9KK1bcGfuK4n0DuM43boDM6I2NfIE3h9YNeTPq1G+1xPzGvuouNSHwLvjJQPnTIVr
         eHsKeA62lpCmIpdPnd/X09FOUQ7rjLwzIXEt1CnvILONM/gViqd4vFxCpG/A4dnKFK7Q
         lh0QFdbeAVYFuamTK0AbWHZJlc8cbu0ptGlBayx1Vy+lAUqQM7O0/ZobZmtq9y4xy8IP
         MZriykQFEg9Zfn//BWtWe0ZPDB6k5ZxdHTJyP2EnuY6do25K8dlXWI8CwYOw+Vcapanj
         b4T3KR9Tsd9D5v5JDkHOjVxiOh+Pa/noWLqBvwVe+Bp+KJMiCgGyhReps/Ei4AMm74BH
         UNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716989326; x=1717594126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDdiOo4TTHc8+02UhzIfTg8BY6rDz9ZcFTfXoUUsFkk=;
        b=Mf6hrk4CCXcjiPI73+3y56M+loyYYEqbNHy0OZyHrFaPQxa1UjhWeXo9cGFZd1jGDk
         nk6MvwZip8CUSVJTSD3ETrkThTt9s3Lfur9cEVHpmVUNqQsHsO4Eq09Ix5362P2KezxQ
         +rCiPb4E2+6pmwC4/+q1jxTCHgiQjZc2Vv4/1poDnW+4e98SAeSa2n5LOFKLDLUcR93d
         qItgq4tliWGftVc2TmU/u135UQPuss/R//jICvP2+YTVmw5IuaPNcENIoAZV8g0nQEcE
         opM34C1o67WBcadLkx8YO0PuIt0pJRWsGBdzwmrrq/KUkXOeKZzuET6t53uD+B2fAGzv
         BWaw==
X-Forwarded-Encrypted: i=1; AJvYcCXICq2dJ6zo+7iQEYuey0kS7xmXTt0pWL3ojCL/4od9axkmd4rIj9ygtCcfyN1fWSBMVp+sH4YAfXrtiCsYmwwqisQHvt87FEWfMYr/0ZW/Kec=
X-Gm-Message-State: AOJu0YzQCTJCWRLkwPwytIMKTsK4Lejdi+KU3SWjOW0l8HaaDwQCkKYP
	4Q82uyl5fq6GYu3iMfg9fh6/OqXsCTHB/1n1dIfNvMLEhP+wjSHepFEFUbcl1uw=
X-Google-Smtp-Source: AGHT+IFLMPmqAKOfphdtUmT6l702+ojk5IE/OhS7b48vue/u0Efwud+kumR1kaibNS2I9HIJTyjG0Q==
X-Received: by 2002:a05:6512:1309:b0:523:90df:a9c6 with SMTP id 2adb3069b0e04-529661f2e0emr10272791e87.50.1716989326496;
        Wed, 29 May 2024 06:28:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296e88781fsm1259436e87.4.2024.05.29.06.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:28:46 -0700 (PDT)
Date: Wed, 29 May 2024 16:28:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
Message-ID: <ikryifdxh5hfbjl6c4yinyy52f2pr4pm4g4564jq4cob7ics2p@wa37stxn3sqm>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
 <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
 <20240529091018.GK1436@pendragon.ideasonboard.com>
 <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
 <20240529095506.GC19014@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529095506.GC19014@pendragon.ideasonboard.com>

On Wed, May 29, 2024 at 12:55:06PM +0300, Laurent Pinchart wrote:
> On Wed, May 29, 2024 at 12:25:56PM +0300, Dmitry Baryshkov wrote:
> > On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
> > > Hi Dmitry,
> > > 
> > > On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
> > > > On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
> > > > > On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
> > > > > > Add support for the drm_panic module, which displays a message on
> > > > > > the screen when a kernel panic occurs.
> > > > > > 
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > ---
> > > > > > Tested on Armadillo-800-EVA.
> > > > > > ---
> > > > > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
> > > > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > > index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> > > > > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > > @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
> > > > > >  	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > > > >  };
> > > > > >  
> > > > > > +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> > > > > > +	.atomic_check = shmob_drm_plane_atomic_check,
> > > > > > +	.atomic_update = shmob_drm_plane_atomic_update,
> > > > > > +	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > > > > +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> > > > > > +};
> > > > > > +
> > > > > >  static const struct drm_plane_funcs shmob_drm_plane_funcs = {
> > > > > >  	.update_plane = drm_atomic_helper_update_plane,
> > > > > >  	.disable_plane = drm_atomic_helper_disable_plane,
> > > > > > @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> > > > > >  
> > > > > >  	splane->index = index;
> > > > > >  
> > > > > > -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> > > > > > +	if (type == DRM_PLANE_TYPE_PRIMARY)
> > > > > > +		drm_plane_helper_add(&splane->base,
> > > > > > +				     &shmob_drm_primary_plane_helper_funcs);
> > > > > > +	else
> > > > > > +		drm_plane_helper_add(&splane->base,
> > > > > > +				     &shmob_drm_plane_helper_funcs);
> > > > > 
> > > > > It's not very nice to have to provide different operations for the
> > > > > primary and overlay planes. The documentation of
> > > > > drm_fb_dma_get_scanout_buffer() states
> > > > > 
> > > > >  * @plane: DRM primary plane
> > > > > 
> > > > > If the intent is that only primary planes will be used to display the
> > > > > panic message, shouldn't drm_panic_register() skip overlay planes ? It
> > > > > would simplify drivers.
> > > > 
> > > > What about the drivers where all the planes are actually universal?
> > > > In such a case the planes registered as primary can easily get replaced
> > > > by 'overlay' planes.
> > > 
> > > Good point.
> > > 
> > > Another option, if we wanted to avoid duplicating the drm_plane_funcs,
> > > would be to add a field to drm_plane to indicate whether the plane is
> > > suitable for drm_panic.
> > 
> > ... or maybe let the driver decide. For the fully-universal-plane
> > devices we probably want to select the planes which cover the largest
> > part of the CRTC.
> 
> Are there devices where certain planes can only cover a subset of the
> CRTC (apart from planes meant for cursors) ?

On contemporary MSM devices any plane can cover any part of the screen,
including not having a plane that covers the full screen at all.

> I think that what would matter the most in the end is selecting the
> plane that is on top of the stack, and that doesn't seem to be addressed
> by the drm_panic infrastructure. This is getting out of scope for this
> patch though :-)
> 
> > > I don't think this patch should be blocked just for this reason, but I'm
> > > a bit bothered by duplicating the ops structure to indicate drm_panic
> > > support.
> > > 
> > > > > >  
> > > > > >  	return &splane->base;
> > > > > >  }
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
With best wishes
Dmitry

