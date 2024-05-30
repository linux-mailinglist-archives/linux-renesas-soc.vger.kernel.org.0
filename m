Return-Path: <linux-renesas-soc+bounces-5689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0B18D471F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 10:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EABDA1C21024
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 08:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C816D14372D;
	Thu, 30 May 2024 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ioBWa80M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A526DDA1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 May 2024 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058021; cv=none; b=aX7nxxIzjDe/mB9YVHd7eXEdRZEpFIJe29Jfze4aERdRMpfCZyroeICpthkrwr9nyjnrPAcYD4hoPRy9OvDj8DmUBr0JMA2G31nT/3oPkPvniM4vhqCqV2VI96o08KV8W8/323w2eV3pWGwTkWApgVY6tutazBsI2sxYxJBeKNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058021; c=relaxed/simple;
	bh=RFhyYKD+Dx3mnq7nghb105UmoaUDojHPE3nN3wctQHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dcJHVjTcd+g1ajt48He/nzELh0vK21ioVOa7JUSoJMPtS/dcH6pVBaNJHfrQkbIGou+Hik+rsbFAZkfedRnnlL5sQTyriEovqDc+IZux1pltm3wnlW5BSK5sjCyv0lI1ZVnxk7HD8JTgp28PxvvXKSmYvV1+2Z4Ec/DYk6CUZaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ioBWa80M; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-df771b6cf71so551466276.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 May 2024 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717058019; x=1717662819; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Y1+9yh9l2lG5uemw/IEcQqxfvkH5gY34KMDCMqv/3g=;
        b=ioBWa80MKAocvxWYjVULP2seN2BOs2DarLh/YTEi31eaZ+7uzeMQBnWlZhVYah7GRy
         a0g+u2o/ulzKAuGon8nq8ZBRlMabFWuXbEIXjPFkEwIItK+aTQukfiYnzQbT5gBGUDFs
         9UFpk7+Z0IWdS8XA3g64KxFRXDtAfvaBa+r5y8/nI7TL0iY10QL5r+pGuBiip6g0E3lf
         r1RXv0/k5uLYOHGOANaEMhbvk9aufJJkgzY+NucdVc3OQB6NWIeqhvTO8MrCNi245Vmb
         75TfNhr+YFN8kfQ5vtPQEQVTRWLQG/QYPfouoxx7yXVdDHPl+PVSMazLz6uGyDLMAwuE
         3ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058019; x=1717662819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Y1+9yh9l2lG5uemw/IEcQqxfvkH5gY34KMDCMqv/3g=;
        b=n3Pv4au5yHGLlf6v7izGNU/S5ga3Nzsqih4UEfpBmMyzb8Yxldmx8wVx7dRIbupN4K
         a0zICFkIlID2mCoG6zF4qJ1X7jSpGO6SDmKT9LvQM3LwOScqi9GQKqbHljxNFuMxO1K9
         Qsf0e60+W+G3rmgQRia7JOoamxXdd0pPbaAj93eUmSQZdFAtzJuUHSi78MNVCw1SqcFB
         Fgvqp5cUeikYFClYaZ1EfMLv2CiDXmC9pQm/Z7IVje7NCKzYy/CqrffuX7ILcxEwI+WL
         wXpMG0W/xipB+Z/tNH+yEIrDf7k7UitQWUQRbX0y9EAZ5FoVsQZpPYWfxd3h4OP77FaF
         mY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIrzDf3SKaVF994niUx7jhfUE/Odnr5TwZ3jLWm2WskA/aNUDz8tXDJMzk34qTExP0uLyyPG8gUMfwDFBtxx+sHElKwpJc+mZ/qqrYOS7BNk4=
X-Gm-Message-State: AOJu0Yz2nL9Tkq23xW0Ph5MYfXQaNV9ZfxgOZd8ySn9wQVcXBxD4DTYc
	Hp+aMMLA4Wsuo6PYZSHUmEqThvOzSvw6t2g7dAHUuEZ/z93MkXgG7lRY6863js/gyXoQNqKrYuB
	vgZsCbX7te4cpDOUZEHbC9QFdt+LV3M1NPfNVvg==
X-Google-Smtp-Source: AGHT+IHFgiXTt0MXeRsHyGxw4wLSoBgD8A4AB/4A1efGXfH30qjkfH0/d4wiqKiHncbrENMUNVzamI2pDlP2kboIMY8=
X-Received: by 2002:a25:1c5:0:b0:dfa:49a8:fdc9 with SMTP id
 3f1490d57ef6-dfa5a5e46f7mr1705343276.22.1717058018989; Thu, 30 May 2024
 01:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com> <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
 <20240529091018.GK1436@pendragon.ideasonboard.com> <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
 <20240529095506.GC19014@pendragon.ideasonboard.com> <ikryifdxh5hfbjl6c4yinyy52f2pr4pm4g4564jq4cob7ics2p@wa37stxn3sqm>
 <20240529133309.GO1436@pendragon.ideasonboard.com> <e1cc6c86-d042-400c-b995-a8b78f62dbdd@redhat.com>
