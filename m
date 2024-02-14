Return-Path: <linux-renesas-soc+bounces-2791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6693854D5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 16:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA50C1C28419
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 15:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E145F84B;
	Wed, 14 Feb 2024 15:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="egfMvVmC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC25D756
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707925894; cv=none; b=J5S57sgf+jcjpq+Ky9imLX3V3k0x5o+noGIadSu2TMuQgiJfXZYT9/lcjxdI1o6YoRqt0SbtOz3661EKt/er+jCem8gpBIHMcntu1M53m/+Mi98zbBOUbECwDcEwJBHbEJ5vc+mdygo0yMK/1+5tbhTteWPpIZoayUeRVXdso4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707925894; c=relaxed/simple;
	bh=hqo2GevEBm5pyLsgR6cwWD6Si222BK7J5bWCR3AUBRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIvDFqlFtbZUBU79WPwZ9Hv1T51iIj9b+diaKlBRcOzU8d/otEDlWGIGLIFPSWOw8Vk9M9lzLYkIRW91dWJydU8Nzh8uhUKJrnhFu39DgKMcpDMrvBus0Qxjp2g+1DCBoM3OjWiJagA0r4bXbFXzxzq6gnqYNE0UhgORot4QDOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=egfMvVmC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41205bd8beeso283375e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 07:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707925889; x=1708530689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ckkUsVwgCVmMoCiQoUiMKNTCmR3exiIWp1NLASK9lUQ=;
        b=egfMvVmCnmRlf82UsFf38F9fQVI325kqptKHrXu5T6BE5yIpUbtRnLVXNn3LoVfmLi
         cVWaK0fAroF+Fzzg6Z0AoMzsyYLbSteEDEL7bQeFfsDY+x+olFFZpgZCcHAivUhpO9jp
         sjg5/BOD5xp5hkqZa+gfoe/7zxIi67yyeP07dgzI3XmTpWCJcJFNxNvmhJkyU+D6u2bj
         DJbXEQ7l/H1+ZiW7PqsfJG0Jjpjx3Tq2qYYQHFZvZAICJF5zo8upgGvxh+g1QtYO0ZAr
         8TnRBOI7kVQHRVOAmOUnFcL/xulMBvpDfzDPk/FnolHoCr+hr8imtbkX4VOo9KpxOAwm
         w1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707925889; x=1708530689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ckkUsVwgCVmMoCiQoUiMKNTCmR3exiIWp1NLASK9lUQ=;
        b=LiZwK+pF0BFyNqf8tyz9mwny0SZTYdFEclglm63d+AHa55nPUST0vpDZORX3/vObGn
         cbMCAZXowZk8pjxoWDwBx8XUAjTt+L4uP7+vv0RzFSlQRtziGCWMDTA/5rK34dtj0fu1
         34SFwZT9nmta51YoAdIHlfjaxzB/2oGplcaFVc8N2FXEN7y/JSo54EsXD+aLufjvQaYf
         iO7VG7gGuUuasyWS8bpvg3ZFHZu4pB2hTO8ejOAMZMbDgJ8lAejRtxwt6q8I/DkbkQvu
         CWWFAuYVRFxq8ULkEwmV/T4AJ6uX9Lj/3SFCo3D7f1uy/m6pHg+v/s2p3b0YTkJe5NY1
         YSvA==
X-Forwarded-Encrypted: i=1; AJvYcCUmE2zCx2orGcY7S2zbN95KvB/q1wXRMwQyys49GRY8dkf0cdbpKAIfrxFU0RpUrd0dHAKmDE/ZUoKluQj/wA2cjthJoUggDOn6CaiMUnIYYqc=
X-Gm-Message-State: AOJu0Ywu/qZZLHA43BSq275JWZQ7MfyanP/bL49L8KCVzYG3W4H00k+g
	QFZnHfVM4W1y806FnnJNr9FGCcX1sKHtQrjBgE2rjJed2DQvABDpA+maPrBT3+0=
