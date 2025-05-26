Return-Path: <linux-renesas-soc+bounces-17514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B6AC4163
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 16:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AC4A7A516A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 14:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC29433B3;
	Mon, 26 May 2025 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nclke1f7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0DA1FECBA;
	Mon, 26 May 2025 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269698; cv=none; b=bjSNboF0jl5tRnRUY7TeUKokk/DvFgDsfW7Cv443xc3ss5vQIpqaKtBNvRR4uuy8SPFb1Owl+TAtR9/zRSoFEsiPVt7Pl+8PC2OCDQp0WCTiERNPLa3jPyqNPtUmv5UmWAo0aWhOQKaOTU3YBEsRr5Ej3Rcx9apMVfYaKXoJJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269698; c=relaxed/simple;
	bh=ueaR8l4nEaJC7s/8HWD984orQhexVK1qm5yZ3Lstv20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibmlxHU1O/3KnBbJoN8gAAF2R5V5L3KBMMVQhB+cSeZ6EEJZeeJZ8MIRlFBwEokrtz/2kdl9yPki2NaxZIknR10XIggp67cp7B62kGfYcNR4c3tz40xrdWf4AocDVDB2hZWwEjHssZqWvXa74+VFdciOHlZ90Fl5OgGOKKRirqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Nclke1f7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5ABE743;
	Mon, 26 May 2025 16:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748269669;
	bh=ueaR8l4nEaJC7s/8HWD984orQhexVK1qm5yZ3Lstv20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nclke1f7+PJ7n8L/k8MOoqIXMJjrtzr1AxT96lXhbGhUnr1YPBpy9yYsbVdI/2JFP
	 JuWHYcnkVW8mN4VQ9+rrbNH3+uIDvMWntKf0Raxn/NtzblmcDKGfcLk6d+G1nQjZzY
	 k6FByMuhZ9tminX/viT2Sr9ekCkeyw5XqvEp8o1Q=
Date: Mon, 26 May 2025 16:28:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Maxime Ripard <mripard@kernel.org>, tomm.merciai@gmail.com,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Douglas Anderson <dianders@chromium.org>,
	Adam Ford <aford173@gmail.com>,
	Jesse Van Gavere <jesseevg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set()
 with atomic_enable()
Message-ID: <20250526142808.GR17743@pendragon.ideasonboard.com>
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <20250526-cryptic-blue-mussel-ac57fe@houat>
 <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
 <20250526104902.GB17743@pendragon.ideasonboard.com>
 <209ddc02-01d2-4375-afcf-2c9a55fe8fc1@bp.renesas.com>
 <20250526-cherubic-ambitious-cobra-3c6a1e@houat>
 <7603c3b1-edff-4c02-a4a5-1d5f72720cad@oss.qualcomm.com>
 <aec5d09f-248b-4dcc-8536-89b4b9d47e9c@bp.renesas.com>
 <d695e04c-b2f1-41ff-8510-33529bf5f916@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d695e04c-b2f1-41ff-8510-33529bf5f916@bp.renesas.com>

