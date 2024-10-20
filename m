Return-Path: <linux-renesas-soc+bounces-9913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C27649A5486
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Oct 2024 16:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDB771C20CEB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Oct 2024 14:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E80192B79;
	Sun, 20 Oct 2024 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Py/oGZgR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEE92B9C6
	for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Oct 2024 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729434998; cv=none; b=fd+YOUietifIiddOzc9yYlPYN3AupDD6bffr4QTv+2c6SFLGDc+/KKZXQMoy7LpoHKbWvP4JUwNClBCbHPZcLoBBYwM5ostP6v1iWxyCXluLQOu9ATGnKOkAAeWxrobI4cicBLlXumXJemyFmN9HRWjzHEtrj2harqSmT8VY+ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729434998; c=relaxed/simple;
	bh=0sSBQ0AgvT+5mlAQvbezHnEfs7nP96DG1KzWG5CPujY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYP0Cyv++ojPDzh4bSwrH6BF0e/uriWpX0wJtQk0+k+mCYrUNYzjSJKhNfpsIkdQ7CvtrIfrxitmVVA1U0Q31AZ0N+8n/mMtkFl49r13vK8n4bodOnyA63n4hraupqs+QHhPgf9HRTBkYMo41KUuaEPZsUiTsXtRZ2Thgxt0VFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Py/oGZgR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6ED2D502;
	Sun, 20 Oct 2024 16:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729434889;
	bh=0sSBQ0AgvT+5mlAQvbezHnEfs7nP96DG1KzWG5CPujY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Py/oGZgRYQN8xaY/A5rPKNv2qUhlbp7iRFUkhexVD9pti9kuOUOv7DOc6f7Fio99A
	 uxUAu/fCjwmM/6cAE8kINRCARQCJ6q/LX/sqXv6cZUiijKWE75TU0MIBx0F/eCLNDz
	 kOG3EvFeHPktGgf6TmhiATDz2QA0Jy3TXVUwTk94=
Date: Sun, 20 Oct 2024 17:36:29 +0300
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
Message-ID: <20241020143629.GC28934@pendragon.ideasonboard.com>
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
 <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
 <2024101855-judo-tattered-bc3c@gregkh>
 <20241018142522.GA28934@pendragon.ideasonboard.com>
 <2024101837-crushed-emphasis-b496@gregkh>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024101837-crushed-emphasis-b496@gregkh>

On Fri, Oct 18, 2024 at 04:31:21PM +0200, Greg KH wrote:
> On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart wrote:
> > On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, Oct 18, 2024 at 3:10 PM Laurent Pinchart wrote:
> > > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven wrote:
> > > > > > Each bridge instance creates up to four auxiliary devices with different
> > > > > > names.  However, their IDs are always zero, causing duplicate filename
> > > > > > errors when a system has multiple bridges:
> > > > > >
> > > > > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn65dsi86.gpio.0'
> > > > > >
> > > > > > Fix this by using a unique instance ID per bridge instance.
> > > > >
> > > > > Isn't this something that should be handled by the AUX core ? The code
> > > > > below would otherwise need to be duplicated by all drivers, which seems
> > > > > a burden we should avoid.
> > > > 
> > > > According to the documentation, this is the responsibility of the caller
> > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L81
> > > > I believe this is the same for platform devices.
> > > > See also the example at
> > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L116
> > > > 
> > > > Note: the platform bus supports PLATFORM_DEVID_AUTO, but the auxiliary
> > > > bus does not.
> > > 
> > > Yes, it does not as it's up to the caller to create a unique name, like
> > > your patch here does.  I'd argue that platform should also not do
> > > automatic device ids, but that's a different argument :)
> > 
> > __auxiliary_device_add() creates the device name with
> > 
> > 	dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev->id);
> > 
> > I'm not calling for a PLATFORM_DEVID_AUTO-like feature here, but
> > shouldn't the first component of the device name use the parent's name
> > instead of the module name ?
> 
> Why would the parent's name not be the module name?  That name is
> guaranteed unique in the system.  If you want "uniqueness" within the
> driver/module, use the name and id field please.
> 
> That's worked well so far, but to be fair, aux devices are pretty new.
> What problem is this naming scheme causing?

Auxiliary devices are created as children of a parent device. When
multiple instances of the same parent type exist, this will be reflected
in the /sys/devices/ devices tree hierarchy without any issue. The
problem comes from the fact the the auxiliary devices need a unique name
for /sys/bus/auxialiary/devices/, where we somehow have to differenciate
devices of identical types.

Essentially, we're trying to summarize a whole hierarchy (path in
/sys/devices/) into a single string. There are different ways to solve
this. For platform devices, we use a device ID. For I2C devices, we use
the parent's bus number. Other buses use different schemes.

Geert's patch implements a mechanism in the ti-sn65dsi86 driver to
handle this, and assign an id managed by the parent. In a sense we could
consider this to be similar to what is done for I2C, where the bus
number is also a property of the parent. However, the big difference is
that the I2C bus number is managed by the I2C subsystem, while here the
id is managed by the ti-sn65dsi86 driver, not by the auxiliary device
core. This would require duplicating the same mechanism in every single
driver creating auxiliary devices. This strikes me as a fairly bad idea.
The problem should be solved by the core, not by individual drivers.

-- 
Regards,

Laurent Pinchart

