Return-Path: <linux-renesas-soc+bounces-10245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DACE9B86AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2024 00:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4DA9B20AF2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Oct 2024 23:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD891E2007;
	Thu, 31 Oct 2024 23:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q/6AofN7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B99E1D1310
	for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Oct 2024 23:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730416141; cv=none; b=Rqd7fpxeNELvS2Fh06UsIbZ+jAwuyRdoaAqVzBB0ZT3ykrM25u1CwrfozoD/u7ky3fzuZ3dMkzeReEavmukn3TYcLBJ3B6ZdpED5xgb5j3s8wPRQj4iSyUuQWR0HYcOroRRhi1LLk8v8cIkAwfH7rckNl+rYYFznBf/FYsmhrpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730416141; c=relaxed/simple;
	bh=AFlDjZW5pPRX+niprJpuota/ICn++R2YdIJhzxobc30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdKTInGCKvPieyNLrk+uurgfIeMTl92xgAnDpDWZHxhLsH9koKRsGg3UE1P4RV+vRCd3D9fKtyUDP+/NsrU49Q4SoDxaZ6VCvcWXD9EB/DohfMz84FXgQAs7UsHABfQmwqDut4NbcCI5XThRBNeKfTqhWIGWKtxnnrO7fyZO+cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q/6AofN7; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e13375d3so1629416e87.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Oct 2024 16:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730416133; x=1731020933; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t7irn5X6Q4RzDqBkS5zaHUO06iLZ9k//3tTZHqfIElI=;
        b=Q/6AofN7Qhwpabh3MVE6r1N4PDxJNziyYgaX5xK1bHKvuAwBY2IieKn3mF7QzlT0Xl
         jbcUHsbNRSCA/7nQIGd0N3hHNfMFtrqnueVR+L1LEIo/deo+ePNzBCOdyynO4+di0uLC
         IunQgqornKdfrdqECGlbfXVujWa9d+D+KxWql+ylQ/EFD0f0rEeLSMzyp2J+myMq/aah
         Q/exHtDL1wr/Q754UpAFeI40o8M7wTP0oYuMyIlykE1WBS6aucGThFwzCYItsZW+KeoB
         QK1Rkhu44lu6Q0Zjvm/e8H+V2qzia3Ci3ZRyQW/WfIE6dLkc1GfG6HV8IJFoP7WfmFaG
         T5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730416133; x=1731020933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7irn5X6Q4RzDqBkS5zaHUO06iLZ9k//3tTZHqfIElI=;
        b=SodE3xQi7cmM/A7AGLZEsvwPqic7lvkPiYzZVWjYGmzHCWCHXvaqlTbJlcPrk5U+J+
         4OdYNOs96Aa+xp2YZyNg2j0ktlhnS6BhEuGZxAtNWwKbwwF+xBA5eDyjoxsSpNIh/znf
         bvIKU9F6TZCAUuD104JyrB3uY/fZVYunRILGCMYY1eNpngWPUwMcOBV04tR76dWgk5HD
         lQ6dLXS4zDynaHGJO09IjxoMCYrTwZHJ75lFbYqyaMEib0pTnnYCOSdBGXNCpux9w3cX
         YG1Zlo3QFup224rqJJl8rnwMrpAidwXX56txlRIQ0n540DIs/kV7x2WjKgNnrLDwjehX
         bFXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUnT9stkc6wBz4XWvHQJzM29lD+Xp/UHV/YlIdemAtw1dD7jOfhWdUVdAZPiWxYe6GbuwveRSHqMSIABKdo0lfFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2E1jVFY84eLR0JgRy6QWyK3ySa1FumMlOm3h1yKZpzyCvuzbo
	dYWf6oxTmzrzyD1VZNpIGrzjcPHr1FczC7rV0Dz46eCDlq7UsDiS4XTNI0BrlAs=
X-Google-Smtp-Source: AGHT+IGcbH47VZVJ0vUumHdL7DXTh2Bwm7YoZFL4FZ1O5B93PT2hWYeoRotGnuNV/K83ckBsAxgGZw==
X-Received: by 2002:a05:6512:ac3:b0:536:56d8:24b4 with SMTP id 2adb3069b0e04-53c79e15746mr2875337e87.5.1730416133378;
        Thu, 31 Oct 2024 16:08:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde3a89sm349830e87.285.2024.10.31.16.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 16:08:51 -0700 (PDT)
Date: Fri, 1 Nov 2024 01:08:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Doug Anderson <dianders@chromium.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
Message-ID: <ujvjmcq3fvvu32dkrxqhsmqfgcki2e46f3cq3vdwq2okbbxyzf@ih2t2qkk3tpf>
References: <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh>
 <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
 <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
 <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
 <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
 <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>
 <mmmy4mmk435m6i4ic7aelkggzklrwv34vi7yam6mmasadffv2l@fi6ralq5e6vv>
 <CAMuHMdV3sEPW+k_ObTxQiLPdSsNpMRKwtUvtRt_6njy=WW4N4Q@mail.gmail.com>
 <20241030102846.GB14276@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241030102846.GB14276@pendragon.ideasonboard.com>

