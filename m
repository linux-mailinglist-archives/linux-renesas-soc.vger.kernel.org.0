Return-Path: <linux-renesas-soc+bounces-9959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9D49A9A92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 09:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC4802825F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 07:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9DE450EE;
	Tue, 22 Oct 2024 07:12:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD411811EB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2024 07:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581126; cv=none; b=fIyOVewulmmUCV1EPzSB4c8NMoxA/G/XQAhC1aTXf10eQAltUrFnoBSL1EMGPAEtT08VVeXZ8D/+evttVrrLRQU09QSqccbCCZxuS3LS7UEtaBZE0Ol3jAPGnm3U7f3HEsFa6F2A5vkgcT0IwdpaKfYNGJOhesCENv4i9r62l6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581126; c=relaxed/simple;
	bh=ZDJDzvOHvmnvKM7yghiQGW2QjdJk7Bl4Iy5qf5/21mU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlglbDCpQUWS+2BPn5nZA5uiEXWIbiB4CMei0s/+Wf/hxul9lFBOyXVaalzVuVA/RiWLoadrdbfvL0n+gaKwSHInw40Dyc6LCLhPCoSIVCi14tjsCUMLv8m5/x6BfBy8HTlmAS+18xO+5zE9KPvgcGbufhPiVcZ8jDJfkwmZ+Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e5ef7527deso24191807b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2024 00:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729581123; x=1730185923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVQdFAeVpsUga9FGk0oPTUCDCiNtszo7965bicRHB8I=;
        b=mc+EfCy9z2o4+hXQG1yBKwYQZtkkltdql7Ro36VOUcQ1Xm7YhH686glql/g1kSM3a/
         YXsROj7njF5+YjB1YbD+rtLaOxHGRWTr4bNnCPsu3v7wsnl0S2fRwZveVoKDTQ76mD2Q
         PnmsgF/4fV4f7/D4EotcCmxm6VtBjoJrgsdlNbWyntyPPws4D39vcixOaiTWYCYFF+ay
         9ios1MTZP0XeFKH72iM/F4M6ej3vXGWFIV7eUqAIMwFjWO3QDD6jwGRx/iPDJV5BLf2e
         MKX+VrhB3TBrLPtkHGA/JmgRrXLPGXjU3YBNeo2ziD5Y4nDpBS9F6weSNLvBeU1a2Q2E
         1ALQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+WY/iWeRruLKZaOFbxERdNmUdgJnJJioaUqIOkNxexjEjO0yX4WyUlvJQb8G3h5iWnMOw5MmWimVlARilOhdWOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsFEMZLc0hT4GG1ShQA+kD7bamYpkUYnYnSLf4GB8Z84I7Wrj6
	bnvh5W4hx6gm/3+Ap8iWKRTmEiGoe1zBH09GLzqu05VCl2SYMvwCPSkxlgXT
X-Google-Smtp-Source: AGHT+IFVQSAt7EJrznrWKdOD4d4q9NAZTD01Fql/tgy7bAT9wFt3qx9UuFD0w+xEH9AoT/j0X/9qTQ==
X-Received: by 2002:a05:690c:4c0b:b0:6e3:4190:ab45 with SMTP id 00721157ae682-6e7d820dc5cmr17088437b3.15.1729581123135;
        Tue, 22 Oct 2024 00:12:03 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5a4d16dsm9781027b3.35.2024.10.22.00.12.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 00:12:02 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e2772f7df9so44341537b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2024 00:12:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzj6EN5q1cKea82rEUkO5ELBpQpTEyAWffzAm8KSF8a8vTbpyjldsffggukTVXQd8NYIQl8JtoNnPd0rurrDRtCQ==@vger.kernel.org
X-Received: by 2002:a05:690c:c0e:b0:6e2:985:f4df with SMTP id
 00721157ae682-6e7d82e594bmr17577917b3.44.1729581122444; Tue, 22 Oct 2024
 00:12:02 -0700 (PDT)
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
 <2024102119-oversweet-labored-aa07@gregkh> <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh> <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
 <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com> <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
