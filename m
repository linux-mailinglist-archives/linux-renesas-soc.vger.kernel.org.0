Return-Path: <linux-renesas-soc+bounces-19068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 163BEAF6D08
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 10:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC8761C43B4C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 08:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261442D12EB;
	Thu,  3 Jul 2025 08:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mns8X3pX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C28017996
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Jul 2025 08:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531707; cv=none; b=dUuIE3qsfgj2cylWo+jJEYXsz6I/OE8PExaCUKRoxNmFfqBAq7/ly7QDMJUH3lW+RRCPeJzZnuTBpec2Qxft460GdiTiHyE5xakKQNVXw1Cu3yztCOy+YTx7oOtdZMrASISMSQ6ydVpAR/Qcdm49V3p/etUdpq1RMwkBw30wP/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531707; c=relaxed/simple;
	bh=NT0yQG3sC1VKEvVYPrK/jls25IuUlGbDhx/qzeFhFw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZifzYa0CS9EfBOROyGA9bVwGa0tCJgY9+ogzjWOfsYew4NyM4azEBT1iWlKyQlmkDmMB2DyHeLn1CUPD9b7NtKJjI6jAKHaXG4WDMM+pd1SUv0Q3XwIk3+y/JSlbM2ih+dQEcl43Lc5x+krVi/wNZpxG5OUUJ6RPakX9suDaJLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mns8X3pX; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso10167736a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Jul 2025 01:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751531703; x=1752136503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b2eX30yl7oqdcdrJB3WzZqEr8ZG/CPC8SD+o4qZfKEs=;
        b=mns8X3pXn78K+Taco4IvfsudjoD2Z1IsAlm/kahzWYNl/veVhEv7VtoJIXKbkU2G9w
         3OG50mqMpmYfTjgtF02A60O3pfaNyNa3m05UZ95szpeejwrO+sPYsvR7mpEYkBDjRxsg
         8OsOPaoYN0ySmmTjJw/1B+iC3deCHVVJoXv6YlquiF0m/dl07s5ZWRaluTplkw1YhjWI
         x/qJLLHR13sYevjrKAVEXgtN5G4cZ0N0U33OFJDUcItjMwnAiHQcqD53nhUBsWxBN60j
         /olV5mfwpNVPlg8MPDO2lvGHSupEe2YWati+7OxAlSktBZQR7WXeHtPEnAZ1eky6ZUmv
         6q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531703; x=1752136503;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2eX30yl7oqdcdrJB3WzZqEr8ZG/CPC8SD+o4qZfKEs=;
        b=rlSuhZiBc3mbFSyrPJBqgVPzTDMLq2O2qzIBv6JtEFXXfrDbpb3jJpoOuwDJii3AGU
         +QYSZxopVxe1tAS5JB+Anl4VQi6rWrmbGIuxx7vrzP8BpBKjlJL76gHg5bvld1m0rSpG
         0htpiWtAR/C7AhINa7MVVA/rR7Q7Zm7VwrMo6X0xj/UdbkasWaOQeNx/6KXXuvb6G+X3
         BeKxq46zVCvJetWV407SlZd1X7QZYg/R7HZKQnveTCEtDFYkPXVOHLbN3WVN+Df2C4mZ
         LqFVnqGiqq1Img+KM7jljeV00fUY7QXUB7rfYhpxsLw7DDAehJ1IEKBfVKwZon50xXfB
         mmtg==
X-Forwarded-Encrypted: i=1; AJvYcCXC8qhxkpqDVG/KP0lJ+MGbfJlA3Ym1CPtW8ZO0EurfkWqUArmv5f8D0NtOzZVxYt2m6Pc5hwCkeITankbCf3kbJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysK87Py+eewnu2OUNXTCHDXXEfgUXbCNu7Z+RXgyWRQ++UynJe
	dnmKLqigxZ092KoUyR02zvs3iTe48Gp1atL4Z+Ah4cGl+qEvnMEEa3LADx+k33WzRzM=
X-Gm-Gg: ASbGnctJCO8O/YkKGAvYnK1wGJwr5xGA77SoeGZKl464W4oN5TfjQOJgWJC6sCMOT8C
	K+ruoy9D1FcTYrsbUwiDwDQhAyez1cG+F8dPFL18mKjPZgTBspCewXKbYRo3LNQym1PjG1CejYi
	vvi+L6oG5QWVyQbEJ5fkAuaJ7LhUl+TzBmv24AVpFhURIHmYTh9xGe6OWqfRIOHjUKMnizYp+za
	lY6M8EeYx7gn9poobVP85helqlp1wvjc2nvsQhzhASyhUjQgeKhjHPhsm0o9nCnmF6F134IKp1I
	DWZxDjzryRJnGH6l2bhU3qy/NNRJL+mSOFVpLSMiWTc2Wmo15l+JqEIO7/mMYRbHfKTzLg==
