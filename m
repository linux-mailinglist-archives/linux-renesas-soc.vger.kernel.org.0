Return-Path: <linux-renesas-soc+bounces-9931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1AC9A5E8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 10:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC0AAB24C18
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 08:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D411E1C10;
	Mon, 21 Oct 2024 08:23:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DBE1E1C15
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729499023; cv=none; b=qS4NyrK8agCeE55XTpEmJwHn+eTsIGYf7YNedytKy/oejGS9vUfGPXbq9B7iI4xV7KOGUOJNZ14lWPYGMkfX4LF51EQ00Ou8e07vWgwqH1xkm4svUjAQyV/arNhv1ZOUw0TRMX767wxz/Zl0pIkb7w5cPd9rd3a4bM3yedUDpSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729499023; c=relaxed/simple;
	bh=0F1nJf7vylZ0OPsaaqurYu/woIkvh6X/39ztWgFmzrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p6lY6W6o5BtVGDGvwas7e8jDI6ZDZ7X9peYiAbFLVt5m924tdVfZOF+poIqTOCweMvZTwORtoM7w7qDzz5IsmQdqm5k/sIzEMbyPzsEjaDNeBXjeQKKO0wW2S5rM/0A7dOBNeLCdY1GLz8s83XXjCZx44h6xkbNcePcThQFRjDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e33c65d104so36253087b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 01:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729499020; x=1730103820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwE+/VkLg6tsBqfPJ9uMLaCmwut336NDYQKe6YqlJhQ=;
        b=mvd523AqijQ8wxRCGb+8eZecAnRcau+H27yusiKa67Dzn7TSIFogmLZAH2XlXetVza
         VMfdvSpCyjQGNXk2va1e+BdWUVyN0ZYZ+pCmSslsqjzR1AbHZv7b8xgiUzmvcFcOXPrB
         Bd/L/qzdIedWUajFcTJaWfN7wc/eRP2nuGfGa41o/RV/yXrfSng6mtCOGjeOK9zj0ntV
         I1Bt19uDrffyaV0XU9cywv3E7SV6G08JkXeASPi+kO6vGQo5kf1A4VjRKQw1zGxZ6MCh
         B1mAroFnZ6BNTWcrL/amQsEtWE+62MFpvrQRlz7WPxy8nmZ/2AqyZm3032/qjsyLi5OY
         I13w==
X-Forwarded-Encrypted: i=1; AJvYcCXq3G+G07BPiBgloINadCnWGwDInXugdNwB/rVwE/D04eBzL/PJFHGUz/buthwfEpkvNAjWtKngBRje0Z+y3fEj5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlQB9ogEN3RuZqUgommxtLBUISonHhCnT9snPseBIu4GkaBemm
	SFdtkI4mXpPhX5dna0yRF87IHCax5vvlyluYf0dSbsJ46QyGquFWqHtrdDwX
X-Google-Smtp-Source: AGHT+IHdIQenn4kE67X2/dK1uU+tKZfb+LVw3Myja+QfW6NH0S6LIcDTqVoEaGI02Edndmo3Z5ZjGA==
X-Received: by 2002:a05:690c:67c8:b0:6e3:410e:bb84 with SMTP id 00721157ae682-6e5bfc73352mr84369837b3.20.1729499019949;
        Mon, 21 Oct 2024 01:23:39 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5a4d35fsm5900307b3.45.2024.10.21.01.23.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 01:23:39 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e33c65d104so36252967b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 01:23:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWn0BrOWtfjvSEB2+wnelX2h9lxHYRkoGdb0QLuMyteXlFft0iCtveb+9Uy1ZIZaA0L1Q+KWTs+HSUvFGLf7mUwLw==@vger.kernel.org
X-Received: by 2002:a05:690c:6101:b0:6de:a3:a7ca with SMTP id
 00721157ae682-6e5bfd5420cmr105098217b3.32.1729499019285; Mon, 21 Oct 2024
 01:23:39 -0700 (PDT)
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
 <2024102137-repost-visiting-323d@gregkh>
In-Reply-To: <2024102137-repost-visiting-323d@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Oct 2024 10:23:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
Message-ID: <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
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

