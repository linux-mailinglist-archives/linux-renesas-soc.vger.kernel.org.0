Return-Path: <linux-renesas-soc+bounces-6545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E54891047F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 14:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EB901F241A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 12:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D809E1AC78C;
	Thu, 20 Jun 2024 12:49:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1841AC78E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718887744; cv=none; b=A7eJ0z+3+6rDs1SGZ4/El3CN/zfqtDq/arK7mGXgEjhGGJdb0WtpIefN6SfM1UCaY6CcRQ5sDv4bDYFyQ7Xna/vUE6JnC62OFdllX0BxDmyzNfrYWCBDs8tanzLWsXwBVf4P17Ez/OBsiAo0sqrlDw9RP0zXgyzTB+0NL6wYR2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718887744; c=relaxed/simple;
	bh=E+G1t5tVkD7U9LoMz9zvnUfEFc5JlZTMphRdD4xWi7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnP83R+3Qr6xU2eTcEKh7K1Xu9y81CRXiN9GyO7GH9h/QzxfzUFTn9n/kh7L6JfbJMl+/IUxA3aXm/vNp6C9crvEN8laZOc4WnITJ8+1AF1ekDo/T6rIqlNfl65ifgjowtLyWgQrshiNBdADFtmbO5dkZVzdrH72wkTGD8MrVYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-632843cff4fso7870947b3.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 05:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718887741; x=1719492541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwTZvjStxcy8ANXhG9XqkhF8JycY3RLrE4qtHFN4Aik=;
        b=Ux+VI8VeKV0n95WSlerLcv4CRrQZ91twXACon7erCvwxD2Rpg64b06hR58pfB6tBlL
         1y3bgxKDPQpvD1+9iaIWWGP08lvecERlNFecnvsav6qY3v1ofRNskYFQVAp/6NOqnJaj
         zlQuhmI76m+n6r3jCQyTIiLZ+W0R9rmHiQ8pV2NO876woLFVF+jdbJI/SYeycY55dgzU
         6RfdcehFBzwAGaGcsb3Fblub2O/SIlzXY3Pr5XiGsPcIgMB0u72UXZV/Cjt5d+yDtxM9
         wHSnxNplZOA6aZkJqiuNztjMjYT4pjGG8hh30B9xd9aimZZjoamdEqJmBMgS0flcnMrx
         r0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWRurDfSJjeJXrVkKhNLw0a/j624Ycuj3IFYXUio8hyD0JkFiWKGSo2iKrOFx1nu8gv+RukVbcG+xd2TeKJU/LidHd9HxwP0QuoKIHq9CB81Q4=
X-Gm-Message-State: AOJu0YzCDa/tBa/y9Cgl/Qoxhw2bzgqGuQii0FRuCqvon/sWXZ9swH4i
	szpDlnji8JGa1qExgEf/8lKwShMZ0x27DpM/XYEA9KgleW5fI4PQW4nJBZ+o
X-Google-Smtp-Source: AGHT+IG8ippLq8bgAtblGsutlFJzcQab28LGerWCWcDAJf2ANVJS3oeUcY74SxYzRy15qwIsfclw4g==
X-Received: by 2002:a81:9184:0:b0:62f:ee76:c697 with SMTP id 00721157ae682-63a8af51b66mr53036627b3.0.1718887741282;
        Thu, 20 Jun 2024 05:49:01 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6311af07d97sm29700387b3.135.2024.06.20.05.49.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 05:49:01 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-63bd10df78dso7703397b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 05:49:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdUJtv3/l6HPze64jNkuXBNFtz81f6KAM+m9mansMDSph9HCFcUAXkua8ekefPx0bE+Hsq3s/48AheUqzi5InLTZ3MKuwl5KYoXXLbIXt8P1c=
X-Received: by 2002:a81:9254:0:b0:618:2f6d:ca80 with SMTP id
 00721157ae682-63a8dfed4admr59007547b3.12.1718887740827; Thu, 20 Jun 2024
 05:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-5-jacopo.mondi@ideasonboard.com> <20240619194414.GD31507@pendragon.ideasonboard.com>
In-Reply-To: <20240619194414.GD31507@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jun 2024 14:48:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxf4oePnyLvp84OhSa+wdehCNJBXnhjYO7-1VxpBJ7eQ@mail.gmail.com>
Message-ID: <CAMuHMdXxf4oePnyLvp84OhSa+wdehCNJBXnhjYO7-1VxpBJ7eQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: rcar-du: Add support for R8A779H0
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <dri-devel@lists.freedesktop.org>, 
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent, Jacopo,

On Wed, Jun 19, 2024 at 9:46=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Jun 19, 2024 at 12:22:18PM +0200, Jacopo Mondi wrote:
> > Add support for R-Car R8A779H0 V4M which has similar characteristics
> > as the already supported R-Car V4H R8A779G0, but with a single output
> > channel.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> > @@ -185,11 +187,16 @@ static void rcar_du_group_setup(struct rcar_du_gr=
oup *rgrp)
> >               dorcr |=3D DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
> >       rcar_du_group_write(rgrp, DORCR, dorcr);
> >
> > -     /* Apply planes to CRTCs association. */
> > -     mutex_lock(&rgrp->lock);
> > -     rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> > -                         rgrp->dptsr_planes);
> > -     mutex_unlock(&rgrp->lock);
> > +     /*
> > +      * Apply planes to CRTCs association, skip for V4M which has a si=
ngle
> > +      * channel.
>
> " and doesn't implement the DPTSR register."
>
> I'm pretty sure writing it is still harmless, but...
>
> > +      */
> > +     if (rcdu->info->gen < 4 || rgrp->num_crtcs > 1) {

Looking at the R-Car Gen3 docs, this check seems to be wrong, and the
lack of a check might have been an issue before?

Seems like the register (per pair) is only present if the second CRTC
of a CRTC pair is present, so R-Car V3M and V3H (single CRTC) do not
have DPTSR at all, and M3-W (triple CRTC) does not have it on the
second pair.  M3-N does have both, as it lacks the first CRTC of
second pair, but does have the second CRTC of the second pair.

> > +             mutex_lock(&rgrp->lock);
> > +             rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 1=
6) |
> > +                                 rgrp->dptsr_planes);
> > +             mutex_unlock(&rgrp->lock);
> > +     }
> >  }

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