X-Google-Smtp-Source: AGHT+IF/Y2iFli3knmF19jiiLfqcT8/gMSbL/8+pT+jQ7QFuTg1qr/h5I1xoan1atXKvMNyhdeJAjw==
X-Received: by 2002:a05:6402:51d2:b0:606:f836:c656 with SMTP id 4fb4d7f45d1cf-60e52d01efamr5862235a12.19.1751531702333;
        Thu, 03 Jul 2025 01:35:02 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8319b155sm10376216a12.52.2025.07.03.01.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:35:01 -0700 (PDT)
Message-ID: <bdcae7f1-b53e-47f8-9349-93306815f418@tuxon.dev>
Date: Thu, 3 Jul 2025 11:35:00 +0300
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
 <25a4e9bc-4c96-4c9c-880f-e67223662f56@tuxon.dev>
 <TY3PR01MB113467E8D43A07ECDE07D12648643A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113467E8D43A07ECDE07D12648643A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 03.07.2025 10:42, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 03 July 2025 08:17
>> Subject: Re: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
>>
>> Hi, Biju,
>>
>> On 01.07.2025 17:38, Biju Das wrote:
>>> Hi Geert,
>>>
>>>> -----Original Message-----
>>>> From: Geert Uytterhoeven <geert@linux-m68k.org>
>>>> Sent: 01 July 2025 12:50
>>>> Subject: Re: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add
>>>> gpio keys
>>>>
>>>> Hi Biju,
>>>>
>>>> On Tue, 1 Jul 2025 at 13:40, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>>>>>> From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon, 14 Apr 2025
>>>>>> at 17:38, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>>>>>>> RZ/G3E SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
>>>>>>> USER_SW3. Add a DT node in device tree to instantiate the
>>>>>>> gpio-keys driver for these buttons.
>>>>>>>
>>>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>
>>>>>>> --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
>>>>>>> @@ -12,8 +12,13 @@
>>>>>>>   * SW_SDIO_M2E:
>>>>>>>   *     0 - SMARC SDIO signal is connected to uSD1
>>>>>>>   *     1 - SMARC SDIO signal is connected to M.2 Key E connector
>>>>>>> + *
>>>>>>> + * GPIO keys are enabled by default. Use PMOD_GPIO macros to
>>>>>>> + disable them
>>>>>>> + * if needed.
>>>>>>>   */
>>>>>>>
>>>>>>> +#include <dt-bindings/input/input.h>
>>>>>>> +
>>>>>>>  / {
>>>>>>>         model = "Renesas RZ SMARC Carrier-II Board";
>>>>>>>         compatible = "renesas,smarc2-evk"; @@ -27,6 +32,31 @@
>>>>>>> aliases {
>>>>>>>                 serial3 = &scif0;
>>>>>>>                 mmc1 = &sdhi1;
>>>>>>>         };
>>>>>>> +
>>>>>>> +       keys: keys {
>>>>>>> +               compatible = "gpio-keys";
>>>>>>> +
>>>>>>> +               key-1 {
>>>>>>> +                       interrupts-extended = <&pinctrl KEY_1_GPIO
>>>>>>> + IRQ_TYPE_EDGE_FALLING>;
>>>>>>
>>>>>> So you are using them as interrupts. Don't you need to configure
>>>>>> pin control for that (function 15 = IRQ14)?
>>>>>
>>>>> The same pin can be configured as TINT or IRQ15, currently it is configured as TINT IRQ.
>>>>> Is it ok?
>>>>
>>>> OK.
>>>>
>>>>>> Alternatively, can't you use them as gpios with interrupt facilities?
>>>>>
>>>>> interrupts-extended = <&pinctrl KEY_1_GPIO IRQ_TYPE_EDGE_FALLING>;
>>>>>
>>>>> The TINT IRQ will provide the same right? Am I missing anything here?
>>>>
>>>> When you use interrupts directly, the system will detect only key
>>>> presses, and fake (timer-based) key releases.
>>>> When you use GPIOs with interrupt-capability, the system can detect both key presses and releases.
>>>>
>>>> See also commit cab3511ea7a0b1fc ("ARM: dts: marzen: Add slide switches").
>>>
>>> As per [1], for GPIOs with interrupt-capability, IRQ controller needs to support both edges.
>>> But TINT supports Rising or Falling edge, but not both. So, we cannot use this.
>>
>> If I clearly understand it, this has been solved on RZ/G3S SMARC Carrier-II by defining these pins as
>> gpio hogs:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rz
>> g3s-smarc.dtsi#n141
> 
> Looks like it is redundant, you may need to take out the gpio hog node as 
> pinctrl driver already configure the pin as input pin[1].

The pinctrl support wasn't there at the moment gpio hog was introduced.

> 
> As per [2], still it is not GPIOs with interrupt-capability.

OK, the I must have been wrong. I haven't looked in deep over this thread.

Sorry for the noise,
Claudiu

> 
> [1]
> https://elixir.bootlin.com/linux/v6.16-rc4/source/drivers/pinctrl/renesas/pinctrl-rzg2l.c#L2534
> [2]
> https://elixir.bootlin.com/linux/v6.16-rc4/source/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi#L30
> 
> 
> Cheers,
> Biju 


