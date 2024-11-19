Return-Path: <linux-renesas-soc+bounces-10592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8321F9D2EA1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 20:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DDF0B288A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 19:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BA414AD0E;
	Tue, 19 Nov 2024 19:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EHSyjh0r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5991F8528E;
	Tue, 19 Nov 2024 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732043012; cv=none; b=p2kLSgxwNy++5u0y6zJ//XLWAWburSZjsPUaLeW/DfZsgsLXAtatmF9IRAni9PEUFFHtOD7VS0k+GxZnyn6Kw0jDVrl/vXCqBFBm9mnvOx28Ul9AXh7QUw9OqoirhnHS6MAHErrB8/ClIorZD5vifMjxXuqluvvaFMYlGqesEFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732043012; c=relaxed/simple;
	bh=EQ856OR4VQY9+md0WXj3vjFXLNSRQtQTg8JsSzo4GfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwKh1YXAvSKEibrr4+y4GDpjKdXLDF05M5+RKq8cL+MjRxcl7AvrLgTY6wFYBdpuIrT0hm8eE94k0+G4Thax0pqp1um0pCqCtv9iwaWreNF8Pltx5a++pc2T92T1/y73iv0JkSWXudSawSYQMWRD3YEZ9qH/EoakSWBs6fYH+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EHSyjh0r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FE233A2;
	Tue, 19 Nov 2024 20:03:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732042990;
	bh=EQ856OR4VQY9+md0WXj3vjFXLNSRQtQTg8JsSzo4GfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHSyjh0rzBBYdFvMML1tgKxxe2LK9YvlS5KeFBU13Z5zfe0a6Wd12nuMhIm+hqaR7
	 3eTu5rpAX5FSduomePXk3b7KiWQ8QgKkg1ITpGGgnBjIQkMURdvYcySbQiFTmu14r2
	 GiuRSGlXa1TI2Y3eYnCHg77mt2isi0ipAsd+w9i8=
Date: Tue, 19 Nov 2024 21:03:17 +0200
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
	stable@vger.kernel.org
Subject: Re: [PATCH v6 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Message-ID: <20241119190317.GT31681@pendragon.ideasonboard.com>
References: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
 <20241119184420.138785-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119184420.138785-2-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Nov 19, 2024 at 06:44:14PM +0000, Biju Das wrote:
> The host_node pointer was assigned and freed in adv7533_parse_dt(), and
> later, adv7533_attach_dsi() uses the same. Fix this use-after-free issue
> by dropping of_node_put() in adv7533_parse_dt() and calling of_node_put()
> in error path of probe() and also in the remove().
> 
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v6:
>  - Fixed memory leak by adding goto stattement in error path of
>    adv7511_init_regulators().
> Changes in v5:
>  - Updated commit description.
>  - restored host_node in struct adv7511.
>  - Dropped of_node_put() in adv7533_parse_dt() and calling of_node_put()
>    in error path of probe() and also in the remove().
> Changes in v4:
>  - Updated commit description.
>  - Dropped host_node from struct adv7511 and instead used a local pointer
>    in probe(). Also freeing of host_node pointer after use is done in
>    probe().
> Changes in v3:
>  - Replace __free construct with readable of_node_put().
> Changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped Archit Taneja invalid Mail address
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 12 ++++++++++--
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     |  2 --
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index eb5919b38263..f5525c12f0cd 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1241,8 +1241,10 @@ static int adv7511_probe(struct i2c_client *i2c)
>  		return ret;
>  
>  	ret = adv7511_init_regulators(adv7511);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to init regulators\n");
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to init regulators\n");
> +		goto err_of_node_put;
> +	}
>  
>  	/*
>  	 * The power down GPIO is optional. If present, toggle it from active to
> @@ -1363,6 +1365,9 @@ static int adv7511_probe(struct i2c_client *i2c)
>  	i2c_unregister_device(adv7511->i2c_edid);
>  uninit_regulators:
>  	adv7511_uninit_regulators(adv7511);
> +err_of_node_put:
> +	if (adv7511->host_node)

I forgot to mention that you can drop the check here, as of_node_put()
is a no-op when called with a NULL pointer. Sorry about that.

> +		of_node_put(adv7511->host_node);
>  
>  	return ret;
>  }
> @@ -1371,6 +1376,9 @@ static void adv7511_remove(struct i2c_client *i2c)
>  {
>  	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
>  
> +	if (adv7511->host_node)

Same here.

With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +		of_node_put(adv7511->host_node);
> +
>  	adv7511_uninit_regulators(adv7511);
>  
>  	drm_bridge_remove(&adv7511->bridge);
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index 4481489aaf5e..5f195e91b3e6 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -181,8 +181,6 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
>  	if (!adv->host_node)
>  		return -ENODEV;
>  
> -	of_node_put(adv->host_node);
> -
>  	adv->use_timing_gen = !of_property_read_bool(np,
>  						"adi,disable-timing-generator");
>  

-- 
Regards,

Laurent Pinchart

