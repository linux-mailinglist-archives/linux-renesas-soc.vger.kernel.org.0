Return-Path: <linux-renesas-soc+bounces-9932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3E59A5EA1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 10:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 986801F210AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 08:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14011E201F;
	Mon, 21 Oct 2024 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o+pZXVdY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA20194C9D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 08:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729499319; cv=none; b=Io4MQJzzFIyZIwGZ3JroOulLuykZ2V/mLcqMct9Yux2LO4/8iZE5NP60OD25jFMDwTrxHAn9Kt3jBoDt/K8Pp9wH7a4s+Fd8RKb96+lO8HY9c9ldqr2dPK1+BnVcZ6QLcK8ipPrcJ4OA4i7rVX9TqaBm2X1OZPBE2pinB+t0YT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729499319; c=relaxed/simple;
	bh=QC+eRU7c3hjNsyrI6I905/v7LtjY5UFPQX8oG00UXnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WALHEuH8olKU2cTT2natr0jvSpdCjw0iAyhGL6A8b1gF2ITMxLJxMstIH7CGvW1hqa5j/8O2WrmaGML8YAVXGpk+rNm/lrkPRjQ7aX6gptZ8A7Xkc24IGQ6j9+pnlGjQkVSAMwAbLFWxKwCRAs3c9MIS0cnqlqecbcWAlN9MHqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o+pZXVdY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4AD717D6;
	Mon, 21 Oct 2024 10:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729499210;
	bh=QC+eRU7c3hjNsyrI6I905/v7LtjY5UFPQX8oG00UXnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+pZXVdYCR7GIQ5Mf5BvMZFW6lT/z2uE5t3snpm6EsIZF982AQhJHZZ21lAfuSPTU
	 N2g9ZE7VAkyKrwa3yyif0/omXm1nZZoAnLVEoRGGDaka9IjVAX6hD+ca81kEWX+RCX
	 gO95MPYhFmeWF+juYDrqnP/B1T6zzCIbBNzUT0cI=
Date: Mon, 21 Oct 2024 11:28:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Douglas Anderson <dianders@chromium.org>,
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
Message-ID: <20241021082830.GA31131@pendragon.ideasonboard.com>
References: <20241018131035.GA20602@pendragon.ideasonboard.com>
 <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
 <2024101855-judo-tattered-bc3c@gregkh>
 <20241018142522.GA28934@pendragon.ideasonboard.com>
 <2024101837-crushed-emphasis-b496@gregkh>
 <20241020143629.GC28934@pendragon.ideasonboard.com>
 <2024102119-oversweet-labored-aa07@gregkh>
 <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh>
 <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>

