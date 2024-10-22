Return-Path: <linux-renesas-soc+bounces-9956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AA49A94F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 02:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EA79B230D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 00:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62103DDC5;
	Tue, 22 Oct 2024 00:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eeZ+1xpn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306474A18
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2024 00:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729556917; cv=none; b=HQK9ro7PJ1Blcb4L0gSAfOW5HEfJb5PJ30dtiopYC9z2mw6rmuiOE9WWGZCfqOh1PRfwL8avFq9WcuBAVkE6+oWZI8tFwO6YZZZRYwQyuspO5Y+yP4RR0wNruSwe6ReyN3pvEpli9RvOpxg3pi6AjrsxhQDtKfR9nbkrAzlm7ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729556917; c=relaxed/simple;
	bh=DL+ZfqyGsrhZajnZ2RGlU6YC1Ree2Jj+uMmCwS0ypU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1nSEhUpajoK5jd9kFXCz2/gGv+r4HMbbYh+DKI4VmDcA49Nv43QujnUPqERk+GZbNeit6hFHSCy0ptP2rJyBWp8M9QBHaDVEaenFseBTuWP6ApoO1V4LY5+cgdv0tyPZHvr7c8HXBrcK/G3P4K1IxL5+Eip+x95huIGcziw3kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eeZ+1xpn; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so6024598a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 17:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729556912; x=1730161712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AquQ/RobG5RLX7clJPy8zhYHtHRbpJxzenLLWw4qJQ=;
        b=eeZ+1xpnorezax9zgdMqrwEorsVjOrgSYZ5031oLYG02aQq5ttK6kY2bFA9guffUxW
         Jaa1ZPWyA4dLeeEBIQAGXZSrTV0h7JJ92/HceRnwA2AE2iRyfqNoEOk/Uufx1ta4nDB7
         hZQnZ9ksKVJzzdoib4c7LLDdDa8110JXknKQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729556912; x=1730161712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AquQ/RobG5RLX7clJPy8zhYHtHRbpJxzenLLWw4qJQ=;
        b=UlSswAzIgljGbg9MjLx087o6ayC2rJ4d2/xAq3zrOfrNrDvR/jkBzwDbGiecbrGmgS
         4kSch5sN52D5SRVivo0inzGZ52YBtZ53/ZE0RJeykY3djPNY+bTLpSOIn+tucu+LR1g8
         q0FlQCBSj55Hy+YXvwrsp2DqWtLsKIU9F/xFUFKIce+F+uJM5MoYDhbY5vfLjc09m8Bh
         An2bgnTJQSS4EbIAlqHBrWA5du7Yz+LgPKbdfpC8ssTMtZXfyYTXTV+V5EbA9NpqovKn
         BCxTj0dYn+N8rur7M2C+fPIumdEhNO5jhaa0KdilD4J6jzAEx24BCM8EuIrm1o4uDICw
         PaSw==
X-Forwarded-Encrypted: i=1; AJvYcCXNbV643t1MQA4xJhq3HRIlAR2zWTRCp+Gubb3c/CRESCKyjMEL3LXFdUzUjBemHLWgjAKQ50AbG8WFY3t8VHxK9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgHZYa/r4/lPXs5knxccspK9Z+6N6qpLmc7Ff23WRFFY/NYUte
	/5mRBm8nnYN3n6cQS2pYK/1qI2aawCQW5OA7Axe9x0wvHQqq4qwn2uRWKMROjRmNgs49YgzHkhC
	/gbsW
X-Google-Smtp-Source: AGHT+IGaeFScvDoYGRBWfMJjEmLnnjj5VauIXuV6a3UL6kUcFR62ex5lLM7aOO4bK7I6CYWAXG+c5A==
X-Received: by 2002:a17:907:7296:b0:a9a:f84:fefd with SMTP id a640c23a62f3a-a9a69bad1admr1455662866b.36.1729556912086;
        Mon, 21 Oct 2024 17:28:32 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9159a214sm268167166b.213.2024.10.21.17.28.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 17:28:31 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43161c0068bso36427695e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 17:28:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHS5e4pkhWQX8e83zEVnDqQD5/HnSoAgB0R5mTjKQc1XjTNVu3wz5OUsd3GWUPU3j2Ius+4ZDGwjaUXA23G8eESg==@vger.kernel.org
