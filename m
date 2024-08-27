Return-Path: <linux-renesas-soc+bounces-8383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E82960E6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 16:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0D251F248A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 14:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CB11C4EE6;
	Tue, 27 Aug 2024 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8UGOyDo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4FDDDC1;
	Tue, 27 Aug 2024 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724770108; cv=none; b=dnEPYxiH9qSQ0KPvUu4wDTs19K9DoAXB2PtrC8FkBphpomIoSbAm7SH/+Sl2hBtSo1Gm6xDxM9C8kECs3LBZjb1X32V+b2rSi51ehCxk/inaaZfxO/UizriWus+unV6eN7FmAF/m2JGJQyr7rTFb0Gi2lw1YUq1FCbBy1pr9Fsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724770108; c=relaxed/simple;
	bh=xSqwNdhpJetQ1Ga5qLAHMjPCMQYO+GkW/IDB1xWE8zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeW5aeEzgfzHVjYJfsdxYDWNJWFZrLC40mBrdvdEplfU2DIVatIV6qEfJI19jQCVd9jRU4sUYUd9jJCDfTM3+4pzcJF7JigvMHq+YBjum8KUtYb8s6W4YXVrsVTn74BNr/lS/WfuscYRlmaJ5nWf/6K9/wIsIuFOGaqx8ZcHIqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o8UGOyDo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6C4C6107B;
	Tue, 27 Aug 2024 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724770108;
	bh=xSqwNdhpJetQ1Ga5qLAHMjPCMQYO+GkW/IDB1xWE8zM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8UGOyDomGVhy1QCxq1ZaKUwSAbW5YdZ7bzFjTDNtZhP+MiLXGy8H4LUCK1XIXGoG
	 HeWZEabT9DBgIhHuyGQRd8OuDHltgV29H/iEkNPnL2uEFIsLyQ5bdlLMnUycu0t6vY
	 tGghGFURbF7nKTm/brFE+lFinwKiC49lbmKC6hy/YPZVMm+AToGe9J1D4J2KfvQx50
	 qmp4sjJdVPdKfsuWqOZYcoTpZvYTJ5pt1dYutSxjniTzSYIDXZnBCu/4QtT5HvdqCm
	 NRJdBsdkBcmvav0MPsQFo3jBKhq1FGtCKvrvyp3dG8US7OSo8YZnV+gRQDqHRJLmCb
	 /8mLri0zG2TQA==
Date: Tue, 27 Aug 2024 15:48:21 +0100
From: Simon Horman <horms@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, ulli.kroll@googlemail.com,
	linus.walleij@linaro.org, marcin.s.wojtas@gmail.com,
	linux@armlinux.org.uk, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
	hkallweit1@gmail.com, kees@kernel.org, justinstitt@google.com,
	u.kleine-koenig@pengutronix.de, sd@queasysnail.net,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [net-next v2 1/9] net: stmmac: dwmac-intel-plat: Convert to
 devm_clk_get_enabled()
Message-ID: <20240827144821.GH1368797@kernel.org>
References: <20240823072122.2053401-1-frank.li@vivo.com>
 <20240823072122.2053401-2-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823072122.2053401-2-frank.li@vivo.com>

On Fri, Aug 23, 2024 at 01:21:13AM -0600, Yangtao Li wrote:
> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c    | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> index d68f0c4e7835..dcbae653ab8c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> @@ -104,12 +104,10 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  
>  		/* Enable TX clock */
>  		if (dwmac->data->tx_clk_en) {
> -			dwmac->tx_clk = devm_clk_get(&pdev->dev, "tx_clk");
> +			dwmac->tx_clk = devm_clk_get_enabled(&pdev->dev, "tx_clk");

As it looks like there will be a v3 anyway, a minor nit from my side:
IMHO, the line above could be trivially wrapped to keep it <= 80 columns wide,
which is still preferred by Networking code.

>  			if (IS_ERR(dwmac->tx_clk))
>  				return PTR_ERR(dwmac->tx_clk);
>  
> -			clk_prepare_enable(dwmac->tx_clk);
> -
>  			/* Check and configure TX clock rate */
>  			rate = clk_get_rate(dwmac->tx_clk);
>  			if (dwmac->data->tx_clk_rate &&
> @@ -149,20 +147,15 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> -	if (ret) {
> -		clk_disable_unprepare(dwmac->tx_clk);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	return 0;
>  }
>  
>  static void intel_eth_plat_remove(struct platform_device *pdev)
>  {
> -	struct intel_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
> -
>  	stmmac_pltfr_remove(pdev);
> -	clk_disable_unprepare(dwmac->tx_clk);
>  }
>  
>  static struct platform_driver intel_eth_plat_driver = {
> -- 
> 2.39.0
> 

