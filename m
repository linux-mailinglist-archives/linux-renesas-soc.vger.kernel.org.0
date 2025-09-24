Return-Path: <linux-renesas-soc+bounces-22307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B89BB99103
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 11:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3073F4C138D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 09:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7279B2D6612;
	Wed, 24 Sep 2025 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Riur107r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411572D5952
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758705567; cv=none; b=ofQeBRbB/UFcje3GDOJCr94Ob+4E520bbUvzE+AWvm2dljX2cN6pXMYiQG7L3lUoghXnbvUgFvcBEPBsUBU3mSIAk+pmmtvZsS/D3FpJN7msvtyjbRSi9IPL+w4BbAxy1x2n9epnR/qBFwy4jW2aK+PQat2mRWAfqLD6n/mj3jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758705567; c=relaxed/simple;
	bh=VqlcvGqMPJAdl7hSEV7CqDPxkgpjg8Yi/vcEVwXAflk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAo/w6xAz/SvCh9TnqQFmK4V7agf/pT8XsT2toFBrplTWv9jcwQtOKI8q5HnXHd/Z1UnRP4T/JMaXSdaHiuTVrzE44tcBRkhXkGvhGaIBLFHIeYL18ngSGiWKiSvnJ3g2oUh/DvfBBpOgpxtiyGFuHLwvbainDdA2DCppODosDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Riur107r; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so6673725e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758705563; x=1759310363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcPTl1pw20xF2xL7FtliTszvEQuPfkvcja+d9xb0xj8=;
        b=Riur107rjbDNCk96GKnA+/aRAPFqD1XKsB8FYTus90l1x1+LnzN0H5WtobKIPmPONk
         8UFu7qrQ3JSvYHFIXZLOlhDXau3fFfkMzJSPtTQpA5rLn/20rgHfRqQ03wY0jZ4ZtLof
         puQ7EinPT6L/tUJaj5l/cBkq+cp7QTUsU2zZD/oYsemILZYT4+nnVRdjSIhLp/ZmNPfe
         mkvH2HwgUYsGcdZeDCM9vig8SE+jNAeyHgyIBuSZRKCWwiTMOa34O/o5FvNlGKMPNuuo
         1NawgIvbrSUaPrx9ja2mOX183KqMtT3cUcK8H4D6+xsQ/0DvqG6x0iGureeFNzVAtcQ+
         TLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758705563; x=1759310363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcPTl1pw20xF2xL7FtliTszvEQuPfkvcja+d9xb0xj8=;
        b=aHduyexcSFS6ZcmnkIXVMyZCzf6+8rhT9GzrtAFLxp8TZMZ9zIcuWCBzOlkRarwTs2
         DF+5T8FHsaa1r2a3JjDlYdiBCswy44pVKmo4ufDFYOrgUYoIsVLKAoBZ726Ml5MLYWjI
         CqBAqRw4mOxgRWLIzoalm6JqF8CUMY4FQAjMCJfaEeRzUwtYhTHMGqes4C7Vwkr7xeZr
         f3KQejvwG8gIm/plv4oVi7hmYhYZnI58TgfPvu+WfrVnJxQQs5S9oMrCc1RvBUd0FWkv
         TroSt5PvSglt5Ld99jvHihiPvUDnGo/aE1cSckLAXl6za6RIzGX3qKYFhwPKYeZaXlu1
         pX9A==
X-Forwarded-Encrypted: i=1; AJvYcCUvT+fs4XhSeM8JEEnqQ6Odsz2p4eMVVIjlR1+psi/4y9xUr2ClLtGaECkvSMputkRP5sYlGf3cFV4mJpBVK7XElQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq681VYEzmaiX/+62ZAAzmqRDsyiAMOUdhnKG0NsQKtO/4rnib
	VSznnSXXM9sD4pjqLNMqhmdDccLFo6ror++PVhVyvNKDkKNo+jSLR30kpvih73kUV+s=
X-Gm-Gg: ASbGncv+byAEftbTs7GZZ66ITOHA0SNjJ0gy8vAOIbqQYDi/dsp73YrvWp53HRQzf10
	8Ugn9q0+pn20+llT/qSLxyUoc0cKnbMZFkQbCpfn9jmqXMkHeKGYJfRHPBLLnyv4ZDngsvVzSKq
	SrWrooATfcKvtrVySbcBum5koNU52LKu5+n70C7HjUe9v0W9KMzN4Q2IrMLkcYOVrNzonefLzPV
	OrnBPzq1/Weo4h4Xjh2tok11v95Zh3j+XAu+Rrkj/dHWxQWzkaR0D02EJMn7NAuX2TLTakoy6VY
	eXKVwDKN2eLN4lA/9U/1ejo/rjPDn2/ITQJETlMcVc0DEN4lWjAS1gPCJXXsJ9pHbPm/1vZDb7w
	MhnFPZ4b2tUq3AhiQwFsMQ4SWwWhN3Bgf0V+5o6y4rDzamgFkPEAMO8uhLiiRWAolWUlC+AELHR
	W16Q==
