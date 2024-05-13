Return-Path: <linux-renesas-soc+bounces-5342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE02A8C3FAA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 13:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85B83282277
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 11:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D6514D71C;
	Mon, 13 May 2024 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2tYAXgm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EA914C5A4;
	Mon, 13 May 2024 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715599142; cv=none; b=FUjqKnybumhNZcpS0dm43I5O8wFZX0ltZ7DPoLvPRsACIHQXrkF3mJkiLEiWGFG0IoOAZv1/2WlFVkuSRMwf33Ke8ucTtQib8hrt5nJdiRQodrfnb9fgl/2qRQbZjCIgeoiHH8vsGifTFTrF2DDhtn1pRAHKyy8rbSfYbbmbHu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715599142; c=relaxed/simple;
	bh=NGE9U+lZkSsKQWIHFKH4S/NkWnAW8B/GpLNo/S1ABdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WycD0VIFBMe5pgDNaVif6YaQsx0/dsf4ZE+XsnbVROD1ka3s8bYEGrAdkbH9sW3ILYZgYWndcauqtvbz5udTVSpR2RUNkfMmcbDlLBI8hWu3quCk5LpGpx2UKiRCVlWuuz0/RRlT4Wxu35dFqyvoJ2wcyv7Yij//uA+ULlt+GWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2tYAXgm; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51fcb7dc722so4004264e87.1;
        Mon, 13 May 2024 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715599139; x=1716203939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TxoxTRlBMgAdpdtYLCnyvuBYOSb/qoUiI56aw8Gi2oQ=;
        b=d2tYAXgmg3LK2DF6XSTl9tGSLRnxe7qDU/mtiRj8GToj4RC/QnP6DxMP3bK4IHbtXM
         hFq/1URRJLul8MTlii76thRYDC7y8tpw2rGwhPV/MqIxscpmFhj4Lh+BP089LZzQsCdl
         VsqNvFl6D/h7oMTZp42Du1DmsQsKFsz1rJ2ybqsuXyJKKtg7HPy6XvM0kReieZZCKors
         aC99a5NH7/ZXcNocdupF48it7rzaSEb3mYjny+JBGqECqIV+fOqoFg+jv4839rUGNHn9
         aq8HdHTwCT/eMS5tsQ+BR9/pBa4QWsSjRkxawCrvtnVQ97VvZP2FBwyJfgzXrMLzAKaj
         lbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715599139; x=1716203939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxoxTRlBMgAdpdtYLCnyvuBYOSb/qoUiI56aw8Gi2oQ=;
        b=Y0V1z6Nd1rsSljbRWggM46jIa56+hBVDqLTXCmaew/nF+UHz5xlvUkynbe3BhlU7AS
         7p2lCvzpwds9kbn257E7tVDSVVUDj4OkZce9NabeYghvNWS+5vg5kzIP8TFhgG4Kq2bm
         XUA/AtpLyPLuaSz3KrfqYa4M1kR+Z4IJ3zdQNhXwwl1U4juouzyPRxS4opqz998wq+77
         xFvoDzj8uBF4fWmAsRtr5OoG9FSN3DIN2nvbALDj3/Mya+Yr03rfI3xtSzsQDiCSkViH
         G+QSphnpuhIdSPpP+EWu/4RCMoHhbBQ/mxApF9RDnqEFQzDTPT2/9hgBgp80nUfLo3qB
         YILA==
X-Forwarded-Encrypted: i=1; AJvYcCUX/9ygLVjegT1fg1IG7i20NLsNOhw0jW/qsWdTSh07lePaK6mfWnmw4yTDe7w7UIiEottKgTmF4IGinq07cgpLC+ysTVFw+V5FobyMOxetzgrU9Tc1DRw0iNWty6DjtZpf5BvQfjchMS9I/vdlFWGWNFMdn3hBxpnQKNCutT93d+8o0D+m4SrFKtnht7sQuLw09PLRS9s/X0VelAIrrWbAGxcc
X-Gm-Message-State: AOJu0Yzv0Mqi8gInQDpbPZMUqMAowYrk3yXAk4Wyd+eWlaQgq92ncHRZ
	NiN1lNmHVjP0m61d2ujK2rzwLGtZk6S487xR7PJdYIfbeG1Tf9mI
