Return-Path: <linux-renesas-soc+bounces-7165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A86929EF2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 11:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE44F1C21BD2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 09:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258B03D0AD;
	Mon,  8 Jul 2024 09:20:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAE7433CA
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jul 2024 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720430427; cv=none; b=kd7Hxq/m89iqPEChxdfDNjfjBEe8X4xn61JS+YblIncGTWk9IRAAbastZ7c+6McPpYMGPI2Vd3+KOCujs1SN+9L1tomi8/uuJXqploL9yhNcXl2fCNz3cjVuSC5F+KipqMQPQhc7d1SgKO8UsVMjq6ht87l0gkoTt1LYOLDBuIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720430427; c=relaxed/simple;
	bh=kV4QagHBudbgMZu3KxONMakDnxUwd+t74bWCpF3KZ8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuqkCPNcL/BqXfk2G3DpSMMlzK88Anf21Wm67ngUu8+XPIyNW+Ch79c7tgPsJjAfMEo/oL3Vptcp6Oe/tusG9d9drxlq+NySQHVbFG6YUYPMtgdFnU7ca295pLGnowXtUQDOor+7jLeSQTSzWnpge4/KTRrZpFhNNe+IYXG1nuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfab4779d95so3942245276.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jul 2024 02:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720430424; x=1721035224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RraAuMZIqM8eVclBnVWxcht54fRcrWMbQsKuGQTdpSU=;
        b=Y7OGR4DnhHbtGsyCrJhey7kjpP9oJfq7gXrmMvVLQHjYSJLc8TCGeYfArp0Fp5oSep
         FSTa/J9t22ExJjXan0OnXp0cSKCEbceHZop+WKYPy+kIRUqZ94Hy04XhEAW6ITrAbnIS
         lSFYnApDZgOBBRWddtjKbbcLyJRPc+n4nnrrEPkhGQUzJ4WVQT+1MxbZ0BaOqNLlKGMb
         F/dFeoDgSGMajclhBDYvdH92mSx/snXXbvCsMurVEX9vcjmZFlPgLt+hj07aS4szx84X
         1IESyPsN248jLsu23lO2Ruzb2AokBccFgnU/y0Fhrp73J4hQU8qyabF8uQkEUEwWm89m
         c4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCW4dGonJI2EN6UAGiBlri/WQEWLP1Rln4o3cTrdfNm5vvRtL9LhleeHxuX6MKsLrsZqCMuSyIWRHkQqTGPTcCN5Cl/60vm1GW2ULBU8ZX1dcL0=
X-Gm-Message-State: AOJu0YzkNMkP0HNrYKQmTl6JPzHVx9iNYH/vQDL3tZ40fzk4mbHrTS6m
	LlY45phTU5JuuGvxfp87+l1XCejI/dhjm+XmaKxKgeiC0DBXjXWUL5uUMGPI
X-Google-Smtp-Source: AGHT+IHox8YeKEc4kjayhGe+ieLFGeW2n5fpe4O8J7+XJ8ipkxTvvTE00PNsFN5kH44H01P9MK9LcQ==
X-Received: by 2002:a25:dfd7:0:b0:dff:2a49:2f23 with SMTP id 3f1490d57ef6-e03c19ab447mr13069759276.35.1720430423674;
        Mon, 08 Jul 2024 02:20:23 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e03a502783bsm2026371276.65.2024.07.08.02.20.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 02:20:23 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-64b9f11b92aso33011177b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jul 2024 02:20:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNfHQCynvqgqGO034m164rB10V0m1bY/Utr8sXfslISXlCO7S1y1F7SGX6+DCnxUD2DdvfMvuh45Qxf0ViMLEClmj00HUoZVJJGyyTWlTo9uM=
X-Received: by 2002:a05:690c:4d82:b0:618:8d66:8363 with SMTP id
 00721157ae682-652d7682c02mr152685557b3.41.1720430423213; Mon, 08 Jul 2024
 02:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708082712.30257-1-biju.das.jz@bp.renesas.com>
 <20240708-mighty-squid-of-glamour-6c1af7@houat> <TY3PR01MB113460400FF8AB36377DAFF4286DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113460400FF8AB36377DAFF4286DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jul 2024 11:20:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCKKD91WhHzTHmr95L2C3WWcynOjtTXHZpBZAssJJKUA@mail.gmail.com>
Message-ID: <CAMuHMdWCKKD91WhHzTHmr95L2C3WWcynOjtTXHZpBZAssJJKUA@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: shmobile: shmo_drm_crtc: Fix PM imbalance
 if RPM_ACTIVE is true
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Jul 8, 2024 at 11:00=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > From: Maxime Ripard <mripard@kernel.org>
> > On Mon, Jul 08, 2024 at 09:27:09AM GMT, Biju Das wrote:
> > > The pm_runtime_resume_and_get() returns 1 if RPM is active, in this
> > > case it won't call a put. This will result in PM imbalance as it trea=
t
> > > this as an error and propagate this to caller and the caller never
> > > calls corresponding put(). Fix this issue by checking error condition
> > > only.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > @@ -208,7 +208,7 @@ static void shmob_drm_crtc_atomic_enable(struct d=
rm_crtc *crtc,
> > >     int ret;
> > >
> > >     ret =3D pm_runtime_resume_and_get(dev);
> > > -   if (ret)
> > > +   if (ret < 0)
> > >             return;
> >
> > The documentation of pm_runtime_resume_and_get says that:
> >
> >   Resume @dev synchronously and if that is successful, increment its
> >   runtime PM usage counter. Return 0 if the runtime PM usage counter of
> >   @dev has been incremented or a negative error code otherwise.
> >
> > So it looks like it can't return 1, ever. Are you sure you're not confu=
sing pm_runtime_resume_and_get
> > with pm_runtime_get?
>
> It should be ret < 0 as ret =3D 1 corresponds to RPM_ACTIVE and the API d=
oes not call put() when ret =3D 1; see [1] and [2]
>
> [1] https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/base/power/=
runtime.c#L778
>
> [2] https://elixir.bootlin.com/linux/v6.10-rc6/source/include/linux/pm_ru=
ntime.h#L431
>
> Am I miss anything? Please let me know.

Thanks for your patch, but the code for pm_runtime_resume_and_get()
seems to disagree?
https://elixir.bootlin.com/linux/latest/source/include/linux/pm_runtime.h#L=
436

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

