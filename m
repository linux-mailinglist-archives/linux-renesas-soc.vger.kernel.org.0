Return-Path: <linux-renesas-soc+bounces-24305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14085C3F452
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 10:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C04013A16CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 09:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6662C11CB;
	Fri,  7 Nov 2025 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bacQUJ4E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884DF29CF5
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762509228; cv=none; b=pRbhTYQpZkVxx+DiRAa8W7ZB1QT0CBlge7JI1Dx3RS9yEueuy443obLilw1ThpQrQ/0YQEaecSR/o5VW6Xa9bKtIQTaHDt+P4WxUVb2s1iw9ukXDJon+aSQj9pG87GAwIRrv2S46YXfUxyzD744fcV5ngmezwfX+i7sTz61w49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762509228; c=relaxed/simple;
	bh=dmQa7lbiVXP68NHAwq3UNRgdaktLlYFHeyLyMNoty5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7RSdFCGiwcFC6Ikk5k3tyTF/6lzym+W4hjSYsuZNhnEyOc0q9Q31QIkeDs1vT/CQpsYsKUw4SQG+nCqiR8Y5NQ4USX4YOsVBYSrhA1HKzGGCLlSOeJn9msI4HbVxcuTD/LAMEH42zz/YX0DBYAyy/8miqcy/Qs8fpk+vMGMoQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bacQUJ4E; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477632b0621so3673925e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 01:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762509225; x=1763114025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGeIWQ6ZMZpgVdu53TP7HKUBRREAecfCKqjR7DP2Sao=;
        b=bacQUJ4ETEACkQV+/qcb101OULV0FiWtIgVNUOpx4x+QKYw5h4Gk59T0zesWiztoPV
         BRi5+n5mDqdLE5C+XCNw945gX03c7V5NbWOWTRBwlTZFx4smw5edSbu9pmsjPV4KxmB1
         +g9jFMC3IGhnWWiFdrjpqHie/l9fSJ9eMAJImg4wK1PND4gHUU+zxHgxfS52gZK8PK4b
         bSAJXe6TsyjJsqOO7WmYSomjpgGdK0PAh45SS/G7T/d7oW6T+5YxU7rwShuAQG6QkBIH
         iD9IexEtua3jwmhZDmYfD1ojng6BWRnvg62SiEwJI3w7VIVfeKKtw3G4b9rZ+Dm06y2f
         DPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762509225; x=1763114025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGeIWQ6ZMZpgVdu53TP7HKUBRREAecfCKqjR7DP2Sao=;
        b=ADO92pG4+c7rISqUKjGxg+Y7+tkHPJ1YAkiTmm1TIs7fgbphLQpQ4LgfBA9hTi26pG
         WWIVJ7vC6cJkXvQwqXw6X5ykO1tYNH24R5YUyCBiH0PcRq3Cs/wqqHU07nQsvhXQt3r9
         NrmNc/olA+5ifdcpWvN3ZwPLNMXXxNVE/t76Aii8Vv9r+SbJ6FfPYpqwkaFQv+jPG2ky
         5frMzGBqM1bb/vQXoY3VxJQxP6Yt620JZU0aN5bSlWRXIBfSXE8j5ojDFKdlSZM8YqAy
         CO7u5sSy5/1Y/9TYjQSi56UQAsx942MoKOUxHDADkFWtGApI4GfkFKposunKH9etcPAj
         K7aw==
X-Forwarded-Encrypted: i=1; AJvYcCWVdb6vzmRnYiL4tOOCPsCQhNjSXaBMn6g18swB1AgxRWlGD/ECdCzBUjMHWY3FxoLd1d9ndlDQTrsA2HBJKKvdjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWY6VuRg5/Y6cRZVDB7TtZWAyuUW+7Ki0UodiEd8mBMY4qA9DV
	iGHl1fLT+qe/Fn2HQYDN/eT+0newqZTAB8QpWe7qfwhG24jWBuki5actMg8md0Kn9yE=
X-Gm-Gg: ASbGnctbVbyJMqilxr6T2QJtNyKr9uPG2hKEpjsaS3VcZPUf4FYB5lmlstrOitNLjba
	FFT0bo50OhHk1fVUSQBbUAcK6E0vDcuFeAObuXDdM4GGnCUcoTI8WC4gELYoyLNPBDEIwyq8GcC
	TZD5Tjs+6eEmveG2VsNb2x/oBTOzjA5ghuvESJxajU/tBa9OOEVuP33CQUMVYXbqvAGccZFEDCw
	hj/96fvBYJ6buBcO9cgQtwigriVLrRUijKVrOYo2UQfM8oAaP1X4BN3nCVTIcMNWSW+eF3v31P+
	VracK3rgCfdE9Az3KDTo8p9gcuWoJMjeL98T+6cFh/XHd2vzDTvZ3YRDjhy2APKE4giznaQpLxh
	kYdXxLD5yAqZ+cMzu9wA6niyKbHBbsxRkJcuKLS+PKhANWx0nzk3Tr/2D1CqLk8Y7i3eR3QlAyZ
	iA+7nc59m00Yzba3siY1Sb8/9ydITK6hd2eXlM
