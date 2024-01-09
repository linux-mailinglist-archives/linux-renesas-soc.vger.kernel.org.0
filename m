Return-Path: <linux-renesas-soc+bounces-1381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF8827E72
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jan 2024 06:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E19FE1F2466A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jan 2024 05:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F703FFF;
	Tue,  9 Jan 2024 05:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nb3pvqSF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C78715A7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jan 2024 05:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2a17f3217aso259246666b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jan 2024 21:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704778980; x=1705383780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xcgdr1I9kndIxRfT90cgq6tEB3GwG2M4TsfK1tAjKE0=;
        b=nb3pvqSFawouaLEgEjyY6rxyx/UbpR5sjVWebS/VxOfEQNZeenGXahcitQtpvkTSHE
         G8PzgIp91ILZ3MpZkVdyDiIKJ5foOYop33v1x42ObURVminhKZNjgj4ElcP+ZH2acso5
         za6h+MfVbrR09xOYGIyVDFb1Bb+18qQqFI3tBZKP8vvZL8IAQnhut8sAi4kwm+FZaXjJ
         +ghSNDNT61MjZ38o3GJTLohmDGiN6/ZigDWGeeM8IgiEtiJGkIowMajmlv7Wo+365dtT
         hqfHVC394OltAgjSFi8y5Q94gA6Nfwaj10KwK/TaAqPNb3mlZWZOmXrx2gt7HIGfTI6v
         15XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704778980; x=1705383780;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xcgdr1I9kndIxRfT90cgq6tEB3GwG2M4TsfK1tAjKE0=;
        b=U7v+NQXW+6zd4nqB5L2xXaRL2Pi6+3ZDBOKEUHBT6dCknqPDQ/gc7KhWlHXothnhNa
         +WUiIssKm6QB9bt0WEtO7TqA7zsBZOUDwO4v+K2aJgMuykN5Fdb9l9AN4aDxISgTTaN8
         E/piCYnBMlHkFhRY5fPvJOI/z15x4ql6BaNPZFwKMi2igqO3ALKylUQr7NNxdfEzd4Xb
         3xtWA99mU7lrDBeFDXM7GTupMxw7aGaB+9vtZ6HzIn5LzB124gbAKRsYm7tEjYhlT4WO
         uLiPWl4EuN9JJyBNpZIGHH3qpLNnR7nrllgDKsjiet/FjHP8QRMlxG+vzhlNGaBCIStE
         HZFQ==
X-Gm-Message-State: AOJu0YybCTr9HfTIDmjS7pYt+bneqvUUwmr8hw3oXKpnSHtzxkNDf38T
	v3+h4XFvduEgFveF35OXjrlfgMfPpiV7mw==
X-Google-Smtp-Source: AGHT+IGuhQReqUvlv0RJ3ciCIToVLxlJJB3Esmba5Yo60V5bwghrRTOYWBE89ho73FfJ+oSHxrV7gw==
X-Received: by 2002:a17:907:9483:b0:a28:cde1:43a9 with SMTP id dm3-20020a170907948300b00a28cde143a9mr303838ejc.9.1704778980269;
        Mon, 08 Jan 2024 21:43:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id i12-20020a170906250c00b00a2693ce340csm632804ejb.59.2024.01.08.21.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 21:42:59 -0800 (PST)
Message-ID: <f23e9ff2-9792-460f-863e-72c8d44cfbda@tuxon.dev>
Date: Tue, 9 Jan 2024 07:42:52 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 13/19] net: ravb: Set config mode in ndo_open
 and reset mode in ndo_close
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, p.zabel@pengutronix.de,
 yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
 <20240105082339.1468817-14-claudiu.beznea.uj@bp.renesas.com>
 <feb1c87e-a84d-4e61-3e58-f61d5402170d@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <feb1c87e-a84d-4e61-3e58-f61d5402170d@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08.01.2024 21:28, Sergey Shtylyov wrote:
> On 1/5/24 11:23 AM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> As some IP variants switch to reset mode (and thus registers content is
>> lost) when setting clocks (due to module standby functionality) to be able
>> to implement runtime PM and save more power, set the IP's operating mode to
>> reset at the end of the probe. Along with it, in the ndo_open API the IP
>> will be switched to configuration, then operation mode. In the ndo_close
>> API, the IP will be switched back to reset mode. This allows implementing
>> runtime PM and, along with it, save more power when the IP is not used.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - fixed typos in patch description
>> - in ravb_probe() switch the hardware to reset mode just after phy
>>   initialization
>>
>> Changes in v2:
>> - none; this patch is new
>>
>>
>>  drivers/net/ethernet/renesas/ravb_main.c | 78 ++++++++++++++----------
>>  1 file changed, 46 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index 1cc1ecd8d6a8..434b4777de5e 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> [...]
>> @@ -2746,11 +2755,6 @@ static int ravb_probe(struct platform_device *pdev)
>>  	ndev->netdev_ops = &ravb_netdev_ops;
>>  	ndev->ethtool_ops = &ravb_ethtool_ops;
>>  
>> -	/* Set AVB config mode */
>> -	error = ravb_set_config_mode(ndev);
>> -	if (error)
>> -		goto out_rpm_put;
>> -
>>  	error = ravb_compute_gti(ndev);
>>  	if (error)
>>  		goto out_rpm_put;
>> @@ -2785,13 +2789,23 @@ static int ravb_probe(struct platform_device *pdev)
>>  		eth_hw_addr_random(ndev);
>>  	}
>>  
>> +	/* Set config mode as this is needed for PHY initialization. */
>> +	error = ravb_set_opmode(ndev, CCC_OPC_CONFIG);
> 
>    Hm... don't you need this at laest before calling ravb_read_mac_address()
> just above?

I asked myself this, haven't experienced issues w/ it while working on this
patch thus I kept it as is. In theory, yes, it should be above that call.
I'll move it there.

Thank you,
Claudiu Beznea

> 
>> +	if (error)
>> +		goto out_rpm_put;
>> +
>>  	/* MDIO bus init */
>>  	error = ravb_mdio_init(priv);
>>  	if (error) {
>>  		dev_err(&pdev->dev, "failed to initialize MDIO\n");
>> -		goto out_dma_free;
>> +		goto out_reset_mode;
>>  	}
>>  
>> +	/* Undo previous switch to config opmode. */
>> +	error = ravb_set_opmode(ndev, CCC_OPC_RESET);
>> +	if (error)
>> +		goto out_mdio_release;
>> +
>>  	netif_napi_add(ndev, &priv->napi[RAVB_BE], ravb_poll);
>>  	if (info->nc_queues)
>>  		netif_napi_add(ndev, &priv->napi[RAVB_NC], ravb_poll);
> [...]
> 
> MBR, Sergey