In-Reply-To: <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Oct 2024 09:11:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
Message-ID: <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Doug Anderson <dianders@chromium.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Tue, Oct 22, 2024 at 2:28=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
> On Mon, Oct 21, 2024 at 1:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, Oct 21, 2024 at 10:23=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Mon, Oct 21, 2024 at 9:27=E2=80=AFAM Greg KH <gregkh@linuxfoundati=
on.org> wrote:
> > > > On Mon, Oct 21, 2024 at 08:58:30AM +0200, Geert Uytterhoeven wrote:
> > > > > On Mon, Oct 21, 2024 at 8:39=E2=80=AFAM Greg KH <gregkh@linuxfoun=
dation.org> wrote:
> > > > > > On Sun, Oct 20, 2024 at 05:36:29PM +0300, Laurent Pinchart wrot=
e:
> > > > > > > On Fri, Oct 18, 2024 at 04:31:21PM +0200, Greg KH wrote:
> > > > > > > > On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart =
wrote:
> > > > > > > > > On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > > > > > > > > > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterh=
oeven wrote:
> > > > > > > > > > > On Fri, Oct 18, 2024 at 3:10=E2=80=AFPM Laurent Pinch=
art wrote:
> > > > > > > > > > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uyt=
terhoeven wrote:
> > > > > > > > > > > > > Each bridge instance creates up to four auxiliary=
 devices with different
> > > > > > > > > > > > > names.  However, their IDs are always zero, causi=
ng duplicate filename
> > > > > > > > > > > > > errors when a system has multiple bridges:
> > > > > > > > > > > > >
> > > > > > > > > > > > >     sysfs: cannot create duplicate filename '/bus=
/auxiliary/devices/ti_sn65dsi86.gpio.0'
> > > > > > > > > > > > >
> > > > > > > > > > > > > Fix this by using a unique instance ID per bridge=
 instance.
> > > > > > > > > > > >
> > > > > > > > > > > > Isn't this something that should be handled by the =
AUX core ? The code
> > > > > > > > > > > > below would otherwise need to be duplicated by all =
drivers, which seems
> > > > > > > > > > > > a burden we should avoid.
> > > > > > > > > > >
> > > > > > > > > > > According to the documentation, this is the responsib=
ility of the caller
> > > > > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/inclu=
de/linux/auxiliary_bus.h#L81
> > > > > > > > > > > I believe this is the same for platform devices.
> > > > > > > > > > > See also the example at
> > > > > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/inclu=
de/linux/auxiliary_bus.h#L116
> > > > > > > > > > >
> > > > > > > > > > > Note: the platform bus supports PLATFORM_DEVID_AUTO, =
but the auxiliary
> > > > > > > > > > > bus does not.
> > > > > > > > > >
> > > > > > > > > > Yes, it does not as it's up to the caller to create a u=
nique name, like
> > > > > > > > > > your patch here does.  I'd argue that platform should a=
lso not do
> > > > > > > > > > automatic device ids, but that's a different argument :=
)
> > > > > > > > >
> > > > > > > > > __auxiliary_device_add() creates the device name with
> > > > > > > > >
> > > > > > > > >   dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, au=
xdev->id);
> > > > > > > > >
> > > > > > > > > I'm not calling for a PLATFORM_DEVID_AUTO-like feature he=
re, but
> > > > > > > > > shouldn't the first component of the device name use the =
parent's name
> > > > > > > > > instead of the module name ?
> > > > > > > >
> > > > > > > > Why would the parent's name not be the module name?  That n=
ame is
> > > > > > > > guaranteed unique in the system.  If you want "uniqueness" =
within the
> > > > > > > > driver/module, use the name and id field please.
> > > > > > > >
> > > > > > > > That's worked well so far, but to be fair, aux devices are =
pretty new.
> > > > > > > > What problem is this naming scheme causing?
> > > > > > >
> > > > > > > Auxiliary devices are created as children of a parent device.=
 When
> > > > > > > multiple instances of the same parent type exist, this will b=
e reflected
> > > > > > > in the /sys/devices/ devices tree hierarchy without any issue=
. The
> > > > > > > problem comes from the fact the the auxiliary devices need a =
unique name
> > > > > > > for /sys/bus/auxialiary/devices/, where we somehow have to di=
fferenciate
> > > > > > > devices of identical types.
> > > > > > >
> > > > > > > Essentially, we're trying to summarize a whole hierarchy (pat=
h in
> > > > > > > /sys/devices/) into a single string. There are different ways=
 to solve
