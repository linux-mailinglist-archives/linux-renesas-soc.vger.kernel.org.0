Return-Path: <linux-renesas-soc+bounces-19062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5AAF6B3C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 09:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3045C4E654A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 07:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F781BC099;
	Thu,  3 Jul 2025 07:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fNzukh+s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EEB292B53
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Jul 2025 07:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527049; cv=none; b=HmE6USLaUd8jYw04KDGI+iSDQZYjZQOGaWXAZ2txbI7JuJIBl3Jmt/sxhNczNKNRbfCYor2hCcJh6UhpkppmuTuARBtNG2vWeus1MJaz0+OwklPgGWNntxMG9WqQwcb0B+J1sxM3ukOry+pQaUh9O1Tcnmr/9hV7mTCIpU39Gh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527049; c=relaxed/simple;
	bh=w5S6M49m60hjSJs7bbXRrpTRRAazZ5vTIgpMk34vjwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q3guVK5qFAYhtJzdCzdZ77lE0DOr/Yb85HslUnayydeaXN+XVHqFRlkkXYbBWBUYB4MhA9n6ZeoCw6T+L9PpHt5OYyeYzhy+CS1BPhjbgiIqEaKNNT6n3FfCfkN9ai6r56zyoW1mjN/F8zsJapVWDDO7CAb7ox2xcq5ZMsPmoEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fNzukh+s; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0de1c378fso748112966b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Jul 2025 00:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751527045; x=1752131845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0HoS/AjEWAKNGkAqtn2tT2loqaFKZfdMKEbgahHL+u8=;
        b=fNzukh+sx3Ayhdk2TPTpXyZWU6T/ktD1ISn0yA6spMuETsd2kcHQF6ajvH8bMDtJ5W
         ucXXWSGEuS3zOvwj75ypQgiMRUOFoaT8tnqzNy00hwGlgKa3gKY56pAlT6hBv81n5Y22
         uJzwmNdi6GwD2jU2Ne7y0Dc4OdCqaWGdNeAfPu05k83H3BS66ofacDdXt9BSpn710m2y
         ERalxNV4OzJwUBIHj6cEgWh5TzZGHO9aY9pih/MA4UoSShnaExyVCtNQNAtKmH5somgm
         mxMDsdS61IugAlTckfw+wu8ruluzTfdqrjeC6YThs2uAbjBGTKK60YAeLOHimcRDNRvI
         XW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751527045; x=1752131845;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HoS/AjEWAKNGkAqtn2tT2loqaFKZfdMKEbgahHL+u8=;
        b=NaDQgoDkdaUYu5HYvTm+kepQOj92OWjllMFBpoxFw8EhDpHwNU/cuFG7Lap2FdactF
         SmQxCpoRxwVz5CGfyTHlSdoK42uuHpnnicd6ngreCBhb4FsOCj+CTPzi1dNhk9ZryZ2x
         dq2CzQnT4o4AXCbLPszrt34sevnJc1YREdy7RdWIQYsuO5e6OdFMfVuFmYdnrGzYnxRW
         Eqtcym5zl4+eJS8Do7KqxD8ogSndJXZ+AjZXBZ1tLezvas/OLi87Ieg1YjgOEiG3SirV
         a1Pu1mrx162fjuKSoc1QPnBE3PjOHEOa4GTzKGfA14EKVUD3O8EZqNLtKlEZZ9Rha/nm
         E9FA==
X-Forwarded-Encrypted: i=1; AJvYcCURI4VKerxRmGlIokrGCf84OMgzxoFDlrNaEN3BXWnFQ0CyLFj3LMHxrUhKLzQJV6bDpa/s+fEfxs5JOacy1P2wvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF2AoBqG1ypJC3b3D4XtCVErD9jf7nDnAk2tovg6nkfQUrB0At
	YecU6Wm4BPGsHk1YZXDgcXbDlLNjY0thWloxbVuEmWnZYJkyg1EjZCKnhgRKqV/yXeQ=
X-Gm-Gg: ASbGncsWS9/4R0/6xxR9MsxrHEfqUYJpYgOdj8+SKZnmpYY4cUGBzl46ccwRyaM0zLL
	ipsn3LFUdeDHzXCqte+nAa+uQmmzGVypuJ3EuV3i3ijsZa+uDiErVxAOIeF1nAOXZtXta04UAfT
	eApEyp+QKuvxsV8efZZkEKNQ9vZo6NyFtt3TCLQb0ziIYe7Fgy3Yswe52GqY16cwZylhHpsidng
	UhhwcktRcRjCORcC6ew+Cv5iJZrn5j+yeXyqXBNk4EUqX2jxvoX2UtXryJUBiuu4Zcbfl6k7C1f
	pLNH1wNHT2YN1Q4rDIxiBPAUeBZLE012oiwmZetEClgUb1cqVP16/MVCmqhwHfb5LQmt79W/Hdg
	tW/1U
