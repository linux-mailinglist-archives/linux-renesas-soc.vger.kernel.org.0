Return-Path: <linux-renesas-soc+bounces-14436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B03A63575
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 12:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E40916F252
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 11:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CBA19E971;
	Sun, 16 Mar 2025 11:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLTou+c3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B16E19048F;
	Sun, 16 Mar 2025 11:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742125680; cv=none; b=UZCdmE7xY0Ne9BxWzxdsAvYhi4c+0zlbURwElRakXyKo7JKdT0UYT874oJARX/3DZcXrK3WzejYvsLg7qWSBJqfqBKX8vp8+ofwDCnp7hx2vevJSU/w2XwyxDHEryEzF9b52Dk3T60UyLeumWYCANOv2Ve8EOqiVPo8s5S46fIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742125680; c=relaxed/simple;
	bh=yCISFqx/I+e3Bnkh+oGi6Q23sL3AJFvM82O/N0nrsMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksfTy+Amk48qv6ifeB9JQCMpsxuVz4k4Wgl0d35RpkFc4Xjc35sKNM3kvQ1PJg1nzyEd7IdThQupEoLZp4QXRbc65yUKIPJzlnWqaDmInvbas9CAkqWmuP5VaChIM2nxgq/QMu8igXZrPRohmYubgxzlVAT4gehurGQRl8JUph0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLTou+c3; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so479175466b.0;
        Sun, 16 Mar 2025 04:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742125677; x=1742730477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K74ei+4L4+UEOoCNnFxdA2KRLWuXl3huEwL5JIEp/iw=;
        b=PLTou+c35K3chKssOm4oLlvO/jLcVhz7r2Jw95Lx1zzpIIVXWWeBv0Im1hSFqQq5Ie
         hJ4QcOXApOzcR3Ygodm8QVoVXwyI3J20TkUEK+RXRa9ndN1JE3Ilpys2KOdfkwn75D4h
         dzTxHUSEQGWhH1W4kK0WS+LC60PvYaR/0jmgjLpZ9rYsqYqIW3eyZWOgahx4nXUJ0JTS
         iofSnCROp70qpESFQHxsks1rksngjq7MteREcd3WdLNgrUr88TwMF16vOsr2vfm8Tv5s
         0aY5yIdB0V+fjhN125KI0aUmIiDrj5O3fipWOtZEuLroUilWXIg8sC8Lk+nPtY5Xa+la
         4tOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742125677; x=1742730477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K74ei+4L4+UEOoCNnFxdA2KRLWuXl3huEwL5JIEp/iw=;
        b=SoJMH7GNYn04HxyBNbwp27O3VSN0kALNclFqxFxfL8cWbZFmH1lFL/AjuJMSyYKO3u
         YBhtR5rKnPNxtg2QLtSAP5LwBkP14LlUHmOgV+jM/ucYxpheEPxZw5mDXNkm/PUzI3Zu
         9kPPpz2bJJsQqxZ8ZobtusmcBUNOJEAjWOlS9uFUH1n7eyMuy2CKQd7Wybr/BE6AUqrl
         Jr3+sCQqTR1xNPWAA/VN1SJIPargzF0hCrqZoRpPu7OvuhpeenZMgQcsJ7fuuM9j9Pey
         W60jxponYHHwJWohTEust6Qp6hYvqa5mrEXxfLH2loaourxqU35+Kzsh7fFZqLMmsUrp
         Vr8w==
X-Forwarded-Encrypted: i=1; AJvYcCX9zMOAgKhuvy3Dpy3gvUrcEPGj7+7NnsgLju2WmRlSKCgfPMoEqKDy1lcqY/7cpZ4v3Z+/B5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYCLYqaa3xmInAAmkBNjniU0/yafSFnzJz1iwzmgi5O8hDk5vI
	Ir3Z9A7m+lR9TxVoyZS7n4nWZny+lTE0Tm1Wl5ZA4j9kzijAylcg
