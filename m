Return-Path: <linux-renesas-soc+bounces-8951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A925A976F26
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2024 18:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69301281B53
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2024 16:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7F51BDA89;
	Thu, 12 Sep 2024 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqOaz5Q2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEAA1BD002;
	Thu, 12 Sep 2024 16:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726159954; cv=none; b=oZ7FrDfJAc+5BTAni+LPhbLwhe0LHJOxk5kBMwlxigh9awOec9YuIV2FSwVZkIyoj3kH0/FmUYo6Ko1zskJAberKYM09HPznInnwkAQroZAUfpzk72KQFOmFmTZOu6lsSZA+iXOlG+vy1B3L92FRFILb7q3bAlKrk8OCTltVrHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726159954; c=relaxed/simple;
	bh=K+Wd8X9yFGfyPVoEZ7UrkcJPiYFVQJAUqr5wLL0yulk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzdfivC5Tm1O+j0XJz52htsJ+e/0uH7R/YA3vWEfaUR9mU/WUcuZmLJmvuj94+kAypjAspaVOqyL1lEuuFgPinw0Tlc5Mf2RVMTg1QJN2gTOoFYZDuvW2GkwJNxzTCczxyqCgYzninE8gSgmaIryh5VG7MEjVG7N4mOMxXbXqhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqOaz5Q2; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c412cab25cso1409853a12.2;
        Thu, 12 Sep 2024 09:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726159951; x=1726764751; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E+qYy9wxlqbNVk/fX19YXA25U2GbicIS2xFaXry74ek=;
        b=QqOaz5Q2R5vbE7AcgiWUxXVlF94y3zB/Gbqt/j+rJy8c1pz1Y7uPoHZr7gPCT4RptP
         QBD7V21xSlQVF3BzOxYj10FrG7bkA85D77BTh+Dx/wtOPMzBs4DfWwvTprfXLuNxZVHA
         X+aTS2H/pteaFZ2QafIRV3tCz90lCIS4WbYXLPnoHej/wCIBKtDWUizlGHTOy+gOvdGB
         j52tBgj8DhT1XtADzstNZTseepUfQFi4vsVmXTyfCO6ZFSh1RNji2StmrEHH+rb3UKVp
         Liq7T/2YRR6ZRu3HKGW/52wUsSBpQdBVpXmg0NCJe97eooMx1HL7exj8QKkiWwXvBzxb
         befg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726159951; x=1726764751;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+qYy9wxlqbNVk/fX19YXA25U2GbicIS2xFaXry74ek=;
        b=PBAR4EldhgkokF4NDPGfjKI5q7L5btnyKj1J5KfFw3kG0YiWOkikQRPJMYCnWjIkGg
         i7+LhQUYlsqJp2B0qJECnx3QeJUzg0vrOdJuVS3H8Mp1rHqdN37q7hxWkS4dXEM3UZsl
         EvbBOFRUPSwm21Y7w5H2eiijhkCU8GdBfPWw7Wx3i2ps9DIrJT939AtbiRe8zv2xYrWL
         DX2CBt6VSy3gLGe+62xW5xfWi1w3gzJcJD0Ymfq5yJswE6F/1fgHcnDmstS94pRxqbXf
         7Jmgohokul4eOcVKnS6iXIb+MlkeGIzgGa/ZdhzQXBohcXkKaer6ynMriqRose0rY6bN
         f15A==
X-Forwarded-Encrypted: i=1; AJvYcCVM0OGpgC0fF50oRRNHQwOVs6qRRcqQ79+E8NEphV2OFbzQEfQ9ord1pK5Gsd6v6wZFPjBP1Q5a@vger.kernel.org, AJvYcCWCQurOfflWTDUBvzHnsRuU/2puoKEHZxf0N/m9KFyO9gUYKhLdLViA4rWPWds3ivmc9gykFRXRKDn4+NWHVtz/5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24+7CSmX7sY9lLCKY6WV+IHDMwRC4+JN5e2Vowr2Bwhdtl5Ug
	CYK45HyErjUdeMr/etlxBeKHY+f0OiY6PIos3edX+eDIhlVYnJzG
X-Google-Smtp-Source: AGHT+IEBFelGWCw7aog8FPm7T1HRJY0aXE1oegdawsGdecU5Q641ClOjJUeKQMkifehe3v4qqcM9HA==
X-Received: by 2002:a05:6402:40c8:b0:5c2:6311:8445 with SMTP id 4fb4d7f45d1cf-5c413e0887bmr2821108a12.2.1726159950466;
        Thu, 12 Sep 2024 09:52:30 -0700 (PDT)
