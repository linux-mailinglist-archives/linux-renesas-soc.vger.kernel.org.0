Return-Path: <linux-renesas-soc+bounces-1063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A18B812FCE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 13:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D95861F22470
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A243041776;
	Thu, 14 Dec 2023 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mK3Lc8Mk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E552112B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 04:11:12 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50e0d1f9fe6so2884063e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 04:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1702555871; x=1703160671; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xgrqFdV6UcxdxSO2fJT9XQI291SapSFGO4zYlzTTifY=;
        b=mK3Lc8MkuBCR3+0JWrGqjz/9WEFJoi1Xg8R2uqXA+/eUgsQVpGriScFxMxsAKELZdD
         TjM1Ss81xoMKIaYKPwiP9wwLd/MbBFnqXR1feJOsIm5WtvvFlB3vGRXPdhUrKjB43eqT
         nGW7GpqRsaGN4ZjPxvyBY6LlS1ZT+yrvJnaYC7C2UvNssjvR/SKqHRSEr/csUpLjLNNb
         PjYo9nbzK6rp29f0IT8fyVVh+/oOaQlFtRcT9AmOz3oL6++KNxjXqCdQJcqj8Af4Eep1
         pxNz55SqDGjaYdPHhqIiE8d7fDvWQi/zpp5kalDExVR+ugsXwEEE6X/Cd/6eJ5ksa3zZ
         CiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702555871; x=1703160671;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xgrqFdV6UcxdxSO2fJT9XQI291SapSFGO4zYlzTTifY=;
        b=RPCQqDrApTaYtrQAgrcQOSczs2+euCtg2dgbgvsB5edCqvglF5lrlL3NQ9FNnBT9tf
         h+JXF7LC0p+dEdWMKhSl5kcQsORLu+kd3mK98o4nJvN2nD5aEoHvChlM7XT2Aw7JAF90
         MINZYgNexeklqIZiKo0NqaVEZw3xRMdw0x5dABO51COn5qFDqp7MdgOv7kLgK1+rdev+
         TBPZZ/6H3610ynBTE6un8wRA/kIbqsl9AEV86FNL2Omw62z8vxc2HNSF961H7ce3Z1oY
         MoDmkPJtHWlrwc/1j0Omg5rCQkrDtRnL1s4qvMrIYVr4xMpUfr0Qh/sME9dc2+XuN5mE
         qG7g==
X-Gm-Message-State: AOJu0YwP+vYITMZJAjZdddJj9ExcUzZ5DsoHDErR0X7ICRegdIXRVbWt
	U5dsr/I6uvX6hQJal7f9vl/3bt97lOcnBwgyqfQ=
X-Google-Smtp-Source: AGHT+IGnSjm5Hi+DAMqiJjbw0iT/RsGej7lC+5bYSSPg4CNP/j779F4eCE1ROr58TW0N7XE7G56SRg==
X-Received: by 2002:a05:6512:3ba8:b0:50e:d6e:67d6 with SMTP id g40-20020a0565123ba800b0050e0d6e67d6mr1943973lfv.14.1702555870935;
        Thu, 14 Dec 2023 04:11:10 -0800 (PST)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id j13-20020ac2550d000000b0050bf4803234sm1876416lfk.194.2023.12.14.04.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 04:11:10 -0800 (PST)
Date: Thu, 14 Dec 2023 13:11:09 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	claudiu.beznea.uj@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
	wsa+renesas@sang-engineering.com, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mitsuhiro.kimura.kc@renesas.com, geert+renesas@glider.be,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: ravb: Wait for operation mode to be applied
Message-ID: <20231214121109.GK1863068@ragnatech.se>
References: <20231214113137.2450292-1-claudiu.beznea.uj@bp.renesas.com>
 <20231214113137.2450292-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231214113137.2450292-2-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

Thanks for your patch.

On 2023-12-14 13:31:36 +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> CSR.OPS bits specify the current operating mode and (according to
> documentation) they are updated when the operating mode change request
> is processed. Thus, check CSR.OPS before proceeding.
> 
> Fixes: 568b3ce7a8ef ("ravb: factor out register bit twiddling code")
> Fixes: 0184165b2f42 ("ravb: add sleep PM suspend/resume support")
> Fixes: 7e09a052dc4e ("ravb: Exclude gPTP feature support for RZ/G2L")
> Fixes: 3e3d647715d4 ("ravb: add wake-on-lan support via magic packet")
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")

I think the list of fixes tags can be reduced. The last item in the list 
is the patch which adds the RAVB driver so what's the point of listing 
the rest?

> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 47 ++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 9178f6d60e74..ce95eb5af354 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -683,8 +683,11 @@ static int ravb_dmac_init(struct net_device *ndev)
>  
>  	/* Setting the control will start the AVB-DMAC process. */
>  	ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_OPERATION);
> +	error = ravb_wait(ndev, CSR, CSR_OPS, CSR_OPS_OPERATION);
> +	if (error)
> +		netdev_err(ndev, "failed to switch device to operation mode\n");

