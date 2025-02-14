Return-Path: <linux-renesas-soc+bounces-13179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0F3A3663D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 20:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13BF63AEE29
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 19:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF81019644B;
	Fri, 14 Feb 2025 19:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lb2NvEEE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D912E3A8D2;
	Fri, 14 Feb 2025 19:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739561900; cv=none; b=kZeiQm4rVeIbXnqtKLPlygDMoBWm3O9yEnWoq4EdIYY6w3v1WIGD0CiYDaQGdHircIye7bxULne2T3MPu6BtuCpPxh019+0USRsjHAqeInkuqE3SK7Upum9APGSXFtg8imqQr6p3Iha2qStpl0ZA4tuwpd89jIyp5Zva1SsjMX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739561900; c=relaxed/simple;
	bh=4VxdAkc7fqgKKie8X3SDuMO44ZyO8mBEJMKU9sJsqfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUWcuQDIGFUEoi3YzIfrg5zrVe09EBkfxHKDTpD9D//8mJSOljEXBZfuv8ql5HpQRVB3lUUoKl5ddYRUyzCoLOf0+h7L+oG6a7OHGAEkezZ7W8AjE2/UZBKzIl7URHDORGdpFfxVpyTud/bI2cKxT3xxlgTPaDCmtsUj0xwIqvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lb2NvEEE; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7e80c4b55so465710966b.0;
        Fri, 14 Feb 2025 11:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739561896; x=1740166696; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l/Q3UsbYjOQ92Urz+2tPB1sstsQxQ+p5yYbWomc2BgQ=;
        b=lb2NvEEExVbok2oDhBomGRiOnkl7/MSj/zpnxZ1aleRfmV+gsHe9ukAFItymlLkHLv
         LvREByRflXyXODsbfbZWRT8YYC7mR7Bih4qJUKmcpzzBeQjasw2VdxEJEc2dEynhp13f
         OZBKH356iDiPCTHEMFqjCRHN2gGwjCdktib5izjS+njWTJ9hAATvVygLHYhcAAqL8RWI
         mR2Uvex585CX1X068TrbudktOV3rAM9dq+mNnMoL4QCf/9Z7YUbLtDs+9oiAe+DY15Fh
         qrvc/kDgNmzfuTMVCmWpykD0CpQ3P+N88IvYLsRCG8BeC6dr29IvX/sFZbqF+EE5Njyl
         BLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739561896; x=1740166696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/Q3UsbYjOQ92Urz+2tPB1sstsQxQ+p5yYbWomc2BgQ=;
        b=fzte44LJAi0chnAQEGgrd7iBqhRhE+ho7/92SLsZ9Byr7iQlj0cDwDkRhJ7ZlIMKog
         /Fzye1NMtUNAZTUxVwJINH4+UI4WVCTZkzkWOc7P5JITsWGXk8pSFW1B67oAe/ro01xt
         DRyT89D+t+eB76OHcNvKHP+TNiP4fjHpskjnIi0qAZt0JTTSZfaAGamBOW24D64HeaKe
         h1oe5QAcxo0MqYyuodNc9+hh7L+ga9+KAeBzKCWCAgGKHH8DIEaZZ6rx37afnEcIhnUS
         1JXZ62VEWvUuuF0NCrWtX9gCWhn4ndmR9bylaGETx6VM4mtFmHU6qCkCoXWFpDLcI31x
         E4hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZMiviVWYT8oXD9wnreoY9TaLQ2ZBZe9K24CDzsuTaqwqiJ5zd4fxwKO/sPNzPlvmUJtr+aQXu@vger.kernel.org, AJvYcCXnjw7x8YXfkCV2UpsCFdO6NQ+2++y4BE4U8LvEP+6XXyjdu5/cMw6etdz//xCl3RA1XAVLvhjNiYDpXU+aNKt52w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvGJVCRFVsibCB49wEbUZD49PfUK8/+DsWMAsGOLDpXZZ1BSqy
	S2mjuRZuP7QqZWHCEXEiU4eJVw1l2ZXXC2R28nM8t2FZ+xXWTyCVZrhCYg==
