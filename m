Return-Path: <linux-renesas-soc+bounces-17502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5EAC3E0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 12:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 243DE7A288A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 10:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEB91C84A6;
	Mon, 26 May 2025 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="djykV4Lr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110681F4703;
	Mon, 26 May 2025 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256551; cv=none; b=R4J1b3qk+54SJZ9WUU7JifvAg9h1plmZV78TL1mi2RhTctgwKkDVvJZF5OXICjczXrNqYeqU9RelF2Xqvo7ms5CwlPxcb/I4wttdNhUZAt+Rix2EcrbWN6ABy1o+BJUMIuy8z2JmDIM177IHJi+l02Xm9aeLc1lnm+1Cf7IC8Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256551; c=relaxed/simple;
	bh=w7VKIU8NnqyjQvkqkLPKDk49GnoKd3o1S/upuQ6J118=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiSIKHU6YBO3WhDlrBTui+wiFR59NyrRh52Umuyv9k3BBYWj/+WnllQeP1rBnGCc4CkcbtlIPp9WvVaEtZ5Zlt0CCa4Q+IGZ0iK3p4i8M6u+agWQsgg3PeLyZBajE9cZHeOhAx7kGuETi1pIxdW4+8cffUPybGnbW8jlVzFK+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=djykV4Lr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 330EC7E6;
	Mon, 26 May 2025 12:48:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748256523;
	bh=w7VKIU8NnqyjQvkqkLPKDk49GnoKd3o1S/upuQ6J118=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djykV4LrIM8V/L45q9W1sIokBsApt4v9E6YwdYXqzRmVe4QYw2LT8eZM2fsW47x50
	 Q2QGaGm/Lmih+akZcNVTrEE6HzIdJg5PBKZfMeNnv0tJ6x8DM4P9vid58q4JimCvvm
	 YUZIdhGMkAC0IQmu7PXL4C96/pw17dRI1vM+Td64=
Date: Mon, 26 May 2025 12:49:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Maxime Ripard <mripard@kernel.org>, tomm.merciai@gmail.com,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Adam Ford <aford173@gmail.com>,
	Jesse Van Gavere <jesseevg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set()
 with atomic_enable()
Message-ID: <20250526104902.GB17743@pendragon.ideasonboard.com>
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <20250526-cryptic-blue-mussel-ac57fe@houat>
 <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>

On Mon, May 26, 2025 at 11:58:37AM +0200, Tommaso Merciai wrote:
> Hi Maxime,
> Thanks for your comment.
> 
> On 26/05/25 11:26, Maxime Ripard wrote:
> > Hi,
> > 
> > On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
> >> After adv7511_mode_set() was merged into .atomic_enable(), only the
> >> native resolution is working when using modetest.
> >>
> >> This is caused by incorrect timings: adv7511_mode_set() must not be
> >> merged into .atomic_enable().
> >>
> >> Move adv7511_mode_set() back to the .mode_set() callback in
> >> drm_bridge_funcs to restore correct behavior.
> >>
> >> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector helpers")
> >> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> >> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
> >> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > 
> > Explaining why, both in the commit log and the comments, would be nice.
> > Because I can't think of any good reason it just can't work for that
> > bridge.
> 
> Sorry, let me clarify and share with you some details:
> 
> adv7511_mode_set:
>   - Is setting up timings registers for the DSI2HDMI bridge in our case
>     we are using ADV7535 bridge.
> 
> rzg2l_mipi_dsi_atomic_enable:
>   - Is setting up the vclock for the DSI ip
> 
> Testing new/old implementation a bit we found the following:
> 
> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
> [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
> [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
> 
> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
> [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
> [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56
> 
> Same result but different timing (in function call perspective):
> 
>   - old: adv7511_mode_set() is call before rzg2l_mipi_dsi_atomic_enable()
>   - new: adv7511_mode_set() is call after rzg2l_mipi_dsi_atomic_enable()

What is "old" and "new" here ? Is it before and after Dmitry's patch, or
before and after yours ? Please be precise when describing problems.

> What do you think? Thanks in advance.

You're only explaining above what the "old" and "new" behaviours are,
and claiming one of them is causing an issue, but you're not explaining
*why* it causes an issue. That's what your commit message is expected to
detail.

-- 
Regards,

Laurent Pinchart

