Return-Path: <linux-renesas-soc+bounces-18185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0469DAD716E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 15:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDB7E3B2F87
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 13:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A2523D29A;
	Thu, 12 Jun 2025 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x9ZyhK5m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53CC24679B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jun 2025 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734113; cv=none; b=ZZ8EtlNga7KPvA4gtX8tMN6LdHX8KzNLDyN45Sk/WWV9Pdth52bfPw5GlIAsFLevgAjaR5iT3rxNjJsUr2XlNMJCiWwB3bRmEK0J9sIuhTxzZrhIqLSSNjY0Y8xihi0qMCKNdXxMxL+sGhnA9rJADBSbXUquz3GSGkgUqO+6VS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734113; c=relaxed/simple;
	bh=sCDoXXNBxmPwbf3a/nWGCODMe8PfvxZNcJlcu6h+m9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2sA0OLfLrJ6+Av0eAsrJjf1PmtkeKxju1dcGvmt+2jOhWQIx/Nkgv60w+k0QZzDRl9l4ZAwjkElc2wVRTP6434qFwyV762CPOwzX+/E7+CAmyZgiN7LLc509vWqeynZMri3e5QJq//nAYgt5POkvICH8BUhGwPJj5EvhvR2kPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x9ZyhK5m; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45306433f71so764765e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jun 2025 06:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749734110; x=1750338910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+1nvndDPSf3rno4NE/6pzQH+gNBaZnuR+dy35/KBfh8=;
        b=x9ZyhK5mJl1NN5jpAfUNlvXL3Yv4LpirrDudabQFNSOwY1hj8c6Q/J7uzx0soWOr4F
         mONybhynmxkzOEDqRKbgNR8a80Cc6NhqMfswpouAxyAQToW0kSCuQpSU8jV73dY2K6cF
         1sINSHcEHVdaDs7Zx+7qZiwdfr4LWdvIz4QU2RMk1kX78HcxuhbEqpIKPGTboLJO4QGK
         2z5NQn37B6yuZgrVD6TXKpFyz5iO5783irA+1WGX0OS30fa7h1ZlmYNpamVWHc4fOIsG
         +lsaNsT1wRA+TnFMGrNiA5JQDGkdQ1QUAteUO61uVeyekSLx2eI+f3gWPSs50WNkqnkR
         yj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734110; x=1750338910;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1nvndDPSf3rno4NE/6pzQH+gNBaZnuR+dy35/KBfh8=;
        b=hVkKwBtzA6OC18g/2NGJubc2keRhe+vP9X8fT8bKRikWEgQYvj54CPMwBOiti736+T
         K2UQBI15d4XGyYpXzJBL8UpNK+gpFtiaUV4LyjWpMCq3kuNxdSf1Hb5KuL3ZNht4PpSf
         SyFZxZqBAdoeTsGsr09TvMkmWHuyl1e/EJOAlWdXqpvQY+/qx1q/a3hPXJ4Xxi9DXbmX
         +aeg/stCA3XL+g+p2AXHAkLE23owrfSuc8L7HcwP1dYe5U1NFhTA6bra15+1CtodIkqX
         wQDbDjtaxC7izLveI/cshmGtDeKQqWWzxe0ib5pKvB/DdgnxiKp/pSfh64MPkC6ZX0tZ
         EVyw==
X-Forwarded-Encrypted: i=1; AJvYcCWlvG0VyYshHcNBuIRI2MDd5/5BNgXJFC6ZvlEN1KiK2LU/55AYrvdEMD02Lj1j+yp2nIqv1+QpyXijRYfE6goWjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx99eK/Uet7fMHO8k28autgMiAxeq0M9xFdfbqKRrmpf+phmpfU
	a023x3PND34vSBPtHG7So6MhfGv0nzXSJTkPGquBfwlTS5ubRmhmpyX4CZ+jo7r4YDo=
X-Gm-Gg: ASbGncuNdxDvBOeLGhUtO3Z2o05lEwz4lHX9kDvPmysnGK22MJ9PPLgYdX8AfVE6P0R
	9EvWqzUILla8qR85u4Yzpbos8InPAPS8Qk34QbICPebA054H4WWARrbWcd9r/xJGu2UphYmTRIS
	4o1+8vRV853JbBF7YD4q9rlDUGjB2HarMbaFXKKiN7PYYbHaQ5NYrn+GXazo0Cn1mrYPAZnK30N
	ppyiUahyLOuLkeK09wdxyG71Jvpnp9JvODGasRLxU11za02Tz/UeDnvsV2ua3VoZgVN7KFEK1UQ
	ApMDNabyTDaaoXL5cbjCfhWx3UbuPOMfPzDWeGfJfANPohU8rVcQQ2q6uQvnGZL5SStLlGotAVS
	ZYq3vBSA=
X-Google-Smtp-Source: AGHT+IGAWIc6/VwWOMDSaL48T8iFsXjC3G9y91FhqFZHh9tptedZxVKs0wh77LpvnkYN14yUxrCYQQ==
X-Received: by 2002:a05:600c:8206:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-4532487cb66mr25575385e9.3.1749734109809;
        Thu, 12 Jun 2025 06:15:09 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24155bsm20263935e9.17.2025.06.12.06.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:15:08 -0700 (PDT)
Message-ID: <ed10ad79-6cfa-42c1-b3f3-d8f54d58c2fb@linaro.org>
Date: Thu, 12 Jun 2025 15:15:05 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Jon Hunter <jonathanh@nvidia.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
 <bdd989b4-a572-44c2-ae7b-2c445c09fd7a@linaro.org>
 <d05f2c03-fa86-4fc6-9b81-1a7b5592c2e8@nvidia.com>
 <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2025 14:34, Geert Uytterhoeven wrote:
>> I do agree that if we start to build every networking driver into the
>> kernel it is going to bloat. Yes I do see the kernel image growing
>> regardless of this, but nonetheless it seems better to just build as a
>> module IMO.
> 
> Not _every_ networking driver, of course.  AFAIK, making network
> drivers built-in for systems where development is done using nfsroot
> has always been acceptable for the arm64 defconfig before.  For things
> not critical for booting, modular is indeed the preferred way.
> 
> BTW, we have other low-hanging fruit to fix, though:
> 
> CONFIG_SOUND=y
> CONFIG_SND=y
> CONFIG_SND_SOC=y
> CONFIG_SND_SOC_SAMSUNG=y (Krzysztof? ;-)
You cannot boot without sound :). Uh, I am on it.

Best regards,
Krzysztof

