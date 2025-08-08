Return-Path: <linux-renesas-soc+bounces-20156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8859B1E805
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 14:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADE591667E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 12:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360CA275B17;
	Fri,  8 Aug 2025 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aW9VOXyk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730D0275B0D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Aug 2025 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754655067; cv=none; b=qNWo6p8eU62ktBGrpRnhDZZssQtRMcv0Cjmo4QN+dlRjk3PPlFcImxWCpBibg+wTTyua+Vq+BLZ9d2pxDjQDOIWkGiusnl//y59hiSsM+c3mTOxsP7yYkqrRdw9nOc6yg+93n+oV+rCaj3iPwOEwwFu2061u0EluwUnZp5aTi+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754655067; c=relaxed/simple;
	bh=jrIEWBRIyno6UVI34k6pRfIfKxlL/J2GMbRuz4wtFbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Na+QyUw6nKjwUURt26jIiy45WCz8cH7ZCnXsJz+ixLPR/Xidf2oxOWJpnQJpig6gXjQWJWHlsbC3lX76PACrx96mI28FY5YCuL9HzyDfN8ipBjOuMDDdlAgK+MSNjTmp+WGPD9UZeDiJgZloe6qpBlyIPcXbPMHgj/pa65nHAnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aW9VOXyk; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af66d49daffso361172166b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Aug 2025 05:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754655064; x=1755259864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7H80wazDhrSZXsCUSdHhSJpvhnQo21M43h8Ky6/QQsc=;
        b=aW9VOXykFy9EaBOjw1ysCPG1AnI8CFQy/n356NjYz32dkx1PLLCAk2gApqd7i72Pg9
         VIsJzv28lD/BbBgPN7xDEKu97+Y5PfQ5FcW8KoUqn/3akJRGQe/+yFytMjm4XPQH8R2p
         TPdg8WPTLDkfCLpjg6w9860Au8oQvWtZikzTFvXQvMOMnqgMMg5TLcfOmwVHXDxPe0sL
         JKttD5Ooy4/O7oZiHiRmn7+jq5Kpp99i59tjfrYpOEZPXbaif9sXNpxSgtwqflifxqy3
         9bgeCh/dYImGSAy6sPjIFy6w86r0nWOBfigRKkRZrqT4ObZZdnqSpibsys+MMcr8jJCj
         A4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754655064; x=1755259864;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7H80wazDhrSZXsCUSdHhSJpvhnQo21M43h8Ky6/QQsc=;
        b=FyejfArD8sbZ5NB+go630RQijMUc8LEMNe0SkBoX3RBybdHogElk4ezNeBWZocwazK
         BUbZD34sZbyd+OrdT96V5+86+1q0gncgB+I7ZcsCQyLDLC5l5rveCbL6LoSCOFpeKq6H
         Kl+ZoJl0sBGTd3LAWq3hSVhp1yvRX+F8iQtS+XlVsPr8CpdwJ7pDL1wIfPycqdc+gGl7
         XA3QH5T5/+FZlaSu6Aa+9wO7ChhSw0Ql2Dsia2giygmzumruPmRlji4u7tMiozP9P/qp
         y17i2Tc/5WrvLIZ+U90KdchMiYuug0/6shXeHfUMkoVa5zer/YXNfdsfnJa63GRnXw3V
         pb1A==
X-Forwarded-Encrypted: i=1; AJvYcCV6xWTBUm5iHKOZcNEwrXYZTtfXHWYoOYgTDywG2batTiVdKaMZArfbP5uzWX6VJhZHZhDn2bAn2R7jFOzT2MmayQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmq7jTbe43CLc2c36rLK7Po4J9O6f/AXLLhOT8Blgsb82n91C2
	O1te8QZ372F6jGt4SWEc0dYAI65FkHKduKLvU1sKiRAuYHKcGv0vXllTt4GB6C+Gq9U=
X-Gm-Gg: ASbGncs0FYbvaGgJ2XVQ6l6pYhjyNtNnjLjxJn+DRZFkeWAKllMiOSHOP8TRCBwxB5n
	Vuf8Sj1zsykGZ3SJwWxsSEs9Iz4RNWDZLf/4p1hnqTGWwpxPA9Oy5bkKnrtHg5IfkoxwBEr4Hz8
	EM8HceGmnpTWMeEofJA1jbNawcaWf62LSg49iWcKfaUu9M5CRh+HWn4AvhNofnFMwdK4HVMPEjA
	7GiM7RjLjmaY+ptjYYimO49/RuTT/MPOyvrYteYYnJQdK9uyQ88gfIqiHIJH6m2by2ZnlKYeO9y
	PRt5NhAYU3T1gh2z3UpXY+e2G43CQuGkJwa2wKnmLTRGrUut5FW61rWtTc208NyfnOWMwBrlYDV
	tMUsYmPLvYBWA6LxIFjZwHHQWhhqmEaw=
