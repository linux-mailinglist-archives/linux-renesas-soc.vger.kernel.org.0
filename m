Return-Path: <linux-renesas-soc+bounces-21966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E61CB7E1D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBBCA325742
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 09:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127E731BCB7;
	Wed, 17 Sep 2025 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ekiwTziW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2088D188734
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 09:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099771; cv=none; b=WtU3LNk00fJTgUVVj+EkM3rVnPjIGrVo4vV+X2dtF10rvmiuPcWz0K5AMFcIquzfddiQ3A5FiPku5GR5Cx8CBU8Z8mV8oPRxTCwAnrpeme6GnHNs91pahiu6hreBtkSB/6NmE+oQhUvHeu9j7KW0uGGzb5vXe5g5aCnZeSi+ZBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099771; c=relaxed/simple;
	bh=nkVK/tLnT8hl7YDYf7A/XsjvE10iA8D4y1I0YFB4XLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BCyS83xrXTCwPkV4ZEv8ddpjOaghX+QfZFWyoRAjMcHB8NnLn1TMKvELFIdkUVmFjWa3V6bwLv5A9HGhwjDJCuY+YF9vol4LIvgEAIItdqeTsXZZUBIM+zPaoPUVivjPW32UFvSy6D+3iVT4JTIxkfbSKJ9TCRqOc9Cqk6cw9OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ekiwTziW; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45dec026c78so64604485e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 02:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758099767; x=1758704567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OrkRK12gc8jdKzalAh+dHWGpiMd74C9Kj46DS5jLtZY=;
        b=ekiwTziW+kY9d3ah0VwENE8dhTsn+b+A3R8muJwy99NuUbrQ7hAcNJadOTV3vZyE9g
         aQtR+6OL8T01rDcIHPt98XaRyu50tnlt+0k8xCOWpUUGjlAIrqrV2UMn8mELUQjQH0Ze
         vPhqMJOGoAhvlHwp6EegYBvoYEsby7y3/U4FSnXnhE1vR3155WlAg1Ar98/PBZ9RBdbT
         Zcd034njc3xZD4tWfHkC2V74vks7jUIJjrToEhp4LXSxs9d0YHRD7CfJ2eYGvnIjRUdI
         UCQMhvhzXrXcR0gZzRal0hFZ9sraUiXx3NWKp46E64wWyUIgdfUw/FZavXj1mtCJJdQw
         KGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758099767; x=1758704567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OrkRK12gc8jdKzalAh+dHWGpiMd74C9Kj46DS5jLtZY=;
        b=XA3kw3k/wWpM8CjUKMVhN1LpmJbGptJtQmDUpj1sABUyT9w8hnlUD/qR4LaV4/XVkM
         Ql0JixYHsya7+7UGPBEQhQoYbxfBmEp2+fRmv3/0l4sbAUaj4jRp7kkimUX7De7sM16X
         2v9q5EodUEcMQKLPOJ+0mi+LWUKIZmFYl9i1LJT7j7C9DOpAYJ5RYA87YQkU3aVDWx7Q
         +ZQ23NPAUov+NuZGM3kIcK2VC22w9ZjiA19/BoQ2S79MuTj4OxQxSZMcjuq8KDFU+4zc
         lDNRB5QTFpwiRVHUuc2Eku9GRQJZ4IWYfYdl+SJCz2kUE06r6EbcWwmHypQBuNWfUHfV
         Ivrw==
X-Forwarded-Encrypted: i=1; AJvYcCXmQww+EojO5N+ISgJPvEDHNaI2uAKEObAIE5DYvjknAJxJeeV3u59xgsUluWiY673fXS0F6G32+rYVg0bDfl2lQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoKHPcCS5HPQX7fzEIzo4xroYRoFqxeJMes+nnVFN6If1WsGGd
	BnJ3cwyTo21DWq9XMnsMQuEHggUSGyEeo6OYovav0FzTX1paNqQZ7xl1M2IZm4KTS84=
