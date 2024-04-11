Return-Path: <linux-renesas-soc+bounces-4523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED088A16BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Apr 2024 16:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3144A1C221D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Apr 2024 14:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DA914F108;
	Thu, 11 Apr 2024 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BkR4hphc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A77922096
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Apr 2024 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712844473; cv=none; b=irSLKNjgAso9PrSEp9UhWqu+eqQy+GjpzRn4faP5N77okz94uN2qHCx72Zmx8Kf573v47kLRzmQFX+9yMxzew3s7UTX3s1w+lJyYWnN5cWX66nr2ywXgVror3vtJquMZ1vJuXbU8ELRkheoZzOlwoXRZ0L62VyQAfbtaLjQuoGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712844473; c=relaxed/simple;
	bh=PhXZR3X9Z0jJAcRMPU5mx53amxW3OqHiG4oniYQLYGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6uXh2nxSj+Lg/Ua8gbE4sq0pGyoZOZXXk/bX8XbGmOmXdOfkrdCrIcxYJny2cMpyiP2G1Ng3s2szQ/W3SRN1XjZh6kZBZGIOg0J9Fk4ktLqti2V83Y8mZ7iPmKGikJCnPUOafuLSB1b/JeMQspiSQg3UJrcqcsQwnqAhRKKcI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BkR4hphc; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56829f41f81so11477358a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Apr 2024 07:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712844469; x=1713449269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VgdSE8l3dcBqLC3G8N5zzXK/SZDTTcBzD6Qq1pKG9y0=;
        b=BkR4hphc99hvnAjG9zGj6p3CsU371IyN7CL1sM3sji/Jv1oYgSS5uiSDzeaK0kiaEy
         Raiw8IoRpVKGdJtKSms5AU7+l9AyzDFtk0O2SVCqkKl/jOZTVs8rV96NLbzk2EpeegQR
         B8jzZPbVr/vPhCh8NL8ItcB2Y6ZwbHnT9hF57KwL93R4HGJcKRmEULTYIy5RvjNu9PgU
         Il14nw3yJ1B78RpAmfDfGBz1eWGDRQvGfJpeoW3tGXa0/MayosR54rXIpriwmzUBPsuw
         F51JFoe80sFay0y63TMHbpNPFaS0WllMZIkB2QtZt4Ac8utgL943VmVEHpkG8C4nqetM
         p4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712844469; x=1713449269;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgdSE8l3dcBqLC3G8N5zzXK/SZDTTcBzD6Qq1pKG9y0=;
        b=tRKUMKr2a9h7UgCtnvu905AjKNavcq2wozK2HyPX6RJTljs8S9uldBdgQObFs/8Vt1
         2nCNiS7VXfWD33w7QU4n6nRycEZiot6i5PCsPdyh5riTXPnyR2wMj5gpXh6eRPzdmosz
         D8JavdJtS6M9xbfg6vZlcdr7jx8ir3wF0oYjvNO4BSMRhnAdrma210LpDMLCSK5oUbgQ
         NFwOgy4VfzCa7KuQEFdIV00s5YLFZcv+eQ+iPRafeGBuYOSZy3YpJcO8NHaW+KoQJEy4
         KiO7YpwkqJNKWJJ+HlF7dxmEBTKXsIfxVv6uUxHRlDZ4MRVxupWywnPiedJjdAv/INax
         vjbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2KxbwvmpEIHoLoB/33eRmqomx/vCpz3a5ytdMHPwusqILFYM1O3R8wUYkgjy8G1f9fz+Uz/q/ZoS0ZjCW0QTlCiszuiq/fylnUkS1ouFLZkE=
X-Gm-Message-State: AOJu0YzFnTD4JK5ZXI8gwp1xkoOGNlQ/KaFZoxHNakmppPE9JNUCJedE
	laDBv/P1EaeVCBegs+yTsl4pwMMMjccCffdPBzVzTaNgQwHVj1/0TWwZXwKtwuw=
X-Google-Smtp-Source: AGHT+IGUrQB/0MjUD7llvUXriWiDfuuYb7dXQBYnYx7JBzZnkaPt8lUa+NLcrCRa9tX3gnu/TOwRDw==
X-Received: by 2002:a17:907:7283:b0:a52:2e53:b041 with SMTP id dt3-20020a170907728300b00a522e53b041mr89190ejc.65.1712844468844;
        Thu, 11 Apr 2024 07:07:48 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id jw24-20020a170906e95800b00a51adace6ebsm791532ejb.79.2024.04.11.07.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 07:07:48 -0700 (PDT)
Message-ID: <7985bafe-80ff-412c-b6e5-6db6da6b8323@tuxon.dev>
Date: Thu, 11 Apr 2024 17:07:46 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 04/10] watchdog: rzg2l_wdt: Check return status
 of pm_runtime_put()
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
Cc: wim@linux-watchdog.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
 <20240410134044.2138310-5-claudiu.beznea.uj@bp.renesas.com>
 <f77157c1-45b6-40b8-962f-2992717615ac@roeck-us.net>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <f77157c1-45b6-40b8-962f-2992717615ac@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10.04.2024 19:41, Guenter Roeck wrote:
> On Wed, Apr 10, 2024 at 04:40:38PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> pm_runtime_put() may return an error code. Check its return status.
>>
>> Along with it the rzg2l_wdt_set_timeout() function was updated to
>> propagate the result of rzg2l_wdt_stop() to its caller.
>>
>> Fixes: 2cbc5cd0b55f ("watchdog: Add Watchdog Timer driver for RZ/G2L")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v8:
>> - none
>>
>> Changes in v7:
>> - none
>>
>> Changes in v6:
>> - none
>>
>> Changes in v5:
>> - none
>>
>> Changes in v4:
>> - none
>>
>> Changes in v3:
>> - none
>>
>> Changes in v2:
>> - propagate the return code of rzg2l_wdt_stop() to it's callers
>>
>>
>>  drivers/watchdog/rzg2l_wdt.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
>> index d87d4f50180c..7bce093316c4 100644
>> --- a/drivers/watchdog/rzg2l_wdt.c
>> +++ b/drivers/watchdog/rzg2l_wdt.c
>> @@ -144,9 +144,13 @@ static int rzg2l_wdt_start(struct watchdog_device *wdev)
>>  static int rzg2l_wdt_stop(struct watchdog_device *wdev)
>>  {
>>  	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>> +	int ret;
>>  
>>  	rzg2l_wdt_reset(priv);
>> -	pm_runtime_put(wdev->parent);
>> +
>> +	ret = pm_runtime_put(wdev->parent);
>> +	if (ret < 0)
>> +		return ret;
> 
> Nit:
> 	return pm_runtime_put(wdev->parent);
> 
> would have been sufficient.
> 

pm_runtime_put() may return 1 if the device is already suspended. Further
explained in v1 of this series:

https://lore.kernel.org/all/92db308f-075c-4799-9777-5bc14438ce68@tuxon.dev/

> Nevertheless,
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
>>  
>>  	return 0;
>>  }
>> @@ -163,7 +167,10 @@ static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int time
>>  	 * to reset the module) so that it is updated with new timeout values.
>>  	 */
>>  	if (watchdog_active(wdev)) {
>> -		rzg2l_wdt_stop(wdev);
>> +		ret = rzg2l_wdt_stop(wdev);
>> +		if (ret)
>> +			return ret;
>> +
>>  		ret = rzg2l_wdt_start(wdev);
>>  	}
>>  
>> -- 
>> 2.39.2
>>

