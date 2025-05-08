Return-Path: <linux-renesas-soc+bounces-16803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD67AAF9F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 14:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCA671BC0F28
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 12:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC7222541C;
	Thu,  8 May 2025 12:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U0Mw8EqT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FAD224B00;
	Thu,  8 May 2025 12:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707405; cv=none; b=XB8hPsW6oFFv0VxrsAA0KWAaxPMEQdxzSeHz2AZKwVtGl0eo1dRqWhN79SKIujq2x9D3ltYVBM5y0paaIVIa/MsITd85EEqgc4aS1CgSt2mJnvJvWwXUG4rOh++/WEmTMQhHmAAUarZ+V8zvlvH5Iyhe2ZWGj5wkTPONiSfdEOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707405; c=relaxed/simple;
	bh=MMD4E03wrSbwweSJzLwMaYfdapLKrO7ojqqkUygJHpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSdot0gYZWlUX8RL15xbNvPDYrpIM+lftok+nnqzOqtPc1/mD4m0HbII9x4FfnOMXCeJx9w1QqvDV8GUhy9TQ7YspWpllg7OXhQkFexcvJTjrelJvnQ8rb/9fCzKNXMkba28hNTQ3huK1cmRMiNiBqJllMfBImntJmi3n7kNJEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U0Mw8EqT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C148322A;
	Thu,  8 May 2025 14:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746707384;
	bh=MMD4E03wrSbwweSJzLwMaYfdapLKrO7ojqqkUygJHpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U0Mw8EqTYzJvn/H6u7wQWiB0ZdlYwXmowQL27+L/zo+uzkYnSSMbCe83nENeT7Mr4
	 S5VBKRphC4KAaZf4/LyIa3FRrmKTqlU4utQ7OfEqyUaCfsPslTlYWZm8P/PhFpyL0/
	 5ZLjiXLIaR//+pK8vzYM7SGEyP3xrj4sI5G6XWLU=
Message-ID: <502e185a-a632-476c-8712-56e845b6ca84@ideasonboard.com>
Date: Thu, 8 May 2025 13:29:51 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add macros for RZ/V2H ISP clocks
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>
References: <20250506121252.557170-1-dan.scally@ideasonboard.com>
 <20250506121252.557170-2-dan.scally@ideasonboard.com>
 <TY3PR01MB12089DADE623A195D184FD5BAC289A@TY3PR01MB12089.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <TY3PR01MB12089DADE623A195D184FD5BAC289A@TY3PR01MB12089.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Fabrizio

On 06/05/2025 14:27, Fabrizio Castro wrote:
> Hi Daniel,
>
> Thanks for your patch!
>
>> From: Daniel Scally <dan.scally@ideasonboard.com>
>> Sent: 06 May 2025 13:13
>> Subject: [PATCH 1/4] dt-bindings: clock: Add macros for RZ/V2H ISP clocks
>>
>> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>
>> Add macros for the RZ/V2H ISP clocks so that they can be referred to
>> descriptively in the drivers.
> I don't think this patch is needed.


Ah, indeed not in this set...I've been using them in the devicetree files (not the drivers as my 
commit message says) for the hardware that consumes the clocks, like so:


isp: isp@16080000 {
     compatible = "arm,mali-c55";
     reg = <0 0x16080000 0 0x200000>;

     clocks = <&cpg CPG_MOD R9A09G057_ISP0_ACLK>,
             <&cpg CPG_MOD R9A09G057_ISP0_VIN_ACLK>,
             <&cpg CPG_MOD R9A09G057_ISP0_SCLK>;

     ...

}


Do you think they're useful for those? If so I'll move this and the rest patch to a later series 
that adds those nodes to r9a09g057.dtsi


Thanks

Dan


>
> Cheers,
> Fab
>
>> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>> ---
>>   include/dt-bindings/clock/renesas,r9a09g057-cpg.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h b/include/dt-
>> bindings/clock/renesas,r9a09g057-cpg.h
>> index 541e6d719bd6..cb2ccd9068db 100644
>> --- a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
>> +++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
>> @@ -17,5 +17,9 @@
>>   #define R9A09G057_CM33_CLK0			6
>>   #define R9A09G057_CST_0_SWCLKTCK		7
>>   #define R9A09G057_IOTOP_0_SHCLK			8
>> +#define R9A09G057_ISP0_ACLK			226
>> +#define R9A09G057_ISP0_PCLK			227
>> +#define R9A09G057_ISP0_VIN_ACLK			228
>> +#define R9A09G057_ISP0_SCLK			229
>>
>>   #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__ */
>> --
>> 2.34.1
>>

