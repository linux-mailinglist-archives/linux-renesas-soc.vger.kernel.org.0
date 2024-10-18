Return-Path: <linux-renesas-soc+bounces-9878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D27E9A411C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 16:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B42751F20F26
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 14:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13898189F55;
	Fri, 18 Oct 2024 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oJkalF9f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D84B20E327
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729261538; cv=none; b=egjHZxP4l2bgu6U2rxClEt+eLKZDKAjXIvetvrz6lvFqGk+i6BRv+sC3bMbpk6b+CYJ7QFSGg9bCQVgqGOtDJBzWwJLwdL4ajrlrgycwtnZEz1EaHxPeGXjvdZxbNrY53jP3Xo3P6f2qCx9rU7ytPIdnpE23tziWL8+3YC+ooTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729261538; c=relaxed/simple;
	bh=9RkABO50gCAzHa4fpZzJyBae5GhdjOnIz9rMfHx7H4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YN4Z1ebgBdAFaZlcMzld9Wb97NW7xGXJgdvK2xOx8FcjWQETEhPMjsmmD8c6H+4bloi23YtfbSmWUQAE8KCgQ1BMyTbDHUyqOeZRSETFVEXtaPDdl3q2UlikUBg8VzODcyI9KZvK7PFpulWy/mMg71tDYN0CdJJ5BPFHl5zVKBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oJkalF9f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5306514;
	Fri, 18 Oct 2024 16:23:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729261424;
	bh=9RkABO50gCAzHa4fpZzJyBae5GhdjOnIz9rMfHx7H4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJkalF9fNcH9JuhIAlFwG5RJQlXv5xZ9wSOYRICwJP8AccLRfDAO5Cf/1P7RnG82r
	 Kpi5Vy36iMRqwf4LZ6xVjqHTJTu7STXHNmxixV3qBe4etdcZuVvjOeC5FRGJ6zZOaz
	 YYcx+Rc8KWIoPE7S083keanMutZBk5JT9w6vkKMA=
Date: Fri, 18 Oct 2024 17:25:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg KH <gregkh@linuxfoundation.org>
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
Message-ID: <20241018142522.GA28934@pendragon.ideasonboard.com>
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
 <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
 <2024101855-judo-tattered-bc3c@gregkh>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024101855-judo-tattered-bc3c@gregkh>

Hi Greg,

On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Oct 18, 2024 at 3:10 PM Laurent Pinchart wrote:
> > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven wrote:
> > > > Each bridge instance creates up to four auxiliary devices with different
> > > > names.  However, their IDs are always zero, causing duplicate filename
> > > > errors when a system has multiple bridges:
> > > >
> > > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn65dsi86.gpio.0'
> > > >
> > > > Fix this by using a unique instance ID per bridge instance.
> > >
> > > Isn't this something that should be handled by the AUX core ? The code
> > > below would otherwise need to be duplicated by all drivers, which seems
> > > a burden we should avoid.
> > 
> > According to the documentation, this is the responsibility of the caller
> > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L81
> > I believe this is the same for platform devices.
> > See also the example at
> > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L116
> > 
> > Note: the platform bus supports PLATFORM_DEVID_AUTO, but the auxiliary
> > bus does not.
> 
> Yes, it does not as it's up to the caller to create a unique name, like
> your patch here does.  I'd argue that platform should also not do
> automatic device ids, but that's a different argument :)

__auxiliary_device_add() creates the device name with

	dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev->id);

I'm not calling for a PLATFORM_DEVID_AUTO-like feature here, but
shouldn't the first component of the device name use the parent's name
instead of the module name ?

> This change looks good to me!
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
Regards,

Laurent Pinchart

