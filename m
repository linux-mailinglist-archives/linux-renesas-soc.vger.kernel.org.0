Return-Path: <linux-renesas-soc+bounces-1160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 892EC815F34
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 14:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADD8D1C20DC4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 13:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851CF43ABF;
	Sun, 17 Dec 2023 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Eo1hNjZ4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B2943AB7
	for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Dec 2023 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5532b45c286so434023a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Dec 2023 05:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702818905; x=1703423705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LHXWjrSlj1U/EaS6SsHAe5QV70YZbTbi+3v3DGkj4PY=;
        b=Eo1hNjZ4t3sZAE0qtO56lRARknNwaALRnDjeSiLKq9uVqB9idn0f19sUFrMfsL4fjO
         wRqh5uPEwZUShhnlReo/tpqZaBxazzyXo/x9q+mWJ0kHJ3UC2dzyH2V4zJpOeKTTrOW0
         SIeA4Kfj/kiMLS6UEHEgbbPgYo2iYmrKTD2qxD5laYfsRVLfg+dF5bYAW52xSviTBDLc
         1hFt1ec7BLpCLwwx9z3iMEIA1Y0oLQQtPgOjRPWSw8y+z05Kr9VRGM7Tw+t6AZUNIfkP
         nnVE8yk6y5JYVGnHuo9XsBMdc2p4v8FHVTyxAYCKB1ycugQgLvCizjuEO/GaRKeHmsh8
         EbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702818905; x=1703423705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LHXWjrSlj1U/EaS6SsHAe5QV70YZbTbi+3v3DGkj4PY=;
        b=ljCg2DnWln0GDOdW20oJJz3PqomcrDtW0ksdQJqXDSoKN0XqIwebdI/4pKlxbLGl//
         4HxMAvMc6Iw4kp5cD8xrOFYTMnyWcGj4M+T3FimqnjYy35H5FMJorW9jttjrz0hKA+P/
         Q7UGpefPleHNA3eQmL5Z8yCar8OchZlGLNZ2wUZsRrJNlSvu86C+vRuGf6ItntiHjaq1
         V1qmnkHAQ0RsziEHfjIk1sthp/BGfVQPqzV9cXnycPZZCbGnGu2Os693gnyiLATu3sIk
         E1P5o/u5k0ZnxkdfZ6Qp/5GcsifVM8cBDqjRc211HUzVdooXKGsDAi3C5vGntSd83UxF
         El3A==
X-Gm-Message-State: AOJu0YwB/z/qjNycrZB7fYxG5nqlPv8uZEutl27YZRHk1U5uYulSKHX2
	yU4H7m6PAE3gi0mXfKX448/32g==
X-Google-Smtp-Source: AGHT+IGQ++bHMqUg6tjerPuRVUO/S+HMFsxSFGEN9NHX5/OUlH55jAaz3GemmVsVA1cJJd+8Elgx2A==
X-Received: by 2002:a50:cd16:0:b0:552:391c:c8e1 with SMTP id z22-20020a50cd16000000b00552391cc8e1mr1239635edi.107.1702818904868;
        Sun, 17 Dec 2023 05:15:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id el13-20020a056402360d00b005527de2aecfsm3183456edb.42.2023.12.17.05.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Dec 2023 05:15:04 -0800 (PST)
Message-ID: <ba18b668-94c0-4cab-9d2c-87ac6c3f8f8e@tuxon.dev>
Date: Sun, 17 Dec 2023 15:15:02 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 13/21] net: ravb: Set config mode in ndo_open
 and reset mode in ndo_close
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, p.zabel@pengutronix.de,
 yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com,
 geert+renesas@glider.be
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
 <20231214114600.2451162-14-claudiu.beznea.uj@bp.renesas.com>
 <78688143-e777-c98b-01eb-813f0fe67491@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <78688143-e777-c98b-01eb-813f0fe67491@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16.12.2023 19:28, Sergey Shtylyov wrote:
> On 12/14/23 2:45 PM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> As some IP variants switch to reset mode (and thus registers' content is
> 
>    Register.
> 
>> lost) when setting clocks (due to module standby functionality) to be able
>> to implement runtime PM and save more power, set the IP's operation mode to
> 
>    Operating.
> 
>> reset at the end of the probe. Along with it, in the ndo_open API the IP
>> will be switched to configuration, then operational mode. In the ndo_close
>> API, the IP will be switched back to reset mode. This allows implementing
>> runtime PM and, along with it, save more power when the IP is not used.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> [..]
> 
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index db9222fc57c2..31a1f8a83652 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> [...]
>> @@ -1821,13 +1845,19 @@ static int ravb_open(struct net_device *ndev)
>>  	if (info->nc_queues)
>>  		napi_enable(&priv->napi[RAVB_NC]);
>>  
>> +	/* Set AVB config mode */
>> +	error = ravb_set_config_mode(ndev);
>> +	if (error)
>> +		goto out_napi_off;
>> +
> 
>    I suspect this too belongs in ravb_dmac_init() now...

What I can do here is to keep PTP/GAC specific settings from
ravb_set_config_mode() in a separate function close to PTP setup and remove
ravb_set_config_mode() at all as ravb_dmac_init() switches anyway the IP to
config mode. But with this I don't know how the PTP/GAC will be influenced
as I don't have a setup to check it. From my memories, the commit that
introduces the setup of PTP when switching to config mode did this by
intention, so I'm not sure weather playing around with this is the way to
go forward. Do you remember something specific about this?

> 
> [...]
>> @@ -2875,19 +2886,30 @@ static int ravb_probe(struct platform_device *pdev)
>>  
>>  	device_set_wakeup_capable(&pdev->dev, 1);
>>  
>> +	/* Reset MAC as the module will be runtime disabled at this moment.
>> +	 * This saves power. MAC will be switched back to configuration mode
>> +	 * in ravb_open().
>> +	 */
>> +	error = ravb_set_reset_mode(ndev);
>> +	if (error)
>> +		goto out_netdev_unregister;
>> +
> 
>    I think this now races with the register_netdev() call above (the device
> can be opened before it returns)! Should be called before register_netdev()...
> 

Good point! Thanks!

> [...]
> 
> MBR, Sergey

