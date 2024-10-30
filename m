Return-Path: <linux-renesas-soc+bounces-10200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 453239B600B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 11:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C668E283510
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 10:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FEA1E1C2B;
	Wed, 30 Oct 2024 10:25:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880F31E25EA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Oct 2024 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730283958; cv=none; b=QFmMUmNVqhUthdjQBANresn8UKgzSNIuvLyXo1pg0bRPVQ0gue0BSD0izLyCYCGjL9E5S0q0jCr+BT5TTvK66coESmvX6hJHIWcwOBgYF8QTeQzUTgH/oG8NZjM3+pEvACHceayol+UbnAZXbO+xST0TcpMTynILWLRU8cco0Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730283958; c=relaxed/simple;
	bh=HpQEbl5m6J5ikkSgDVyuNjKSWRpbL9C6SIh9MiWBjzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6VfSBdkGJMK+aXdiiDnEnyNHW/FG36oc00cN3E75Fw9XonwvhzdCOYsdvhNaWP3SSLe9ZhSRpduxzOFWa/aDm42xjB6fwXpc4RU8cPGxu5Ux41zxKMGpGIseMEoNPq+az0IJ0cJ/VfGiXpMAoXimXKq65FBslJdqiPB3TaosV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e35bf59cf6so7309487b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Oct 2024 03:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730283953; x=1730888753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTVtYSQqbvyHjwx/lkmZrqb0a0XoJO0seA6apsOTsAU=;
        b=JzUl7Rd+A3IRc8ETR7KMwg90TGKj4mOgY9Pby79n3OE78M+CasPDgKc8twoDb3HfeF
         Y2vPdoMhNbFZyYIbXXBmKfdgZ6TySV5kRCqt+a7uY8jCbccTUeJrv6Z58GA26T0QZhHH
         QeWUmAGNKrKbzQyBv/3K8FdL4HI+3/zQjjFl9KjCOvqBmhIo+BGhzZ3c7R8s2ciTooYq
         XSCAVyijAZKvMD5rzIXfh5DrMhZhTfcX/J5vcdf598OhmahpLYIsW2v3oWy6pexpnLR9
         fkK1aebJfXDWmy5bCBBngNmiA6BfDI2xIyOB/RQlzDdlh95nFy4Ly+BjA6w8CwDLURTC
         SH9A==
X-Forwarded-Encrypted: i=1; AJvYcCVqpsAcOizyMdiZREWeCA1VRr1VtFVdzP/NIeJaF9V8osIqu87ng3FMUlkfcWGlqF+CqoNI2GA0N82o0ZeE3XtCog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK+gwy1avRXuc73H4ds4Te60t2UIAGzy+XT3H+Irs/U4Yz9SV+
	/961HRWR67Zx099Gt6ScchF79zA0VnMjrCWd1uE3Ueg88t6KBSHcHE5oovdz
X-Google-Smtp-Source: AGHT+IHs/6gIfmC/xHRFH//rJ2s54b1OIAhqrCPjLsHvZwsqB0YGnXg2AY5yJZ3ySVrIputsKlOosg==
X-Received: by 2002:a05:690c:6e8b:b0:6e3:2b0b:104f with SMTP id 00721157ae682-6ea3e8f4eb9mr13030457b3.9.1730283953526;
        Wed, 30 Oct 2024 03:25:53 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6bafe0asm23778657b3.9.2024.10.30.03.25.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 03:25:52 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e35bf59cf6so7309267b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Oct 2024 03:25:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8LqkhDJrnXlKX4vsW0hrNx9INv84GsGNY4S1jPPKeD0mJNq838iSVT1dC5ZIHtsyWavSbecP1KuE561UDfdZqiw==@vger.kernel.org
X-Received: by 2002:a05:690c:c84:b0:6e2:611:7abd with SMTP id
 00721157ae682-6ea2c218013mr45054217b3.20.1730283952632; Wed, 30 Oct 2024
 03:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2024101837-crushed-emphasis-b496@gregkh> <20241020143629.GC28934@pendragon.ideasonboard.com>
 <2024102119-oversweet-labored-aa07@gregkh> <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh> <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
 <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
 <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
 <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
 <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com> <mmmy4mmk435m6i4ic7aelkggzklrwv34vi7yam6mmasadffv2l@fi6ralq5e6vv>
