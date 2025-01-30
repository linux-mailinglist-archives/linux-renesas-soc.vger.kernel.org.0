Return-Path: <linux-renesas-soc+bounces-12743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38893A22BF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 11:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94CC816857F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 10:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C001C07DD;
	Thu, 30 Jan 2025 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="okVltQAz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7CD1BD4E4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738234220; cv=none; b=XEseDZeDEnr3a7PGzWS6X2hW1Qx91q2wPuXR1ofCyIdGyihuMzRgrk10KBxD8uszzxdNMNuNJ4UafyL1mLvacRMHhLBo8Knk4rBi42VaH057zTMKvBhrn1d1FSkjMNjktKmpIGbBYm+CkOn31xOc05vXLyHkja50ULzsb0AXoeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738234220; c=relaxed/simple;
	bh=b/mMBfe5yGAaGHpFmunxqm2ro+eOBQzP6/VLUP04LdU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DxII/B6VYkla+NRsj56HbvpZvbhIzgcOaZZCqjfLUMdflxrt/lC6fThki3jHOGsf+3uqK1Wudpp4XQZrKsDmdDHf/Sf5CkzROrTrFQTnGD6mBjBSHHAKAkEieK35IJNFF2pNkwDJapn5DGZ1KBUCy9ttWfi+rhTPvibPh/gPZeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=okVltQAz; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf60d85238so114188766b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 02:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738234217; x=1738839017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e62YlGUXIAw8wozyK1kiiHHdUZMhPFXjOjYgl63mVoA=;
        b=okVltQAzwV1sHpvHR/UTSdG/nwUVINwH1R2vQDO9b88F7y+SiVPslB1SrpcjcuJwZw
         fj4JSTNtu1iEOLv32q/CSldJcMDjpYlacdIdpGMtrWdnbhF+vfxnyMZIp9CfTM5k1gX9
         qRSvaURQ7+Rbf6fzgMVNHUTCVLn7ejUucJnYXVxqCAxabyMEhOuQdSDUmHKIpuScpJZR
         gM4q/WMqIYTRTkwTzbjcLk/mVXIQid9kQOiEzDtPZPnlgdVDJhPTllqQTLEGaIEYtqco
         ZNjrKDJEitCsSXUCWbTYYdpOMmDJXAifKgH7xq3Kgk5DkXbvddmbf1noVdWXqIbe9/L4
         f+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738234217; x=1738839017;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e62YlGUXIAw8wozyK1kiiHHdUZMhPFXjOjYgl63mVoA=;
        b=QNpGo00SoYJM/U92lUaPb0lMJfVMLZ9LorYcYBThVobKHd10XpTOw8FgAJDdlnrzGb
         sAgzeDSOls6XnoZOIHLLy0HQJ0TnIGiU50PfLfjqx7IMDc1D2u1g5JM+3xJXaiUVhHyo
         0HLvafW4VvvoKcenWASlD8/jvUPyQ/GI9qDltNz4W4gdoiaSTi+w1jKAeLfWq2g47xVA
         YByYS+MxLialy0IIFQAPKk4j6gaWkRVZyZZe5tf3hh03l/tk0ICM1cvvFY/NAg+taggl
         b4WBvGA2N0uJn5Yvdosb9pBnReUfa9VKtZ18wmnt94joG6BhJBLRA1bMv4ntWzeoxiKM
         5yfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSixIqRvRTHInfknb4KCH3mgBlx263BYI6ASmbC+eAb3Jd+olrwChof3VDeapx6S6/+Uw0PGabz9+5hkeSKLvOpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybhGmC+3DdeGWgPG2V+euqj2Y0T1rj6ER9KV4Az8SIqEskR4jA
	H1CkWRQ+PUxVlgLnqS8ImqsfH58vB05jnKdj/vdO5Edx5Jljn1RUUbDCbNmsY/Y=
X-Gm-Gg: ASbGncuFIm72au0LF43fgLl6i0xowWISxAkSbKl3OIV7lDXzzh7HOMn4d1J4jKE6y71
	wPxucY/9V0w175acjhJnd3D8CPUCaYQIHsrnBMENTOyoeFQlG/ZKMU+K0PCTEkTCAOCLIHWSfFw
	+nn8uUESofmt5lQTb6LmPL5I8StBq4eEmY7ul51HjxrNd3vKvESEgbqNNEJf6gCxftBNPYHwfSg
	swgSliLDQgsxt0lZ4HNOalcH9EyVRwZT9lapg3M0SefRg6WBJcGnWNjmRh2QwNbB2MWA0C2dscC
	D4IhBd8oLVhpI6rFY+3dK4ug
X-Google-Smtp-Source: AGHT+IHWoNagdbyI+0VCJRCuNUgGA7SE/I4LH2LJrOHgZ3deawOyjrGsdrBIZ5qzd2KNDtUu3ZBA4Q==
X-Received: by 2002:a17:906:178a:b0:ab6:d467:811b with SMTP id a640c23a62f3a-ab6d467849emr482692566b.32.1738234216026;
        Thu, 30 Jan 2025 02:50:16 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7df0sm100215566b.2.2025.01.30.02.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 02:50:15 -0800 (PST)
