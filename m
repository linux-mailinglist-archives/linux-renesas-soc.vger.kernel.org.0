Return-Path: <linux-renesas-soc+bounces-8564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1718966454
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 16:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2527DB2090C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 14:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5211B2ECA;
	Fri, 30 Aug 2024 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VE2F64yp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE511B252B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 14:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725028920; cv=none; b=m4gejFbSyFVNG7AoQ1gOqPejtDXwoEIEqgF3iYKL8hFSbEl7rKU/tL7ULmyIoLhRiHC6y9wI0o9I22C8SPy3c+HA3NN/gvahm3GGtU8+fU037e1vRzoNUOJhyDBGsdcAfginjU1WGyr801cZKawrx63MLB6tqyyxP4BvjVHCrws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725028920; c=relaxed/simple;
	bh=aqoPT5D1ENl0ti1ADY6E5B0Gfn/Pns5uo4/sjOkHmi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n9MEvan5XUcAa3vH42mkXIUIVyEdqEzTZ63q4ToHr5gptLfo19Oi8YzbuEPpNP5ZMggOqccq+iGbDBLeK7tvRzauy6FgPxwRE31D16tDlXk+ia8otJOuOvOwumDn8YHpLn1itShjfRwbYS1S9afE8vbBoe0Z53ncJ3v/DbXK4C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VE2F64yp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42bbd16fca8so5323105e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 07:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725028916; x=1725633716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YMkK63StFSEj3t7KmBlixKLHPRFtUAQAc/1SVpQYMaI=;
        b=VE2F64yp0mUta7f3by47HxlC0CW1NWu30m8XsAL9wCPPhbC5CbPKBUvOer4JYIkERT
         JCpppiCAf+e8RRKtpe6WX7buaQzsA3bC+Dc12HGyMhd0V7kMGPI3CYEBqMi9U4Wok+L7
         4KZVKtXK6+I+qofWLhbq6XjcMkgwnufS2SSJ1mmVKm5jsiIQLc2hGZ9hkpuqLdWjRj8Z
         DQthTrag45UvXhCNNyOfXyHq+1sB/HJRn0EZA1sfR5wxxnt/8sywblVp+LNLPpazIcp1
         o/hCfdIiVwu0kjS+iRa3XoDKV1t5hRUVUpq2IhipuxRcOfXGJAnKAVX41ISJHvN7HsOW
         BKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725028916; x=1725633716;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YMkK63StFSEj3t7KmBlixKLHPRFtUAQAc/1SVpQYMaI=;
        b=JImWHD3eVtZ3dL4VbNhSug5qfwWyIa6/72GNhO8deqv4fq8L1DiCEJXC1LGur8AYtA
         JxlcdAKFrTGsYR39EUKKGhSGGovDW8pNrAJB85XgJpV1PPE+/er33cBK29x/Kkp8AVM1
         EbuowQ10S6yPuOvbr+U+hoXNGVKcqTB3y7B7nviY41zT95w4FjNg/qfRzM7yTEk7JhbO
         UmjJZe/+Jz5bkFO3in06n8NMw+4Yr1jrTRFelNrsR8WofvU0NBd+2QV2XBo1i1we7hFi
         mUhMTuMjO7Z/d5QrIuulGqeM0+W2NHUO6q34kSxJjxRCA4cQ8K0C9yBgkiakPzCRD5O/
         pLCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVopKlPW+HYVhh+a0mysnZ/YMmAeI/uffRdO74nb0gUPijqFuIzntWckk6tqfq1HqC6hRVs1lJHCfDTlXrgIpYicg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz1THbJH800xtNmWQDcuwa/FOeN7BLKP6rk5BVzGnWYnGu46Zu
	0Q8bXAAD37t9xE2eF4P4SPidV8W2KY4xYZNq1s1jZB5qXXbaqRetL/YsOzobRe4=
