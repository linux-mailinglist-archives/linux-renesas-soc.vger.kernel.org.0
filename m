Return-Path: <linux-renesas-soc+bounces-13190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69703A36EA2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Feb 2025 14:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2543916EDB9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Feb 2025 13:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AEF1C8617;
	Sat, 15 Feb 2025 13:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EsTOF6wc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA632AD2D
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Feb 2025 13:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739627474; cv=none; b=o935/0ZgbrS5aNCavLKZDDGGPvogBGKJgUCULO1yj3izWtJEiIUySRhl6nBjc6Je8xnveKxDuaUMpzz7Kts59lYLdqpRuN1xT951UBnmjAAEUnh/dAi63zIAekFZVeySv4Hj4tQFYTSKfutt5taElAh/0F3afY9gpvoCYQVg7bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739627474; c=relaxed/simple;
	bh=7QYxIZYVkBPVcBRtZV1bHOD2EOWvDuyh0f+6TKXwhHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JcdUU3kPz7ebf9h2FZq45EErUdIGGXQNkSmzVclKCVH5n1Zw5V8WKy/JKuwGycxR4NsjdEW84qk74JKjzOZkK/ruRYuzPENtBQ5AL8IHVGTrXdBbppu6D20Pwneb5BjMRH5BjGVds68yrn4jCJ9PXP8qnkgZrdNP9NoK0DlUufs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EsTOF6wc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so205730a12.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Feb 2025 05:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739627469; x=1740232269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGe5zFm2hqgl1riWslKYEhwYCtjiJiuO8PGs9H4DGXM=;
        b=EsTOF6wcqyEIbbjf4/cFsaGtRww4IxDHiYF8o/x0pzLFYsYdDndZ0iPNiIVo98fbFt
         3RgmKKoKGBS/WeQ5NgjRp3T30PIVhuee68uHjTEcZUMWVUR0VZQwan/ann3KtskweLPU
         R9m8UaZQrHFjJMExKdXoyk76yKt4hv0ZwWHm5qBkkL8ALryXjowqATomEf/yVSw/JZCt
         s6p/f6egzCfmRGlFgKwr2T2usJS+vuX/ZgoEzD+9AJB9pB39op1EQ65XDpYR8lOSfF+A
         HLcHLLvXE+WyX2AR7FMOKBBzhvaiGaMmEp68U/DvS/ZUxmdGICUzIR75ueTmb21iDL9l
         Z/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739627469; x=1740232269;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGe5zFm2hqgl1riWslKYEhwYCtjiJiuO8PGs9H4DGXM=;
        b=nswkRpb3OUDTu3zBu28Uo4/QeIuIC9FCN4LiQrWMH21B3uUxbYGqJb65XdVPg4/Ihu
         QeeKJlJaCxslSebkMM6y2hZoLRzutNmh5TnVGw0mT/EwKDA2JvUk+oSWzB/0//JVJbAn
         vu6ccOgfOh4lrI5rA5XKLNi2KkT42FIhU5KvdG4VJgwbEuCG6iH5YM0PF3QMUMEP7bFD
         utrFxKigLqzkVlETPJH2kPncl7w5tNZiHuf8OI80U1GLIb0IwxJzKaBr44a6chGlM9HS
         EJRtTjT2rqQzC9sBDWNiHcNKOO1KqJMrmTb7aDQkO8SIpsxBXjPdN7epfXNfBo2Uwic/
         VUeA==
X-Forwarded-Encrypted: i=1; AJvYcCWeo1BkCcZQOcp8ZBgw26kGtXBNyYb8Jv4xWOHqYtBqTTdbj2A6lpd9JttnhCXW0pWajoDASZcYaTf9rgjFcg9MLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8sp2Lkymmr0GvGOTDEaSg/ia4qztXX3CaQqe2j5uL7qP+7RiJ
	dhYXGSJZ3AdpXW6BTFhOTmRKK537GbF3ppX3RRuxmgg1jBrZ2RtTohGo5Y0Ln1hEJiuq3misGvZ
	s
X-Gm-Gg: ASbGncsBcftj8xMkVTuObabzBiWmI9OgfhHwTyDeYLMiiCBy6TjR776AYfQVZGUYNBl
	kFVnDp/e+Z3lM/GuQoslGLtR4mB6hLkjhT4F4ol1NJXycb9S+W1rdOwxRmjLEyfj97nC9C2JSZl
	sr7cpvk60/ho+UQv8d/wl7JPrD8hAtxy3M6yNefNvuAaYKRs80it/w1ZCLNh07b7zuY+S8VQdOj
	4Y+tNelseamTBX/2HXrGcLyksFM5sTZiuu4WLLm2Oe+BqPI/1nw2G/BZks8dYI6opea0Yz1ZuFZ
	2i+McW/Qeofui9TDfhKrKAlW
X-Google-Smtp-Source: AGHT+IHAE3K34tunCi2jsOlYrjn2E1aFkpBBzksorxYjrR1g/vjBHfziIANjKfKbdmU98ZykDePgDg==
X-Received: by 2002:a05:6402:1d52:b0:5dc:88fe:dcd1 with SMTP id 4fb4d7f45d1cf-5e036071a81mr3271834a12.12.1739627469583;
        Sat, 15 Feb 2025 05:51:09 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece271223sm4598233a12.59.2025.02.15.05.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2025 05:51:08 -0800 (PST)
