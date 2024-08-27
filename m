Return-Path: <linux-renesas-soc+bounces-8384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E41960EC5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 16:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D770B22015
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 14:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A071C6F57;
	Tue, 27 Aug 2024 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p8iuOBjm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062C31C57A9;
	Tue, 27 Aug 2024 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724770310; cv=none; b=i+7eOOELGA3EiS8FRevlyG+lU9Dmm0dNYuE1Tw9WcwRgcV09iWwmqbP9Qix1kQQX/3km9G+kB26ikC7QFEjv1+y59zkh1b3+An7lmUXtXab3GC4EFam+KymvGA3qm3RkjMCswLD99WnSQ98BFZYLecPAZH5qhrw8NzmArzWZ2WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724770310; c=relaxed/simple;
	bh=NWB5s3i1kq4dW2CrUfpkajBrMSzQ94Hq46U32Q7Ft/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ6VloLOj6wUMbsSLhV9u3oKQfdbWdLspCG8co0xhDUaEzCiPCPMvEJ8gPUQpQyfOxOgiMmGQv//5fGIbWQDjDnGenMQN94u3ugE5mCQkJ/vZlH/tblCdKWNiR/gz1BJhBPsV+Q4+AxQH0/tDBj4EUO405mQqBKI9YWipXVRBQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p8iuOBjm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFF4C4DE06;
	Tue, 27 Aug 2024 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724770309;
	bh=NWB5s3i1kq4dW2CrUfpkajBrMSzQ94Hq46U32Q7Ft/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8iuOBjmg0viE6cadtY00LPh0+MNMt7PW9OUsvoUrh0nm2rdR/TUM6qaDTQjz18fg
	 Zjy9nIq8LioA2jN83GxP/BBPmGlrYrQtoIAV2Ct2gHJRC0ISJ8MESFgGxEOnPFcw1G
	 yfphDH4zRsiRR4i2BDIDga1R9Rs0rhMkQ57Sbr9jZ3Yk2CjcyWkmdQ+cYBJ5812lgy
	 EqFhhzll9QJzUNZFtazSm3uVCZF4TieaeONPS04BWAR5ESkjYtoJnGY8stgBYfq0dW
	 Iqu301WDbqghCwHu2hXY0JoURJPr9EPh7jnt0yYSOKfVzHu1m/e7zZTed2f5zpjAMB
	 1idVVIQyLuYPQ==
Date: Tue, 27 Aug 2024 15:51:42 +0100
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [net-next v3 1/9] net: stmmac: dwmac-intel-plat: Convert to
 devm_clk_get_enabled()
Message-ID: <20240827145142.GI1368797@kernel.org>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-2-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827095712.2672820-2-frank.li@vivo.com>

On Tue, Aug 27, 2024 at 03:57:04AM -0600, Yangtao Li wrote:
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

As it looks like there will be a v4 anyway, a minor nit from my side:
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

...

