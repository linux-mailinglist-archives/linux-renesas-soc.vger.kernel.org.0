Return-Path: <linux-renesas-soc+bounces-16155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36674A93A56
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 759833BB37F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 16:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAAB20E314;
	Fri, 18 Apr 2025 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yly1xyLg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F094884A3E;
	Fri, 18 Apr 2025 16:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744992568; cv=none; b=g6RNfV4TFjaUwNsh8nkJg08VQHzavaCSzEPzHjKiBAwD7og4mKf9UB7cGO/zfJj9YekmFQaOlrI5q2QJyUFFNe2x1jqmrYWFG/xg9d1JuQKUJKX1l90m01w9b5e2ZTfpXrU8hGGY6Qh9zdTMKkjIBVjH4PGy6ZtfzggUfLvDvTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744992568; c=relaxed/simple;
	bh=Uv7pENQg7DTalNvZ7cHL+RiBRZCUYmacDUGWAAvqrYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbZzfYlzRWB+b1A6ZmZgsMvFE3JDjM0C/Em2T8yqybwJJ4lcjx1b7dmXyS3jBRIpY57M3OEwTaYDntG6aw2SS8jc1t0rt/OvTEzou3TFADVR7pBjuZMAUOZhgzLjCuwtAV9STHDlIdM9+nl/qlDDcjjMESH0GUNG+bo9w3eY2bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yly1xyLg; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso2965155a12.1;
        Fri, 18 Apr 2025 09:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744992565; x=1745597365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fzimYMrRJDYOAnnmUSuII8inTGA+roG1zb1ktO1nxBY=;
        b=Yly1xyLgz3QBiFC+ByrQhc4FKb6HmZobL9Dxph7KbcfnHtk2wv86JFwa1agaVBvh61
         hobOyvwBvSfUTsgcE2Jo58nRlv73AEzzeS9EP479S8MUG5IF9fxgjDI/DvO7qcsmxgpo
         EMJ7ZfM+8CqCBUrFT/b5V1JvkijsiL6AG5nrcTR9v4WkppMnmODhsBX3XJgy3QBBKI4D
         HiS4MMDp5xf6LC9sk4bjGowikjV67NWE+xhPIyAP8fY+nx2WLO2OPgo43CUu6VSWvTKy
         r9r9lNdOtD+Hv+6HpzpfoJajS4ypLz/4utT1RT9IwIG1qtBpSR9u0AEcXjT21k3+dnNR
         gPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744992565; x=1745597365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzimYMrRJDYOAnnmUSuII8inTGA+roG1zb1ktO1nxBY=;
        b=mDRt/Gzc/HWj7M60UHygppOnwpMTBh9tLr2CT/kCXmGk+O/CopNLv/ePLLMNNn7nfu
         9ZXfnkJLxhtdsHgL9dry113KDBZFRndZVPlKwKitZj3EdYbuIWNLEseyjGILNjmj+F4z
         dv8m5R3sgEF41eV7KUiS1tXVKVuYWNlqT5+pi1Ut1LjkjhpvBNaJJTKkKpBXEynGJIez
         TKTWaiKClrBQzT1q/V5/hL9Uh/kn1Fgmvx2fwIqaQE11my+2hxMJaxp7nFcKypbeXTSS
         LCuqiW4CYHs7iO17xqj7Jn6/ukBrsy477AC+TPb29hh6H6t3p2N4ELgEIVWC0gEfnw6b
         NdGg==
X-Forwarded-Encrypted: i=1; AJvYcCXDb6hWAwd1qE2pMinyUneQ20aLCRm0sw825LjIXh4YEkytgXjuPOWsim0eWjWuluFiH4URtU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+YyKecVZkNltF2ts2kgdle8FmZQGRVm8c2ZAYQ9dwHgrfUKc9
	blpr0CCKtKHLlxCs20OA7GDQjiOIqbPjGFUwW6xoDGsgDtxZ04Nr
X-Gm-Gg: ASbGncsC6dAq9Y9VrGxkvMxL9bzHUlW4rWKVIao0mVIJJDxF72JCTmfLJERM5wAxOcY
	bVq0mB0uGAJ6DVJEc9kl9HTrLErvpuNXKqAIMdk+xTCe1N/KEsdKWOLQfDGnXjd+VU25Oijw9OY
	JFDzRSJoMjTg/bzA7K4SJ5zfsWTMYC0sMovSr97urilbOzl58MWqHj1AhzyXiSwfhCeMvMb6tnJ
	FCo/Vs0q/Y8fsh+omUXanqb5UpjuslbZhQTJcWG9U1zTC4gGjwRq0iLDKg4iD35NvW6ysDHqd1a
	0VQ40INS8iixY84k2YS6nz2TkbeynakYrGom43O6gW8T9eCmopSwyj5Jbwnd8AT4glWpk/Q/2F1
	j09a6lz/EePFX3dJj16y8FwJUQGvijCgZMMccD2G58inw/yGmCtWU//pk9/4IQqTZ7rrPqU/DJE
	9+gUSqB+aKgCM04cFpjlfvwmkxFKtcL/Fs