X-Google-Smtp-Source: AGHT+IHQ0ths50w6/RyRtuRA2JhYMmgHNAUdE2kYjVaVZHBm7vIJx7cAGzpSqzEoWqdAGpd3BW43yQ==
X-Received: by 2002:a17:907:7fa7:b0:ad8:8efe:3205 with SMTP id a640c23a62f3a-ae3d8b956a0mr185852766b.55.1751527044472;
        Thu, 03 Jul 2025 00:17:24 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353639c07sm1219430366b.18.2025.07.03.00.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 00:17:23 -0700 (PDT)
Message-ID: <25a4e9bc-4c96-4c9c-880f-e67223662f56@tuxon.dev>
Date: Thu, 3 Jul 2025 10:17:22 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>
References: <20250414153818.214811-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUjtG-EcrpbDO2y8M=GQeV=5i4qODp=VZqymipeCneXhQ@mail.gmail.com>
 <TY3PR01MB11346205BCA481EA7B740A3028641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVNCRGMmgBT2Ow4Af0CTf1iiS=AwhsLnZMFFy40tLYS0Q@mail.gmail.com>
 <TY3PR01MB113462A4490760D5C6C59FF968641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113462A4490760D5C6C59FF968641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 01.07.2025 17:38, Biju Das wrote:
> Hi Geert,
> 
>> -----Original Message-----
>> From: Geert Uytterhoeven <geert@linux-m68k.org>
>> Sent: 01 July 2025 12:50
>> Subject: Re: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
>>
>> Hi Biju,
>>
>> On Tue, 1 Jul 2025 at 13:40, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>>>> From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon, 14 Apr 2025
>>>> at 17:38, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>>>>> RZ/G3E SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
>>>>> USER_SW3. Add a DT node in device tree to instantiate the
>>>>> gpio-keys driver for these buttons.
>>>>>
>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>
>>>>> --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
>>>>> +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
>>>>> @@ -12,8 +12,13 @@
>>>>>   * SW_SDIO_M2E:
>>>>>   *     0 - SMARC SDIO signal is connected to uSD1
>>>>>   *     1 - SMARC SDIO signal is connected to M.2 Key E connector
>>>>> + *
>>>>> + * GPIO keys are enabled by default. Use PMOD_GPIO macros to
>>>>> + disable them
>>>>> + * if needed.
>>>>>   */
>>>>>
>>>>> +#include <dt-bindings/input/input.h>
>>>>> +
>>>>>  / {
>>>>>         model = "Renesas RZ SMARC Carrier-II Board";
>>>>>         compatible = "renesas,smarc2-evk"; @@ -27,6 +32,31 @@
>>>>> aliases {
>>>>>                 serial3 = &scif0;
>>>>>                 mmc1 = &sdhi1;
>>>>>         };
>>>>> +
>>>>> +       keys: keys {
>>>>> +               compatible = "gpio-keys";
>>>>> +
>>>>> +               key-1 {
>>>>> +                       interrupts-extended = <&pinctrl KEY_1_GPIO
>>>>> + IRQ_TYPE_EDGE_FALLING>;
>>>>
>>>> So you are using them as interrupts. Don't you need to configure pin
>>>> control for that (function 15 = IRQ14)?
>>>
>>> The same pin can be configured as TINT or IRQ15, currently it is configured as TINT IRQ.
>>> Is it ok?
>>
>> OK.
>>
>>>> Alternatively, can't you use them as gpios with interrupt facilities?
>>>
>>> interrupts-extended = <&pinctrl KEY_1_GPIO IRQ_TYPE_EDGE_FALLING>;
>>>
>>> The TINT IRQ will provide the same right? Am I missing anything here?
>>
>> When you use interrupts directly, the system will detect only key presses, and fake (timer-based) key
>> releases.
>> When you use GPIOs with interrupt-capability, the system can detect both key presses and releases.
>>
>> See also commit cab3511ea7a0b1fc ("ARM: dts: marzen: Add slide switches").
> 
> As per [1], for GPIOs with interrupt-capability, IRQ controller needs to support both edges.
> But TINT supports Rising or Falling edge, but not both. So, we cannot use this.

If I clearly understand it, this has been solved on RZ/G3S SMARC Carrier-II
by defining these pins as gpio hogs:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi#n141

Thank you,
Claudiu

> 
> That is the reason using interrupt directly.
> 
> [1]
> https://elixir.bootlin.com/linux/v6.16-rc4/source/drivers/input/keyboard/gpio_keys.c#L980
> 
> 
> Cheers,
> Biju


