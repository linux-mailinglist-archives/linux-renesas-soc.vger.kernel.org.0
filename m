Return-Path: <linux-renesas-soc+bounces-9043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B31B98611E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 16:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A6D4B2DD68
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 14:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7CC18A6AE;
	Wed, 25 Sep 2024 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO04Dqs2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCDA13DBBC;
	Wed, 25 Sep 2024 12:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727266933; cv=none; b=mvfqK87FUNdm7PqT99zGDFfTOrtulsDO3nEgzY7ObP/YdjIID32QV5jd8kPKldNh+j5Vt8oxRGVP37sMkFrV53RS1/eHlqpg7Kt7xPRzTpauBvJ9AuFkho7LhDvP3QXqNacOpR8fk6pjW92hldQwW5aur8eQTbjbR7YOgWe+Q7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727266933; c=relaxed/simple;
	bh=LnARrVw/EGuT63dRuUd2+p9AGVtwJ050IiXwhLPYtYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8lXG5qV347Ii3cNtGXRzGITCYCpz+j//RFNGnTHC5TjxmBZWWfLewoseF5zxd4peoHKNJmSAkCtZOGOjlnf768NdRtRSXBDdGzOrpMQEy0Ur5KID6Ffl28kYXbvn9ovj4KClmZ5bEoqSzbSs8b+1O6BRptDSlzQs4WE9oVBRpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO04Dqs2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37ccc600466so156863f8f.1;
        Wed, 25 Sep 2024 05:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727266930; x=1727871730; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nM+2dugn8FIhazEemY5GoXD4bzVew2/Vai3hHLMPPZ8=;
        b=VO04Dqs2a/9P8scnQC5Y5foE0CBBxhnDWXKRpEeb8RbERpDjcgo8xXGQq3ytMKZZJx
         llUNxXHkxMk1YK8pmCMf/TQqNxmP20tgt0RTSfjp4KEpFg4zQVjEwFS4fFL6z0U4yNbd
         cFjXhAZMEgjMm4gx9U89+TYW/oEHsUzsvxIozK6Eenv12kuLGWgKWh8r1MKTynjpTBg9
         U9toWSHcEPIjCFiiCQSs5fwkV3AIxECN0+tFVHcnq+r3+2ftOs7+wwk8o79Y6uUNJknO
         8ytE2Ybgxyelvo4e85ooTeU7ScKvEVjgfFKHvOoqnLZuKMdPJQ35lNpIRMgEPK4CB54O
         iX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727266930; x=1727871730;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nM+2dugn8FIhazEemY5GoXD4bzVew2/Vai3hHLMPPZ8=;
        b=Svjpt9jl8LV6hbaFH+5Q/CCxNifNpiLhb4wOnfnepA0Hd3+K+kh+MPjvegc3CHnlz5
         C4IHIVBECjwkz7C67sQjJ2NkUu8WgY9b402UpBYuSm/mh2ZfEGZg6IaDrNlsulCVm/Kl
         0F9WoBOuWR22cJoee5aMpZL+fKh1YzhHT1ZvbsKfw6bm0z5A6VL8iXn2sztWF/sadCfL
         YLlJzwTKPs7/gMfZhoZoYHgbwqFBAz33G78dzbW/oLYPlGoKj7gngcVoT0NjZ6C4pNcQ
         3H8lmygz83iCEFBFW09E1+Vf31Hnm8RUYvmVpokyQ8VjIRFHOXNQDNYQ9TUQ4xj+RTEA
         FddQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7VOfnDEqxohpJPi8Ew/DYkR//HRCtpj3rGF5nWPNc9xF6yexesqmHxSkywonEUF+9mlpEa5+FwA33jc3vSc3YQQ==@vger.kernel.org, AJvYcCUWYhESNzJ+wG2Zq4DZwtoreyU7aqje7sGPLrf8pBjwaQXzv7bYrJ9mKuYoNQTL97SCYnm7Pldx@vger.kernel.org
X-Gm-Message-State: AOJu0YyOym6RBIFbDvCvwD/LkuBlpHU40lTYWjmuUez17YqrJ/CqFrRs
	bBqeGnUNOguJtUd2Bf4fx6sTwbj7rBpn/baMa6HLAZ+OJU40Tqpj
X-Google-Smtp-Source: AGHT+IHGkCeTFX5g1vomvtydHF1X8saGWjN3S3tcLEHpJ6vExGsLY1En0VkiMlXyKzOQjwd/jU07UQ==
X-Received: by 2002:adf:f28e:0:b0:374:bb25:658a with SMTP id ffacd0b85a97d-37cc248c15amr1683719f8f.30.1727266930088;
        Wed, 25 Sep 2024 05:22:10 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:bfae:1f4d:37af:7b02])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2cec21sm3818539f8f.52.2024.09.25.05.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 05:22:09 -0700 (PDT)
Date: Wed, 25 Sep 2024 14:22:07 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 1/3] net: phy: marvell-88q2xxx: Align soft reset for
 mv88q2110 and mv88q2220