In-Reply-To: <mmmy4mmk435m6i4ic7aelkggzklrwv34vi7yam6mmasadffv2l@fi6ralq5e6vv>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 11:25:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV3sEPW+k_ObTxQiLPdSsNpMRKwtUvtRt_6njy=WW4N4Q@mail.gmail.com>
Message-ID: <CAMuHMdV3sEPW+k_ObTxQiLPdSsNpMRKwtUvtRt_6njy=WW4N4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Mon, Oct 28, 2024 at 2:34=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Tue, Oct 22, 2024 at 07:37:01AM -0700, Doug Anderson wrote:
> > On Tue, Oct 22, 2024 at 12:12=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > > > > > > However, using i2c_client->adapter->nr instead of ida_alloc=
()
> > > > > > > > in the TI driver does sound like a good idea to me...
> > > > > > >
> > > > > > > Great!
> > > > >
> > > > > > With the I2C adapter numbers, that becomes:
> > > > > >
> > > > > >     /sys/bus/auxiliary/devices
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.1
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.1
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.1
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.4
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.4
> > > > > >     =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.4
> > > > > >
> > > > > > > adapter->nr instead like other aux subsystems already do.
> > > > >
> > > > > Unfortunately the devil is in the details, as usual: there can be
> > > > > multiple instances of the sn65dsi86 bridge on a single I2C bus,
> > > > > so adapter->nr is not guaranteed to generate a unique name.
> > > >
> > > > In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
> > > > chip is always at bus address 0x2d so you can't have more than one =
on
> > > > the same bus. Unless you added something funky atop it (like a mux =
of
> > > > some sort) you might be OK.
> > >
> > > It's 0x2c on mine ;-)
> > >
> > >     8.5.1 Local I2C Interface Overview
> > >     The 7-bit device address for SN65DSI86 is factory preset to 01011=
0X
> > >     with the least significant bit being determined by the ADDR contr=
ol
> > >     input.
> >
> > Doh! I missed that in my search of the doc. I guess because they
> > decided to specify the address in binary in that part so my searching
> > for both the 7-bit and 8-bit I2C address didn't trigger. Oh well.
> >
> > > > > Changing the auxiliary bus to use the parent's name instead of th=
e
> > > > > module name, as suggested by Laurent, would fix that.
> > > >
> > > > Right. On my system dev_name() of the sn65dsi86 device is "2-002d".=
 If
> > > > we had a second on i2c bus 4, we'd have:
> > > >
> > > >     /sys/bus/auxiliary/devices
> > > >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.gpio.0
> > > >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.pwm.0
> > > >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.aux.0
> > > >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.bridge.0
> > > >     =E2=94=9C=E2=94=80=E2=94=80 4-002d.gpio.0
> > > >     =E2=94=9C=E2=94=80=E2=94=80 4-002d.pwm.0
> > > >     =E2=94=9C=E2=94=80=E2=94=80 4-002d.aux.0
> > > >     =E2=94=94=E2=94=80=E2=94=80 4-002d.bridge.0
> > > >
> > > > ...and I think that's guaranteed to be unique because all the i2c
> > > > devices are flat in "/sys/bus/i2c/devices".
> > >
> > > Correct.
> >
> > So given everything, using the dev_name() of the "parent" sounds
> > pretty good and seems like it addresses everyone's concerns. Was there
> > a part of the conversation where someone pointed out problems with it
> > that I missed? Is the next step to post a patch implementing that?
> > It'll change sysfs paths and dev names for everyone using AUX bus, but
> > presumably that's OK?
>
> It also requires changing in the way the auxiliary_match_id() works.
> Currently matching is done using modname + ID.

Right, so just using the parent's name instead of modname won't work,
as the former is not a fixed string.

> So, maybe using MODNAME.NAME.parent-name.ID is better (e.g.
> ti_sn65dsi86.gpio.2-002d.1). It will still require changes to the
> match_id function, but they won't be that intrusive (one just has to
> skip two parts of the name instead of skipping just one).

IMHO this is becoming too complex. What if the parent's name contains
a period?

So just using ida_alloc() in the caller seems like the most
straight-forward solution.

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