In-Reply-To: <e1cc6c86-d042-400c-b995-a8b78f62dbdd@redhat.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 11:33:27 +0300
Message-ID: <CAA8EJpoC9SiLr4QyksKLq796vdq7pFywwn9pPyrkj6-uo5zVog@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 May 2024 at 11:16, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>
>
>
> On 29/05/2024 15:33, Laurent Pinchart wrote:
> > On Wed, May 29, 2024 at 04:28:44PM +0300, Dmitry Baryshkov wrote:
> >> On Wed, May 29, 2024 at 12:55:06PM +0300, Laurent Pinchart wrote:
> >>> On Wed, May 29, 2024 at 12:25:56PM +0300, Dmitry Baryshkov wrote:
> >>>> On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
> >>>>> Hi Dmitry,
> >>>>>
> >>>>> On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
> >>>>>> On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
> >>>>>>> On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
> >>>>>>>> Add support for the drm_panic module, which displays a message on
> >>>>>>>> the screen when a kernel panic occurs.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>>>>>> ---
> >>>>>>>> Tested on Armadillo-800-EVA.
> >>>>>>>> ---
> >>>>>>>>   drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
> >>>>>>>>   1 file changed, 13 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> >>>>>>>> index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> >>>>>>>> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> >>>>>>>> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> >>>>>>>> @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
> >>>>>>>>        .atomic_disable = shmob_drm_plane_atomic_disable,
> >>>>>>>>   };
> >>>>>>>>
> >>>>>>>> +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> >>>>>>>> +      .atomic_check = shmob_drm_plane_atomic_check,
> >>>>>>>> +      .atomic_update = shmob_drm_plane_atomic_update,
> >>>>>>>> +      .atomic_disable = shmob_drm_plane_atomic_disable,
> >>>>>>>> +      .get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> >>>>>>>> +};
> >>>>>>>> +
> >>>>>>>>   static const struct drm_plane_funcs shmob_drm_plane_funcs = {
> >>>>>>>>        .update_plane = drm_atomic_helper_update_plane,
> >>>>>>>>        .disable_plane = drm_atomic_helper_disable_plane,
> >>>>>>>> @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> >>>>>>>>
> >>>>>>>>        splane->index = index;
> >>>>>>>>
> >>>>>>>> -      drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> >>>>>>>> +      if (type == DRM_PLANE_TYPE_PRIMARY)
> >>>>>>>> +              drm_plane_helper_add(&splane->base,
> >>>>>>>> +                                   &shmob_drm_primary_plane_helper_funcs);
> >>>>>>>> +      else
> >>>>>>>> +              drm_plane_helper_add(&splane->base,
> >>>>>>>> +                                   &shmob_drm_plane_helper_funcs);
> >>>>>>>
> >>>>>>> It's not very nice to have to provide different operations for the
> >>>>>>> primary and overlay planes. The documentation of
> >>>>>>> drm_fb_dma_get_scanout_buffer() states
> >>>>>>>
> >>>>>>>   * @plane: DRM primary plane
> >>>>>>>
> >>>>>>> If the intent is that only primary planes will be used to display the
> >>>>>>> panic message, shouldn't drm_panic_register() skip overlay planes ? It
> >>>>>>> would simplify drivers.
> >>>>>>
> >>>>>> What about the drivers where all the planes are actually universal?
> >>>>>> In such a case the planes registered as primary can easily get replaced
> >>>>>> by 'overlay' planes.
> >>>>>
> >>>>> Good point.
> >>>>>
> >>>>> Another option, if we wanted to avoid duplicating the drm_plane_funcs,
> >>>>> would be to add a field to drm_plane to indicate whether the plane is
> >>>>> suitable for drm_panic.
> >>>>
> >>>> ... or maybe let the driver decide. For the fully-universal-plane
> >>>> devices we probably want to select the planes which cover the largest
> >>>> part of the CRTC.
> >>>
> >>> Are there devices where certain planes can only cover a subset of the
> >>> CRTC (apart from planes meant for cursors) ?
> >>
> >> On contemporary MSM devices any plane can cover any part of the screen,
> >> including not having a plane that covers the full screen at all.
> >
> > Ah, you meant picking the plane that is currently covering most of the
> > screen. I thought you were talking about devices where some planes were
> > restricted by the hardware to a subset of the CRTC.
> >
> > I agree it would make sense to take both plane position and z-pos, as
> > well as visibility and other related parameters, to pick the plane that
> > is the most visible. Ideally this should be handled in drm_panic, not
> > duplicated in drivers.
>
> I'm not sure that drm_panic can figure out reliably on which plane it
> needs to draw. I think the driver has more information to take the right
> decision.

I think there should be a default implementation which fits 80% of the
cases (single fixed PRIMARY plane per output) but if the driver needs
it, it should be able to override the behaviour.

> Also if you prefer, you can add the get_scanout_buffer() callback for
> all planes (to use the same helper fops), and then filter out in the
> callback for planes that are not suitable. I just find it cleaner to not
> register planes that the driver knows they will never be suitable (like
> cursor planes).
>
> static void shmob_atomic_helper_get_scanout_buffer(struct drm_plane
> *plane, struct drm_scanout_buffer *sb))
> {
>         if (plane->type == DRM_PLANE_TYPE_PRIMARY)
>                 return drm_fb_dma_get_scanout_buffer(plane, sb);
>         return -EOPNOTSUPP;
> }
>
> .get_scanout_buffer = shmob_atomic_helper_get_scanout_buffer,
>
>
> --
>
> Jocelyn
>
> >
> >>> I think that what would matter the most in the end is selecting the
> >>> plane that is on top of the stack, and that doesn't seem to be addressed
> >>> by the drm_panic infrastructure. This is getting out of scope for this
> >>> patch though :-)
> >>>
> >>>>> I don't think this patch should be blocked just for this reason, but I'm
> >>>>> a bit bothered by duplicating the ops structure to indicate drm_panic
> >>>>> support.
> >>>>>
> >>>>>>>>
> >>>>>>>>        return &splane->base;
> >>>>>>>>   }
> >
>


-- 
With best wishes
Dmitry

