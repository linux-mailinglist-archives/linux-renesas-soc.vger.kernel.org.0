Return-Path: <linux-renesas-soc+bounces-8529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD4E965900
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 09:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90A41C20CCA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 07:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577B9158A37;
	Fri, 30 Aug 2024 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lJo0tKGF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6594712F59C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725003997; cv=none; b=TvNE8P2zDh7LLfK22tPGaxM2TmmBbbwq7jXO7DJEZfQh+9OZFLwWt0lKUttTK8UrcSXCEJYZTh+v3g108Tsu22WqMz8ozh3qYm+0dndYEl9muempOS7aUhd6v5SonKpwOY75BVXHFwcLH3o7/bYtmmSiZ65CrO2NSS/5yTtX6Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725003997; c=relaxed/simple;
	bh=8CU1P6WAQvvcoraNUl37TtxDUg5r8wJ99DEgd6QZG8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTojDUV9lW/AIHSBgKGWOSjWipvpOPWGErIEJ5J/Z4I0WpvL1OVzq8LnAVRvvMWhOGBIXABzvy+eC4+wUADVKr8KQrW/etJSX+JUf9+E6OkXX3T+ZHBinObK6QWIMwojHN18x/Rs86eC3ulwBq3wr7tl+JoSXtKJzevi43atsa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lJo0tKGF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bb9d719d4so6660915e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 00:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725003993; x=1725608793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqwNCAVndatJ1EwadF1jO4GFKnqTtSQZTTqLPFzpvTE=;
        b=lJo0tKGFn7WVN7eOnDzwtLO1Nyrl2uaD1Q0dftRGWBp6VeHhxnS6UrWg96BvFn0vC/
         jL/dckyUdKGv5Rxbq8FYwi2RQyK2iGt6A1WXrcjcb8ozgd70e+1/y+R7Oi7tSbKQ6kUf
         qmr4Dsmts9L0RJ1IALrt0q5aOm1t6t1vRDIfy8E0YzTNDhmzKooDaDHk6MoMXQUAdMtV
         ejLcZR9JplhlOt5JIFKGj41edB4d+XJeT3rJXt7QzzkXrLjrWBPN0YVsj4USmyW5mSAg
         oBnj6OTtT+fnZeoH92xuT4nzPFKWo/5chcc48yVIM3ObfC+TfzErqUAZrqQ4hh90B4sz
         VS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725003993; x=1725608793;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wqwNCAVndatJ1EwadF1jO4GFKnqTtSQZTTqLPFzpvTE=;
        b=BHvFZPcYFNm9Ea22Djt5d1uU6HlqSaSn0dKYNAU24Rglc8Qjwf1NKjHCJmiBMsrNg9
         qm8ODkiskHcKZF/pjgM9r+IV9qYjG9ilnm8vRyuogx8G+1AGq5PKvcPy3+CtJHlnITNZ
         jEJMWyg8nWXw3sfC2Wf9CuTqOffjHCdTQm7fd2mS9yc4IsggAz/nL6uqYT6AsrnQRywj
         wFvu+Zh97U6i2raIzNCDCHL3u960oJUIxDyXAdJxrURxBjzECTCcrtlxms4whByJtvp1
         +rBGMONokN6JCsJPwGpXXTAjYhDrzmjP4Z2AfBOTFieYcLcgPqOCaCPaIq1Lh2AXonuq
         GyMg==
X-Forwarded-Encrypted: i=1; AJvYcCVvcPGZ9Pazy/A8hO6Xrb299nZMmGOoZ/7OPwYPmwM0CDlliNLsYUPS5364N0r5w1nxBhhL5mc3PFQcH+pUHix93w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2XXnWj2pGfoIhxzA1IEqvyWQpLoZBwGXR8KB+9gn12AZD4WK4
	iEZFClbhDsh7SF7nTPpjs6tPDXBpFvgVPDwysvU5qBwQR8ug4i87CL3zXaJ6ZLY=
X-Google-Smtp-Source: AGHT+IFkYMhDP90/F4TlkJBeT5Z08EDkAO3NPVbMOXNAPCc7UfNbxHw5ib8RmZ+yDAptsKKSxnbDOg==
X-Received: by 2002:a05:600c:5110:b0:426:6710:223c with SMTP id 5b1f17b1804b1-42bb029371cmr45972405e9.9.1725003992337;
        Fri, 30 Aug 2024 00:46:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63965dbsm72613745e9.6.2024.08.30.00.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 00:46:31 -0700 (PDT)
