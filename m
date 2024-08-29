Return-Path: <linux-renesas-soc+bounces-8501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F8196474D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 15:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87C311C2211E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 13:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5256D1A2C3C;
	Thu, 29 Aug 2024 13:54:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721E719306A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Aug 2024 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939652; cv=none; b=Raz1I67Oio6ct+XkPwYHQT3yIplOBzTYJKuX2gTierip/eRG1qWQxcdZbFBcKpLJa9j47/hLnrJSmw5c35AN2zolCLjfgsOsoIT2i/yiz2168v1TRBDYWF7kxch9Yn2MSvDD4hgUVG9sX89/CbiQkAD7hpjTzH+XXLbAbHB7J/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939652; c=relaxed/simple;
	bh=Sy2q/jArGkLsW1ajp+zdrhah4ThPqzW6kWKlnJevEDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4cJd+0cn0VG0VMgn5aZ3QrheS4iLjiYjJEUqA+z3gOLcPbFzzisDKXkl55FPCeU24KXOeLAux54U0LguzM7L321MBOvKyP1Kw+T47R0y58ui1RJWk7MYCL8pt8F8LEQmChiGeMkDsAp/aSZ5bpybpss3MCv5IMO4ht0TFB0msI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e16518785c2so550402276.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Aug 2024 06:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724939648; x=1725544448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzzYKNiGPyBUG5ppZhjhaLdiN2i8XiaFzKiex+m/I8U=;
        b=GwTJsGYSLDmygYqOw6tgz8WzYC/bp6qvtL3CmzNRuZUr+LLZWCg7UHRcktrIPGL/8o
         a3vaiWyFAl/PIiyqnlAbLgRXmX70fir2dDuV/anbcw/7OA0HY06d8tsOH7M8XX4iJbBy
         Ir4GWJf3xXivS0z3xOczypLzBDjPZAQWCt7VuNgm3xxHXgSG0EysNcBrM5LHf2UTzhsb
         u6bC8lbhQwb/4O5v82n8mP/PFwr4LoxO4mwrbLLLzdNcc5MczySh7gJ+5Xc5639fLxM9
         3owu5HQ7ARDW4zteIZiJwk5RlXOeUROCnlGlOw/iKJiWZPwBE8rPrjisNWmPa7cf+G2a
         L04Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlOflG0Dlsg+gZDUNx+LKNWSfQJj87bklagsDpyWekApF/9uVl1+dRJR1aJLJFIVlxouATu2bvJqNs3XJmccGBNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZHpLjoOsX0m7flmjOo0v1cfPZBJ1S7tzMBbfrDqL8hRccWXcG
	HN8Keb0OU2dK+w98tW6PQikDAC6KONEW5GyDfbMK9hRB92Th8KT7dqLkqVW4
X-Google-Smtp-Source: AGHT+IFTpYUfNFCA8lSAgGGs67mSCNerjowU9qmcFHxVcItueyA4xITiZutiocl0nQxcQYcM0zNXGQ==
X-Received: by 2002:a05:6902:150d:b0:e11:7db3:974c with SMTP id 3f1490d57ef6-e1a5af0b8e5mr3785452276.35.1724939648590;
        Thu, 29 Aug 2024 06:54:08 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d3abf883sm2517037b3.13.2024.08.29.06.54.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 06:54:08 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1a2264e907so689793276.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Aug 2024 06:54:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdfRTvzSB6xr7Hy7cHmO3y/TRLbvm2a/RereHfdwy8ajSWWjSmLEVWxO9dAvzYLl75NGgKTmsQtmA2Z7iLaWJooQ==@vger.kernel.org
X-Received: by 2002:a05:6902:2b05:b0:e13:df00:2830 with SMTP id
 3f1490d57ef6-e1a5ac9e448mr3353529276.30.1724939647866; Thu, 29 Aug 2024
 06:54:07 -0700 (PDT)
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
 <CAA8EJpoC9SiLr4QyksKLq796vdq7pFywwn9pPyrkj6-uo5zVog@mail.gmail.com>
In-Reply-To: <CAA8EJpoC9SiLr4QyksKLq796vdq7pFywwn9pPyrkj6-uo5zVog@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 15:53:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1SQT4Lnah3-H6r19_xUuKO7iLcTw1PApg7v6naEF5Sg@mail.gmail.com>
Message-ID: <CAMuHMdV1SQT4Lnah3-H6r19_xUuKO7iLcTw1PApg7v6naEF5Sg@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 10:33=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Thu, 30 May 2024 at 11:16, Jocelyn Falempe <jfalempe@redhat.com> wrote=
:
> > On 29/05/2024 15:33, Laurent Pinchart wrote:
> > > On Wed, May 29, 2024 at 04:28:44PM +0300, Dmitry Baryshkov wrote:
> > >> On Wed, May 29, 2024 at 12:55:06PM +0300, Laurent Pinchart wrote:
> > >>> On Wed, May 29, 2024 at 12:25:56PM +0300, Dmitry Baryshkov wrote:
> > >>>> On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
> > >>>>> On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
> > >>>>>> On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote=
:
> > >>>>>>> On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wr=
ote:
> > >>>>>>>> Add support for the drm_panic module, which displays a message=
 on
