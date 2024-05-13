Return-Path: <linux-renesas-soc+bounces-5341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E665B8C3F8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 13:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 148B91C21632
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 11:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8681014BF8D;
	Mon, 13 May 2024 11:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEyCCncm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FB81C683;
	Mon, 13 May 2024 11:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715598757; cv=none; b=Vo3HcaNoodA/aDHx30BKYlDgcw0ufUOl+o8h+etQmxhvpv43gsfynqu7/RZduY6DyPWn2swTlY6mUpjqOtcW7feb+/37Ymi9M/fePd8m++Pi0BCevZ5Ud6spePxH4kXSRsEA7z9pIq2aDgYly4G5zYszCecOz/+cfYnN55EMWrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715598757; c=relaxed/simple;
	bh=ovWECFyus9fyusYiUp7lb7F22QlyMqy46p2ZM0gDVzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAs9cs4VezWHKmachxNoLdCeMvCLUN0rOYYbvLUYoH9XfA5X6IE10fQvwr2A4un2K/QtjY57T3mMi7wK9fR423KJiP7LLewELuO/EtsD9bmDR1X4/JNWMZFpKhtxmtCtVa3VVOrrJ+iqtvCxIPX1Ez8UTvaWXefuBhwia5pX4xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEyCCncm; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e576057c2bso26691231fa.1;
        Mon, 13 May 2024 04:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715598754; x=1716203554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CsXgR3w2FhQE+aSDSS2Gv40EZ/tbmCX2jDPHP8DnHb8=;
        b=dEyCCncmOQTQZFjsEba16Wyf6ihjRTTyisSM4lDK5aSsWbvkErgZRMo3ipM5rf84td
         iDXymqAfAf0UGzWknw7mFNK394MS7b96DKKSHHIcRRhlAokEgdoy2zQKKoAYo/GEm+JD
         K7p/r/uHJr8DzzdQruse0/x1+HRPLWBY+X0gMOaSA30BXaFreh+Azq44jr2FmaPFxEDP
         rxlOP3usuY4Hqp4mf/1gmLf4qf1nnU1o2XwvqWmoXX0YQ3p0xnoa3i7CBRic1oeXzHo8
         lz66pHtf9tqHlMY8erfXkYs4wgfCx6K70rwmBqrC7hpCajt0GtPpdDGAL4kRGUyrRApZ
         LsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715598754; x=1716203554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsXgR3w2FhQE+aSDSS2Gv40EZ/tbmCX2jDPHP8DnHb8=;
        b=Ij1rNjpXW7bldXESGHzCPhcgRkTqq9cOElAJ0MwzIcf9cJURwJGg7DwinbUXP0nqKV
         N+knpakm7CJND5e85jo3i2Q6BdqnKbZJqfFNPVyCNkajtI6oVbR3rdZe8alIALeBzm0l
         B+nieDq1a9yUcRi+jFb3FxiGWHOAX9Lp5BBB3Ptaoiiqji9Zz2/Po3HOZzzzUFuVjjtF
         U+Q9Me9JeM9UhtfXAnJNjfiGW2kwAo8AeAAlWFelRP/4XDF/IqN159KAmV3KiStjidYv
         95HCCQKNgPw2SNBOfiRd8mHPLdtm1cB5Mc7wPz/LHkaqBNJLZ5i5KRd2WOCWXOpNCP4H
         WH3g==
X-Forwarded-Encrypted: i=1; AJvYcCX95XhBk7xVfJlxjqs7pNGgos/7fABRx9hG3hxWOfbEVJu8y2Vbk2Aq3AWQowmEBPeSTUiaqPXZ/PVXEl3Kh5L5isa9cTg81/GLF2HbvWU4WVonDWJNZrFS9FubNgKosD1Jl/1iGuMmAAVSfqVFvzn+KQ6oOV4GsZKODYhzPIK72o5fVD88FIEtkhxC2aAniXVMaj1MqyvNhsFZpIXRNfO4zo0s
X-Gm-Message-State: AOJu0Yxf3ZXc0R5Mphk1YF2ZWvYSEMvmIQtjTogGNj3/8anmbVyI1Rcn
	PvkJwLt9f18byrDe2P8h6Aos4MW0cuTTmSXm0bD//Jk8+pTWV5R0zjg29nn/
