Return-Path: <linux-renesas-soc+bounces-24718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F240C69BAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id CD36F28D8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 13:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2FDA3587DA;
	Tue, 18 Nov 2025 13:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opmRpqX+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED0E357A3A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474086; cv=none; b=p0EM1My8hXtY23JFnQw+a+bnNm5vJXkfNd68Hk9DJ9hpq2mw8lcD314EIrRX1h/ExAbcQUTobqkDtd1DkylCyl+S/431XU71/5a6wZ/q2c5675Mwjc3Gb0Usy9Ymh7T+z3oGWeqhmQaxJqB29d0oiegBrsdwvpurTHYjURJIpy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474086; c=relaxed/simple;
	bh=ignDpCV4eibCugjiEN1Nv5kwc5unKL/mc7DxiXV2KEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y12ZiLFltvOaEtWbrydBfg6hdcnZIDTaEOf8iw2z53X0gvrf+PdBYn9haMOvsDsafZi5GXz9392NfXdduGxFPbZB31KYbKgT58fAPLIaTo1p7kAZt1Y2cvG/yqQaBwG26Y8vXmQ7SbyOGY8R/blEP5LgGaLvLrZ1KbwhrVBDScU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=opmRpqX+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so34448715e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474083; x=1764078883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4rTQs6cNVDsxXvXmMBx4hq1l1GKxmU7dSKs02Pj2AE=;
        b=opmRpqX+scjgeqe0d3Jyr321sXIZvFg5kr/UnAKYqjQZgPZ3D2vhtNjnaEOZiFmanb
         hCrQ8ZCknb7SVo5mKxwbixLy8h8SKPKRsbE1BPPDRU9pzfy2UZ0LgI3QFrGHaDh+J8gp
         rzzCZ1hpZuiZq6yY+mMvcjPWqx1jew7UzvPxgqxLTbZ8O62Nv/Jj0vmCML5BQCwlxX27
         Q2yqBhvkRi+ODRR85Z+QNQeUNBW2XScahLc4CKwc5gTdS+J6pO4PSyMDkRH3zyL+9xan
         adI0vcbi7X0aLJFD6fJ02IhWFt5rPKrYbHsduR+piOpYWlwwCkuW51ZcvC7a6T35TQwX
         5pGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474083; x=1764078883;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4rTQs6cNVDsxXvXmMBx4hq1l1GKxmU7dSKs02Pj2AE=;
        b=Sd1mQSX2xhSihvUo0V69fwDjJA3e3vT9I6dltVtJqzFXpe6+443HU0spMnyO7ljW7A
         VK6Od6+60H+kdJsvnW5IhLrQnc+cgBKrxPVjqXPdhhGfcPFBOmtV5Cyxl+WfVkmOJwN1
         iv08BvC9wzKN9l+K2c2K+74/odjzCTAX/2Pxt7iG3Njh6SRgMaSdk8ZeilBxy0BxwYSk
         15tUDQah6VE3jNkQFmktf0gDU/c3zJ5m8JConzQ4p9SrUR6z8C/YSrtEBrjbNyAjwDnv
         YjYSCWMvE5MjNEbONa/hor2fYdFKushiFgar/nXn0mBvAd/vSIwxdoZZhNZ1YW1QD0MO
         fRQQ==
X-Gm-Message-State: AOJu0Ywvex0TZUoQPmwocF9TnhWze7GCGmvbpyPGpwHftBkJmacNp525
	CC5OfRE7nmR3HVUwI5dVau9S9uBQZUftLnsN0LwmsYCEu0TLtLv/FBo01b/g85jHDgQ=
X-Gm-Gg: ASbGncu51moYJtOZh1mZrUkQi/YJM3Hk+SciPOqh4QA6V7KG+PfPvAfuLL38OlET12G
	efTHslQc+KRjDhiSC56lxTXzA211KeME2plr/JDz2p9WhwL0tWQdnIGbseYAgYO0FjM3HnRWWDc
	hkle0XTfJhPDziKG3AekKIPF4kASD2cP0YsgGB9xgBWmNl5aSOMy6hJOdjftYqEWnV1a+T/L/U1
	lWwZyomyfBnE41pWvKIRfgR7haVvHSX27eDFbPp+yXQUAtuNV5ZoZB+toEqq0lZ255mP5ucg4ZU
	2Ow+AWIh4aavuaGIN7eMmqWXP4C3mL4E9GFNkJXoXky/FHpA8Wp0Ps1ryAv8P9K/2djMEEZN+jf
	+KZMMgyBHlSGhLP8eWGFAHzsHZed1dL0DxqA3eZzez/3Ebkr7NB/4lmWAe6DW2CiSXiufuINlrS
	juEi2D2P6bbCp3Q8/9vqAlHTrQTaw29bV/rGzeCZZptcx8modDyygzzZif+fn59ku5qPMeP3XQX
	g==
X-Google-Smtp-Source: AGHT+IHhitoziKhXGK/4vUvir0RlhvYqtbf0w6VoUxFm0DXXGjIIgAo5tsERHyW1tWVmq0iyACjNnQ==
X-Received: by 2002:a05:600c:3593:b0:477:557b:6917 with SMTP id 5b1f17b1804b1-4778fe4fdecmr165470535e9.18.1763474082956;
        Tue, 18 Nov 2025 05:54:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a96a58c5sm19787245e9.0.2025.11.18.05.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:54:42 -0800 (PST)