X-Google-Smtp-Source: AGHT+IGdIB0x+8wWHts/rTdwqsfbrcjFwkm9oSLHZM0tCn9rbkRg7BfL0TEwmauZ0jyMZpFD7zF3zw==
X-Received: by 2002:a05:6402:2708:b0:5f6:212f:ec9 with SMTP id 4fb4d7f45d1cf-5f628507b8fmr2620979a12.1.1744992565005;
        Fri, 18 Apr 2025 09:09:25 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a14c:6800:64c1:f857:3ca4:c5c8? (dynamic-2a02-3100-a14c-6800-64c1-f857-3ca4-c5c8.310.pool.telefonica.de. [2a02:3100:a14c:6800:64c1:f857:3ca4:c5c8])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f625834091sm1108144a12.63.2025.04.18.09.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 09:09:24 -0700 (PDT)
Message-ID: <5d416bce-9ad3-48cd-95bc-0436aefd4baf@gmail.com>
Date: Fri, 18 Apr 2025 18:10:28 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v2] net: phy: marvell-88q2xxx: Enable temperature
 sensor for mv88q211x
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Dimitri Fedrau <dima.fedrau@gmail.com>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20250418145800.2420751-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20250418145800.2420751-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.04.2025 16:58, Niklas Söderlund wrote:
> The temperature sensor enabled for mv88q222x devices also functions for
> mv88q211x based devices. Unify the two devices probe functions to enable
> the sensors for all devices supported by this driver.
> 
> The same oddity as for mv88q222x devices exists, the PHY link must be up
> for a correct temperature reading to be reported.
> 
>     # cat /sys/class/hwmon/hwmon9/temp1_input
>     -75000
> 
>     # ifconfig end5 up
> 
>     # cat /sys/class/hwmon/hwmon9/temp1_input
>     59000
> 
> Worth noting is that while the temperature register offsets and layout
> are the same between mv88q211x and mv88q222x devices their names in the
> datasheets are different. This change keeps the mv88q222x names for the
> mv88q211x support.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Dimitri Fedrau <dima.fedrau@gmail.com>
> ---
> * Changes since v1
> - Clarify in commit message that it's the link that must be up for the
>   reporting to work, not just power up. Hopefully this oddity can be
>   solved in the future by patch [1].
> 
Following this link I don't see anything which would deal with incorrect
values being shown if link is down. What are you referring to in detail?
I think you have to modify mv88q2xxx_hwmon_is_visible(), or return an
appropriate error in mv88q2xxx_hwmon_read() if link is down.

>   This change just aligns the mv88q211x with the current mv88q222x
>   behavior.
> 
> 1. https://lore.kernel.org/all/20250220-marvell-88q2xxx-hwmon-enable-at-probe-v2-0-78b2838a62da@gmail.com/
> ---
>  drivers/net/phy/marvell-88q2xxx.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
> index 23e1f0521f54..5c687164b8e0 100644
> --- a/drivers/net/phy/marvell-88q2xxx.c
> +++ b/drivers/net/phy/marvell-88q2xxx.c
> @@ -828,6 +828,7 @@ static int mv88q2xxx_leds_probe(struct phy_device *phydev)
>  static int mv88q2xxx_probe(struct phy_device *phydev)
>  {
>  	struct mv88q2xxx_priv *priv;
> +	int ret;
>  
>  	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -835,17 +836,6 @@ static int mv88q2xxx_probe(struct phy_device *phydev)
>  
>  	phydev->priv = priv;
>  
> -	return 0;
> -}
> -
> -static int mv88q222x_probe(struct phy_device *phydev)
> -{
> -	int ret;
> -
> -	ret = mv88q2xxx_probe(phydev);
> -	if (ret)
> -		return ret;
> -
>  	ret = mv88q2xxx_leds_probe(phydev);
>  	if (ret)
>  		return ret;
> @@ -1118,7 +1108,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
>  		.phy_id_mask		= MARVELL_PHY_ID_MASK,
>  		.name			= "mv88q2220",
>  		.flags			= PHY_POLL_CABLE_TEST,
> -		.probe			= mv88q222x_probe,
> +		.probe			= mv88q2xxx_probe,
>  		.get_features		= mv88q2xxx_get_features,
>  		.config_aneg		= mv88q2xxx_config_aneg,
>  		.aneg_done		= genphy_c45_aneg_done,


