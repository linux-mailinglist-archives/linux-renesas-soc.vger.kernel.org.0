Return-Path: <linux-renesas-soc+bounces-24768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E8CC6D81E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 09:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 278A74E76BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 08:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7713DD515;
	Wed, 19 Nov 2025 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJxnjTIC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ADE235C01
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541658; cv=none; b=SJwZi0T1w+rj1xgDVqczDlgZhiPip+ZJxsw+VKDpr4u6N4I8PmTBz0n8UaEsLpzXmt6yRc5WBM4LVw0xDUsgBUwC2jiDD2LQ9A9BJgbxb0cz0oWeAnh6BQgYgF0uw5PUankEXjvPMaL/fy3YnhuixPEcYkjcJEvxlfG2rKD7RA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541658; c=relaxed/simple;
	bh=uwGx8qrFtr1qDQzUaLnWNElQQPW+FrLRdKtvGK8PjA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hxwlm3dp+d1jDt1UwZRafNgZd/wy+6JfDXQyBSTEsbknfHQ+QbQ+FtyqqocFVbXgDvRsrm8LGqP0vz7Px5kOP2MRARpglk0j98NHC4he0m/J4nnd/LJo1GiP+/Bw5cE8NRlyg3UDwSr8Fa6P9hRoA5EGiVXGLU1Y1PgWtNAjkII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJxnjTIC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so2272725e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 00:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763541655; x=1764146455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yOrMLDryXE9PlOSQ/bB4YlpZs2XMhVvJ+qHSO6z4dk=;
        b=GJxnjTICIrQj9HEjPlEiXrlsKNsH8DjHQTK88VkIp0AMHlLOODAb7eW26WUzFHfkvo
         RyPIX73HSErVq+4SVpDVry2qZfAoyAci9xy2ZYMEeQf0TBa8U/sd15/AzOcWMf2MtAlS
         i4ZZsot8hfoMKqL//X0C8h591aSxw1z4pwXdwuXChMPQXzlZn9prds2gVKhrzpAm8pUe
         Lt7vFAPzGgwsmkECEsh8vFWjDUOnw4aItHVTK7UDD4H3c6Xmc9D8zLsA9b+twPagvd10
         trfl75jbXd8N4hZJiyjq2u3KfHv72Q1GyEzEdrwst65UKh0H5gax+Etq1Mwrf0Y4T/bh
         TgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541655; x=1764146455;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yOrMLDryXE9PlOSQ/bB4YlpZs2XMhVvJ+qHSO6z4dk=;
        b=G8vdP2tbp9Vsm08qqNbi8vpDz+8Y38YTLcYdxrTJi01Jwik5bZMFmdwczXcFMe5J+u
         VEKC/EioEB1orFVh9cantNVRBrvVZl8oJ4bCazIhghpxDdI9DPhiTQAoCroN5zn63dSR
         ThCws4Ozotvuut5eoMOFmN7DQrVPv7Dkv9wtUzEZ9TLVOgKQc8eoOdMynUOyVcJzFH93
         ldydt0YW7BEJGNkjRL5tIxaZGM4ls0fuePKVZ+UURw+MXLon5GOP80A4UDOTKlP0+R2o
         myI5rZ/Fxwi6IHRSPJlV+DHUbExsbBtNnbi8JYbDvmDF3kWjdWTrh+M3S8yCT1mkIe0w
         ON+A==
X-Forwarded-Encrypted: i=1; AJvYcCU52ZVkj371H0KYAw0YNDkYWvv1ugD2jyBc7nNWeQjyDWWkAqHZGWbYOJRhvU48ZMiv4D3FFKf6xOBQSBECC4JtUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvK6tKHBVnNjZ3e9CTSQWzwIHa3u0RRHnMBpA9FJ+dnuAU8C1p
	B6gQgr5qATkioQ3stn9IBnKsdE9kHM0itn0bKtC6I3PjBjgx74AeS3Jg21mzkpqmaiEW1FO7AJx
	BMNIC
