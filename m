Return-Path: <linux-renesas-soc+bounces-1482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C93AD829B0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 14:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4797E2861AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9504948CC5;
	Wed, 10 Jan 2024 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mhD0fveQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B171548CC3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-336c5b5c163so2509924f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 05:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704892659; x=1705497459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vszx2G9uELuU9hK0zj2S4/o3kowknqBc1/GUoklXrQI=;
        b=mhD0fveQa7CF90Ky9sh1YCxbb3rlxicaqTGfktrGiPCkLetzcuZ2kkJjWINHjNedZi
         /eTXv5QcR1H47zBlFYItCeuJBTWHnORKSaiCCf+AWv6wTMj0KQpvF+q2aRElBf9TPIfa
         nPH6QwJfdC7hb9FmhtgG7aR891OF4R7zvwgTcBFewmaOnw9Mlu6ONQ9CSBrX9IRleyj7
         cFeBBIPgAIVG9WOpPxmMKHmnHQx5y1cyFybyO/hRBXsoIOw5KWJIBrnuGT5xT6m7dCG4
         dLgkYZjY3Rw4FJ67pQEcHK5Xxf2+eJgAYWVh/++CuzZ3yplVokvyfRuignYc2bLvh3ss
         xJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704892659; x=1705497459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vszx2G9uELuU9hK0zj2S4/o3kowknqBc1/GUoklXrQI=;
        b=FgrawfCxzdRnqntPV3Z9QM4cjKyQ2MlZrcaOymKK+UpcqdHiZqlmju3oMO3b3yGUbc
         FbH4KcbTz3qtiQ8IP7pLU0IZTgT0AsLIXuwX/VL1F0gdmOkPiV/bN9McLQkmHY3uHUFQ
         vfibKw5jsfJrp0AisJj+rFTft13Z78WhYgYjD6cS7jY8SWsNTRZcm00zpWFTYdpD9c5E
         QRaqAoK4joeZXuo91kiWHO5/HDvOJUqIkgc6lJP2Px8G9CudtMvUgxMrqsoMClPJcYDW
         l9uN95jIhXystY7XxIumKx8KkM4ywduINp5caOqr8t+lkfYBUQfwPjbAli2AWipMQUqD
         wUMg==
X-Gm-Message-State: AOJu0Yy9fsmPXkgmZPAhtsTD3WW2HE4C5Qjl8D+/EUZzUYSLi0rHW+bD
	TM8Lj2G1wKDVmbG5/MQJp1mrVkXCDZ2CUA==
X-Google-Smtp-Source: AGHT+IG0xqvK/uM4BvzNCZURD1QaAj22eknZfkbaekHf4jMRg2ppp46KcuhVFANDknFKAjAN6yVkKg==
X-Received: by 2002:adf:b182:0:b0:336:5b1e:ee66 with SMTP id q2-20020adfb182000000b003365b1eee66mr20524wra.31.1704892658708;
        Wed, 10 Jan 2024 05:17:38 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id z15-20020adff74f000000b0033740e109adsm4920854wrp.75.2024.01.10.05.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 05:17:38 -0800 (PST)
Message-ID: <aed6534b-ad5e-4f5c-9861-9a784968adcc@tuxon.dev>
Date: Wed, 10 Jan 2024 15:17:36 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 17/19] net: ravb: Return cached statistics if
 the interface is down
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, p.zabel@pengutronix.de,
 yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
 <20240105082339.1468817-18-claudiu.beznea.uj@bp.renesas.com>
 <af5ab82e-5904-c33b-983e-b37844dab3f5@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <af5ab82e-5904-c33b-983e-b37844dab3f5@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08.01.2024 22:22, Sergey Shtylyov wrote:
> On 1/5/24 11:23 AM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Return the cached statistics in case the interface is down. There should be
>> no drawback to this, as cached statistics are updated in ravb_close().
>>
>> The commit prepares the code for the addition of runtime PM support.
>>
>> Suggested-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> [...]
> 
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index 76035afd4054..168b6208db37 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -2117,6 +2117,9 @@ static struct net_device_stats *ravb_get_stats(struct net_device *ndev)
>>  	const struct ravb_hw_info *info = priv->info;
>>  	struct net_device_stats *nstats, *stats0, *stats1;
>>  
>> +	if (!(ndev->flags & IFF_UP))
> 
>    Well, I guess it's OK to read the counters in the reset mode... BUT
> won't this race with pm_runtime_put_autosuspend() when its call gets added
> to ravb_close()?

I re-checked it and, yes, this is true. A sync runtime suspend would be
better here. But, as of my current investigation, even with this
ravb_get_stats() can still race with ravb_open()/ravb_close() as they are
called though different locking scheme (ravb_open()/ravb_close() is called
with rtnl locked while ravb_get_stats() can be called only with
dev_base_lock rwlock locked for reading).

A mutex in the driver should to help with this.

Thank you,
Claudiu Beznea

> 
>> +		return &ndev->stats;
>> +
>>  	nstats = &ndev->stats;
>>  	stats0 = &priv->stats[RAVB_BE];
>>  
> [...]
> 
> MBR, Sergey
> 

