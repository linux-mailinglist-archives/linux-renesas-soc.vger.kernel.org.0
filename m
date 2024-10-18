Return-Path: <linux-renesas-soc+bounces-9879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCF89A4133
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 16:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D2EB1F2495A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 14:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4A93C17;
	Fri, 18 Oct 2024 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TTrL2xL6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17BA1CD2B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729261884; cv=none; b=DawA9+HDwKsqwdomi+e9iOXaatsTg3SyvaTYq+fFbMd9izAseGQilbRKCFT793NDRbICgg2IVcyVJBJl6rFEzSSVfuzmf7vQ6KsgiujMMp97dQjPx0xi3OWQPWzR0eWhyQvOmnIH2d5DR+RbETFoOKEsS3CYIqHBxV7UJ7hs0Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729261884; c=relaxed/simple;
	bh=JfB9lvxMoWET2hOxXPNBdT2uKL/PscD/8S5+uwWZoes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMri+GjN/7psAgRbbWh/mirjoO+ApN45deDnSG1TBca/c0U2FMPWKRFHBsDkkDKpFsZuA43xnbk30VYUBF6arsxYnm/M9Oq1qDu4Km5B4nLEr1yP9qHjVAG40aDCGBfd+U9HNLkgD2lk6ysw41aVp25hnHY8OinDDNcmelA+BTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TTrL2xL6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0463C4CEC3;
	Fri, 18 Oct 2024 14:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729261884;
	bh=JfB9lvxMoWET2hOxXPNBdT2uKL/PscD/8S5+uwWZoes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTrL2xL6DSDIbCrJeORRxW4iIZGoSXIE5we4tnNvBvudicT0CH0YiKnQeLb8wU2K0
	 kuIXEq2odpz3i1ZKHSsHjCaGmmOD+ByVDizU3w+RJCpGV8X6LXUqJkhvDiLpszpLVP
	 EloqGQO8A+Oje0nEp/wEl2VIMVEgzaKTKkKr2k70=
Date: Fri, 18 Oct 2024 16:31:21 +0200
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
Message-ID: <2024101837-crushed-emphasis-b496@gregkh>
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
 <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
 <2024101855-judo-tattered-bc3c@gregkh>
 <20241018142522.GA28934@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241018142522.GA28934@pendragon.ideasonboard.com>

On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart wrote:
> Hi Greg,
> 
> On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeven wrote:
> > > On Fri, Oct 18, 2024 at 3:10 PM Laurent Pinchart wrote:
> > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven wrote:
> > > > > Each bridge instance creates up to four auxiliary devices with different
> > > > > names.  However, their IDs are always zero, causing duplicate filename
> > > > > errors when a system has multiple bridges:
> > > > >
> > > > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn65dsi86.gpio.0'
> > > > >
> > > > > Fix this by using a unique instance ID per bridge instance.
> > > >
> > > > Isn't this something that should be handled by the AUX core ? The code
> > > > below would otherwise need to be duplicated by all drivers, which seems
> > > > a burden we should avoid.
> > > 
> > > According to the documentation, this is the responsibility of the caller
> > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L81
> > > I believe this is the same for platform devices.
> > > See also the example at
> > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L116
> > > 
> > > Note: the platform bus supports PLATFORM_DEVID_AUTO, but the auxiliary
> > > bus does not.
> > 
> > Yes, it does not as it's up to the caller to create a unique name, like
> > your patch here does.  I'd argue that platform should also not do
> > automatic device ids, but that's a different argument :)
> 
> __auxiliary_device_add() creates the device name with
> 
> 	dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev->id);
> 
> I'm not calling for a PLATFORM_DEVID_AUTO-like feature here, but
> shouldn't the first component of the device name use the parent's name
> instead of the module name ?

Why would the parent's name not be the module name?  That name is
guaranteed unique in the system.  If you want "uniqueness" within the
driver/module, use the name and id field please.

That's worked well so far, but to be fair, aux devices are pretty new.
What problem is this naming scheme causing?

thanks,

greg k-h