X-Received: by 2002:a05:6512:3095:b0:533:d3e:16f5 with SMTP id
 2adb3069b0e04-53a15449e28mr6637115e87.38.1729556451668; Mon, 21 Oct 2024
 17:20:51 -0700 (PDT)
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
 <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
In-Reply-To: <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Oct 2024 17:20:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
Message-ID: <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi,

On Mon, Oct 21, 2024 at 1:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Greg,
>
> On Mon, Oct 21, 2024 at 10:23=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, Oct 21, 2024 at 9:27=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > > On Mon, Oct 21, 2024 at 08:58:30AM +0200, Geert Uytterhoeven wrote:
> > > > On Mon, Oct 21, 2024 at 8:39=E2=80=AFAM Greg KH <gregkh@linuxfounda=
tion.org> wrote:
> > > > > On Sun, Oct 20, 2024 at 05:36:29PM +0300, Laurent Pinchart wrote:
> > > > > > On Fri, Oct 18, 2024 at 04:31:21PM +0200, Greg KH wrote:
> > > > > > > On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart wr=
ote:
> > > > > > > > On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > > > > > > > > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoe=
ven wrote:
> > > > > > > > > > On Fri, Oct 18, 2024 at 3:10=E2=80=AFPM Laurent Pinchar=
t wrote:
> > > > > > > > > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytte=
rhoeven wrote:
> > > > > > > > > > > > Each bridge instance creates up to four auxiliary d=
evices with different
> > > > > > > > > > > > names.  However, their IDs are always zero, causing=
 duplicate filename
> > > > > > > > > > > > errors when a system has multiple bridges:
> > > > > > > > > > > >
> > > > > > > > > > > >     sysfs: cannot create duplicate filename '/bus/a=
uxiliary/devices/ti_sn65dsi86.gpio.0'
> > > > > > > > > > > >
> > > > > > > > > > > > Fix this by using a unique instance ID per bridge i=
nstance.
> > > > > > > > > > >
> > > > > > > > > > > Isn't this something that should be handled by the AU=
X core ? The code
> > > > > > > > > > > below would otherwise need to be duplicated by all dr=
ivers, which seems
> > > > > > > > > > > a burden we should avoid.
> > > > > > > > > >
> > > > > > > > > > According to the documentation, this is the responsibil=
ity of the caller
> > > > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include=
/linux/auxiliary_bus.h#L81
> > > > > > > > > > I believe this is the same for platform devices.
> > > > > > > > > > See also the example at
> > > > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include=
/linux/auxiliary_bus.h#L116
> > > > > > > > > >
> > > > > > > > > > Note: the platform bus supports PLATFORM_DEVID_AUTO, bu=
t the auxiliary
> > > > > > > > > > bus does not.
> > > > > > > > >
> > > > > > > > > Yes, it does not as it's up to the caller to create a uni=
que name, like
> > > > > > > > > your patch here does.  I'd argue that platform should als=
o not do
> > > > > > > > > automatic device ids, but that's a different argument :)
> > > > > > > >
> > > > > > > > __auxiliary_device_add() creates the device name with
> > > > > > > >
> > > > > > > >   dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxd=
ev->id);
> > > > > > > >
> > > > > > > > I'm not calling for a PLATFORM_DEVID_AUTO-like feature here=
, but
> > > > > > > > shouldn't the first component of the device name use the pa=
rent's name
> > > > > > > > instead of the module name ?
> > > > > > >
> > > > > > > Why would the parent's name not be the module name?  That nam=
e is
> > > > > > > guaranteed unique in the system.  If you want "uniqueness" wi=
thin the
> > > > > > > driver/module, use the name and id field please.
> > > > > > >
> > > > > > > That's worked well so far, but to be fair, aux devices are pr=
etty new.
> > > > > > > What problem is this naming scheme causing?
> > > > > >
> > > > > > Auxiliary devices are created as children of a parent device. W=
hen
> > > > > > multiple instances of the same parent type exist, this will be =
reflected
> > > > > > in the /sys/devices/ devices tree hierarchy without any issue. =
The
> > > > > > problem comes from the fact the the auxiliary devices need a un=
ique name
> > > > > > for /sys/bus/auxialiary/devices/, where we somehow have to diff=
erenciate
> > > > > > devices of identical types.
> > > > > >
> > > > > > Essentially, we're trying to summarize a whole hierarchy (path =
in
> > > > > > /sys/devices/) into a single string. There are different ways t=
o solve
> > > > > > this. For platform devices, we use a device ID. For I2C devices=
, we use
> > > > > > the parent's bus number. Other buses use different schemes.
> > > > > >
> > > > > > Geert's patch implements a mechanism in the ti-sn65dsi86 driver=
 to
