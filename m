Return-Path: <linux-renesas-soc+bounces-6382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC5590C5F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2024 12:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24C0E1F2123E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2024 10:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0539B7346B;
	Tue, 18 Jun 2024 07:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GLFkIoU1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900D97345C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2024 07:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696050; cv=none; b=Ate+M1qTyLTF2bhhZL1JkDdkUCxHK+yXDi0CR071VAGMRW3ZxH+H16N/3lW63TA6PJrnLDl1WPymiyiEQsOCEbhIobHt57EKdNISH5Na/JIxyF84ijHG6l0/RjWj0JlyAneBlJ0frIYTSYozsQC7wLQDG9zdM98znET63auhxOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696050; c=relaxed/simple;
	bh=CIImvumzkAeN2g71CDXVF8iXYe2GO0UwOKirtMYFvqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jo+D7nRsZBDy4RqEobToIqCZ8TQPguVdK1IwAXbEuXxhs0SIzuQjslFz4SQ+1ntHI75K041RL1O7OAxYPUa23Pk5tITeawp2Tim1DShDHHCX2Z+4svG9+zl46Uti3kj+jEv2p65c33Rf+rwHWcguzQvUq4daWt+uYz+yejQDsTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GLFkIoU1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42172ed3597so31862635e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2024 00:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718696046; x=1719300846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5rbHo29Bzcv6IgzEIj+saePdUmzo17xMUk+HWO4goE=;
        b=GLFkIoU1WO3tepxt0KspCdQcl22OJRSAOttnup45B9fh6dNobbzq9X9BmGw04txs2V
         BnDo6igMFxU3SBnkO3QnhwUY7uZny/lv5KbYrcp8YBonQwvTLEb1Ul+G8RuEYeMWKZH4
         nBTXGC2/3TIJ9GyyMeX0WULHNFcCfslDUTc+N2NyFpxz2PI/mW32AWRettNuPl2LWvE6
         YK3hGwLiQgXmQE5oZAMt4NskJLV5ulFdD5b3HHnLKsVnZ/AsebUYG9q2hCX0x7gj9vTv
         Xxjw/rCRdztT9f7zU4LdFwDvEGxEWt76IvpiMTDdifPUV7qgb2xF35hJkLWzSO0vChc5
         xniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718696046; x=1719300846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5rbHo29Bzcv6IgzEIj+saePdUmzo17xMUk+HWO4goE=;
        b=bKrGcXaHFzB04UL0TqBfXynIet+CRwRMRAcZWZZqqJrNQ3ksLkxwtTYvVn9cl3E5jj
         XEAaeq03GFlgNRv4L+KByZ7THDJ6MeAdXMG4YLoDHADxYR4K46J3xO2P9bNcZwliWazm
         jt1Mkh3Jzd9FtVWw/3kdVyxazodw8cF2dMmunnVIQ+RIsJ+ztb8WR6GaB3kgVSDOLFit
         xlsrkh7iMabugzEPB5o8wxIn8G7o4R4voxuOMfirPaRPS7IObk84yBPX02vTMsZG+pqK
         qO1WPHrBL+cPGBwhlduc0+9XgD8gL8jD+FmeW9Z4cz4dToi5QUdUgqZRKRYNUd83xlUo
         0GYg==
X-Forwarded-Encrypted: i=1; AJvYcCVdtllPmn4utU4H8kV25v5pT/Lt9ZVa5fYuV4L9MF/REqc1gZv8L5/SaRufpwEAw8Ql4cw+/7DU7vTmvuPUvGH8eXIDvbnMd5lYkqxGjHBeP8s=
X-Gm-Message-State: AOJu0YwPtN8xYI8HwdyqN8e9QGVhmeulBqKoW3BaKVthkAnUSSZb/1cC
	rnzE0V21ellGZDUIrn1DSAhYTh8lhBg6E2tjvfnJXnIW7FZHaz1hfZyp3f0gmBg=
X-Google-Smtp-Source: AGHT+IGs6nMfyFgDynWsbFh3DQ7FHvym58ye8vd0+afKHhJ633/JxauO+1qBYCV6VN20sYRNPadGSA==
X-Received: by 2002:a05:600c:358f:b0:421:79b5:6d84 with SMTP id 5b1f17b1804b1-4246f5dbeabmr15612205e9.17.1718696045685;
        Tue, 18 Jun 2024 00:34:05 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6320bd8sm180070125e9.32.2024.06.18.00.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 00:34:05 -0700 (PDT)
