Return-Path: <linux-renesas-soc+bounces-10585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 882DB9D2AE5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 17:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F0BC283AB5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 16:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6B11D07BC;
	Tue, 19 Nov 2024 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uhkeF+z+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38AB1CFEDE;
	Tue, 19 Nov 2024 16:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732033690; cv=none; b=NyyUopfVQGiMxcNNc6ckgJePKnNsySHe5KR1hPo4tx9M/rtOH+x+i1vk5v2a8eOhs2agWdCS9GIQzh33iobC2GMangtcSlxqPqJp5T7gga4b5/w2a67TRG0fS9UhcIYI5bwUitsAnl1amo0siA7MtFafI9yZbi1G43EtocCzDFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732033690; c=relaxed/simple;
	bh=fCnZd7xuHdxj/TyD9kKMoI71UVb4g3by4VMPnhxqEAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpdFC5e2U8yF9rkBOdq0wEJ3b5YIXLrBtXQBpKw6Ouyrqun34RvdXQGJFGyy8jAEzfDYLJ/swPOUOaT5qVEDJ6oEcmHJY+haD2WXIKhW7h5+4kNmz9doP0Im3qAALIgjD7L5xFDtEeym34LMI3XFAIGMEPM3D4sW4/OhyV2NdNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uhkeF+z+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFD81B3;
	Tue, 19 Nov 2024 17:27:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732033660;
	bh=fCnZd7xuHdxj/TyD9kKMoI71UVb4g3by4VMPnhxqEAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhkeF+z+IBJvfgRTNWKOEjjrN2SsXA3+E32IWjMv2cLo/L7CDLHEg+TXUWKG0tV6h
	 cERcfqecLNBWTIAoGtvVHwN8mODVsXJNOMFH6ttcqDZLL+8Nf6f8aoStdWKb3jywYo
	 bb2hg4NaaFj/qe2NKid5oOR4IrnwcvWhlBeC48ZQ=
Date: Tue, 19 Nov 2024 18:27:48 +0200
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
Subject: Re: [PATCH v5 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Message-ID: <20241119162748.GQ31681@pendragon.ideasonboard.com>
References: <20241119131011.105359-1-biju.das.jz@bp.renesas.com>
 <20241119131011.105359-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119131011.105359-2-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Nov 19, 2024 at 01:10:03PM +0000, Biju Das wrote:
> The host_node pointer was assigned and freed in adv7533_parse_dt(), and
> later, adv7533_attach_dsi() uses the same. Fix this use-after-free issue
> by dropping of_node_put() in adv7533_parse_dt() and calling of_node_put()
> in error path of probe() and also in the remove().
> 
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
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
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 +++++
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 2 --
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index eb5919b38263..6cfdda04f52f 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1363,6 +1363,8 @@ static int adv7511_probe(struct i2c_client *i2c)
>  	i2c_unregister_device(adv7511->i2c_edid);
>  uninit_regulators:
>  	adv7511_uninit_regulators(adv7511);
> +	if (adv7511->host_node)
> +		of_node_put(adv7511->host_node);

This won't be called when adv7511_init_regulators() fails as the driver
returns directly then, leaking the reference. You need a new error label
and a goto for that error path.

In the future, when touching error handling, please try to check
existing error paths and verify they're still right.

>  
>  	return ret;
>  }
> @@ -1371,6 +1373,9 @@ static void adv7511_remove(struct i2c_client *i2c)
>  {
>  	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
>  
> +	if (adv7511->host_node)
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

