Return-Path: <linux-renesas-soc+bounces-9968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0EE9AB0FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 16:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 181C8282B30
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 14:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BBB19E97F;
	Tue, 22 Oct 2024 14:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WwQSG0ZA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AC019E97A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2024 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729607846; cv=none; b=A/3n2i/g02Be2et1mo3MiZOVQR8ruCms/UeD/jh7hqg0K35kSQPR6F1HAWXlgvrJJmxlS+EwW9GWfTQq65dlADLmxOSM9EANpunqyBMs5c5/MsPNkUknwsaY1GUOS5jh9Fsf26VUsu9pY0fr3wBcceZsMlMNBGp8IB1kZdupC7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729607846; c=relaxed/simple;
	bh=Y7pHbiRckjhjRBx0nw2wx/9mstloe+Riw874dtDw7nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1c33xY3aFoSZPoGzc5af7Ow41bNIOfKztfL6hZq4i/d4BqJVCAkVo+zo0MppfoP5MtbWnJ3VzALo56YF5gBQ6VL4oj3ue82SLxOBBaoA4u2mfCJlekbmuJ3c7kTZwH9tXvD5KplYMRyzq/gST2U+A3Qqqoj0pq5fLc0SXS9XEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WwQSG0ZA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f58c68c5so8724240e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2024 07:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729607840; x=1730212640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/t/LGFahIImpW2uX5IAKpkFKUskZ7g86BAvsJJ7sGR4=;
        b=WwQSG0ZAouQ5VLPlCFU0lTBtWZxHpe5ByzxZBDhBtFojYGb1LN4glh7KWaMBdpJuqO
         dTLYrseEcKClQcMfCgbWIJLk7KlpvBYVHI/xiMyRaF2XqEq+wg6f/hBkO/GuQbzZv98T
         xLjAWwmyN/RJ5kdkd57Oek2rYoIFtU7/nzXqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729607840; x=1730212640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/t/LGFahIImpW2uX5IAKpkFKUskZ7g86BAvsJJ7sGR4=;
        b=rcOvDmnBJWtJpprsb+mbf4r5ZLUoPTfeUK005m+HnYi2ghJIqM1xVp1x/XqSWgulPl
         TWh8Wyn1JDORouI0slctW6dkhxOO3PWKracnQA/lRvYaJu8hMqlTCRQOcP2z594BniHz
         fkEd5zBvQ/E2onmWwbCaVeIoe1MjXzEZPmTVKNVT7gSKhCQyDDo51+781T6/adCAIApi
         xrl7ElieppeFhbU6E69mMIaySfFVDoCe2BjGK8x2TNxBm2/2cBIYl9LXdE/u3qRQa3NG
         1MnA7iC0XpT9LcbX4GMrLLlbaK1Fxpz6SLQesqeA88xRQjjkEQf/zUtM8siv/lq+R+jv
         h/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGwld4sluv2U1ZtLTwQ+xIebDU4CM+uuqZGGe90ttRmsNiHfpM4T72MmKq7UkKL966qnDzlVez3QnAWkykDk4/mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Q0elYfBMWnLzdvcqMxAS3FrOSrPYQ9+DajPiXixGbWq3/CAR
	kbmvxsIVm7jmmsEHm1ydzQeadh55wVU1lHP9aqNNgDmWs0Mwav5K4bJRKs088xDp2Yd1b5DyRuq
	ZX2C4
X-Google-Smtp-Source: AGHT+IGd+OgUHZxrJ0Fd8dFhOO4CkNy/yQCvN1Hn5WSP38QaINM7MXsKb5GyQ1uUgwXZrMQWc68U+Q==
X-Received: by 2002:a05:6512:4009:b0:530:b773:b4ce with SMTP id 2adb3069b0e04-53a15494e40mr13144105e87.33.1729607839629;
        Tue, 22 Oct 2024 07:37:19 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a224421acsm771618e87.295.2024.10.22.07.37.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 07:37:19 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f58c68c5so8724018e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2024 07:37:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1nW0rnBmykeM/TLP0dspeO9CheyWqtKa6Biks+ZmjN8e7SYUn0qnvDrLrNFyyUhRCrQrtmEVBVSDNfSXyPC1o+Q==@vger.kernel.org
X-Received: by 2002:a05:6512:3a8d:b0:539:9720:99dc with SMTP id
 2adb3069b0e04-53a154c9f51mr11729196e87.46.1729607837496; Tue, 22 Oct 2024
 07:37:17 -0700 (PDT)
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
 <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com> <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Oct 2024 07:37:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>
Message-ID: <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>
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

On Tue, Oct 22, 2024 at 12:12=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> > > > > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > > > > in the TI driver does sound like a good idea to me...
> > > > >
> > > > > Great!
> > >
> > > > With the I2C adapter numbers, that becomes:
> > > >
> > > >     /sys/bus/auxiliary/devices
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.1
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.1
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.1
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.4
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.4
> > > >     =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.4
> > > >
> > > > > adapter->nr instead like other aux subsystems already do.
> > >
> > > Unfortunately the devil is in the details, as usual: there can be
> > > multiple instances of the sn65dsi86 bridge on a single I2C bus,
> > > so adapter->nr is not guaranteed to generate a unique name.
> >
> > In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
> > chip is always at bus address 0x2d so you can't have more than one on
> > the same bus. Unless you added something funky atop it (like a mux of
> > some sort) you might be OK.
>
> It's 0x2c on mine ;-)
>
>     8.5.1 Local I2C Interface Overview
>     The 7-bit device address for SN65DSI86 is factory preset to 010110X
>     with the least significant bit being determined by the ADDR control
>     input.

Doh! I missed that in my search of the doc. I guess because they
decided to specify the address in binary in that part so my searching
for both the 7-bit and 8-bit I2C address didn't trigger. Oh well.


> > > Changing the auxiliary bus to use the parent's name instead of the
> > > module name, as suggested by Laurent, would fix that.
> >
> > Right. On my system dev_name() of the sn65dsi86 device is "2-002d". If
> > we had a second on i2c bus 4, we'd have:
> >
> >     /sys/bus/auxiliary/devices
> >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.gpio.0
> >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.pwm.0
> >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.aux.0
> >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.bridge.0
> >     =E2=94=9C=E2=94=80=E2=94=80 4-002d.gpio.0
> >     =E2=94=9C=E2=94=80=E2=94=80 4-002d.pwm.0
> >     =E2=94=9C=E2=94=80=E2=94=80 4-002d.aux.0
> >     =E2=94=94=E2=94=80=E2=94=80 4-002d.bridge.0
> >
> > ...and I think that's guaranteed to be unique because all the i2c
> > devices are flat in "/sys/bus/i2c/devices".
>
> Correct.

So given everything, using the dev_name() of the "parent" sounds
pretty good and seems like it addresses everyone's concerns. Was there
a part of the conversation where someone pointed out problems with it
that I missed? Is the next step to post a patch implementing that?
It'll change sysfs paths and dev names for everyone using AUX bus, but
presumably that's OK?

-Doug

