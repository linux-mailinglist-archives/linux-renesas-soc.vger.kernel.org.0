Return-Path: <linux-renesas-soc+bounces-8379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89256960C37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 15:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D9E1F22BF9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 13:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7001C4607;
	Tue, 27 Aug 2024 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Zzwtqdhs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69D21BFDEF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724765704; cv=none; b=e0aDRwdu+kUbQ6k0SOMzMgWxkmM3SGA2kpXRZVPbVsXUljsV+ec4TklHcIVSpwA2B9w/OjtgeIMkxODz8erNhz7gH+X++tMNkw3HU/YMUP8924WsI4Aa1U+z8RAdSqZ2nlLZDF1NjbNDIaHNFhjJQJKi0iCWNWDo23z0hL8CMZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724765704; c=relaxed/simple;
	bh=kVp9sXDTtLlVwwNvYh+Nwbbf3AZVSiexqWAg9HOa7p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdToTk0KtPH5a+Lx27plm0xeYfJfjIGbi0dkgAaf0ZsQsM4ApHcfkQi1KgsSG34urYg9oGDxX+XxSNSENx5Iro7dfgYxlUOYoJt0+OLN3iaJLhuOxyjDIdWa+XmkPnTpyP+dY/KQjy+JwNRyjHYWMyLi6U+5Vty7nUFcHZXvZx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Zzwtqdhs; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8695cc91c8so582371166b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724765700; x=1725370500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRSnTszdSq/pc7NK2q7HfymY5oNVAHHXr0ew7M6yPfc=;
        b=ZzwtqdhseEYlVZtnX0QnaTc/UK1Twuhr+0X/2z/BWqIKIPoTo2VycMD2BtKr6obAdf
         ZCtePMsrDHBaV7F9NRawM47DhLMQp1F+NCtKG7+U6HnQUUkHOT8GxajA/++356gbHiQi
         eRzXH4ezfgtijINHsII4+ufht7jt1Mzxxo1RDwDuqoDQjLfqveSBNZqoJAZquAK5XMb1
         VlKlwPv2ZOb3vMsjDIh0BK0IIC1F40FvPnvSCgcYpkvlUBo3/IOPd4FIWIzYHkqqYbh5
         x75TW449+4ouK6yAxd+IzD9orqwefpaLvnZbQEeZehYDnUjmF9jXgHdGGXiWCp0gHW8c
         rVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724765700; x=1725370500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TRSnTszdSq/pc7NK2q7HfymY5oNVAHHXr0ew7M6yPfc=;
        b=O2aeWgic8xNsNdCMNpO7h+R+f+8zKWH2xAziLIJcyyAUbT8Tc3rYOBvjmmoNYsiPZo
         gnOKusI2hYJMIgQ2f300VgRdmB2Gy73u9bwl0esgFVyGvphww7nn863GvwekhIJBypG/
         +9zB+Gu2CAFHegwB+rp4svn6hrhc4CYEnBEcKKRtSXzFollrqnBNG65JWj2oJxzBuOuL
         9/goePPmHhV5A/yctUBAWCowXgE+B9y8Jfsl76r/5iKBXAukBuPwtSASt1Wq7JhHt77J
         +aFnV+K2MuJCY08jEaW0KjT1NeVhmuexfc3p41nOKlWplXfl6kfPa6CxF506geANuVk0
         lD1w==
X-Gm-Message-State: AOJu0Yz2sfF0ZRl3NIOmnxEFJvSiY/S6kI5WYBz6ZNtq0vx/MvqoWdit
	ENvvz4WeI5EE/3+0ZSqiRgPwQxgqIQQwEZrxeUMXfgHeb8QowO0G2EYceVzcJEFenh3vjpoQ/WQ
	g
X-Google-Smtp-Source: AGHT+IE2j6GvIcpTlYY1CueQcYw0tif/I6nVN9OKIEDzNlieEnuC1xYbm3DV5FB4ULRvo7G6Zdwhfg==
X-Received: by 2002:a17:907:72ca:b0:a86:442e:6e10 with SMTP id a640c23a62f3a-a86e397e669mr251530266b.2.1724765699712;
        Tue, 27 Aug 2024 06:34:59 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5878a6bsm112364566b.170.2024.08.27.06.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 06:34:59 -0700 (PDT)
