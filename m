Return-Path: <linux-renesas-soc+bounces-8123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A57895C8E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 11:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E16C41F21D47
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E925C149DF8;
	Fri, 23 Aug 2024 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxsjPsrT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E5D143C41;
	Fri, 23 Aug 2024 09:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404290; cv=none; b=oCIcRAr9oo/u1KCb6470RDfxcssEIvI1tI2L8Lvr9Fan9F0DnKEWBh2PUA3ElmYcFBf9RjJvze8hQ1r5W+xk6I8BrG5EOhy5RKhl29+cZyOz/ToDmKhg190Zt1hrFbCAVwfXZnL16f6ZhFK0ZmMDbNb6R7r9KdduWyovR1frXdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404290; c=relaxed/simple;
	bh=sM627AfEsfkKAMQwbbFpudxSd7uw0zlJsdlc7vRxhrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJtPt91ptTQZ6bgau983RT9Af9cMm7IYmo0x5nFHKArvbe119jYVCtNDg2xWy3b4ywH0Gm0xCQ1MjEX0UpefVuA3YlBcVdpBz/O6bJkH9PDEbFdjuzkWD+BZ47ppGvFnygaqc1MhP9zpYNg49cr40vGcdEk6dQx2vD4LIaZG7n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxsjPsrT; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3f07ac2dcso18987261fa.2;
        Fri, 23 Aug 2024 02:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724404287; x=1725009087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4PO5E+Yc2jdmqT5l2dYdMtbWuQDD2570ef53Pzw7Dho=;
        b=LxsjPsrTCz1+H1B1jwzXI057MfNTfGmgW20Q0WsQ6IjNczWfwRk92nSu5V9U0t9dS/
         WViQMPgoScAYmSSvNbAmdYeWg0o+EM0difTIMbK7FwYAI2NJ+SjFIPlFqo0yi98F9GC1
         iuP+LjM5pZ7dh05r+XnnDyAGE/o0qhsWOSv8Juurb+5YEwLTffY5Kn9Uz/TJnf+XOUtT
         rT+Pb44lAReQJVNCgWibIBckaR03qneV73vtysO0PuSo87HdaDLtJlae5xduWhfMJEbA
         GNsyCFvacMWq3Q5E3mpd5y78xee718IrYXmT+3oLwGmWPpbg6ddCZ/j1eb+ZQEZtEAoH
         AT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724404287; x=1725009087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PO5E+Yc2jdmqT5l2dYdMtbWuQDD2570ef53Pzw7Dho=;
        b=ebNxqZHRjmn+6YYyq0JEOhYF2t1c73VkW1H0KAMHAS7KGB2cYUGnbdSH2erOY0rA2B
         5/7B1+ZySUKov1dpPZLxQIacV1BDZeiHNauK+J+Id+/J8YFgceMXAlG22YfDOsjfYZPC
         kaFXV5IvcVvEcWJc/pd7pEvFaSSaEXVGxIcH2oLwYB+2Mri6rh/G5ExuTotswFaRAsxm
         5CM8gcuV7nsOkByybJ8RNV8D6GIoHsqUNwQzBiTigEX0cJ3Jtk7o3bN9lR22zJqSKAkh
         LSE9gjAllx8BsJ765h/zbsTGFcgKtVeTbB09mfcldVBy063NGXC15oOTlLBvUiRCeNWw
         cOxA==
X-Forwarded-Encrypted: i=1; AJvYcCUxLaScO6ifqifkAjUn1SfwTtzYJAG+d34fC9jgTDyJrBX941DqlQwidc4/bWe2XGQmNYBwDGAWjWsgb3w=@vger.kernel.org, AJvYcCWB08sF8q2OrR90obKubQWLskQjbLY5d6rAGSUT0GF/CoE0cXDQg0Fdl9L5y8uQJfyoCx2/dC7U2+Cw50F/6b8xF5o=@vger.kernel.org, AJvYcCWp8TcMFj5/SzIlh1HDoNhy41ytFRmBuv6RuoTtwjZFTcqyZoYAwcYE02l28j6mLEhenxLGqJF4@vger.kernel.org
X-Gm-Message-State: AOJu0YyfsDPPeuzZudemzrLfDWLX6H/nP4isUEEhMPT/3TBlvCrAAafz
	0C1jlu3Fl4Q/CB9ZtkbiwjTPfvvVfqsll6kMBYvi4xJxd6zOVxC/9Eu/Cjx7
X-Google-Smtp-Source: AGHT+IG7i0v4Oxi1zDQ7x12f7nNWK8FCGltyKq7l0VpZBxkWpTbouDOSj6EcsEmrspHXN3Tlr5uzsg==
X-Received: by 2002:a2e:b8c3:0:b0:2f3:f5aa:b3d0 with SMTP id 38308e7fff4ca-2f4f57978bamr7783171fa.35.1724404286482;
        Fri, 23 Aug 2024 02:11:26 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f40487f797sm4324791fa.119.2024.08.23.02.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 02:11:26 -0700 (PDT)
Date: Fri, 23 Aug 2024 12:11:23 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, ulli.kroll@googlemail.com, linus.walleij@linaro.org, 
	marcin.s.wojtas@gmail.com, linux@armlinux.org.uk, alexandre.torgue@foss.st.com, 
	joabreu@synopsys.com, mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, kees@kernel.org, 
	justinstitt@google.com, u.kleine-koenig@pengutronix.de, horms@kernel.org, 
	sd@queasysnail.net, linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [net-next v2 2/9] net: stmmac: platform: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Message-ID: <qx4k2xehasda7zj6vt3bygdh3scehiiwniqvljj4b4rjde25a5@ys4oqsithhwi>
References: <20240823072122.2053401-1-frank.li@vivo.com>
 <20240823072122.2053401-3-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823072122.2053401-3-frank.li@vivo.com>

Hi Yangtao

On Fri, Aug 23, 2024 at 01:21:14AM -0600, Yangtao Li wrote:
> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> v2:
> -remove unused 'ret'
> -fix incompatible-pointer-types
> 
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 35 +++++--------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index ad868e8d195d..1a66baaa4081 100644
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

> +		return (void *)plat->pclk;

Use the ERR_CAST() macro instead of the open coded void type cast.

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

> +		return (void *)plat->stmmac_rst;

ditto

>  
>  	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
>  							&pdev->dev, "ahb");
> -	if (IS_ERR(plat->stmmac_ahb_rst)) {
> -		ret = plat->stmmac_ahb_rst;
> -		goto error_hw_init;
> -	}
> +	if (IS_ERR(plat->stmmac_ahb_rst))

> +		return (void *)plat->stmmac_ahb_rst;

ditto

-Serge(y)

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
> 

