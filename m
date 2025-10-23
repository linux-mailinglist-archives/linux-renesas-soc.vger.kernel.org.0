Return-Path: <linux-renesas-soc+bounces-23496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A34FFC00F6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A2D38545221
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 12:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B74630F95F;
	Thu, 23 Oct 2025 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlbnG0PI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC69309F1B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761220928; cv=none; b=IRDhd16fKBdV/gk0t9N574zFN1mpafl9aMx9Hr/X1mx/cP7oqpvBT02+Eg9JnHSye6LSeuUHCnUpGfpqqLLcJcwYZ/6fQp96zgYT7tiTCtkuzyXeM0veZxeNpHbi6qu4X63OC/YKE2NDwWYN0E4lNmn6iqELlUCYcmXl4KKnoJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761220928; c=relaxed/simple;
	bh=3DlOhhfNjZ+nPO/20Hbn4j7kk5m4g2legRGVqTDqEk0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eM4iSdykv4x0MB0xr24Y/+len/u8SXi+KxTvkD2Dkp++7Dg1w4S+TUDrB/i/KG+0BvGD6YDDQCq7pq/EXg6V2+hQDiCWJ6+3t/Ydltaff1Sb2CEoVx0G8gWg6H3Jwti/hPKMBLUUydd8QySsMsDZcgLagO3flnqhkgjYOU/zSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlbnG0PI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-290af0e154fso1133265ad.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 05:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761220925; x=1761825725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DlOhhfNjZ+nPO/20Hbn4j7kk5m4g2legRGVqTDqEk0=;
        b=HlbnG0PIEpZx66l8x2V7zSy5YpnEfGSkALN21h0V6YNbMUUPltSGFIYHrLvPS2K2Dv
         Osr+/X4KIK2R/UklvAiYvlmsSCLS2SeK1kh8ythkqaK7hcSOhTP7pC7EmTdX2j+5+uvx
         vT3AsBcQedMTGjRUMROhxEkxoqa+bKFFW75X7SNQYyOGjEryTN8vI3ID/QrkeEkbRxLD
         P96saZjxbrCkDSChuKndW3AMBP3d4yXfXA5rlAfxfed6YZZjL67T4gzm3mHuyHf9MLDE
         8/SExq03TC7YGI/WCCyzuKNOg0BmRT5S6kNNrbOc1WrpYBa+D5DzMu0nU14VNaiHGTVs
         a5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761220925; x=1761825725;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3DlOhhfNjZ+nPO/20Hbn4j7kk5m4g2legRGVqTDqEk0=;
        b=RKd/tHg0VOcYcHLhtlurtXBoxh/ERTtVdKtliNh415KoPWYHwaN7jFj4uOEEIYOPd1
         bwsEtkQItOnNAYAfah/fop+iP2O5L7Ss9h8xiwfm/BvCDzdzfIFsyEyQt5uIqYhEzkaq
         hqDjEAuxYw3MRa4A9hY2voblenhyLSASV3oV8qsyr4b+ub/YhS/imbDDQyBYD//kyaVs
         0g0YiaDMCvqi4n1Mz4k9Qsmu0eZgtSbdiFD81j7N+r6tAkqOvBb004Y0tdx06oKBgYUW
         X0AazwsJgB4SvuBVzp5Jou72ErN2/yoBiCXvTmKstEqtkMwOrvphhujcar8gqW2YEP90
         iBfw==
X-Forwarded-Encrypted: i=1; AJvYcCX5WjhEx52Il9w9JNXdmi8N8u7G2/UlfNKFBzN9vdCOIBts4BJC11swvMbkjX2F91XTh6YAmuKPa8mlJYquxgH+Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVhqgmTgal93K3/3yCRoBx58eazqwTFc/jKDxmeIEidCPdZgQ9
	DBhTe8V0WU63+EVxFKwHZekbUSYciLNezZ2LbMfl+p9fEjRCW9XbUUOz
