Return-Path: <linux-renesas-soc+bounces-8950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB81976F22
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2024 18:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B2F91F21171
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2024 16:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04ACD1AF4D3;
	Thu, 12 Sep 2024 16:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+GUkzMM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FEA1865F7;
	Thu, 12 Sep 2024 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726159923; cv=none; b=Ur21Jr2BY1o1q+VcrFH8z9UA5cekNU7zHfv4/D52Z5hvP8YX5B0TgsS60R+SQ/YaatznFrEUcNFFN6hspCP4uG5222o5TOE5WATTILGKW2qVq7jOQO2Nop8lZHA7ppW0cfZo1wQh8SAy/J71R54v27RB4gOAtxrVRLjHwik5OGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726159923; c=relaxed/simple;
	bh=CmhuJmafPulkeMUMLaDQgSadOOCAXfGo8qyGbwcMvW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRJMRZrJ5Jzb/MPOCXH25SFxmh0aFkl7XegvKDf0GpHInoaeUE+VzqswDi2kg+mL3pSpQAQ8Odenu/zDmVwlRP6MYTRr3Oyz/daSzWUzMt0AGlLIP4VzxLTmTLjWPkdgNLzrLWTHHmu0/VTVpVFfoZHDCJGc0zUpLtuMZdFbBBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+GUkzMM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a90188ae58eso134379666b.1;
        Thu, 12 Sep 2024 09:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726159920; x=1726764720; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=El9c1hHBtJk1KwcOs+RS/kGDroFCnxhe1WGLlRa6rqc=;
        b=T+GUkzMM9XNc+BBBtDgoxU2sJbZmwlJ1rvw9c+5uX2/Ld7nMrbpFbFB3nYQOLobPl+
         iTuAJj/mTh/NPHVvEV4CqttriHox/pR2pNOqsVa7rByfc6C6MJKZDHJ9qHmiiPDLdOmg
         aaynA4yOAiF6dU4iZx1asmI9/ZWkdR4VdPZhj74KKdzDSolsITmUvtCCsrEIJDezcmtb
         59ixZvudl5hpRiG1yKdtN1wcLD2+iPOeTzjoKVD4HVfK64U5hf7ijr3apNVu3DSYns66
         GgzkHbEd9Nbai7h20DXbwWCCKnNcgCMjnNOjKCwMEQy3psVzMJK9t3fLea8n3IQ3QOSU
         ywDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726159920; x=1726764720;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=El9c1hHBtJk1KwcOs+RS/kGDroFCnxhe1WGLlRa6rqc=;
        b=TZZWHcNtnoRWt3EtuGz7LWgeD5niCWbsq2QfHbtzJb9GVE+wnRsxH7X7xE89j69qE9
         nWu2ilXq4I9i6XG993G2kYi/9kS27edylh/z+Hr4evJLfZxv8fxL0NqVNXghU9rIPEnA
         Ige+1OADMHJRpjGPdDmPSD8WJhWqlgSbW3dr9wwkhbb9iziZM+q3GAwM0VhfWPj3wnZI
         IqTm/yWIVphET3AzoDiFPQ9T1Uulen67l8FAodxbpf3VRB9dJ04Tnftz+LoBZjWjYR4E
         dpekF3ALNbNqXpFF5o+j3dx8RyuXTHimzJJ3AttuDNBJxm/ULxI2Hj5ovSmznsfVzM9O
         o83g==
X-Forwarded-Encrypted: i=1; AJvYcCViNtdLlkzTkdHqKhfjJ22PZu+tTRMhXYN1fUiFnLQtegM1zNvZKR/0zULtLw/lcRJCyZLma3Sq@vger.kernel.org, AJvYcCW7KPkrwD5WxhlD0A/Vn9lACsbthFW36UJgD/PHDHRDIZyQ70bhMIrdjBf0Mq/sSbY/wBbpAxq3KqyQx/hN+EDJIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNOlGPl8aW6iqvpZr9VuysD/Je711rvyMH4TMD6rQczbUrBIgO
	4RvYxcyGpNiyjan7SSNmhhj7GE1jLwtltPtt9d3jWhjb58xHW9xQ
X-Google-Smtp-Source: AGHT+IF98ZqnSGCWeL4ZkiOt2HX6+Z1kuS/s2NUdxOCMQSBIx6ov+pm8VMcDP6zn5puTt5RgidFf1A==
X-Received: by 2002:a17:907:60d4:b0:a8a:9054:8392 with SMTP id a640c23a62f3a-a9029115703mr332145566b.0.1726159919618;
        Thu, 12 Sep 2024 09:51:59 -0700 (PDT)
Received: from debian ([2a00:79c0:61c:8b00:224:9bff:fe22:6dd6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d259267a6sm778061266b.51.2024.09.12.09.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 09:51:58 -0700 (PDT)
Date: Thu, 12 Sep 2024 18:51:56 +0200
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
Subject: Re: [net-next 1/3] net: phy: marvell-88q2xxx: Align soft reset for
 mv88q2110 and mv88q2220
Message-ID: <20240912165156.GA176933@debian>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906133951.3433788-2-niklas.soderlund+renesas@ragnatech.se>

Am Fri, Sep 06, 2024 at 03:39:49PM +0200 schrieb Niklas Söderlund:
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

Hi Niklas,

tested with a mv88q2220 device, worked as expected.

Tested-by: Dimitri Fedrau <dima.fedrau@gmail.com>

Best regards,
Dimitri Fedrau