> > > > > > > this. For platform devices, we use a device ID. For I2C devic=
es, we use
> > > > > > > the parent's bus number. Other buses use different schemes.
> > > > > > >
> > > > > > > Geert's patch implements a mechanism in the ti-sn65dsi86 driv=
er to
> > > > > > > handle this, and assign an id managed by the parent. In a sen=
se we could
> > > > > > > consider this to be similar to what is done for I2C, where th=
e bus
> > > > > > > number is also a property of the parent. However, the big dif=
ference is
> > > > > > > that the I2C bus number is managed by the I2C subsystem, whil=
e here the
> > > > > > > id is managed by the ti-sn65dsi86 driver, not by the auxiliar=
y device
> > > > > > > core. This would require duplicating the same mechanism in ev=
ery single
> > > > > > > driver creating auxiliary devices. This strikes me as a fairl=
y bad idea.
> > > > > > > The problem should be solved by the core, not by individual d=
rivers.
> > > > > >
> > > > > > The "id" is just a unique number, it is "managed" by the thing =
that is
> > > > > > creating the devices themselves, not the aux core code.  I don'=
t see why
> > > > > > the i2c bus number has to match the same number that the ti dri=
ver
> > > > > > creates, it could be anything, as long as it doesn't match anyt=
hing else
> > > > > > currently created by that driver.
> > > > >
> > > > > Laurent does not say it has to match the i2c bus number.
> > > > > He does think the auxilliary bus should provide a mechanism to
> > > > > allocate these IDs (e.g. usin g AUX_DEVID_AUTO?).
> > > >
> > > > As this is the first subsystem to ask for such a thing, I didn't th=
ink
> > > > it was needed, but the aux subsystem is new :)
> > > >
> > > > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > > > in the TI driver does sound like a good idea to me...
> > > >
> > > > Great!
> >
> > > With the I2C adapter numbers, that becomes:
> > >
> > >     /sys/bus/auxiliary/devices
> > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.1
> > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
> > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.1
> > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.1
> > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
> > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.4
> > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.4
> > >     =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.4
> > >
> > > > adapter->nr instead like other aux subsystems already do.
> >
> > Unfortunately the devil is in the details, as usual: there can be
> > multiple instances of the sn65dsi86 bridge on a single I2C bus,
> > so adapter->nr is not guaranteed to generate a unique name.
>
> In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
> chip is always at bus address 0x2d so you can't have more than one on
> the same bus. Unless you added something funky atop it (like a mux of
> some sort) you might be OK.

It's 0x2c on mine ;-)

    8.5.1 Local I2C Interface Overview
    The 7-bit device address for SN65DSI86 is factory preset to 010110X
    with the least significant bit being determined by the ADDR control
    input.

> > Changing the auxiliary bus to use the parent's name instead of the
> > module name, as suggested by Laurent, would fix that.
>
> Right. On my system dev_name() of the sn65dsi86 device is "2-002d". If
> we had a second on i2c bus 4, we'd have:
>
>     /sys/bus/auxiliary/devices
>     =E2=94=9C=E2=94=80=E2=94=80 2-002d.gpio.0
>     =E2=94=9C=E2=94=80=E2=94=80 2-002d.pwm.0
>     =E2=94=9C=E2=94=80=E2=94=80 2-002d.aux.0
>     =E2=94=9C=E2=94=80=E2=94=80 2-002d.bridge.0
>     =E2=94=9C=E2=94=80=E2=94=80 4-002d.gpio.0
>     =E2=94=9C=E2=94=80=E2=94=80 4-002d.pwm.0
>     =E2=94=9C=E2=94=80=E2=94=80 4-002d.aux.0
>     =E2=94=94=E2=94=80=E2=94=80 4-002d.bridge.0
>
> ...and I think that's guaranteed to be unique because all the i2c
> devices are flat in "/sys/bus/i2c/devices".

Correct.

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