X-Gm-Gg: ASbGncvBQCiv2iU1/FuZ4+UO0ElMrLK6tKyVJRpSb7QERE/nyDsuh4N6CfW97eDLN9M
	8ZycSOObmv7/e85TR3UcXzTtYawAz8grqrEnlI6Cwr1vo9//GBM5rEMaPgA51nMwfmVlxwHLkg9
	e8J79+PK5lH3tnXKNBdmxQAEluaQ+0BH8IelYQV1rECPQO459qdQ5xAXxWp8RjvJv0FRDgVstLl
	IbAV5V7Yq7zPqhX3xj+EQu2ZoiSdPTs2kXSfeGh9GvpDdbYPEfxITgRF0Mce7ZPnApAmAbZEd0M
	UIy2dqRIT9CffljO6tiLiddUKxcLmoApYFqWA6+YWPs24mtekJhxAySziXAs3X/E0O6IXCZ/W4b
	Tq482uKC2AzsQNgTTEGuuNFz9GoajfzsFsjPaJtwq/bnX4fPBUGsiP4oUFcZB4zCVyPWnhN3c3Z
	JxjKwdYq41LOfRT7lgCD1lFR3ue9vxjXKRbip9wEQxcHFB8nkaI4ANqdqwXMYHc+MwD5eapnqxd
	Q==
X-Google-Smtp-Source: AGHT+IHbR5Bme0OaD2vS7QbAGQu4DEZr/vc20Uw4ifxpOgabpSkciEkI7oy2JR4wPl1P7xHmsingCw==
X-Received: by 2002:a05:600c:1387:b0:477:7b30:a6fc with SMTP id 5b1f17b1804b1-4778feb13femr212039415e9.30.1763541654576;
        Wed, 19 Nov 2025 00:40:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad? ([2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1037d32sm33842045e9.12.2025.11.19.00.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:40:54 -0800 (PST)
Message-ID: <c68bfb03-6460-406b-8162-8fb8f2234377@linaro.org>
Date: Wed, 19 Nov 2025 09:40:53 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: renesas: Remove unneeded semicolons
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <a8807dafa87fcc3abcafd34a1895e4c722c39793.1758719985.git.geert+renesas@glider.be>
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
In-Reply-To: <a8807dafa87fcc3abcafd34a1895e4c722c39793.1758719985.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/25 15:20, Geert Uytterhoeven wrote:
> Semicolons after end of function braces are not needed, remove them.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/phy/renesas/phy-rcar-gen3-pcie.c | 2 +-
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 2 +-
>   drivers/phy/renesas/phy-rcar-gen3-usb3.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-pcie.c b/drivers/phy/renesas/phy-rcar-gen3-pcie.c
> index feca4cb2ff4d1e9e..c0e5a4ac82de2cfb 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-pcie.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-pcie.c
> @@ -128,7 +128,7 @@ static int rcar_gen3_phy_pcie_probe(struct platform_device *pdev)
>   static void rcar_gen3_phy_pcie_remove(struct platform_device *pdev)
>   {
>   	pm_runtime_disable(&pdev->dev);
> -};
> +}
>   
>   static struct platform_driver rcar_gen3_phy_driver = {
>   	.driver = {
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 3f6b480e10922950..6671616b26cec7c2 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -926,7 +926,7 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
>   
>   	reset_control_assert(channel->rstc);
>   	pm_runtime_disable(&pdev->dev);
> -};
> +}
>   
>   static struct platform_driver rcar_gen3_phy_usb2_driver = {
>   	.driver = {
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb3.c b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
> index 5c267d148c90bef9..0420f5b283ce4233 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb3.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
> @@ -202,7 +202,7 @@ static int rcar_gen3_phy_usb3_probe(struct platform_device *pdev)
>   static void rcar_gen3_phy_usb3_remove(struct platform_device *pdev)
>   {
>   	pm_runtime_disable(&pdev->dev);
> -};
> +}
>   
>   static struct platform_driver rcar_gen3_phy_usb3_driver = {
>   	.driver = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

