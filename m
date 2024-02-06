Return-Path: <linux-renesas-soc+bounces-2372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A458384B049
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 09:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8B9C1C216CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 08:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E0912B175;
	Tue,  6 Feb 2024 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tGkw3ZSw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A440612A163
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Feb 2024 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707209275; cv=none; b=OEjOvgHY816I09Kyee5Bar9X9nc6GKDMb4Zq/x5uYzLDkU+Nlh1oJh9XA5/wGs+VCCBBVUIrW/5DMQaWPiaP55dPfpFD+gBfnOGTePIEtoVSo97GzvJql28Vov7cJjIRf2PxVWbF0mx3SshWvVhsNAuFoFvU2PsQD4e1UzraOmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707209275; c=relaxed/simple;
	bh=EsUbLCPxJMLTFoNAM1YzIwDW0MB37aZp3I+uJnzPFJw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=B0OYgLIKyr+m7Knlv7mrZLvYL8ub7/fTpeHxCFY8zCZUb7+RzDfrJJ00R9/1l2xajenMxTMI/cEQ82sURP3c5zFME9X7MYrA6fVx17YZBkz52tYvZ1yFzwfyeJiKvLwgwp5MbXqZ7nOepRW7kkBYSMzV/Qhr/Yr/ab1Vavjw6M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tGkw3ZSw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40fe282ba92so3106345e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Feb 2024 00:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707209272; x=1707814072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cgswh97JThtSZc+MWkKLL/sOqrjScM78TS+JiOIKCEY=;
        b=tGkw3ZSw3dUjfD8rX10QZYPVcfZ54vxW3M6UC4z+ILSSAySg/6GrE7ivEzZzewHoGL
         a5ES3AqMbWLwFWnsOn6PWgUzqJ++3ukJh+9hwUjoB2ENTnS2EUiz2QqRECmyUBMPGJv5
         W3S26iowVwHRBbkZkT4Ln8MWrQJYMFVqGVhZcO5eAO8NOzsgTYILSiKRek/tkFv9/wov
         nRr7x0W0/2NeNmXnxuWm0o6C4Ot6dKpK4XdxOU+tLypV7WF2ncVLeHAiW1B6NcgMEP3b
         8hi+D/m6wpuRTCyIp3E7JiNNTmAfNJcJ0IxmFlAENGnoSQZ9+NH8iYUZoOo/tZLO5UHS
         LBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707209272; x=1707814072;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cgswh97JThtSZc+MWkKLL/sOqrjScM78TS+JiOIKCEY=;
        b=P/BoH3pURRabEQk1HeJjNlq4yCp548Brj7B9eus+ZU3y1dDB8Hv8j0I5ZshMhqgfaZ
         N9nLt/0VALAaaPLlIC4O/Z4ujGlfwquoijbc6C5ug1G6TpSf3OiJk8weIUWSjmEPR8Q/
         +G3KCVmt6DzokO+Dgw/0C3m59lrtmqZVD2ecOknwslUlbIghyXxn/YN8iwRJlixHflWz
         XbBaV4/c3LtMSAaBCt/ssFXfaMyDg2LA/kWUw/4/Us+3fEjdnH7tdFN6Rxp80zOYNCXg
         D7sdxoz3QvXl3LL2HNKvuPDbFc+mjoMjCvMN0zM8GXKG59ajYcuoeruKjA11B19c5CCU
         HDxQ==
X-Gm-Message-State: AOJu0Yx1qYRrHXMHhYSaN5xiA0ZvMZt4rk7CxvgzGZc/+pRlvjta1qNr
	QRleueyH1QG9JPW8+T5cveTiGBRWlKXPpp0nT+NEDtvwxyJp3qnZH7zWwudWFXU=
X-Google-Smtp-Source: AGHT+IGhYB7S/j7lcNzeBzGO6RKkAL5j0F4BGe7lMnfxVZSyyt0yaNgwR3CzP3SL1KkRGHmCS6IleQ==
X-Received: by 2002:a05:600c:5204:b0:40f:bdf3:3426 with SMTP id fb4-20020a05600c520400b0040fbdf33426mr2050471wmb.31.1707209271941;
        Tue, 06 Feb 2024 00:47:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX161gOqgvdRv10X26uunEqBIdx6lmer6jebnO8ie7WB84hoaVNdkmlbFSJ5LjujcMzuSzR/xphCn25giI+Q9UXCOpzU0SYElVmWIQHgdF1py1U6L8WklwZZ3QCMEX5nHAOzbJ9xizUKNmRG7qouRrbJUW2H0ChFld4lhcQ1KE9rJ+70wxfDZBjS2Kc0VxqLZOAGYnfch42/wyj5QYcH8ntahvUVFDmk41fpL5rXhGVE0BbfZWgTNwPSj9wZMcSWF77C2AruITJSKqyiP1Go4J5m1tT1or2ugXqOOxrXzTQ7YDRBGl1iKaBRVIiXD6ZaV+DyjcjKv5cvRVdxCt+od9xKcOV6F3/VQr3bdL2enneL+g0fOryGLlMbyAjDVZkC9jBg3EDHyoUXjj03kT0z561HwcXCTD6FBYlDJfH5VxhCQ7lVPLqsGVNUuEXexKOKhaEBxfYQHceEq7+1Ca4rKDHI5JfApLifcobxpRZNIZRb47N+wmvsTtdfZg4sc9kWkJD3GZshjCLZt+YeEjY/a3k8X4emne7fSNi6nAfvkxYgs12WG8iNGcsJjCA3i0mkA7UCH+6Wp8IcF80TAwq9ZrMZVn8Lmo9ggVYYDUb6g==
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd? ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
        by smtp.gmail.com with ESMTPSA id l16-20020a5d5610000000b0033b3ca3a255sm1511899wrv.19.2024.02.06.00.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 00:47:51 -0800 (PST)
Message-ID: <0e47aa27-b28d-4672-a2eb-f906e0e6a5ac@linaro.org>
Date: Tue, 6 Feb 2024 09:47:49 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 08/18] mfd: khadas-mcu: convert to use maple tree register
 cache
Content-Language: en-US, fr
To: Bo Liu <liubo03@inspur.com>, lee@kernel.org, wens@csie.org,
 marek.vasut+renesas@gmail.com, support.opensource@diasemi.com,
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 mazziesaccount@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20240206071314.8721-1-liubo03@inspur.com>
 <20240206071314.8721-9-liubo03@inspur.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240206071314.8721-9-liubo03@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2024 08:13, Bo Liu wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>
> ---
>   drivers/mfd/khadas-mcu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index 61396d824f16..ba981a788692 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c
> @@ -72,7 +72,7 @@ static const struct regmap_config khadas_mcu_regmap_config = {
>   	.max_register	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
>   	.volatile_reg	= khadas_mcu_reg_volatile,
>   	.writeable_reg	= khadas_mcu_reg_writeable,
> -	.cache_type	= REGCACHE_RBTREE,
> +	.cache_type	= REGCACHE_MAPLE,
>   };
>   
>   static struct mfd_cell khadas_mcu_fan_cells[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

