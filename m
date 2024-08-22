Return-Path: <linux-renesas-soc+bounces-8022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C776595B654
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5486B1F2780D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 13:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B369A1CB138;
	Thu, 22 Aug 2024 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="W+4XIpD+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-213.smtpout.orange.fr [193.252.23.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746D01C9453;
	Thu, 22 Aug 2024 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724332829; cv=none; b=P8JzG2S4kUyS1Vf3yl7et1LRacrESEyDlnXtHsDpmA0aBi8qzEab2jdY41Mz4hvihhgfrMWkm+LPNAx49q5ynzH2j1XtCaeUGKbPJOG74d6V8T7eAuX5LOhl+KfNw0+1Qb99sMBA9cgW5WiuUrvOEK78MwMcMthvb1saf1kx64s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724332829; c=relaxed/simple;
	bh=R3MgZulENDqdRbIellqr75I/ViIa9URQw996p0CUctQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Dr4xAcXTGOJbm9fQ+p3y4tarVnGNuBXkwa0sNAdSoh6caaxA1SCc++F+ELNym1I+2HXuLI2URSW6mm3glKu/fIhLY9Npx2MC4Sy+IPL+uKyrugrWEIyuHBArCMmv4Je17VD9+qgWf8fBZLe3R2Ihz7D4F9WTsoNmWfzNpqgAkBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=W+4XIpD+; arc=none smtp.client-ip=193.252.23.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id h7jWsmJZhS3tRh7jXsZQYa; Thu, 22 Aug 2024 15:20:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724332818;
	bh=7o9kJ8LE12X5cmoi/urYscWziJB8NGZ/vwHTmpS6Onc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To;
	b=W+4XIpD+BKMw9oCv2HAHZXJJZHYqQGx35HJuoYPDcB0ldecA9YFMMXLHDCrIWIbIT
	 HHzuK1GZXDqaaKkd4J7orgh3RsXYLjbtqE4vCTxSnj5hLketVJGkzf6DVX0afS2sCP
	 3x2vJwq0ZAYLhcc4D6ZHzFjc6CQ7GvxhdbdieTxAUGNL9zkHtO5EU9uLnf57E13hoo
	 ffk/uMpXQ2ySXG7WMLj2WKfCoQD2HJUhhd2zJs9NBi5nYYX9XbEnguYvRXhV04Tzt2
	 pbOfRayGuGpnzZp6/gs88zlcI3fS3mYumE98eyAmvdRrSj6mfYzRrf7vfTzSkmWO8y
	 4Qz+TWNHzxA+A==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 22 Aug 2024 15:20:18 +0200
X-ME-IP: 90.11.132.44
Message-ID: <15ba8f05-8909-4ade-b0f3-c98cad0bd9f0@wanadoo.fr>
Date: Thu, 22 Aug 2024 15:20:10 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [net-next 8/9] net: mvpp2: Convert to devm_clk_get_enabled() and
 devm_clk_get_optional_enabled()
To: Yangtao Li <frank.li@vivo.com>, clement.leger@bootlin.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, ulli.kroll@googlemail.com, linus.walleij@linaro.org,
 marcin.s.wojtas@gmail.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, hkallweit1@gmail.com,
 justinstitt@google.com, kees@kernel.org, u.kleine-koenig@pengutronix.de,
 jacob.e.keller@intel.com, horms@kernel.org, shannon.nelson@amd.com
Cc: linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240822084733.1599295-1-frank.li@vivo.com>
 <20240822084733.1599295-9-frank.li@vivo.com>
