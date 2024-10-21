Return-Path: <linux-renesas-soc+bounces-9919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8D59A5BDA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 08:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62384B2214F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 06:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B381D04BB;
	Mon, 21 Oct 2024 06:58:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E752415575F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 06:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729493929; cv=none; b=fNx6EZRD/od4yli7RR9xxKyapfq/lVWmdhUasm5+JSTQ1yshjmTeWFt1/GhB5K9tVB6FO3CF3vCKUAG9Ifvo5+lrzCQ7r4N96RE2uk945+JG57nRieb31YlFuon5+PPywtVXER6ijyxTEeHZO0VYGrfEVbn6cmJj03QyZaJ37Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729493929; c=relaxed/simple;
	bh=n1gR+wdZlqXZX+ZlgWmhBVPvsFpqXW/r5pZUgWwHdvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ayvM3DEcOcTfyBPOgPHxqQ2lire2BBVkyXmYdzNJaoNiNYm6uIJQQtR5o/Cf78jdra7wQMsPoiGd0X5Pref5+jXnDErzoGN5xqrC9qCYMGs5TzUd+O5EWi5LyyHuUFAr9SSOMfVoRkXh0j4N2+a7qsY1tDYaFsPZqHWG0OSZjlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e2972abc807so3542454276.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Oct 2024 23:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729493925; x=1730098725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mw4gCFszl8BI2I4oOchG1aUb7I960rlClLXb8gkgCdU=;
        b=fxBPbfbfnu+n6Kz3gdtuPui1NBjp7PkdqTaEWMLeMx+56CMqh3Ghyph2Jp8LpX2Zmm
         mwGSRmuKNk+YJKE3JeQwr0yAQfBPmHrZjsqTP9NWAalHeDGymNUqyJZZbcWN9kiaq4Lg
         G/17JUJEe+KAVOzjvP9HXepaLNJvcrOSphEmTM6dVsyYVWCjPZJDM/g2BEEUulFRMvzl
         kCGddGYCQCMbAM7Mk/u4UVleBHSpIEatUx/7TLMK639r6XbI4o1Mo9jqj88hOPXBsVUB
         l8DfDXzQHiIOh//Fy3r5X+8I5WiQkHsIsuQwy/uYkewc5d5NDRuruhnlZP9EzHMQmdES
         XGaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCVXQdwqksoA/y0WHdWgDVEtcqYUBgltkcQE9qW2CQB1AKsWhXh80GxrHdX39Jl2IK6zFPqIop4Cax49f/8ntdLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMqQOgTHOvJWI34yg3rWZ7S+qTkZpbK+I3Iue2JXesQatdu2r0
	Xp+UG1qduabwrB6g7xWJDt/ZB3oyzV33Wx+qy0/LrKcZMEBoECAwDM02FUHr
X-Google-Smtp-Source: AGHT+IFlzqRVkaGmIo7n/5Y9Z6xgwwW0mweul2qOE1jNBasd1Ir7pIs9WEN5YkfBZPoADN6iET5TsA==
X-Received: by 2002:a05:690c:7204:b0:6db:c7a8:b0c8 with SMTP id 00721157ae682-6e5bfc2c533mr95649177b3.15.1729493924861;
        Sun, 20 Oct 2024 23:58:44 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ad5919sm5678247b3.66.2024.10.20.23.58.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 23:58:43 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e34339d41bso35503077b3.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Oct 2024 23:58:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPajqR6Rp2gaEOl7XH/gL9unxMNupsJxuzJpem0RoYOqCWOk/Xi5lR7Iblp+AcZiOgaGQ9/cl+qHdqrXIqMmsXvQ==@vger.kernel.org
X-Received: by 2002:a05:690c:4b01:b0:6e2:1062:9b90 with SMTP id
 00721157ae682-6e5bfd89b4dmr103732537b3.44.1729493923434; Sun, 20 Oct 2024
 23:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com> <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
 <2024101855-judo-tattered-bc3c@gregkh> <20241018142522.GA28934@pendragon.ideasonboard.com>
 <2024101837-crushed-emphasis-b496@gregkh> <20241020143629.GC28934@pendragon.ideasonboard.com>
 <2024102119-oversweet-labored-aa07@gregkh>
