Return-Path: <linux-renesas-soc+bounces-17784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7336ACAC46
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 12:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7354D179FB5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 10:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56971EDA02;
	Mon,  2 Jun 2025 10:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPf0xdMY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DA01F0E20;
	Mon,  2 Jun 2025 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748859023; cv=none; b=uZFpVv809RNBgJbqWvmZlOJHl4vIAN0mDzr6e5xHL+/c3xdsF+ab+vLUS/9jV/NvNsozC6D4dmspbxB9J/wPCy4jOvEwvBps+XKCEn+Dac4UdD1HaaThJpP1OiBXGtxVXBTbgTDWlcYGwRhPeKMwH07JpDwPrTv6JUMoIRkPvxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748859023; c=relaxed/simple;
	bh=JsGsimBFC1FO44ag51dnHe396vw+ZGVXm5IjQsAKSgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldluct4OEMOb2+Lr2LjzUbnGLI+L+rjX80TvBRDi1u58We95m4HeppW2d81si62kiSnfKWqnQ678+U3FlvGjRN6O5eUnOnJ+W7c1QkUm0ZlYN8RA0R0O2PJeXUrAnpfpBlRwi9o3pDda3y/Czdf1Y/pesdg3nobMwaHbI7oPIHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPf0xdMY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so2782782f8f.2;
        Mon, 02 Jun 2025 03:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748859018; x=1749463818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c37LvNlWl52qBAYfX/7eP3J23YVHzuToqgxYWLWYiXs=;
        b=NPf0xdMY+ZXot0Qei/1HAWHOl3oZJiyBDA/elIF8jdY7hp73qBucmSUje5hQA3eDJX
         f6rX7IZuD31I1i0H/YI/x7enevixAtt9SB/Dy19FEcqVhjFtqagYH3HvTFPZvcBl+4k8
         Tp54yfTQj0kZiI2hTG6g2OsnR9Pofkcoi6FaeAECBoNfoQMzjTywaqz4TOKLCHMgqR/N
         yAkARWSCgysNka5MYGKFvQhMDzJyHCt+icasSQIVj1X4EmsW9zRbDPvVMTrBPc4btzNZ
         TGNGvYk8rSBqAil0dWnqPo1xJkbbS/H59tuzxRaPqssnB/nMl6YB/DzfRWaW6E6C1NSL
         gvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859018; x=1749463818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c37LvNlWl52qBAYfX/7eP3J23YVHzuToqgxYWLWYiXs=;
        b=r1yr1Po471o8X6B4GSxLq8iExOi5CY7BFse7bjktQfpLJOLDrDLyZY/XurNle5Sw5g
         UwivqBjnJ48BlkBAUQKuoQhaoe9WypduTKzcDgJxUqmGy0LvgKF4atg5JKL8vvckKzCx
         VjWL6jglyT2qUxrvL8AmKrp/RpA9GZZMwjLGtrCSP7FtpTmWih4lGozwPk7OjVCcUVXG
         Gz6YFi09ucIWyo+7Nh5RGyXNiMnNOvsjNkpN7fD2MpJI1zg9nDXWIvxeQfkMuRhaaQq3
         T0RySbBLBV6A2AOM2Wrp6nOzL3lOG1gIo4McBtwYyMGQQpzrfgU4l+c10/rkUjEaAhrb
         f+9A==
X-Forwarded-Encrypted: i=1; AJvYcCVPyzgfPcs6wL4AqPdZ76uzv/Bmna+GxQqe845gs4fayVuUinydCFGmhABG07v+czFYCfdgM1w+P1vY1hjCwDDRvKM=@vger.kernel.org, AJvYcCVZPbctNLqIKrFDUlMOxyC2G8/KitpK/u15j5ts0jeNxwW2G9lQ22GDYWzI2V1d+73LA95rkjBTaidI@vger.kernel.org, AJvYcCX6zn3ZYeRVTeDkzT7RJikIbUVop04Aj5h8SGpYef5tGiYiJ5lNQ1EFz2YZ+bNk3KXbqNqHoL1vmzlvPhn8@vger.kernel.org
X-Gm-Message-State: AOJu0YyGlt/jRDHWuVhhjbGH/d7iOaYU0N+teXLxt3X/nohMlNoSk/IO
	tsFwxfBxdTvzeMeRZ9vQxwaSjK6xP2DbzbbY4UtrzRDb76lX41kUyLWZ4cdWiTqUpqRMAiJ54Yw
	Rg4Jd6oL9peW++seGXmWbYoGWvib05ufYRYoY
X-Gm-Gg: ASbGnct4Nm1U9WtWvgfb8jeO3bKDEPH28goffWwniuKP90rGXrjEKgcz8DXtoNbwTx4
	MTFc3GrfLIGDrunA3mvbNVJP/LMUXayfMY+99V8Oosva1N8wTZGnM01DqmsYBcyhHUa/z3cR5sT
	iBzFF65n8jTRvJEanip3t+6C0NEZb/pMso
