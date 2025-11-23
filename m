Return-Path: <linux-renesas-soc+bounces-25038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 224AAC7E14E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Nov 2025 14:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 90CBF345E91
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Nov 2025 13:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC7E2D6E68;
	Sun, 23 Nov 2025 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+g+kpji"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C564C2459C9;
	Sun, 23 Nov 2025 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763904231; cv=none; b=mSDgEqNl4y0/R3ci+i1PkFlU5WN9i9E3kr5AbmoH4d4uDzRpbIMUX/XXVnyufmpc28oDF9y/O3HU+1cW0dXfIC/ht0fmCsJW5fVDf4RgY8N6iGYwe33MtlVIFQl9+EQouZra/GdDn5k1dQLLpD1t56jU5uU2NFGHjlDSeFy19XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763904231; c=relaxed/simple;
	bh=ruU2XqxYr9I0zzUJNsj0Y8eMYouD+DIo4YNd1RLIF64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UreKaYhKnKDxoPHDrstIvv4ifKklpmTqPJfRx44jPVXqnVsHkmoJeuRASLyGHJccku56MPVp9bx5mu+9Mkq8JIEeZ7OkmSfrvcIdOq8IPvRytncEO7ZckP0UG8+93hSX0aJpGdRWV87qyxcUszrocPJHlKyqqAE6rflWI6lfVK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+g+kpji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE2DC113D0;
	Sun, 23 Nov 2025 13:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763904230;
	bh=ruU2XqxYr9I0zzUJNsj0Y8eMYouD+DIo4YNd1RLIF64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F+g+kpjiIzs/pKfcDd/wvffApgKNWCiGXctGzQc9nd/gltexZuutgSyniL3D/wy5z
	 u3o8EZuBT98dM48LkODmPq9zVQpFc9SMhmm9cV2te55EBgo3D+f9p6R4YGEQznBr0p
	 s/rcJMDE85K6y2+76DRxM21ufU4TTPydLu1x9UqHJ7NYiMriotBHlaS+gy59kpIo/k
	 3230B/3/pyZBgYhS3eCzq+n9RUXlkLwz9xgXc6yD+Ov5RncTQoiKpZZ99UQJbJifKC
	 std8XTYPUm2wVvz+54aiYceywrRq0Y5quR5/OHG7NsYOsuLH35e2eqe5U8n2lJwzsX
	 zTs0IlFN8uYPA==
Message-ID: <32ffb736-d060-4ae9-b4fb-b836a6c869e9@kernel.org>
Date: Sun, 23 Nov 2025 14:23:45 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: document
 RZ/{T2H,N2H} ICU
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251121111423.1379395-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251121111423.1379395-2-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/11/2025 12:14, Cosmin Tanislav wrote:
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: renesas,r9a09g077-icu # RZ/T2H
> +
> +      - items:
> +          - enum:
> +              - renesas,r9a09g087-icu # RZ/N2H
> +          - const: renesas,r9a09g077-icu
> +
> +  '#interrupt-cells':
> +    description: The first cell is the SPI number of the interrupt, as per user
> +      manual. The second cell is used to specify the flag.
> +    const: 2
> +
> +  '#address-cells':
> +    const: 0
> +
> +  interrupt-controller: true
> +
> +  reg:
> +    items:
> +      - description: Non-safety registers (INTCPU0-13, IRQ0-13)
> +      - description: Safety registers (INTCPU14-15, IRQ14-15, SEI)

reg is always the second property. Please follow DTS coding style.

> +
> +  interrupts:
> +    items:
> +      - description: Software interrupt 0
> +      - description: Software interrupt 1
> +      - description: Software interrupt 2
> +      - description: Software interrupt 3
> +      - description: Software interrupt 4
> +      - description: Software interrupt 5
> +      - description: Software interrupt 6
> +      - description: Software interrupt 7
> +      - description: Software interrupt 8
> +      - description: Software interrupt 9
> +      - description: Software interrupt 10
> +      - description: Software interrupt 11
> +      - description: Software interrupt 12
> +      - description: Software interrupt 13
> +      - description: Software interrupt 14
> +      - description: Software interrupt 15
> +      - description: External pin interrupt 0
> +      - description: External pin interrupt 1
> +      - description: External pin interrupt 2
> +      - description: External pin interrupt 3
> +      - description: External pin interrupt 4
> +      - description: External pin interrupt 5
> +      - description: External pin interrupt 6
> +      - description: External pin interrupt 7
> +      - description: External pin interrupt 8
> +      - description: External pin interrupt 9
> +      - description: External pin interrupt 10
> +      - description: External pin interrupt 11
> +      - description: External pin interrupt 12
> +      - description: External pin interrupt 13
> +      - description: External pin interrupt 14
> +      - description: External pin interrupt 15
> +      - description: System error interrupt
> +      - description: Cortex-A55 error event 0
> +      - description: Cortex-A55 error event 1
> +      - description: Cortex-R52 CPU 0 error event 0
> +      - description: Cortex-R52 CPU 0 error event 1
> +      - description: Cortex-R52 CPU 1 error event 0
> +      - description: Cortex-R52 CPU 1 error event 1
> +      - description: Peripherals error event 0
> +      - description: Peripherals error event 1
> +      - description: DSMIF error event 0
> +      - description: DSMIF error event 1
> +      - description: ENCIF error event 0
> +      - description: ENCIF error event 1
> +
> +  interrupt-names:
> +    items:
> +      - const: intcpu0
> +      - const: intcpu1
> +      - const: intcpu2
> +      - const: intcpu3
> +      - const: intcpu4
> +      - const: intcpu5
> +      - const: intcpu6
> +      - const: intcpu7
> +      - const: intcpu8
> +      - const: intcpu9
> +      - const: intcpu10
> +      - const: intcpu11
> +      - const: intcpu12
> +      - const: intcpu13
> +      - const: intcpu14
> +      - const: intcpu15
> +      - const: irq0
> +      - const: irq1
> +      - const: irq2
> +      - const: irq3
> +      - const: irq4
> +      - const: irq5
> +      - const: irq6
> +      - const: irq7
> +      - const: irq8
> +      - const: irq9
> +      - const: irq10
> +      - const: irq11
> +      - const: irq12
> +      - const: irq13
> +      - const: irq14
> +      - const: irq15
> +      - const: sei
> +      - const: ca55-err0
> +      - const: ca55-err1
> +      - const: cr520-err0
> +      - const: cr520-err1
> +      - const: cr521-err0
> +      - const: cr521-err1
> +      - const: peri-err0
> +      - const: peri-err1
> +      - const: dsmif-err0
> +      - const: dsmif-err1
> +      - const: encif-err0
> +      - const: encif-err1

Why all the interrupt names have nothing in common with previous ICU
(renesas,rzv2h-icu.yaml)? These names are supposed to share, not
re-invent every time the name.

Isn't external interrupt the same as GPIO interrupt? How do they differ
for this particular device?

And "Error interrupt to CA55" is "icu-error-ca55", but here THE SAME is
called "ca55-err0"?

No, please start using unified naming, not re-inventing this every time.
Order also is supposed to follow older generation, so bindings share
common parts.


> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#interrupt-cells'
> +  - '#address-cells'
> +  - interrupt-controller
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - power-domains



Best regards,
Krzysztof

