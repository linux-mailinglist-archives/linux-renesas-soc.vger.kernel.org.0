Return-Path: <linux-renesas-soc+bounces-24832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD8C6F6E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 9ACA42F011
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989462BE7DC;
	Wed, 19 Nov 2025 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DfoBQR1i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10EE2571DE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763563778; cv=none; b=HGMIaoLheiyt3ILLz8Og9Obz1U79xm4jn7atfumbbIQ2PBAULYWuSYmQ4TOBDVi4wtUGHwPMfGQrdIQNDaNpE3NM0glObIwwtzv9FGqLtwjqPmeE6JRtawwTnw2Gmsjs54BeVMTMpdVLV6z6WPXTy4xVst2+JyFjlqtibucVcBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763563778; c=relaxed/simple;
	bh=JRyZCdgunre47fOEJ3dnQtncks6xVvgMZR8IbbBf9Xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtiJxDGt3/7l6r5uq9Gy5KTz6YXXC9Q0dZbVwocNnt/QfeYPWO6msKNlCbBD1EkqLlW6GZHOV7xGaB5YlckGvAHoFCkmp8GEoI1x1NMF8lobiLjeSNQG+WxxTb/gQPyLn1AlVmH9LuED1LvXERPdesaBZ6lNZurJHTORAPEZUQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DfoBQR1i; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso4421593f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 06:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763563775; x=1764168575; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvzXT1PDok/yQbdLDJPIegEZrHBcAnX7M9j9AL4admk=;
        b=DfoBQR1ic1vxOlejOkbwAXIR1N2jKZGh1SRmMidrcDM1xYkP0BMjxrMal6KAdmMcfB
         7MkFXdFO9Bt+F3kSRqEgSrggbp22RQhgAOxNN7U1J6tvGPBTBaEcjAhgd5lNbdA7knEE
         iZeJQoiCxJIRl2N2R/g+wnCd4GbR6HbZEtCVsaD5nIf7/W+XBCTBTihJbhg+5cyyVWIq
         gJ+uOZGNlxhRLjZLQwY7/sjAHPLTY8YU/w9cpIbMU8jPgrp3Cx/6HpND4Yr4mL9Qcty3
         CTeYVRkRF/BpMZNwzb1G+y5J90cc2ZClajmFdAsT8WbO5BqC2vzmT1/XMUHwN+9Lekzt
         5nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563775; x=1764168575;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvzXT1PDok/yQbdLDJPIegEZrHBcAnX7M9j9AL4admk=;
        b=gwa4yJRT0EoxXupX4j6SASSP0+CvyvOGT03Q2E6lweKnsES2fyL+MsCFfM8gbGPBoK
         BBa9UWigFjPYFCWkUCDvzSlQvbEqE1oz4Nk0koOj9A6i0ckfblR32WGilpooP1XL7EUd
         nJzZidB5q7B0/Q8nA3xjbv5fFXixYzqnMd9IwKX4y6HTzcFl6xRJI18Cc9vX4nGWd7Ai
         snmMyQdyBWihKy4vU3LzFnS0fS1FnekgS/FPRp1FQ4qQowJyONMb+y0PAA2HAdmqpQte
         xFIovQRzEkCH6pCathh2E9wNjc8SyGIh5ZlUvm6YPnKV3EyqkcbsJK+DTvl0Gk8IWr1b
         jgRg==
X-Gm-Message-State: AOJu0YzpJTlm1n3hI8b7OgFMKe+uq78Zh6BagfSdlm8BeLwF9v/gKHHO
	zHtyR19RhHfakUbp/LAUHVEXukYaJA38Vaz9yTU+aORVDgPxuyZIUM0pvOgLO9wrjTc=
X-Gm-Gg: ASbGncswYMCNrNEHemx4cyDGK/+5QtK71o6TPvUh6IfxdGVNalfSa+5lNuQUibpYjVr
	9dxyquN2uDwwn5KKSwdENOjrqeKjcit2YmIotnWcdzFDeOEu2gJ1cmlOpsuqoEuwEU5PLJkbhkT
	G5n9s5qSa9NVWTVBcdP76GZSWKgC6PteFKfZnVs1LVe0z0KeXsTvn4vWdjXSqTzG4EOF2Vz4cBA
	Ni8I0lN8lvi1A+qbqDFs1VP73dP9uDfA+93qgbVBHagOwUc9iCaz4Wt5Bpgi+fzp2uNbFdJYS9m
	c0bHiwAuDrOr5OBQ9Y/aXJU5gtzN2YsHKATRMtAP3H1yI5emYet4Kq8HV6fqI4XHO0cP0e/rpKK
	Jp1mJR82BcI7l0jB4olSnbg5SqSYVCavKdp4m3EKoEgEnEBEWg8W4L1gb9ojN/vYaBKIVsK3e51
	XNz70D4bKOApuE74gMmnK9y4B+Sa4XIfczupxQpOsg53FBKBBWsq9iPClOWcs/opOv4BypW1OTa
	w==
X-Google-Smtp-Source: AGHT+IF/SJMMbWEgRFwYg9CHGo9ekhafPDlPY7JxyauGM1SXhVQ1hoTLFavIWNHOvylWguN3KYxCQQ==
X-Received: by 2002:a5d:584c:0:b0:42b:4194:48cf with SMTP id ffacd0b85a97d-42b593991f4mr19216195f8f.52.1763563774737;
        Wed, 19 Nov 2025 06:49:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:263d:925b:a11f:ae36? ([2a01:e0a:3d9:2080:263d:925b:a11f:ae36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b62dsm38408563f8f.24.2025.11.19.06.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 06:49:34 -0800 (PST)
Message-ID: <165c7488-897b-4500-a7dc-a212cd64923e@linaro.org>
Date: Wed, 19 Nov 2025 15:49:33 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] phy: renesas: rcar-gen3-usb2: Move
 phy_data->init_bus check
To: Claudiu <claudiu.beznea@tuxon.dev>, yoshihiro.shimoda.uh@renesas.com,
 vkoul@kernel.org, kishon@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251119120418.686224-1-claudiu.beznea.uj@bp.renesas.com>
 <20251119120418.686224-2-claudiu.beznea.uj@bp.renesas.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20251119120418.686224-2-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 13:04, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Move the check of phy_data->init_bus from rcar_gen3_phy_usb2_init_bus()
> to rcar_gen3_phy_usb2_probe() to avoid having it duplicated in both the
> probe path and the upcoming resume code. This is a preparatory patch.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v2:
> - none; this patch is new
> 
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index a38ead7c8055..b9d5bb52e02c 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -782,6 +782,9 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
>   	int ret;
>   	u32 val;
>   
> +	if (!channel->phy_data->init_bus)
> +		return 0;
> +
>   	rstc = devm_reset_control_array_get_shared(dev);
>   	if (IS_ERR(rstc))
>   		return PTR_ERR(rstc);
> @@ -861,11 +864,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, channel);
>   	channel->dev = dev;
>   
> -	if (channel->phy_data->init_bus) {
> -		ret = rcar_gen3_phy_usb2_init_bus(channel);
> -		if (ret)
> -			goto error;
> -	}
> +	ret = rcar_gen3_phy_usb2_init_bus(channel);
> +	if (ret)
> +		goto error;
>   
>   	spin_lock_init(&channel->lock);
>   	for (i = 0; i < NUM_OF_PHYS; i++) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

