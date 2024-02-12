Return-Path: <linux-renesas-soc+bounces-2605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD8851070
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 11:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7758287F4A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 10:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC04617C73;
	Mon, 12 Feb 2024 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VJQ4RCTx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230117C67
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707733032; cv=none; b=E/r51RrcRgdSx52bXx2EZOCcVaQBLc3ktfkxHoURkDQA9I9lCAhzCww5ZnWh4nT+7C4tX24IjBYDTTHkyJe+yrnY+3x9ihsGiE4wRpqTuCJ99v9JCV05AVttzGwdsQL08v56FvG7FBdW8zqoL8ciraVk3ViFlvKXAvEYdV5bmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707733032; c=relaxed/simple;
	bh=I6wNZ4pza9EtIc8UsE6gyNDwJIsXjeyvx6EI+rVwxPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IzN4H6aGJB4YWMynQzYDUh9JCf9YmY6p5dHUm9MdZQip7W9uSMqGWPSM1g1n5dYgMdXrRrenLA1dvnrSs0iJGG9BWTOYeX0sTsiYaNlyz3CdHz+H7GGCShCjryfRxZC5sPIrupd33M+6B/Id8uWTwR7FbebbkcmHVmZOy8IYgjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VJQ4RCTx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33aea66a31cso1649382f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 02:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707733027; x=1708337827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dd4aZvMpVCCSCnP/v1/q3mbmiSL+tNaXKE5+hDn+73Y=;
        b=VJQ4RCTxUGsPeIt1E00/x8mIhHr0IPLyq/300pBBoUV/D/K5wxt0OtR6qEqT21gKaq
         Ql2XYadgj94DQA1JjVYOL6A18R5dWq8YXn599OA7qq7V/M5+T+zWo7XsX7M3HCgBDuC5
         UlpS5vQuRf2/IMkpOQ5fJUYRhltiO24Zbq8jyis7f9XNuN0tUOiBt/mqNQMYQrld51cK
         jnizPBTZXMjDraAhUghgedNA7IK62sUYy61M3AzQeLHeBBu58r2pbl0QeudgBwQ7ZWtv
         wgHXEmLhmO06BjVuO8E8/J3x2JygidFHaagRDu/jpx2EzGGHb6IQPMg0wiBc32NhyXBE
         Bn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707733027; x=1708337827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dd4aZvMpVCCSCnP/v1/q3mbmiSL+tNaXKE5+hDn+73Y=;
        b=Ptv0KqRhznoTVb9MqrLg9YY6nf0EBTKZDZOiQXxEbQ2sLxrljD1h/isLDCBaYQcmJ7
         Uhg0UBoe/F1CQmSl5Qw7Xqdp8U/9Zw1bYVN6da+/MrYu4aCCMaGokbovhPLLw4OYtSmZ
         QAhZLtsjYKPzgJGJm7NaKhBLo4zuL1Laa+iDe6Alq5aBf4WHrs4ZoHYox4kbACARM6kz
         FSA5YQAGBYschmAkNTssOkaVNs2Kp/IAqBlLxKzsBJHEAas4OepL+U4WzBiDM2J72fwp
         UBpXsVgvDxjaKOxHl10hOq5qWBqavhVwQnXm12nSj9/DFodSPxHx0XjwyoTPYeXdeaLY
         +duQ==
X-Gm-Message-State: AOJu0YxZ5Zigs6ngNUG/Fu6sOh40dZMlytN4RdjcRZ7kfEcCXwPeUNnL
	Qru1DUFR4LoK6UfeotzsVnc7ZbBrGqWOKnMnrNXg19n8rrpZXT5BkcYX9Hz/FKU=