Message-ID: <8b6fc67d-5e07-4403-ac07-6ad0b9d61882@tuxon.dev>
Date: Fri, 30 Aug 2024 10:46:28 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: renesas: rzg2l-cpg: Use GENPD_FLAG_* flags
 instead of local ones
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, ulf.hansson@linaro.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240828140602.1006438-1-claudiu.beznea.uj@bp.renesas.com>
 <20240828140602.1006438-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdX+Q99MvQRZcwGbk8F8SiAUzRU_t2QmRuO_6etAqqXskg@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdX+Q99MvQRZcwGbk8F8SiAUzRU_t2QmRuO_6etAqqXskg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 29.08.2024 15:32, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Aug 28, 2024 at 4:06 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> For watchdog PM domain it is necessary to provide GENPD_FLAG_IRQ_SAFE flag
>> to be able to power on the watchdog PM domain from atomic context. For
>> this, adjust the current infrastructure to be able to provide GENPD_FLAG_*
>> for individual PM domains.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>> @@ -1680,11 +1680,13 @@ static int rzg2l_cpg_power_off(struct generic_pm_domain *domain)
>>         return 0;
>>  }
>>
>> -static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, bool always_on)
>> +static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, u32 genpd_flags,
>> +                                    bool always_on)
> 
> You don't need always_on, as that should already be reflected in
> genpd_flags.

OK.

> 
> Also, you could do without passing genpd_flags, if the caller would have
> initialized pd->genpd.flags (it already initializes pd->genpd.name).

That could be done, indeed.

> 
>>  {
>>         struct dev_power_governor *governor;
>>
>> -       pd->genpd.flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
>> +       pd->genpd.flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP |
>> +                          genpd_flags;
> 
> Change not needed if the caller would have initialized flags.

OK

> 
>>         pd->genpd.attach_dev = rzg2l_cpg_attach_dev;
>>         pd->genpd.detach_dev = rzg2l_cpg_detach_dev;
>>         if (always_on) {
> 
> The next line is
> 
>     pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
> 
> which should already be the case if always_on is true, so it can
> be removed.

OK

> 
>> @@ -1712,7 +1714,7 @@ static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
>>
>>         pd->genpd.name = np->name;
> 
> pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;

Agree.

> 
>>         pd->priv = priv;
>> -       ret = rzg2l_cpg_pd_setup(pd, true);
>> +       ret = rzg2l_cpg_pd_setup(pd, 0, true);
> 
> s/0/GENPD_FLAG_ALWAYS_ON/, FWIW ;-)
> 
>>         if (ret)
>>                 return ret;
>>
>> @@ -1777,7 +1779,8 @@ static int __init rzg2l_cpg_add_pm_domains(struct rzg2l_cpg_priv *priv)
>>                 return ret;
>>
>>         for (unsigned int i = 0; i < info->num_pm_domains; i++) {
>> -               bool always_on = !!(info->pm_domains[i].flags & RZG2L_PD_F_ALWAYS_ON);
>> +               u32 genpd_flags = info->pm_domains[i].genpd_flags;
>> +               bool always_on = !!(genpd_flags & GENPD_FLAG_ALWAYS_ON);
>>                 struct rzg2l_cpg_pd *pd;
>>
>>                 pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>> @@ -1789,7 +1792,7 @@ static int __init rzg2l_cpg_add_pm_domains(struct rzg2l_cpg_priv *priv)
> 
> You can add
> 
>     pd->genpd.flags = info->pm_domains[i].genpd_flags;
> 
> above.

OK

> 
>>                 pd->id = info->pm_domains[i].id;
>>                 pd->priv = priv;
>>
>> -               ret = rzg2l_cpg_pd_setup(pd, always_on);
>> +               ret = rzg2l_cpg_pd_setup(pd, genpd_flags, always_on);
>>                 if (ret)
>>                         return ret;
> 
> What about moving the conditional call to rzg2l_cpg_power_on()
> below to rzg2l_cpg_pd_setup()? Then this function no longer needs
> the always_on flag.

That could be done but I think it will involve an extra power on/power off
cycle for the unused domains.

Thank you for your review,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