Message-ID: <f65642b5-d18d-43e8-b3c9-1810f3169631@tuxon.dev>
Date: Tue, 27 Aug 2024 16:34:57 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] watchdog: rzg2l_wdt: Power on the watchdog domain in
 the restart handler
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240826152529.2080248-1-claudiu.beznea.uj@bp.renesas.com>
 <20240826152529.2080248-4-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346A223DA7462799B9D103786942@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <4823173e-b024-482f-83a3-560c7abd888c@tuxon.dev>
 <TY3PR01MB113464C9751ADB7B0F0356CD686942@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113464C9751ADB7B0F0356CD686942@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27.08.2024 15:51, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Tuesday, August 27, 2024 1:33 PM
>> To: Biju Das <biju.das.jz@bp.renesas.com>; geert+renesas@glider.be; mturquette@baylibre.com;
>> sboyd@kernel.org; wim@linux-watchdog.org; linux@roeck-us.net; ulf.hansson@linaro.org
>> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> watchdog@vger.kernel.org; linux-pm@vger.kernel.org; Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> Subject: Re: [PATCH 3/3] watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler
>>
>> Hi, Biju,
>>
>> On 27.08.2024 15:15, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>> Thanks for the feedback.
>>>
>>>> -----Original Message-----
>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>> Sent: Monday, August 26, 2024 4:25 PM
>>>> Subject: [PATCH 3/3] watchdog: rzg2l_wdt: Power on the watchdog
>>>> domain in the restart handler
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> On RZ/G3S the watchdog can be part of a software-controlled PM
>>>> domain. In this case, the watchdog device need to be powered on in
>>>> struct watchdog_ops::restart API. This can be done though
>>>> pm_runtime_resume_and_get() API if the watchdog PM domain and watchdog device are marked as IRQ
>> safe.
>>>> We mark the watchdog PM domain as IRQ safe with GENPD_FLAG_IRQ_SAFE
>>>> when the watchdog PM domain is registered and the watchdog device though pm_runtime_irq_safe().
>>>>
>>>> Before commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid
>>>> wait
>>>> context'") pm_runtime_get_sync() was used in watchdog restart handler
>>>> (which is similar to
>>>> pm_runtime_resume_and_get() except the later one handles the runtime resume errors).
>>>>
>>>> Commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
>>>> context'") dropped the pm_runtime_get_sync() and replaced it with
>>>> clk_prepare_enable() to avoid invalid wait context due to
>>>> genpd_lock() in genpd_runtime_resume() being called from atomic
>>>> context. But
>>>> clk_prepare_enable() doesn't fit for this either (as reported by Ulf
>>>> Hansson) as clk_prepare() can also sleep (it just not throw invalid wait context warning as it is
>> not written for this).
>>>>
>>>> Because the watchdog device is marked now as IRQ safe (though this
>>>> patch) the
>>>> irq_safe_dev_in_sleep_domain() call from genpd_runtime_resume()
>>>> returns
>>>> 1 for devices not registering an IRQ safe PM domain for watchdog (as
>>>> the watchdog device is IRQ safe, PM domain is not and watchdog PM
>>>> domain is always-on), this being the case of RZ/G2 devices that uses
>>>
>>> RZ/G2L alike devices or be specific RZ/{G2L,G2LC,G2UL,V2L} as it is
>>> not applicable for RZ/G2{H,M,N,E}devices.
>>
>> OK, but I said "RZ/G2 devices that uses this driver". Here are included RZ/{G2L,G2LC,G2UL,V2L} AFAICT.
> 
> OK. Not sure you missed the same terminology on comment section, see below??
> 
>>
>>>
>>>
>>>> this driver, we can now drop also the clk_prepare_enable() calls in
>>>> restart handler and rely on pm_runtime_resume_and_get().
>>>>
>>>> Thus, drop clk_prepare_enable() and use pm_runtime_resume_and_get() in watchdog restart handler.
>>>
>>> Can this patch be fix for Commit e4cf89596c1f ("watchdog: rzg2l_wdt:
>>> Fix 'BUG: Invalid wait
>>>> context'") on RZ/{G2L,G2LC,G2UL,V2L} SoC??
>>
>> Not sure... I thought about it, too. I chose to have it like this thinking
>> that:
>>
>> 1/ that may not apply cleanly as it depends on other cleanups done on this
>>    driver, e.g. commit d8997ed79ed7 ("watchdog: rzg2l_wdt: Rely on the
>>    reset driver for doing proper reset") so it may be worthless for
>>    backport machinery
>> 2/ There is actually no seen bug reported by lockdep (as the clk_prepare()
>>    doesn't handle it)
>>
>> Don't know, I can reply here and add it. Applying this patch with b4 will take care of it. But not
>> sure about it.
> 
> Maybe leave it.
> 
>>>
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>  drivers/watchdog/rzg2l_wdt.c | 21 +++++++++++++++++++--
>>>>  1 file changed, 19 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/watchdog/rzg2l_wdt.c
>>>> b/drivers/watchdog/rzg2l_wdt.c index
>>>> 2a35f890a288..e9e0408c96f7 100644
>>>> --- a/drivers/watchdog/rzg2l_wdt.c
>>>> +++ b/drivers/watchdog/rzg2l_wdt.c
>>>> @@ -12,6 +12,7 @@
>>>>  #include <linux/module.h>
>>>>  #include <linux/of.h>
>>>>  #include <linux/platform_device.h>
>>>> +#include <linux/pm_domain.h>
>>>>  #include <linux/pm_runtime.h>
>>>>  #include <linux/reset.h>
>>>>  #include <linux/units.h>
>>>> @@ -166,8 +167,23 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>>>>  	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>>>>  	int ret;
>>>>
>>>> -	clk_prepare_enable(priv->pclk);
>>>> -	clk_prepare_enable(priv->osc_clk);
>>>> +	/*
>>>> +	 * In case of RZ/G3S the watchdog device may be part of an IRQ safe power
>>>> +	 * domain that is currently powered off. In this case we need to power
>>>> +	 * it on before accessing registers. Along with this the clocks will be
>>>> +	 * enabled. We don't undo the pm_runtime_resume_and_get() as the device
>>>> +	 * need to be on for the reboot to happen.
>>>> +	 *
>>>> +	 * For the rest of RZ/G2 devices (and for RZ/G3S with old device trees
> 
> NitPick: For the rest of RZ/G2 devices that uses this driver (This will make sure
> It is not meant for RZ/G2{H,M,N,E} devices)

If one considers this driver is used by RZ/G2{H,M,N,E} when reaching this
point then surely is in the wrong place.

RZ/Five is also uses this driver. Later, maybe devices compatible with this
driver will be added and this comment will not fit. Later, will we be
updating the comment for that? I'm not a fan of it.

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju
> 
> 
> 
>>>> +	 * where PM domains are registered like on RZ/G2 devices) it is safe
>>>> +	 * to call pm_runtime_resume_and_get() as the
>>>> +	 * irq_safe_dev_in_sleep_domain() call in genpd_runtime_resume()
>>>> +	 * returns non zero value and the genpd_lock() is avoided, thus, there
>>>> +	 * will be no invalid wait context reported by lockdep.
>>>> +	 */
>>>> +	ret = pm_runtime_resume_and_get(wdev->parent);
>>>> +	if (ret)
>>>> +		return ret;
>>>>
>>>>  	if (priv->devtype == WDT_RZG2L) {
>>>>  		ret = reset_control_deassert(priv->rstc);
>>>> @@ -275,6 +291,7 @@ static int rzg2l_wdt_probe(struct platform_device
>>>> *pdev)
>>>>
>>>>  	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
>>>>
>>>> +	pm_runtime_irq_safe(&pdev->dev);
>>>>  	pm_runtime_enable(&pdev->dev);
>>>>
>>>>  	priv->wdev.info = &rzg2l_wdt_ident;
>>>> --
>>>> 2.39.2
>>>>
>>>