X-Google-Smtp-Source: AGHT+IGKS3cAGeO91ncUkS3BzIDpmHkJlAP3rM+a3pmivE6RK7mO5OdH3h9r0soPZ9FeRjTndSpbEg==
X-Received: by 2002:a5d:424c:0:b0:33b:2633:b527 with SMTP id s12-20020a5d424c000000b0033b2633b527mr3644735wrr.20.1707733027133;
        Mon, 12 Feb 2024 02:17:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXS/3bn8x9wSB7hJgZQQQrZrpThyplym6YpI1SmaffkSK9Gu6jVbETHmPWZMZqGD1Fg2+QLCoZoCyd9dnjfWoyfsoDHlcF/jIiLKg5yZgaIjxKBAMyAuaECBDDnoc7lsqe7q88rWP0Y8l02G6zcDi/R3sZcfbP8HiKNA9OlwtBxyhH/kFA0xnSUM7pmTfpfG2DamdFGrwiEpY+BsAlIY+UIYJ+rvA78pOQo0XD9DtPzBrE7stOgKFvNrF0YLau0mvSIEGsXvfzvgPKP2TWnOk5L2DOy4ZAHx+658d/wSUiYHHFl+VaMyvKc7WMiGMteUFTbvzYgIPdG1/QLejKIcvW9pS14KJQj7yjzDwFeUA9ZixxC3gZimROIfJ9WwA3s/6TQ95ydu1DQvAvwrVB3s4EfEcbKNu16EA8e94Ti9hy3OR82BtHyNWVJCmKzfhBQ70PlX6VVj7kzL6E/PVg0YU2ntyFy+GYTF055BsUf8fQrEZA3i4qkK0EZowXjb9QWa7mY6BZFL334+cGk4S8cygYcXQMW/cy47OHIj4Xf/Q2LP4faE9KA4V4Q8F4/L2MGhdo7Dm5z/T3HVCfHQTVpqLflPKshZll1Nao2
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id f5-20020a5d58e5000000b0033b44456463sm6320751wrd.106.2024.02.12.02.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 02:17:06 -0800 (PST)
Message-ID: <b484c9ef-254e-4cdb-8409-6f0af1171335@tuxon.dev>
Date: Mon, 12 Feb 2024 12:17:05 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power domain
 IDs
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-2-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB11269DEA9261CA594EECC949686442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <67ad8052-1406-4dcb-9e35-5c42ada28797@tuxon.dev>
 <TYCPR01MB112698AB206332D13105C064186442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <e170f5f8-f95c-4553-b088-1072345fae53@tuxon.dev>
 <TYCPR01MB11269015C92AA327DC6BFA76586442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <786f90f4-ba47-46cb-b5e0-e3c42b1b741a@tuxon.dev>
 <TYCPR01MB11269A240E2EDD460D0B97B9786482@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB11269A240E2EDD460D0B97B9786482@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12.02.2024 10:59, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Monday, February 12, 2024 8:02 AM
>> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
>> domain IDs
>>
>> Hi, Biju,
>>
>> On 08.02.2024 21:20, Biju Das wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>> Sent: Thursday, February 8, 2024 4:53 PM
>>>> To: Biju Das <biju.das.jz@bp.renesas.com>; geert+renesas@glider.be;
>>>> mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
>>>> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org;
>>>> magnus.damm@gmail.com; paul.walmsley@sifive.com; palmer@dabbelt.com;
>>>> aou@eecs.berkeley.edu
>>>> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org;
>>>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>>>> riscv@lists.infradead.org; Claudiu Beznea
>>>> <claudiu.beznea.uj@bp.renesas.com>
>>>> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
>>>> power domain IDs
>>>>
>>>>
>>>>
>>>> On 08.02.2024 18:28, Biju Das wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>>>> Sent: Thursday, February 8, 2024 3:46 PM
>>>>>> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
>>>>>> power domain IDs
>>>>>>
>>>>>> Hi, Biju,
>>>>>>
>>>>>> On 08.02.2024 16:30, Biju Das wrote:
>>>>>>> Hi Claudiu,
>>>>>>>
>>>>>>> Thanks for the patch.
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>>>>>> Sent: Thursday, February 8, 2024 12:43 PM
>>>>>>>> Subject: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
>>>>>>>> power domain IDs
>>>>>>>>
>>>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>>
>>>>>>>> Add power domain IDs for RZ/G2UL (R9A07G043) SoC.
>>>>>>>>
>>>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>> ---
>>>>>>>>  include/dt-bindings/clock/r9a07g043-cpg.h | 48
>>>>>>>> +++++++++++++++++++++++
>>>>>>>>  1 file changed, 48 insertions(+)
[ ... ]

