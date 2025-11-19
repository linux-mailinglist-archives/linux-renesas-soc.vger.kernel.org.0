Return-Path: <linux-renesas-soc+bounces-24833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3904CC6F8A6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 16:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0322A3C1FC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B318363C61;
	Wed, 19 Nov 2025 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E1Qkt35w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963F932D0ED
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763563803; cv=none; b=AZjN9b5bJKx56CIBZ+nRT2pJyS/KpOM/QcgsK2g7mlLf4ndDj8ZarlTnKc7miUXrX3hIZJcha6d7DaBLIFf6xPvu+v+LRBvLdmQY2tQL6CHqjzRF0eHezxYo3f3E0DaaOpKnAyG/4OWHwSzim0nx2R2o/GxpEE3VfG8BD6WDnT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763563803; c=relaxed/simple;
	bh=HjVeAHG/Rz5N3ImKGAxY2aZRi2InN+k/KqoJBc6ie7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvPchb7b5hU7VoYNu5nf6CXFgIj7xsZ4JeUpw1wsnMhkdkhTaBnuJYx/iUuOwFnPFraBWKA+/GuTZKNEEd6QMQQrAemGRM3F81XMQcwnqPGjhi3iZS88CNI9iOqgKDrACIf5nmlhG2V9yqCRQ0BtLMhP2Qk2zjyPc5F5jPVx4yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E1Qkt35w; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a1c28778so43631525e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 06:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763563800; x=1764168600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5IwlyQmN7aEr+k0dKo1C91kTz/zASMriIrf+oh75Bc=;
        b=E1Qkt35wugFgiZgkg0t10rJso5K12YlKtqfoUHmR6BxWKQDod6UoRWfkM4EAatdWe1
         7kjyJC21uz6F/f2ng7sk12bjfw2DkoNVvLF0BIuiiciGguMs4xuYEPZMVIb2p3GqC5bx
         ceQfm71EQLhd4ipkanucJvej+KiUC6gsYFB/zjaPqEUXynfLsS4Jnix9imzSRgUI0mjj
         fCFSoriGUTEYJ6po/IaJKEsAmYbbFRRldak7vVNKjJRw6XbjUtlmKBHgqgA62TF+5cdh
         q/vgammeYjwKLj6ETLogxSkpI7XfPOQ3XIoxJBuKAAQSVaoDBLYpXFhRzXrcf63+uF3G
         bTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563800; x=1764168600;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5IwlyQmN7aEr+k0dKo1C91kTz/zASMriIrf+oh75Bc=;
        b=t6lBlUYKNa+64ZgtvsVSF7F3ZzVEMFg0qOb3JvHfDqw64kM5NsZVZ/4hK4UiEiqz6J
         jIbo8xpxk5NH/19oLkpWyVfMC8xv0ms4kaYyvaBN+kqBYpcA+qRWAo0+qeWRBT5be8gk
         I1GLkLa5XsnCimBCWUpZkXGSW4xfokWnUVdY4KghwoEoIWog4kf1T1Ph0s0cHtEpU3i/
         vbNXjObMwJS+VMG1fVjaxNEli06mABJyNhudJF6uGKSrmPdJqsg5stTODeXvh4jBRcMX
         ni8mfxF/c98l0ZJbIfsZFIfvMyy/ULPD066vV47CdUjJOzykIx8daoxT0jFEIrj2hk8V
         TYIg==
X-Gm-Message-State: AOJu0YyTbIk9LqEpdO658AMEZd8ToK/J27BIsPLJMDJ53dgtRXgllLMK
	kE57BdVqSyf4LJgxhzPisWCJRgaQODQd7NSS/6lD8+cylhjMiTOPra4LmP90lmaxDh0=
X-Gm-Gg: ASbGncv9Q9u61Je8Vq7J42bmCuiyg05kcjv5dG9cRMI8LbwtaU9eovHyycASnRgEVJi
	jump/MSyRvUupVq0VzyeSY0WOH76Q0znJG+urLmwRdtj2Qzh6hGiH6RLnZLQIDP7ZiRSwKitMEG
	dumn7Pwai3JYFjg7SAZyazsPKNK8Q1SULX47ksx23Dl6nLxRJyqvvrf+O0T9XZ3OksyFOb2kXmk
	Fpnpus4MYc0V9yopQPqDQk3OdySsLiBkUjbukHAQkDpiM7RQpJ6GXmw2npT/GeiHq5lfptyWVad
	QhFcTY/sceYeJH1JBEuuYXaSUjZq3WXCDzPA+xvOhRwNs+t9pjbIBJ7+TBSSaOoYcq4+nMKxkRd
	T9LL15LnkGvwgWviPbmqwvlnPCYhfX1KcqiUSyRKt0dCossCs2N+NlbW2QCKqzXcp4eL5iRvoSO
	J+rXXZBOju7dlFK6Lno5S2PUE72g/eeEUo4o3H2/Y47Na5SKSWIObd76Gb+mjJM5iTUxcLfxYRs
	w==
X-Google-Smtp-Source: AGHT+IEd8UzBZRk6+xwZV/5zJBAvrlyTzFTI1kOuA2QzNhTIpZ27xlgt44WdoWaXyXgP9582F+kYUA==
X-Received: by 2002:a05:600c:c177:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-4778fea1336mr211048075e9.29.1763563799733;
        Wed, 19 Nov 2025 06:49:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:263d:925b:a11f:ae36? ([2a01:e0a:3d9:2080:263d:925b:a11f:ae36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b5ce849ddsm32017877f8f.14.2025.11.19.06.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 06:49:59 -0800 (PST)
Message-ID: <782ebaf9-38d9-4695-b5af-3cf77118e282@linaro.org>
Date: Wed, 19 Nov 2025 15:49:58 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: renesas: rcar-gen3-usb2: Add suspend/resume
 support
To: Claudiu <claudiu.beznea@tuxon.dev>, yoshihiro.shimoda.uh@renesas.com,
 vkoul@kernel.org, kishon@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251119120418.686224-1-claudiu.beznea.uj@bp.renesas.com>
 <20251119120418.686224-3-claudiu.beznea.uj@bp.renesas.com>
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
In-Reply-To: <20251119120418.686224-3-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 13:04, Claudiu wrote:
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
> Changes in v2:
> - dropped the changes that were integrated in patch 1/2
> 
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 57 +++++++++++++++++-------
>   1 file changed, 42 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index b9d5bb52e02c..3c063e4dea41 100644
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
> @@ -778,38 +779,24 @@ static void rcar_gen3_reset_assert(void *data)
>   static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
>   {
>   	struct device *dev = channel->dev;
> -	struct reset_control *rstc;
>   	int ret;
>   	u32 val;
>   
>   	if (!channel->phy_data->init_bus)
>   		return 0;
>   
> -	rstc = devm_reset_control_array_get_shared(dev);
> -	if (IS_ERR(rstc))
> -		return PTR_ERR(rstc);
> -
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
> @@ -849,6 +836,18 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
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
> @@ -937,10 +936,38 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

