Return-Path: <linux-renesas-soc+bounces-9876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A649A401C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 15:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABB911C2382A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 13:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C4DB667;
	Fri, 18 Oct 2024 13:37:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737001D545
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258627; cv=none; b=XHvW6F3CrMH+Pbz7pgemK3aZY8ctrAtkgMQzFswQllhvgMA0nYyBx75GqYwU0FUOgmumJjMK8N8JDVfIw362OA2dfHyTbHD5L39hPlAG0Fd60uRxhSvW1dpTLoEfgbvHF4qfMqjVMUgujTQ19RMlhTBCiM/q648Ybo+yr3J2RZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258627; c=relaxed/simple;
	bh=fjRRErkBawXaOZg8aor4YQJXdmASRWePPTr/orTdKAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POlLUnUon3aMqKsoIXe6U44BEreV3+qfzbbV+Rht58flX1xCgpQ7dWWuB8KBHuKzDWKN9E3o52MrpGr+ntVt0hO9Nu0Ef09vN0NI6ePLQy3jN/AXTZFrAJULx5aRrKKrBcJtToggK1FzZQr6FDAl1FC3fxithUHsBK35izqNhCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e2915f00c12so2032351276.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 06:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258623; x=1729863423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXhQnSu+A17WdIVytDggYZkiucU4Rwu257I4oDCyVvY=;
        b=kpezpRKB5dUO/w5wOwHsGpXZ5EXW702d+Bm3twZ25FsoYyfIB+46f5lcbicgXNkHi/
         ArNeK80yK4rjRbNR4KcPbnpco5i+VTKzTx7TuSvXS3SenI1+7hUO2yHAqpYfwPaZQgLj
         9hmQE+ArMc+bIE7n0EXRsYKEE39CeoXSTaMLMFZgO8MzMABvz2FuDctt01pC0C49MRDH
         TQjWv9fPdA8M/ClVsOvbwfHnswSAAj1S54QupnahfCMb5MYf1hLU9fpba7TGN5ZCc8pJ
         4X5l/yhENlhGO8vneoT0YggNyJZd5UyIi2PyXcXQQl7yjS4fLYoevaluGqXcWjBQJIHe
         rouw==
X-Forwarded-Encrypted: i=1; AJvYcCXyv7oeh1xs0AV1OCKgG4wZau6DGryMLVfl0oy89E0LPoQJzdU4OZA4RIwJBOGMsvhciwA+gMuGlTipEr5f1IJmFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDQkt2l0Qxn6UmKXEVQGm6OkVJum8vGfQ98NSRJI2pFagEqabn
	zze7o7qJCT7Wp6Ugv6jb3Rw/J89YnbpFOMAk2rW1AmibLfABAgiNY5gIyoIh
X-Google-Smtp-Source: AGHT+IGK2SyB3PbMCSekIPnzop3m4hVDwLg7YlememkckAh7qICAaSnH0Q8kC7tTNjam6+lxZ4uS6A==
X-Received: by 2002:a05:690c:1e:b0:6e2:a962:d7ec with SMTP id 00721157ae682-6e5bfbe02a5mr22276607b3.6.1729258622954;
        Fri, 18 Oct 2024 06:37:02 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5bffd4256sm2958277b3.11.2024.10.18.06.37.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 06:37:01 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e3a97a6010so26205507b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 06:37:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUu8pQGtYkmVxX15C0F8fdkb61lthdYXAvMMX5JfELTUTpPMfcGEEoPN+ytbyfoS/AA0F+vRs8dwHoX/315oFXMzQ==@vger.kernel.org
X-Received: by 2002:a05:690c:d8a:b0:6e2:ef1:2558 with SMTP id
 00721157ae682-6e5bfbdb7a2mr20237897b3.8.1729258620427; Fri, 18 Oct 2024
 06:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
In-Reply-To: <20241018131035.GA20602@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Oct 2024 15:36:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
Message-ID: <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Douglas Anderson <dianders@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

CC GregKH

On Fri, Oct 18, 2024 at 3:10=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven wrote:
> > Each bridge instance creates up to four auxiliary devices with differen=
t
> > names.  However, their IDs are always zero, causing duplicate filename
> > errors when a system has multiple bridges:
> >
> >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_=
sn65dsi86.gpio.0'
> >
> > Fix this by using a unique instance ID per bridge instance.
>
> Isn't this something that should be handled by the AUX core ? The code
> below would otherwise need to be duplicated by all drivers, which seems
> a burden we should avoid.

According to the documentation, this is the responsibility of the caller
https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus=
.h#L81
I believe this is the same for platform devices.
See also the example at
https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus=
.h#L116

Note: the platform bus supports PLATFORM_DEVID_AUTO, but the auxiliary
bus does not.

> > Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI=
-to-eDP bridge into sub-drivers")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > /sys/bus/auxiliary/devices
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.0
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.0
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.0
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.0
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.1
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.1
> > =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.1
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index 9e31f750fd889745..8f6ac48aefdb70b3 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/gpio/driver.h>
> >  #include <linux/i2c.h>
> > +#include <linux/idr.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/module.h>
> >  #include <linux/of_graph.h>
> > @@ -168,6 +169,7 @@
> >   * @pwm_enabled:  Used to track if the PWM signal is currently enabled=
.
> >   * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PW=
M.
> >   * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
> > + * @id:           Unique instance ID
> >   */
> >  struct ti_sn65dsi86 {
> >       struct auxiliary_device         *bridge_aux;
> > @@ -202,8 +204,11 @@ struct ti_sn65dsi86 {
> >       atomic_t                        pwm_pin_busy;
> >  #endif
> >       unsigned int                    pwm_refclk_freq;
> > +     int                             id;
> >  };
> >
> > +static DEFINE_IDA(ti_sn65dsi86_ida);
> > +
> >  static const struct regmap_range ti_sn65dsi86_volatile_ranges[] =3D {
> >       { .range_min =3D 0, .range_max =3D 0xFF },
> >  };
> > @@ -488,6 +493,7 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn=
65dsi86 *pdata,
> >               return -ENOMEM;
> >
> >       aux->name =3D name;
> > +     aux->id =3D pdata->id;
> >       aux->dev.parent =3D dev;
> >       aux->dev.release =3D ti_sn65dsi86_aux_device_release;
> >       device_set_of_node_from_dev(&aux->dev, dev);
> > @@ -1889,6 +1895,13 @@ static int ti_sn65dsi86_parse_regulators(struct =
ti_sn65dsi86 *pdata)
> >                                      pdata->supplies);
> >  }
> >
> > +static void ti_sn65dsi86_devm_ida_free(void *data)
> > +{
> > +     struct ti_sn65dsi86 *pdata =3D data;
> > +
> > +     ida_free(&ti_sn65dsi86_ida, pdata->id);
> > +}
> > +
> >  static int ti_sn65dsi86_probe(struct i2c_client *client)
> >  {
> >       struct device *dev =3D &client->dev;
> > @@ -1903,6 +1916,17 @@ static int ti_sn65dsi86_probe(struct i2c_client =
*client)
> >       pdata =3D devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERN=
EL);
> >       if (!pdata)
> >               return -ENOMEM;
> > +
> > +     ret =3D ida_alloc(&ti_sn65dsi86_ida, GFP_KERNEL);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     pdata->id =3D ret;
> > +
> > +     ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_devm_ida_free,=
 pdata);
> > +     if (ret)
> > +             return ret;
> > +
> >       dev_set_drvdata(dev, pdata);
> >       pdata->dev =3D dev;
> >

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

