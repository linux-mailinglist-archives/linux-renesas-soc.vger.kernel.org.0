Return-Path: <linux-renesas-soc+bounces-2522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED0084F002
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 06:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 799921C246F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 05:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A0256B90;
	Fri,  9 Feb 2024 05:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Xmlafq33"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C446656B7C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 05:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707457726; cv=none; b=WSEptbwvAfQJg2rbqy01VJj89x1uwRuE/11qdrf7bfWayhNE57sMafkJNH5LcHFQoIqcx6rnjsQkn5qXVFYeFhjJxyaTzMYbeRqBo/pujhmo+b39aeNVSChI0RjuJH+hWz6I/9i1lpWvMsDzr0+UAV8+Sh/pwCM+vWg839HFXfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707457726; c=relaxed/simple;
	bh=nmD3BwatGhYAlv4NhN2ZIYh92q6PNgmm207o5l1juhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7l/8tck9Piw2AVVaAhs2GzMhlsr0yXck9OLGuHc4XCsBvxCVsTtQ4bb7DrjyDrABWrNdsUn2juYvth1IQGb6E/9w1AzZd+2ETA+oiXr85+D/KDhvn/CQvDUkffMO7hxhZxN7cZS/l0B3Uyrlo1oDd+gsd6CWRuO5WKto/8BeQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Xmlafq33; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4105006bf11so4694505e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 21:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707457722; x=1708062522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NxSyZICm/I5GO8I9p/NPQ1lnFZnR704Xte4TLK0i60g=;
        b=Xmlafq33YUb/YT8weqfjltgBZZVULw3HqtsvvVxDC5j4JVPoqC1q4GS7o/Oqy8v0Yd
         uxy9cpPpllAnun8rx9Rb32+54pfGSQJVMWiDpvtXSqXQb2VgmBEog4JCmrFHPGVsE4DN
         RRKBIO3o0AvNuDQ7o3LYFZYHtLWnRaQpYGiEVUF0r77P2zF/XpXW1mxNBrTPFQL+PilE
         eY03O5Dxuq/o7VT+IaywEEYwlkSef8Y+C2GqqwQSbVsUNwVgc+adV1LCtjeXEDrsI7Xp
         1upIy+uRi7idAmNU97alSBh/gLpeM3D0YkWDumwiv1+BxdtOowcVoYOJByxlXWUGXyfW
         94Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707457722; x=1708062522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NxSyZICm/I5GO8I9p/NPQ1lnFZnR704Xte4TLK0i60g=;
        b=B/SQQi72fghJz/ue5xVpWnoeHIGEh+T/sAnSRPBGqg9xOBaQNMLBeJ6Bf1AQuUmksD
         /yeTrNGqiBUxnwvbkQOBIkYOxXqu8PYwBRmjeaJNWJy6wXiWfABm7VVVndxcryVem4/9
         pguTbVz399yOpzonQNvl7DIMPvXlc/EtlV9M6jFS2VF9bMvHe8PIFdlZaThETg6mIabe
         MvM3LGZVvL2TS2BExSs4MtdYWq8XOQlovMYWkf2xvdqXU2nlK+3lZ4aUgLfyyRkmPyR2
         TiV6EKhDOzmcWcYXHWbeu0dzC20ObrZukOw6uwhocJ80ZPil21XP9Ttk6uKnSbrGUajL
         1FXg==
X-Gm-Message-State: AOJu0YzCm3tjv1804UxwAVjqkiDJ6caW6dg4IQdWx7uQUoCUheMn2kZK
	ApXKdkBEg9ECQIAnkbdK5LQ3hpEnM/1GXZKranXoiLmWaFcP2XLUrfevYzTzswA=
