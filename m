Return-Path: <linux-renesas-soc+bounces-14781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C31A6E0D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 18:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAC7C189218D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 17:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3332825F992;
	Mon, 24 Mar 2025 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fp8SR1vq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE1189520
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 17:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742837482; cv=none; b=RbUJ17VCvcw80Xpn0DwAJbNK980leYsVnG0lM7QEeWeHisNcQRkDYbsc11hjcajEqiCFl5kUL07kYNOdqMkZ8/971YUBWLcoKH40ZShM9cywZFeh85UIILJ7jUss8dpHzL4SNn47qlUJHlT0bp/4MIvey7symbMoyHtLNPyLxlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742837482; c=relaxed/simple;
	bh=JndadwcFovCueYuRcQKxgQ2ynyCrGUVZP4AbHS5ILyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctPGdGB+IpuVxac0hPeXv/rnDyEIpbe6pdkycaofIStWasbQzx6ngzj1zME8UOXpr2uxLbnbCTDlFDsvLiDq+BLdpHPUa1DPflZaUGBNlle4AVY4UILw2D7hYPYNg+q46xvVdlA7+IWJkQyXvQqzEJtnt0rsUuLFJ/21eHHSe8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fp8SR1vq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A16E7455;
	Mon, 24 Mar 2025 18:29:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742837371;
	bh=JndadwcFovCueYuRcQKxgQ2ynyCrGUVZP4AbHS5ILyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fp8SR1vqnjOUP4eQ8LtxHuCAzVrSeglXOw+rxvyFGhX6CPn1s2Cv81vePY3bAzQFh
	 h4slGcQVmE9fxa+k6Mgt+ue0Wk+pJDD6UWxQYeg6IvNYZI/HZht8lhUu7GqI1RdAxd
	 ZUpY6P+tqWvMB5CjlS8IKjRFl/DaIY5rGXViv9K0=
Date: Mon, 24 Mar 2025 19:30:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
Message-ID: <20250324173055.GA18359@pendragon.ideasonboard.com>
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
 <20250318204133.GC22890@pendragon.ideasonboard.com>
 <Z9ne78KhxfKYgnh_@ninjato>
 <20250324164025.GK5113@pendragon.ideasonboard.com>
 <CAD=FV=Umc0aAvDrQhoZoaaOHjn8B2u0BTtgqeS3oEcH+mtAgwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Umc0aAvDrQhoZoaaOHjn8B2u0BTtgqeS3oEcH+mtAgwA@mail.gmail.com>

On Mon, Mar 24, 2025 at 10:17:05AM -0700, Doug Anderson wrote:
> On Mon, Mar 24, 2025 at 9:40 AM Laurent Pinchart wrote:
> > On Tue, Mar 18, 2025 at 10:00:31PM +0100, Wolfram Sang wrote:
> > > Hi Laurent,
> > >
> > > > > Read out and check the ID registers, so we can bail out if I2C
> > > > > communication does not work or if the device is unknown.
> > > >
> > > > What's the advantage of that, what are you trying to guard against ?
> > >
> > > That a random chip at address 0x2c will be used.
> >
> > Is that really a problem ? That would only occur with a broken DT, is it
> > worth guarding against a development-time issue with a runtime check
> > that will increase boot time for every user ?
> 
> FWIW, this can also happen simply due to broken / damaged hardware. If
> a board gets stressed and causes a pin to become disconnected or if a
> regulator ages and stops providing power then we can also end up in
> this state. Getting a nice obvious error at probe when the device
> isn't responding at all can make problems like this much easier to
> debug.

I'm not fully convinced it's worth it, compared to an error at runtime,
and especially given that there are way more pins than supplies or
SCL/SDA that could suffer from a similar issue. I won't block the patch,
but I think it's overkill.

> It's not uncommon for i2c devices to probe to make sure the
> device is really there at bootup. Checking for the full 8-byte ID is
> probably a bit overkill, but at the same time if we're going to probe
> something the ID is not a terrible thing to probe and reading 8 bytes
> won't really take much longer than reading 1.

-- 
Regards,

Laurent Pinchart