On Mon, Oct 21, 2024 at 10:23:26AM +0200, Geert Uytterhoeven wrote:
> On Mon, Oct 21, 2024 at 9:27 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Mon, Oct 21, 2024 at 08:58:30AM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Oct 21, 2024 at 8:39 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > On Sun, Oct 20, 2024 at 05:36:29PM +0300, Laurent Pinchart wrote:
> > > > > On Fri, Oct 18, 2024 at 04:31:21PM +0200, Greg KH wrote:
> > > > > > On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart wrote:
> > > > > > > On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > > > > > > > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > On Fri, Oct 18, 2024 at 3:10 PM Laurent Pinchart wrote:
> > > > > > > > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > > > Each bridge instance creates up to four auxiliary devices with different
> > > > > > > > > > > names.  However, their IDs are always zero, causing duplicate filename
> > > > > > > > > > > errors when a system has multiple bridges:
> > > > > > > > > > >
> > > > > > > > > > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn65dsi86.gpio.0'
> > > > > > > > > > >
> > > > > > > > > > > Fix this by using a unique instance ID per bridge instance.
> > > > > > > > > >
> > > > > > > > > > Isn't this something that should be handled by the AUX core ? The code
> > > > > > > > > > below would otherwise need to be duplicated by all drivers, which seems
> > > > > > > > > > a burden we should avoid.
> > > > > > > > >
> > > > > > > > > According to the documentation, this is the responsibility of the caller
> > > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L81
> > > > > > > > > I believe this is the same for platform devices.
> > > > > > > > > See also the example at
> > > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L116
> > > > > > > > >
> > > > > > > > > Note: the platform bus supports PLATFORM_DEVID_AUTO, but the auxiliary
> > > > > > > > > bus does not.
> > > > > > > >
> > > > > > > > Yes, it does not as it's up to the caller to create a unique name, like
> > > > > > > > your patch here does.  I'd argue that platform should also not do
> > > > > > > > automatic device ids, but that's a different argument :)
> > > > > > >
> > > > > > > __auxiliary_device_add() creates the device name with
> > > > > > >
> > > > > > >   dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev->id);
> > > > > > >
> > > > > > > I'm not calling for a PLATFORM_DEVID_AUTO-like feature here, but
> > > > > > > shouldn't the first component of the device name use the parent's name
> > > > > > > instead of the module name ?
> > > > > >
> > > > > > Why would the parent's name not be the module name?  That name is
> > > > > > guaranteed unique in the system.  If you want "uniqueness" within the
> > > > > > driver/module, use the name and id field please.
> > > > > >
> > > > > > That's worked well so far, but to be fair, aux devices are pretty new.
> > > > > > What problem is this naming scheme causing?
> > > > >
> > > > > Auxiliary devices are created as children of a parent device. When
> > > > > multiple instances of the same parent type exist, this will be reflected
> > > > > in the /sys/devices/ devices tree hierarchy without any issue. The
> > > > > problem comes from the fact the the auxiliary devices need a unique name
> > > > > for /sys/bus/auxialiary/devices/, where we somehow have to differenciate
> > > > > devices of identical types.
> > > > >
> > > > > Essentially, we're trying to summarize a whole hierarchy (path in
> > > > > /sys/devices/) into a single string. There are different ways to solve
> > > > > this. For platform devices, we use a device ID. For I2C devices, we use
> > > > > the parent's bus number. Other buses use different schemes.
> > > > >
> > > > > Geert's patch implements a mechanism in the ti-sn65dsi86 driver to
> > > > > handle this, and assign an id managed by the parent. In a sense we could
> > > > > consider this to be similar to what is done for I2C, where the bus
> > > > > number is also a property of the parent. However, the big difference is
> > > > > that the I2C bus number is managed by the I2C subsystem, while here the
> > > > > id is managed by the ti-sn65dsi86 driver, not by the auxiliary device
> > > > > core. This would require duplicating the same mechanism in every single
> > > > > driver creating auxiliary devices. This strikes me as a fairly bad idea.
> > > > > The problem should be solved by the core, not by individual drivers.
> > > >
> > > > The "id" is just a unique number, it is "managed" by the thing that is
> > > > creating the devices themselves, not the aux core code.  I don't see why
> > > > the i2c bus number has to match the same number that the ti driver
> > > > creates, it could be anything, as long as it doesn't match anything else
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

It still means the driver needs to manage the ID space, but it's way
less intrusive so I'm OK with that, even if I still think a mechanism in
the auxiliary bus code would be best. After all, the id is needed to
construct a unique name, based on a naming scheme that is internal to
the auxiliary bus core (combining the module name with the device name
and the id). Requiring users to manage the id space to fulfil
constraints internal to the core seems a bit ill-designed to me.

> > Great!
> >
> > > > If we had the aux core code create the id, it would just use a unique
> > > > counter, and that would not reflect any mapping to anything, so I don't
> > > > see how that is any different here.
> > >
> > > And then we would get something like:
> > >
> > > /sys/bus/auxiliary/devices
> > > ├── ti_sn65dsi86.gpio.0
> > > ├── ti_sn65dsi86.pwm.1
> > > ├── ti_sn65dsi86.aux.2
> > > ├── ti_sn65dsi86.bridge.3
> > > ├── ti_sn65dsi86.gpio.4
> > > ├── ti_sn65dsi86.pwm.5
> > > ├── ti_sn65dsi86.aux.6
> > > └── ti_sn65dsi86.bridge.7
> > >
> > > Which is similar to the first approach I tried (calling ida_alloc() in
> > > ti_sn65dsi86_add_aux_device() instead of ti_sn65dsi86_probe()).
> >
> > That id scheme looks really odd, don't you think?  Try using the
> 
> Yes, that's what happens if you let an external entity come up
> with the unique IDs.
> 
> With the I2C adapter numbers, that becomes:
> 
>     /sys/bus/auxiliary/devices
>     ├── ti_sn65dsi86.gpio.1
>     ├── ti_sn65dsi86.pwm.1
>     ├── ti_sn65dsi86.aux.1
>     ├── ti_sn65dsi86.bridge.1
>     ├── ti_sn65dsi86.gpio.4
>     ├── ti_sn65dsi86.pwm.4
>     ├── ti_sn65dsi86.aux.4
>     └── ti_sn65dsi86.bridge.4
> 
> > adapter->nr instead like other aux subsystems already do.
> 
> FTR, according to "git grep "adapter->nr" -- $(git grep -l
> auxiliary_device_init)",
> no existing driver uses this mechanism yet.
> 
> "git grep ida_alloc -- $(git grep -l auxiliary_device_init)" does show
> several hits.

-- 
Regards,

Laurent Pinchart

