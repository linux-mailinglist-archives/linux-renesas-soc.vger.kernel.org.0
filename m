Return-Path: <linux-renesas-soc+bounces-23528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5961C01E78
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF27F3A2181
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955912264C4;
	Thu, 23 Oct 2025 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HI8qLCoz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376D307AC5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761230694; cv=none; b=USto5Vz8g1CwLRJIbkgaqB5UJwDzp19DSxVgLimlcy+bxWM+5gm37zkYyJ7a/Kp2XfEYYHSiNjiLsER8FnwMiVJQvLkyP8o/rPD6MmqelJeQQ6C2ao5fRs3RTMSnCjGrY1Sufx92PEDu7YgJiqBcegSe0EwYbEgdu2cJcyNFeZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761230694; c=relaxed/simple;
	bh=w0jgvuyUFk+qLIdlN26vOp9LVbdqBhAqvuHk59oYLDM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KNwuNnsOiPMErZ1zkHwWrLY+ie2GXkfbRFhEsAKZl5mf0ohVFPiisUB/rE4f0wt2qBCSFRZgEf65QmTvEn5qng39qLeBqcIDykrO3U5I46Es3mjVl/vMQZPizJy4lhcZDHH5d1GDC4O5HtdIPPlu9hvAAiweL6L+s0ZWTP9MqQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HI8qLCoz; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-290aaff26c1so2151945ad.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761230692; x=1761835492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7A5STg+v7+M98RaWbVd1lgwgdjB6XtkDPplIdfPqWs=;
        b=HI8qLCozOFXq5Ak/x9/0AUgTXb7cssAoKbyf3aHqWM3dUpy95nuywEFPnA6gp5s74Y
         RSttiqkIc8G2caU6FvvqDJ7x3GwvngPzgaxbJynaUt+0izpG3WlSS4Q2j9Kl4RFQiuuk
         e/atRLg5nTvx+9pZnRLsxv9dHrF+gN+FbsLxX+6sF2ywzTiuzx0WGPh2YYloalmth7wt
         JrkYZbFi/NlFzrb3+KWiT+GXGrEnEJ7Pr0Asr0R09jvFN0RNp0w+JviFhaKBF5eoh3Ax
         Zggm9lr8uRHv2QZIWu0JRr6GwYfsnmUjJiWK2NoT9wgkOeHysw2SeCB8auFBKHmdZkm9
         qlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230692; x=1761835492;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z7A5STg+v7+M98RaWbVd1lgwgdjB6XtkDPplIdfPqWs=;
        b=UH4Cmc4+dZRQ1vpjU+WIZyd+4CkLYfwORkqHv2RelYSRsIag+MA1E1TjFVckgs18BI
         XbCQ2c6P+mZ7h/KUedRK6CWnVynkN3jSkm2HOZ7xv5rhZvLd+iAYc6XUzH1ELqAJkXBf
         oQF0PtItwTASz3jXZavJQDIpMc6iai7bpE8typSAAIONX4K76823d7vAR/5tDmVdvjwv
         hY+YbnFhTJwlw8hSsdB5A4I6zyMlyS7sI90oLj2QrfX7y/OroRHKNxtbuwmcUxIP7Bh9
         TQ8Qyh2cCNoHEjxAX0ZrU/sRWMRgexMT8W8lwHP6XrZshLUEl1A7qYDlyGhLfEt57Lcq
         Y8dw==
X-Forwarded-Encrypted: i=1; AJvYcCW6mOGTFG+RdOaMTxKcRplVE2TgGU4MhAMOYW5VK0Gllp+HsDbgMEP6Qy4BRMmln09SlV6pK8TYyJ5askZQZ1x4Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydpp+YgZ4/MsFb9ecgK+L8yiGRg+tR/eEdFgFNoVMg0oicqNfs
	f4gX+tn3u5ZPEJ60dAoisld0WCMDg9jfxRgod1vqCUWRKk6KAKZopSML
X-Gm-Gg: ASbGncvTHK3aWaWniq5eVl4NBUoYySh5fZRYM7VSfSb7ukn/5A/sFJRhA88CqvZT6fJ
	/ZE9+/FNuC0YoSDbD043bFsB2w/M6uVxH5y9SXo+I87ZC0A83vx8qELewF1IkchTy1QcRbRejsL
	NT4XDR+sGd/0e1YWpFSMwvD2yd8WNQEoJh846uvAEHTzUxnGFFBWnIebn5/1NiNR4v6Sc97lKHH
	W9WWqSTkmqjx78wXKhx6R9HBkP1oMaAOvkrlJm9EOG2tt1kAFheBCC+IVhe7CalISdO5j6ViXJ2
	pVLBbOthw8p7ZWdKVcxcN5UTadttwnR0iDbpHMxWsnEwOQDx3qW/2QLvzy6qCLmPQKgUry4r/fF
	8wmK4Qu3qaHr3HXy8G7qmL7kd4xtaiJJkbmpRYy400ZFyokkjW+C145UCNtlH4fAlexFw73MGZm
	h3F0+1RvhF48LL93c1olaiO2JaPIKHbsU7
