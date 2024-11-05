Return-Path: <linux-renesas-soc+bounces-10308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 815D39BD1B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 17:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FA4F1F25080
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 16:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B8F17CA09;
	Tue,  5 Nov 2024 16:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="djcxNCi9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7283C57333
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Nov 2024 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730822798; cv=none; b=L15jcXaegUPHAI64iHYm6AfHieIpgVb2NBRTfHE+YBnkJSLdZ3iHhj8MWgZsiGDgQjEIylO9vV3fETki7rMxi0tzvYU5MVGxttyhcXcyXb2cSFWguCe4409Kgm3at+K1HLqk9bd7iKGHe2ryPuKZbyBtWONLP4WfY0OWGHue5gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730822798; c=relaxed/simple;
	bh=bY3GHBjboXSPHWV1Atan2UVsYfkA4ikd5J3+nwPF0lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnA+Gx2Vz5gozEVsk1OgCjYZAT1ZoHRr4vaQq5BO6YMW73zQSGUZTYSC/NyE30TMuEmclkdkfFsurnOl2fKjnqwCV8gTJlX7ZoBLpoJhABLc7ln7AJMt4W6y7NAvUjZLsjz0fcMpcY271j14+UHj+AIYcfAPdGDk3b8WMBlMS+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=djcxNCi9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85C21874;
	Tue,  5 Nov 2024 17:06:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730822775;
	bh=bY3GHBjboXSPHWV1Atan2UVsYfkA4ikd5J3+nwPF0lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djcxNCi9FP2phW4RHJOjMnpyXpkxiqO+8U/6YXXz93QOo9fW31Yw7yV5WJN2yZJlr
	 PV9T4QEewgguvVbhUCX5FXPLcILs+eV7S3WFxAg7xiRzr+INtI5sHRcU0S8eFO7E/f
	 hShoTAGi6TNWskFD1bgl9fIUEQDlskheYz43K6eU=
Date: Tue, 5 Nov 2024 18:06:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Archit Taneja <architt@codeaurora.org>,
	dri-devel@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
	Hien Huynh <hien.huynh.px@renesas.com>
Subject: Re: [PATCH v2 2/2] drm: adv7511: Fix out-of-bounds array in
 clock_div_by_lanes
Message-ID: <20241105160612.GC6317@pendragon.ideasonboard.com>
References: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
 <20241105111228.112813-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105111228.112813-3-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Nov 05, 2024 at 11:12:19AM +0000, Biju Das wrote:
> Fix out-of-bounds array in adv7511_dsi_config_timing_gen(),
> when dsi lanes = 1.

Does the hardware support using the internal timing generator with a
single lane ? If so adv7511_dsi_config_timing_gen() should be fixed,
otherwise that should be explained in the commit message, and mentioned
with a comment in adv7533_parse_dt(). I would also print an error
message in that case.

If the internal timing generator can't be used with a single lane, the
DT bindings should also be updated to document that.

> Fixes: 78fa479d703c ("drm/bridge: adv7533: Use internal timing generator")
> Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped Archit Taneja invalid Mail address
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7533.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index 3e57ba838e5e..0c2236e53af5 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -185,6 +185,9 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
>  	adv->use_timing_gen = !of_property_read_bool(np,
>  						"adi,disable-timing-generator");
>  
> +	if (adv->use_timing_gen && num_lanes == 1)
> +		return -EINVAL;
> +
>  	/* TODO: Check if these need to be parsed by DT or not */
>  	adv->rgb = true;
>  	adv->embedded_sync = false;

-- 
Regards,

Laurent Pinchart

