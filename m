Return-Path: <linux-renesas-soc+bounces-24831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F581C6F614
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 3E98D2EF78
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7690B32FA2F;
	Wed, 19 Nov 2025 14:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cyOEp89n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AC511CA9;
	Wed, 19 Nov 2025 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562982; cv=none; b=qQytSyGNRIz/RuYvtFkYND4xOgkkWEx4LOjhVsHFI0X4xLC2H4QeBHAHZ+5Oktb6nFVWApNV5aFLe+136/WS8MktJUbWRwaYXZlHIEKmQTAh4qKAIhP4qbQhaRMJ8m5kHCptKFQ13StGn/n/2UvAZIhDLYGysmk/0gWwTNvP6pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562982; c=relaxed/simple;
	bh=yh9RkoKzaTwXiWB5pU0EiX/rGZGz+eyrQZcZ7K/aRTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPCRW6qOSTqQ9pcmyCdvP3F5TgH4XiMat0K1I5Rt2g4lYlJXqeoH7JwNm58RLVrqCmdSKy+M+Su5xFR9n2LgPXpugfCIlmdAnCmkeR90bxtwQFdoX+T+XbApD+f7FaBNo6VBTvaXhpKnbJW8qUdzq2CxQ8DFno+bdfS5O0L+L7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cyOEp89n; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4F194C11189;
	Wed, 19 Nov 2025 14:35:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E7AC60699;
	Wed, 19 Nov 2025 14:36:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3D1810371A0D;
	Wed, 19 Nov 2025 15:36:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763562975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=i80dj0GflYpB1hZNEEPgVvWiw8lZXjOo2MgG9uRoiXg=;
	b=cyOEp89nJrCZoYG3avsOq17lwj2MmFPr9JJNV8uJoRbiUf4i0FpASC7DYih3+kt22Z4JLK
	hSfQAKmElJaMv6eTW96h32EOAkaD/+EFkR9eQ9wj6eOaNWPXmFuek8CAOxBduzaCp3MKqE
	SRSwfh/p42u24j0seruGdGX03vsbe1FXL1+wnIiKztiT4pTasuKQA7XQ5fMZEt1qxhkfkX
	Lkm5OLbXHB4C5ilnR5VnsNMMw4PF073vGSCHsvLUZo2v92DoVPJWTUfnDbHwDmg8DEvTRD
	G2tqiz9kie5yiw/RfMiYlKZFRz6f0jK5xnKofaGhGeYtBD9xgQSkRsDygt5W+A==
Message-ID: <3c257fa4-764c-486a-b4b0-74b137df59fc@bootlin.com>
Date: Wed, 19 Nov 2025 14:36:08 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/26] drm/bridge: ite-it66121: use
 devm_drm_of_find_bridge() to put the next bridge
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
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-7-0db98a7fe474@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-7-0db98a7fe474@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/19/25 13:05, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to devm_drm_of_find_bridge() which puts the bridge
> reference on remove or on probe failure.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index aa7b1dcc5d70..5bc4e5afb823 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1542,7 +1542,7 @@ static int it66121_probe(struct i2c_client *client)
>   		return -EINVAL;
>   	}
>   
> -	ctx->next_bridge = of_drm_find_bridge(ep);
> +	ctx->next_bridge = devm_drm_of_find_bridge(dev, ep);
>   	of_node_put(ep);
>   	if (!ctx->next_bridge) {

And for all the patches converting of_drm_find_bridge to 
devm_drm_of_find_bridge, I think the pattern:

	bridge = devm_drm_of_find_bridge(dev, ep);
	if(!bridge)
		return -E...;

is wrong, because devm_drm_of_find_bridge can return a non-null error code.


>   		dev_dbg(ctx->dev, "Next bridge not found, deferring probe\n");
> 