X-Gm-Gg: ASbGncuCx6Gk5YnetNv2Dfw0tXsk7DHNamQ+nbwzFT0ww/0cinvXZRAz5YPwF+EFseW
	WSOqs3H7GbaZQ+hL1vjEi+nfn+Qg/Xf/3mhHwaKlaBHp8sLLbAl7a62oR+qXcP/SYpywP3VDJYX
	FndQCWC2qoZut6a9kwxqsiSzgEUq8S7N9B4cS+Zj9jiMU8L1BkqSqzCqmZL7++kVRicv0Zrf+2O
	j7UnRYvvmcFxFlSroLzCsrmt8rrMbfLirRFy/iqPiqTUsrYmA6Tuetsz6toKB3JcHJCCSymdOu6
	Abqsv0XunrC3
X-Google-Smtp-Source: AGHT+IEo1KdvrFUlFME5lHU+404tGRUwqF1vXFVm3Tg00bPt3JLu7kwqDAQpRjpkbp8vw6w18oS6WA==
X-Received: by 2002:a17:907:3d8e:b0:ab7:f0fa:1341 with SMTP id a640c23a62f3a-abb711cd38cmr28758966b.56.1739561895742;
        Fri, 14 Feb 2025 11:38:15 -0800 (PST)
Received: from debian ([2a00:79c0:653:f300:45fb:7d1a:5e4d:9727])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb6f13b11esm21844366b.71.2025.02.14.11.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 11:38:15 -0800 (PST)
Date: Fri, 14 Feb 2025 20:38:13 +0100
From: Dimitri Fedrau <dima.fedrau@gmail.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: phy: marvell-88q2xxx: Init PHY private structure
 for mv88q211x
