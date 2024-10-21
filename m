Return-Path: <linux-renesas-soc+bounces-9926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC6A9A5D6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 09:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3843A280CC7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 07:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5E91E0DCE;
	Mon, 21 Oct 2024 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VNRmY2Rj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10020440C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 07:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496832; cv=none; b=SFjN1ERhE7QW3yDaTNnVzVI/UZqcETBps2HUbg4aAfmIn+SXuRCkNUK3lwznd8MlFfLMVCoPjNv/A7WEw9rNkXnuczCIUaqM5mUaM+CEWT3dnOeCEDL2cqie339RmO/dLmH/JEH0MF7w6lSVECBB+kB6BFRIC6jr/9quDiQPOjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496832; c=relaxed/simple;
	bh=lEgExI9W5c4RDCVIaKvv3IAnTJaO8KfdYdJ5ygcdlxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qz9A90XjYBJ3Rsuamyxf3iiY+n19ClDbomqaLO3uamjfFqJZtph42M1lQe6HuG2ettiz9fv1fdcnvlDjsQSviBbus7Vx8COH4CvbgSyuimLRcZE0iSJrw6W3CIYHhOAYnYVKLMbuIC/HWUzxod4b1AKOX4+hfTJLmzTYF2jFr9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VNRmY2Rj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43159c9f617so38699535e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 00:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729496828; x=1730101628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7Moh7NSO8wq+m32Ut3t96PhSkH8hmGy3+JGbszbp+w=;
        b=VNRmY2RjMoUT0q00QWeI04l7giZDs1fzJ/HDlI7kEoB/fCQ4Uef3+BPx6Zil1+5Rwt
         TS6JDh+mVbCaw5Qm8QP31FcBqgi4NHShhII0JiIvbMjiTqUoMw6eUbZGrWISb+ft5y+F
         tzi9KvdfJioGjpQP0Iu9u8gU+ySA0XKUUt6q90Sjd/f4AXhQPKOacGOFxBaV7ZMtFZku
         c57es1jCkApWR7Pv9u7HECpzaBONKTc0E34UsgyS/AOgwVgoEjioakZkbHap4qFG9rHS
         E/3RDrt5FhMB9F331D+is59BjOh8uxPG+bt/F9wEvYBjCZmWArgEqUiaobuvHG8rghvt
         S5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729496828; x=1730101628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7Moh7NSO8wq+m32Ut3t96PhSkH8hmGy3+JGbszbp+w=;
        b=kYyo/BhduC3+ODk+NFCDT20c6Mv8ojM4QyzIySAPzx+4AvRb6oimMsEcOCf0Jv5Eht
         XQepFEQehmK77VlIWTCYprbMZSsLA1Wk99b1e3gvcAucTWn3DAxVyoGVjp785o/yxQhc
         4Zfkm23n2KyQqENiBCTx2Xbr2TawQ2GjLoN5XB4pWguRjCdHuyrCELWyHm2GCAAd8UVf
         xDO5LuoEmkZIbvPM9kUFKdYuUCXuD688QUGHgf7gqPJkqPDqEZFlnIxlyE8NEc1SAQmS
         QO31O2KKDV+iyhiIG7Ghk2MTEFJ5Cco2L2LvcRORKHZY+L7+UH5zXqm66OpUWR6pS+a3
         IUJA==
X-Forwarded-Encrypted: i=1; AJvYcCWGXWTPHyAhZhZJEJdmL85y+57rUyJ0Sd+TTD6CZr5cy91rTdr1muMD/AOryQkYgEiJZHE9rVDjQSbeHd1xc38k6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw06ov/okWHWUV4rpzN/4cELaS+xW7E5+ncoHmdzM7L166G1/TR
	A7lfiippoFlMhSkgy3x09LYpCq1TTDP5lZgsn+g2L5Xkl2VmYxqZn2CdNTwrQ18=
X-Google-Smtp-Source: AGHT+IERSShg0WJsWKe7p9IoZRZe8AE4cyMg7YOpn5Xi631+NWO8ocYGn/AacXCvFpRMXL3ss43sAg==
X-Received: by 2002:a05:600c:3b16:b0:42f:80f4:ab31 with SMTP id 5b1f17b1804b1-4316163b593mr61999915e9.18.1729496828160;
        Mon, 21 Oct 2024 00:47:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37b5asm3597813f8f.10.2024.10.21.00.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 00:47:07 -0700 (PDT)
Message-ID: <c8f3a1b5-e823-4508-a9e0-721c8ca1210a@tuxon.dev>
Date: Mon, 21 Oct 2024 10:47:03 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
 <20241019084738.3370489-4-claudiu.beznea.uj@bp.renesas.com>
 <m4kxv7cba6qd67ahhh4cal6sgieohgow6f3tdvqoxvheemtp4j@gpxbkxd3tvat>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <m4kxv7cba6qd67ahhh4cal6sgieohgow6f3tdvqoxvheemtp4j@gpxbkxd3tvat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.10.2024 10:32, Krzysztof Kozlowski wrote:
> On Sat, Oct 19, 2024 at 11:47:29AM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
>> the tamper detector and a small general usage memory of 128B.
>>
>> The VBATTB controller controls the clock for the RTC on the Renesas
>> RZ/G3S. The HW block diagram for the clock logic is as follows:
>>
>>            +----------+ XC   `\
>> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>>            | 32K clock|      |  |----->|gate|----------->
>> 	   | osc      | XBYP |  |      +----+
> 
> Messed indent. Switch to spaces.
> 
>> RTXOUT --->|          |----->| /
>>            +----------+      ,/
>>
>> One could connect as input to this HW block either a crystal or
>> an external clock device.
>>
>> After discussions w/ Stephen Boyd the clock tree associated with this
>> hardware block was exported in Linux as:
>>
>> input-xtal
>>   xbyp
>>   xc
>>      mux
>>         vbattclk
>>
>> where:
>> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
>> - xc, xbyp are mux inputs
>> - mux is the internal mux
>> - vbattclk is the gate clock that feeds in the end the RTC
>>
>> to allow selecting the input of the MUX though assigned-clock DT
>> properties, using the already existing clock drivers and avoid adding
>> other DT properties.
>>
>> This allows select the input of the mux based on the type of the
>> connected input clock:
>> - if the 32768 crystal is connected as input for the VBATTB,
>>   the input of the mux should be xc
>> - if an external clock device is connected as input for the VBATTB the
>>   input of the mux should be xbyp
> 
>> +  clocks:
>> +    items:
>> +      - description: VBATTB module clock
>> +      - description: RTC input clock (crystal or external clock device)
>> +
>> +  clock-names:
>> +    items:
>> +      - const: bclk
>> +      - const: rtx
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    items:
>> +      - description: VBATTB module reset
>> +
>> +  quartz-load-femtofarads:
>> +    description: load capacitance of the on board crystal
>> +    enum: [ 4000, 7000, 9000, 12500 ]
> 
> It's not required, so:
> default: ?

OK, I'll add the default.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
>> +  - power-domains
>> +  - resets
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>> +    #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    clock-controller@1005c000 {
>> +        compatible = "renesas,r9a08g045-vbattb";
>> +        reg = <0x1005c000 0x1000>;
>> +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
>> +        clock-names = "bclk", "rtx";
>> +        assigned-clocks = <&vbattb VBATTB_MUX>;
>> +        assigned-clock-parents = <&vbattb VBATTB_XC>;
> 
> Why are you configuring internal clocks to internal parents? That's part
> internal to this device, not DTS... or at least some explanation would
> be useful.
> 
> Best regards,
> Krzysztof
> 

