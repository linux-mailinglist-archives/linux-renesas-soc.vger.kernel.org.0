Return-Path: <linux-renesas-soc+bounces-18353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E65ADAEB8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 13:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD5A03A92D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 11:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648E22D879F;
	Mon, 16 Jun 2025 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nVKgF7iy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2AB261570
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073839; cv=none; b=OY09T4SY1sUkvsx9DPMYiGJ1qkK5UnrA7AAT4sCo4nIEPZ5cHVLZ+byxN4L6IDgDQR6KzRk8e7KZP3CJdvIr0+VoHXPA9JJpKiaVOYHafhQfMiCYaEvPFS+4pMGzJgLhR1HB3LROzpq6wbQCMzKquP96/7Q3beDDd4HQIgxV0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073839; c=relaxed/simple;
	bh=JsWLZzQTRBPO80hHR2MkijbaHfX3q09pvTBXpssbON4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ME1sW2rVhdOdcVAq4VIhwkJb2AR2TqP/4fhg8oRR36lSadqUB0ByBV11zedpO2ohyFwfAuDNY5zmgwaU0IBbQO9u8ME+EwLBbzC0xRlW6j0MA/PIpL9D+rc7qVMmLjzTp2aMHp8BC8qjvD/sMFWsBgupeayyLZjjQvMWAqXVSL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nVKgF7iy; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso8566333a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 04:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750073835; x=1750678635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fqps01xAn+ufX8cXNqnzTmjdMwbQ7+l3ycOFCn7T4CU=;
        b=nVKgF7iyImhD7Ir/LyE7Past2M6vlSqZsazRsEOsSMY0clL9+dYnpArxXd0+uDVGL9
         Cnu50quzgsUYkT4Fht91UMxJ7WhVFp5im0Qccf8LCUwf8Vi1jF/SEeo1T+WFCPIWIGzt
         stJOpZ8qV3cb9Ma5OJqCI10J71G+yVyCx00Yp0DJBxwemIaex5yEztzchv5+SHIdapOw
         5E6fDxScA+BwQE+vXq/Lyjaixe8vQFX0M9IBjcEge2KfA99hEqdSASzQ65JWS9LnFL+4
         dHjfHrI49wYO9bxM6ySlERCzlmOujw8PbdrsM85E0koe+1fz8AYA2/bPmU+bxCWopD7T
         ajLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750073835; x=1750678635;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqps01xAn+ufX8cXNqnzTmjdMwbQ7+l3ycOFCn7T4CU=;
        b=Jf2zKgLjvyw6iU5eRsm+ogDWWSFnY+0HZAbnty0QVt7UbOOC3sg7Jyj09zE1CJ7rPs
         C5sUovzvXXZ1VYtqWMAU7In4fHPoVQt40W26xTamjUWLjPG6wWJkfdP0eDnjXB/7RalK
         R00sBwaT8CI97YOkhx0qoEFM0MXXmrCj47HGHEggdD/XFr1KgiQUedjsudILWb06BhvI
         8aJlqRIpfluPKIHhV1+VoQfDFY4YlikaTknwsLHqSBjV/wUW/YLja2tpqSze9l2vKYvd
         ii5mj5tlFCa12jizcR4I5jQ16CA3gMQw4Y9ypeUHd+YVcX8VEiz6viCqmUP0oTup/qLM
         E0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVlG//i7JHmiYPiANb/AI+FPRwYg8+GOPElxwoEddBfdUIVZZN49HjJhtwIO4N5X511FewHgoNVtXSsMtVAH0xrRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcvB7InDllzz4YHU+wEc7p3rc6DXqxfok3UsSPxehByCUiGIv5
	DQ5bpbUqJKqi5ahUQGXt4b/mZOhRu2j4AgKw5CS4lMZFn+5tB9SK8WcxT8xC7mO6kRs=
