Return-Path: <linux-renesas-soc+bounces-24817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6173EC6F4ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CD89A365EDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6632F2F60A1;
	Wed, 19 Nov 2025 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UfR7xwnX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE7A2749C9;
	Wed, 19 Nov 2025 14:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562156; cv=none; b=E4LiU36nSNw4RcGKJ0ogdJQQVVGNv/du6j4jgNUdtjTm8woIbYTx+nW78s6Mi96Fjy/UqG0c7UdSeTQOjSh44lOzvAEQiWRxOjvDQI4/sWKYtTB2Yh+qP1zMCd/z0bjX7wAn8Ty+YJJi3xbsdrgIq7H/m/EshmHGrixjJU2RChE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562156; c=relaxed/simple;
	bh=M+/AIl5YdLdWxgXiRFn4KAfdd2lx8T1tF5XZ+NgiVTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=laUu5sVT59FHZd17vVWCJIynA6XfGEdZoGqT2o4iblpUOvZ2n/4G+KO0LysOwCbtnGhkPzyv7z8Wn5+uERvNz4QCWOZDGBDkkDRC0wx2vFHZhEMMYWw2V1KSV6XpiU0Eyuq7cwR+nz34viJkjQ2s7p7Xj3kBlngnp/o/GU1tJmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UfR7xwnX; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 29AA0C11188;
	Wed, 19 Nov 2025 14:22:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 594C360699;
	Wed, 19 Nov 2025 14:22:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 468BE10371A62;
	Wed, 19 Nov 2025 15:22:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763562149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KHIHzROR0vP9n7dvMFHoM55Ssw0KAKH53cQfe48RG2o=;
	b=UfR7xwnXYFcxt7dwYb9ZZ2eHN7rcQflUmmRbY6KpW0kfgQmHCUslJp41eFjRD7JVEUwKJZ
	S0oXT5p7TaoydFUvfXkgYXy2hBwhCbLh0hTZ9oWYkqCt/tCI/K1Dik6InPGVCplhxx20wG
	jBAFgm9Fp8hHkx89EpTboOzrEJyAyR0UxrgcfQigI3YyMTbWTXKDX9o5np5l95zrqxzp+5
	DnhkYQIm688Fn7PEOgNjQK5V7V7kSk65KKWVjPvAcYMqGom1O1QKFrIjeFzcaazJJ/4nQY
	BeP/9Xy2sVRjpilf746wFLr/iSKL71kXFK/see/F8PNIt2le3RaEWTWBwZD28Q==
Message-ID: <35bda203-8c15-4219-a231-1379f909229f@bootlin.com>
Date: Wed, 19 Nov 2025 14:22:21 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/26] drm/bridge: add drm_of_find_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/19/25 13:05, Luca Ceresoli wrote:
> of_drm_find_bridge() does not increment the refcount for the returned
> bridge, but that is required now. However converting it and all its users
> is not realistically doable at once given the large amount of (direct and
> indirect) callers and the complexity of some. Also, "of_drm_find_bridge is
> oddly named according to our convention and it would make more sense to be
> called drm_of_find_bridge()" (quoted from Link: below).
> 
> Solve both issues by creating a new drm_of_find_bridge() that is identical
> to of_drm_find_bridge() except it takes a reference. Then
> of_drm_find_bridge() will be deprecated to be eventually removed.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Note: a simple implementation would just be
>    { return drm_bridge_get(of_drm_find_bridge(np)); }
> but it would release the mutex before getting the reference, so it is
> not safe. Make things simple by duplicating the code. A later patch will
> make instead the (to be deprecated) of_drm_find_bridge() become a wrapper
> of the new drm_of_find_bridge()
> ---
>   drivers/gpu/drm/drm_bridge.c | 29 +++++++++++++++++++++++++++++
>   include/drm/drm_bridge.h     |  5 +++++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 8f355df883d8..d98a7b4a83c0 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1417,6 +1417,35 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
>   EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
>   
>   #ifdef CONFIG_OF
> +/**
> + * drm_of_find_bridge - find the bridge corresponding to the device node in
> + *			the global bridge list
> + * @np: device node
> + *
> + * The refcount of the returned bridge is incremented. Use drm_bridge_put()
> + * when done with it.
> + *
> + * RETURNS:
> + * drm_bridge control struct on success, NULL on failure
> + */
> +struct drm_bridge *drm_of_find_bridge(struct device_node *np)
> +{
> +	struct drm_bridge *bridge;
> +
> +	mutex_lock(&bridge_lock);
> +
> +	list_for_each_entry(bridge, &bridge_list, list) {
> +		if (bridge->of_node == np) {
> +			mutex_unlock(&bridge_lock);

It seems a bit strange to unlock the mutex just before the 
drm_bridge_get, is it expected?

If no, I think you can use scoped_guard(mutex, &bridge_lock) to avoid 
messing with mutex_unlock, IIRC, scoped_guard will unlock the mutex just 
after the return, so in your case, just after the drm_bridge_get.

> +			return drm_bridge_get(bridge);
> +		}
> +	}
> +
> +	mutex_unlock(&bridge_lock);
> +	return NULL;
> +}
> +EXPORT_SYMBOL(drm_of_find_bridge);
> +
>   /**
>    * of_drm_find_bridge - find the bridge corresponding to the device node in
>    *			the global bridge list
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 0ff7ab4aa868..e74e91004c48 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1313,8 +1313,13 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>   		      enum drm_bridge_attach_flags flags);
>   
>   #ifdef CONFIG_OF
> +struct drm_bridge *drm_of_find_bridge(struct device_node *np);
>   struct drm_bridge *of_drm_find_bridge(struct device_node *np);
>   #else
> +static inline struct drm_bridge *drm_of_find_bridge(struct device_node *np)
> +{
> +	return NULL;
> +}
>   static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>   {
>   	return NULL;
> 


