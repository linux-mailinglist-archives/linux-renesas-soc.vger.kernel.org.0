Return-Path: <linux-renesas-soc+bounces-16720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F66AAC59A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 15:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CA771C43026
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 13:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6F2280030;
	Tue,  6 May 2025 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/2zNfjc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C066280A51
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 May 2025 13:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537278; cv=none; b=irFkEkclU2vtZIbS2/dQwa6F0UCRzwVpZ87d3qZs+EUI83GtryrVGdUdH/82EOk5pbPG3fATpMqHAx8KuERhNMu/PjrvKT4x06png5yIThOS5MgLeDmwqygBZ5PSOfqfY99BiVoBZ1AiQA2Uog773Sc7pUZkaknpdp1FXZBlgGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537278; c=relaxed/simple;
	bh=0lVpTpURlEeanuAjIbJkgLatYhwU//vfEa0K/jV5aS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AA+qObo3UZ0NoxNv2gHyGrzlxMKFiDa/LbLQdnE7FtW7nQTjXsfBXQNqXm6R0WffYePfUAkjrYYwGT++tUEF8vGDqj+2p3P14CEn9omde2egpXoj6U7Q+dbAajPn8Sgc1V9785O/S3KrqEVV9LmvtwGNmYXG2MSzAV2g3+a3aAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/2zNfjc; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-391324ef4a0so278379f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 May 2025 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746537275; x=1747142075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c7cAReDyTT7KLErUElBQxOzZHmwxniNtnYOivuVBS5A=;
        b=q/2zNfjc70SIpUneFOzPYV1t2XG6zmtVT3baUYmSLLQZ/9q2QPDkjiC4gk6Tm3ef2R
         MCZAzNufjisTVKcO24XaQa0r3WVyQE/qb/EI+OYmKjnU02tzkc0wrD2CxbBa6PNGA7ru
         XV23/Agxmktz5htrLQv7qdOrAwpGQGt1fr49vXvFk/wwCyq107/0UAVId7a8y5A3wQpk
         yBxf9b0CGAKPj5CWepsLUETapQgvGEKKKHVoYMi5xJLMctp6KTp5OB00gRGQs+5gI0Ok
         HysYyaMHjukc9OhHeW4+Yj2pbv+GfgB8Yx97f3sYxG/ivdYjD3lbIdQO/dafJjHvGoE3
         QIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537275; x=1747142075;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7cAReDyTT7KLErUElBQxOzZHmwxniNtnYOivuVBS5A=;
        b=o3yxmWmgLEoNknp4S9OvD1av2TdLoTN8ddcUPSIXw7BU23CiZ6y77hJ0lmWt7ojAZD
         rZGCOUvNAdlLktPufyhtI2hAb21I0EnUdYxpVkmZaU2b9ZFQKMAD+yTofl03c/GXaNOw
         w3ALymYIaRi5YKRdzNsa0MH7UR8EtazK0wYqIpExzS+nI0FXgPLidBaPTm9Z7IBqG2js
         PIvWQqOAGUU6gEg/YFeFeFhxR5FHMoTfTuuhuqp5xUFpPwdwWm6bixr66L2rpx2+ZhZs
         CUYKttQ9fd8DHTMd9/lRYIKBknizuqmlnvsVWxf+04Yu5zMlulfPU0OcorB6DzvLl7lw
         gttw==
X-Forwarded-Encrypted: i=1; AJvYcCVduLRvP4tYAydwaNwITNSOjJW7eGy+z/uc4McHYGF2L/x8aLeN+iEpnFOioWWZg1beHKBdMxmgdJxI9sWn+WjxAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKz3Yurau6SN1cvXFclh/0uMn0zZpYTTuPokJlRtm3ymBRALFj
	HGUkOJFgIVDWPXpkqi3wrIJxcoF4YNN4kpDIF+QtrQ2/3Pl7hiY+aHkCE7y3dls=
