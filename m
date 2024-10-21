Return-Path: <linux-renesas-soc+bounces-9933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6329A5F0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 10:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF8441C20159
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 08:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCA61E105B;
	Mon, 21 Oct 2024 08:47:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484D61E105F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729500479; cv=none; b=Wa6+wFRDYBcVJDqExBmuqPVlkimu7KVkZQSpyxXQOkLFEIyYW3UkqLozqAo4cwYe5LSOf3b+H6VhRT96522ihSfQguReN0+R5lgMq7qpnckfhdJH7ufGX+PjPdscR64uTuugYhaE9v0SKmis/gD/kSydrC4k3vo0+NBZjPcQgTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729500479; c=relaxed/simple;
	bh=XIeI+FTP8HTLqaeRVYFX0iyJRtZNzXgx3ckIem7Cyqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvM+0fpxA4ejgxqOFkBOwu3Ovkv5HZPAe89yLf4TDILp9MpBL1hWM/xp9Mz8bNW5jrtJ9rHExDk1N8iNjpnNGXTK+WkZgLoxySSpZfmYfQXWT1xKSBt0LE8CJ2q/su1nrs+k09KAueY0/J6BIu8BBi3146VWUVTIoila/sedvwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e34339d41bso36312647b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 01:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729500476; x=1730105276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DM6Iuw5UL8tiK41PCOOby51LdLIXS4iYff8u62S6/mM=;
        b=KRpbGCwum1zpLM+fyvCH/F5XJ7hkCDZypEe4dlM0bgloOet1cOy88CDzNzQR7Z5kQP
         mxIHXOyDOZ+fLiLARFPiPAFqjs2/yVSQCSQBRUl9kjnD/h6LZL8s9jJsBc9R+ayic6M6
         af8nOtylWsIETyOlm2ru5LdLRWAUzBsdfjELICa4NsgKL15Jodx+uwZ/Iz/ssdyjYwaw
         F8/4o2fjqqctqsM2Bb8ReiGVVmmTGA0DJkslutPezlcqKz3I1fkxl8lc866T1s28KeYP
         pW1vtg1tzMJKaaE45XyXgrg76sPhnKTmmzN4LGIgxhdCSE7vC9JiJTfJSzYh4MqtVzwr
         hm+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVB3lApu3CiuL28WUNRgsNSVc+pzJR7XttjyWzuB3t1rA80By7+zIiriuamx+A2dSskWM6TwH25Z4k8X+OE2/uI9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZy7hxV/+SMiVBbUsaafa00M307sss3O4+K5I4XJ22zUdeK3TT
	V/kYnyzQSDcTfMo6Gq7zuqH6HMD1/IdSITGyZcnKbHA99UGx60MbaD+v0Vbo
X-Google-Smtp-Source: AGHT+IE2FS6WTv4Fu4kL4QJCe37pl9D6loOjsF3NtxM58u8gfdSAjEwp9ftGfLup2Xa5B7OY62c8mQ==
X-Received: by 2002:a05:690c:fc7:b0:6e3:1e5d:fe2 with SMTP id 00721157ae682-6e5bfd4c772mr91595967b3.31.1729500476168;
        Mon, 21 Oct 2024 01:47:56 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ccbaf0sm5940527b3.75.2024.10.21.01.47.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 01:47:56 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e2e508bd28so30529997b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 01:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUd/V/CM7ylPdykWV0uUQcoalfQcAVlk98x3mLtax2dy3J2hoXKm7a2oqWsyzzGRXqxck5ff/yuuAJ8Clh4kwBbqg==@vger.kernel.org
X-Received: by 2002:a05:690c:f89:b0:6db:d586:72d4 with SMTP id
 00721157ae682-6e5bfc5cf10mr82802697b3.18.1729500475632; Mon, 21 Oct 2024
 01:47:55 -0700 (PDT)
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
In-Reply-To: <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Oct 2024 10:47:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
Message-ID: <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
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