> > > > > > handle this, and assign an id managed by the parent. In a sense=
 we could
> > > > > > consider this to be similar to what is done for I2C, where the =
bus
> > > > > > number is also a property of the parent. However, the big diffe=
rence is
> > > > > > that the I2C bus number is managed by the I2C subsystem, while =
here the
> > > > > > id is managed by the ti-sn65dsi86 driver, not by the auxiliary =
device
> > > > > > core. This would require duplicating the same mechanism in ever=
y single
> > > > > > driver creating auxiliary devices. This strikes me as a fairly =
bad idea.
> > > > > > The problem should be solved by the core, not by individual dri=
vers.
> > > > >
> > > > > The "id" is just a unique number, it is "managed" by the thing th=
at is
> > > > > creating the devices themselves, not the aux core code.  I don't =
see why
> > > > > the i2c bus number has to match the same number that the ti drive=
r
> > > > > creates, it could be anything, as long as it doesn't match anythi=
ng else
> > > > > currently created by that driver.
> > > >
> > > > Laurent does not say it has to match the i2c bus number.
> > > > He does think the auxilliary bus should provide a mechanism to
> > > > allocate these IDs (e.g. usin g AUX_DEVID_AUTO?).
> > >
> > > As this is the first subsystem to ask for such a thing, I didn't thin=
k
> > > it was needed, but the aux subsystem is new :)
> > >
> > > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > > in the TI driver does sound like a good idea to me...
> > >
> > > Great!
>
> > With the I2C adapter numbers, that becomes:
> >
> >     /sys/bus/auxiliary/devices
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.1
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.1
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.1
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.4
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.4
> >     =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.4
> >
> > > adapter->nr instead like other aux subsystems already do.
>
> Unfortunately the devil is in the details, as usual: there can be
> multiple instances of the sn65dsi86 bridge on a single I2C bus,
> so adapter->nr is not guaranteed to generate a unique name.

In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
chip is always at bus address 0x2d so you can't have more than one on
the same bus. Unless you added something funky atop it (like a mux of
some sort) you might be OK.


> Changing the auxiliary bus to use the parent's name instead of the
> module name, as suggested by Laurent, would fix that.

Right. On my system dev_name() of the sn65dsi86 device is "2-002d". If
we had a second on i2c bus 4, we'd have:

    /sys/bus/auxiliary/devices
    =E2=94=9C=E2=94=80=E2=94=80 2-002d.gpio.0
    =E2=94=9C=E2=94=80=E2=94=80 2-002d.pwm.0
    =E2=94=9C=E2=94=80=E2=94=80 2-002d.aux.0
    =E2=94=9C=E2=94=80=E2=94=80 2-002d.bridge.0
    =E2=94=9C=E2=94=80=E2=94=80 4-002d.gpio.0
    =E2=94=9C=E2=94=80=E2=94=80 4-002d.pwm.0
    =E2=94=9C=E2=94=80=E2=94=80 4-002d.aux.0
    =E2=94=94=E2=94=80=E2=94=80 4-002d.bridge.0

...and I think that's guaranteed to be unique because all the i2c
devices are flat in "/sys/bus/i2c/devices".

In any case, I've been standing on the sidelines because really any of
these ideas are fine to me.

Using the parent name is nice because it's completely automatic and
that's nice. It's a bigger change to paths / device names, though. I
could see it breaking someone somewhere.

The patch that Geert originally posted has the advantage of not
breaking things in case there's someone out there that wrote bad
userspace code and somehow hardcoded some old sysfs path. Others could
disagree, but IMO if it's easy it's nice to keep the sysfs paths
consistent even though it's not really an ABI promise. :-P I'm always
surprised how often people seem to hardcode paths like this. Sometimes
there's not a great alternative, but sometimes people just do it
because they don't know better...

The adapter->nr also seems OK to me in that it's a simple/small change.

Anyway, I'm happy to let others fight out for their favorite, but I
don't have a strong enough opinion to really argue one way or the
other...

-Doug