On Mon, May 26, 2025 at 04:13:23PM +0200, Tommaso Merciai wrote:
> On 26/05/25 16:02, Tommaso Merciai wrote:
> > On 26/05/25 15:18, Dmitry Baryshkov wrote:
> >> On 26/05/2025 14:40, Maxime Ripard wrote:
> >>> On Mon, May 26, 2025 at 01:19:23PM +0200, Tommaso Merciai wrote:
> >>>> On 26/05/25 12:49, Laurent Pinchart wrote:
> >>>>> On Mon, May 26, 2025 at 11:58:37AM +0200, Tommaso Merciai wrote:
> >>>>>> On 26/05/25 11:26, Maxime Ripard wrote:
> >>>>>>> On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
> >>>>>>>> After adv7511_mode_set() was merged into .atomic_enable(), only the
> >>>>>>>> native resolution is working when using modetest.
> >>>>>>>>
> >>>>>>>> This is caused by incorrect timings: adv7511_mode_set() must not be
> >>>>>>>> merged into .atomic_enable().
> >>>>>>>>
> >>>>>>>> Move adv7511_mode_set() back to the .mode_set() callback in
> >>>>>>>> drm_bridge_funcs to restore correct behavior.
> >>>>>>>>
> >>>>>>>> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI 
> >>>>>>>> connector helpers")
> >>>>>>>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>>>>>>> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
> >>>>>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >>>>>>>
> >>>>>>> Explaining why, both in the commit log and the comments, would be 
> >>>>>>> nice.
> >>>>>>> Because I can't think of any good reason it just can't work for that
> >>>>>>> bridge.
> >>>>>>
> >>>>>> Sorry, let me clarify and share with you some details:
> >>>>>>
> >>>>>> adv7511_mode_set:
> >>>>>>     - Is setting up timings registers for the DSI2HDMI bridge in 
> >>>>>> our case
> >>>>>>       we are using ADV7535 bridge.
> >>>>>>
> >>>>>> rzg2l_mipi_dsi_atomic_enable:
> >>>>>>     - Is setting up the vclock for the DSI ip
> >>>>>>
> >>>>>> Testing new/old implementation a bit we found the following:
> >>>>>>
> >>>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI- 
> >>>>>> A-1:800x600-56.25@XR24
> >>>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
> >>>>>> [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
> >>>>>> [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
> >>>>>>
> >>>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI- 
> >>>>>> A-1:800x600-56.25@XR24
> >>>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
> >>>>>> [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
> >>>>>> [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56
> >>>>>>
> >>>>>> Same result but different timing (in function call perspective):
> >>>>>>
> >>>>>>     - old: adv7511_mode_set() is call before 
> >>>>>> rzg2l_mipi_dsi_atomic_enable()
> >>>>>>     - new: adv7511_mode_set() is call after 
> >>>>>> rzg2l_mipi_dsi_atomic_enable()
> >>>>>
> >>>>> What is "old" and "new" here ? Is it before and after Dmitry's 
> >>>>> patch, or
> >>>>> before and after yours ? Please be precise when describing problems.
> >>>>
> >>>> Sorry, you are completely right:
> >>>>
> >>>>   - old --> before Dmitry's patch
> >>>>   - new --> after Dmitry's patch
> >>>>
> >>>>>
> >>>>>> What do you think? Thanks in advance.
> >>>>>
> >>>>> You're only explaining above what the "old" and "new" behaviours are,
> >>>>> and claiming one of them is causing an issue, but you're not 
> >>>>> explaining
> >>>>> *why* it causes an issue. That's what your commit message is 
> >>>>> expected to
> >>>>> detail.
> >>>>>
> >>>>
> >>>> Thanks for the clarification! :)
> >>>> I will send v2 explaining better this.
> >>>
> >>> In particular, if the driver needs to have mode_set called before
> >>> atomic_enable, you should say why moving the call to mode_set earlier in
> >>> the function wouldn't work.
> >>
> >> It might be the same thing as we had on PS8640: it had to be brought 
> >> up before the host starts the DSI link, so that there is no clock 
> >> input on the DSI clock lane.
> >>
> > 
> > Some updates on my side:
> > 
> > I'm not seeing any differences from a regs perspective when using the 
> > old driver version (before Dmitry's patch) and the new driver version 
> > (after Dmitry's patch).
> > 
> > In particular, i2cdump -f -y 7 0x4c shows me the same result.
> 
> Please ignore this (wrong address)
> 
> The right test is: i2cdump -f -y 7 0x3d
> 
> And I'm seeing the following differences:
> 
> # WORK:
> reg | val
> 0x3d → 0x00
> 0x3e → 0x00
> 
> # DON't WORK
> reg | val
> 0x3d → 0x10
> 0x3e → 0x40
>
> > Unfortunately, since I don't have the ADV7535 datasheet, I believe this 
> > issue may be related to the functions call sequence.

You could try to get the documentation from Analog Devices.

This being said, the above registers are documented in the ADV7511
programming guide, which is publicly available. They may differ in the
ADV7535 though.

> > I agree with Dmitry's theory.
> > 
> > Let me gently know if you need some more test on my side. Thanks in 
> > advance.

-- 
Regards,

Laurent Pinchart

