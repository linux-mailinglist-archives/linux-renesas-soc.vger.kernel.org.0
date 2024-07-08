Return-Path: <linux-renesas-soc+bounces-7177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9EB92A7AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 18:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D2941F21775
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 16:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5181474D4;
	Mon,  8 Jul 2024 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m/8gox0M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6AE145A08
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jul 2024 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720457778; cv=none; b=icyY4LIAIZRVwQXMdGgZ0e8T5zahSS9rQjSwyBYBWilbB7POpQXtzky8BEL6//VTrUs906FyzL4UAoRqR+172HUKashMiZ7j31BZmLPEcARoQoKfTbsMqBLkv6/sY1jybruO7RWwKhDXOXC3r9kR1SGYcOZqDIYO3NQiRuHxr/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720457778; c=relaxed/simple;
	bh=C49tfT6Wgt5Ck261hQAy7mqF+kocGPwYPx6Hpdry0JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZsMKzIIbFR+LXW/nz3gkkcAqyV2MoZWlSTiD1TRig4CmV4yzk36HIJstis+Ff1IXwylXnjmhKSAlPD7LrywQCt9v4Ust2s1ehVsKWzQJCCEJA4Ta0t0YPtNlHZCEvEA4RqyZ5LDbRBCqxAv7+S8P8Hhi/eZxWUx6oYeiqmfKxH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m/8gox0M; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42665be6916so9562485e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jul 2024 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720457773; x=1721062573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+qnhD2hx9xrENWu0QP60bAxducN4cTQgp2xM1mPbvI=;
        b=m/8gox0MTf+NjrIvFPNAU226j7NG6CyymNo9EeMJVqj6ACWrSQ/v+Sv4qtCZ3x2Sj+
         7TP/bdhHg+9sOTb3PgbRMGk/b8pB4tCVFr0HDiWPECpsW55S4FEzt3QrmMz2D1x8W+lY
         PJEPZA7MQNxTokO1pLQXoyXhh99R/2ohYofY1kZM8gPZtx32p8xlVdeG64CiSkEXQBPC
         hJs4ld5QlMcmvN7IP4A/9uJx3o0NoiGIH/ahkG+XNhBnfKUIjiAeQBs1uG5fnWWxxail
         Y3dsssHkKAkEYT3cddmnOb6HVuAe9SNvbpbAG39IJy71PehTZGOVB3xETmGOwQ0HYXcz
         4IPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720457773; x=1721062573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+qnhD2hx9xrENWu0QP60bAxducN4cTQgp2xM1mPbvI=;
        b=heuWDwUKO+IGSKwkbQfOzPD0BvxaOTMB4NnOOYRADL/ArZntxcMcb1ySVzuFDbuWWc
         5ZDwEb4fgKC5T78Y+5TREd2CwGwTSH/pb3wXV+j73/bmw8zHKltmRl+dEigvr6LMfSNl
         TVhByTyXLlYkjCZQKbb70muY5W2x16ed31QZA3zjFEkkF3aCWNnRIAL79RjEoW8LFl4Q
         MPYnGS0blCrWZZQwIc3uWT+PwbNVgAO8VGj4XApK5Qy8twPtbZS9uslYXIlRcw/20vii
         dDE6bAXzaDxkCBoRD7Pg+xhX5zCD/IwUlCvB0AlRGQviKCem0GievvNwDulB1WtNgaVh
         aERw==
X-Forwarded-Encrypted: i=1; AJvYcCXuKfCQdsYWKgbxYezZFyh6/gT3VAm6y5AV4HRYwEmS0CHWAi6rrsZX7NptTOfb/KFjBUMET7ji2cnB3Ial4pJxA4YybVgrzI38xPoiI3Tm2Zo=
X-Gm-Message-State: AOJu0Yw0mQeN9r/mduyFy9XbELKwmgxBtfpjS3RRzU6SjrBKO/EcL+O3
	34kFPxKkKjVb/KE+QYgpObTxaZ/AI8Lt24NWjp3OFcod7YqQOQrGOiiamGkIwn4w8Fh10TTXKgX
	1
X-Google-Smtp-Source: AGHT+IE2oQep7Ey6Ar/9JAg1Ao7dM6HGDWBtWiUxfm3nMI4/309WpySEbis5SAYg3/+9ERZd988WYQ==
X-Received: by 2002:a7b:ce88:0:b0:426:6981:1bd with SMTP id 5b1f17b1804b1-426698103bbmr32048115e9.5.1720457773455;
        Mon, 08 Jul 2024 09:56:13 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:cf24:cce:17df:12ab? ([2a05:6e02:1041:c10:cf24:cce:17df:12ab])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42650b26c48sm138476945e9.17.2024.07.08.09.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 09:56:12 -0700 (PDT)