Message-ID: <0a4ba0e5-3fb1-4ffc-b2d8-a4eb418707eb@tuxon.dev>
Date: Tue, 18 Jun 2024 10:34:03 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] dt-bindings: clock: renesas,rzg3s-vbattb-clk:
 Document the VBATTB clock driver
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-3-claudiu.beznea.uj@bp.renesas.com>
 <20240615-angler-occupier-6188a3187655@spud>
 <3d9ed0ec-ca9a-45b4-a633-8f7051d13cff@tuxon.dev>
 <20240617-subsoil-creed-04bf5f13d081@spud>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240617-subsoil-creed-04bf5f13d081@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17.06.2024 18:19, Conor Dooley wrote:
> On Mon, Jun 17, 2024 at 10:02:47AM +0300, claudiu beznea wrote:
>>
>>
>> On 15.06.2024 15:17, Conor Dooley wrote:
>>> On Fri, Jun 14, 2024 at 10:19:22AM +0300, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that feeds
>>>> the RTC and the tamper detector. Add documentation for the VBATTB clock
>>>> driver.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>  .../clock/renesas,rzg3s-vbattb-clk.yaml       | 90 +++++++++++++++++++
>>>>  1 file changed, 90 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml
>>>> new file mode 100644
>>>> index 000000000000..ef52a0c0f874
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml
>>>> @@ -0,0 +1,90 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/clock/renesas,rzg3s-vbattb-clk.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Renesas VBATTB clock
>>>> +
>>>> +maintainers:
>>>> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> +
>>>> +description:
>>>> +  Renesas VBATTB module is an always on powered module (backed by battery) which
>>>> +  generates a clock (VBATTCLK). This clocks feeds the RTC and the tamper detector
>>>> +  modules.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: renesas,rzg3s-vbattb-clk
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: VBATTB module clock
>>>> +      - description: VBATTB input xtal
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: bclk
>>>> +      - const: vbattb_xtal
>>>> +
>>>> +  '#clock-cells':
>>>> +    const: 0
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  renesas,vbattb-load-nanofarads:
>>>> +    description: load capacitance of the on board xtal
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    enum: [ 4000, 7000, 9000, 12500 ]
>>>> +
>>>> +  renesas,vbattb-osc-bypass:
>>>> +    description: set when external clock is connected to RTXOUT pin
>>>> +    type: boolean
>>>
>>> When you say "external clock", is that an input or an output?
>>
>> I took that statement from the HW manual. As of the HW manual [1], table
>> 42.2, that would be an input.
> 
> Forgive me for not wanting to open the zip etc and find the information
> in the document, but why do you need an extra property? Is it not
> something you can determine from the clocks/clock-names properties?

It can't be determined from clocks/clock-names as of my understanding. It
depends on the type of the input clock (crystal oscillator or external
hardware device generating the clock).

> It sounds like an additional clock from your description, is it actually
> different way to provide the second clock you mention above?

This is the block diagram (see [1], only picture this time) of the module
controlling the clock. Please open it, it helps in understanding what I'll
explain above.

The VBATTB blocks controlling the VBATTBCLK are:
- 32KHz-clock oscillator
- the mux controlled by BKSCCR.SOSEL
- the gate who's input is the mux output and XOSCCR.OUTEN

To the 32 KHz-clock oscillator block could be connected:
1/ either a crystal oscillator in which case it will be connected to both
RTXIN and RTXOUT pins (the direction of RTXOUT is wrong in this picture for
this case)
2/ or a device (like [2]) generating a clock which has a single output and,
from my understanding and experience with devices like this, only RTXIN is
needed, RTXOUT is connected to the ground; for this case the 32KHz-clock
oscillator block from [1] need to be bypassed in which case the newly
introduced property will be used; this will select the XBYP on the mux.

Thank you,
Claudiu Beznea

[1] https://pasteboard.co/QYsCvhfQlX6n.png
[2]
https://ro.mouser.com/datasheet/2/268/DSC1001_3_4_1_8V_3_3V_Low_Power_Precision_CMOS_Osc-3314582.pdf

> 
>>
>> [1]
>> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg3s-general-purpose-microprocessors-single-core-arm-cortex-a55-11-ghz-cpu-and-dual-core-cortex-m33-250
>>

