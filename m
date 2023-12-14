Return-Path: <linux-renesas-soc+bounces-1064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BCB812FF9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 13:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B54EB21704
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F5048CED;
	Thu, 14 Dec 2023 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DCij6W3v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9AF6115
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 04:26:05 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bf26b677dso7830745e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 04:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702556764; x=1703161564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuwUSmV/kVrAbENuuZFkPgGMGjiOEuNoJMZtwfSZm0w=;
        b=DCij6W3vK1/6bSttEFccHSjhZLu+YuhzfcsGKX13h5egtLe1/MvKqPhIXVdm9Ampjd
         LzTZEmhGDOGI40IfwEFVeX3RYcnDEqviSZJN/cs8BU9p7xatKEQAWnHZS6nmL7eyz9E/
         QdsZ8LEmpxFWV2pZwPHOoq960Ilyw0wswyX1MdCZEbJLWQsT4zK7ZzkIOSo2luHertc0
         J0PnWtaSjtAtcDn8OTH05BymVqFSQlZI9FgfLK6krtGVWZT/FXu2GGjqdjRkaVt4SKuf
         Lp3MYMbDea5ySuP7DyMzdgjfwdPPwTwCRck5SAeLSRMs5vPYTKyDpyLB96YD6+le+xW2
         WZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702556764; x=1703161564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuwUSmV/kVrAbENuuZFkPgGMGjiOEuNoJMZtwfSZm0w=;
        b=DP82FKFwhWUd3glYk9CwI5zzyAoOozpbji1F0fvq2mNW1I+jcytzkoyXxzuBSV7mTf
         DePTfJLibJyl2QJdlCyc8LyWQkH6xFMfvdVHZt45ic3nosIJFwVdMt9iJPisIrcXBNYs
         wZxYeh4ZZWr2Ek9jUxewuC68L9+ciQMxC/3tK+6QSTpjLISnr9aBnXNiCEqHbr5gOlwo
         2i8u7/faeHwVqxvJcQD09oRklhYT89NPSI1bd6H6ckkhIrlWiiIGE5RwwDcEypVUVOxe
         RMFZ7hQDRm1j4xDFfZmd/zVNySE6tyHc5dJt7Ebco5+WuYPsXHzqItvUkPGiWHSkfvVy
         YM3g==
X-Gm-Message-State: AOJu0YxTICaZ8VbEDLOT50by93slnqsuPxfGTepN7pxOunXusLSosS8T
	luak0c/1mHt43Ze0sctusqH5YQ==
X-Google-Smtp-Source: AGHT+IGlUqLsuH+kw3wJpuXR2PGCNVzPATeb3/5HChBlXycaDNyuH09w8Y7apf9yILfeCdGXornVbg==
X-Received: by 2002:ac2:47eb:0:b0:50e:1b5d:4dda with SMTP id b11-20020ac247eb000000b0050e1b5d4ddamr99465lfp.166.1702556763878;
        Thu, 14 Dec 2023 04:26:03 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id mm20-20020a1709077a9400b00a1a53e9f401sm9327866ejc.132.2023.12.14.04.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 04:26:03 -0800 (PST)
Message-ID: <7f514abe-7f18-44c8-9a0e-d2f4772713f7@tuxon.dev>
Date: Thu, 14 Dec 2023 14:25:57 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: ravb: Wait for operation mode to be applied
Content-Language: en-US
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, claudiu.beznea.uj@bp.renesas.com,
 yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 mitsuhiro.kimura.kc@renesas.com, geert+renesas@glider.be,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231214113137.2450292-1-claudiu.beznea.uj@bp.renesas.com>
 <20231214113137.2450292-2-claudiu.beznea.uj@bp.renesas.com>
 <20231214121109.GK1863068@ragnatech.se>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20231214121109.GK1863068@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Niklas,

On 14.12.2023 14:11, Niklas Söderlund wrote:
> Hi Claudiu,
> 
> Thanks for your patch.
> 
> On 2023-12-14 13:31:36 +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> CSR.OPS bits specify the current operating mode and (according to
>> documentation) they are updated when the operating mode change request
>> is processed. Thus, check CSR.OPS before proceeding.
>>
>> Fixes: 568b3ce7a8ef ("ravb: factor out register bit twiddling code")
>> Fixes: 0184165b2f42 ("ravb: add sleep PM suspend/resume support")
>> Fixes: 7e09a052dc4e ("ravb: Exclude gPTP feature support for RZ/G2L")
>> Fixes: 3e3d647715d4 ("ravb: add wake-on-lan support via magic packet")
>> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> 
> I think the list of fixes tags can be reduced. The last item in the list 
> is the patch which adds the RAVB driver so what's the point of listing 
> the rest?

In commit c156633f1353 ("Renesas Ethernet AVB driver proper") different
features that were touched by the rest of commits in the fixes list might
not be present. So, it might be possible that this patch to not be
back-portable to c156633f1353 ("Renesas Ethernet AVB driver proper") but to
other commits in the list.

> 
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  drivers/net/ethernet/renesas/ravb_main.c | 47 ++++++++++++++++++++----
>>  1 file changed, 39 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index 9178f6d60e74..ce95eb5af354 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -683,8 +683,11 @@ static int ravb_dmac_init(struct net_device *ndev)
>>  
>>  	/* Setting the control will start the AVB-DMAC process. */
>>  	ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_OPERATION);
>> +	error = ravb_wait(ndev, CSR, CSR_OPS, CSR_OPS_OPERATION);
>> +	if (error)
>> +		netdev_err(ndev, "failed to switch device to operation mode\n");
> 
> As you add ravb_set_reset_mode() to compliment the existing 
> ravb_set_config_mode(), would it not be coherent to also add a 
> ravb_set_operation_mode() instead of open coding it here?