X-Google-Smtp-Source: AGHT+IGug+cluxOUq0HAqc382+2RbJPtSE3MYuJbYfvni05jZVEd26sYnhBkfVlR88Cf13K3xjU5VA==
X-Received: by 2002:a17:903:94e:b0:26a:3c75:5241 with SMTP id d9443c01a7336-292d3fcce91mr74013375ad.9.1761230692165;
        Thu, 23 Oct 2025 07:44:52 -0700 (PDT)
Received: from [192.168.0.100] ([163.125.181.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de15fc6sm26181005ad.42.2025.10.23.07.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 07:44:51 -0700 (PDT)
Message-ID: <d092101f-76d4-439e-a17c-b92c46e99ce9@gmail.com>
Date: Thu, 23 Oct 2025 22:44:35 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yangyccccc@gmail.com, Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Marc Zyngier <maz@kernel.org>
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <632d6afe-40d3-4632-99c7-b098967bd649@gmail.com>
 <87wm4l3dh8.wl-maz@kernel.org>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <87wm4l3dh8.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025/10/23 22:21, Marc Zyngier wrote:
> On Thu, 23 Oct 2025 13:01:52 +0100,
> Yicong Yang <yangyccccc@gmail.com> wrote:
>> On 2025/10/22 22:33, Marek Vasut wrote:
>>> On 10/22/25 4:20 PM, Marc Zyngier wrote:
>>>> On Wed, 22 Oct 2025 14:35:28 +0100,
>>>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>>>> The AMU configuration register access may fault and prevent successful
>>>>> kernel boot. This can occur for example in case the firmware does not
>>>>> allow AMU counter access from EL1. Guard the AMU configuration register
>>>>> access with ARM64_HAS_AMU_EXTN to prevent this fault if ARM64_HAS_AMU_EXTN
>>>>> Kconfig option is explicitly disabled. Other interaction with the AMU is
>>>>> already guarded by similar ifdeffery.
>>>>>
>>>>> Fixes: 87a1f063464a ("arm64: trap to EL1 accesses to AMU counters from EL0")
>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>> ---
>>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>> Cc: Will Deacon <will@kernel.org>
>>>>> Cc: Yicong Yang <yangyicong@hisilicon.com>
>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>> ---
>>>>>   arch/arm64/mm/proc.S | 4 ++++
>>>>>   1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>>>>> index 86818511962b6..123538ffeda6b 100644
>>>>> --- a/arch/arm64/mm/proc.S
>>>>> +++ b/arch/arm64/mm/proc.S
>>>>> @@ -145,7 +145,9 @@ SYM_FUNC_START(cpu_do_resume)
>>>>>       ubfx    x11, x11, #1, #1
>>>>>       msr    oslar_el1, x11
>>>>>       reset_pmuserenr_el0 x0            // Disable PMU access from EL0
>>>>> +alternative_if ARM64_HAS_AMU_EXTN
>>>>>       reset_amuserenr_el0 x0            // Disable AMU access from EL0
>>>>> +alternative_else_nop_endif
>>>> Why?
>>>>
>>>> We ensure that the AMU is available in the macro itself by checking
>>>> for ID_AA64PFR0_EL1.AMU. If the AMu isn't present on this CPU, we skip
>>>> the offending sysreg access. This is similar to what we do for the
>>>> PMU.
>>>>
>>>> Does your HW advertise an AMU, but doesn't actually have one?
>>> The hardware does have AMU, but it is currently blocked in old TFA version and access to this AMU register here causes a fault. That's why I have to disable ARM64_HAS_AMU_EXTN until the TFA is updated and the AMU access is made available on this hardware. But even if I do disable ARM64_HAS_AMU_EXTN=n , I get a fault.
>>>
>>> This patch is mainly meant to prevent a surprise in case someone does set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register access.
>>>
>> then I think it's more proper to guard it with CONFIG_ARM64_AMU_EXTN
>> (I think you mean this above?)  rathter than the cpu cap. then with
>> the patch kernel won't touch the AMU registers here if the kconfig
>> is disabled on you AMU supported hardware and AMU unsupported
>> firmware.
> No. Not preventing EL0 from accessing the register is a data leak to
> userspace. This must be acted upon irrespective of the kernel being
> AMU-enabled or not.
ok got it. so this is a security concern to ensure EL0 access is disabled on AMU supported
hardware even if the kernel support is not compiled in. thanks for the explanation.

thanks.