X-Google-Smtp-Source: AGHT+IGRLiTaIV9+RfkbKf9wrAJcPSt3Mv+2ECDBElmkOjTZgMaFOP8EErmDgEbjNgu0zyV06U3LZg==
X-Received: by 2002:a05:600c:4592:b0:477:3e07:217a with SMTP id 5b1f17b1804b1-4776bcc9c7emr22064045e9.36.1762509224874;
        Fri, 07 Nov 2025 01:53:44 -0800 (PST)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4776bcd521fsm45293695e9.6.2025.11.07.01.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 01:53:44 -0800 (PST)
Message-ID: <c4377971-173a-4af9-8566-24e5860787ae@linaro.org>
Date: Fri, 7 Nov 2025 10:53:41 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource/drivers/sh_cmt: Always leave device
 running after probe
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20251016182022.1837417-1-niklas.soderlund+renesas@ragnatech.se>
 <c07ae384-4042-43f4-b876-7207b72260f7@linaro.org>
 <20251105160627.GA3684509@ragnatech.se>
 <ae167c7f-c32f-422b-9eb2-72889cbafef0@linaro.org>
 <20251105183242.GB3684509@ragnatech.se>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251105183242.GB3684509@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/25 19:32, Niklas Söderlund wrote:
> Hi Daniel,
> 
> Thanks for your feedback.
> 
> On 2025-11-05 17:39:14 +0100, Daniel Lezcano wrote:
>> On 11/5/25 17:06, Niklas Söderlund wrote:
>>> On 2025-11-05 16:36:15 +0100, Daniel Lezcano wrote:
>>>> On 10/16/25 20:20, Niklas Söderlund wrote:
>>>>> The CMT device can be used as both a clocksource and a clockevent
>>>>> provider. The driver tries to be smart and power itself on and off, as
>>>>> well as enabling and disabling its clock when it's not in operation.
>>>>> This behavior is slightly altered if the CMT is used as an early
>>>>> platform device in which case the device is left powered on after probe,
>>>>> but the clock is still enabled and disabled at runtime.
>>>>>
>>>>> This has worked for a long time, but recent improvements in PREEMPT_RT
>>>>> and PROVE_LOCKING have highlighted an issue. As the CMT registers itself
>>>>> as a clockevent provider, clockevents_register_device(), it needs to use
>>>>> raw spinlocks internally as this is the context of which the clockevent
>>>>> framework interacts with the CMT driver. However in the context of
>>>>> holding a raw spinlock the CMT driver can't really manage its power
>>>>> state or clock with calls to pm_runtime_*() and clk_*() as these calls
>>>>> end up in other platform drivers using regular spinlocks to control
>>>>> power and clocks.
>>>>
>>>> So the fix is to remove PM management in the driver ?
>>>
>>> Yes. As I understand it we can't do runtime pm in these drivers as the
>>> core calls into the functions with the raw spinlock held. I hope we can
>>> improve this in future.
>>
>>
>> IIUC, the changes done for PREEMPT_RT prevent to use pm_runtime by functions
>> running in atomic context because the spinlocks are actually mutexes.
> 
> My understanding is that the core issue is that the clockevent core uses
> raw spinlocks, so all operations done from the callbacks in drivers need
> to use them too.
> 
> The Renesas CMT and TMU (which I intend to fix too once we find a way
> forward for CMT) are the only clockenvet drivers attempting to do
> runtime pm.
> 
>      $ git grep -l pm_runtime_get -- drivers/clocksource
>      drivers/clocksource/sh_cmt.c
>      drivers/clocksource/sh_mtu2.c
>      drivers/clocksource/sh_tmu.c
>      drivers/clocksource/timer-ti-dm.c
> 
> The timer-ti-dm.c driver do not register a clockevent device.
> 
>>
>> But if PREEMPT_RT is not set, then everything is running as usual.
> 
> I still get LOCKDEP warnings.

Ah ok, you get the LOCKDEP warning because it identifies the called code 
to be invalid in case the PREEMPT_RT is compiled-in but does not reflect 
a real problem with !PREEMPT_RT.

[ ... ]

> The problem is not really PREEMPT_RT. The problem is the clockevents
> core require drivers to use raw spinlocks as itself uses them.
> 
> I would prefer to get the driver in a state without splats, warnings and
> potential PREEMPT_RT issues. Especially if the cost is to disable
> runtime pm.
> 
> As I understand it most systems where CMT exists, who don't use it, keep
> them disabled in DT. And the devices that use them have
> is_sh_early_platform_device() set so they already disable runtime pm.
> 
> Once we have that fixed we can work on enabling it without the quirks.
> In your opinion am I missing something where this approach is a bad idea?

If you prefer to remove the PM in the driver, I'm fine with that.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