X-Google-Smtp-Source: AGHT+IHPjMFLv26BZRQFG2peE5v3S3oL/BYNqJ5p/9Me4eMLyyk+yjGM0lndBIQJAKOzP171zHN64A==
X-Received: by 2002:ac2:5d46:0:b0:51e:f830:2dec with SMTP id 2adb3069b0e04-5220e477249mr2524557e87.17.1715599138745;
        Mon, 13 May 2024 04:18:58 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad6f9sm1737071e87.48.2024.05.13.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 04:18:58 -0700 (PDT)
Date: Mon, 13 May 2024 14:18:55 +0300
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
Subject: Re: [PATCH net-next v7 3/7] net: stmmac: Make stmmac_xpcs_setup()
 generic to all PCS devices
Message-ID: <mqjrk24l7bxeox4tpkz5yyfboq5siapj34k2c4ftub6ywp6txx@2webb4wu6hbe>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-3-6acf58b5440d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513-rzn1-gmac1-v7-3-6acf58b5440d@bootlin.com>

On Mon, May 13, 2024 at 09:25:14AM +0200, Romain Gantois wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> A pcs_init() callback will be introduced to stmmac in a future patch. This
> new function will be called during the hardware initialization phase.
> Instead of separately initializing XPCS and PCS components, let's group all
> PCS-related hardware initialization logic in the current
> stmmac_xpcs_setup() function.
> 
> Rename stmmac_xpcs_setup() to stmmac_pcs_setup() and move the conditional
> call to stmmac_xpcs_setup() inside the function itself.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Looking good. Thanks.

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++-----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 30 ++++++++++++++---------
>  3 files changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index badfe686a5702..ed38099ca7406 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -360,7 +360,7 @@ enum stmmac_state {
>  int stmmac_mdio_unregister(struct net_device *ndev);
>  int stmmac_mdio_register(struct net_device *ndev);
>  int stmmac_mdio_reset(struct mii_bus *mii);
> -int stmmac_xpcs_setup(struct mii_bus *mii);
> +int stmmac_pcs_setup(struct net_device *ndev);
>  void stmmac_pcs_clean(struct net_device *ndev);
>  void stmmac_set_ethtool_ops(struct net_device *netdev);
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 0ac99c132733d..ef285b3c56ab9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7754,11 +7754,9 @@ int stmmac_dvr_probe(struct device *device,
>  	if (priv->plat->speed_mode_2500)
>  		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
>  
> -	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
> -		ret = stmmac_xpcs_setup(priv->mii);
> -		if (ret)
> -			goto error_xpcs_setup;
> -	}
> +	ret = stmmac_pcs_setup(ndev);
> +	if (ret)
> +		goto error_pcs_setup;
>  
>  	ret = stmmac_phy_setup(priv);
>  	if (ret) {
> @@ -7791,7 +7789,7 @@ int stmmac_dvr_probe(struct device *device,
>  	phylink_destroy(priv->phylink);
>  error_phy_setup:
>  	stmmac_pcs_clean(ndev);
> -error_xpcs_setup:
> +error_pcs_setup:
>  	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 73ba9901a4439..54708440e27b8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -495,31 +495,37 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  	return 0;
>  }
>  
> -int stmmac_xpcs_setup(struct mii_bus *bus)
> +int stmmac_pcs_setup(struct net_device *ndev)
>  {
> -	struct net_device *ndev = bus->priv;
> +	struct dw_xpcs *xpcs = NULL;
>  	struct stmmac_priv *priv;
> -	struct dw_xpcs *xpcs;
> +	int ret = -ENODEV;
>  	int mode, addr;
>  
>  	priv = netdev_priv(ndev);
>  	mode = priv->plat->phy_interface;
>  
> -	/* Try to probe the XPCS by scanning all addresses. */
> -	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
> -		xpcs = xpcs_create_mdiodev(bus, addr, mode);
> -		if (IS_ERR(xpcs))
> -			continue;
> +	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
> +		/* Try to probe the XPCS by scanning all addresses */
> +		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
> +			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
> +			if (IS_ERR(xpcs))
> +				continue;
>  
> -		priv->hw->xpcs = xpcs;
> -		break;
> +			ret = 0;
> +			break;
> +		}
> +	} else {
> +		return 0;
>  	}
>  
> -	if (!priv->hw->xpcs) {
> +	if (ret) {
>  		dev_warn(priv->device, "No xPCS found\n");
> -		return -ENODEV;
> +		return ret;
>  	}
>  
> +	priv->hw->xpcs = xpcs;
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.44.0
> 