X-Google-Smtp-Source: AGHT+IEP1hKdTSLFyfN0oVcI9oj4h90fVgoQ1FAVba1VNEavj2ZZMm/pymmutdkY8hgx8gRVclajEQ==
X-Received: by 2002:a17:907:7fab:b0:ad8:a935:b908 with SMTP id a640c23a62f3a-af9c64fba5amr264177766b.30.1754655063505;
        Fri, 08 Aug 2025 05:11:03 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3375sm1485634566b.41.2025.08.08.05.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 05:11:03 -0700 (PDT)
Message-ID: <277ca37d-e304-4d78-bfd9-b1fa222fd0f3@tuxon.dev>
Date: Fri, 8 Aug 2025 15:11:01 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] soc: renesas: rz-sysc: Add syscon/regmap support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 John Madieu <john.madieu.xa@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
 <20250808061806.2729274-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUsFFd+orb17oQqoEidzYWMRjPoqMyzpgrdnicc=MRSYQ@mail.gmail.com>
 <cbdfa6fd-e65b-45d7-a21f-3bfdd46af332@tuxon.dev>
 <CAMuHMdXM=Mu+vJ6n3spj7Dd+8boLXEpcSn0M1KB8OwPijqq4aw@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdXM=Mu+vJ6n3spj7Dd+8boLXEpcSn0M1KB8OwPijqq4aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 08.08.2025 14:36, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, 8 Aug 2025 at 12:32, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 08.08.2025 12:29, Geert Uytterhoeven wrote:
>>> On Fri, 8 Aug 2025 at 08:18, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>> From: John Madieu <john.madieu.xa@bp.renesas.com>
>>>>
>>>> The RZ/G3E system controller has various registers that control or report
>>>> some properties specific to individual IPs. The regmap is registered as a
>>>> syscon device to allow these IP drivers to access the registers through the
>>>> regmap API.
>>>>
>>>> As other RZ SoCs might have custom read/write callbacks or max-offsets,
>>>> register a custom regmap configuration.
>>>>
>>>> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
>>>> [claudiu.beznea:
>>>>  - do not check the match->data validity in rz_sysc_probe() as it is
>>>>    always valid
>>>>  - dinamically allocate regmap_cfg]
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>
>>>> Changes in v4:
>>>> - adjusted the patch description by dropping "add" from
>>>>   "add register a custom regmap configuration"
>>>> - updated the list of changes from Claudiu Beznea
>>>> - dynamically allocate the regmap_config as proposed at [2]
>>>> - this patch is needed for proper function of USB (as proposed in this
>>>>   series) that being the reason it is introduced here, as well
>>>>
>>>> [2] https://lore.kernel.org/all/CAMuHMdVyf3Xtpw=LWHrnD2CVQX4xYm=FBHvY_dx9OesHDz5zNg@mail.gmail.com/
>>>
>>>> --- a/drivers/soc/renesas/rz-sysc.c
>>>> +++ b/drivers/soc/renesas/rz-sysc.c
>>> =
>>>> @@ -117,7 +125,26 @@ static int rz_sysc_probe(struct platform_device *pdev)
>>>>                 return PTR_ERR(sysc->base);
>>>>
>>>>         sysc->dev = dev;
>>>> -       return rz_sysc_soc_init(sysc, match);
>>>> +       ret = rz_sysc_soc_init(sysc, match);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       regmap_cfg = devm_kzalloc(dev, sizeof(*regmap_cfg), GFP_KERNEL);
>>>> +       if (!regmap_cfg)
>>>> +               return -ENOMEM;
>>>
>>> Is there any specific reason you decided to allocate regmap_cfg
>>> separately, instead of embedding it into struct rz_sysc?
>>
>> Sorry, I missed to mention.
>>
>> I chose to have it like this as the regmap_cfg is not used anywhere else
>> (through rz_sysc) except in probe.
> 
> OK.  Upon closer look, devm_regmap_init_mmio() does not save the
> regmap_cfg pointer for later use, so it can be allocated using kzalloc()
> instead, and freed immediately after calling devm_regmap_init_mmio().

You're right, I forgot this. I'll update it this way.

Thank you,
Claudiu

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