Message-ID: <4bf01946-90e3-4169-91fa-10d9f90310e9@tuxon.dev>
Date: Sat, 15 Feb 2025 15:51:06 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: platform: Use devres group to free driver
 probe resources
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, dakr@kernel.org, jic23@kernel.org,
 ulf.hansson@linaro.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com>
 <2025021539-untrained-prompter-a48f@gregkh>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <2025021539-untrained-prompter-a48f@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Greg,

On 15.02.2025 15:25, Greg KH wrote:
> On Sat, Feb 15, 2025 at 03:08:49PM +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
>> clocks are managed through PM domains. These PM domains, registered on
>> behalf of the clock controller driver, are configured with
>> GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
>> clocks are enabled/disabled using runtime PM APIs. The power domains may
>> also have power_on/power_off support implemented. After the device PM
>> domain is powered off any CPU accesses to these domains leads to system
>> aborts.
>>
>> During probe, devices are attached to the PM domain controlling their
>> clocks and power. Similarly, during removal, devices are detached from the
>> PM domain.
>>
>> The detachment call stack is as follows:
>>
>> device_driver_detach() ->
>>   device_release_driver_internal() ->
>>     __device_release_driver() ->
>>       device_remove() ->
>>         platform_remove() ->
>> 	  dev_pm_domain_detach()
>>
>> During driver unbind, after the device is detached from its PM domain,
>> the device_unbind_cleanup() function is called, which subsequently invokes
>> devres_release_all(). This function handles devres resource cleanup.
>>
>> If runtime PM is enabled in driver probe via devm_pm_runtime_enable(), the
>> cleanup process triggers the action or reset function for disabling runtime
>> PM. This function is pm_runtime_disable_action(), which leads to the
>> following call stack of interest when called:
>>
>> pm_runtime_disable_action() ->
>>   pm_runtime_dont_use_autosuspend() ->
>>     __pm_runtime_use_autosuspend() ->
>>       update_autosuspend() ->
>>         rpm_idle()
>>
>> The rpm_idle() function attempts to resume the device at runtime. However,
>> at the point it is called, the device is no longer part of a PM domain
>> (which manages clocks and power states). If the driver implements its own
>> runtime PM APIs for specific functionalities - such as the rzg2l_adc
>> driver - while also relying on the power domain subsystem for power
>> management, rpm_idle() will invoke the driver's runtime PM API. However,
>> since the device is no longer part of a PM domain at this point, the PM
>> domain's runtime PM APIs will not be called. This leads to system aborts on
>> Renesas SoCs.
>>
>> Another identified case is when a subsystem performs various cleanups
>> using device_unbind_cleanup(), calling driver-specific APIs in the process.
>> A known example is the thermal subsystem, which may call driver-specific
>> APIs to disable the thermal device. The relevant call stack in this case
>> is:
>>
>> device_driver_detach() ->
>>   device_release_driver_internal() ->
>>     device_unbind_cleanup() ->
>>       devres_release_all() ->
>>         devm_thermal_of_zone_release() ->
>> 	  thermal_zone_device_disable() ->
>> 	    thermal_zone_device_set_mode() ->
>> 	      struct thermal_zone_device_ops::change_mode()
>>
>> At the moment the driver-specific change_mode() API is called, the device
>> is no longer part of its PM domain. Accessing its registers without proper
>> power management leads to system aborts.
>>
>> Open a devres group before calling the driver probe, and close it
>> immediately after the driver remove function is called and before
>> dev_pm_domain_detach(). This ensures that driver-specific devm actions or
>> reset functions are executed immediately after the driver remove function
>> completes. Additionally, it prevents driver-specific runtime PM APIs from
>> being called when the device is no longer part of its power domain.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Hi,
>>
>> Although Ulf gave its green light for the approaches on both IIO [1],
>> [2] and thermal subsystems [3], Jonathan considered unacceptable the
>> approaches in [1], [2] as he considered it may lead to dificult to
>> maintain code and code opened to subtle bugs (due to the potential of
>> mixing devres and non-devres calls). He pointed out a similar approach
>> that was done for the I2C bus [4], [5].
>>
>> As the discussions in [1], [2] stopped w/o a clear conclusion, this
>> patch tries to revive it by proposing a similar approach that was done
>> for the I2C bus.
>>
>> Please let me know you input.
> 
> I'm with Jonathan here, the devres stuff is getting crazy here and you
> have drivers mixing them and side affects happening and lots of
> confusion.  Your change here is only going to make it even more
> confusing, and shouldn't actually solve it for other busses (i.e. what
> about iio devices NOT on the platform bus?)

You're right, other busses will still have this problem.

> 
> Why can't your individual driver handle this instead?

Initially I tried it at the driver level by using non-devres PM runtime
enable API but wasn't considered OK by all parties.

I haven't thought about having devres_open_group()/devres_close_group() in
the driver itself but it should work.

Thank you,
Claudiu

> 
> thanks,
> 
> greg k-h