X-Gm-Gg: ASbGnct1dJjOiRcANC1rBAdZEFUJFW6CbB6RI3TKYDzasGyk3t8GhA4P3T0oZpcALSS
	Nrw+pm2YorKPcnwOe5Li/hjyBkjj3eC+1cHgs7bcudV2sBbP9ELUSPtJi79HxpJFAHbKU+4Z/6b
	Ss4ACz+DwSpkz8jvsgqyKJ2SPb8s4BXzg9fGdWAWIZjVLvnoPiRwzpikq6P2lb6i6rjWUWwZ2XL
	SXgxZ2VsxOG6kQcxpGzDE7ZcgqsCcihQ4V4BiJ9e6SxOeyl0wGKDFmJ0Tqoz2Ralq3wZMo8klEK
	7OLn312Kmff0qVxvUUuC1dC4MqRqNckvIeU/aNC5+uZKgtMUfh7r160alzgl8YVmkTqbzz8=
X-Google-Smtp-Source: AGHT+IF+V2wo9BZ0sFidE7RWAYeIfibmbljW8n79SLf0MLj2poZnzBE9gG1l54wN+yQSUl2Bn/YPiw==
X-Received: by 2002:a50:9fa8:0:b0:608:f54b:5c81 with SMTP id 4fb4d7f45d1cf-608f54b5e6dmr5069142a12.1.1750073835049;
        Mon, 16 Jun 2025 04:37:15 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48f33c6sm5959159a12.30.2025.06.16.04.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:37:14 -0700 (PDT)
Message-ID: <1b83c587-76c2-4fa1-aef8-f94575a3627a@tuxon.dev>
Date: Mon, 16 Jun 2025 14:37:13 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] PM: domains: Add devres variant for
 dev_pm_domain_attach()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, gregkh@linuxfoundation.org,
 dakr@kernel.org, len.brown@intel.com, pavel@kernel.org,
 ulf.hansson@linaro.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bhelgaas@google.com,
 geert@linux-m68k.org, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, fabrizio.castro.jz@renesas.com,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250606111749.3142348-1-claudiu.beznea.uj@bp.renesas.com>
 <20250606111749.3142348-2-claudiu.beznea.uj@bp.renesas.com>
 <CAJZ5v0i_Ey+OVpSZHXru=tubMaZi=y-uOh_0M6zmWZ2DqqA7Vg@mail.gmail.com>
 <zhjytvj35lknj7v3jhva3n3nbv6qctvqgykwyi5huj6omet7lz@wchd7f4p4dpv>
 <CAJZ5v0hsT-Q2hz=qoBo409oungaCmexJwwGheN7KRLFqz=6_Dw@mail.gmail.com>
 <20250607140600.76e87ea5@jic23-huawei>
 <CAJZ5v0jqZ6gYKb85dpR-X5RwFeUBcbbcJ_b-AOe+JypBXod-MA@mail.gmail.com>
 <486a1110-5336-42fd-82b8-a7b1452bad65@tuxon.dev>
 <CAJZ5v0hqBm4L2V9aUjB0tmW67eRRCnM7FScgdJQ=ihnpAZuMfA@mail.gmail.com>
 <4360ee7a-d85a-4fa0-a1d6-d09a3b9d57c0@tuxon.dev>
 <CAJZ5v0jUGf9QO6h6bcBcTX+nUbDeD0XMhWj1Qb-0qAtZ8EbVsA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAJZ5v0jUGf9QO6h6bcBcTX+nUbDeD0XMhWj1Qb-0qAtZ8EbVsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16.06.2025 14:18, Rafael J. Wysocki wrote:
> On Mon, Jun 16, 2025 at 11:37 AM Claudiu Beznea
> <claudiu.beznea@tuxon.dev> wrote:
>>
>> Hi, Rafael,
>>
>> On 13.06.2025 13:02, Rafael J. Wysocki wrote:
>>> On Fri, Jun 13, 2025 at 9:39 AM Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>>>
>>>> Hi, Rafael,
>>>>
>>>> On 09.06.2025 22:59, Rafael J. Wysocki wrote:
>>>>> On Sat, Jun 7, 2025 at 3:06 PM Jonathan Cameron <jic23@kernel.org> wrote:
>>>>>>
>>>>>> On Fri, 6 Jun 2025 22:01:52 +0200
>>>>>> "Rafael J. Wysocki" <rafael@kernel.org> wrote:
>>>>>>
>>>>>> Hi Rafael,
>>>>>>
>>>>>>> On Fri, Jun 6, 2025 at 8:55 PM Dmitry Torokhov
>>>>>>> <dmitry.torokhov@gmail.com> wrote:
>>>>>>>>
>>>>>>>> On Fri, Jun 06, 2025 at 06:00:34PM +0200, Rafael J. Wysocki wrote:
>>>>>>>>> On Fri, Jun 6, 2025 at 1:18 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>>>>>>>
>>>>>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>>>>
>>>>>>>>>> The dev_pm_domain_attach() function is typically used in bus code alongside
>>>>>>>>>> dev_pm_domain_detach(), often following patterns like:
>>>>>>>>>>
>>>>>>>>>> static int bus_probe(struct device *_dev)
>>>>>>>>>> {
>>>>>>>>>>     struct bus_driver *drv = to_bus_driver(dev->driver);
>>>>>>>>>>     struct bus_device *dev = to_bus_device(_dev);
>>>>>>>>>>     int ret;
>>>>>>>>>>
>>>>>>>>>>     // ...
>>>>>>>>>>
>>>>>>>>>>     ret = dev_pm_domain_attach(_dev, true);
>>>>>>>>>>     if (ret)
>>>>>>>>>>         return ret;
>>>>>>>>>>
>>>>>>>>>>     if (drv->probe)
>>>>>>>>>>         ret = drv->probe(dev);
>>>>>>>>>>
>>>>>>>>>>     // ...
>>>>>>>>>> }
>>>>>>>>>>
>>>>>>>>>> static void bus_remove(struct device *_dev)
>>>>>>>>>> {
>>>>>>>>>>     struct bus_driver *drv = to_bus_driver(dev->driver);
>>>>>>>>>>     struct bus_device *dev = to_bus_device(_dev);
>>>>>>>>>>
>>>>>>>>>>     if (drv->remove)
>>>>>>>>>>         drv->remove(dev);
>>>>>>>>>>     dev_pm_domain_detach(_dev);
>>>>>>>>>> }
>>>>>>>>>>
>>>>>>>>>> When the driver's probe function uses devres-managed resources that depend
>>>>>>>>>> on the power domain state, those resources are released later during
>>>>>>>>>> device_unbind_cleanup().
>>>>>>>>>>
>>>>>>>>>> Releasing devres-managed resources that depend on the power domain state
>>>>>>>>>> after detaching the device from its PM domain can cause failures.
>>>>>>>>>>
>>>>>>>>>> For example, if the driver uses devm_pm_runtime_enable() in its probe
>>>>>>>>>> function, and the device's clocks are managed by the PM domain, then
>>>>>>>>>> during removal the runtime PM is disabled in device_unbind_cleanup() after
>>>>>>>>>> the clocks have been removed from the PM domain. It may happen that the
>>>>>>>>>> devm_pm_runtime_enable() action causes the device to be runtime-resumed.
>>>>>>>>>
>>>>>>>>> Don't use devm_pm_runtime_enable() then.
>>>>>>>>
>>>>>>>> What about other devm_ APIs? Are you suggesting that platform drivers
>>>>>>>> should not be using devm_clk*(), devm_regulator_*(),
>>>>>>>> devm_request_*_irq() and devm_add_action_or_reset()? Because again,
>>>>>>>> dev_pm_domain_detach() that is called by platform bus_remove() may shut
>>>>>>>> off the device too early, before cleanup code has a chance to execute
>>>>>>>> proper cleanup.
>>>>>>>>
>>>>>>>> The issue is not limited to runtime PM.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>> If the driver specific runtime PM APIs access registers directly, this
>>>>>>>>>> will lead to accessing device registers without clocks being enabled.
>>>>>>>>>> Similar issues may occur with other devres actions that access device
>>>>>>>>>> registers.
>>>>>>>>>>
>>>>>>>>>> Add devm_pm_domain_attach(). When replacing the dev_pm_domain_attach() and
>>>>>>>>>> dev_pm_domain_detach() in bus probe and bus remove, it ensures that the
>>>>>>>>>> device is detached from its PM domain in device_unbind_cleanup(), only
>>>>>>>>>> after all driver's devres-managed resources have been release.
>>>>>>>>>>
>>>>>>>>>> For flexibility, the implemented devm_pm_domain_attach() has 2 state
>>>>>>>>>> arguments, one for the domain state on attach, one for the domain state on
>>>>>>>>>> detach.
>>>>>>>>>
>>>>>>>>> dev_pm_domain_attach() is not part driver API and I'm not convinced at
>>>>>>>>
>>>>>>>> Is the concern that devm_pm_domain_attach() will be [ab]used by drivers?
>>>>>>>
>>>>>>> Yes, among other things.
>>>>>>
>>>>>> Maybe naming could make abuse at least obvious to spot? e.g.
>>>>>> pm_domain_attach_with_devm_release()
>>>>>
>>>>> If I'm not mistaken, it is not even necessary to use devres for this.
>>>>>
>>>>> You might as well add a dev_pm_domain_detach() call to
>>>>> device_unbind_cleanup() after devres_release_all().  There is a slight
>>>>> complication related to the second argument of it, but I suppose that
>>>>> this can be determined at the attach time and stored in a new device
>>>>> PM flag, or similar.
>>>>>
>>>>
>>>> I looked into this solution. I've tested it for all my failure cases and
>>>> went good.
>>>
>>> OK
>>>
>>>>> Note that dev->pm_domain is expected to be cleared by ->detach(), so
>>>>> this should not cause the domain to be detached twice in a row from
>>>>> the same device, but that needs to be double-checked.
>>>>
>>>> The genpd_dev_pm_detach() calls genpd_remove_device() ->
>>>> dev_pm_domain_set(dev, NULL) which sets the dev->pm_domain = NULL. I can't
>>>> find any other detach function in the current code base.
>>>
>>> There is also acpi_dev_pm_detach() which can be somewhat hard to find,
>>> but it calls dev_pm_domain_set(dev, NULL) either.
>>>
>>>> The code I've tested for this solution is this one:
>>>>
>>>> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
>>>> index b526e0e0f52d..5e9750d007b4 100644
>>>> --- a/drivers/base/dd.c
>>>> +++ b/drivers/base/dd.c
>>>> @@ -25,6 +25,7 @@
>>>>  #include <linux/kthread.h>
>>>>  #include <linux/wait.h>
>>>>  #include <linux/async.h>
>>>> +#include <linux/pm_domain.h>
>>>>  #include <linux/pm_runtime.h>
>>>>  #include <linux/pinctrl/devinfo.h>
>>>>  #include <linux/slab.h>
>>>> @@ -552,8 +553,11 @@ static void device_unbind_cleanup(struct device *dev)
>>>>         dev->dma_range_map = NULL;
>>>>         device_set_driver(dev, NULL);
>>>>         dev_set_drvdata(dev, NULL);
>>>> -       if (dev->pm_domain && dev->pm_domain->dismiss)
>>>> -               dev->pm_domain->dismiss(dev);
>>>> +       if (dev->pm_domain) {
>>>> +               if (dev->pm_domain->dismiss)
>>>> +                       dev->pm_domain->dismiss(dev);
>>>> +               dev_pm_domain_detach(dev, dev->pm_domain->detach_power_off);
>>>
>>> I would do the "detach" before the "dismiss" to retain the current ordering.
>>
>> I applied on my local development branch all your suggestions except this
>> one because genpd_dev_pm_detach() as well as acpi_dev_pm_detach() set
>> dev->pm_domain = NULL.
>>
>> Due to this I would call first ->dismiss() then ->detach(), as initially
>> proposed. Please let me know if you consider it otherwise.
> 
> This is a matter of adding one more dev->pm_domain check AFAICS, but OK.

I don't know all the subtleties around this, my concern with adding one
more check on dev->pm_domain was that the
dev->pm_domain->dismiss() will never be called if the ->detach() function
will be called before ->dismiss() and it will set dev->pm_domain = NULL (as
it does today (though genpd_dev_pm_detach() and acpi_dev_pm_detach())).

For platform drivers that used to call dev_pm_domain_detach() in platform
bus remove function, if I'm not wrong, the dev->pm_domain->dismiss() was
never called previously. If that is a valid scenario, the code proposed in
this thread will change the behavior for devices that have ->dismiss()
implemented.

Thank you,
Claudiu


