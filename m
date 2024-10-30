Return-Path: <linux-renesas-soc+bounces-10201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0F39B6019
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 11:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DF451C20A1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 10:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348F71E1C2B;
	Wed, 30 Oct 2024 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V9oUKfl3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFFB1E0DE9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Oct 2024 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284138; cv=none; b=eNbCeb1++RFqWKj12qwVYx6grKQV7FmSO1Eo+wa2fMbZEBe7jZhgKrvcoEGl09Q2b0/f2el6Absl3QBjh8zSKBkvvoKSWL1Cemn/dmbz0tNE1pdUCsU842VbeUJaXLp7Qfs+v9oObjTlL2jnZ/cf6OdDyX6T9YZOu+iIjNmXoAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284138; c=relaxed/simple;
	bh=2m9U0YPyqIjiMux/kzHNN8MUjFxqTrUHxENOWudqImM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwTUwYPQnbuxZ9cVtBSvYKLQz2UVwjEzYWZPe5PkFwdpf3qFn24Jyq/X+1nKe9dUzVZPgYxxA1ya/bfAA/kQJcSkVVjAXlQXwWv3a38VDmoU1q7XwvuC3fH099u5tw7Oe3UkW/d2MaB4aH1swzOtM0WAt0QdgjayWwQ71Ok8rY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V9oUKfl3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2FF1A8F;
	Wed, 30 Oct 2024 11:28:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730284130;
	bh=2m9U0YPyqIjiMux/kzHNN8MUjFxqTrUHxENOWudqImM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9oUKfl3sIB+kSqLHoxezWGdbKNSlzWNzU0CMhVya0AcOmZB/EgGemyImMbtojmRy
	 +sSIkQOU4a6vd4hTb7gOwLFs7XZiDRLS++XNvNc7KKFTJa8/kxruuhLkdQ4g1QL4mn
	 ry6RGG4MOdXgDb07CDp/etOd3nZsBYjZHjfk0vqo=
Date: Wed, 30 Oct 2024 12:28:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Doug Anderson <dianders@chromium.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
Message-ID: <20241030102846.GB14276@pendragon.ideasonboard.com>
References: <2024102119-oversweet-labored-aa07@gregkh>
 <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh>
 <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
 <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
 <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
 <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
 <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>
 <mmmy4mmk435m6i4ic7aelkggzklrwv34vi7yam6mmasadffv2l@fi6ralq5e6vv>
 <CAMuHMdV3sEPW+k_ObTxQiLPdSsNpMRKwtUvtRt_6njy=WW4N4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV3sEPW+k_ObTxQiLPdSsNpMRKwtUvtRt_6njy=WW4N4Q@mail.gmail.com>

On Wed, Oct 30, 2024 at 11:25:40AM +0100, Geert Uytterhoeven wrote:
> On Mon, Oct 28, 2024 at 2:34 PM Dmitry Baryshkov wrote:
> > On Tue, Oct 22, 2024 at 07:37:01AM -0700, Doug Anderson wrote:
> > > On Tue, Oct 22, 2024 at 12:12 AM Geert Uytterhoeven wrote:
> > > > > > > > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > > > > > > > in the TI driver does sound like a good idea to me...
> > > > > > > >
> > > > > > > > Great!
> > > > > >
> > > > > > > With the I2C adapter numbers, that becomes:
> > > > > > >
> > > > > > >     /sys/bus/auxiliary/devices
> > > > > > >     ├── ti_sn65dsi86.gpio.1
> > > > > > >     ├── ti_sn65dsi86.pwm.1
> > > > > > >     ├── ti_sn65dsi86.aux.1
> > > > > > >     ├── ti_sn65dsi86.bridge.1
> > > > > > >     ├── ti_sn65dsi86.gpio.4
> > > > > > >     ├── ti_sn65dsi86.pwm.4
> > > > > > >     ├── ti_sn65dsi86.aux.4
> > > > > > >     └── ti_sn65dsi86.bridge.4
> > > > > > >
> > > > > > > > adapter->nr instead like other aux subsystems already do.
> > > > > >
> > > > > > Unfortunately the devil is in the details, as usual: there can be
> > > > > > multiple instances of the sn65dsi86 bridge on a single I2C bus,
> > > > > > so adapter->nr is not guaranteed to generate a unique name.
> > > > >
> > > > > In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
> > > > > chip is always at bus address 0x2d so you can't have more than one on
> > > > > the same bus. Unless you added something funky atop it (like a mux of
> > > > > some sort) you might be OK.
> > > >
> > > > It's 0x2c on mine ;-)
> > > >
> > > >     8.5.1 Local I2C Interface Overview
> > > >     The 7-bit device address for SN65DSI86 is factory preset to 010110X
> > > >     with the least significant bit being determined by the ADDR control
> > > >     input.
> > >
> > > Doh! I missed that in my search of the doc. I guess because they
> > > decided to specify the address in binary in that part so my searching
> > > for both the 7-bit and 8-bit I2C address didn't trigger. Oh well.
> > >
> > > > > > Changing the auxiliary bus to use the parent's name instead of the
> > > > > > module name, as suggested by Laurent, would fix that.
> > > > >
> > > > > Right. On my system dev_name() of the sn65dsi86 device is "2-002d". If
> > > > > we had a second on i2c bus 4, we'd have:
> > > > >
> > > > >     /sys/bus/auxiliary/devices
> > > > >     ├── 2-002d.gpio.0
> > > > >     ├── 2-002d.pwm.0
> > > > >     ├── 2-002d.aux.0
> > > > >     ├── 2-002d.bridge.0
> > > > >     ├── 4-002d.gpio.0
> > > > >     ├── 4-002d.pwm.0
> > > > >     ├── 4-002d.aux.0
> > > > >     └── 4-002d.bridge.0
> > > > >
> > > > > ...and I think that's guaranteed to be unique because all the i2c
> > > > > devices are flat in "/sys/bus/i2c/devices".
> > > >
> > > > Correct.
> > >
> > > So given everything, using the dev_name() of the "parent" sounds
> > > pretty good and seems like it addresses everyone's concerns. Was there
> > > a part of the conversation where someone pointed out problems with it
> > > that I missed? Is the next step to post a patch implementing that?
> > > It'll change sysfs paths and dev names for everyone using AUX bus, but
> > > presumably that's OK?
> >
> > It also requires changing in the way the auxiliary_match_id() works.
> > Currently matching is done using modname + ID.
> 
> Right, so just using the parent's name instead of modname won't work,
> as the former is not a fixed string.
> 
> > So, maybe using MODNAME.NAME.parent-name.ID is better (e.g.
> > ti_sn65dsi86.gpio.2-002d.1). It will still require changes to the
> > match_id function, but they won't be that intrusive (one just has to
> > skip two parts of the name instead of skipping just one).
> 
> IMHO this is becoming too complex. What if the parent's name contains
> a period?
> 
> So just using ida_alloc() in the caller seems like the most
> straight-forward solution.

Why would we duplicate that in every user, when it should really be the
responsibility of the bus ? We need a better solution.

-- 
Regards,

Laurent Pinchart

