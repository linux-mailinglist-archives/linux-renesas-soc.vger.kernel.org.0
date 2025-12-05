Return-Path: <linux-renesas-soc+bounces-25605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C1CA7C2C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 14:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BA0D3031269
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 13:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED2E2FBDF5;
	Fri,  5 Dec 2025 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XpGPZZ/B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299611F3FED
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Dec 2025 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764941387; cv=none; b=mJ5C3+4HLoBYTIfaQQ04TZFPga1xrtMpOYpdJ3jzW08CvDSJ/bQ04u4rJMIlud3li2+/ZJwpG+5edmOGl0POSYzTb1gLHlzO3PjJkEFys+sT+z43xfFu0HvQ+QmeRCY4rcWZovDaAkAivDT+6GUaGpx7ywHuBYcRz5HMM8LuMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764941387; c=relaxed/simple;
	bh=lMD0geLhMWwBjmPbwnuotf/6RYiunY2kr22lC3lDCVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gx2JNoNSIgjA329cZB8LOwu8+TwsFiDYuKHiWmk5woPe3MbNjhpX87IVnz5Fpexm8tYjf0VIvTUHLnyx72CqQ/JMJdutokAtR9Pea6QlRsSwFQpULp79/qiKlNeEekHduonrJ5DNwEgE7MIExRYturOgYOvMZfDJsH2UHuyo5uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XpGPZZ/B; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so14637105e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Dec 2025 05:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1764941381; x=1765546181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2XKwF1tFHUTe/3BcysjTIbJPfnPNZwymG6gCY/PH54=;
        b=XpGPZZ/Bu98zdlngT9go11qNMM+gjJeYDuFS/vTSPq+kZotuEqdx7XTSmsHKXP7m1N
         4JrX3XrPYB+K3Hrd8IGP68xXgCovNsudsWwvhLo/Ih7GYclqRBt3Npcwp5PMnvv9Bbqq
         InunpcZVoAtn+5wFgaMY4E3QtVsfe17yD3DNBXCys3DTwiELMqyYLVsEU0lOsPoQhcSS
         WCZijO+CqM9dcurvyN3zgQWKtyx5NUkA8NnnLETSwNN8MupE61f9z22rYg9eDIu6U03W
         ewUBpMJ7R5SZltmAWM0YgTmv4vL4+KdIkEjP6to5zd9KJmB2VSuVqBiMCdjLWABkJT3v
         UUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764941381; x=1765546181;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2XKwF1tFHUTe/3BcysjTIbJPfnPNZwymG6gCY/PH54=;
        b=TIFgNYQ7nQQBs/YLSnhI4vJhTE/b+ivQM66TBgvloqtXC+k01bVVQds9x+CUysi2sT
         q7uX5Zk2cQLgxtTdf9qedPpoysrj/7RY1BBy/5jJbmkU6zXsWegvLEM1JxlMjXhQZIgW
         Sx7soT0YaKsJFg4bsJd/EPGYTcFi5j6/NNy1SEhpmcMBazCTmk/XsBoP92UjpUqSLL/a
         gx0k9nj3ciDF0Mi/SDQrg7dfGc7nPRZxhjNGvm6Y0BTUoOF4TtZdOM4uvUzwOSsjMfEK
         IgDbkco3UJPWPuoATXK4sJVEZBWiamGtZaS3DN5oXAyqo0sD9WSg+Zq/Stm5EMfiq+b2
         IsTg==
X-Forwarded-Encrypted: i=1; AJvYcCUuiiH8hMXhrUh7/rzWiw8ooz6xSQg5odD3Q0lZrpX4j3dFfFa6vMxyc3kA5q9PvWZhZXmG9dYtqEsfo1ucwZIdOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyugVgiPNOrgBkiGPPURKSVs4FYhDFooDKjn7ycLh5Hl17NEqLh
	PUm/gGbil7XKnC537yrqSlB+y7Zf+3+AdfmvkkVYkzhzmNkgwSt2wutUc3J/iBaLYv4=
