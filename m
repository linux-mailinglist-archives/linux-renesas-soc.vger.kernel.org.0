Return-Path: <linux-renesas-soc+bounces-8474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC04963CA6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 09:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D8A91C2210B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 07:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52E216C86D;
	Thu, 29 Aug 2024 07:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYQx9Orx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B70210EE;
	Thu, 29 Aug 2024 07:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916141; cv=none; b=Wq+k6XLCPN916tX9lLBZMysWXOdNmNvO0rsftBlGSxkzgr1YCufGiwBK0x4Qoe+mSYR6f0rsBySnOX2KbGxn6m2AIrBEE7mtE+RKhl6WkHPnSZM7w5w7ATocKsK4uzW7nIwavqL3eI+TyFPxB66O+nw2BJvOTXHKJq5pOX7xbq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916141; c=relaxed/simple;
	bh=ezf0O4oGSZB0/JaXfGseHDaWwPjNbJvjgldvazXv0xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIxUsclVqT/leutWRDskagmaquuRv4X7WlD02hNhRp/diaeXWzzluajSPAyrrOW8sxZwxmuaymOS39pRY6E5B8kgd2y2/ShRaWCGt1rlhpSHgNi+aNT/KqxSbZa8GxOn4zK7yEd4o055OybPJmgrzTGebdLOJ56NHFWsyx8JGpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYQx9Orx; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-534366c1aa2so345299e87.1;
        Thu, 29 Aug 2024 00:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724916138; x=1725520938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KtjwnfDZc+MeLAmGkbfb0sfheHV4T3Fk2/Eu23YsZfw=;
        b=gYQx9OrxNh2V12WnhSppc+IRSm5mNqT6Im2uz+aKFrS7CS0baKiDxqCKT6wsDRtfeu
         OiFSNN8lDt7vS0Cs5367eYmehppXrfofZdRRAP+C5XMimVHTWNcCet8koepTvPYWV0/9
         28uCZzvjvrW9z08tw7GgCdyBf+oz+qVzfgic2IQB36bXZ9ci27r+Y+o2mk7QCB2a3Sya
         iMAzdFGztDmisEWlGnCDe/ipM/5cFT3Yn+v39QIDYHydMz13cbXw1MWNrHjxhFOEyYUT
         YQW9THUYHpydkyggS0rvawQnwAgC+QijVqegcLzmqfMpR9lHyO3Nbg5n5bwrk0iJkmBa
         Z3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724916138; x=1725520938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtjwnfDZc+MeLAmGkbfb0sfheHV4T3Fk2/Eu23YsZfw=;
        b=O4kHSbMHYG0lWkM5IOSgtO2dxtekQK/ET29sUoG1uy409Ifrp85J/n6Nft7OKjdqHG
         cN/wkYDu4wvJUX5K2HzuNJTd4NTLBAfxUU00oA0xmMbfiUz+aNGUFrzjRvjL3RCv2mgK
         lbI99nZtx0dtNe0iJVoLjKLWzGZ8nUzJ5BwRURvSVfHgUj9ry/q4Z4mJkFLHZoYeWjSJ
         szHByRVo/B2KFbT20IrSfy+W6gUtrDG2WaM55JRWJ0TOfeSHBEfvlI1uPhZi4/NqICkY
         c07zLfYHMQAAT0YXKu9/19r/sZzFdbPmX8ZjCC0grMGzsqCid8Ta9/tnWTIOoUNAbV1X
         /7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFTPZx6M0g8NuL3iOdua6tfwPgSnarXr/9mdvQovGUcAyIr4daEkLSp8CIBsTJAJpVVJaB7uZ8@vger.kernel.org, AJvYcCV08LGRnflSFjlq/vUuPb6E40imnNFQG/gA2LsIvcwGVXljY8p3f+UdM1F5rTAKJsk6betxkjuhGJLFFCM1zpbf77g=@vger.kernel.org, AJvYcCVVbYty6WRDFJWd9cKBOcW4AHwkXg44avdOceqLDVKFky1KWzsl9SC/OC1TNT+qHDaOpB8o3ugCwlra7FQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfUHR5IRBTUlOu+CKyL6GzgG4d855apWvaFcZGj/xwm3F9Jmv7
	2zU4qBi83hM17j+RtkIBDJYBWsfEdob6XhHckr6dsbQ6mDEKwQV8
