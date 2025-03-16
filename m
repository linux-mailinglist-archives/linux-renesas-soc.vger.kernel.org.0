Return-Path: <linux-renesas-soc+bounces-14438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E98A63637
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 16:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4640816C43F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 15:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2081A0BE1;
	Sun, 16 Mar 2025 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcW+Wz6m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22C84430;
	Sun, 16 Mar 2025 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742138610; cv=none; b=A1A5IVFiYasOs2z2+0+jqSFRoy/dtnrsc6drUBedVbKqRQMw+U9q7KZANQ0jh4E3K1EcMegpAbN4Vge5XOefhVwEjB+fb2gIANEuJOLsrfPoU1FrNC5fG2JlpSkJCZD97t9rfTbAEGh+ZaSzjyorDcdKUYPGIOtFEhb95x6M8MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742138610; c=relaxed/simple;
	bh=u5O2hIJYLpbvuv5WUuWmiEwpTZ5Wm51O/tTwGa4eZww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKDe8n25cQYHuKpWWVYtxO70gtRjVnq5K/+UJ/lR0iO7/+YW9oyDyDtW+CD2Q5PDtLQhx2mkPRd/oSydYbHxWd6f550O5y0vjL4BsBwm+ZmYfjX60fvx9h8iJNA0OhIcUPVbkeF09zi+EDg7z/w6n+WILqT2S3omjmZnKNXn3IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcW+Wz6m; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39727fe912cso685925f8f.3;
        Sun, 16 Mar 2025 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742138607; x=1742743407; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5JLfCmTWfDl5v+BTl1A4AkzQ9L0soYHfycDaefH0XAA=;
        b=hcW+Wz6m7A+606OzrhRCD4UaARKkh0hXnW6JqX/B4WB4+TxWfUPpBKacPV1/s2iOh/
         NyVFRM6kyYnn5u9ZVwEwIsKp+VSZ7YyYFg5Xvjk8xR+9VWHBFZ/Apa4Vs2Tc2eYA5Eri
         zwRfjqQZd2glV+TjvuGWgJT6r6BfVT9L36cw2sZ0QeyOrQo4AM4AbtpOzREWXl+pCDU3
         c7MhIglN8lYfmWVcfAciCQpHSaYjYFjnORw8gInFFxwfGDlK9cx8DvIiHAEZtd0o3/Ac
         cstic/irYgxt3TNQiX/MfjTp5X/kRtprvk0rYKxHvZlGMN7oTWjJpBs7v632k2cOk0+e
         wjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742138607; x=1742743407;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JLfCmTWfDl5v+BTl1A4AkzQ9L0soYHfycDaefH0XAA=;
        b=r2JW7HR8cbUmnbzLdicH83J8VDfBZyHfmzQnkDWAyHfu3+lszd7x8IPDyFy59JWhcK
         rkoy3jP/CeD30MXPQe/XA4V4eZKMvVKTkjE6zBBf1qaWEU/NcGbegIDb6Cg913RV7vW9
         mGxg2T8CoAnCIfprRTaWtLYfdXGgqcwVPgQXcXhetTO8ln0SMGcRArPaFGNC+Ga4d6Jr
         UpTqjehl296NaB4KDotdX/1w3Vu3rOrNMPHrpgZVWlwC8+Jp23ya3+JN6v8CQB/62YHf
         ZCldu8T+Lyc77b1uiLW0M95B0bjHD8OzJmaYfgwI0XutS9CtguthyIE4HyfNvCl2u96e
         lQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCV8Bz6d3N61RtiZXt99ACUV+ugB5zXrV0IOxP20vzZxOVP2VsQYn5M5V2zsh46p6c1uPPZj1muvnJe4wQjnwwKr4Q==@vger.kernel.org, AJvYcCX05WU9jqevBv1SMvGaq4LS6AXCIZgL4jaJJ/T0MVNGabyhdCQyvw9GJ33y9FKKLFdi/+W06zLm@vger.kernel.org
X-Gm-Message-State: AOJu0YzD3Yykhyq5VwjJhm4guvvSaituiGbMfg4up93EPhngT/FMu2Qv
	RUw+hjtAbJP2qD+Is0GE06xpTf4++QDZEFf+gjNgQlJCfYyySbIsRJ1vDQ==
X-Gm-Gg: ASbGnct1eC7craQ6SaaCptIv++e5UKXmPKZv9QehHeQ0wXpE7d9sbuMI8RTeFlLy11K
	OoVs/OyvRI9wIpIdy+vRC1zzSNxoX3P8uHybLwXSQNZ6uou3fPHPZtijfnN9lsDpemQ2sf+b0hO
	zZMwwoesJDscAgei6ueCYZWplWoBI18VISl4D6Z4Z5vYVQbDfy48A09czxEd8Cp6SEEVlSmfWm5
	iFyGTq9k0py6v+QfTK3ly7rQDsr7dTNr1vatbqutJISEQumswIARATO4Z2NkqfRF7/X97AbqWei
	dy//dbm1q5E0irCvqHJ6+x4CV7Ac8KM8fklNb1dem9aqh8h2MOH+
X-Google-Smtp-Source: AGHT+IFMprZ+lrOTonOkV8j0h3jidkgGClxGggEhlu2SpBMX7tvixbc44IbbH2Gs8iM2ZllLhhCmFw==
X-Received: by 2002:a5d:5f85:0:b0:38d:d701:419c with SMTP id ffacd0b85a97d-3971f9e521fmr11466329f8f.41.1742138606691;
        Sun, 16 Mar 2025 08:23:26 -0700 (PDT)
Received: from debian ([2a00:79c0:612:2500:45fb:7d1a:5e4d:9727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fd274c4sm51983375e9.0.2025.03.16.08.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 08:23:26 -0700 (PDT)
Date: Sun, 16 Mar 2025 16:23:24 +0100
From: Dimitri Fedrau <dima.fedrau@gmail.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: phy: marvell-88q2xxx: Enable temperature sensor
 for mv88q211x
Message-ID: <20250316152324.GA12356@debian>
References: <20250316112033.1097152-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250316112033.1097152-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Am Sun, Mar 16, 2025 at 12:20:33PM +0100 schrieb Niklas Söderlund:
> The temperature sensor enabled for mv88q222x devices also functions for
> mv88q211x based devices. Unify the two devices probe functions to enable
> the sensors for all devices supported by this driver.
> 
> The same oddity as for mv88q222x devices exists, the PHY must be up for
> a correct temperature reading to be reported.
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
> -- 
> 2.48.1
> 

thanks for your patch. Looks good to me.
Did you have the chance to test the LED support as well ? I'm asking
because mv88q2xxx_leds_probe gets called in mv88q2xxx_probe. LED
handling should be equal for all 88Q2XXX devices, adding the support
should be easy. Anyway:

Reviewed-by: Dimitri Fedrau <dima.fedrau@gmail.com>

Best regards,
Dimitri Fedrau

