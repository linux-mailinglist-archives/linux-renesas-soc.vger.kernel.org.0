Return-Path: <linux-renesas-soc+bounces-5618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 502598D3164
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 10:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2311286A0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 08:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F7D16EBF8;
	Wed, 29 May 2024 08:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PCQjQmb2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B5016F0F3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 08:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971228; cv=none; b=bNeYhvNck2wUXIUjsgeK4m48V98ET3KhxrhtnJma1PQEcwQpfQjCdxblD9gA49vmb3/BEp9JRYBJqg/fxzD8VfHFxJDKpcnnRemGHzvrC4tlWQ4gpBwLFxW1zrShIHbiSwWVl2LqPpn6R0AsdcplEyisLi0/jIfw71ybg3ia5pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971228; c=relaxed/simple;
	bh=NrkM9a8IU/oCV8lQ0yBLxXkTPGFJFCMkP8dOp6Tno9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrNkg0wPWJeFeuQPvnSbj+TthfsAd1v1FoqcYbzAlKShMFw28tnQI1W5sk/wyWmAhoxbAJUA6fkKXAATWdp6Ptlql7EP1AH3ENtLEDe+ONqn79o+cGGuyejRitxtFy7oBtsXkzlici8aRT84rB1vDdQHDHl7wEavlstJj/EVUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PCQjQmb2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e8a8ff4083so5347761fa.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716971224; x=1717576024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ew5kOSPuOpf/rbjC9WMYQnE13lezm/hBTRV8baBS8/w=;
        b=PCQjQmb2v2TwC6MtXqYX486tqrQR7WgKVfCXpcH4vJv1U0xLvrizpXPOm3CWRSoyme
         o7NNWESB2/C2huGyjiR3rnsVFwzrD8d1TGzmncz2mJgaRFkf9Jv5gAFaEX+UMsmK9qnv
         /wQzvqotjltybaD7yKstSGuPFnPN4pvADw/hhKSiYLMpEnJSTGBdZaAIR6PNgTN2SPYi
         uwZIUQjpKuj1KjPv6Y0ZjcW/qLImDyBwy3qb98EWMh0ZUJ3IXpe53tScAQlJesiE3/lc
         7jOPnu5zh2KsWV5Cz+H6odCA7NIlJ+8hLF33YRiH/jbReBVbuwNMiz+f84ryAp9Ch6xS
         t7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716971224; x=1717576024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ew5kOSPuOpf/rbjC9WMYQnE13lezm/hBTRV8baBS8/w=;
        b=Pojmd+mWhW2FV48DY3yVUO50bpPCRxjGEHTvmPRnHTR74Z/03eV68urgRe7Gna0EnH
         vU/e7alXk+B6LJ9zgjhk72gHFTUcisowpXDAuCDXCTbP5MjtxkglOOlnrDW7wwQAT8FE
         EYq7xIsmDeJyZW2JYXmS2e4f+vikmqdZ+Dr41KhS619ctIqABAjUimKgnouJO2TZgwzD
         KuAda9X0yHdyK83S7kslHcwKesrq9CoinWG/syzQO02C/xDR6BfeMWimOMiGBOSFk3lA
         lhibRXdHDUrkflYeprRW+ozDMqkj/YB4SWaz2WL4Y8BxPFwJgw2B32v52Kxpj38pILOl
         KR1g==
X-Forwarded-Encrypted: i=1; AJvYcCXKEbhJTSFJSkIhOeiXGP7uN2T6DTnRPW1D8wTGAXkbzEAq/bnq7d7JqqYT5THWM272hLeu3TliAG+eTMz1dsVD2GIwqt72fan3ZCGR/L0dUC0=
X-Gm-Message-State: AOJu0Yx4tMzz9fT2jQ1QRbFG8f+Kh2XnYbBJlmkCZDLw1Qbxzq6/sJpS
	X61W6WH3ZUELcAUxENGBG7e1uSRxCnk3YirKDL3vx9j8H0ZkB2Hpe9NRxZzyDDA=
X-Google-Smtp-Source: AGHT+IF6mhnSGRbm4g5MK0kTsSE8svbYIGrPzv5lYvCwRuHizT+MZHjY4lcDRv1Vmf7BManeCoA2eQ==
X-Received: by 2002:a2e:a9a1:0:b0:2e9:58d9:6d8 with SMTP id 38308e7fff4ca-2ea46e842eamr5391481fa.7.1716971224490;
        Wed, 29 May 2024 01:27:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea7d552a44sm840071fa.80.2024.05.29.01.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 01:27:04 -0700 (PDT)
Date: Wed, 29 May 2024 11:27:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
Message-ID: <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529010320.GI1436@pendragon.ideasonboard.com>

On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
> Hi Geert,
> 
> Thank you for the patch.
> 
> On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
> > Add support for the drm_panic module, which displays a message on
> > the screen when a kernel panic occurs.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Tested on Armadillo-800-EVA.
> > ---
> >  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
> >  	.atomic_disable = shmob_drm_plane_atomic_disable,
> >  };
> >  
> > +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> > +	.atomic_check = shmob_drm_plane_atomic_check,
> > +	.atomic_update = shmob_drm_plane_atomic_update,
> > +	.atomic_disable = shmob_drm_plane_atomic_disable,
> > +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> > +};
> > +
> >  static const struct drm_plane_funcs shmob_drm_plane_funcs = {
> >  	.update_plane = drm_atomic_helper_update_plane,
> >  	.disable_plane = drm_atomic_helper_disable_plane,
> > @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> >  
> >  	splane->index = index;
> >  
> > -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> > +	if (type == DRM_PLANE_TYPE_PRIMARY)
> > +		drm_plane_helper_add(&splane->base,
> > +				     &shmob_drm_primary_plane_helper_funcs);
> > +	else
> > +		drm_plane_helper_add(&splane->base,
> > +				     &shmob_drm_plane_helper_funcs);
> 
> It's not very nice to have to provide different operations for the
> primary and overlay planes. The documentation of
> drm_fb_dma_get_scanout_buffer() states
> 
>  * @plane: DRM primary plane
> 
> If the intent is that only primary planes will be used to display the
> panic message, shouldn't drm_panic_register() skip overlay planes ? It
> would simplify drivers.

What about the drivers where all the planes are actually universal?
In such a case the planes registered as primary can easily get replaced
by 'overlay' planes.

> 
> >  
> >  	return &splane->base;
> >  }
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
With best wishes
Dmitry

