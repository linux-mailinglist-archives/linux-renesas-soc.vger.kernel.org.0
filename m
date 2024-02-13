Return-Path: <linux-renesas-soc+bounces-2681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD4F852EC6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 12:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53F8DB21B33
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 11:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13824364A3;
	Tue, 13 Feb 2024 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hv8ICW/N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1882207A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 11:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707822439; cv=none; b=awLtV0ZO7q/S3ATRgwVmN9Czo+HJeYRMrz56NOoZ4bElQKWhiYdScAdnxnjMmxgI4weogaWwM9W1zaHgug8lRs2mpY/qh7Oy9dchfzYckoxCQHt1HDcIN9TjMlHMZ5A5ubjzNbzkwSDQUPwFs/+uuOJBx5SI282rxsQCDib2iHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707822439; c=relaxed/simple;
	bh=EJiq/3eOMVN/mwk/1pTsOgbMPj5bpFavWkPJ5KumQS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zt4YGwliYI5BnMwjYUemCYL7XuqfaCL4r4RzBtG26AyosO5HI8dYvv2Rn8/8gF1Gw8fZdm66e/H5zriZSi3+rFtFno9fesdMBOFjSNpi+zEkQu9aCzV3dDq+tvS85jafgiTw6loKrBPWu3rjJNXg76y5DeU9dhawtfopDtiNXHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hv8ICW/N; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d0512f6e32so59461261fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 03:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707822434; x=1708427234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/zKT384EV3fgGJG3dzF/8UMaxshsisXRkr2qLul78o=;
        b=hv8ICW/NkIjx3qpUNI1cRRb0AGtQ+v+ax2yEqx+CQvICQHbQPGGy4XJ8l5fiZooF1J
         i9cf25jXCM5Aygn0WIvcZ1msCZRMFccHNOfz+pGSWeRtedthqyYrYU+fN9MnlF3f22El
         SRqGfzlGaYkrl2L+UqJVRz0rZ4/xpyrlYaQQsN2UvmHvhTxopiWv3JUMEudD3XZbyBua
         5hcg+8HiED9dZ4MBDRwYUpx5MKDtWRwzzEva0v7MR/RAiToWxVo3+ijEal6DYznKb/cP
         XTuC5VKQtVxSG4y9Fsr8RdpXQdKDOBEatQ1ULkkahoHtRfJMUx20oCZz11tPOsC/gq6h
         FONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707822434; x=1708427234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/zKT384EV3fgGJG3dzF/8UMaxshsisXRkr2qLul78o=;
        b=AhlbpOEDmMoqnx0Vy3E/eHVPofYduAT2y1sZdVr1CZXu9sUBhVlRngxdqfV5j3qaLN
         xuTsSytXWJpfu4nL1BfMCWFcOVvuuntwtJP24YaRVHlkOdPIJOgaTkKBTMlCK/cG4iUG
         3bZVDk5NfBfjKt8BzQPlhuEgiNc3OSbSUJYI/URnHz+/UTLSQ8g8gVPgK+IyZoEThxYf
         UfGP3RTY/abbs9CGhUFD1nhS90WYzzM0PcuSAPo89DllxSs3RRHzEmz1IDO83SoV9i8D
         u77fbGPsrXUsqcgmwpUY/yOro/DUssbKZJ6AlZmCJtxN8FmlR6F8zSRZBBDaobdzHNJx
         5+pw==
X-Forwarded-Encrypted: i=1; AJvYcCUNkYA7v9VYon8WmbIWh/0pVdAeNrYQwFGFVXphcKn5bFvnR+JNIO3OvhHGunGURH3Tq7p+oGrjttmeMNuxk3DMH6uyjYxlB6BsrW4oQdIg3y0=
X-Gm-Message-State: AOJu0YwSr/AGa1QhnCgio23j1ncTUQZAdiP+MvL7thG6TGomkzOsEo4W
	3OrA4St63PWpJEy65uXC7rJtkka9ujKF3MRIxXoenFuXe0YJSoPmeInihAcjvq8=
