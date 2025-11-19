Return-Path: <linux-renesas-soc+bounces-24822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0D7C6F5A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A72183070A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E06C34FF4A;
	Wed, 19 Nov 2025 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pupAGR3m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810D826F296
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562802; cv=none; b=n/7ibLLm43b40PTY1djo0m5G8NCrqP6WwIzawOusvSBKL976n/n+/7m+A9TFSe82Zk8pOhG6dQx9r73xLmknImu4eXiQpVbkuH5qayQhFO6dsAeMYswZ/Qu7QnQ9AQIqaoiH/THJD+nmMIgFT9CBjFqfYTZsW3/qWQZ8JCSEF6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562802; c=relaxed/simple;
	bh=pKN7aQQyagRZPKiTasJSxadS+zmxSHf8zm5yj651MZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNcJz83y/81ZRSlts2DuOgOf6xSSDQAKSCjngei6rOKcGpyIB52c1/BYbzPs3jlkbbp8g3m5sxgco6QtRNJRnmSN5iUXsZ/KHEvqDG6rbagA7Gq8ps4p3tfhLGm5lF/ji3Zo/ajT9aCF/Ze1sw+ISe246ILXmd0hMiap4xeQPCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pupAGR3m; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ED5CB1A1BE0;
	Wed, 19 Nov 2025 14:33:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEA8760699;
	Wed, 19 Nov 2025 14:33:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DA6310371A62;
	Wed, 19 Nov 2025 15:33:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763562796; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0vbDr+QjnWAsQ6X5coWb1jIQOFxpmdjPSWJIgMslIi0=;
	b=pupAGR3mHYH4v3bdqG9lB63xH4OPbAI6MGyFpKDJh78mR3Zex9P5V02vdy6o0fLd8967Sk
	JK6HNnpcQvd4s5xoTOKVEstBPli6t3eALZwCRL6xVH6dCX5ZphnkgT5OlonumufXJKuzgB
	oUx9qVp3XlzUcRyOCYsqYNm+gV8fFxZT1W0ySpU9zygoxTAMwKyMaHXVG6iQ40/jzK7cZV
	ldmn1YhKlJgR3YHNT7xNfvG/PeQA6bvqeBSQnZ9483u89j+NP6DkGqxMfX1AzVMspPtl9I
	YpWJCOTeKJE0c/6Eg6tkrby0b7NcLi05CJHcJTN9WveGfQr/cgdlhPWDiQh7Fg==
Message-ID: <0858117f-9397-4045-9b7d-490ad24926cb@bootlin.com>
Date: Wed, 19 Nov 2025 14:33:09 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/26] drm/bridge: add devm_drm_of_find_bridge
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
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/19/25 13:05, Luca Ceresoli wrote:
> Several drivers (about 20) follow the same pattern:
> 
>   1. get a pointer to a bridge (typically the next bridge in the chain) by
>      calling of_drm_find_bridge()
>   2. store the returned pointer in the private driver data, keep it until
>      driver .remove
>   3. dereference the pointer at attach time and possibly at other times
> 
> of_drm_find_bridge() is now deprecated because it does not increment the
> refcount and should be replaced with drm_of_find_bridge() +
> drm_bridge_put().
> 
> However some of those drivers have a complex code flow and adding a
> drm_bridge_put() call in all the appropriate locations is error-prone,
> leads to ugly and more complex code, and can lead to errors over time with
> code flow changes.
> 
> To handle all those drivers in a straightforward way, add a devm variant of
> drm_of_find_bridge() that adds a devm action to invoke drm_bridge_put()
> when the said driver is removed. This allows all those drivers to put the
> reference automatically and safely with a one line change:
> 
>    - priv->next_bridge = of_drm_find_bridge(remote_np);
>    + priv->next_bridge = devm_drm_of_find_bridge(dev, remote_np);
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
>   include/drm/drm_bridge.h     |  5 +++++
>   2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 09ad825f9cb8..c7baafbe5695 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1446,6 +1446,36 @@ struct drm_bridge *drm_of_find_bridge(struct device_node *np)
>   }
>   EXPORT_SYMBOL(drm_of_find_bridge);
>   
> +/**
> + * devm_drm_of_find_bridge - find the bridge corresponding to the device
> + *			     node in the global bridge list and add a devm
> + *			     action to put it
> + *
> + * @dev: device requesting the bridge
> + * @np: device node
> + *
> + * On success the returned bridge refcount is incremented, and a devm
> + * action is added to call drm_bridge_put() when @dev is removed. So the
> + * caller does not have to put the returned bridge explicitly.
> + *
> + * RETURNS:
> + * drm_bridge control struct on success, NULL on failure

I am not sure for the "NULL on failure", you return ERR_PTR(err), which 
is probably not NULL but an error code.

> + */
> +struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, struct device_node *np)
> +{
> +	struct drm_bridge *bridge = drm_of_find_bridge(np);
> +
> +	if (bridge) {
> +		int err = devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
> +
> +		if (err)
> +			return ERR_PTR(err);
> +	}
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(devm_drm_of_find_bridge);
> +
>   /**
>    * of_drm_find_bridge - find the bridge corresponding to the device node in
>    *			the global bridge list
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index e74e91004c48..98d5433f7d35 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1314,12 +1314,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>   
>   #ifdef CONFIG_OF
>   struct drm_bridge *drm_of_find_bridge(struct device_node *np);
> +struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, struct device_node *np);
>   struct drm_bridge *of_drm_find_bridge(struct device_node *np);
>   #else
>   static inline struct drm_bridge *drm_of_find_bridge(struct device_node *np)
>   {
>   	return NULL;
>   }
> +static inline struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, struct device_node *np)
> +{
> +	return NULL;
> +}
>   static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>   {
>   	return NULL;
> 


