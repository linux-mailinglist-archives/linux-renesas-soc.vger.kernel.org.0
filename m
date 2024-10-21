Return-Path: <linux-renesas-soc+bounces-9918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3114F9A5A90
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 08:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5238F1C21249
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 06:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1C71D0E35;
	Mon, 21 Oct 2024 06:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="olo/zKU8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E14D1D0E2F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 06:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729492787; cv=none; b=duYBP06jbLHsLs63AoyORdplpqxZlPIej0LR+6yJCHCTw/DD1vHKL9PHm5f56OCMj4OI/QH3lFkFj+CpzDkypvM7veVCso+6iQS2Z00+SV2ahaXFnH32Vs+RAyldsyUncoy0xjA3ziYHDsydj0ViFvAPf7sqAKxpbI9Nc0WS0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729492787; c=relaxed/simple;
	bh=KANmJQHtGUaxK8NyqzTuVzwxi2+33Ixo/ZIJE5+ZB7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUa1aeBZq1V1Hh5UDVs7eq3MC9SQSIF2n4uSlI3lS4hQMO5Gexo8k/F2JGpyVIMFbJnoyFFFOrwenf1P51yUSe0z/1cYECKFOwqGNdvW5zYT9g2NS5k2XQ9bg5GRCJDP9vFZwSKbQEuOw70l86MdUhyJW51U/Z4tz9PlSnaYBa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=olo/zKU8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBA3C4CEC3;
	Mon, 21 Oct 2024 06:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729492785;
	bh=KANmJQHtGUaxK8NyqzTuVzwxi2+33Ixo/ZIJE5+ZB7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olo/zKU8pvrJDitPjb9mEY/eT1HxXbtL0gtrBpSWHvfpTjLBd1M1T2PXMoVV3GLge
	 kKueq7T1t5dJkwulI7R59NU6fILkPvIX6uOb6mcn70sweGd8h9cYfh2m8wpeXGtVAk
	 kBSLf+0Wj1PA5QHBVNeK06zCKiHVM7X60H7Hlh6Q=
Date: Mon, 21 Oct 2024 08:39:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
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
Message-ID: <2024102119-oversweet-labored-aa07@gregkh>
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
 <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
 <2024101855-judo-tattered-bc3c@gregkh>
 <20241018142522.GA28934@pendragon.ideasonboard.com>
 <2024101837-crushed-emphasis-b496@gregkh>
 <20241020143629.GC28934@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241020143629.GC28934@pendragon.ideasonboard.com>

On Sun, Oct 20, 2024 at 05:36:29PM +0300, Laurent Pinchart wrote:
> On Fri, Oct 18, 2024 at 04:31:21PM +0200, Greg KH wrote:
> > On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart wrote:
> > > On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > > > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeven wrote:
> > > > > On Fri, Oct 18, 2024 at 3:10 PM Laurent Pinchart wrote:
> > > > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven wrote:
> > > > > > > Each bridge instance creates up to four auxiliary devices with different
> > > > > > > names.  However, their IDs are always zero, causing duplicate filename
> > > > > > > errors when a system has multiple bridges:
> > > > > > >
> > > > > > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn65dsi86.gpio.0'
> > > > > > >
> > > > > > > Fix this by using a unique instance ID per bridge instance.
> > > > > >
> > > > > > Isn't this something that should be handled by the AUX core ? The code
> > > > > > below would otherwise need to be duplicated by all drivers, which seems
> > > > > > a burden we should avoid.
> > > > > 
> > > > > According to the documentation, this is the responsibility of the caller
> > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L81
> > > > > I believe this is the same for platform devices.
> > > > > See also the example at
> > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L116
> > > > > 
> > > > > Note: the platform bus supports PLATFORM_DEVID_AUTO, but the auxiliary
> > > > > bus does not.
> > > > 
> > > > Yes, it does not as it's up to the caller to create a unique name, like
> > > > your patch here does.  I'd argue that platform should also not do
> > > > automatic device ids, but that's a different argument :)
> > > 
> > > __auxiliary_device_add() creates the device name with
> > > 
> > > 	dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev->id);
> > > 
> > > I'm not calling for a PLATFORM_DEVID_AUTO-like feature here, but
> > > shouldn't the first component of the device name use the parent's name
> > > instead of the module name ?
> > 
> > Why would the parent's name not be the module name?  That name is
> > guaranteed unique in the system.  If you want "uniqueness" within the
> > driver/module, use the name and id field please.
> > 
> > That's worked well so far, but to be fair, aux devices are pretty new.
> > What problem is this naming scheme causing?
> 
> Auxiliary devices are created as children of a parent device. When
> multiple instances of the same parent type exist, this will be reflected
> in the /sys/devices/ devices tree hierarchy without any issue. The
> problem comes from the fact the the auxiliary devices need a unique name
> for /sys/bus/auxialiary/devices/, where we somehow have to differenciate
> devices of identical types.
> 
> Essentially, we're trying to summarize a whole hierarchy (path in
> /sys/devices/) into a single string. There are different ways to solve
> this. For platform devices, we use a device ID. For I2C devices, we use
> the parent's bus number. Other buses use different schemes.
> 
> Geert's patch implements a mechanism in the ti-sn65dsi86 driver to
> handle this, and assign an id managed by the parent. In a sense we could
> consider this to be similar to what is done for I2C, where the bus
> number is also a property of the parent. However, the big difference is
> that the I2C bus number is managed by the I2C subsystem, while here the
> id is managed by the ti-sn65dsi86 driver, not by the auxiliary device
> core. This would require duplicating the same mechanism in every single
> driver creating auxiliary devices. This strikes me as a fairly bad idea.
> The problem should be solved by the core, not by individual drivers.

The "id" is just a unique number, it is "managed" by the thing that is
creating the devices themselves, not the aux core code.  I don't see why
the i2c bus number has to match the same number that the ti driver
creates, it could be anything, as long as it doesn't match anything else
currently created by that driver.

If we had the aux core code create the id, it would just use a unique
counter, and that would not reflect any mapping to anything, so I don't
see how that is any different here.

confused,

greg k-h

