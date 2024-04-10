Return-Path: <linux-renesas-soc+bounces-4459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2870589F949
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 16:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C89F5286E3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 14:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E44C15F414;
	Wed, 10 Apr 2024 14:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="f/VO2SQ2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCF715EFC5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 14:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712757711; cv=none; b=LqmFbnk3Kc0vq+B9k24lL824HUjTe21chFtk3AJyj2BDovqzlxOKmGT/lkLCjqtVgFPdtlocVCC36UGboZX7kTwBlFFxkX0d3bs91j5ad3b9YcUQzfQ6kWjVm1N1nJAewQ47teSKF9QPEroGs8KEhqqkl7GtPStWdCtU8jA3Ir0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712757711; c=relaxed/simple;
	bh=e88gyjeUImIcsIbCAmREhMKck+xNyVFvJ6Y/vXAlET0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nD3Hr7QNmDTuA/JWGSkxjzyPuOf9Ro6lrOTtTmMl2WW8O+lg1HedUyhayQv8hWA2iwuxz+WPKzd8bdEvqaFBn/vwXaClyDzxShMRi0r4JUH/DFNMtzD0belwSCp/NCXxq0ZYQRfc2tVdan3OWORuLpCPsTwsulivGSMc4wdfwOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=f/VO2SQ2; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso4223244a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 07:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712757707; x=1713362507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C7lFcOC7l3g9TVCaL+oCyT/3qdUrXzLc4rgBkKi4hh0=;
        b=f/VO2SQ2pOmFcRc/SrwFNfrhckWT7PaG3ayy/kd0kmQQ34UC5AjV6wIw8Mr3fr5vfL
         1edjDA/CeaK2oeFsCv64F+BP779opROVPIIFz7mPxI+CnBum+Qg5TjoeITnumib2yc6D
         wZ1NwB0ocAjkORSvRguJAdr58YguaUPFvZ09J1KFAIaJyHxM8bd3qsgj1oHBusTQPbd7
         hlPGJUMQNIiC56h78XjMafJpiTMTlbBRAc0b9wtAFmlFyYl3ekpmtzTeinKZ1no6rJKJ
         Fl4t8WXbE1kBYf9iSa18ryfCQyDahi/AKvgtRGjffckl09CIuoEwyx4wFgK4lqmknFad
         tkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712757707; x=1713362507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C7lFcOC7l3g9TVCaL+oCyT/3qdUrXzLc4rgBkKi4hh0=;
        b=RR5rNiztPuzjRowOMakDGM5lev/NyPri1HoT9X9bl7kEIhTOPs5gs6PNzgpfO4G9Et
         iU97BgE6YlIYraJkdweUXxBeZ9uyfL9aPVI/Pmrbk+JO1SXGAKFN1aLNpy02SuOiir4C
         N7AX47aZTDy9sWS3WbbgM9G+CT7Uiosfn2hha3qkIMJwBh1pjkAHVCJhKewWijx19kKf
         ud4a1jkPWEGCZrFHj+aTdlDfRh0SVdmpR6pj+qHw80Gu6U2UEAjJYq+khTNm0MScUj/m
         ZNPiW+h8hln5mYIVidUff6sNkBx9z/Q+rB33u1MM0ddPYsznsO093LB3osJKiCXfEkF1
         gqPA==
X-Forwarded-Encrypted: i=1; AJvYcCXtjCuXdHhEsXepsPL+zSVj9pzsNoZHVR4oWo9PBYoOP8gsPLTEGnQm59I3bf5JiK6ZEtqae2NNac946OU0ApqQ4o8ggq8QkjtoVF7HRQ9LFvQ=
X-Gm-Message-State: AOJu0YzCJH2znOehIAhCknpUC73u7sbSNv913upoZdHhOLSmFW6R6VY9
	L1juzRy7HscVS9hOGvnfnySe6IgL0Q5/7gruawx+YitgxjVdtvfruavx8FTRz84=
X-Google-Smtp-Source: AGHT+IEWCICihxTK465pYa3JGEG4kSjfnaoh1QVBzAZnHSiEGwF/hNWWILbv56rVqPOCFLNkPNUg0A==
X-Received: by 2002:a50:8d16:0:b0:56e:743:d4d9 with SMTP id s22-20020a508d16000000b0056e0743d4d9mr1748489eds.42.1712757707092;
        Wed, 10 Apr 2024 07:01:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id de26-20020a056402309a00b0056c1cca33bfsm6405937edb.6.2024.04.10.07.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 07:01:46 -0700 (PDT)
Message-ID: <11a371b5-f649-4dfb-94d1-9a01b15d5993@tuxon.dev>
Date: Wed, 10 Apr 2024 17:01:44 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 03/10] watchdog: rzg2l_wdt: Use
 pm_runtime_resume_and_get()
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
 <20240410134044.2138310-4-claudiu.beznea.uj@bp.renesas.com>
 <OSAPR01MB15874891F67AAFAA955A186886062@OSAPR01MB1587.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <OSAPR01MB15874891F67AAFAA955A186886062@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10.04.2024 16:51, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Wednesday, April 10, 2024 2:41 PM
>> Subject: [PATCH RESEND v8 03/10] watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> pm_runtime_get_sync() may return with error. In case it returns with error
>> dev->power.usage_count needs to be decremented.
>> dev->pm_runtime_resume_and_get()
>> takes care of this. Thus use it.
>>
>> Along with it the rzg2l_wdt_set_timeout() function was updated to propagate the result of
>> rzg2l_wdt_start() to its caller.
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
>> - propagate the return code of rzg2l_wdt_start() to it's callers
>>
>>
>>  drivers/watchdog/rzg2l_wdt.c | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c index
>> 1741f98ca67c..d87d4f50180c 100644
>> --- a/drivers/watchdog/rzg2l_wdt.c
>> +++ b/drivers/watchdog/rzg2l_wdt.c
>> @@ -123,8 +123,11 @@ static void rzg2l_wdt_init_timeout(struct watchdog_device *wdev)  static int
>> rzg2l_wdt_start(struct watchdog_device *wdev)  {
>>  	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>> +	int ret;
>>
>> -	pm_runtime_get_sync(wdev->parent);
>> +	ret = pm_runtime_resume_and_get(wdev->parent);
>> +	if (ret)
>> +		return ret;
>>
>>  	/* Initialize time out */
>>  	rzg2l_wdt_init_timeout(wdev);
>> @@ -150,6 +153,8 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
>>
>>  static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int timeout)  {
>> +	int ret = 0;
>> +
>>  	wdev->timeout = timeout;
>>
>>  	/*
>> @@ -159,10 +164,10 @@ static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int
>> time
>>  	 */
>>  	if (watchdog_active(wdev)) {
>>  		rzg2l_wdt_stop(wdev);
>> -		rzg2l_wdt_start(wdev);
>> +		ret = rzg2l_wdt_start(wdev);
> 
> This IP won't be able to update WDT settings once you have set it.
> 
> But we can update it, if we do a reset assert followed by deassert.
> So the previous code looks correct to me.
> 
> Current case is if the WDT is active, then start it. Maybe I ma missing something here.
> 

I'm not sure I got you correctly.

This patch keeps the previous functionality, thus, if the watchdog is
active rzg2l_wdt_stop() is called which does a reset assert. Then
rzg2l_wdt_start() is called which does the reset deassert.

Thank you,
Claudiu Beznea

> Cheers,
> Biju
> 
>>  	}
>>
>> -	return 0;
>> +	return ret;
>>  }
>>
>>  static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>> --
>> 2.39.2
> 