X-Google-Smtp-Source: AGHT+IF5XaWAGl6H1gA8mxIJyEN74t75E/cL+sTGh9Pt6w5uw2tVVCzJ/HEvohvo/Yit39SyPitG7A==
X-Received: by 2002:a05:6512:6cf:b0:52e:f4b4:6ec1 with SMTP id 2adb3069b0e04-5353e5b11aamr1133883e87.46.1724916137061;
        Thu, 29 Aug 2024 00:22:17 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827a76sm77446e87.134.2024.08.29.00.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:22:16 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:22:13 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, ulli.kroll@googlemail.com, linus.walleij@linaro.org, 
	marcin.s.wojtas@gmail.com, linux@armlinux.org.uk, alexandre.torgue@foss.st.com, 
	joabreu@synopsys.com, mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, 
	u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com, justinstitt@google.com, 
	sd@queasysnail.net, horms@kernel.org, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [net-next v3 2/9] net: stmmac: platform: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Message-ID: <ohd2gt3hsy3toxz26jy3fmymjb6ph2cdsisb4lpobz74hr3lzl@vmd2gg6barmp>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-3-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827095712.2672820-3-frank.li@vivo.com>

On Tue, Aug 27, 2024 at 03:57:05AM -0600, Yangtao Li wrote:
> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Suggested-by: Serge Semin <fancer.lancer@gmail.com>

Can't remember that I suggested the entire change, but merely the
ERR_CAST() macro utilization. Anyway the patch now looks good:

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks.
-Serge(y)

> ---
> v2:
> -remove unused 'ret'
> -fix incompatible-pointer-types
> 
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 35 +++++--------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index ad868e8d195d..4365afabf3c4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -415,8 +415,6 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
>  static void stmmac_remove_config_dt(struct platform_device *pdev,
>  				    struct plat_stmmacenet_data *plat)
>  {
> -	clk_disable_unprepare(plat->stmmac_clk);
> -	clk_disable_unprepare(plat->pclk);
>  	of_node_put(plat->phy_node);
>  	of_node_put(plat->mdio_node);
>  }
> @@ -436,7 +434,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  	struct plat_stmmacenet_data *plat;
>  	struct stmmac_dma_cfg *dma_cfg;
>  	int phy_mode;
> -	void *ret;
>  	int rc;
>  
>  	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
> @@ -615,21 +612,16 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  
>  	/* clock setup */
>  	if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
> -		plat->stmmac_clk = devm_clk_get(&pdev->dev,
> -						STMMAC_RESOURCE_NAME);
> +		plat->stmmac_clk = devm_clk_get_enabled(&pdev->dev, STMMAC_RESOURCE_NAME);
>  		if (IS_ERR(plat->stmmac_clk)) {
>  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
>  			plat->stmmac_clk = NULL;
>  		}
> -		clk_prepare_enable(plat->stmmac_clk);
>  	}
>  
> -	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> -	if (IS_ERR(plat->pclk)) {
> -		ret = plat->pclk;
> -		goto error_pclk_get;
> -	}
> -	clk_prepare_enable(plat->pclk);
> +	plat->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> +	if (IS_ERR(plat->pclk))
> +		return ERR_CAST(plat->pclk);
>  
>  	/* Fall-back to main clock in case of no PTP ref is passed */
>  	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
> @@ -644,26 +636,15 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  
>  	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
>  							   STMMAC_RESOURCE_NAME);
> -	if (IS_ERR(plat->stmmac_rst)) {
> -		ret = plat->stmmac_rst;
> -		goto error_hw_init;
> -	}
> +	if (IS_ERR(plat->stmmac_rst))
> +		return ERR_CAST(plat->stmmac_rst);
>  
>  	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
>  							&pdev->dev, "ahb");
> -	if (IS_ERR(plat->stmmac_ahb_rst)) {
> -		ret = plat->stmmac_ahb_rst;
> -		goto error_hw_init;
> -	}
> +	if (IS_ERR(plat->stmmac_ahb_rst))
> +		return ERR_CAST(plat->stmmac_ahb_rst);
>  
>  	return plat;
> -
> -error_hw_init:
> -	clk_disable_unprepare(plat->pclk);
> -error_pclk_get:
> -	clk_disable_unprepare(plat->stmmac_clk);
> -
> -	return ret;
>  }
>  
>  static void devm_stmmac_remove_config_dt(void *data)
> -- 
> 2.39.0
> 