X-Google-Smtp-Source: AGHT+IG0S4ixvhFXmER+Y/YPFJEb/yoR1U28DDXY6FkIvHyLcTy6vY+4OwPue/AvNfLYEznZB11r5A==
X-Received: by 2002:a2e:b176:0:b0:2d0:cd7c:92d0 with SMTP id a22-20020a2eb176000000b002d0cd7c92d0mr5990321ljm.32.1707822433893;
        Tue, 13 Feb 2024 03:07:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUF6qG0rasGj9YvQl8TQEiGJwqjhnKyjTN8fknuY3sWhfCxGwjN0QTQRBgDPHA2XxaA5+jUYqowur3AzwFHCekwihPAkb4rQEWUSlNQkeKZuyltktVsFSvIpE2nJWFIJ2a10HU75CfUIkmATpuMPJKh447aZXGLtjUhh6ZSHwa2WjzJ8Vk5AnxpJ6Mq9Yh47NaWj9XK4P4nGiuUOMFhe61oHfMI2xb2B0m0NejKYecd+e+fFPMNIpOvude+NGvQvhtJ3U6kd+fdjnb7vBYKjT4HnP9tf6nMRK0i2qqdxxhz3qI6e6cHxmsNmZyZ4TrnPLaPRUmLKeLiarkVN8FYIMVHSkxWqwkOaSVPHvaZ
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id c8-20020adfef48000000b0033b47ee01f1sm9199341wrp.49.2024.02.13.03.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 03:07:13 -0800 (PST)
Message-ID: <368ca0a8-a005-4371-a959-297fd4f58cb1@tuxon.dev>
Date: Tue, 13 Feb 2024 13:07:12 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 5/6] net: ravb: Do not apply features to
 hardware if the interface is down
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240213094110.853155-1-claudiu.beznea.uj@bp.renesas.com>
 <20240213094110.853155-6-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB112698DE07AAA9C535776805D864F2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB112698DE07AAA9C535776805D864F2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 13.02.2024 12:13, Biju Das wrote:
> 
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Tuesday, February 13, 2024 9:41 AM
>> Subject: [PATCH net-next v3 5/6] net: ravb: Do not apply features to
>> hardware if the interface is down
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Do not apply features to hardware if the interface is down. In case
>> runtime PM is enabled, and while the interface is down, the IP will be in
>> reset mode (as for some platforms disabling the clocks will switch the IP
>> to reset mode, which will lead to losing register contents) and applying
>> settings in reset mode is not an option. Instead, cache the features and
>> apply them in ravb_open() through ravb_emac_init().
>>
>> To avoid accessing the hardware while the interface is down
>> pm_runtime_active() check was introduced. Along with it the device runtime
>> PM usage counter has been incremented to avoid disabling the device clocks
>> while the check is in progress (if any).
>>
>> Commit prepares for the addition of runtime PM.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - updated patch title and description
>> - updated patch content due to patch 4/6
>>
>> Changes in v2:
>> - fixed typo in patch description
>> - adjusted ravb_set_features_gbeth(); didn't collect the Sergey's Rb
>>   tag due to this
>>
>> Changes since [2]:
>> - use pm_runtime_get_noresume() and pm_runtime_active() and updated the
>>   commit message to describe that
>> - fixed typos
>> - s/CSUM/checksum in patch title and description
>>
>> Changes in v3 of [2]:
>> - this was patch 20/21 in v2
>> - fixed typos in patch description
>> - removed code from ravb_open()
>> - use ndev->flags & IFF_UP checks instead of netif_running()
>>
>> Changes in v2 of [2]:
>> - none; this patch is new
>>
>>
>>  drivers/net/ethernet/renesas/ravb_main.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c
>> b/drivers/net/ethernet/renesas/ravb_main.c
>> index b3b91783bb7a..4dd0520dea90 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -2566,15 +2566,23 @@ static int ravb_set_features(struct net_device
>> *ndev,  {
>>  	struct ravb_private *priv = netdev_priv(ndev);
>>  	const struct ravb_hw_info *info = priv->info;
>> -	int ret;
>> +	struct device *dev = &priv->pdev->dev;
>> +	int ret = 0;
>> +
>> +	pm_runtime_get_noresume(dev);
>> +
>> +	if (!pm_runtime_active(dev))
>> +		goto out_set_features;
> 
> This can be simplified, which avoids 1 goto statement and
> Unnecessary ret initialization. I am leaving to you and Sergey.
> 
> 	if (!pm_runtime_active(dev))
> 		ret = 0;
> 	else
> 		ret = info->set_feature(ndev, features);
> 
> 	pm_runtime_put_noidle(dev);
> 	if (ret)
> 		goto err;
> 
> 	ndev->features = features;
> 
> err:
> 	return ret;
> 

I find it a bit difficult to follow this way.

Thank you,
Claudiu Beznea

> Cheers,
> Biju
> 
>>
>>  	ret = info->set_feature(ndev, features);
>>  	if (ret)
>> -		return ret;
>> +		goto out_rpm_put;
>>
>> +out_set_features:
>>  	ndev->features = features;
>> -
>> -	return 0;
>> +out_rpm_put:
>> +	pm_runtime_put_noidle(dev);
>> +	return ret;
>>  }
>>
>>  static const struct net_device_ops ravb_netdev_ops = {
>> --
>> 2.39.2
> 

