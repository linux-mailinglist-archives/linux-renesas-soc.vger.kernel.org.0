Return-Path: <linux-renesas-soc+bounces-12692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF13A21F4C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E0053A1D46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 14:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5341AE01B;
	Wed, 29 Jan 2025 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fUknXNfd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E397E9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jan 2025 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738161370; cv=none; b=CRC5agFgV/bgS6X8IqGQvTSn2P/1vaoZhpp/d+U1UHj/CVEzaGdvJo5ye+pIlEy2laBvbH+UvlSM1s+wGKxfhJ+GK97caLr2cKtT/nwSaEcF8ny7jz+xwzoRzmBt2/c9nX20q940VA9bUbEwIz2TWvDUoT9j32y+gcxjrnozhO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738161370; c=relaxed/simple;
	bh=UI7BF2vJZTjlFV2hITe8WmVRApBVcG3adoozoekMENs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZquqTtZdCNdsCdrSjy8B+kqLRRm1PBSEUghjvGl8n2w3IDQCtrs8bdkEtARpdVtYZhiP/K9kt9N9YldnwByrJ3x6uVhuC1BIk843uqS6YzOHBfWSMgFPQRFPOLmZ8tanUFLinvPSYr9dPg5Qk+C5+HmkKw7FKT07H09q0gpMAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fUknXNfd; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab68a4ab074so665203366b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jan 2025 06:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738161365; x=1738766165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dREqLTaUkaXBI3BB09CWv/OKA4VNGyMw6wQOmVv2X1c=;
        b=fUknXNfdZ6ve5IlFQzWJ7q1FCYz1/RvFpq7SMUqjJjtWIFktvLcD3EOirvDikjoFpL
         7r/xGG5fI2XvYqq2ZyUIbgBEzfvBnDNnmmumWWDBxQeIcE4LBXENvFdthg0Bomo/AD0x
         iPVfsd4X488coUBldTR1JNeK9ZtrPiNqtkW1ZZRbUc5nKQkPjiFkYUI3xE3pXgwAmBbH
         9i5HKiXMWeTHRjaRbYtYkk2nMQ7Jw13vztBIGT1eqKnsewtKF7dDPOuxePyM5sb7/DyS
         jnk+l6qvIrD9qqYE5w3JW9QxGUc6g0QD7PR1PWXZu0mR8zKRLgncYRr1aiLuFclvqxg9
         Sdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738161365; x=1738766165;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dREqLTaUkaXBI3BB09CWv/OKA4VNGyMw6wQOmVv2X1c=;
        b=DVl7PTtopi1SnNF2F6Wjd4bF+gw8+4YOKVc3daZeWRDSyPm82mxWrSgdR7JE2TPmYC
         vdxZCZqgO5UZfuLHqVuS5c2hdeD3MiNLeF/DeVMCXz87iZw1wWmEVb78XTDTSnAiUqIF
         /ew7oMh/3ZcVjFO0FX9CsQB7q1QghQff0ydH98MfMgcsFgWhYOO9jtR9ktAV3kpijI4i
         1Xg4uYeL5Oj+DFs/pIjI3jIVgiY5ns3zSuU+RgG6mQgAJUGeQSPJBMU+8DkaeRwZqGKu
         1E2BqXKGKY18PNNn4gOAY6t3ZkTwNjmgxic9nC6iRk5R6ocippPSRL+gdj3XSjAbvBuC
         tITg==
X-Forwarded-Encrypted: i=1; AJvYcCWlKfV8QwJpbd43HR5oooBGWfAqyICwU92cT0gSK9I/5s//uBbh1uzOgS1caTJI17F0Y2ktU7d1QufJssXX1GQ29g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoqxJpjv2AIlK3oOPzuCDUw8AhIZPl2qM2x+FA9Gsr58GxNr8M
	9KoeFcRzSWzpdbohSV/vCMsKOdXL3aOrMN66IcM0m3IBPqnzyI8E9YKWxPP0wuI=
X-Gm-Gg: ASbGncs5qjdx57xr/JR1wC/0JV6AOMTMjIUCXWFb/srKMVMZK48MiatMjlRLqp8ODYE
	0cb0CklZyZLpig1HZZyQAE4HlL6Rvc6ACX8Suw6vw7hEscxi6kxCf5XDBB7dpKjpy/xnc0p9C59
	OiWGG8RPh0/CARCYqdhno/pjXnnT2QGDI+urjxSuoZlxPzEUi+v7HpfNR115AmBz990hy9duH0s
	824s1mWxWgLdHkMo4BOi4YLz1qJs7KVecnTHAF+oOr+T9if7K/JekZG6GYCNZcHtO6dWnOvH2dW
	ENiGpFJYFvIQI7z5eRuyRAs=
