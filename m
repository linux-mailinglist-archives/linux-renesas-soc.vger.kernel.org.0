Return-Path: <linux-renesas-soc+bounces-1157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAA8815F08
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 13:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EEFE282AFE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 12:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF93D42ABB;
	Sun, 17 Dec 2023 12:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FEq67YBj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7100D41C63
	for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Dec 2023 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40d12ade25dso7253025e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Dec 2023 04:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702816841; x=1703421641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GU80QkwXBYjxwV+Vd0WaRyZK1HPqtvKgdIz4AA7eqAw=;
        b=FEq67YBjdR1Az4Txg3McEbVjSzhu4e/M4AaNKnRMidF1qDOT28kDFDUuK9XPbjPCwu
         SjhbZRG/fzxhZSiPi2HJIg9gsOOiWroot4EoSPTjCAVf42EFjmkVTl4/3qGPikD32ukf
         D4YrIWFqYoMlDr6Ayr7MUQEmPsQ1qJDbyZO/e99Hx3tYnOWw8+XhN4itDeuLC5W+KB/l
         aCJYufdnM2951+IiCHBBJqkT2vb4HfGO/1UvLcjsBT5SujoSEnKbQcEWeG/bKnqecpmx
         +TsZXbn6ZnXu2vuyBZ09fSj3ze6UVmHLFfDaIjIZQ1zi90cqkPjS1++Jfoa/aUbVltg7
         Xzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702816841; x=1703421641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GU80QkwXBYjxwV+Vd0WaRyZK1HPqtvKgdIz4AA7eqAw=;
        b=AOxUcpOl9REukcGdQLWJAlAj4g3Q85m8jvXFIdQUyftTCnqyUfb3Jc96NaqU5T4L6N
         uJp0eYeHL9ytZ0wQeZ15gFRG0WmM4e77rzcnQdonXK0onqmVGDC3YNtdhOclKuk+cX+A
         cNul2Zqa0kJ6e60uKODs22JVyiTRDgDBbUJTCuxWUJ8G4e0h/hCN65QEvxdiYXkiszJn
         WZouEcty3WUXMdEItp6sMC8GapmtWOcLydFXVl/E9QKbaZldEtlxHeTxtvRCOnOLzrno
         MKUV48KsTh330WQi88DpinEIIZFGL7uZ+82spTtoNeoHYLQ1Unv7e36sXpYguOk/gGMD
         nCow==
X-Gm-Message-State: AOJu0YwQLN/7Jceq5HXNTIVqiXmaQd10tX+Ip72x9pN25yZOd8s8W3pO
	iHKXOOT5IgnU0vGVzdct2PYGSw==
X-Google-Smtp-Source: AGHT+IEHeiYdvXeVpGnCpcW5Gz1VHGVmBxt4e1d3/L8RxTCjpc/8JFEXRE5benjpM3Yr6MaJuNyaEQ==
X-Received: by 2002:a05:600c:3b29:b0:40c:3290:7b80 with SMTP id m41-20020a05600c3b2900b0040c32907b80mr7550212wms.138.1702816841521;
        Sun, 17 Dec 2023 04:40:41 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c4e9200b0040d18ffbeeasm370432wmq.31.2023.12.17.04.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Dec 2023 04:40:41 -0800 (PST)
Message-ID: <53c90a2a-c43b-40e7-a9b2-55aab55541d7@tuxon.dev>
Date: Sun, 17 Dec 2023 14:40:39 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 09/21] net: ravb: Split GTI computation and
 set operations
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
 <20231214114600.2451162-10-claudiu.beznea.uj@bp.renesas.com>
 <3e8f65e3-3aab-ddf4-2b05-16b275af6021@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <3e8f65e3-3aab-ddf4-2b05-16b275af6021@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16.12.2023 18:38, Sergey Shtylyov wrote:
> On 12/14/23 2:45 PM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> ravb_set_gti() was computing the value of GTI based on the reference clock
>> rate and then applied it to register. This was done on the driver's probe
>> function. In order to implement runtime PM for all IP variants (as some IP
>> variants switches to reset operation mode (and thus the register's content
> 
>    Again, operating mode...
> 
>> is lost) when module standby is configured through clock APIs) the GTI was
> 
>    The GTI what? Setup?
> 
>> split in 2 parts: one computing the value of the GTI register (done in the
>> driver's probe function) and one applying the computed value to register
>> (done in the driver's ndo_open API).
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> [...]
> 
>> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
>> index e0f8276cffed..76202395b68d 100644
>> --- a/drivers/net/ethernet/renesas/ravb.h
>> +++ b/drivers/net/ethernet/renesas/ravb.h
>> @@ -1106,6 +1106,8 @@ struct ravb_private {
>>  
>>  	const struct ravb_hw_info *info;
>>  	struct reset_control *rstc;
>> +
>> +	uint64_t gti_tiv;
> 
>    Please use the kernel type, u64; uint64_t is for userland, IIRC.

I just kept the initial type here. Anyway, uint64_t should translate to u64
AFAICT.

Looking at it again the field here is enough to be 32 bit as the register
field is no longer than that. It is needed on 64 bits when checking the
ranges in compute function.

> 
> [...]
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index d7f6e8ea8e79..5e01e03e1b43 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -1750,6 +1750,51 @@ static int ravb_set_reset_mode(struct net_device *ndev)
>>  	return error;
>>  }
>>  
>> +static int ravb_set_gti(struct net_device *ndev)
>> +{
> [...]
>> +	/* Request GTI loading */
>> +	ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
>> +
>> +	/* Check completion status. */
>> +	return ravb_wait(ndev, GCCR, GCCR_LTI, 0);
> 
>    Is this really necessary?

I've just updated it to respect the manual specifications. Please let me
know if you want me to drop it. For this series it should be harmless
keeping it as it was previously (I will double check it).

> 
> [...]
>> @@ -1767,6 +1812,10 @@ static int ravb_open(struct net_device *ndev)
>>  		goto out_napi_off;
>>  	ravb_emac_init(ndev);
>>  
>> +	error = ravb_set_gti(ndev);
>> +	if (error)
>> +		goto out_dma_stop;
>> +
> 
>    Hm... belongs in ravb_dmac_init() now, as it seems... 

Isn't it PTP specific?

> 
> [...]
> 
> MBR, Sergey