X-Gm-Gg: ASbGncvdiVOwTBzRUtZpl2ECBQARoyOQCBlJduBCql2akzQl+KV2mr1hhHJ+XVPKRXH
	EA/8jiiqVUOZUSxkf8jTtt4EBHDhXxYBTfzqzF8hetKO/Tp5RMus2OMH53tAR2FbmiJixaFWeh0
	9GmP7elkTUVoZ67C+2lYGuQS6r5XThSXndMB9bfW/DRFs/OkTVn7bNi84cqjR+5Lg36g4ORIneq
	R8L6KUpsL3MS3WaIOgcccuKytYnbg1aRG/I9+da0gUuLWUS++r9pfC5HWYHwV7RxanRMk08gxbn
	f9pK0tGfe9RjQHYA61gkUQcdzArDCJYieJ62YpUV2NAiVz6n2JrP1y2Bca5R3nsejkkMaBF7ext
	oPmjMxcgexb/X+gfjSNXv4JR9FYHNTkxuM3TYMYzO8PDKTCX2AiGmroqkjJlIax44DNE9ShuC07
	vKBg==
X-Google-Smtp-Source: AGHT+IEtszsia9uiCGTPEBIHTJjuVpyP2y3zgLrS6tqVaYTjJObHoOKM5qrDjGV153Veud6Zut/s8A==
X-Received: by 2002:a05:600c:a44:b0:45d:da25:595d with SMTP id 5b1f17b1804b1-46206099be5mr12086115e9.22.1758099766944;
        Wed, 17 Sep 2025 02:02:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621? ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3e7607870cfsm25993034f8f.19.2025.09.17.02.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 02:02:46 -0700 (PDT)
Message-ID: <8917db78-fe40-487a-9ad5-f1bddfe0120c@linaro.org>
Date: Wed, 17 Sep 2025 11:02:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] clocksource/drivers/sh_cmt: Improve clock event
 design
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Thomas Gleixner
 <tglx@linutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250910142657.1148696-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250910142657.1148696-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/09/2025 16:26, Niklas Söderlund wrote:
> Hello,
> 
> This series tries to address an issue with the Renesas CMT driver
> design. The driver do PM and clock handling in struct clock_event_device
> callbacks. This leads to LOCKDEP warnings and I think hints at a larger
> issue.
> 
>      =============================
>      [ BUG: Invalid wait context ]
>      6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 Not tainted
>      -----------------------------
>      swapper/1/0 is trying to lock:
>      ffff00000898d180 (&dev->power.lock){-...}-{3:3}, at: __pm_runtime_resume+0x38/0x88
>      ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version 0xAF400001/0xDCC63000, Driver version 5.0
>      other info that might help us debug this:
>      ccree e6601000.crypto: ARM ccree device initialized
>      context-{5:5}
>      2 locks held by swapper/1/0:
>       #0: ffff80008173c298 (tick_broadcast_lock){-...}-{2:2}, at: __tick_broadcast_oneshot_control+0xa4/0x3a8
>       #1: ffff0000089a5858 (&ch->lock){....}-{2:2}
>      usbcore: registered new interface driver usbhid
>      , at: sh_cmt_start+0x30/0x364
>      stack backtrace:
>      CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 PREEMPT
>      Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
>      Call trace:
>       show_stack+0x14/0x1c (C)
>       dump_stack_lvl+0x6c/0x90
>       dump_stack+0x14/0x1c
>       __lock_acquire+0x904/0x1584
>       lock_acquire+0x220/0x34c
>       _raw_spin_lock_irqsave+0x58/0x80
>       __pm_runtime_resume+0x38/0x88
>       sh_cmt_start+0x54/0x364
>       sh_cmt_clock_event_set_oneshot+0x64/0xb8
>       clockevents_switch_state+0xfc/0x13c
>       tick_broadcast_set_event+0x30/0xa4
>       __tick_broadcast_oneshot_control+0x1e0/0x3a8
>       tick_broadcast_oneshot_control+0x30/0x40
>       cpuidle_enter_state+0x40c/0x680
>       cpuidle_enter+0x30/0x40
>       do_idle+0x1f4/0x26c
>       cpu_startup_entry+0x34/0x40
>       secondary_start_kernel+0x11c/0x13c
>       __secondary_switched+0x74/0x78
> 
> This series tries to address this by instead doing PM and clock
> management at probe time, and leaving them on for the CMT channels that
> are used as clock events. The CMT design is a bit messy as channels can
> be used both as clock sources and events. And the design to do the
> housekeeping for clock sources seems to be valid and is kept.
> 
> The work is tested on R-Car M3-N and R-Mobile A1.
> 
> See individual patches for change long.

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