X-Gm-Gg: ASbGncvQ1U4houaueCwUN7xk7GmaLkYxMy7LSSm14EehIYZr3SC8qFo3QS4jytg3zLV
	8tdh8bdMiy0aDrTHpugBHrHMYoJe31Mve2SOw6FrJlBQhwn/yu0LQGJY+UjOR6ppwEjKs1sB9DZ
	dlyeqo39hWszhISeSXVCwDiRvM1T6o0Hh9zQjAvdcVpb9NoTglSuJPlniVRErZBpFb6NcqJCnWA
	z+MxrI2imicddkdJv7MTM3yzYr+WgAwpARAMChZu8yJGuo+EialjQg/9SgywjaPULxp9yym9PWP
	83dACnYPtdil86W4OPtCfuPBru1BAeGYvNOcm70WRz4Vd/NXbcnxSUO6lPjTSh/v7xLzFWqoGyR
	CuSlSyHcji2FEzpsvoekhpRCid4WnHyJTL4ENye08AvzDQaz77dXLh60T7ujBceFYgS0E8F7W+O
	rYKZF4AF21hMloQHXOkDQhjIholeyrLSc/
X-Google-Smtp-Source: AGHT+IHq6bd9gl/stamR7hfnmvxDsick6ogXHg2q2acLJHm09xdoPxZjtSABhl8QQBartTnrKfYtUg==
X-Received: by 2002:a17:902:cec2:b0:261:500a:5742 with SMTP id d9443c01a7336-292d3fd9a38mr80551165ad.10.1761220923090;
        Thu, 23 Oct 2025 05:02:03 -0700 (PDT)
Received: from [192.168.0.100] ([163.125.181.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e1224f7sm21332775ad.94.2025.10.23.05.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 05:02:02 -0700 (PDT)
Message-ID: <632d6afe-40d3-4632-99c7-b098967bd649@gmail.com>
Date: Thu, 23 Oct 2025 20:01:52 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Marc Zyngier <maz@kernel.org>, yangyccccc@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025/10/22 22:33, Marek Vasut wrote:
> On 10/22/25 4:20 PM, Marc Zyngier wrote:
>> On Wed, 22 Oct 2025 14:35:28 +0100,
>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>>
>>> The AMU configuration register access may fault and prevent successful
>>> kernel boot. This can occur for example in case the firmware does not
>>> allow AMU counter access from EL1. Guard the AMU configuration register
>>> access with ARM64_HAS_AMU_EXTN to prevent this fault if ARM64_HAS_AMU_EXTN
>>> Kconfig option is explicitly disabled. Other interaction with the AMU is
>>> already guarded by similar ifdeffery.
>>>
>>> Fixes: 87a1f063464a ("arm64: trap to EL1 accesses to AMU counters from EL0")
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>> ---
>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Yicong Yang <yangyicong@hisilicon.com>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-renesas-soc@vger.kernel.org
>>> ---
>>>   arch/arm64/mm/proc.S | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>>> index 86818511962b6..123538ffeda6b 100644
>>> --- a/arch/arm64/mm/proc.S
>>> +++ b/arch/arm64/mm/proc.S
>>> @@ -145,7 +145,9 @@ SYM_FUNC_START(cpu_do_resume)
>>>       ubfx    x11, x11, #1, #1
>>>       msr    oslar_el1, x11
>>>       reset_pmuserenr_el0 x0            // Disable PMU access from EL0
>>> +alternative_if ARM64_HAS_AMU_EXTN
>>>       reset_amuserenr_el0 x0            // Disable AMU access from EL0
>>> +alternative_else_nop_endif
>>
>> Why?
>>
>> We ensure that the AMU is available in the macro itself by checking
>> for ID_AA64PFR0_EL1.AMU. If the AMu isn't present on this CPU, we skip
>> the offending sysreg access. This is similar to what we do for the
>> PMU.
>>
>> Does your HW advertise an AMU, but doesn't actually have one?
> The hardware does have AMU, but it is currently blocked in old TFA version and access to this AMU register here causes a fault. That's why I have to disable ARM64_HAS_AMU_EXTN until the TFA is updated and the AMU access is made available on this hardware. But even if I do disable ARM64_HAS_AMU_EXTN=n , I get a fault.
>
> This patch is mainly meant to prevent a surprise in case someone does set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register access.
>

then I think it's more proper to guard it with CONFIG_ARM64_AMU_EXTN (I think you mean this above?)
rathter than the cpu cap. then with the patch kernel won't touch the AMU registers here if the kconfig is
disabled on you AMU supported hardware and AMU unsupported firmware.

move the guard into reset_amuserenr_el0 macro will be neater here (personally I think).

thanks.


