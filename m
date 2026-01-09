Return-Path: <linux-renesas-soc+bounces-26503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B04D087C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 11:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73A69302B27D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 10:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C6E3375C5;
	Fri,  9 Jan 2026 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PtBlWZhK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA1E3328F3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953611; cv=none; b=q1P49BPaouymJNs4Zs0jkbgBJpwA1efBaBAvdEdHpm7efueA1FIU8GwcJaqL1ZDj0GEJhc76X1rKm70cwdUS9+l6ZnCOp5r4r5SAom5CiYTdbgeCuSygEWbjZyIqPKySKSNPjAeKajFVvAIGEB1k4rlAHCphVOpPCmGHQ9gKNdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953611; c=relaxed/simple;
	bh=yXMsr8zM5W0NidfzhDEAVyLX6qDA6qMap15O3IWhwt0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TN2LK8Xc8pE1WrQigjPrChYYy+tRuXhAteuzGP07JVOInCKMO7NGDLmLecOtTlLX5aNcWUeG7l4BQGG4+bvBAKeqbYLcJPT1bEw154yIu16CMArFtugDYnfB/bvDQeO70+3ElDwvHrfhPuJUYNKFsqU+X77yHeEEFToZluVqoaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PtBlWZhK; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so3244744f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 02:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767953607; x=1768558407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azmATrh1ehd50qg4sLH5mbIDJwpy+FR7iJS1nCS0pn0=;
        b=PtBlWZhKRvqBlP48R+aGjUhHrx+27cdPDRR02K9AM++q+0jZwzL7BdQHeSsJxy4Ec/
         LNx66h8ccKeGvM5ExF1rlikPCyPRgpbbsCYJCtNJw1YJNygGoZ7PSEyIis789RfH6pXf
         FOfXHhw1Nu5+hPNWBLYsBCMJLTA1flsuc65oMxgIpyjerqarXDNebGyGfGqOgJwnJV/f
         avt8RV1oVTsCSkizFogUf8XLjiPvcOKQJBBqUX8n6QFEgw/2L4o66T/3jaxFCgxZF96P
         EZyksb91FqQPbix6dTTnHkTShXQ+m/460NV6g75btfGGUhcogicpChc4uQuGpKHNSHLD
         TjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767953607; x=1768558407;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azmATrh1ehd50qg4sLH5mbIDJwpy+FR7iJS1nCS0pn0=;
        b=CBncAvncx9fm2oQcFjZDHqgCuwbSzbvI7ZfdsnhUtNJg96QocG7mXiBtGjESkPpB01
         JvTRgKgYkjcoJUEX8hObMl2akJkYz74WLj+saJoEkUxknRIbUtV530fYSrl2OKMHbH5v
         iOG34TLl84J8Ul5SxgMYdaxEUkbOBFAW/xCGo7MS6A44KNq3P01lsRknWGSOLepe9l8M
         seyUVIj8JnK5klz+ZwyiLWj2I1C669HH/MiHkypnS5AfG615FqGub1ZGd41RWmoBRCn5
         OFtqSF9vLyn3Wsw/4mmrVSnlILMUKm5VWf7KXhz4pT44RJbV4aFzXffaOviMVCpZ7b5q
         OeXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs0l3rgpH997xi8RRi18zBaYL5Bm2aHbnk+X4g9dgnsJoL7OMgSq7XDnoc7nEAtaar6viuA7fYIrytNmdweLfdRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytd0W0VHXBGDPJRyxINcC7J7M5nowAmpnIthJKSGvTlmFEJhX3
	YQZgnCxDkdoNtfzD8XqngBu72MmbS7ZZHJIUoSmwnq01s7oJlPn+xGAkJYlWstEReqY=
X-Gm-Gg: AY/fxX43BjmuymFwu1NNNCwt0SgyzK5xFTgM9CRlQ1EsEXqhok8fy6j2iHQLHb3N2+/
	hGpl/PjsCJRDtY8fIp0UWXKoiCGCK2M9ZZCOh9jt1W5G0WFWa3WOfFJzs+pH6Z9kcSbEM8qq6nJ
	/Qsz9NcdnA9CspZylPQyjbgkHTo0lgAPTY8HgEeGbzfO1pnFBkcq261FnVYkRI13DfALeV0uoTU
	B8ppA+SzU1pLFJ07dmBB22R6F1PClmSbfvmjRt4sXQhbLYO2M63+baximLYajnnlobpvir/fiVB
	blkgtffMVYKtAIXl67arQZxaTkrvcRWsauUQJ64ckhkTwU2b+NCXNnP9INaABwEXRT2pucVqRdj
	DKgF9Knb7t4p53wiv2m58GAIBhsyDkfnWzHJrHp5DMBr7W3bBB5OnUoiuUI1iL9AcMUrJenwQXQ
	ZhqXbbBdnSmNn7YlSEXJnCMvzezLFTvWHyy1xKBB6LgjeP4YRkn6ZFbdI+GAFB4B8=
X-Google-Smtp-Source: AGHT+IFCikJ03J/WgyrsSQPwxIM5AkWewsU7YWY0NL1QPgGkyLNv66hXXYzshWOTAsB92VRUvv8j1A==
X-Received: by 2002:a5d:5f94:0:b0:432:5bac:3915 with SMTP id ffacd0b85a97d-432c37c87e4mr11007824f8f.39.1767953607247;
        Fri, 09 Jan 2026 02:13:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e175csm21370007f8f.14.2026.01.09.02.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:13:26 -0800 (PST)
Message-ID: <ef2c22a0-3335-456c-9281-e54085c849d2@linaro.org>
Date: Fri, 9 Jan 2026 11:13:25 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/26 11:02, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
> 
> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
> avoid potential use-after-free ensure the irq is freed before putting the
> dw_hdmi->bridge reference.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 0d7c68b29dff..fef1702acb14 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -778,7 +778,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	if (IS_ERR(meson_dw_hdmi->hdmi))
>   		return PTR_ERR(meson_dw_hdmi->hdmi);
>   
> -	meson_dw_hdmi->bridge = of_drm_find_bridge(pdev->dev.of_node);
> +	meson_dw_hdmi->bridge = of_drm_find_and_get_bridge(pdev->dev.of_node);
>   
>   	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
>   
> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev, struct device *master,
>   				   void *data)
>   {
>   	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
> +	struct platform_device *pdev = to_platform_device(dev);
> +	int irq = platform_get_irq(pdev, 0);
>   
> +	devm_free_irq(dev, irq, meson_dw_hdmi);
>   	dw_hdmi_unbind(meson_dw_hdmi->hdmi);
> +	drm_bridge_put(meson_dw_hdmi->bridge);
>   }
>   
>   static const struct component_ops meson_dw_hdmi_ops = {
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