Received: from debian ([2a00:79c0:61c:8b00:224:9bff:fe22:6dd6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424e5sm6632468a12.10.2024.09.12.09.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 09:52:30 -0700 (PDT)
Date: Thu, 12 Sep 2024 18:52:27 +0200
From: Dimitri Fedrau <dima.fedrau@gmail.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 2/3] net: phy: marvell-88q2xxx: Make register writer
 function generic
Message-ID: <20240912165227.GB176933@debian>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906133951.3433788-3-niklas.soderlund+renesas@ragnatech.se>

Am Fri, Sep 06, 2024 at 03:39:50PM +0200 schrieb Niklas Söderlund:
> In preparation to adding auto negotiation support to mv88q2110 move and
> rename the helper function used to write an array of register values to
> the PHY.
> 
> Just as for mv88q2220 devices this helper will be needed to for the
> initial configuration of the mv88q2110 to support auto negotiation.
> 
> The function is moved verbatim, there is no change in behavior.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/net/phy/marvell-88q2xxx.c | 40 +++++++++++++++----------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
> index 850beb4b1722..31f8c976e387 100644
> --- a/drivers/net/phy/marvell-88q2xxx.c
> +++ b/drivers/net/phy/marvell-88q2xxx.c
> @@ -174,6 +174,21 @@ static const struct mmd_val mv88q222x_revb1_revb2_init_seq1[] = {
>  	{ MDIO_MMD_PCS, 0xfe11, 0x1105 },
>  };
>  
> +static int mv88q2xxx_write_mmd_vals(struct phy_device *phydev,
> +				    const struct mmd_val *vals, size_t len)
> +{
> +	int ret;
> +
> +	for (; len; vals++, len--) {
> +		ret = phy_write_mmd(phydev, vals->devad, vals->regnum,
> +				    vals->val);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int mv88q2xxx_soft_reset(struct phy_device *phydev)
>  {
>  	int ret;
> @@ -724,33 +739,18 @@ static int mv88q2xxx_probe(struct phy_device *phydev)
>  	return mv88q2xxx_hwmon_probe(phydev);
>  }
>  
> -static int mv88q222x_write_mmd_vals(struct phy_device *phydev,
> -				    const struct mmd_val *vals, size_t len)
> -{
> -	int ret;
> -
> -	for (; len; vals++, len--) {
> -		ret = phy_write_mmd(phydev, vals->devad, vals->regnum,
> -				    vals->val);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static int mv88q222x_revb0_config_init(struct phy_device *phydev)
>  {
>  	int ret;
>  
> -	ret = mv88q222x_write_mmd_vals(phydev, mv88q222x_revb0_init_seq0,
> +	ret = mv88q2xxx_write_mmd_vals(phydev, mv88q222x_revb0_init_seq0,
>  				       ARRAY_SIZE(mv88q222x_revb0_init_seq0));
>  	if (ret < 0)
>  		return ret;
>  
>  	usleep_range(5000, 10000);
>  
> -	ret = mv88q222x_write_mmd_vals(phydev, mv88q222x_revb0_init_seq1,
> +	ret = mv88q2xxx_write_mmd_vals(phydev, mv88q222x_revb0_init_seq1,
>  				       ARRAY_SIZE(mv88q222x_revb0_init_seq1));
>  	if (ret < 0)
>  		return ret;
> @@ -764,17 +764,17 @@ static int mv88q222x_revb1_revb2_config_init(struct phy_device *phydev)
>  	int ret;
>  
>  	if (is_rev_b1)
> -		ret = mv88q222x_write_mmd_vals(phydev, mv88q222x_revb1_init_seq0,
> +		ret = mv88q2xxx_write_mmd_vals(phydev, mv88q222x_revb1_init_seq0,
>  					       ARRAY_SIZE(mv88q222x_revb1_init_seq0));
>  	else
> -		ret = mv88q222x_write_mmd_vals(phydev, mv88q222x_revb2_init_seq0,
> +		ret = mv88q2xxx_write_mmd_vals(phydev, mv88q222x_revb2_init_seq0,
>  					       ARRAY_SIZE(mv88q222x_revb2_init_seq0));
>  	if (ret < 0)
>  		return ret;
>  
>  	usleep_range(3000, 5000);
>  
> -	ret = mv88q222x_write_mmd_vals(phydev, mv88q222x_revb1_revb2_init_seq1,
> +	ret = mv88q2xxx_write_mmd_vals(phydev, mv88q222x_revb1_revb2_init_seq1,
>  				       ARRAY_SIZE(mv88q222x_revb1_revb2_init_seq1));
>  	if (ret < 0)
>  		return ret;
> -- 
> 2.46.0
>

Hi Niklas,

tested with a mv88q2220 device, worked as expected.

Tested-by: Dimitri Fedrau <dima.fedrau@gmail.com>

Best regards,
Dimitri Fedrau