>>>>>>>> +#define R9A07G043_PD_TSU		46
>>>>>>>
>>>>>>> Not sure from "Table 42.3 Registers for Module Standby Mode"
>>>>>>>
>>>>>>> Power domain ID has to be based on CPG_BUS_***_MSTOP or
>>>>>>> CPG_CLKON_*** As former reduces number of IDs??
>>>>>>
>>>>>> If I understand correctly your point here, you want me to describe
>>>>>> PM domain in DT with something like:
>>>>>>
>>>>>> power-domains = <&cpg CPG_BUS_X_MSTOP>;
>>>>>
>>>>> MSTOP bits are distinct for each IP.
>>>>>
>>>>> <&cpg CPG_BUS_MCPU1_MSTOP x>; x =1..9
>>>>>
>>>>> 2=MTU IP
>>>>>
>>>>> 4= GPT
>>>>>
>>>>> etc...
>>>>>
>>>>> Is it something work??
>>>>
>>>> It might work. But:
>>>>
>>>> - you have to consider that some IPs have more than one MSTOP bit,
>>>> thus, do
>>>>   we want to uniquely identify these with all MSTOP bits (thus the
>>>> 2nd cell
>>>>   being a bitmask) or only one is enough?
>>>
>>> We can have an encoding in that case 8:16 24 bit entries
>>
>> I consider this complicates the bindings. I don't consider this is the way
>> going forward. But I may be wrong. I'll let Geert to give his opinion on
>> it and change it afterwards, if any.
>>
>>>
>>>> - some HW blocks (e.g. OTFDE_DDR) have no MSTOP bits associated (as of
>> my
>>>>   current research), so, only PWRDN
>>>
>>> Why do we want to add power domain support for DDR?
>>
>> To power it up (in case bootloader does any settings in this area) such
>> that the system will not block while booting.
> 
> DDR is enabled by TF_A and is not touched by linux, so why are we adding
> Power domain at all in first place. TZC DDR is not accessible in normal world.
> 
> So if you don't add DDR power domains, linux doesn't know about any thing about
> and it should work like current case.

It is related to the way MSTOP and PWRDN hardware features works together.
PWRDN allows you to save more power by setting IP specific bits in this
registers after you set the MSTOP.

OFTDE_DDR and TZCDDR have PWRDN bits dedicated as well as other IPs (e.g.
serial, ethernet, etc) in CPG_PWRDN_IP2. Setting CPG_PWRDN_MSTOP_ENABLE to
CPG_PWRDN_MSTOP applies the power down for the IPs specified in
CPG_PWRDN_{IP1, IP2}.

It may happen (as in my case) to have a bootloader that sets all the bits
in CPG_PWRD_{IP1,IP2}.

If you want to save power for the other IPs listed in CPG_PWRD_{IP1,IP2}
you have to instantiate power domains for the blocks that you don't want to
be powered down due to setting CPG_PWRDN_MSTOP_ENABLE to CPG_PWRDN_MSTOP,
to power them up. Otherwise the system will block when setting
CPG_PWRDN_MSTOP_ENABLE to CPG_PWRDN_MSTOP (if bootloaders previously did
some settings in the above specified registers).

Hope it was clear.

Thank you,
Claudiu Beznea

> 
>>
>> It is explained in cover letter:
>>
>> The current DT
>> bindings were updated with module IDs for the modules listed in tables
>> with name "Registers for Module Standby Mode" (see HW manual) exception
>> being RZ/G3S where, *due to the power down functionality*, the DDR,
>> TZCDDR, OTFDE_DDR were also added, to avoid system being blocked due to
>> the following lines of code from patch 7/17.
>>
>> +       /* Prepare for power down the BUSes in power down mode. */
>> +       if (info->pm_domain_pwrdn_mstop)
>> +               writel(CPG_PWRDN_MSTOP_ENABLE, priv->base +
>> + CPG_PWRDN_MSTOP);
>>
>>>
>>>> - some HW blocks have both MSTOP and PWRDN
>>>
>>> That will be an array right?
>>
>> I'm not sure what you want to say here.
> 
> This has to be an array PM domains(multi PM domain) like clocks?
> 
> Or 
> 
> It can be  handled as sibliling power domain like sibling clocks in RZ/G2L Gbether.
> 
> Cheers,
> Biju