On Wed, Oct 30, 2024 at 12:28:46PM +0200, Laurent Pinchart wrote:
> On Wed, Oct 30, 2024 at 11:25:40AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Oct 28, 2024 at 2:34 PM Dmitry Baryshkov wrote:
> > > On Tue, Oct 22, 2024 at 07:37:01AM -0700, Doug Anderson wrote:
> > > > On Tue, Oct 22, 2024 at 12:12 AM Geert Uytterhoeven wrote:
> > > > > > > > > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > > > > > > > > in the TI driver does sound like a good idea to me...
> > > > > > > > >
> > > > > > > > > Great!
> > > > > > >
> > > > > > > > With the I2C adapter numbers, that becomes:
> > > > > > > >
> > > > > > > >     /sys/bus/auxiliary/devices
> > > > > > > >     ├── ti_sn65dsi86.gpio.1
> > > > > > > >     ├── ti_sn65dsi86.pwm.1
> > > > > > > >     ├── ti_sn65dsi86.aux.1
> > > > > > > >     ├── ti_sn65dsi86.bridge.1
> > > > > > > >     ├── ti_sn65dsi86.gpio.4
> > > > > > > >     ├── ti_sn65dsi86.pwm.4
> > > > > > > >     ├── ti_sn65dsi86.aux.4
> > > > > > > >     └── ti_sn65dsi86.bridge.4
> > > > > > > >
> > > > > > > > > adapter->nr instead like other aux subsystems already do.
> > > > > > >
> > > > > > > Unfortunately the devil is in the details, as usual: there can be
> > > > > > > multiple instances of the sn65dsi86 bridge on a single I2C bus,
> > > > > > > so adapter->nr is not guaranteed to generate a unique name.
> > > > > >
> > > > > > In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
> > > > > > chip is always at bus address 0x2d so you can't have more than one on
> > > > > > the same bus. Unless you added something funky atop it (like a mux of
> > > > > > some sort) you might be OK.
> > > > >
> > > > > It's 0x2c on mine ;-)
> > > > >
> > > > >     8.5.1 Local I2C Interface Overview
> > > > >     The 7-bit device address for SN65DSI86 is factory preset to 010110X
> > > > >     with the least significant bit being determined by the ADDR control
> > > > >     input.
> > > >
> > > > Doh! I missed that in my search of the doc. I guess because they
> > > > decided to specify the address in binary in that part so my searching
> > > > for both the 7-bit and 8-bit I2C address didn't trigger. Oh well.
> > > >
> > > > > > > Changing the auxiliary bus to use the parent's name instead of the
> > > > > > > module name, as suggested by Laurent, would fix that.
> > > > > >
> > > > > > Right. On my system dev_name() of the sn65dsi86 device is "2-002d". If
> > > > > > we had a second on i2c bus 4, we'd have:
> > > > > >
> > > > > >     /sys/bus/auxiliary/devices
> > > > > >     ├── 2-002d.gpio.0
> > > > > >     ├── 2-002d.pwm.0
> > > > > >     ├── 2-002d.aux.0
> > > > > >     ├── 2-002d.bridge.0
> > > > > >     ├── 4-002d.gpio.0
> > > > > >     ├── 4-002d.pwm.0
> > > > > >     ├── 4-002d.aux.0
> > > > > >     └── 4-002d.bridge.0
> > > > > >
> > > > > > ...and I think that's guaranteed to be unique because all the i2c
> > > > > > devices are flat in "/sys/bus/i2c/devices".
> > > > >
> > > > > Correct.
> > > >
> > > > So given everything, using the dev_name() of the "parent" sounds
> > > > pretty good and seems like it addresses everyone's concerns. Was there
> > > > a part of the conversation where someone pointed out problems with it
> > > > that I missed? Is the next step to post a patch implementing that?
> > > > It'll change sysfs paths and dev names for everyone using AUX bus, but
> > > > presumably that's OK?
> > >
> > > It also requires changing in the way the auxiliary_match_id() works.
> > > Currently matching is done using modname + ID.
> > 
> > Right, so just using the parent's name instead of modname won't work,
> > as the former is not a fixed string.
> > 
> > > So, maybe using MODNAME.NAME.parent-name.ID is better (e.g.
> > > ti_sn65dsi86.gpio.2-002d.1). It will still require changes to the
> > > match_id function, but they won't be that intrusive (one just has to
> > > skip two parts of the name instead of skipping just one).
> > 
> > IMHO this is becoming too complex. What if the parent's name contains
> > a period?
> > 
> > So just using ida_alloc() in the caller seems like the most
> > straight-forward solution.
> 
> Why would we duplicate that in every user, when it should really be the
> responsibility of the bus ? We need a better solution.

Make AUX bus keep a hashtable of parent -> ID relationship and
get from the table / allocate via IDA the ID each time somebody adds new
AUX device?

-- 
With best wishes
Dmitry

