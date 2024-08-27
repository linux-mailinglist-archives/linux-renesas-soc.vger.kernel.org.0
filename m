Return-Path: <linux-renesas-soc+bounces-8387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8698960F2D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 16:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 077E11C21E74
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 14:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063571C68A5;
	Tue, 27 Aug 2024 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzY3Ekoi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7E1C5783;
	Tue, 27 Aug 2024 14:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724770532; cv=none; b=bS9gRkH6THt//RMdyZlMqWm+CsJaS3vc/r/KDoa2NsHKAd9dN6rEBDLYfRyubPWQO6nZpMFsNUB6wGzlFbgMbfI9konstRNQOnlp45Rw0N0PtdbxyEsQjo0U9aISi88h8dI1xMOscdzJD6nJ2WUdhzZbQRQb0P9pgaOwdebr5JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724770532; c=relaxed/simple;
	bh=D80vpx6U6QT7GcY5OtgT2Iqfz6U4g8ngRy6lrqYUReA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhKZXs7VECeaziw/m0RWVW2DFRTl2o3hgesoB1Un4xw9tzjN+6BOWb5atGjvdcfakjU987ukoKTPq58kKN7RHZ59jTDiG6BpgNaP/xlrOiQ/I1pXZxubmZECgGj2AEngB4iMDqjIKAPXRFrp8EFJfFZ1AJW1Kp18oQBH9sjjsTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzY3Ekoi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903EDC4E699;
	Tue, 27 Aug 2024 14:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724770532;
	bh=D80vpx6U6QT7GcY5OtgT2Iqfz6U4g8ngRy6lrqYUReA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzY3EkoijKjcm5DDmYoHp5H2ObZXtFKsAMa12P/QKAptq4mddaMTqo7uGVS3xob46
	 5jUTvBkE/DZ33nI2za/bDA6MbTauhaXisYMORZ/5e9XdAIGzWXD3JDhE64Ii2i/eKt
	 O8HiVHGByi9iQJybjjlB2SiZ9eTUVQAE39HG9gr5whw2clXYCtDtvubb7gaZpfy/pE
	 sx8K4t+gUDaNJDGp/EXP5b8wW7lrQo6TNDlaJ+8SiWg5z61yjpl4plNnwjB9cBtYos
	 Ql/I7sCYTMQ4C109ubkSm5qLVdm/90L4TOuXhH4QjUYve1b/uzB1+GNGVDGEX4bVCS
	 sRdHpm4Q4lIjw==
Date: Tue, 27 Aug 2024 15:55:25 +0100
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [net-next v3 8/9] net: mvpp2: Convert to devm_clk_get_enabled()
 and devm_clk_get_optional_enabled()
Message-ID: <20240827145525.GK1368797@kernel.org>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-9-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827095712.2672820-9-frank.li@vivo.com>

On Tue, Aug 27, 2024 at 03:57:11AM -0600, Yangtao Li wrote:
> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Marcin Wojtas <marcin.s.wojtas@gmail.com>

...

> diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> index 2fe8bae4eb3c..0ca2daeb0f90 100644
> --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> @@ -7561,56 +7561,32 @@ static int mvpp2_probe(struct platform_device *pdev)

...

> -		priv->axi_clk = devm_clk_get_optional(&pdev->dev, "axi_clk");
> -		if (IS_ERR(priv->axi_clk)) {
> -			err = PTR_ERR(priv->axi_clk);
> -			goto err_mg_core_clk;
> +			clk = devm_clk_get_optional_enabled(&pdev->dev, "mg_core_clk");

As it looks like there will be a v3 anyway, a minor nit from my side:
IMHO, the line above could be trivially wrapped to keep it <= 80 columns wide,
which is still preferred by Networking code.

> +			if (IS_ERR(clk))
> +				return PTR_ERR(clk);
>  		}
>  
> -		err = clk_prepare_enable(priv->axi_clk);
> -		if (err < 0)
> -			goto err_mg_core_clk;
> -
> -		/* Get system's tclk rate */
> -		priv->tclk = clk_get_rate(priv->pp_clk);
> +		clk = devm_clk_get_optional_enabled(&pdev->dev, "axi_clk");
> +		if (IS_ERR(clk))
> +			return PTR_ERR(clk);

...