Message-ID: <20250214193813.GA244828@debian>
References: <20250214174650.2056949-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214174650.2056949-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Am Fri, Feb 14, 2025 at 06:46:50PM +0100 schrieb Niklas Söderlund:
> When adding LED support for mv88q222x devices the PHY private data
> structure was added to the mv88q211x code path, the data structure is
> however only allocated during mv88q222x probe. This results in a nullptr
> deference for mv88q2110 devices.
> 
> 	Unable to handle kernel NULL pointer dereference at virtual address 0000000000000001
> 	Mem abort info:
> 	  ESR = 0x0000000096000004
> 	  EC = 0x25: DABT (current EL), IL = 32 bits
> 	  SET = 0, FnV = 0
> 	  EA = 0, S1PTW = 0
> 	  FSC = 0x04: level 0 translation fault
> 	Data abort info:
> 	  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> 	  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> 	  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> 	[0000000000000001] user address but active_mm is swapper
> 	Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> 	CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-rc1-arm64-renesas-00342-ga3783dbf2574 #7
> 	Hardware name: Renesas White Hawk Single board based on r8a779g2 (DT)
> 	pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	pc : mv88q2xxx_config_init+0x28/0x84
> 	lr : mv88q2110_config_init+0x98/0xb0
> 	sp : ffff8000823eb9d0
> 	x29: ffff8000823eb9d0 x28: ffff000440942000 x27: ffff80008144e400
> 	x26: 0000000000001002 x25: 0000000000000000 x24: 0000000000000000
> 	x23: 0000000000000009 x22: ffff8000810534f0 x21: ffff800081053550
> 	x20: 0000000000000000 x19: ffff0004437d6800 x18: 0000000000000018
> 	x17: 00000000000961c8 x16: ffff0006bef75ec0 x15: 0000000000000001
> 	x14: 0000000000000001 x13: ffff000440218080 x12: 071c71c71c71c71c
> 	x11: ffff000440218080 x10: 0000000000001420 x9 : ffff8000823eb770
> 	x8 : ffff8000823eb650 x7 : ffff8000823eb750 x6 : ffff8000823eb710
> 	x5 : 0000000000000000 x4 : 0000000000000800 x3 : 0000000000000001
> 	x2 : 0000000000000000 x1 : 00000000ffffffff x0 : ffff0004437d6800
> 	Call trace:
> 	 mv88q2xxx_config_init+0x28/0x84 (P)
> 	 mv88q2110_config_init+0x98/0xb0
> 	 phy_init_hw+0x64/0x9c
> 	 phy_attach_direct+0x118/0x320
> 	 phy_connect_direct+0x24/0x80
> 	 of_phy_connect+0x5c/0xa0
> 	 rtsn_open+0x5bc/0x78c
>	 __dev_open+0xf8/0x1fc
> 	 __dev_change_flags+0x198/0x220
> 	 dev_change_flags+0x20/0x64
> 	 ip_auto_config+0x270/0xefc
> 	 do_one_initcall+0xe4/0x22c
> 	 kernel_init_freeable+0x2a8/0x308
> 	 kernel_init+0x20/0x130
> 	 ret_from_fork+0x10/0x20
> 	Code: b907e404 f9432814 3100083f 540000e3 (39400680)
> 	---[ end trace 0000000000000000 ]---
> 	Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 	SMP: stopping secondary CPUs
> 	Kernel Offset: disabled
> 	CPU features: 0x000,00000070,00801250,8200700b
> 	Memory Limit: none
> 	---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> 
> Fix this by using a generic probe function for both mv88q211x and
> mv88q222x devices that allocates the PHY private data structure, while
> only the mv88q222x probes for LED support.
> 
> Fixes: a3783dbf2574 ("net: phy: marvell-88q2xxx: Add support for PHY LEDs on 88q2xxx")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/net/phy/marvell-88q2xxx.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
> index bad5e7b2357d..4fca9ffc90fe 100644
> --- a/drivers/net/phy/marvell-88q2xxx.c
> +++ b/drivers/net/phy/marvell-88q2xxx.c
> @@ -825,13 +825,24 @@ static int mv88q2xxx_leds_probe(struct phy_device *phydev)
>  static int mv88q2xxx_probe(struct phy_device *phydev)
>  {
>  	struct mv88q2xxx_priv *priv;
> -	int ret;
>  
>  	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
>  	phydev->priv = priv;
> +
> +	return 0;
> +}
> +
> +static int mv88q222x_probe(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = mv88q2xxx_probe(phydev);
> +	if (ret)
> +		return ret;
> +
>  	ret = mv88q2xxx_leds_probe(phydev);
>  	if (ret)
>  		return ret;
> @@ -1101,6 +1112,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
>  		.phy_id			= MARVELL_PHY_ID_88Q2110,
>  		.phy_id_mask		= MARVELL_PHY_ID_MASK,
>  		.name			= "mv88q2110",
> +		.probe			= mv88q2xxx_probe,
>  		.get_features		= mv88q2xxx_get_features,
>  		.config_aneg		= mv88q2xxx_config_aneg,
>  		.config_init		= mv88q2110_config_init,
> @@ -1115,7 +1127,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
>  		.phy_id_mask		= MARVELL_PHY_ID_MASK,
>  		.name			= "mv88q2220",
>  		.flags			= PHY_POLL_CABLE_TEST,
> -		.probe			= mv88q2xxx_probe,
> +		.probe			= mv88q222x_probe,
>  		.get_features		= mv88q2xxx_get_features,
>  		.config_aneg		= mv88q2xxx_config_aneg,
>  		.aneg_done		= genphy_c45_aneg_done,
> -- 
> 2.48.1
> 
thanks for your patch. You could also just switch to mv88q2xxx_probe.
Then you would get HWMON and LED support while fixing this. 88Q2110
supports both.

Best regards,
Dimitri Fedrau

