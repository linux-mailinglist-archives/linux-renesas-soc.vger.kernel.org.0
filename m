Return-Path: <linux-renesas-soc+bounces-6786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF60917CB6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 11:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B05EE1C2275E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 09:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3295F16CD0B;
	Wed, 26 Jun 2024 09:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uOrrSKWm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08768BEF;
	Wed, 26 Jun 2024 09:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719394901; cv=none; b=JwepR0FuLlI550LZ9HYE4cHtQbPTfb2d7/xS+w+Iyqpn5vvFxf19oUVHlKc/647pL/Z0TQyADNXceYroNnxeXG3F0UKfjwQxusw36/2XuSDnMyxhmArFbLFAFAY3d+JxQBL94/MRXirzJdyV06LZw9KHdsWf6/OouLycsQS8WsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719394901; c=relaxed/simple;
	bh=s3z7HXMv4Han+cJsdchl0Tjew+5XriJiwIN+Ja5UnaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MeNL21XRxpDXvNONeZ90HD7NY95wfBj4RXr2/vjID1LpA8GAXTJlKXRS9E1+a1rZJjsMVzRvdkBa/tnKEPbiRmmn3GJx/+8cJHM4kwP0Ad98XPxR4RU/3jkgwAKfEWbHFbyBMF+zqOpvxiUDWcmD/fYvZOTa0R25lOxfR/api7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uOrrSKWm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58D4C32786;
	Wed, 26 Jun 2024 09:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719394900;
	bh=s3z7HXMv4Han+cJsdchl0Tjew+5XriJiwIN+Ja5UnaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uOrrSKWmRIW4TSdz+ruUE1K5qfT30Xcy9B4W9WAYRPr0ClteEew+XD0o8YxxRtYHj
	 d9412DC9EwkSRtEYo+rYXmmhw26ome1CIq5U/zB3CKH8k3tvIjRcyjEK00INVhPii/
	 XCcMXIUU9HuxGhokj4CDpQixmu9xU7xSBiqRuGIpS30+fD9B8/iU4LxX9iN005G2xh
	 Gf5Mthm42iLQgZAMPHmOicHnjyipeVIGIDzk2VX6/PfZvm38n1rEoywuSZRV4PKFy2
	 TK3qFxAaK9TsN+pxFNl9leYVXXvNSJRD5yYG3+JbhFl5nwAy3miz/mv7jYnsDvfQGY
	 d0CrnQq6a+LnQ==
Message-ID: <214be4bb-3e24-4868-8cb7-db73b6cd4b50@kernel.org>
Date: Wed, 26 Jun 2024 11:41:33 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: clock: renesas: Document
 RZ/V2H(P) SoC CPG
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240610233221.242749-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <34b21e6f-0896-4691-9b66-d06ef2f44905@kernel.org>
 <CA+V-a8u6dDpbb5BrQ+ty_RbwcPOF-U6rnJnuASRXEDVdrhrvAA@mail.gmail.com>
 <20438973-d7a1-427f-a2ed-5c5b9f7db872@kernel.org>
 <CAMuHMdVrXmDBxD4gGkHvs3iUuT6nnzjWzVUme7jH5u=YpyzQuw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAMuHMdVrXmDBxD4gGkHvs3iUuT6nnzjWzVUme7jH5u=YpyzQuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/06/2024 11:35, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, Jun 13, 2024 at 2:57 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 13/06/2024 11:53, Lad, Prabhakar wrote:
>>> On Tue, Jun 11, 2024 at 8:02 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>> On 11/06/2024 01:32, Prabhakar wrote:
>>>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>>>
>>>>> Document the device tree bindings for the Renesas RZ/V2H(P) SoC
>>>>> Clock Pulse Generator (CPG).
>>>>>
>>>>> CPG block handles the below operations:
>>>>> - Generation and control of clock signals for the IP modules
>>>>> - Generation and control of resets
>>>>> - Control over booting
>>>>> - Low power consumption and power supply domains
>>>>>
>>>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
>>>>> +  '#clock-cells':
>>>>> +    description: |
>>>>> +      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
>>>>> +        and a core clock reference, as defined in
>>>>> +        <dt-bindings/clock/r9a09g057-cpg.h>,
>>>>
>>>> So second cell is not used?
>>>>
>>> It will be used for blocks using core clocks.
>>>
>>>>> +      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
>>>>> +        a module number.  The module number is calculated as the CLKON register
>>>>> +        offset index multiplied by 16, plus the actual bit in the register
>>>>> +        used to turn the CLK ON. For example, for CGC_GIC_0_GICCLK, the
>>>>> +        calculation is (1 * 16 + 3) = 19.
>>>>
>>>> You should not have different values. Make it const: 1 and just use IDs.
>>>>
>>> Are you suggesting not to differentiate between core/mod clocks. They
>>> are differentiated because the MOD clocks can turned ON/OFF but where
>>> as with the core clocks we cannot turn them ON/OF so the driver needs
>>> to know this, hence two specifiers are used.
>>
>> Every driver knows it... I am really, what is the problem here? Are you
>> saying the drivers create some unknown clocks?
> 
> The driver knows for sure which clocks are module clocks, and thus can
> be used for power management.  To simplify the driver, two separate
> numbers spaces are used:
>   1. Core clock numbers come from IDs in the DT binding headers,
>   2. Module clock numbers come straight[1] from the hardware docs.
> As the latter are fixed, merging them into a single number space in
> a future-proof way is hard[2], the bindings use 2 clock cells.

IIUC, your module clock numbers are not DT ABI and should not be put
into the binding headers. I think that's the case currently, right?

If above is correct, considering your explanation I am fine. Thanks for
the time to make it clear.

> 
> Alternatively, a unified number space using IDs in the DT binding
> headers could be used, as you suggest.
> 
> [1] "straight" may be a misnomer here, as the DT writer still has to
>     calculate the number from register index and bit index:
> 
>         n = register index * 16 + bit index
> 
>     i.e. register index 1 and register bit 3 become 19.
> 
>     In the R-Car series, this is handled slightly more elegant
>     (IMHO ;-), and easier to the human eye, by using a sparse
>     number space:
> 
>         n = register index * 100 + bit index
> 
>     i.e. register index 1 and register bit 3 become 103.
>     Which also matches how the bits were named in older SH-Mobile
>     hardware docs.
> 
> [2] One could use an offset to indicate core or module clocks, but
>     future SoCs in the family may have more clocks.


> 

Best regards,
Krzysztof