X-Gm-Gg: ASbGncthxbA7Tjx5IGgnbghLxEM6wjiM35LfwwVWlhx3SBuduPP7M5cM7iowKl3mdsv
	VdVH2qIwUBOoBjphfUSrpbfj53PByWd1hRXem6hOCXNMvdDkWeUbGl4kCloiM9iS6QesmzimFmb
	rIJPYDJ3495oKMw52hls+gl8yYoK9gnU1arNicA24Jf381A2YNJcE/Sb9MVjpS0w/HqlEpcOCX9
	Y8HBPvXt1FSu7jMJS9oUI5IcJoUvun4vKWxXsC0k58epn36qShmtihQTYh07v2CDBs+IeRsKWym
	z0o4iJ5fox0izE0ynQ7WBhkzEhEl1+r79Pfp1gU5Mh5geFiXQ1/4P5tuAKgNPnRcQnDEOA==
X-Google-Smtp-Source: AGHT+IHUYyISjmDireWFtDYjhqWAUlSvfGhfXOGmsTZqVCqhQoczfJap3uTQfjwXsBjjug1VXr6i9w==
X-Received: by 2002:a05:6000:144d:b0:39f:6a9:40bf with SMTP id ffacd0b85a97d-3a099aee68emr4577556f8f.10.1746537274675;
        Tue, 06 May 2025 06:14:34 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3403sm13578819f8f.28.2025.05.06.06.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 06:14:33 -0700 (PDT)
Message-ID: <b6f22d5a-b1c1-433f-b520-772cfc726136@linaro.org>
Date: Tue, 6 May 2025 15:14:32 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <3a11ba8a-a9f4-4829-8bcd-56f1702bee8f@linaro.org>
 <CAMuHMdWmvHZPwppQR5OxB7QB9NOWxRWoVkiMFS-6ScdYw=ywTg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMuHMdWmvHZPwppQR5OxB7QB9NOWxRWoVkiMFS-6ScdYw=ywTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2025 14:42, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> CC arnd
> 
> On Tue, 6 May 2025 at 12:52, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 06/05/2025 12:47, Prabhakar wrote:
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
>>> ensure the Ethernet driver is available early in the boot process. This
>>> is necessary for platforms mounting the root filesystem via NFS, as the
>>> driver must be available before the root filesystem is accessed.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>
>> Same comments as for previous patches like this (even the same?): you
>> are supposed to use initramfs for your arm74 boards. Even armv7 boards
>> use initramfs, so network driver does not have to be built in.
> 
> Are we? When has that policy changed? Why are lots of network drivers
> still built-in?  Making network drivers built-in for systems where

I would be happy to make them modules, but it is different thing to
accept new patch like that than change existing workflow.

> development is done using nfsroot has always been acceptable for the
> arm64 defconfig before.  For things not critical for booting, modular
> is indeed the preferred way.

And this is not critical for booting. System boots perfectly fine, all
critical SoCs are working, serial is working, clocks/interconnects kick
in, kernel mounts initramfs and you can probe the network/USB/storage to
mount rootfs.

> 
> arm64/defconfig is for development and testing, not for production
> (which famous kernel developer said that before?)

And we all for testing use initramfs, don't we? I really do not
understand the problem being solved here - all of our setups are
supposed to have initramfs already. My simple, private CI even has it,
so if such little fella like me is able to use initramfs, I am sure that
SoC vendor can adjust their CI as well.

> 
>> For example all of our setups use it thus we do not have to populate all
>> other vendors with our own drivers.
>>
>> Sorry, but I am strongly against such change. Kernel is already way too
> 
> The kernel will grow without this (it will just take a few more weeks ;-),
> so that is IMHO not a good argument.

I meant, kernel built out of defconfig. Yes, it will grow and my
comments are, hopefully, slowing that growth so I can still work with
kernel defconfig.

Otherwise why Renesas usecase of defconfig - built in modules, because
initramfs is too difficult (???) - is more important than my usecase of
small defconfig for my development?

And there is a consensus: use initramfs, just like we all are supposed
to use since years.

> 
>> big and with KASAN it does not fit to boot partitions in some of the
>> devices (and I cannot change the boot partition size, at least not
>> without big effort).
> 
> arm64/defconfig does not have KASAN enabled?

Does not have, but I want to be able to toggle KASAN and boot the
kernel, without going through 1000 kernel options which I could disable
or toggle to module to get the kernel fit into boot partition.

> 
>> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Doh...

Sorry that it feels harsh. I do not create the policy, but lack of my
words of objection are then used again in many discussions, e.g. via
"someone added patch like this, so I can add as well". I won't feel
offended if you take the patch with my Nacked tag.


Best regards,
Krzysztof