X-Google-Smtp-Source: AGHT+IF4mH2dS5j7+OOtzr5/SWQTKcTBQFiXcPYBdzwMP3HeuL9qU3UkuqT9UU7izKc1oerlcCqZsA==
X-Received: by 2002:a05:600c:a07:b0:46e:1c97:e214 with SMTP id 5b1f17b1804b1-46e1daacde6mr47079335e9.19.1758705563403;
        Wed, 24 Sep 2025 02:19:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:bc4b:2611:54b0:29a4? ([2a05:6e02:1041:c10:bc4b:2611:54b0:29a4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e2a9982e0sm24132785e9.5.2025.09.24.02.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 02:19:22 -0700 (PDT)
Message-ID: <8672a8c1-26b2-4b65-a30e-a4c3e0f1f32e@linaro.org>
Date: Wed, 24 Sep 2025 11:19:21 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clocksource/drivers/sh_cmt: Do not power down
 channels used for events
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250910142657.1148696-1-niklas.soderlund+renesas@ragnatech.se>
 <20250910142657.1148696-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVKZn-YfBxvwA1wgjksvzZK=NPzaoTCPRur_Z=AneLA6w@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAMuHMdVKZn-YfBxvwA1wgjksvzZK=NPzaoTCPRur_Z=AneLA6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Geert,

On 23/09/2025 16:56, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Wed, 10 Sept 2025 at 16:27, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
>> The CMT do runtime PM and call clk_enable()/clk_disable() when a new
>> clock event is register and the CMT is not already started. This is not
>> always possible as a spinlock is also needed to sync the internals of
>> the CMT. Running with PROVE_LOCKING uncovers one such issue.
>>
>>      =============================
>>      [ BUG: Invalid wait context ]
>>      6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 Not tainted
>>      -----------------------------
>>      swapper/1/0 is trying to lock:
>>      ffff00000898d180 (&dev->power.lock){-...}-{3:3}, at: __pm_runtime_resume+0x38/0x88
>>      ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version 0xAF400001/0xDCC63000, Driver version 5.0
>>      other info that might help us debug this:
>>      ccree e6601000.crypto: ARM ccree device initialized
>>      context-{5:5}
>>      2 locks held by swapper/1/0:
>>       #0: ffff80008173c298 (tick_broadcast_lock){-...}-{2:2}, at: __tick_broadcast_oneshot_control+0xa4/0x3a8
>>       #1: ffff0000089a5858 (&ch->lock){....}-{2:2}
>>      usbcore: registered new interface driver usbhid
>>      , at: sh_cmt_start+0x30/0x364
>>      stack backtrace:
>>      CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 PREEMPT
>>      Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
>>      Call trace:
>>       show_stack+0x14/0x1c (C)
>>       dump_stack_lvl+0x6c/0x90
>>       dump_stack+0x14/0x1c
>>       __lock_acquire+0x904/0x1584
>>       lock_acquire+0x220/0x34c
>>       _raw_spin_lock_irqsave+0x58/0x80
>>       __pm_runtime_resume+0x38/0x88
>>       sh_cmt_start+0x54/0x364
>>       sh_cmt_clock_event_set_oneshot+0x64/0xb8
>>       clockevents_switch_state+0xfc/0x13c
>>       tick_broadcast_set_event+0x30/0xa4
>>       __tick_broadcast_oneshot_control+0x1e0/0x3a8
>>       tick_broadcast_oneshot_control+0x30/0x40
>>       cpuidle_enter_state+0x40c/0x680
>>       cpuidle_enter+0x30/0x40
>>       do_idle+0x1f4/0x26c
>>       cpu_startup_entry+0x34/0x40
>>       secondary_start_kernel+0x11c/0x13c
>>       __secondary_switched+0x74/0x78
>>
>> Fix this by unconditionally powering on and enabling the needed clocks
>> for all CMT channels which are used for clock events. Do this before
>> registering any clock source or event to avid having to take the
>> spin lock at probe time.
>>
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>> ---
>> * Changes since v1
>> - Move the unconditional power on case before registering any clock
>>    source or event to avoid having to use the spinlock to synchronize the
>>    powerup sequence in probe.
> 
> Thanks for your patch, which is now commit cfbc0f1d24030ff9
> ("clocksource/drivers/sh_cmt: Do not power down channels used for
> events") in clockevents/timers/drivers/next.
> 
> Unfortunately this commit introduces an s2ram regression on e.g.
> Atmark Techo Armadillo-800EVA with R-Mobile A1: the system wakes
> up immediately.  There is no evidence of a wake-up event shown in
> /sys/kernel/debug/wakeup_sources.  This happens with or without
> console_suspend enabled.
> 
> Reverting this commit fixes the issue.  I suspect the system wakes up
> because the periodic clock event fires, and causes an interrupt.

I'm about to send a PR.

Shall I drop this change which fixes a lock issue or keep it ?

What has the higher priority ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