Message-ID: <ZvQAb1sPRo44YmU1@eichest-laptop>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906133951.3433788-2-niklas.soderlund+renesas@ragnatech.se>

On Fri, Sep 06, 2024 at 03:39:49PM +0200, Niklas Söderlund wrote:
> The soft reset implementations for mv88q2110 and mv88q2220 differ as the
> later need to consider that auto negation is supported on mv88q2220
> devices. In preparation of enabling auto negotiation on mv88q2110 merge
> the two rest functions into a device generic one.
> 
> The mv88q2220 behavior is kept as is but extended to wait for the reset
> bit to be clears before continuing, as was done previously on mv88q2220.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/net/phy/marvell-88q2xxx.c | 60 ++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
> index c812f16eaa3a..850beb4b1722 100644
> --- a/drivers/net/phy/marvell-88q2xxx.c
> +++ b/drivers/net/phy/marvell-88q2xxx.c
> @@ -179,15 +179,34 @@ static int mv88q2xxx_soft_reset(struct phy_device *phydev)
>  	int ret;
>  	int val;
>  
> -	ret = phy_write_mmd(phydev, MDIO_MMD_PCS,
> -			    MDIO_PCS_1000BT1_CTRL, MDIO_PCS_1000BT1_CTRL_RESET);
> +	/* Enable RESET of DCL */
> +	if (phydev->autoneg == AUTONEG_ENABLE || phydev->speed == SPEED_1000) {
> +		ret = phy_write_mmd(phydev, MDIO_MMD_PCS, 0xfe1b, 0x48);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = phy_write_mmd(phydev, MDIO_MMD_PCS, MDIO_PCS_1000BT1_CTRL,
> +			    MDIO_PCS_1000BT1_CTRL_RESET);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = phy_read_mmd_poll_timeout(phydev, MDIO_MMD_PCS,
> +					MDIO_PCS_1000BT1_CTRL, val,
> +					!(val & MDIO_PCS_1000BT1_CTRL_RESET),
> +					50000, 600000, true);
>  	if (ret < 0)
>  		return ret;
>  
> -	return phy_read_mmd_poll_timeout(phydev, MDIO_MMD_PCS,
> -					 MDIO_PCS_1000BT1_CTRL, val,
> -					 !(val & MDIO_PCS_1000BT1_CTRL_RESET),
> -					 50000, 600000, true);
> +	ret = phy_write_mmd(phydev, MDIO_MMD_PCS, 0xffe4, 0xc);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Disable RESET of DCL */
> +	if (phydev->autoneg == AUTONEG_ENABLE || phydev->speed == SPEED_1000)
> +		return phy_write_mmd(phydev, MDIO_MMD_PCS, 0xfe1b, 0x58);
> +
> +	return 0;
>  }
>  
>  static int mv88q2xxx_read_link_gbit(struct phy_device *phydev)
> @@ -705,33 +724,6 @@ static int mv88q2xxx_probe(struct phy_device *phydev)
>  	return mv88q2xxx_hwmon_probe(phydev);
>  }
>  
> -static int mv88q222x_soft_reset(struct phy_device *phydev)
> -{
> -	int ret;
> -
> -	/* Enable RESET of DCL */
> -	if (phydev->autoneg == AUTONEG_ENABLE || phydev->speed == SPEED_1000) {
> -		ret = phy_write_mmd(phydev, MDIO_MMD_PCS, 0xfe1b, 0x48);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
> -	ret = phy_write_mmd(phydev, MDIO_MMD_PCS, MDIO_PCS_1000BT1_CTRL,
> -			    MDIO_PCS_1000BT1_CTRL_RESET);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = phy_write_mmd(phydev, MDIO_MMD_PCS, 0xffe4, 0xc);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Disable RESET of DCL */
> -	if (phydev->autoneg == AUTONEG_ENABLE || phydev->speed == SPEED_1000)
> -		return phy_write_mmd(phydev, MDIO_MMD_PCS, 0xfe1b, 0x58);
> -
> -	return 0;
> -}
> -
>  static int mv88q222x_write_mmd_vals(struct phy_device *phydev,
>  				    const struct mmd_val *vals, size_t len)
>  {
> @@ -906,7 +898,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
>  		.aneg_done		= genphy_c45_aneg_done,
>  		.config_init		= mv88q222x_config_init,
>  		.read_status		= mv88q2xxx_read_status,
> -		.soft_reset		= mv88q222x_soft_reset,
> +		.soft_reset		= mv88q2xxx_soft_reset,
>  		.config_intr		= mv88q2xxx_config_intr,
>  		.handle_interrupt	= mv88q2xxx_handle_interrupt,
>  		.set_loopback		= genphy_c45_loopback,
> -- 
> 2.46.0
> 

Tested with a mv88q2110 device.

Tested-by: Stefan Eichenberger <eichest@gmail.com>

Regards,
Stefan

