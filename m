Return-Path: <linux-renesas-soc+bounces-5627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C53518D32E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 11:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28955B2562F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 09:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391D413E8BD;
	Wed, 29 May 2024 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+AywnVh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99453169AD4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974763; cv=none; b=DLcuEkb2dBKDpzC131WksZIr/bFgLpBt3OSA4byChAjt+Yu+VXW8FAHzDodmRoNpXCE0I/H8fIbn0kehldGCmNEdcUc54k5EKsCsLDIUpjAYKhfhlwLsoLgv4LLtwzGw8avKwlG3ZL1MASKMlUyTMgElfYyd2alx/JTkaOyScMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974763; c=relaxed/simple;
	bh=BNLRfEHlnwdRUqs7fG8+81m1fEHHGq3cIUo6R0R4sVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9ec/TuJYgILYdR+9jF1Df1EvuROwCovTbNghy110jyV8IoZSzU5AObdCfkxPlw7UkDYoUpOqnNqnP3Ul/yEvy5Er3jPPRBC4ZLk5kJYgd4vdJz0ZFzZCUJ/URULgp6gDZ+5kQgwFGM/3DIicSKmvIJd/0Jvn0vdJG8cxKXsrPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+AywnVh; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e95a74d51fso25790441fa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 02:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716974759; x=1717579559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7M+6whUTEmNjnpu1Sb+Z0aij1A0+ZQLlNoXxVJQ/2k=;
        b=W+AywnVhe7+iwJmygeagqReg5Qwc947ykYEh0lJ4dRYNPHAideNU3DdicejJsYz1BM
         psIjSBlBWsDLgvjs2Ygd/l+cAwt0LhqIrXXSMIDBr23n8cqwQKyMhiif3AD4/AdYkvgQ
         IezlS6edVygM7U0r1JbE0a3ojBuZgeTO9aG9D3LV1ov9L+E087rAgSpfGG2qLr/rHzGh
         dt1+n8sEXSXDbKijuafUJHKBTU00NZRt1IKC4QO56+wNsMiwBY2U+qsMvCscpvMyVwr2
         /44hnnezNdDebcuDX7dDBsHvlvOCmuGqMiuUlkYuoZ7ZByd2S5+NnUHL0EhKZimgsivg
         rjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716974759; x=1717579559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7M+6whUTEmNjnpu1Sb+Z0aij1A0+ZQLlNoXxVJQ/2k=;
        b=g/vCCyGIbkcJtVSuwnNuzxCGRIXFYa4Ry+Ux/LSULOP8kQ1pbP3yOmymwCKgbTg+y4
         d2ujg4A9qLzuqrNNZcG00h/CIiCuLQZC7mJl4d+m3udQt3Cy1uCn0c5eGG9DbizkwHWH
         1v2VGAK/14tItADdjRfap08Ksso3jL/px+tVbYvMOfNQ4tpl4zS7lrlBL3WqOlaGjbVt
         6kVS0qtjV/dWLRynkTNLD7d7sjR5L3qLFYnWmC/5iHXzCibPPSk1sb+5ritrw1mrsOW5
         XN9QMNK6cX8nh5MBef0ARupUC/9WzACaARPzyF7iiUPlOfNF+RlzqzrhhaiYo5WWptgk
         nKjw==
X-Forwarded-Encrypted: i=1; AJvYcCUm2ldJjSBigBwHdoR8ql1rq8lv+RExybXmbg5B0H4FKYtYeR9q2I2TS4ZYM8eRu6EBJIrwdSEOThwieKnASzy3z6r6a2hjqNCr+FznGZ+WYqY=
X-Gm-Message-State: AOJu0Yyu0ajr1lujmwbj7yqvS/H9RpynKPCI5rL9/E/WsF1st/TiSNYN
	5zh6QbbJ5op9t2rvTnPgAeFK9TMJi64GbVKVPJB7QIH7rYldLxG314WeBR/tzS8=
X-Google-Smtp-Source: AGHT+IGKl/M+WUUwHVmgRl1kPjf7k4Su4v42LXyHudw4STXx6hfr0vx/0xp3+57LGxE9OzlRGbSPpw==
X-Received: by 2002:a2e:9dd2:0:b0:2e9:865e:4ab4 with SMTP id 38308e7fff4ca-2e9865e552cmr34092681fa.38.1716974758568;
        Wed, 29 May 2024 02:25:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcd7bc7sm25281051fa.38.2024.05.29.02.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 02:25:58 -0700 (PDT)
Date: Wed, 29 May 2024 12:25:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
Message-ID: <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
 <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
 <20240529091018.GK1436@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529091018.GK1436@pendragon.ideasonboard.com>

On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
> Hi Dmitry,
> 
> On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
> > On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
> > > On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
> > > > Add support for the drm_panic module, which displays a message on
> > > > the screen when a kernel panic occurs.
> > > > 
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Tested on Armadillo-800-EVA.
> > > > ---
> > > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
> > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> > > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
> > > >  	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > >  };
> > > >  
> > > > +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> > > > +	.atomic_check = shmob_drm_plane_atomic_check,
> > > > +	.atomic_update = shmob_drm_plane_atomic_update,
> > > > +	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > > +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> > > > +};
> > > > +
> > > >  static const struct drm_plane_funcs shmob_drm_plane_funcs = {
> > > >  	.update_plane = drm_atomic_helper_update_plane,
> > > >  	.disable_plane = drm_atomic_helper_disable_plane,
> > > > @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> > > >  
> > > >  	splane->index = index;
> > > >  
> > > > -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> > > > +	if (type == DRM_PLANE_TYPE_PRIMARY)
> > > > +		drm_plane_helper_add(&splane->base,
> > > > +				     &shmob_drm_primary_plane_helper_funcs);
> > > > +	else
> > > > +		drm_plane_helper_add(&splane->base,
> > > > +				     &shmob_drm_plane_helper_funcs);
> > > 
> > > It's not very nice to have to provide different operations for the
> > > primary and overlay planes. The documentation of
> > > drm_fb_dma_get_scanout_buffer() states
> > > 
> > >  * @plane: DRM primary plane
> > > 
> > > If the intent is that only primary planes will be used to display the
> > > panic message, shouldn't drm_panic_register() skip overlay planes ? It
> > > would simplify drivers.
> > 
> > What about the drivers where all the planes are actually universal?
> > In such a case the planes registered as primary can easily get replaced
> > by 'overlay' planes.
> 
> Good point.
> 
> Another option, if we wanted to avoid duplicating the drm_plane_funcs,
> would be to add a field to drm_plane to indicate whether the plane is
> suitable for drm_panic.

... or maybe let the driver decide. For the fully-universal-plane
devices we probably want to select the planes which cover the largest
part of the CRTC.

> 
> I don't think this patch should be blocked just for this reason, but I'm
> a bit bothered by duplicating the ops structure to indicate drm_panic
> support.
> 
> > > >  
> > > >  	return &splane->base;
> > > >  }
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
With best wishes
Dmitry

