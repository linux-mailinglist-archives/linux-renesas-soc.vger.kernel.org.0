Return-Path: <linux-renesas-soc+bounces-10179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 440129B31C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 14:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EED842843BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 13:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8261DA636;
	Mon, 28 Oct 2024 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoDje0Xs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B031D5178
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Oct 2024 13:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730122456; cv=none; b=g7ZaFVdcSGINeHrz/EJe0MmJ8m0kLouAt9mYo+ULc2oW7vXrGHcBGsA142d46G5ruQvA8qDhZg5YuyWhH1V/sLDMrT/FjTEesT1VzCSDm63wV9/AaK6ZTOO4REa1wZNjCNp9GpAgC1qK29RM/ItFGhVVUM7emqXYuoHAu3AtUKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730122456; c=relaxed/simple;
	bh=lm+Fnw6odXYDSTTQB393sZdT0ZVq7/VZK1HsgxNS0VE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdxMPLvgOOqzU/cBZsHCGnL/+WoMqKvHynC95pAEfPL944aVyCxzI54UrYgIAC+Lk5R65/SAhR2tRqvEtKfxlmBWOMF2fVg4LBK17DFjdaMiBEZ5Nb/mdm+Aq5+HxBAQShYFJyYZ7v8jg4V03yH/VxP3R5L/cph54HcJ1FqmNbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoDje0Xs; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53a097aa3daso3680574e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Oct 2024 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730122452; x=1730727252; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/gFo5P3Ww8t4SEEYAXGao1xK+VemSYBJS2VY80eGpI=;
        b=WoDje0XswYBcDvNpgmsJ4qh/CzXcqXTtVK5zYa9IukNMW8nsuCcIu0bJ9bFcnrdmZ7
         XAGyStqCjpGUikI/ScdjsRveBCh9x8N3q70f8w5q21y4O7Iezadoc8uPrmlnNbUiJSAe
         UrDsPEn+LZLCLNdgXZUf7yh2f4589Hiy31smP/o0C0Cjht3k0VXuj3aj/9I3h/9QELiW
         zbSG/hsP0+SQuv6nhVOHoqkLYxIR8rUopbw0WTlxceuuZaVQywiNAdXkM2PhZycl8T6l
         3uHatfwizt0gE4x/ExzPXnHR6jJtwoXSht0yVIz6py7g29Ugks3CaBdqiAqLP9s46pPO
         IA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730122452; x=1730727252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/gFo5P3Ww8t4SEEYAXGao1xK+VemSYBJS2VY80eGpI=;
        b=HG0uiD5WJGBBrug5oyZf7dSZfYdI+Y4KYO4J4Yf6YfpMPTmH29MgpUssZPPEzDnvAq
         ZaFzrcHeUBiIzJwhBRMVaNwA1mm/R9WnBu6h0y3ssyktvJc9Gnk6LbB7ee8AInWDobgK
         AIo/9pf/3EuQI6sCcnIe12Nawrvv4XeASdaie/PhSW/H2yjsjOpA6DsCJw+NgPLIophr
         ODw00Fps79UJXP8QxZKPSg9Yj3bOMVWRlwBQMq+se6oPoV5ejhHO1qg/WXY2GA6AVwJB
         Q0wbCFPcK3+cHLJEWGDAmG6yk+O5erWDATRUvTrDTthqrDm+mGUIbsu7D0CcZ7a/nZ0H
         nu7g==
X-Forwarded-Encrypted: i=1; AJvYcCWuAfWpt/ewC7YQRhuxwvvwO+9kSK0Sfi609n1WwyGZaT/4B6Es6j0/hvHLJdZAFLdSepNq4x+7EmTcCMZaDsyQlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqUGvQBgK64WT4gNiZ6rnVmUoVi83AKiXUo2+3iH8E4aVAxV88
	CmPpKi4KmccTcA84+vzQkkI4Fim18I/gsSox0GDI8aPMEKQ84c7cm+wCMQxUlDg=