In-Reply-To: <2024102119-oversweet-labored-aa07@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Oct 2024 08:58:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
Message-ID: <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Douglas Anderson <dianders@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, Oct 21, 2024 at 8:39=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> On Sun, Oct 20, 2024 at 05:36:29PM +0300, Laurent Pinchart wrote:
> > On Fri, Oct 18, 2024 at 04:31:21PM +0200, Greg KH wrote:
> > > On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart wrote:
> > > > On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > > > > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeven wrot=
e:
> > > > > > On Fri, Oct 18, 2024 at 3:10=E2=80=AFPM Laurent Pinchart wrote:
> > > > > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven =
wrote:
> > > > > > > > Each bridge instance creates up to four auxiliary devices w=
ith different
> > > > > > > > names.  However, their IDs are always zero, causing duplica=
te filename
> > > > > > > > errors when a system has multiple bridges:
> > > > > > > >
> > > > > > > >     sysfs: cannot create duplicate filename '/bus/auxiliary=
/devices/ti_sn65dsi86.gpio.0'
> > > > > > > >
> > > > > > > > Fix this by using a unique instance ID per bridge instance.
> > > > > > >
> > > > > > > Isn't this something that should be handled by the AUX core ?=
 The code
> > > > > > > below would otherwise need to be duplicated by all drivers, w=
hich seems
> > > > > > > a burden we should avoid.
> > > > > >
> > > > > > According to the documentation, this is the responsibility of t=
he caller
> > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/a=
uxiliary_bus.h#L81
> > > > > > I believe this is the same for platform devices.
> > > > > > See also the example at
> > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/a=
uxiliary_bus.h#L116
> > > > > >
> > > > > > Note: the platform bus supports PLATFORM_DEVID_AUTO, but the au=
xiliary
> > > > > > bus does not.
> > > > >
> > > > > Yes, it does not as it's up to the caller to create a unique name=
, like
> > > > > your patch here does.  I'd argue that platform should also not do
> > > > > automatic device ids, but that's a different argument :)
> > > >
> > > > __auxiliary_device_add() creates the device name with
> > > >
> > > >   dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev->id);
> > > >
> > > > I'm not calling for a PLATFORM_DEVID_AUTO-like feature here, but
> > > > shouldn't the first component of the device name use the parent's n=
ame
> > > > instead of the module name ?
> > >
> > > Why would the parent's name not be the module name?  That name is
> > > guaranteed unique in the system.  If you want "uniqueness" within the
> > > driver/module, use the name and id field please.
> > >
> > > That's worked well so far, but to be fair, aux devices are pretty new=
.
> > > What problem is this naming scheme causing?
> >
> > Auxiliary devices are created as children of a parent device. When
> > multiple instances of the same parent type exist, this will be reflecte=
d
> > in the /sys/devices/ devices tree hierarchy without any issue. The
> > problem comes from the fact the the auxiliary devices need a unique nam=
e
> > for /sys/bus/auxialiary/devices/, where we somehow have to differenciat=
e
> > devices of identical types.
> >
> > Essentially, we're trying to summarize a whole hierarchy (path in
> > /sys/devices/) into a single string. There are different ways to solve
> > this. For platform devices, we use a device ID. For I2C devices, we use
> > the parent's bus number. Other buses use different schemes.
> >
> > Geert's patch implements a mechanism in the ti-sn65dsi86 driver to
> > handle this, and assign an id managed by the parent. In a sense we coul=
d
> > consider this to be similar to what is done for I2C, where the bus
> > number is also a property of the parent. However, the big difference is
> > that the I2C bus number is managed by the I2C subsystem, while here the
> > id is managed by the ti-sn65dsi86 driver, not by the auxiliary device
> > core. This would require duplicating the same mechanism in every single
> > driver creating auxiliary devices. This strikes me as a fairly bad idea=
.
> > The problem should be solved by the core, not by individual drivers.
>
> The "id" is just a unique number, it is "managed" by the thing that is
> creating the devices themselves, not the aux core code.  I don't see why
> the i2c bus number has to match the same number that the ti driver
> creates, it could be anything, as long as it doesn't match anything else
> currently created by that driver.

Laurent does not say it has to match the i2c bus number.
He does think the auxilliary bus should provide a mechanism to
allocate these IDs (e.g. usin g AUX_DEVID_AUTO?).

However, using i2c_client->adapter->nr instead of ida_alloc()
in the TI driver does sound like a good idea to me...

> If we had the aux core code create the id, it would just use a unique
> counter, and that would not reflect any mapping to anything, so I don't
> see how that is any different here.

And then we would get something like:

/sys/bus/auxiliary/devices
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.0
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.2
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.3
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.5
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.6
=E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.7

Which is similar to the first approach I tried (calling ida_alloc() in
ti_sn65dsi86_add_aux_device() instead of ti_sn65dsi86_probe()).

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