CSR_OPS_OPERATION is set only in this place. Reset is done in more than one
place. Due to this I've added a function for it.

> 
>>  
>> -	return 0;
>> +	return error;
>>  }
>>  
>>  static void ravb_get_tx_tstamp(struct net_device *ndev)
>> @@ -1744,6 +1747,18 @@ static inline int ravb_hook_irq(unsigned int irq, irq_handler_t handler,
>>  	return error;
>>  }
>>  
>> +static int ravb_set_reset_mode(struct net_device *ndev)
> 
> nit: Maybe move this to be close to ravb_set_config_mode() to co-locate 
> all mode changing logic?

I've did this but not in this patch. It could be found on the final version
of the driver proposed by
https://lore.kernel.org/all/20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com/

Thank you for your review,
Claudiu Beznea

> 
>> +{
>> +	int error;
>> +
>> +	ravb_write(ndev, CCC_OPC_RESET, CCC);
>> +	error = ravb_wait(ndev, CSR, CSR_OPS, CSR_OPS_RESET);
>> +	if (error)
>> +		netdev_err(ndev, "failed to switch device to reset mode\n");
>> +
>> +	return error;
>> +}
>> +
>>  /* Network device open function for Ethernet AVB */
>>  static int ravb_open(struct net_device *ndev)
>>  {
>> @@ -2551,10 +2566,11 @@ static int ravb_set_gti(struct net_device *ndev)
>>  	return 0;
>>  }
>>  
>> -static void ravb_set_config_mode(struct net_device *ndev)
>> +static int ravb_set_config_mode(struct net_device *ndev)
>>  {
>>  	struct ravb_private *priv = netdev_priv(ndev);
>>  	const struct ravb_hw_info *info = priv->info;
>> +	int error;
>>  
>>  	if (info->gptp) {
>>  		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG);
>> @@ -2566,6 +2582,12 @@ static void ravb_set_config_mode(struct net_device *ndev)
>>  	} else {
>>  		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG);
>>  	}
>> +
>> +	error = ravb_wait(ndev, CSR, CSR_OPS, CSR_OPS_CONFIG);
>> +	if (error)
>> +		netdev_err(ndev, "failed to switch device to config mode\n");
>> +
>> +	return error;
>>  }
>>  
>>  /* Set tx and rx clock internal delay modes */
>> @@ -2785,7 +2807,9 @@ static int ravb_probe(struct platform_device *pdev)
>>  	ndev->ethtool_ops = &ravb_ethtool_ops;
>>  
>>  	/* Set AVB config mode */
>> -	ravb_set_config_mode(ndev);
>> +	error = ravb_set_config_mode(ndev);
>> +	if (error)
>> +		goto out_disable_refclk;
>>  
>>  	if (info->gptp || info->ccc_gac) {
>>  		/* Set GTI value */
>> @@ -2893,6 +2917,7 @@ static void ravb_remove(struct platform_device *pdev)
>>  	struct net_device *ndev = platform_get_drvdata(pdev);
>>  	struct ravb_private *priv = netdev_priv(ndev);
>>  	const struct ravb_hw_info *info = priv->info;
>> +	int error;
>>  
>>  	unregister_netdev(ndev);
>>  	if (info->nc_queues)
>> @@ -2908,8 +2933,9 @@ static void ravb_remove(struct platform_device *pdev)
>>  	dma_free_coherent(ndev->dev.parent, priv->desc_bat_size, priv->desc_bat,
>>  			  priv->desc_bat_dma);
>>  
>> -	/* Set reset mode */
>> -	ravb_write(ndev, CCC_OPC_RESET, CCC);
>> +	error = ravb_set_reset_mode(ndev);
>> +	if (error)
>> +		netdev_err(ndev, "Failed to reset ndev\n");
>>  
>>  	clk_disable_unprepare(priv->gptp_clk);
>>  	clk_disable_unprepare(priv->refclk);
>> @@ -2991,8 +3017,11 @@ static int __maybe_unused ravb_resume(struct device *dev)
>>  	int ret = 0;
>>  
>>  	/* If WoL is enabled set reset mode to rearm the WoL logic */
>> -	if (priv->wol_enabled)
>> -		ravb_write(ndev, CCC_OPC_RESET, CCC);
>> +	if (priv->wol_enabled) {
>> +		ret = ravb_set_reset_mode(ndev);
>> +		if (ret)
>> +			return ret;
>> +	}
>>  
>>  	/* All register have been reset to default values.
>>  	 * Restore all registers which where setup at probe time and
>> @@ -3000,7 +3029,9 @@ static int __maybe_unused ravb_resume(struct device *dev)
>>  	 */
>>  
>>  	/* Set AVB config mode */
>> -	ravb_set_config_mode(ndev);
>> +	ret = ravb_set_config_mode(ndev);
>> +	if (ret)
>> +		return ret;
>>  
>>  	if (info->gptp || info->ccc_gac) {
>>  		/* Set GTI value */
>> -- 
>> 2.39.2
>>
> 