X-Google-Smtp-Source: AGHT+IHAFajC0IWDt2mPBWlkJZ5+gerJhXD2edqigkulSWR24gj1LguIFBW9kc2K9b8oGlAGaxfihg==
X-Received: by 2002:a05:600c:434a:b0:426:63b8:2cce with SMTP id 5b1f17b1804b1-42bb2a1abb9mr53933325e9.7.1725028915645;
        Fri, 30 Aug 2024 07:41:55 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df1066sm48148425e9.18.2024.08.30.07.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 07:41:55 -0700 (PDT)
Message-ID: <5f968f2a-012c-4b39-af78-1eafa483c9a0@tuxon.dev>
Date: Fri, 30 Aug 2024 17:41:53 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: renesas: rzg2l-cpg: Use GENPD_FLAG_* flags
 instead of local ones
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, ulf.hansson@linaro.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240828140602.1006438-1-claudiu.beznea.uj@bp.renesas.com>
 <20240828140602.1006438-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdX+Q99MvQRZcwGbk8F8SiAUzRU_t2QmRuO_6etAqqXskg@mail.gmail.com>
 <8b6fc67d-5e07-4403-ac07-6ad0b9d61882@tuxon.dev>
 <CAMuHMdUqVcojRoPAEuZ8a9Y-iHm4b185StD73FpQoRFsEiZ8oQ@mail.gmail.com>
 <194e87f4-7eab-4bfb-833a-27fabd2d5205@tuxon.dev>
 <CAMuHMdWKVfUn5Xy+vxT3puNT+AKLZtm7o=QBysWxfjk434yUJA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWKVfUn5Xy+vxT3puNT+AKLZtm7o=QBysWxfjk434yUJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 30.08.2024 17:26, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, Aug 30, 2024 at 4:07 PM claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 30.08.2024 11:06, Geert Uytterhoeven wrote:
>>> On Fri, Aug 30, 2024 at 9:46 AM claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>>>> On 29.08.2024 15:32, Geert Uytterhoeven wrote:
>>>>> On Wed, Aug 28, 2024 at 4:06 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> For watchdog PM domain it is necessary to provide GENPD_FLAG_IRQ_SAFE flag
>>>>>> to be able to power on the watchdog PM domain from atomic context. For
>>>>>> this, adjust the current infrastructure to be able to provide GENPD_FLAG_*
>>>>>> for individual PM domains.
>>>>>>
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>>>>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>>>>>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>>>
>>>>>
>>>>>>                 pd->id = info->pm_domains[i].id;
>>>>>>                 pd->priv = priv;
>>>>>>
>>>>>> -               ret = rzg2l_cpg_pd_setup(pd, always_on);
>>>>>> +               ret = rzg2l_cpg_pd_setup(pd, genpd_flags, always_on);
>>>>>>                 if (ret)
>>>>>>                         return ret;
>>>>>
>>>>> What about moving the conditional call to rzg2l_cpg_power_on()
>>>>> below to rzg2l_cpg_pd_setup()? Then this function no longer needs
>>>>> the always_on flag.
>>>>
>>>> That could be done but I think it will involve an extra power on/power off
>>>> cycle for the unused domains.
>>>
>>> Still only to be done for the always-on domain, of course.
>>> Anyway, up to you.
>>
>> I checked your proposal. If unconditional power on is going to be done for
>> all the registered domains it may happen to register domains for which
>> there are no enabled nodes in device tree and thus the domains to remain on
>> (because the driver enables it under the hood and the genpd core doesn't
>> know about it).
>>
>> With unconditional power on and the current DTSes the following domains
>> remain on after booting with r9a08g045s33-smarc.dtb:
>> - sdhi2
>> - i2c2
>> - i2c3
>>
>> as the domains are registered and powered (while registered) but the nodes
>> are not enabled in DT.
> 
> To make it clear: I did not suggest doing an unconditional power-on.
> I merely suggested moving the conditional power-on from
> rzg2l_cpg_add_pm_domains() to rzg2l_cpg_pd_setup().

Ah, I see. That can be done. Sorry for confusion.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