On Mon, Oct 21, 2024 at 10:23=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Oct 21, 2024 at 9:27=E2=80=AFAM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> > On Mon, Oct 21, 2024 at 08:58:30AM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Oct 21, 2024 at 8:39=E2=80=AFAM Greg KH <gregkh@linuxfoundati=
on.org> wrote:
> > > > On Sun, Oct 20, 2024 at 05:36:29PM +0300, Laurent Pinchart wrote:
> > > > > On Fri, Oct 18, 2024 at 04:31:21PM +0200, Greg KH wrote:
> > > > > > On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart wrot=
e:
> > > > > > > On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > > > > > > > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeve=
n wrote:
> > > > > > > > > On Fri, Oct 18, 2024 at 3:10=E2=80=AFPM Laurent Pinchart =
wrote:
> > > > > > > > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterh=
oeven wrote:
> > > > > > > > > > > Each bridge instance creates up to four auxiliary dev=
ices with different
> > > > > > > > > > > names.  However, their IDs are always zero, causing d=
uplicate filename
> > > > > > > > > > > errors when a system has multiple bridges:
> > > > > > > > > > >
> > > > > > > > > > >     sysfs: cannot create duplicate filename '/bus/aux=
iliary/devices/ti_sn65dsi86.gpio.0'
> > > > > > > > > > >
> > > > > > > > > > > Fix this by using a unique instance ID per bridge ins=
tance.
> > > > > > > > > >
> > > > > > > > > > Isn't this something that should be handled by the AUX =
core ? The code
> > > > > > > > > > below would otherwise need to be duplicated by all driv=
ers, which seems
> > > > > > > > > > a burden we should avoid.
> > > > > > > > >
> > > > > > > > > According to the documentation, this is the responsibilit=
y of the caller
> > > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/l=
inux/auxiliary_bus.h#L81
> > > > > > > > > I believe this is the same for platform devices.
> > > > > > > > > See also the example at
> > > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/l=
inux/auxiliary_bus.h#L116
> > > > > > > > >
> > > > > > > > > Note: the platform bus supports PLATFORM_DEVID_AUTO, but =
the auxiliary
> > > > > > > > > bus does not.
> > > > > > > >
> > > > > > > > Yes, it does not as it's up to the caller to create a uniqu=
e name, like
> > > > > > > > your patch here does.  I'd argue that platform should also =
not do
> > > > > > > > automatic device ids, but that's a different argument :)
> > > > > > >
> > > > > > > __auxiliary_device_add() creates the device name with
> > > > > > >
> > > > > > >   dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev=
->id);
> > > > > > >
> > > > > > > I'm not calling for a PLATFORM_DEVID_AUTO-like feature here, =
but
> > > > > > > shouldn't the first component of the device name use the pare=
nt's name
> > > > > > > instead of the module name ?
> > > > > >
> > > > > > Why would the parent's name not be the module name?  That name =
is
> > > > > > guaranteed unique in the system.  If you want "uniqueness" with=
in the
> > > > > > driver/module, use the name and id field please.
> > > > > >
> > > > > > That's worked well so far, but to be fair, aux devices are pret=
ty new.
> > > > > > What problem is this naming scheme causing?
> > > > >
> > > > > Auxiliary devices are created as children of a parent device. Whe=
n
> > > > > multiple instances of the same parent type exist, this will be re=
flected
> > > > > in the /sys/devices/ devices tree hierarchy without any issue. Th=
e
> > > > > problem comes from the fact the the auxiliary devices need a uniq=
ue name
> > > > > for /sys/bus/auxialiary/devices/, where we somehow have to differ=
enciate
> > > > > devices of identical types.
> > > > >
> > > > > Essentially, we're trying to summarize a whole hierarchy (path in
> > > > > /sys/devices/) into a single string. There are different ways to =
solve
> > > > > this. For platform devices, we use a device ID. For I2C devices, =
we use
> > > > > the parent's bus number. Other buses use different schemes.
> > > > >
> > > > > Geert's patch implements a mechanism in the ti-sn65dsi86 driver t=
o
> > > > > handle this, and assign an id managed by the parent. In a sense w=
e could
> > > > > consider this to be similar to what is done for I2C, where the bu=
s
> > > > > number is also a property of the parent. However, the big differe=
nce is
> > > > > that the I2C bus number is managed by the I2C subsystem, while he=
re the
> > > > > id is managed by the ti-sn65dsi86 driver, not by the auxiliary de=
vice
> > > > > core. This would require duplicating the same mechanism in every =
single
> > > > > driver creating auxiliary devices. This strikes me as a fairly ba=
d idea.
> > > > > The problem should be solved by the core, not by individual drive=
rs.
> > > >
> > > > The "id" is just a unique number, it is "managed" by the thing that=
 is
> > > > creating the devices themselves, not the aux core code.  I don't se=
e why
> > > > the i2c bus number has to match the same number that the ti driver
> > > > creates, it could be anything, as long as it doesn't match anything=
 else
> > > > currently created by that driver.
> > >
> > > Laurent does not say it has to match the i2c bus number.
> > > He does think the auxilliary bus should provide a mechanism to
> > > allocate these IDs (e.g. usin g AUX_DEVID_AUTO?).
> >
> > As this is the first subsystem to ask for such a thing, I didn't think
> > it was needed, but the aux subsystem is new :)
> >
> > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > in the TI driver does sound like a good idea to me...
> >
> > Great!

> With the I2C adapter numbers, that becomes:
>
>     /sys/bus/auxiliary/devices
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.1
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.1
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.1
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.4
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.4
>     =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.4
>
> > adapter->nr instead like other aux subsystems already do.

Unfortunately the devil is in the details, as usual: there can be
multiple instances of the sn65dsi86 bridge on a single I2C bus,
so adapter->nr is not guaranteed to generate a unique name.

Changing the auxiliary bus to use the parent's name instead of the
module name, as suggested by Laurent, would fix that.

modname

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