X-Google-Smtp-Source: AGHT+IFXnzMeykWMvF2BHdy48eIlWz7qcYhj6URlUTMPfqMe+ksPt1U8e6ZDLwPs7NJ0oyKpF8Fqzw==
X-Received: by 2002:a05:6512:e88:b0:536:a6c6:33f with SMTP id 2adb3069b0e04-53b348ce5d5mr3297068e87.13.1730122451800;
        Mon, 28 Oct 2024 06:34:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e124859sm1091735e87.64.2024.10.28.06.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 06:34:10 -0700 (PDT)
Date: Mon, 28 Oct 2024 15:34:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
Message-ID: <mmmy4mmk435m6i4ic7aelkggzklrwv34vi7yam6mmasadffv2l@fi6ralq5e6vv>
References: <2024101837-crushed-emphasis-b496@gregkh>
 <20241020143629.GC28934@pendragon.ideasonboard.com>
 <2024102119-oversweet-labored-aa07@gregkh>
 <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh>
 <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
 <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
 <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
 <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
 <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>

On Tue, Oct 22, 2024 at 07:37:01AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 22, 2024 at 12:12 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> >
> > > > > > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > > > > > in the TI driver does sound like a good idea to me...
> > > > > >
> > > > > > Great!
> > > >
> > > > > With the I2C adapter numbers, that becomes:
> > > > >
> > > > >     /sys/bus/auxiliary/devices
> > > > >     ├── ti_sn65dsi86.gpio.1
> > > > >     ├── ti_sn65dsi86.pwm.1
> > > > >     ├── ti_sn65dsi86.aux.1
> > > > >     ├── ti_sn65dsi86.bridge.1
> > > > >     ├── ti_sn65dsi86.gpio.4
> > > > >     ├── ti_sn65dsi86.pwm.4
> > > > >     ├── ti_sn65dsi86.aux.4
> > > > >     └── ti_sn65dsi86.bridge.4
> > > > >
> > > > > > adapter->nr instead like other aux subsystems already do.
> > > >
> > > > Unfortunately the devil is in the details, as usual: there can be
> > > > multiple instances of the sn65dsi86 bridge on a single I2C bus,
> > > > so adapter->nr is not guaranteed to generate a unique name.
> > >
> > > In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
> > > chip is always at bus address 0x2d so you can't have more than one on
> > > the same bus. Unless you added something funky atop it (like a mux of
> > > some sort) you might be OK.
> >
> > It's 0x2c on mine ;-)
> >
> >     8.5.1 Local I2C Interface Overview
> >     The 7-bit device address for SN65DSI86 is factory preset to 010110X
> >     with the least significant bit being determined by the ADDR control
> >     input.
> 
> Doh! I missed that in my search of the doc. I guess because they
> decided to specify the address in binary in that part so my searching
> for both the 7-bit and 8-bit I2C address didn't trigger. Oh well.
> 
> 
> > > > Changing the auxiliary bus to use the parent's name instead of the
> > > > module name, as suggested by Laurent, would fix that.
> > >
> > > Right. On my system dev_name() of the sn65dsi86 device is "2-002d". If
> > > we had a second on i2c bus 4, we'd have:
> > >
> > >     /sys/bus/auxiliary/devices
> > >     ├── 2-002d.gpio.0
> > >     ├── 2-002d.pwm.0
> > >     ├── 2-002d.aux.0
> > >     ├── 2-002d.bridge.0
> > >     ├── 4-002d.gpio.0
> > >     ├── 4-002d.pwm.0
> > >     ├── 4-002d.aux.0
> > >     └── 4-002d.bridge.0
> > >
> > > ...and I think that's guaranteed to be unique because all the i2c
> > > devices are flat in "/sys/bus/i2c/devices".
> >
> > Correct.
> 
> So given everything, using the dev_name() of the "parent" sounds
> pretty good and seems like it addresses everyone's concerns. Was there
> a part of the conversation where someone pointed out problems with it
> that I missed? Is the next step to post a patch implementing that?
> It'll change sysfs paths and dev names for everyone using AUX bus, but
> presumably that's OK?

It also requires changing in the way the auxiliary_match_id() works.
Currently matching is done using modname + ID.

So, maybe using MODNAME.NAME.parent-name.ID is better (e.g.
ti_sn65dsi86.gpio.2-002d.1). It will still require changes to the
match_id function, but they won't be that intrusive (one just has to
skip two parts of the name instead of skipping just one).

-- 
With best wishes
Dmitry