As you add ravb_set_reset_mode() to compliment the existing 
ravb_set_config_mode(), would it not be coherent to also add a 
ravb_set_operation_mode() instead of open coding it here?

>  
> -	return 0;
> +	return error;
>  }
>  
>  static void ravb_get_tx_tstamp(struct net_device *ndev)
> @@ -1744,6 +1747,18 @@ static inline int ravb_hook_irq(unsigned int irq, irq_handler_t handler,
>  	return error;
>  }
>  
> +static int ravb_set_reset_mode(struct net_device *ndev)

nit: Maybe move this to be close to ravb_set_config_mode() to co-locate 
all mode changing logic?

> +{
> +	int error;
> +
> +	ravb_write(ndev, CCC_OPC_RESET, CCC);
> +	error = ravb_wait(ndev, CSR, CSR_OPS, CSR_OPS_RESET);
> +	if (error)
> +		netdev_err(ndev, "failed to switch device to reset mode\n");
> +
> +	return error;
> +}
> +
>  /* Network device open function for Ethernet AVB */
>  static int ravb_open(struct net_device *ndev)
>  {
> @@ -2551,10 +2566,11 @@ static int ravb_set_gti(struct net_device *ndev)
>  	return 0;
>  }
>  
> -static void ravb_set_config_mode(struct net_device *ndev)
> +static int ravb_set_config_mode(struct net_device *ndev)
>  {
>  	struct ravb_private *priv = netdev_priv(ndev);
>  	const struct ravb_hw_info *info = priv->info;
> +	int error;
>  
>  	if (info->gptp) {
>  		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG);
> @@ -2566,6 +2582,12 @@ static void ravb_set_config_mode(struct net_device *ndev)
>  	} else {
>  		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG);
>  	}
> +
> +	error = ravb_wait(ndev, CSR, CSR_OPS, CSR_OPS_CONFIG);
> +	if (error)
> +		netdev_err(ndev, "failed to switch device to config mode\n");
> +
> +	return error;
>  }
>  
>  /* Set tx and rx clock internal delay modes */
> @@ -2785,7 +2807,9 @@ static int ravb_probe(struct platform_device *pdev)
>  	ndev->ethtool_ops = &ravb_ethtool_ops;
>  
>  	/* Set AVB config mode */
> -	ravb_set_config_mode(ndev);
> +	error = ravb_set_config_mode(ndev);
> +	if (error)
> +		goto out_disable_refclk;
>  
>  	if (info->gptp || info->ccc_gac) {
>  		/* Set GTI value */
> @@ -2893,6 +2917,7 @@ static void ravb_remove(struct platform_device *pdev)
>  	struct net_device *ndev = platform_get_drvdata(pdev);
>  	struct ravb_private *priv = netdev_priv(ndev);
>  	const struct ravb_hw_info *info = priv->info;
> +	int error;
>  
>  	unregister_netdev(ndev);
>  	if (info->nc_queues)
> @@ -2908,8 +2933,9 @@ static void ravb_remove(struct platform_device *pdev)
>  	dma_free_coherent(ndev->dev.parent, priv->desc_bat_size, priv->desc_bat,
>  			  priv->desc_bat_dma);
>  
> -	/* Set reset mode */
> -	ravb_write(ndev, CCC_OPC_RESET, CCC);
> +	error = ravb_set_reset_mode(ndev);
> +	if (error)
> +		netdev_err(ndev, "Failed to reset ndev\n");
>  
>  	clk_disable_unprepare(priv->gptp_clk);
>  	clk_disable_unprepare(priv->refclk);
> @@ -2991,8 +3017,11 @@ static int __maybe_unused ravb_resume(struct device *dev)
>  	int ret = 0;
>  
>  	/* If WoL is enabled set reset mode to rearm the WoL logic */
> -	if (priv->wol_enabled)
> -		ravb_write(ndev, CCC_OPC_RESET, CCC);
> +	if (priv->wol_enabled) {
> +		ret = ravb_set_reset_mode(ndev);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	/* All register have been reset to default values.
>  	 * Restore all registers which where setup at probe time and
> @@ -3000,7 +3029,9 @@ static int __maybe_unused ravb_resume(struct device *dev)
>  	 */
>  
>  	/* Set AVB config mode */
> -	ravb_set_config_mode(ndev);
> +	ret = ravb_set_config_mode(ndev);
> +	if (ret)
> +		return ret;
>  
>  	if (info->gptp || info->ccc_gac) {
>  		/* Set GTI value */
> -- 
> 2.39.2
> 

-- 
Kind Regards,
Niklas Söderlund