X-Google-Smtp-Source: AGHT+IE9Cb8bmY4/kHxXZzGixDvo0x/U8XvyY7LuYDD1kDdiV0/3lxBXysSXRpjKZPIsHEagKZLGLA==
X-Received: by 2002:adf:f70d:0:b0:33b:3ec9:bac8 with SMTP id r13-20020adff70d000000b0033b3ec9bac8mr1966513wrp.26.1707925889382;
        Wed, 14 Feb 2024 07:51:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyY0+8ebFKZ6vQKw16tiiOdkDZpQDTJBSOjatwe3jxEdnAuofYJ2PCOuE8XmQlDlvvL3Gj1zRxJo/LJZNPg/cRVp5s6A/DnmrKCebT2gpXvg3tic8GhZLLQdTHX1GlNLLgbX8ahGxgs4buMpIRig7he1Xdv8LJthIYOVc7R5FGgW+Znrm1256Cqz2yOB6s7HYfJoH0IbVTO0hZgZsU2DZZ8FyZKp6r9yAetG8TJZrCJa6lrKUTqEx+VZmpq+t5E14H+CDOJH5LbVGrkyO9Au2hnePWXrq7icl1So4GQSfbJomV7Xix/GYeutOCPCdPsqwvXx2/uGzBPf3VX8A4bBXyU0XZFi8onlhMMaBm0SBrVRhfM8d3kDn2HBXAwW/iZH19U2j3iRHjsbnffDXndcJARGW6DdMlDruwGZ4nlQCeXo3iLQu599+aO0aOJNUSbUqFfAvEI08Sj6Y6ylslkXOab4NSGmj5h31UbaByeWSivNRkmno+pXRZN6jewUmvfUOEc4VW3Cg1Ll4VOehbnUUANmPxq68za+9ktokskoVGcLMNxxGSvQzY
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d5407000000b003392206c808sm12694287wrv.105.2024.02.14.07.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 07:51:28 -0800 (PST)
Message-ID: <497c4fb6-1ea1-4e14-bd43-ce4a4441694e@tuxon.dev>
Date: Wed, 14 Feb 2024 17:51:27 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] watchdog: rzg2l_wdt: Make the driver depend on PM
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, geert+renesas@glider.be, magnus.damm@gmail.com,
 biju.das.jz@bp.renesas.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208105817.2619703-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208105817.2619703-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdV+CryvbFkcFGthk2VM0j7m13rQJ_0GtumPg2f-hpuMvA@mail.gmail.com>
 <fea4f538-b3c2-4299-9af1-5e2b61d06ce4@tuxon.dev>
 <CAMuHMdU8iJhXWFTrVqr8W-ov2D=oSUbsyDP1kfs6mC3rBcLxzQ@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdU8iJhXWFTrVqr8W-ov2D=oSUbsyDP1kfs6mC3rBcLxzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 14.02.2024 17:26, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, Feb 9, 2024 at 1:25 PM claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 08.02.2024 14:53, Geert Uytterhoeven wrote:
>>> On Thu, Feb 8, 2024 at 1:26 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The rzg2l_wdt watchdog driver cannot work w/o CONFIG_PM=y (e.g. the
>>>> clocks are enabled though pm_runtime_* specific APIs). To avoid building
>>>> a driver that doesn't work make explicit the dependency on CONFIG_PM.
>>>>
>>>> Suggested-by: Guenter Roeck <linux@roeck-us.net>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>
>>>> Changes in v6:
>>>> - update patch description
>>>> - fixed the dependency on COMPILE_TEST previously introduced
>>>
>>> Thanks for the update!
>>>
>>>> --- a/drivers/watchdog/Kconfig
>>>> +++ b/drivers/watchdog/Kconfig
>>>> @@ -911,6 +911,7 @@ config RENESAS_RZN1WDT
>>>>  config RENESAS_RZG2LWDT
>>>>         tristate "Renesas RZ/G2L WDT Watchdog"
>>>>         depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
>>>> +       depends on PM
>>>
>>> depends on PM || COMPILE_TEST
>>
>> Isn't "depends on PM" enough? As of [1] ("If multiple dependencies are
>> defined, they are connected with '&&'") the above:
>>
>> depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
>> depends on PM
>>
>> are translated into:
>> depends on (ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST) && PM
>>
>> Please let me know if I'm wrong.
> 
> That is correct.  But you still can compile-test this driver when
> compiling for a different platform, and CONFIG_PM is disabled.

Ok, I see, thank you!

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

