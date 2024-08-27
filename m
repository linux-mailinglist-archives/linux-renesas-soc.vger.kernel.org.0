Return-Path: <linux-renesas-soc+bounces-8386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2297960EFC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 16:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE6DB285DC5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 14:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22091C3F0D;
	Tue, 27 Aug 2024 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrUT5WTG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7160A1A0B13;
	Tue, 27 Aug 2024 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724770415; cv=none; b=ju26E/uua56Sn8/Y7zhff4ATdPKU5aCm7Wk2dm/avtC7IL2dUIK2xNJCBjyGMpqnBakf8vCclcvkefgu3xLd/yaj0FPTUK2vCt8Lr0I/JxUbcniWapzZUj+6BWLPKkfed3piFK6Ciw6q3sf8ywBdoHtSE7pBI/pb9Dw1pUR6SMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724770415; c=relaxed/simple;
	bh=ND1nM316SmnI2uLNfJnvcy1K3FityWNNBNH9l6o7LNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQzmbxSNv7WaieUTAUIa18IhBjZHumPfg64lEmuuqPduzWYgL4CQf3Ob668RoPm4HETfj03miKZeslH90PoOrAnbKC4E2LRxz/qL21RqV0cSBt50WYlJAAZNAjfpG37yQD5HbmHBYCtQTGRBq5gpOc1VDyM0x0eQcte3Enc43aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrUT5WTG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182FEC6106E;
	Tue, 27 Aug 2024 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724770415;
	bh=ND1nM316SmnI2uLNfJnvcy1K3FityWNNBNH9l6o7LNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrUT5WTGP2Dta6NNl3ZtipbShjUHbfPl9vEnh7+c/a0gfCvd3fDFkkwWcTD7MKw2n
	 Eet4agTZqcI35gqrKzDGaoHu7q2uJ07SqSYazenBUo1kNwM1ApiUZUt9XjG0ZOJo/u
	 X2McGktRiITcCGVp4FfRewwYdHqVo5CF2dFW7fZ/dfGcOI17Zrpch5UJsp86oDLRPC
	 FexFNLbzgbQF6vXpR5wmlcHgzEvPkdAuRbiiERo86APSBoFFlVrLOtiK71YDzGug01
	 MttaepYTrDfbTp9xphvsseJtrcuRVGD8yklUoQKFc/v5tti0bzAJOvTVYoyKJYYemO
	 LxjX2rSk1bieQ==
Date: Tue, 27 Aug 2024 15:53:28 +0100
From: Simon Horman <horms@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, ulli.kroll@googlemail.com,
	linus.walleij@linaro.org, marcin.s.wojtas@gmail.com,
	linux@armlinux.org.uk, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
	hkallweit1@gmail.com, u.kleine-koenig@pengutronix.de,
	jacob.e.keller@intel.com, justinstitt@google.com,
	sd@queasysnail.net, linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [net-next v3 2/9] net: stmmac: platform: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Message-ID: <20240827145328.GJ1368797@kernel.org>
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

As it looks like there will be a v3 anyway, a minor nit from my side:
Please preserve the line wrapping so that the lines remain <= 80 columns wide,
which is still preferred by Networking code.

		plat->stmmac_clk = devm_clk_get_enabled(&pdev->dev,
							STMMAC_RESOURCE_NAME);

>  		if (IS_ERR(plat->stmmac_clk)) {
>  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
>  			plat->stmmac_clk = NULL;
>  		}
> -		clk_prepare_enable(plat->stmmac_clk);
>  	}
>  

...