Message-ID: <3d1abbd5-8ca6-4cd3-9800-e9aeda398e86@tuxon.dev>
Date: Thu, 30 Jan 2025 12:50:13 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, ulf.hansson@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
 <Z5tPR_tv7vWDkUI7@mai.linaro.org>
 <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
Content-Language: en-US
In-Reply-To: <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.01.2025 12:30, Claudiu Beznea wrote:
> 
> 
> On 30.01.2025 12:07, Daniel Lezcano wrote:
>> On Thu, Jan 30, 2025 at 11:08:03AM +0200, Claudiu Beznea wrote:
>>> Hi, Daniel,
>>>
>>> On 29.01.2025 19:24, Daniel Lezcano wrote:
>>>> Hi Claudiu,
>>>>
>>>> On Fri, Jan 03, 2025 at 06:38:01PM +0200, Claudiu wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
>>>>> clocks are managed through PM domains. These PM domains, registered on
>>>>> behalf of the clock controller driver, are configured with
>>>>> GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
>>>>> clocks are enabled/disabled using runtime PM APIs.
>>>>>
>>>>> During probe, devices are attached to the PM domain controlling their
>>>>> clocks. Similarly, during removal, devices are detached from the PM domain.
>>>>>
>>>>> The detachment call stack is as follows:
>>>>>
>>>>> device_driver_detach() ->
>>>>>   device_release_driver_internal() ->
>>>>>     __device_release_driver() ->
>>>>>       device_remove() ->
>>>>>         platform_remove() ->
>>>>> 	  dev_pm_domain_detach()
>>>>>
>>>>> In the upcoming Renesas RZ/G3S thermal driver, the
>>>>> struct thermal_zone_device_ops::change_mode API is implemented to
>>>>> start/stop the thermal sensor unit. Register settings are updated within
>>>>> the change_mode API.
>>>>>
>>>>> In case devres helpers are used for thermal zone register/unregister the
>>>>> struct thermal_zone_device_ops::change_mode API is invoked when the
>>>>> driver is unbound. The identified call stack is as follows:
>>>>>
>>>>> device_driver_detach() ->
>>>>>   device_release_driver_internal() ->
>>>>>     device_unbind_cleanup() ->
>>>>>       devres_release_all() ->
>>>>>         devm_thermal_of_zone_release() ->
>>>>> 	  thermal_zone_device_disable() ->
>>>>> 	    thermal_zone_device_set_mode() ->
>>>>> 	      rzg3s_thermal_change_mode()
>>>>>
>>>>> The device_unbind_cleanup() function is called after the thermal device is
>>>>> detached from the PM domain (via dev_pm_domain_detach()).
>>>>>
>>>>> The rzg3s_thermal_change_mode() implementation calls
>>>>> pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() before/after
>>>>> accessing the registers. However, during the unbind scenario, the
>>>>> devm_thermal_of_zone_release() is invoked after dev_pm_domain_detach().
>>>>> Consequently, the clocks are not enabled, as the device is removed from
>>>>> the PM domain at this time, leading to an Asynchronous SError Interrupt.
>>>>> The system cannot be used after this.
>>>>
>>>> I've been through the driver before responding to this change. What is the
>>>> benefit of powering down / up (or clock off / on) the thermal sensor when
>>>> reading the temperature ?
>>>>
>>>> I can understand for disable / enable but I don't get for the classic usage
>>>> where a governor will be reading the temperature regularly.
>>>
>>> I tried to be as power saving as possible both at runtime and after the IP
>>> is not used anymore as the HW manual doesn't mentioned anything about
>>> accuracy or implications of disabling the IP clock at runtime. We use
>>> similar approach (of disabling clocks at runtime) for other IPs in the
>>> RZ/G3S SoC as well.
>>>
>>>>
>>>> Would the IP need some cycles to capture the temperature accurately after the
>>>> clock is enabled ?
>>>
>>> There is nothing about this mentioned about this in the HW manual of the
>>> RZ/G3S SoC. The only points mentioned are as described in the driver code:
>>> - wait at least 3us after each IIO channel read
>>> - wait at least 30us after enabling the sensor
>>> - wait at least 50us after setting OE bit in TSU_SM
>>>
>>> For this I chose to have it implemented as proposed.
>>
>> IMO, disabling/enabling the clock between two reads through the pm runtime may
>> not be a good thing, especially if the system enters a thermal situation where
>> it has to mitigate.

If it's not 100% safe I can drop the runtime PM support.

>>
>> Without any testing capturing the temperatures and compare between the always-on
>> and on/off, it is hard to say if it is true or not. Up to you to test that or
>> not. If you think it is fine, then let's go with it.
> 
> I tested it with and w/o the runtime PM and on/off support (so, everything
> ON from the probe) and the reported temperature values were similar.
> 
> Thank you,
> Claudiu
> 
>>  
>>> If any, the HW manual is available here
>>> https://www.renesas.com/en/document/mah/rzg3s-group-users-manual-hardware?r=25458591
>>> (an archive is here; the manual is in Deliverables/r01uh1014ej0110-rzg3s.pdf)
>>>
>>> Thank you for your review,
>>> Claudiu
>>>
>>>>
>>>>> Add thermal_of_zone_register()/thermal_of_zone_unregister(). These will
>>>>> be used in the upcomming RZ/G3S thermal driver.
>>>>>
>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>
> 