X-Google-Smtp-Source: AGHT+IGLJBQE8tLxWwgvNgTFG/uBHrI5LPO+emzCOIWKd77Tbc+R5gOQ15j5uC93XR7lao+lO2hpTQ==
X-Received: by 2002:a05:6402:34c8:b0:5d9:84ee:ff31 with SMTP id 4fb4d7f45d1cf-5dc5efa8c21mr8157746a12.3.1738161364504;
        Wed, 29 Jan 2025 06:36:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab69a26dc94sm664205966b.166.2025.01.29.06.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:36:03 -0800 (PST)
Message-ID: <eb131a53-a4d3-4dcf-9e04-8dc3da84c3a6@tuxon.dev>
Date: Wed, 29 Jan 2025 16:36:01 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] net: ravb: Fix missing rtnl lock in suspend
 path
To: Kory Maincent <kory.maincent@bootlin.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>
References: <20250123-fix_missing_rtnl_lock_phy_disconnect-v2-0-e6206f5508ba@bootlin.com>
 <20250123-fix_missing_rtnl_lock_phy_disconnect-v2-1-e6206f5508ba@bootlin.com>
 <e39ac785-9d4e-43d1-9961-d6d67570ff49@bp.renesas.com>
 <20250123183358.502e8032@kmaincent-XPS-13-7390>
 <20250127112850.05d7769b@kmaincent-XPS-13-7390>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250127112850.05d7769b@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27.01.2025 12:28, Kory Maincent wrote:
> On Thu, 23 Jan 2025 18:33:58 +0100
> Kory Maincent <kory.maincent@bootlin.com> wrote:
>  
>>>>  
>>>> @@ -3247,7 +3253,9 @@ static int ravb_resume(struct device *dev)
>>>>  
>>>>  	/* If WoL is enabled restore the interface. */
>>>>  	if (priv->wol_enabled) {
>>>> +		rtnl_lock();
>>>>  		ret = ravb_wol_restore(ndev);
>>>> +		rtnl_unlock();
>>>>  		if (ret)
>>>>  			return ret;
>>>>  	} else {
>>>> @@ -3257,7 +3265,9 @@ static int ravb_resume(struct device *dev)
>>>>  	}
>>>>  
>>>>  	/* Reopening the interface will restore the device to the working
>>>> state. */
>>>> +	rtnl_lock();
>>>>  	ret = ravb_open(ndev);
>>>> +	rtnl_unlock();
>>>>  	if (ret < 0)
>>>>  		goto out_rpm_put;
>>
>>> I don't like the multiple lock/unlock calls in each function. I think v1
>>> was better, where we take the lock once in each function and then unlock
>>> when it is no longer needed or when we're about to return.
>>
>> You will need to achieve a consensus on it with Claudiu. His point of view has
>> that the locking scheme looks complicated.
>>
>> On my side I don't have really an opinion, maybe a small preference for v1
>> which is protecting wol_enabled flag even if it is not needed.
> 
> Claudiu any remarks?

Sorry for the delay. I still consider it safe as proposed (taking the lock
around the individual functions) due to the above reasons:

1/ in ravb_suspend():
- the execution just returns after ravb_wol_setup()
- there is no need to lock around runtime PM function
  (pm_runtime_force_suspend()) as the execution through it reach this
  driver only though the driver specific runtime PM function which is a nop
  (and FMPOV it should be removed)

2/ in ravb_resume():
- locking only around ravb_wol_restore() and ravb_open() mimics what is
  done when the interface is open/closed through user space; in that
  scenario the ravb_close()/ravb_open() are called with rtnl_lock() held
  through devinet_ioctl()
- and for the above mentioned reason there is no need to lock around
  pm_runtime_force_resume()

Please follow the approach preferred by the maintainers.

Thank you,
Claudiu

> If not I will come back to the first version as asked by Paul who is the
> Maintainer of the ravb driver.
> 
> Sergey have asked to remove the duplicate of the if condition.
> Paul is this ok for you?
> 
> @@ -3245,19 +3250,21 @@ static int ravb_resume(struct device *dev)
>         if (!netif_running(ndev))
>                 return 0;
>  
> +       rtnl_lock();
>         /* If WoL is enabled restore the interface. */
> -       if (priv->wol_enabled) {
> +       if (priv->wol_enabled)
>                 ret = ravb_wol_restore(ndev);
> -               if (ret)
> -                       return ret;
> -       } else {
> +       else
>                 ret = pm_runtime_force_resume(dev);
> -               if (ret)
> -                       return ret;
> +
> +       if (ret) {
> +               rtnl_unlock();
> +               return ret;
>         }
>  
>         /* Reopening the interface will restore the device to the working
> state. */
>         ret = ravb_open(ndev);
> +       rtnl_unlock();
>         if (ret < 0)
>                 goto out_rpm_put;
> 
> 
> Note: Sergey, I have received your mail as spam. 
> 
> Regards,