X-Google-Smtp-Source: AGHT+IGYS5H+2CjG8e6jjJum1vd6pG6x4LD1FMRK/cR4j9shs0jwQvPBVgwlnij9m2MjjRWGrY3K7A==
X-Received: by 2002:a05:600c:3d07:b0:40f:d34d:d4ea with SMTP id bh7-20020a05600c3d0700b0040fd34dd4eamr478127wmb.31.1707457721860;
        Thu, 08 Feb 2024 21:48:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtIS/aziom1k321wH/A41qtyDt1Byh9r1PFigPhj3XzdDU7dowCNjNpPCmR25NYAhwJ+Sm4r03jsSWazNajD2LKuS1irGUEHOyUyLJC7pQ/xsJ6L6vQPzHGAFAhhxQf0aLBUqLMEFQ4TyT9chaghAnfe5iCKfN5hwhQArRmd6m3ezITg6w/sfnUY5KVANbVbxLB8WV060t5cVs4mHL7D6xTCpF1m0fYDoKTxvfI2IWMK7Ud17waxvZ2NHArYpT71edj/gCUcBbvmwEbRs0/DH5YOhdPQhFu9K96fbdN5QxdP0pm0iYlSqJ6rHarUp02GbOuCNx0ad7Nfg=
Received: from [192.168.50.4] ([82.78.167.124])
        by smtp.gmail.com with ESMTPSA id bh6-20020a05600c3d0600b004103400259fsm1425125wmb.29.2024.02.08.21.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 21:48:41 -0800 (PST)
Message-ID: <13956279-3ab1-4eb8-b361-a0c79135cb56@tuxon.dev>
Date: Fri, 9 Feb 2024 07:48:38 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/5] net: ravb: Get rid of the temporary variable
 irq
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240207120733.1746920-1-claudiu.beznea.uj@bp.renesas.com>
 <20240207120733.1746920-2-claudiu.beznea.uj@bp.renesas.com>
 <c284aab3-faf0-969c-7256-5bc72afe7e3e@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <c284aab3-faf0-969c-7256-5bc72afe7e3e@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08.02.2024 22:43, Sergey Shtylyov wrote:
> On 2/7/24 3:07 PM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The 4th argument of ravb_setup_irq() is used to save the IRQ number that
>> will be further used by the driver code. Not all ravb_setup_irqs() calls
>> need to save the IRQ number. The previous code used to pass a dummy
>> variable as the 4th argument in case the IRQ is not needed for further
>> usage. That is not necessary as the code from ravb_setup_irq() can detect
>> by itself if the IRQ needs to be saved. Thus, get rid of the code that is
>> not needed.
>>
>> Reported-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> [...]
> 
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index 9521cd054274..e235342e0827 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -2611,17 +2611,20 @@ static int ravb_setup_irq(struct ravb_private *priv, const char *irq_name,
>>  		if (!dev_name)
>>  			return -ENOMEM;
>>  
>> -		*irq = platform_get_irq_byname(pdev, irq_name);
>> +		error = platform_get_irq_byname(pdev, irq_name);
>>  		flags = 0;
>>  	} else {
>>  		dev_name = ndev->name;
>> -		*irq = platform_get_irq(pdev, 0);
>> +		error = platform_get_irq(pdev, 0);
>>  		flags = IRQF_SHARED;
>>  	}
>> -	if (*irq < 0)
>> -		return *irq;
>> +	if (error < 0)
>> +		return error;
>>  
>> -	error = devm_request_irq(dev, *irq, handler, flags, dev_name, ndev);
>> +	if (irq)
>> +		*irq = error;
>> +
>> +	error = devm_request_irq(dev, error, handler, flags, dev_name, ndev);
>>  	if (error)
>>  		netdev_err(ndev, "cannot request IRQ %s\n", dev_name);
>>  
> 
>    Thanks for addressing my IRC comment! Tho the naming seems awful. :-)
>    I'd suggest to add a local variable (named e.g, irq_num) and use it to

I tried to avoid that...

> store the result of platform_get_irq[_byname]().
> 
> [...]
> 
> MBR, Sergey

