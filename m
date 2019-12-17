Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E344122BCC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 13:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfLQMjE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 07:39:04 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33206 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727406AbfLQMjE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 07:39:04 -0500
Received: by mail-ot1-f68.google.com with SMTP id b18so5006836otp.0;
        Tue, 17 Dec 2019 04:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LUh0j8xU1Qr9fXtE+2mw/twXvOy9bjYwMRuWrzxT6eQ=;
        b=EGqp9Wfg8QRJSwpL/3FHCCFImWhwvqbzihUigYc8FCp6e0Ul+zDPnsk/W/Km22NW3N
         ndKJcKQM/mqtjOjfU92mMem81l4XSdm5Iaugd3joN38a2uDsqPheTm3juR//j94klKmU
         R3iNS/6eMHwXWM/tsqsxtUoCgfcMy7Y+ApBFW2Md3luVH8JHywKKg6Stn43FLm7tmEJE
         KJNUjLnL0Zy2LUkJPYVrHqOzwmcVh0xRimHxtYjbWA8ddSsTTdL32A3jAlCamUu12DYK
         3shmuhU4gTARrjbRzpJvr5yr9NOnu9/zaDso/54rtV2TWmKMP3Hgjx7Kwiq92gnsMaaC
         hSpQ==
X-Gm-Message-State: APjAAAV8ABUSVTzamD6DIuMixL/VFXngkyC9EBHvcy6/X9uM6o84qryR
        5yXKPaI/T6EN7VV6fkC630UCn0nwMK+yXWFSDA8=
X-Google-Smtp-Source: APXvYqymQtdXQIA9dI50I0zDHkQvsxWBvf/GOqxNthXzUoE+3dKDkD4aXvjDConIraGDEKG0eShllvgWTqpNdNsUfFU=
X-Received: by 2002:a9d:6c81:: with SMTP id c1mr38348507otr.39.1576586342848;
 Tue, 17 Dec 2019 04:39:02 -0800 (PST)
MIME-Version: 1.0
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com> <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdUE0O9_8g02f2ABiV8SSMXNJB9S9e89p0OJKnTvx8MO9g@mail.gmail.com> <TY1PR01MB17705FC08F72875484DF2208C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB17705FC08F72875484DF2208C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Dec 2019 13:38:51 +0100
Message-ID: <CAMuHMdVqHekyeOaHwpFyG5buNZp-XmvGizqZ=Gbg40_=NL+s2A@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder" support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Tue, Dec 17, 2019 at 1:31 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vger.kernel.org> On Behalf Of Geert Uytterhoeven
> > Sent: 17 December 2019 12:21
> > Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder" support
> >
> > On Tue, Dec 17, 2019 at 12:03 PM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Sent: 13 December 2019 17:11
> > > > Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder" support
> > > >
> > > > On Wed, Nov 13, 2019 at 03:51:25PM +0000, Fabrizio Castro wrote:
> > > > > Add support for transparent LVDS decoders by adding a new
> > > > > compatible string ("lvds-decoder") to the driver.
> > > > > This patch also adds member connector_type to struct lvds_codec,
> > > > > and that's because LVDS decoders have a different connector type
> > > > > from LVDS encoders. We fill this new member up with the data
> > > > > matching the compatible string.
> > > > >
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> > > > > --- a/drivers/gpu/drm/bridge/lvds-codec.c
> > > > > +++ b/drivers/gpu/drm/bridge/lvds-codec.c

> > > > > @@ -65,6 +67,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
> > > > >     if (!lvds_codec)
> > > > >             return -ENOMEM;
> > > > >
> > > > > +   lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
> > > >
> > > > I'm now getting a compilation failure here:
> > > >
> > > > drivers/gpu/drm/bridge/lvds-codec.c: In function ‘lvds_codec_probe’:
> > > > drivers/gpu/drm/bridge/lvds-codec.c:68:31: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> > > >   lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
> > > >                                ^
> > > >
> > > > The fix should be simple:
> > > >
> > > >       lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
> > > >
> > > > I'm bothered by the fact that I've compiled this before without any
> > > > issue, so this really puzzles me. Do you get the same warning ?
> > >
> > > The warning appears when compiling for arm64, understandably so.
> > > We must have compiled this for arm only the first time around.
> > >
> > > I think the right way to solve this is to either cast to (u32)(uintptr_t) or (u32)(unsigned long).
> >
> > Just casting to uintptr_t should be sufficient.
>
> It should be sufficient for the compiler, but I have seen examples where people
> preferred to be explicit, like in:
> drivers/mailbox/mtk-cmdq-mailbox.c
> drivers/leds/leds-pm8058.c
>
> Since the kernel is increasing its tightness with respect to warnings, I personally prefer
> (u32)(uintptr_t), even though not strictly necessary, but I am fine with (uintptr_t) if you
> don't like (u32)(uintptr_t).

It depends. I try to have as few casts as possible ("casts are evil").

While adding the extra (u32) cast makes it clearer that the intended
result is a u32 (for now), it will cause silent truncation on 64-bit if
connector_type is ever enlarged to unsigned long, and larger values are
used.

In this particular case this is unlikely, though, as unsigned long would
still be 32-bit on 32-bit platforms, so the larger values cannot be
used.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