X-Google-Smtp-Source: AGHT+IEgKL8zfIDI5qTT8HOuKd9YpyA8u9uwtHaeIBHhfWQyeMJjTtPZxE89y1xTcJ7+i1RcaKzDUvLJXUthxip25vA=
X-Received: by 2002:a05:6000:3112:b0:3a4:bac3:2792 with SMTP id
 ffacd0b85a97d-3a4f7a3dc11mr9651708f8f.4.1748859017860; Mon, 02 Jun 2025
 03:10:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530165906.411144-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250602094230.GA3645@pendragon.ideasonboard.com>
In-Reply-To: <20250602094230.GA3645@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 2 Jun 2025 11:09:51 +0100
X-Gm-Features: AX0GCFvU4EN1awcvV6DWq0sPlDw_VVSuNxrtTbJXgz7-s4LPbEB8Tq9WT_VuUrs
Message-ID: <CA+V-a8t__xkMRDrum+DYzg6584y9MmOTuOypC5qzyuW1THigNA@mail.gmail.com>
Subject: Re: [PATCH v6 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Mon, Jun 2, 2025 at 10:42=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, May 30, 2025 at 05:58:59PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
> > VCLK rate instead of the mode clock. The relationship between HSCLK and
> > VCLK is:
> >
> >     vclk * bpp <=3D hsclk * 8 * lanes
> >
> > Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
> > HSFREQ accurately reflects the clock rate set in hardware, leading to
> > better precision in data transmission.
> >
> > Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
> > when computing `hsfreq`. Also, update unit conversions to use correct
> > scaling factors for better clarity and correctness.
> >
> > Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
> > threshold comparisons to use Hz instead of kHz to ensure correct behavi=
or.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v5->v6:
> > - Dropped parentheses around the calculation of `hsfreq_max`.
> > - Changed dev_info() to dev_dbg
> >
> > v4->v5:
> > - Added dev_info() to print the VCLK rate if it doesn't match the
> >   requested rate.
> > - Added Reviewed-by tag from Biju
> >
> > v3->v4:
> > - Used MILLI instead of KILO
> >
> > v2->v3:
> > - No changes
> >
> > v1->v2:
> > - No changes
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 30 +++++++++++--------
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index e8ca6a521e0f..4d4521a231cb 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/math.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_graph.h>
> > @@ -15,6 +16,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/reset.h>
> >  #include <linux/slab.h>
> > +#include <linux/units.h>
> >
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> > @@ -199,7 +201,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mi=
pi_dsi *dsi,
> >       /* All DSI global operation timings are set with recommended sett=
ing */
> >       for (i =3D 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i)=
 {
> >               dphy_timings =3D &rzg2l_mipi_dsi_global_timings[i];
> > -             if (hsfreq <=3D dphy_timings->hsfreq_max)
> > +             if (hsfreq <=3D dphy_timings->hsfreq_max * KILO)
>
> Why don't you modify hsfreq_max to also store the frequency in Hz ? That
> would bring more consistency across the driver.
>
Agreed, I will add a separate patch for this.

> >                       break;
> >       }
> >
> > @@ -258,7 +260,7 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_m=
ipi_dsi *dsi)
> >  static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> >                                 const struct drm_display_mode *mode)
> >  {
> > -     unsigned long hsfreq;
> > +     unsigned long hsfreq, vclk_rate;
> >       unsigned int bpp;
> >       u32 txsetr;
> >       u32 clstptsetr;
> > @@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mip=
i_dsi *dsi,
> >       u32 golpbkt;
> >       int ret;
> >
> > +     ret =3D pm_runtime_resume_and_get(dsi->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     clk_set_rate(dsi->vclk, mode->clock * KILO);
> > +
> >       /*
> >        * Relationship between hsclk and vclk must follow
> >        * vclk * bpp =3D hsclk * 8 * lanes
> > @@ -280,13 +288,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mi=
pi_dsi *dsi,
> >        * hsclk(bit) =3D hsclk(byte) * 8 =3D hsfreq
> >        */
> >       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > -     hsfreq =3D mode->clock * bpp / dsi->lanes;
> > -
> > -     ret =3D pm_runtime_resume_and_get(dsi->dev);
> > -     if (ret < 0)
> > -             return ret;
> > -
> > -     clk_set_rate(dsi->vclk, mode->clock * 1000);
> > +     vclk_rate =3D clk_get_rate(dsi->vclk);
> > +     if (vclk_rate !=3D mode->clock * KILO)
> > +             dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mi=
smatch\n",
> > +                     mode->clock * KILO, vclk_rate);
>
> I would move those 4 lines just below clk_set_rate().
>
Agreed, I will move them in the next version.

Cheers,
Prabhakar

