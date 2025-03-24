Return-Path: <linux-renesas-soc+bounces-14775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1A6A6E005
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 17:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA00E3B34C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 16:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7F72638A0;
	Mon, 24 Mar 2025 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D9C5BF6x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC932620C9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 16:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742834452; cv=none; b=BMN3pX50Saqs9bdimRYhcMGcH7FXfigoIWj2L0lerpFzDl8QGP8Ue5q9goMUnVkFfBMR0Hs6E+GYpktDrkXVD2ahTuHWSdiwG0xpxjqw6ecRpfA1EYSFqHbA5h1Ta13e8c9qiUnumPSSvp36orLwDOY1cjEM4iNKH7c+zdcgjcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742834452; c=relaxed/simple;
	bh=C4qCR5IiDNqllMSB5IXrinpWcZEJSikRxGwqsymPnqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLa3+2nA7w9nvoBnNGxQzgNrxMkaczG3D+b9qfx37LyaUlOt7Fmr1paJTJkY6xGBNGKAnlPcXsaqYW77prZ0rg0jEaVRN8C6Nin7q88fyte64ieNOyGYjv2526CyC+1TzkBmb5XLWyt3/woBKztD7/LhhAUTitDG3EatvnvYwtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D9C5BF6x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA20763F;
	Mon, 24 Mar 2025 17:39:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742834341;
	bh=C4qCR5IiDNqllMSB5IXrinpWcZEJSikRxGwqsymPnqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9C5BF6x32gIC0BH3a7FyjNcvNNWaxWaHdq9h6zM/K2pDHxTSBQlPYJZ+2uCV6LyZ
	 iXiSRyd7/4n17shRFmevu6xQErMWCZJVYJE0q3JlVMdf0VTt8UlnjUZNY+ycJrcW8e
	 Dd3MDKPVPoHCiBWrH2lV6Su8f1Uop5WY3u0ArfxE=
Date: Mon, 24 Mar 2025 18:40:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
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
Message-ID: <20250324164025.GK5113@pendragon.ideasonboard.com>
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
 <20250318204133.GC22890@pendragon.ideasonboard.com>
 <Z9ne78KhxfKYgnh_@ninjato>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z9ne78KhxfKYgnh_@ninjato>

On Tue, Mar 18, 2025 at 10:00:31PM +0100, Wolfram Sang wrote:
> Hi Laurent,
> 
> > > Read out and check the ID registers, so we can bail out if I2C
> > > communication does not work or if the device is unknown.
> > 
> > What's the advantage of that, what are you trying to guard against ?
> 
> That a random chip at address 0x2c will be used.

Is that really a problem ? That would only occur with a broken DT, is it
worth guarding against a development-time issue with a runtime check
that will increase boot time for every user ?

> > > Tested on a
> > > Renesas GrayHawk board (R-Car V4M) by using a wrong I2C address and by
> > > not enabling RuntimePM for the device.
> > 
> > What do you mean by not enabling runtime PM for the device ?
> 
> I left out pm_runtime_get() before regmap_read_bulk().

-- 
Regards,

Laurent Pinchart