Content-Language: en-US, fr-FR
In-Reply-To: <20240822084733.1599295-9-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 22/08/2024 à 10:47, Yangtao Li a écrit :
> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  7 --
>   .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 86 +++++--------------
>   2 files changed, 22 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> index 9e02e4367bec..643a645e8097 100644
> --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> @@ -1044,13 +1044,6 @@ struct mvpp2 {
>   	 */
>   	struct regmap *sysctrl_base;
>   
> -	/* Common clocks */
> -	struct clk *pp_clk;
> -	struct clk *gop_clk;
> -	struct clk *mg_clk;
> -	struct clk *mg_core_clk;
> -	struct clk *axi_clk;
> -
>   	/* List of pointers to port structures */
>   	int port_count;
>   	struct mvpp2_port *port_list[MVPP2_MAX_PORTS];
> diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> index 2fe8bae4eb3c..0075499de29f 100644
> --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> @@ -7462,6 +7462,7 @@ static int mvpp2_get_sram(struct platform_device *pdev,
>   
>   static int mvpp2_probe(struct platform_device *pdev)
>   {
> +	struct clk *pp_clk, *gop_clk, *mg_clk, *mg_core_clk, *axi_clk;

Hi,

Nitpick: you could also define just struct clk *pp_clk, *clk; and reuse 
clk for most calls.
*Maybe* clk_get_rate() could be moved in order to only need 1 clk.

CJ

>   	struct mvpp2 *priv;
>   	struct resource *res;
>   	void __iomem *base;
> @@ -7561,56 +7562,30 @@ static int mvpp2_probe(struct platform_device *pdev)
>   		priv->max_port_rxqs = 32;
>   
>   	if (dev_of_node(&pdev->dev)) {
> -		priv->pp_clk = devm_clk_get(&pdev->dev, "pp_clk");
> -		if (IS_ERR(priv->pp_clk))
> -			return PTR_ERR(priv->pp_clk);
> -		err = clk_prepare_enable(priv->pp_clk);
> -		if (err < 0)
> -			return err;
> +		pp_clk = devm_clk_get_enabled(&pdev->dev, "pp_clk");
> +		if (IS_ERR(pp_clk))
> +			return PTR_ERR(pp_clk);
>   
> -		priv->gop_clk = devm_clk_get(&pdev->dev, "gop_clk");
> -		if (IS_ERR(priv->gop_clk)) {
> -			err = PTR_ERR(priv->gop_clk);
> -			goto err_pp_clk;
> -		}
> -		err = clk_prepare_enable(priv->gop_clk);
> -		if (err < 0)
> -			goto err_pp_clk;
> +		gop_clk = devm_clk_get_enabled(&pdev->dev, "gop_clk");
> +		if (IS_ERR(gop_clk))
> +			return PTR_ERR(gop_clk);
>   
>   		if (priv->hw_version >= MVPP22) {
> -			priv->mg_clk = devm_clk_get(&pdev->dev, "mg_clk");
> -			if (IS_ERR(priv->mg_clk)) {
> -				err = PTR_ERR(priv->mg_clk);
> -				goto err_gop_clk;
> -			}
> -
> -			err = clk_prepare_enable(priv->mg_clk);
> -			if (err < 0)
> -				goto err_gop_clk;
> -
> -			priv->mg_core_clk = devm_clk_get_optional(&pdev->dev, "mg_core_clk");
> -			if (IS_ERR(priv->mg_core_clk)) {
> -				err = PTR_ERR(priv->mg_core_clk);
> -				goto err_mg_clk;
> -			}
> +			mg_clk = devm_clk_get_enabled(&pdev->dev, "mg_clk");
> +			if (IS_ERR(mg_clk))
> +				return PTR_ERR(mg_clk);
>   
> -			err = clk_prepare_enable(priv->mg_core_clk);
> -			if (err < 0)
> -				goto err_mg_clk;
> +			mg_core_clk = devm_clk_get_optional_enabled(&pdev->dev, "mg_core_clk");
> +			if (IS_ERR(mg_core_clk))
> +				return PTR_ERR(mg_core_clk);
>   		}
>   
> -		priv->axi_clk = devm_clk_get_optional(&pdev->dev, "axi_clk");
> -		if (IS_ERR(priv->axi_clk)) {
> -			err = PTR_ERR(priv->axi_clk);
> -			goto err_mg_core_clk;
> -		}
> -
> -		err = clk_prepare_enable(priv->axi_clk);
> -		if (err < 0)
> -			goto err_mg_core_clk;
> +		axi_clk = devm_clk_get_optional_enabled(&pdev->dev, "axi_clk");
> +		if (IS_ERR(axi_clk))
> +			return PTR_ERR(axi_clk);
>   
>   		/* Get system's tclk rate */
> -		priv->tclk = clk_get_rate(priv->pp_clk);
> +		priv->tclk = clk_get_rate(pp_clk);
>   	} else {
>   		err = device_property_read_u32(&pdev->dev, "clock-frequency", &priv->tclk);
>   		if (err) {
> @@ -7622,7 +7597,7 @@ static int mvpp2_probe(struct platform_device *pdev)
>   	if (priv->hw_version >= MVPP22) {
>   		err = dma_set_mask(&pdev->dev, MVPP2_DESC_DMA_MASK);
>   		if (err)
> -			goto err_axi_clk;
> +			return err;
>   		/* Sadly, the BM pools all share the same register to
>   		 * store the high 32 bits of their address. So they
>   		 * must all have the same high 32 bits, which forces
> @@ -7630,7 +7605,7 @@ static int mvpp2_probe(struct platform_device *pdev)
>   		 */
>   		err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
>   		if (err)
> -			goto err_axi_clk;
> +			return err;
>   	}
>   
>   	/* Map DTS-active ports. Should be done before FIFO mvpp2_init */
> @@ -7649,12 +7624,12 @@ static int mvpp2_probe(struct platform_device *pdev)
>   	err = mvpp2_init(pdev, priv);
>   	if (err < 0) {
>   		dev_err(&pdev->dev, "failed to initialize controller\n");
> -		goto err_axi_clk;
> +		return err;
>   	}
>   
>   	err = mvpp22_tai_probe(&pdev->dev, priv);
>   	if (err < 0)
> -		goto err_axi_clk;
> +		return err;
>   
>   	/* Initialize ports */
>   	device_for_each_child_node_scoped(&pdev->dev, port_fwnode) {
> @@ -7665,8 +7640,7 @@ static int mvpp2_probe(struct platform_device *pdev)
>   
>   	if (priv->port_count == 0) {
>   		dev_err(&pdev->dev, "no ports enabled\n");
> -		err = -ENODEV;
> -		goto err_axi_clk;
> +		return -ENODEV;
>   	}
>   
>   	/* Statistics must be gathered regularly because some of them (like
> @@ -7698,16 +7672,6 @@ static int mvpp2_probe(struct platform_device *pdev)
>   err_port_probe:
>   	for (i = 0; i < priv->port_count; i++)
>   		mvpp2_port_remove(priv->port_list[i]);
> -err_axi_clk:
> -	clk_disable_unprepare(priv->axi_clk);
> -err_mg_core_clk:
> -	clk_disable_unprepare(priv->mg_core_clk);
> -err_mg_clk:
> -	clk_disable_unprepare(priv->mg_clk);
> -err_gop_clk:
> -	clk_disable_unprepare(priv->gop_clk);
> -err_pp_clk:
> -	clk_disable_unprepare(priv->pp_clk);
>   	return err;
>   }
>   
> @@ -7745,12 +7709,6 @@ static void mvpp2_remove(struct platform_device *pdev)
>   
>   	if (!dev_of_node(&pdev->dev))
>   		return;
> -
> -	clk_disable_unprepare(priv->axi_clk);
> -	clk_disable_unprepare(priv->mg_core_clk);
> -	clk_disable_unprepare(priv->mg_clk);
> -	clk_disable_unprepare(priv->pp_clk);
> -	clk_disable_unprepare(priv->gop_clk);
>   }
>   
>   static const struct of_device_id mvpp2_match[] = {