X-Gm-Gg: ASbGncvOT9X+wxVBniMW7cGHlqJZhyeK10qlS+Fu3XirWURjD3/ykXegSYVMd9R7S4O
	xu+7UW03RE41QU+LW6cSdcbnY5o/SZ72Et356xOLmyWodubna9/w20Akw0u82N0sJ7ZNS5GPm+N
	f/0tyCH64EK3mWVk+YCf18m8+pnPu4FYjGyFgh24P9iyaZEL8mYuRsta7yAEe3rwiRHwYLo+l1C
	uLw871YE72X+BSE4EvzelzEOrGAaXEB8rEft84baylC4Xkd71DTDaNS824pQhYPeeqO2a94Wtut
	xqETdnibHqcUS7Y7pi2oKBzWRoEjm5btF1XyEF+dBhGU0qMW3xMlRk5nSVfKOwuA3BQ3eDVSLFf
	9lW3JPnX1U0IYBChwNvcm88XLPfJjbfK+6TepBpECU7B4wnwlAjH/bGOdgGsT0JUkh0BlbBSEJp
	6W2ilsVk5mcVwh33d+sH5RWkIF7LygJw==
X-Google-Smtp-Source: AGHT+IHCBGIKMPaxyPuOHAAMy4JxJUA4bh99G9ixBJSlUqhfJgQ2QT/Jji31cTOq+5Ty1JeVupv1FQ==
X-Received: by 2002:a05:600c:c87:b0:477:aed0:f3fd with SMTP id 5b1f17b1804b1-4792aef1be4mr92200315e9.8.1764941380713;
        Fri, 05 Dec 2025 05:29:40 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311ece7asm83759545e9.12.2025.12.05.05.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:29:40 -0800 (PST)
Message-ID: <52bf094a-a656-4bef-bb22-f903578ecf9b@tuxon.dev>
Date: Fri, 5 Dec 2025 15:29:39 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
 <TY3PR01MB11346625CD598704CC36C63AE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <da64005a-e6fb-4bbb-a97c-e6c3ada8aff1@tuxon.dev>
 <TY3PR01MB11346820489C604B63A315E8486A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346E629B11BC5F812D32E0086A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB11346E629B11BC5F812D32E0086A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/5/25 13:55, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Biju Das
>> Sent: 05 December 2025 10:57
>> Subject: RE: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM support
>>
>>
>> Hi Claudiu,
>>
>>> -----Original Message-----
>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>> Sent: 05 December 2025 10:47
>>> Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to
>>> RAM support
>>>
>>>
>>>
>>> On 12/5/25 12:17, Biju Das wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>>> Sent: 05 December 2025 10:00
>>>>> To: Biju Das <biju.das.jz@bp.renesas.com>; p.zabel@pengutronix.de
>>>>> Cc: linux-kernel@vger.kernel.org;
>>>>> linux-renesas-soc@vger.kernel.org;
>>>>> Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>> Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend
>>>>> to RAM support
>>>>>
>>>>> Hi, Biju,
>>>>>
>>>>> On 12/5/25 10:53, Biju Das wrote:
>>>>>>
>>>>>>
>>>>>> Hi Claudiu,
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>>>>> Sent: 04 December 2025 18:26
>>>>>>> Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend
>>>>>>> to RAM support
>>>>>>>
>>>
>>> From my previous experience with suspend/resume implementations, I can
>>> say restoring the system in failure cases in suspend/resume or not, is
>>> up to the subsystem maintainer. So, I'll let Philipp to decide how he wants to go with it in this
>> driver.
>>>
>>
>> Agreed.
>>
>>> They are still supporting suspend to idle, where power is maintained,
>>> right? Shouldn't we cover this case?
>>
>> Yes, I agree. Probably best thing is zero failures, if there is a failure in suspend path, the same
>> device will fail in similar fashion, and the system never enters suspend state.
>>
>> So, report the failure and debug and fix the issue.
> 
> FYI, On your resume path, if the below call fails, then there is a pm imbalance for next suspend().
> 
> ret = pm_runtime_resume_and_get(dev);
> 
> Similarly, if reset_assert() fails for a shared reset.

Wouldn't be the same if there will be no failure path code?

Thank you,
Claudiu