On Mon, Oct 21, 2024 at 9:27=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> On Mon, Oct 21, 2024 at 08:58:30AM +0200, Geert Uytterhoeven wrote:
> > On Mon, Oct 21, 2024 at 8:39=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > > On Sun, Oct 20, 2024 at 05:36:29PM +0300, Laurent Pinchart wrote:
> > > > On Fri, Oct 18, 2024 at 04:31:21PM +0200, Greg KH wrote:
> > > > > On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart wrote:
> > > > > > On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > > > > > > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeven =
wrote:
> > > > > > > > On Fri, Oct 18, 2024 at 3:10=E2=80=AFPM Laurent Pinchart wr=
ote:
> > > > > > > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoe=
ven wrote:
> > > > > > > > > > Each bridge instance creates up to four auxiliary devic=
es with different
> > > > > > > > > > names.  However, their IDs are always zero, causing dup=
licate filename
> > > > > > > > > > errors when a system has multiple bridges:
> > > > > > > > > >
> > > > > > > > > >     sysfs: cannot create duplicate filename '/bus/auxil=
iary/devices/ti_sn65dsi86.gpio.0'
> > > > > > > > > >
> > > > > > > > > > Fix this by using a unique instance ID per bridge insta=
nce.
> > > > > > > > >
> > > > > > > > > Isn't this something that should be handled by the AUX co=
re ? The code
> > > > > > > > > below would otherwise need to be duplicated by all driver=
s, which seems
> > > > > > > > > a burden we should avoid.
> > > > > > > >
> > > > > > > > According to the documentation, this is the responsibility =
of the caller
> > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/lin=
ux/auxiliary_bus.h#L81
> > > > > > > > I believe this is the same for platform devices.
> > > > > > > > See also the example at
> > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/lin=
ux/auxiliary_bus.h#L116
> > > > > > > >
> > > > > > > > Note: the platform bus supports PLATFORM_DEVID_AUTO, but th=
e auxiliary
> > > > > > > > bus does not.
> > > > > > >
> > > > > > > Yes, it does not as it's up to the caller to create a unique =
name, like
> > > > > > > your patch here does.  I'd argue that platform should also no=
t do
> > > > > > > automatic device ids, but that's a different argument :)
> > > > > >
> > > > > > __auxiliary_device_add() creates the device name with
> > > > > >
> > > > > >   dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev->=
id);
> > > > > >
> > > > > > I'm not calling for a PLATFORM_DEVID_AUTO-like feature here, bu=
t
> > > > > > shouldn't the first component of the device name use the parent=
's name
> > > > > > instead of the module name ?
> > > > >
> > > > > Why would the parent's name not be the module name?  That name is
> > > > > guaranteed unique in the system.  If you want "uniqueness" within=
 the
> > > > > driver/module, use the name and id field please.
> > > > >
> > > > > That's worked well so far, but to be fair, aux devices are pretty=
 new.
> > > > > What problem is this naming scheme causing?
> > > >
> > > > Auxiliary devices are created as children of a parent device. When
> > > > multiple instances of the same parent type exist, this will be refl=
ected
> > > > in the /sys/devices/ devices tree hierarchy without any issue. The
> > > > problem comes from the fact the the auxiliary devices need a unique=
 name
> > > > for /sys/bus/auxialiary/devices/, where we somehow have to differen=
ciate
> > > > devices of identical types.
> > > >
> > > > Essentially, we're trying to summarize a whole hierarchy (path in
> > > > /sys/devices/) into a single string. There are different ways to so=
lve
> > > > this. For platform devices, we use a device ID. For I2C devices, we=
 use
> > > > the parent's bus number. Other buses use different schemes.
> > > >
> > > > Geert's patch implements a mechanism in the ti-sn65dsi86 driver to
> > > > handle this, and assign an id managed by the parent. In a sense we =
could
> > > > consider this to be similar to what is done for I2C, where the bus
> > > > number is also a property of the parent. However, the big differenc=
e is
> > > > that the I2C bus number is managed by the I2C subsystem, while here=
 the
> > > > id is managed by the ti-sn65dsi86 driver, not by the auxiliary devi=
ce
> > > > core. This would require duplicating the same mechanism in every si=
ngle
> > > > driver creating auxiliary devices. This strikes me as a fairly bad =
idea.
> > > > The problem should be solved by the core, not by individual drivers=
.
> > >
> > > The "id" is just a unique number, it is "managed" by the thing that i=
s
> > > creating the devices themselves, not the aux core code.  I don't see =
why
> > > the i2c bus number has to match the same number that the ti driver
> > > creates, it could be anything, as long as it doesn't match anything e=
lse
> > > currently created by that driver.
> >
> > Laurent does not say it has to match the i2c bus number.
> > He does think the auxilliary bus should provide a mechanism to
> > allocate these IDs (e.g. usin g AUX_DEVID_AUTO?).
>
> As this is the first subsystem to ask for such a thing, I didn't think
> it was needed, but the aux subsystem is new :)
>
> > However, using i2c_client->adapter->nr instead of ida_alloc()
> > in the TI driver does sound like a good idea to me...
>
> Great!
>
> > > If we had the aux core code create the id, it would just use a unique
> > > counter, and that would not reflect any mapping to anything, so I don=
't
> > > see how that is any different here.
> >
> > And then we would get something like:
> >
> > /sys/bus/auxiliary/devices
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.0
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.2
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.3
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.5
> > =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.6
> > =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.7
> >
> > Which is similar to the first approach I tried (calling ida_alloc() in
> > ti_sn65dsi86_add_aux_device() instead of ti_sn65dsi86_probe()).
>
> That id scheme looks really odd, don't you think?  Try using the

Yes, that's what happens if you let an external entity come up
with the unique IDs.

With the I2C adapter numbers, that becomes:

    /sys/bus/auxiliary/devices
    =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.1
    =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
    =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.1
    =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.1
    =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
    =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.4
    =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.4
    =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.4

> adapter->nr instead like other aux subsystems already do.

FTR, according to "git grep "adapter->nr" -- $(git grep -l
auxiliary_device_init)",
no existing driver uses this mechanism yet.

"git grep ida_alloc -- $(git grep -l auxiliary_device_init)" does show
several hits.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