> > >>>>>>>> the screen when a kernel panic occurs.
> > >>>>>>>>
> > >>>>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >>>>>>>> ---
> > >>>>>>>> Tested on Armadillo-800-EVA.
> > >>>>>>>> ---
> > >>>>>>>>   drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 ++++=
+++++++++-
> > >>>>>>>>   1 file changed, 13 insertions(+), 1 deletion(-)
> > >>>>>>>>
> > >>>>>>>> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.=
c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > >>>>>>>> index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> > >>>>>>>> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > >>>>>>>> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > >>>>>>>> @@ -273,6 +273,13 @@ static const struct drm_plane_helper_func=
s shmob_drm_plane_helper_funcs =3D {
> > >>>>>>>>        .atomic_disable =3D shmob_drm_plane_atomic_disable,
> > >>>>>>>>   };
> > >>>>>>>>
> > >>>>>>>> +static const struct drm_plane_helper_funcs shmob_drm_primary_=
plane_helper_funcs =3D {
> > >>>>>>>> +      .atomic_check =3D shmob_drm_plane_atomic_check,
> > >>>>>>>> +      .atomic_update =3D shmob_drm_plane_atomic_update,
> > >>>>>>>> +      .atomic_disable =3D shmob_drm_plane_atomic_disable,
> > >>>>>>>> +      .get_scanout_buffer =3D drm_fb_dma_get_scanout_buffer,
> > >>>>>>>> +};
> > >>>>>>>> +
> > >>>>>>>>   static const struct drm_plane_funcs shmob_drm_plane_funcs =
=3D {
> > >>>>>>>>        .update_plane =3D drm_atomic_helper_update_plane,
> > >>>>>>>>        .disable_plane =3D drm_atomic_helper_disable_plane,
> > >>>>>>>> @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(=
struct shmob_drm_device *sdev,
> > >>>>>>>>
> > >>>>>>>>        splane->index =3D index;
> > >>>>>>>>
> > >>>>>>>> -      drm_plane_helper_add(&splane->base, &shmob_drm_plane_he=
lper_funcs);
> > >>>>>>>> +      if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> > >>>>>>>> +              drm_plane_helper_add(&splane->base,
> > >>>>>>>> +                                   &shmob_drm_primary_plane_h=
elper_funcs);
> > >>>>>>>> +      else
> > >>>>>>>> +              drm_plane_helper_add(&splane->base,
> > >>>>>>>> +                                   &shmob_drm_plane_helper_fu=
ncs);
> > >>>>>>>
> > >>>>>>> It's not very nice to have to provide different operations for =
the
> > >>>>>>> primary and overlay planes. The documentation of
> > >>>>>>> drm_fb_dma_get_scanout_buffer() states
> > >>>>>>>
> > >>>>>>>   * @plane: DRM primary plane
> > >>>>>>>
> > >>>>>>> If the intent is that only primary planes will be used to displ=
ay the
> > >>>>>>> panic message, shouldn't drm_panic_register() skip overlay plan=
es ? It
> > >>>>>>> would simplify drivers.
> > >>>>>>
> > >>>>>> What about the drivers where all the planes are actually univers=
al?
> > >>>>>> In such a case the planes registered as primary can easily get r=
eplaced
> > >>>>>> by 'overlay' planes.
> > >>>>>
> > >>>>> Good point.
> > >>>>>
> > >>>>> Another option, if we wanted to avoid duplicating the drm_plane_f=
uncs,
> > >>>>> would be to add a field to drm_plane to indicate whether the plan=
e is
> > >>>>> suitable for drm_panic.
> > >>>>
> > >>>> ... or maybe let the driver decide. For the fully-universal-plane
> > >>>> devices we probably want to select the planes which cover the larg=
est
> > >>>> part of the CRTC.
> > >>>
> > >>> Are there devices where certain planes can only cover a subset of t=
he
> > >>> CRTC (apart from planes meant for cursors) ?
> > >>
> > >> On contemporary MSM devices any plane can cover any part of the scre=
en,
> > >> including not having a plane that covers the full screen at all.
> > >
> > > Ah, you meant picking the plane that is currently covering most of th=
e
> > > screen. I thought you were talking about devices where some planes we=
re
> > > restricted by the hardware to a subset of the CRTC.
> > >
> > > I agree it would make sense to take both plane position and z-pos, as
> > > well as visibility and other related parameters, to pick the plane th=
at
> > > is the most visible. Ideally this should be handled in drm_panic, not
> > > duplicated in drivers.
> >
> > I'm not sure that drm_panic can figure out reliably on which plane it
> > needs to draw. I think the driver has more information to take the righ=
t
> > decision.
>
> I think there should be a default implementation which fits 80% of the
> cases (single fixed PRIMARY plane per output) but if the driver needs
> it, it should be able to override the behaviour.

Did anything like this materialize, or is this patch (and its rcar-du
counterpart [1]) good to apply as-is?

Thank you!

[1] https://lore.kernel.org/r/b633568d2e3f405b21debdd60854fe39780254d6.1716=
816897.git.geert+renesas@glider.be/
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

