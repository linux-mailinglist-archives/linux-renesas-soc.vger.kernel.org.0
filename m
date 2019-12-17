Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17BF9122B50
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 13:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfLQMVW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 07:21:22 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40806 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfLQMVW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 07:21:22 -0500
Received: by mail-oi1-f196.google.com with SMTP id 6so5208712oix.7;
        Tue, 17 Dec 2019 04:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/CDn5JbW1WME5Sd0iWMM5OOfuGmhgzxYpnO9v9Mx5mM=;
        b=HJcNqQlILxglXUlO1O27t/wvF2yBcUqLl97D/JOrMq/jOZ8hmJitdycleokvqzNhFk
         4c2tCPRUAss9+U7K8yVgQpJxKlUkI+Rhxy6mVQOOL6kuKOYMMYbOJHXGj7HKnDZSoiTi
         UzcCEq2HImbVbxNO1yGjskM5qQRFx96UNQaXqBEta0gpQ+ipwS66/OhlAVGtrjgi4MqG
         pYfYSMgKKYR3G19StXI1SkuDCPmi6ZGs2FCiLASwtH15CaiUNtf5ioCrWd7OHwdk4TMC
         PrDiLx9CNmsO63L3jEucxoyC5F+Cf52566g0eDPF/I4HKSsCN/BjpyLvLTxark8XmYtN
         58ew==
X-Gm-Message-State: APjAAAUoLG7PkfZiOo+MXD5zzukep1SsE1UVGkkHSUbBJlrSglbU87f6
        u1nGZdwabFoH/koeVEzvT6wgMG9odDBqqoIu16w=
X-Google-Smtp-Source: APXvYqzPSr0CwtK4yNcj7K0g++lVwKJ5FPqChcU+kVIEctdo1aMJqmdrkSGFU/KoIHB0qDg427vvgcfu8cIneKudg3o=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr208491oia.148.1576585281148;
 Tue, 17 Dec 2019 04:21:21 -0800 (PST)
MIME-Version: 1.0
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213171038.GH4860@pendragon.ideasonboard.com> <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770DEDFA6050EA77AA218F8C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Dec 2019 13:21:10 +0100
Message-ID: <CAMuHMdUE0O9_8g02f2ABiV8SSMXNJB9S9e89p0OJKnTvx8MO9g@mail.gmail.com>
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

On Tue, Dec 17, 2019 at 12:03 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 13 December 2019 17:11
> > Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder" support
> >
> > On Wed, Nov 13, 2019 at 03:51:25PM +0000, Fabrizio Castro wrote:
> > > Add support for transparent LVDS decoders by adding a new
> > > compatible string ("lvds-decoder") to the driver.
> > > This patch also adds member connector_type to struct lvds_codec,
> > > and that's because LVDS decoders have a different connector type
> > > from LVDS encoders. We fill this new member up with the data
> > > matching the compatible string.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > ---
> > > v3->v4:
> > > * New patch
> > > ---
> > >  drivers/gpu/drm/bridge/lvds-codec.c | 19 ++++++++++++++++---
> > >  1 file changed, 16 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> > > index b5801a2..c32e125 100644
> > > --- a/drivers/gpu/drm/bridge/lvds-codec.c
> > > +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> > > @@ -7,6 +7,7 @@
> > >  #include <linux/gpio/consumer.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of.h>
> > > +#include <linux/of_device.h>
> > >  #include <linux/of_graph.h>
> > >  #include <linux/platform_device.h>
> > >
> > > @@ -17,6 +18,7 @@ struct lvds_codec {
> > >     struct drm_bridge bridge;
> > >     struct drm_bridge *panel_bridge;
> > >     struct gpio_desc *powerdown_gpio;
> > > +   u32 connector_type;
> > >  };
> > >
> > >  static int lvds_codec_attach(struct drm_bridge *bridge)
> > > @@ -65,6 +67,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
> > >     if (!lvds_codec)
> > >             return -ENOMEM;
> > >
> > > +   lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
> >
> > I'm now getting a compilation failure here:
> >
> > drivers/gpu/drm/bridge/lvds-codec.c: In function ‘lvds_codec_probe’:
> > drivers/gpu/drm/bridge/lvds-codec.c:68:31: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> >   lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
> >                                ^
> >
> > The fix should be simple:
> >
> >       lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
> >
> > I'm bothered by the fact that I've compiled this before without any
> > issue, so this really puzzles me. Do you get the same warning ?
>
> The warning appears when compiling for arm64, understandably so.
> We must have compiled this for arm only the first time around.
>
> I think the right way to solve this is to either cast to (u32)(uintptr_t) or (u32)(unsigned long).

Just casting to uintptr_t should be sufficient.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
