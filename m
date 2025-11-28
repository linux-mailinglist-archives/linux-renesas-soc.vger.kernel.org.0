Return-Path: <linux-renesas-soc+bounces-25365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BADD2C9335F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 22:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B7FE94E1A7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 21:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E535E2DEA87;
	Fri, 28 Nov 2025 21:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ra20jyFB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D70E274650;
	Fri, 28 Nov 2025 21:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764366635; cv=none; b=R3z/nLfGuPXZ1JUxriSQ+ki8m3qSUT010AqR3xCpMSD1inxqC/ECD1I+9Tf0yyG9nzDnx4lFTSIwgMTIAlqhF33qZQ5mQ9d68wILjI445sJgRYJ5LCuqduPjfD4ujIqvIiNeDvoI8Ig5q3BNdLBw6yyneshXouSC5Zy3KyZdgLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764366635; c=relaxed/simple;
	bh=JdN7JG2SF0HKhMVjcjMWIQ2dFH3XWGOs4WCZ0Ti+RpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KA5DM/TT7Ay/JEeLOTw4Hdz4IWIPkzmml7Df4o9aMBu+D/zJi6/EHK1HVu6c8rls8+Oz+b/JE3heTZUOCm644nwRyCucnWIIKqlVKxhxeGGh0IxW+6kbZxGB1YxY5OGOY85za21uS8Wm89hhV/6pyKHAHQ2AZB2ZNU06PNXuPyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ra20jyFB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=dUAdZeQP94vW72b4SJ//V/MtjinN884gsD5QWNElCrg=; b=Ra20jyFBxDuV53uOnzXP2ROo3n
	6iH7U5q6VshUt0SSIyUMvEuHD6uf5oxKo3fYtlZsKW9PZOyCgqKZuTuGyG0SF41EQnhUjP/FR2Lgt
	Le7+1g8J4SrLQqbzCd2YOOlfvE4Aq3hq47Tv4UokTE1flXvyD70Tlf6WpNHWM1RgHU8b8PHPQxGFd
	igXveDHNK3GIL1mGgtsHtlVngm9BQzvPM59Php3lUG1SYQyJuyOziBCvQUou2vZsXL1jB7J9UfhSL
	yy9SSp4qbhGiZearV+80CKbt42wCEVmv9nTO7jhosBJ1n6iEjy/8GUHzjSGqZe3Yh4QfAU7ukLp3d
	mJ72/xqg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP6M8-00000000zPG-37J4;
	Fri, 28 Nov 2025 21:50:20 +0000
Message-ID: <a23be1b4-89ce-4db9-bb68-9a5aa248f4a0@infradead.org>
Date: Fri, 28 Nov 2025 13:50:19 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/26] drm/bridge: make of_drm_find_bridge() a wrapper
 of of_drm_get_bridge()
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
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-4-88f8a107eca2@bootlin.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-4-88f8a107eca2@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/28/25 8:50 AM, Luca Ceresoli wrote:
> of_drm_find_bridge() is identical to of_drm_get_bridge() except it does
> not increment the refcount. Rewrite it as a wrapper and put the bridge
> being returned so the behaviour is still the same.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v2:
> - Added comment to document why we put the reference
> ---
>  drivers/gpu/drm/drm_bridge.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 21a84715d221..9b7e3f859973 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1467,19 +1467,17 @@ EXPORT_SYMBOL(of_drm_get_bridge);
>   */
>  struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  {
> -	struct drm_bridge *bridge;
> -
> -	mutex_lock(&bridge_lock);
> +	struct drm_bridge *bridge = of_drm_get_bridge(np);
>  
> -	list_for_each_entry(bridge, &bridge_list, list) {
> -		if (bridge->of_node == np) {
> -			mutex_unlock(&bridge_lock);
> -			return bridge;
> -		}
> -	}
> +	/**

This isn't a kernel-doc comment, so please don't use "/**" here.
Just use "/*".

> +	 * We need to emulate the original semantics of
> +	 * of_drm_find_bridge(), which was not getting any bridge
> +	 * reference. Being now based on of_drm_get_bridge() which gets a
> +	 * reference, put it before returning.
> +	 */
> +	drm_bridge_put(bridge);
>  
> -	mutex_unlock(&bridge_lock);
> -	return NULL;
> +	return bridge;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
>  #endif
> 

-- 
~Randy


