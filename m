Return-Path: <linux-renesas-soc+bounces-8499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1AB96478E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 16:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 097D3B23E20
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 13:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F6D18E046;
	Thu, 29 Aug 2024 13:51:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED68A26AE6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Aug 2024 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939481; cv=none; b=WHFY0CneKEsVzMRaOkcut9RGZ1hwtka5JNzYC9IZVE6lV5WLi1WTPcN4g+XDXqjy6cYmhhWb1L0czZ6BQzgHuuoqVYdy5xZHI1Bev1siAVfQ/2TLDKPttH4XM7AK/8Ra1mW5CX88U6gYKdJ4NoCz89kKg8ETt+ge5nBth82M0+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939481; c=relaxed/simple;
	bh=52HsxIqRdki3hgOle1v5M1YcA23Hhuw0rdhcNc7e4MI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JduCzKQz1vzk3kNexKQVixuipBKjT/3EIxF5Qbz5o/yAoasp5qddOGWeUZnZ+jGGTCDBzLY583WccPRxlAKkIgKhDeZtS7U3DGfOMvO5S1kAFi5ywER7YTxOrZouugwhTNQ41ive3JtkVFl0rHRFjibmQdYKsAPsS2mpUKthjSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-691bb56eb65so6757887b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Aug 2024 06:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724939478; x=1725544278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oO+LwtIAdtwbqPzFoJJxjo3VESdONs3yqV/pQ3ireRc=;
        b=js8HvfnQfouslecKURVXzRLvgHIn5/7uXltLpjCKdmOzOLxsff9UYYoY5Pls6U/1mT
         GfNRNwQh/Rl908FQQbLO7QLkm3otp5mQL0T+nf3mSukwMmu+6D58hc3Ar07X9OY7oNxN
         HMV0Wul3D70AVjBVlbHHhVBV+SU8pC+3fne1qWNZIn0QbJpJCt8Tx7GTV90W8Lcko0Vm
         badpQu5I6wyc8WAETd5qjOxxs41Mba6ECgA+IARgSZzqr5zFK1gCvZxWSIh+Zki+AuXk
         1Bytkd1PQmNln49lFekE2KbUKVx9DSVuQzGJQVaK6j5zY74WO2CcCbO6xEgvK1Irudwa
         VB0w==
X-Forwarded-Encrypted: i=1; AJvYcCW8we9O+CgJ4lPVfWWq0/gBS/xOE5EyNlesIl8pyGlkuiDTYywGHiAUgEY1XHWufKpmuq5gPTgesV6j40/5MITIGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/a5cQC9GfnX1BOL4m7P5i9eZ8Z32WzmFDXXfVbFGKpU+9tyk7
	z5HHsuQhkmyaEEhkNXi8BtqBVfOWNYb9cHHdr1LPpPaQ1LSo0p+LHJMtr8yw
X-Google-Smtp-Source: AGHT+IEq/4OlW5NliexegKgdr3HjyK/UWHeD6qQ+k4Gk35wXX4f/GzBir79EPQ4mnPvj+e5GvbriOw==
X-Received: by 2002:a05:690c:2d89:b0:6c3:856a:388d with SMTP id 00721157ae682-6d276403669mr24041557b3.13.1724939478224;
        Thu, 29 Aug 2024 06:51:18 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d6198599sm2451787b3.141.2024.08.29.06.51.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 06:51:17 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e13cda45037so719163276.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Aug 2024 06:51:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW796a2UYZWBCkIZH9Zm5Dc3WvsnLMXVFoVILUVaCw7un97LMg5Nqjxz3G6Uzwf+J3/T0eq8szVyJUfdRxZIJ0QRg==@vger.kernel.org
X-Received: by 2002:a05:6902:1028:b0:e16:6785:1a5b with SMTP id
 3f1490d57ef6-e1a5ab72c0emr3573138276.14.1724939477651; Thu, 29 Aug 2024
 06:51:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <9c6116fd-d32d-4150-b0dd-91b8e1a539f2@linux.dev>
In-Reply-To: <9c6116fd-d32d-4150-b0dd-91b8e1a539f2@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 15:51:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_Uc+ghgXNiW_yvsYdR1_wdQ9_Vskw4GBthysWUCoiXw@mail.gmail.com>
Message-ID: <CAMuHMdW_Uc+ghgXNiW_yvsYdR1_wdQ9_Vskw4GBthysWUCoiXw@mail.gmail.com>
Subject: Re: drm: renesas: shmobile: Add drm_panic support
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sui,

On Wed, May 29, 2024 at 1:31=E2=80=AFPM Sui Jingfeng <sui.jingfeng@linux.de=
v> wrote:
> On 5/27/24 21:34, Geert Uytterhoeven wrote:
> > Add support for the drm_panic module, which displays a message on
> > the screen when a kernel panic occurs.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>
> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Thank you!

> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_d=
rm_plane_helper_funcs =3D {
> >       .atomic_disable =3D shmob_drm_plane_atomic_disable,
> >   };
> >
> > +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_hel=
per_funcs =3D {
> > +     .atomic_check =3D shmob_drm_plane_atomic_check,
> > +     .atomic_update =3D shmob_drm_plane_atomic_update,
> > +     .atomic_disable =3D shmob_drm_plane_atomic_disable,
> > +     .get_scanout_buffer =3D drm_fb_dma_get_scanout_buffer,
> > +};
> > +
> >   static const struct drm_plane_funcs shmob_drm_plane_funcs =3D {
> >       .update_plane =3D drm_atomic_helper_update_plane,
> >       .disable_plane =3D drm_atomic_helper_disable_plane,
> > @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct sh=
mob_drm_device *sdev,
>
>
> Maybe a shmob_drm_plane_create_primary_plane() plus a
> shmob_drm_plane_create_overlay().
>
> I remember Thomas told this way or something similiar, call untangle.

Hmm, that's what we had until commit c228823426ae509f ("drm:
renesas: shmobile: Unify plane allocation")...

>
> >       splane->index =3D index;
> >
> > -     drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs=
);
> > +     if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> > +             drm_plane_helper_add(&splane->base,
> > +                                  &shmob_drm_primary_plane_helper_func=
s);
> > +     else
> > +             drm_plane_helper_add(&splane->base,
> > +                                  &shmob_drm_plane_helper_funcs);
> >
> >       return &splane->base;
> >   }
>
>
> Anyway, it looks good to me.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

