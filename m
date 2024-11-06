Return-Path: <linux-renesas-soc+bounces-10373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C24A9BF66A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 20:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 143581F237B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 19:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD2A20968E;
	Wed,  6 Nov 2024 19:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XchAZfD/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B0020969E;
	Wed,  6 Nov 2024 19:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730921088; cv=none; b=PMvM90KmwKvpbKbfLZHxW/2faBR3f/duxAPWINp12q7HsV+Ttx7zg9O4p14Mr8UUj/gILDbm4eaNKO+oMMbOPM8hgNZmVrv3V9wkauOPo0915wQr/G4FwMF98jMrmIUwaCAZUcu58Qt7z2j+8zu7VZ1QwxpicV3Xt3JrYlAVKRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730921088; c=relaxed/simple;
	bh=gN1WBAeIRYyA3wcA9u8mu17uJqkcrBC8yalU/0GVTmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEv8F4DLUjLHT8xvmVe5Asb0T4cEKnyWoKFR2BKtcvFn9EJ62aizNYtgzXs7vIxSFKZKXN2uT6tuFxTzfw93zBZ+WxHrKD0vhlAstq8EkNf3onwxsWXLGCOEUzPq0CsA/E02KRkFXW5vl2ryEyjC5nts/AJcI238YwpIWpe5Nas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XchAZfD/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 670FF670;
	Wed,  6 Nov 2024 20:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730921076;
	bh=gN1WBAeIRYyA3wcA9u8mu17uJqkcrBC8yalU/0GVTmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XchAZfD/j01QCYbfeuDW3PN1jkTYMvcY6Tmu9vhl4Znhul4EiTkzwJpF5Ngdelj3g
	 AaJQ9GTKIPBeXS2Fk6BsAwhkjc96ZnKAFb3+Wr/zhD6iReCbrv7Z+DCR5b/AFk7b5N
	 GuiWkD1hTniQ1l+6hnadgCL3HErjhPSpAJradydg=
Date: Wed, 6 Nov 2024 21:24:38 +0200
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
	dri-devel@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
	Hien Huynh <hien.huynh.px@renesas.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 3/3] drm: adv7511: Drop dsi single lane support
Message-ID: <20241106192438.GA21454@pendragon.ideasonboard.com>
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
 <20241106184935.294513-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106184935.294513-4-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Wed, Nov 06, 2024 at 06:49:30PM +0000, Biju Das wrote:
> As per [1], ADV7535/7533 support only 2-, 3-, or 4-lane. Drop
> unsupported 1-lane.
> 
> [1]
> https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7535.pdf

No need for a line break, this should be

[1] https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7535.pdf

> 
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Reported-by: Hien Huynh <hien.huynh.px@renesas.com>

Reported-by is supposed to be immediately followed by a Closes: tag.

With those fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v3:
>  - Updated commit header and description
>  - Updated fixes tag
>  - Dropped single lane support
> Changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped Archit Taneja invalid Mail address
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7533.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index de55d687245a..ec360f8b7509 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -173,7 +173,7 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
>  
>  	of_property_read_u32(np, "adi,dsi-lanes", &num_lanes);
>  
> -	if (num_lanes < 1 || num_lanes > 4)
> +	if (num_lanes < 2 || num_lanes > 4)
>  		return -EINVAL;
>  
>  	adv->num_dsi_lanes = num_lanes;

-- 
Regards,

Laurent Pinchart