Message-ID: <4d486bd8-9e87-4bf2-a96f-38aa0f701c45@linaro.org>
Date: Tue, 18 Nov 2025 14:54:42 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Add suspend/resume support
To: Claudiu <claudiu.beznea@tuxon.dev>, yoshihiro.shimoda.uh@renesas.com,
 vkoul@kernel.org, kishon@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251106144148.3051962-1-claudiu.beznea.uj@bp.renesas.com>
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
In-Reply-To: <20251106144148.3051962-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/25 15:41, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The Renesas RZ/G3S supports a power saving mode where power to most of the
> SoC components is turned off. The USB PHY is among these components.
> Because of this the settings applied in driver probe need to be executed
> also on resume path. On suspend path only reset signal need to be asserted.
> Add suspend/resume support.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> This patch is built on top of patches 1/7, 2/7 at [1]
> 
> [1] https://lore.kernel.org/all/20251023135810.1688415-2-claudiu.beznea.uj@bp.renesas.com
> 
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 66 +++++++++++++++++-------
>   1 file changed, 47 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index a38ead7c8055..3c063e4dea41 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -132,6 +132,7 @@ struct rcar_gen3_chan {
>   	struct device *dev;	/* platform_device's device */
>   	const struct rcar_gen3_phy_drv_data *phy_data;
>   	struct extcon_dev *extcon;
> +	struct reset_control *rstc;
>   	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
>   	struct regulator *vbus;
>   	struct work_struct work;
> @@ -778,35 +779,24 @@ static void rcar_gen3_reset_assert(void *data)
>   static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
>   {
>   	struct device *dev = channel->dev;
> -	struct reset_control *rstc;
>   	int ret;
>   	u32 val;
>   
> -	rstc = devm_reset_control_array_get_shared(dev);
> -	if (IS_ERR(rstc))
> -		return PTR_ERR(rstc);
> +	if (!channel->phy_data->init_bus)
> +		return 0;
>   
>   	ret = pm_runtime_resume_and_get(dev);
>   	if (ret)
>   		return ret;
>   
> -	ret = reset_control_deassert(rstc);
> -	if (ret)
> -		goto rpm_put;
> -
> -	ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert, rstc);
> -	if (ret)
> -		goto rpm_put;
> -
>   	val = readl(channel->base + USB2_AHB_BUS_CTR);
>   	val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
>   	val |= USB2_AHB_BUS_CTR_MBL_INCR4;
>   	writel(val, channel->base + USB2_AHB_BUS_CTR);
>   
> -rpm_put:
>   	pm_runtime_put(dev);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
> @@ -846,6 +836,18 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	channel->rstc = devm_reset_control_array_get_optional_shared(dev);
> +	if (IS_ERR(channel->rstc))
> +		return PTR_ERR(channel->rstc);
> +
> +	ret = reset_control_deassert(channel->rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert, channel->rstc);
> +	if (ret)
> +		return ret;
> +
>   	/*
>   	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>   	 * And then, phy-core will manage runtime pm for this device.
> @@ -861,11 +863,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, channel);
>   	channel->dev = dev;
>   
> -	if (channel->phy_data->init_bus) {
> -		ret = rcar_gen3_phy_usb2_init_bus(channel);
> -		if (ret)
> -			goto error;
> -	}

I don't see why you changed the logic of calling rcar_gen3_phy_usb2_init_bus(),
moving the reset setup and handling should be enough, no ?

Neil

> +	ret = rcar_gen3_phy_usb2_init_bus(channel);
> +	if (ret)
> +		goto error;
>   
>   	spin_lock_init(&channel->lock);
>   	for (i = 0; i < NUM_OF_PHYS; i++) {
> @@ -936,10 +936,38 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
>   	pm_runtime_disable(&pdev->dev);
>   };
>   
> +static int rcar_gen3_phy_usb2_suspend(struct device *dev)
> +{
> +	struct rcar_gen3_chan *channel = dev_get_drvdata(dev);
> +
> +	return reset_control_assert(channel->rstc);
> +}
> +
> +static int rcar_gen3_phy_usb2_resume(struct device *dev)
> +{
> +	struct rcar_gen3_chan *channel = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = reset_control_deassert(channel->rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret = rcar_gen3_phy_usb2_init_bus(channel);
> +	if (ret)
> +		reset_control_assert(channel->rstc);
> +
> +	return ret;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(rcar_gen3_phy_usb2_pm_ops,
> +				rcar_gen3_phy_usb2_suspend,
> +				rcar_gen3_phy_usb2_resume);
> +
>   static struct platform_driver rcar_gen3_phy_usb2_driver = {
>   	.driver = {
>   		.name		= "phy_rcar_gen3_usb2",
>   		.of_match_table	= rcar_gen3_phy_usb2_match_table,
> +		.pm		= pm_ptr(&rcar_gen3_phy_usb2_pm_ops),
>   	},
>   	.probe	= rcar_gen3_phy_usb2_probe,
>   	.remove = rcar_gen3_phy_usb2_remove,


