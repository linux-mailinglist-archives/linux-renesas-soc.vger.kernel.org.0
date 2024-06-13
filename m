Return-Path: <linux-renesas-soc+bounces-6157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE6F9072FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 14:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECCA1281278
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 12:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BC71411C5;
	Thu, 13 Jun 2024 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLmPKkO9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F022A137914;
	Thu, 13 Jun 2024 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718283441; cv=none; b=MHJN00Bb0ZrhoAdWqaOOWsDg44TQSEzgVZhpbvq9ZgxKl/2brB2P4uVfv9JsymVXgnvEAZEEn5iwsU9GYU+o0E6yk5S7pi0EvXOjK2+I9VY6KcSdI9gyFFKMR8yCeQRXgR6yW1GbIt6O8InNgPfhOiyUyYexcUY/LNGUnx1JDl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718283441; c=relaxed/simple;
	bh=yJAjOAQqBQNR36htT0ttCgoovM3gVryXsetYt+hNFgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6fpb9QaPvkt7qx3HxVvLk/wY5une2ZAWW+2af9N8t+G029PYdzIlXW34LxsbwSWqTjXT/gP/xPjb+yg54fpYV4aaD8w9HFcdsOcsek6+Pt/ztnL04bGyAaI9/qoFDxrmZROUkPJNUzZEe9tzLDaAm+myWvcA9XgVWmJcIUK/8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLmPKkO9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E968C2BBFC;
	Thu, 13 Jun 2024 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718283440;
	bh=yJAjOAQqBQNR36htT0ttCgoovM3gVryXsetYt+hNFgA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tLmPKkO9pnmCOYV8Bhu+mFLOcaWe39ZS/mvEBn/wxczbnqBYt9cHbft4HRNFG6Fqy
	 FFWa6P7eIJYG8Vq4lFnxQkm2z1X7ItxiPPIXJo3fstVyeEFaRYb0IK5D/430vmvv69
	 QrANsUkL5RYhpxovbAfMMxx7cu01kcX8D8iFGKNE26OuxCTqLn2WmIdM397mxQUYEF
	 lpZZqrf1EbD88xHJp+QP86tFS1/MLmdCHW/IcKCkGhWs3NZ2gbeK3N9LM9dk0IwIcG
	 aV9h3O9FRqfx5PnOiu44UCL+tLo0/ozH8YNI5JcAIQ/1lf5+lrhJlcIh5AozrT12RU
	 ISbq2jFXva/xg==
Message-ID: <20438973-d7a1-427f-a2ed-5c5b9f7db872@kernel.org>
Date: Thu, 13 Jun 2024 14:57:13 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: clock: renesas: Document
 RZ/V2H(P) SoC CPG
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CA+V-a8u6dDpbb5BrQ+ty_RbwcPOF-U6rnJnuASRXEDVdrhrvAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/06/2024 11:53, Lad, Prabhakar wrote:
> Hi Krzysztof,
> 
> Thank you for the review.
> 
> On Tue, Jun 11, 2024 at 8:02 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 11/06/2024 01:32, Prabhakar wrote:
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Document the device tree bindings for the Renesas RZ/V2H(P) SoC
>>> Clock Pulse Generator (CPG).
>>>
>>> CPG block handles the below operations:
>>> - Generation and control of clock signals for the IP modules
>>> - Generation and control of resets
>>> - Control over booting
>>> - Low power consumption and power supply domains
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>
>> Since this is not a finished work (RFC), only limited review follows.
>>
>>
>>> +$id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Renesas RZ/V2H(P) Clock Pulse Generator (CPG)
>>> +
>>> +maintainers:
>>> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> +
>>> +description: |
>>
>> Do not need '|' unless you need to preserve formatting.
>>
> OK.
> 
>>> +  On Renesas RZ/V2H(P) SoCs, the CPG (Clock Pulse Generator) handles generation
>>> +  and control of clock signals for the IP modules, generation and control of resets,
>>> +  and control over booting, low power consumption and power supply domains.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: renesas,r9a09g057-cpg
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    description:
>>> +      Clock source to CPG on QEXTAL pin.
>>> +    const: qextal
>>> +
>>> +  '#clock-cells':
>>> +    description: |
>>> +      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
>>> +        and a core clock reference, as defined in
>>> +        <dt-bindings/clock/r9a09g057-cpg.h>,
>>
>> So second cell is not used?
>>
> It will be used for blocks using core clocks.
> 
>>> +      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
>>> +        a module number.  The module number is calculated as the CLKON register
>>> +        offset index multiplied by 16, plus the actual bit in the register
>>> +        used to turn the CLK ON. For example, for CGC_GIC_0_GICCLK, the
>>> +        calculation is (1 * 16 + 3) = 19.
>>
>> You should not have different values. Make it const: 1 and just use IDs.
>>
> Are you suggesting not to differentiate between core/mod clocks. They
> are differentiated because the MOD clocks can turned ON/OFF but where
> as with the core clocks we cannot turn them ON/OF so the driver needs
> to know this, hence two specifiers are used.

Every driver knows it... I am really, what is the problem here? Are you
saying the drivers create some unknown clocks?

Anyway, that's not an argument for bindings. Fix your driver design.


Best regards,
Krzysztof


