Return-Path: <linux-renesas-soc+bounces-17434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AD6AC2238
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 13:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 869211BA6E54
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 11:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82EE238157;
	Fri, 23 May 2025 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H8w+bItw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0610622A1E1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 May 2025 11:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748001260; cv=none; b=lIXcHw/yaC3Cfj9xmFRu7RmTZG3BwZDMwu6iQU6PatCckYPl+LN/g5n1Y4efPU1ajIEYcmGs5TZh1ixL5ZagALr4xF8Gx0VfUq1xhk7P2cFs/Z2gcyQ42Keah9KW/oIvDtJ/W6YwWF59THHE36vHjof0eZzoIpnnCAUEZW37pVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748001260; c=relaxed/simple;
	bh=BXvJFpVA4ilgRSSeqSYm7PYzi2P89luS7woNYtdBaS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vi3BZMR4BLT079A/oHloyxppN5hALNUT8KY/yFkQCqIRsWvE4d7G/vu3Lo0v0KnLjrcE+SKt8vqrqrbRToKxvEDvhvbcsGRKvU2Bz2mOVKeA/aeAx71rKCsebrixTEumlTTJm3o8J4fbet8qh3KVP03PdjdZMi8nfLnAxLlavB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H8w+bItw; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a361a54454so1144886f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 May 2025 04:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748001256; x=1748606056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k6qou1GXisg5Lz6mIdktWomVTeQC95vvYHD4cO4QbVE=;
        b=H8w+bItwbKhm6OdFJpeXzvF5jqvSLwPzLlgYR/lGaBq/wscnQbtrgv4qUn5pOx4sCI
         hTQsByZDcMbdafXf+4wfIo4UDleqNEJuf2n6GYU6PXBzu7/j/L3mL6gDENmtlH1ZbPLI
         JvYBkO9OFYIbBInRwft5qW/A1bqV/+ojQ8NH2dAHq0Hb/r+JiQDSnSnBBkkcKMECt5Zk
         w01YkF9dMCXQ6Tffv2Zjz0Lhx6wTF4Ly2W38fV88/DElr21BVMyxlVPiBtGoavAVxNej
         ZETacU0hrzxG8ujGiQuSAu9TBG2SBQtQ5veQHH3+I9M1OYmODIzSyJAc5rpPTAaNcQoV
         VdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748001256; x=1748606056;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6qou1GXisg5Lz6mIdktWomVTeQC95vvYHD4cO4QbVE=;
        b=oowxOxKlkcSrPMp7QjYhzIqq58zF2Ve86R2n/TvOeN8HPqvOgxCp322pFaRR3HKA8y
         V4e9S8U78oWWq96oLpJJ8ZK3wiqKaHmJhc+Agsb6h9PapKEbapmm0hVtfTTbashSLWD4
         wIkRHfVUrmbgUY0NI2NJNRLOXPCx0O0e/2jjb702Uvsh5R0jAB5bZWxhQ2Eis1gKEjqv
         2HV2NGFrAq20t6gxoAsJkLfL9cLuhrFzEIi1hzAQbhQsaMdlnfQ4ap3d37IjUcS2XdhU
         vZTAHE9nSjdThRlQ7Sl4FPMYbMidqgmc6MmDI/B4JyrefhFOGcpf+4+M4zy+CFAYUPqc
         6lSg==
X-Forwarded-Encrypted: i=1; AJvYcCWfZbKegEwiwLiyDFE6HIjoDH546Ljjrq/zxAgdZVdLkGDrv8xm7gCTNzSq7hyz6CqiPXRb8vmi3IfS660vjHPlDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYzxBrtCH0Kzl9kmH1oqq3yBsBagxJtylKgGuhSR3SW1vX3kG0
	PvhalBQeCFM8SN9QQc9/KSpPmhNRTVHCeqv4eNCuP2Xqy7MLfgyWBZ1+FPLoDp8QQpA=
X-Gm-Gg: ASbGncthv9gpRxxEmMhkZBGw8MwboNhYwoBuuGKEYWCGFnJ4oVo6nGftFPV86AtiiSa
	7w237IbDOdMci0TRRn45w3Ii8Ymzb/zwK1Q+3dpAMmGQwUD7Vb1GdOu3uVUKWlmYecJOPsf77Aw
	6+sNsjtplSYbH1unU2rgANTBv754E+cuKpDyzpEu2ZwRYICp//31Hc+SBrsHxr3oXLRjuubBRpr
	RZrVK49jrAnMyGlMSIKyONHm3wLbJNPzJd7w17AFhT8Dun4oZcdgNlhxR8ZAU+lqxDFf1GCEKSY
	Ym9b34caoB4inbPjUfB8w9Zy0mKzzBSbKg8vCfhl9l+OSXIOnwcdxBuhb6NSZfVvgzRZCJk=
X-Google-Smtp-Source: AGHT+IFjK0qdgBolj6t+uyk1Uk/P/7Bh1VutPx4WjA3hTJjfWv5K3/rTrjmwSdWfQM8aOb4l/FfPEA==
X-Received: by 2002:a05:6000:188f:b0:3a3:71fb:7903 with SMTP id ffacd0b85a97d-3a371fb829emr6221227f8f.10.1748001256163;
        Fri, 23 May 2025 04:54:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a36c6eeaf8sm18642922f8f.48.2025.05.23.04.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 04:54:15 -0700 (PDT)
Message-ID: <bdd989b4-a572-44c2-ae7b-2c445c09fd7a@linaro.org>
Date: Fri, 23 May 2025 13:54:14 +0200
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
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/05/2025 13:39, Geert Uytterhoeven wrote:
> On Tue, 6 May 2025 at 12:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>
>> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
>> ensure the Ethernet driver is available early in the boot process. This
>> is necessary for platforms mounting the root filesystem via NFS, as the
>> driver must be available before the root filesystem is accessed.
>>
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> ---
>> With this change, the Renesas RZ/V2H EVK board can boot from NFS
>> which has the DWMAC IP.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.17.

With my Nacked, please.

Best regards,
Krzysztof