X-Gm-Gg: ASbGncvN2DeJRBPjRyZ146BqaKQPb/1pViQlrJD8I+GWSi8id/6UsyfAdT5eW75LhlE
	s7s86PPXORiNRodHMmMEG/KWW4gBHY+3MUBz8Iw0vjVZF3QmmUviix0U60zIIfST2b2FEKWAvp9
	OMVP4LvOw6lsDxtvZ6p2Z1hoijtgukYuNRlg7jURBK1Yl8LBOyV2PyFQ2ADdIEKZPx7wnIlkuKc
	oaYEWO0Jjc6zprks6AxLBJWcZ5bOOlciNRJI2CDrzFtrbj81fvq1UE0IZ4EYZJ7sbC27H8cdJkL
	IiNtZqSg5/As8xZaCpc0g3fGBGilTqgBxT4GTPjtE6S5yUjixrhoUoIT1oh9tLP/BVBLoF36UZK
	1TagoAZS5LYwUulAMmDAFyTyi+v3y5r+upKLLHTAUoeWCgE6AZrVYfaKY2jQb+Nr7B0JTP2r/kk
	54CJWZBo04kcjQ5Et1fRKJBminn9J4aDtTIst9
X-Google-Smtp-Source: AGHT+IGTn3GilXCATmafGs9OXRebZA+7np3+pwoSt9EKSAl8RZQleQL4jlmP2kHQqy7WzSfoV9JE6w==
X-Received: by 2002:a17:907:7296:b0:abf:5fa3:cf94 with SMTP id a640c23a62f3a-ac330272d18mr893283666b.22.1742125676333;
        Sun, 16 Mar 2025 04:47:56 -0700 (PDT)
Received: from ?IPV6:2a02:3100:ad1e:2800:49bd:4555:ff48:8ca6? (dynamic-2a02-3100-ad1e-2800-49bd-4555-ff48-8ca6.310.pool.telefonica.de. [2a02:3100:ad1e:2800:49bd:4555:ff48:8ca6])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac3147e9394sm501054466b.57.2025.03.16.04.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Mar 2025 04:47:54 -0700 (PDT)
Message-ID: <c17d4b58-9efd-4c09-8e20-e4f9e2e10100@gmail.com>
Date: Sun, 16 Mar 2025 12:47:55 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next] net: phy: marvell-88q2xxx: Enable temperature sensor
 for mv88q211x
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Dimitri Fedrau <dima.fedrau@gmail.com>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20250316112033.1097152-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20250316112033.1097152-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.03.2025 12:20, Niklas Söderlund wrote:
> The temperature sensor enabled for mv88q222x devices also functions for
> mv88q211x based devices. Unify the two devices probe functions to enable
> the sensors for all devices supported by this driver.
> 
> The same oddity as for mv88q222x devices exists, the PHY must be up for
> a correct temperature reading to be reported.
> 
In this case, wouldn't it make sense to extend mv88q2xxx_hwmon_is_visible()
and hide the temp_input attribute if PHY is down? 
Whatever down here means in detail: Link down? In power-down mode?

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
> ---
>  drivers/net/phy/marvell-88q2xxx.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
> index 15c0f8adc2f5..cdd40b613ce8 100644
> --- a/drivers/net/phy/marvell-88q2xxx.c
> +++ b/drivers/net/phy/marvell-88q2xxx.c
> @@ -834,6 +834,7 @@ static int mv88q2xxx_leds_probe(struct phy_device *phydev)
>  static int mv88q2xxx_probe(struct phy_device *phydev)
>  {
>  	struct mv88q2xxx_priv *priv;
> +	int ret;
>  
>  	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -841,17 +842,6 @@ static int mv88q2xxx_probe(struct phy_device *phydev)
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
> @@ -1124,7 +1114,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
>  		.phy_id_mask		= MARVELL_PHY_ID_MASK,
>  		.name			= "mv88q2220",
>  		.flags			= PHY_POLL_CABLE_TEST,
> -		.probe			= mv88q222x_probe,
> +		.probe			= mv88q2xxx_probe,
>  		.get_features		= mv88q2xxx_get_features,
>  		.config_aneg		= mv88q2xxx_config_aneg,
>  		.aneg_done		= genphy_c45_aneg_done,