Message-ID: <598da6e0-4d7e-4800-a47a-3914070669d0@linaro.org>
Date: Mon, 8 Jul 2024 18:56:11 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/sh_cmt: Address race condition for
 clock events
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Thomas Gleixner
 <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20240702190230.3825292-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240702190230.3825292-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/07/2024 21:02, Niklas Söderlund wrote:
> There is a race condition in the CMT interrupt handler. In the interrupt
> handler the driver sets a driver private flag, FLAG_IRQCONTEXT. This
> flag is used to indicate any call to set_next_event() should not be
> directly propagated to the device, but instead cached. This is done as
> the interrupt handler itself reprograms the device when needed before it
> completes and this avoids this operation to take place twice.
> 
> It is unclear why this design was chosen, my suspicion is to allow the
> struct clock_event_device.event_handler callback, which is called while
> the FLAG_IRQCONTEXT is set, can update the next event without having to
> write to the device twice.
> 
> Unfortunately there is a race between when the FLAG_IRQCONTEXT flag is
> set and later cleared where the interrupt handler have already started to
> write the next event to the device. If set_next_event() is called in
> this window the value is only cached in the driver but not written. This
> leads to the board to misbehave, or worse lockup and produce a splat.
> 
>     rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
>     rcu:     0-...!: (0 ticks this GP) idle=f5e0/0/0x0 softirq=519/519 fqs=0 (false positive?)
>     rcu:     (detected by 1, t=6502 jiffies, g=-595, q=77 ncpus=2)
>     Sending NMI from CPU 1 to CPUs 0:
>     NMI backtrace for cpu 0
>     CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.10.0-rc5-arm64-renesas-00019-g74a6f86eaf1c-dirty #20
>     Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
>     pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : tick_check_broadcast_expired+0xc/0x40
>     lr : cpu_idle_poll.isra.0+0x8c/0x168
>     sp : ffff800081c63d70
>     x29: ffff800081c63d70 x28: 00000000580000c8 x27: 00000000bfee5610
>     x26: 0000000000000027 x25: 0000000000000000 x24: 0000000000000000
>     x23: ffff00007fbb9100 x22: ffff8000818f1008 x21: ffff8000800ef07c
>     x20: ffff800081c79ec0 x19: ffff800081c70c28 x18: 0000000000000000
>     x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffc2c717d8
>     x14: 0000000000000000 x13: ffff000009c18080 x12: ffff8000825f7fc0
>     x11: 0000000000000000 x10: ffff8000818f3cd4 x9 : 0000000000000028
>     x8 : ffff800081c79ec0 x7 : ffff800081c73000 x6 : 0000000000000000
>     x5 : 0000000000000000 x4 : ffff7ffffe286000 x3 : 0000000000000000
>     x2 : ffff7ffffe286000 x1 : ffff800082972900 x0 : ffff8000818f1008
>     Call trace:
>      tick_check_broadcast_expired+0xc/0x40
>      do_idle+0x9c/0x280
>      cpu_startup_entry+0x34/0x40
>      kernel_init+0x0/0x11c
>      do_one_initcall+0x0/0x260
>      __primary_switched+0x80/0x88
>     rcu: rcu_preempt kthread timer wakeup didn't happen for 6501 jiffies! g-595 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
>     rcu:     Possible timer handling issue on cpu=0 timer-softirq=262
>     rcu: rcu_preempt kthread starved for 6502 jiffies! g-595 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
>     rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
>     rcu: RCU grace-period kthread stack dump:
>     task:rcu_preempt     state:I stack:0     pid:15    tgid:15    ppid:2      flags:0x00000008
>     Call trace:
>      __switch_to+0xbc/0x100
>      __schedule+0x358/0xbe0
>      schedule+0x48/0x148
>      schedule_timeout+0xc4/0x138
>      rcu_gp_fqs_loop+0x12c/0x764
>      rcu_gp_kthread+0x208/0x298
>      kthread+0x10c/0x110
>      ret_from_fork+0x10/0x20
> 
> The design have been part of the driver since it was first merged in
> early 2009. It becomes increasingly harder to trigger the issue the
> older kernel version one tries. It only takes a few boots on v6.10-rc5,
> while hundreds of boots are needed to trigger it on v5.10.
> 
> Close the race condition by using the CMT channel lock for the two
> competing sections. The channel lock was added to the driver after its
> initial design.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Hello,
> 
> I only have access to R-Car based SoCs and that is what I have tested
> this change on. I have not been able to test on any SH platforms which
> also uses this driver.
> ---

Mmh, it seems to fix the race conditions but the testing coverage is 
incomplete. I'll pick it but keep an eye on it in case it breaks other 
platforms. If someone can give a try to test on the sh platforms that 
would be nice.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