X-Google-Smtp-Source: AGHT+IFNrzH1ND0SZWwUAgn/8uMLO2dCcSkwSoLKZfE1t1yAXNHUDLcBvn8cGIMU+gIVm1ldgnIHuA==
X-Received: by 2002:a05:651c:b0c:b0:2dd:bc53:e80 with SMTP id 38308e7fff4ca-2e52039daccmr90950591fa.51.1715598753491;
        Mon, 13 May 2024 04:12:33 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d0bbd6a7sm14048281fa.6.2024.05.13.04.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 04:12:32 -0700 (PDT)
Date: Mon, 13 May 2024 14:12:29 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH net-next v7 2/7] net: stmmac: Add dedicated XPCS cleanup
 method
Message-ID: <u3t3zu4ihqoc44gl2mvw74seamtoas5wvxr7kqzxxhvu3enhbx@7txzs5fsse25>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-2-6acf58b5440d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513-rzn1-gmac1-v7-2-6acf58b5440d@bootlin.com>

Hi Romain

On Mon, May 13, 2024 at 09:25:13AM +0200, Romain Gantois wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> Currently the XPCS handler destruction is performed in the
> stmmac_mdio_unregister() method. It doesn't look good because the handler
> isn't originally created in the corresponding protagonist
> stmmac_mdio_unregister(), but in the stmmac_xpcs_setup() function. In
> order to have more coherent MDIO and XPCS setup/cleanup procedures,
> let's move the DW XPCS destruction to the dedicated stmmac_pcs_clean()
> method.
> 
> This method will also be used to cleanup PCS hardware using the
> pcs_exit() callback that will be introduced to stmmac in a subsequent
> patch.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Looking good. Thanks!
* Not sure whether my explicit Rb tag will be required in such the tags
disposition.)

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 14 +++++++++++---
>  3 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index dddcaa9220cc3..badfe686a5702 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -361,6 +361,7 @@ int stmmac_mdio_unregister(struct net_device *ndev);
>  int stmmac_mdio_register(struct net_device *ndev);
>  int stmmac_mdio_reset(struct mii_bus *mii);
>  int stmmac_xpcs_setup(struct mii_bus *mii);
> +void stmmac_pcs_clean(struct net_device *ndev);
>  void stmmac_set_ethtool_ops(struct net_device *netdev);
>  
>  int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3d828904db0d3..0ac99c132733d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7789,8 +7789,9 @@ int stmmac_dvr_probe(struct device *device,
>  
>  error_netdev_register:
>  	phylink_destroy(priv->phylink);
> -error_xpcs_setup:
>  error_phy_setup:
> +	stmmac_pcs_clean(ndev);
> +error_xpcs_setup:
>  	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
> @@ -7832,6 +7833,9 @@ void stmmac_dvr_remove(struct device *dev)
>  	if (priv->plat->stmmac_rst)
>  		reset_control_assert(priv->plat->stmmac_rst);
>  	reset_control_assert(priv->plat->stmmac_ahb_rst);
> +
> +	stmmac_pcs_clean(ndev);
> +
>  	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 0542cfd1817e6..73ba9901a4439 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -523,6 +523,17 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
>  	return 0;
>  }
>  
> +void stmmac_pcs_clean(struct net_device *ndev)
> +{
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +
> +	if (!priv->hw->xpcs)
> +		return;
> +
> +	xpcs_destroy(priv->hw->xpcs);
> +	priv->hw->xpcs = NULL;
> +}
> +
>  /**
>   * stmmac_mdio_register
>   * @ndev: net device structure
> @@ -679,9 +690,6 @@ int stmmac_mdio_unregister(struct net_device *ndev)
>  	if (!priv->mii)
>  		return 0;
>  
> -	if (priv->hw->xpcs)
> -		xpcs_destroy(priv->hw->xpcs);
> -
>  	mdiobus_unregister(priv->mii);
>  	priv->mii->priv = NULL;
>  	mdiobus_free(priv->mii);
> 
> -- 
> 2.44.0
> 

