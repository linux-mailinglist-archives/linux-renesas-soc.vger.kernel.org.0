Return-Path: <linux-renesas-soc+bounces-11098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9CA9E9388
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 13:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D8C1188630C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 12:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE1C223714;
	Mon,  9 Dec 2024 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="k5s08lx+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1400E21E0AF
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Dec 2024 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746237; cv=none; b=jreRvf9Q3hH0IEGJABwyNH9CHg2BsbtRIhXLrQSuWki4xhuLFGTPQYe6riLjDWfpQc4tuWUmBhKpV6gIjqcdjnnozZV2T6p1ns5rdqLPWpapdK2oeQaFjYUSc/7yhLE9+07BXv6iLbktU7rqVZ0GHaTOtixLVRkEdjnMZd8xcTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746237; c=relaxed/simple;
	bh=E8tkYJODIHheFUnS5WXIUldliI7SSiXfmfMfRYvHoDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFcMkzZea9glmZp1YUYNXSUfiz+rszSe3ncgEsa6LbnjkG90O3c9sq+NFaPd9S5Pxvq9a1CFSv/QUs153eCW6KS/VjRVzkl/Gj/DHSIpdEmb/nJC44jo/SD3Haym9Fe5u2C6rXsL9YedKO0s0kXHwUGnQQbqSluO2Annjonx/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=k5s08lx+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a736518eso46398275e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Dec 2024 04:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733746234; x=1734351034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHX/J4FydKfXDM4LudMI3jraYFA+WTkpN2SeJgrLN0k=;
        b=k5s08lx+uAqx7VYlqsWlNAubDoTdUuywEmNmcE4GOBjtTtsA7WVOfLOnLOzRQSg06Q
         Al6x4B6WMpZWpkEO4wWMqFjs5h5OoYUboU+UQL93zV2MUZPR/xO6jrFYMX/DRUKTP+tz
         hF5v3jZTJWzFwxHR/H7AueSKd9EJpRWuFG6VWOsPwijHWZ0lmfvT7MVLMmieCJ3/E7ak
         NSm8SRms6lcjquMsHK4vjapWbxVkJbFQwadyFKqcg4gif/BFuVPSkVlh0S3NShBTWtA8
         pfQ2swySFBvBKSKkFCBjpizpPgJb9WKwpMBP0uRQj4DmjS0p+WoaIygbWirJeLHIloqF
         1niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746234; x=1734351034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHX/J4FydKfXDM4LudMI3jraYFA+WTkpN2SeJgrLN0k=;
        b=YiYPx2lUqMQnOM/EG2IctFcVafvDxb4SFenE+LDIB2AlsckI3+F2+kP3Pf6icu8qXw
         ljQPy9Sy8gJnqz0bSJrXFkojXgxSa981Bj76Uzjdi1PrBjD1zIJmhCLvvP9/6X6Cx8GI
         hrzgPqPlbLMa+m4A8JUQAInK5aupGHOe+88zDq+V88TlyYf1pMZXm/DnlFf2OFQJbCGX
         Bhjute9agz2uEz9EIA+5Q/hyAvbEx/Z33lOn3BIAT2K4VYhtn6FAis9q/DTQbMrbGLaZ
         oMzyEhR77Lw7J5bz1zjHiVLqjo5C2qA8jD2tr5G5hHhsw+v/lo9PgfsdgY9ymDrtw5hE
         9vQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSW8kBds6+dsomCx8m6h8DIZx7v15bezAtVHyosFTFexGY0LDy/G70Jxh8nxdvy3h6m9R89XxiI1y9BvKulAf+7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhd0BHFYMgL19d9I/Aom8dHLkueOJD5XAkr0z22OQOxie4J2//
	z0dwl5cWd3gchn6Kt2P/U2xPzxqIrmudzxW5X17Vu2lMmZKHU7OSAOmF0UcHUw8=
X-Gm-Gg: ASbGncsVxeq6tiimVRb3wnkXpDXGSFssOUbonqhiwKWO0s9fGtTbF/rIkER/J7TGC2L
	2hMC4WYrCUaHmQi3yeyWqS7nVXr/bnsgSilpkhk54zVDHxrN7WA6dKgt7U61w/YKdaRmQ6XVZyk
	W5bSBNJVY2U3E38zYg/izeSXn5W8DXxFbnWR/N37WgIjkP3YO4aZbnQr4hV+5hEkB1eSPz2P+PI
	G7DvWKAPiZ7SSS9fapn/VKbHL2JJ2TVY/rpM+IhtaGq35023zW81Tj7u+k=
X-Google-Smtp-Source: AGHT+IGUfN/EA4JH6RTVsbnUKthIOhG2zwFRZUFAX7rqRG2CHXvmm33MqQPTkWqeEZrSe9CBG7Ax8g==
X-Received: by 2002:a05:600c:4e88:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-434fff30e74mr2642745e9.4.1733746234205;
        Mon, 09 Dec 2024 04:10:34 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434e8bb0390sm86199035e9.27.2024.12.09.04.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:10:33 -0800 (PST)
Message-ID: <240a461f-9c46-4f02-81f9-b2c7453fa1f4@tuxon.dev>
Date: Mon, 9 Dec 2024 14:10:31 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] arm64: dts: renesas: rzg3s-smarc-switches: Add a
 header to describe different switches
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, p.zabel@pengutronix.de,
 lethal@linux-sh.org, g.liakhovetski@gmx.de,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-serial@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com>
 <20241115134401.3893008-7-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVgxKHw4PDbgOGAJf7xsRR1Uyzxu-br+=RK_1ouHoj41g@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVgxKHw4PDbgOGAJf7xsRR1Uyzxu-br+=RK_1ouHoj41g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 09.12.2024 12:09, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, Nov 15, 2024 at 2:50 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> There are different switches available on both the RZ/G3S SMARC Module and
>> RZ SMARC Carrier II boards. These switches are used to route different SoC
>> signals to different parts available on board.
>>
>> These switches are described in device trees through macros. These macros
>> are set accordingly such that the resulted compiled dtb to describe the
>> on-board switches states.
>>
>> Based on the SW_CONFIG3 switch state (populated on the module board), the
>> SCIF3 SoC interface is routed or not to an U(S)ART pin header available on
>> the carrier board. As the SCIF3 is accessible through the carrier board,
>> the device tree enables it in the carrier DTS. To be able to cope with
>> these type of configurations, add a header file where all the on-board
>> switches can be described and shared accordingly between module and carrier
>> board.
>>
>> Commit prepares the code to enable SCIF3 on the RZ/G3S carrier device
>> tree.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> @@ -9,25 +9,7 @@
>>  #include <dt-bindings/gpio/gpio.h>
>>  #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
>>
>> -/*
>> - * On-board switches' states:
>> - * @SW_OFF: switch's state is OFF
>> - * @SW_ON:  switch's state is ON
>> - */
>> -#define SW_OFF         0
>> -#define SW_ON          1
>> -
>> -/*
>> - * SW_CONFIG[x] switches' states:
>> - * @SW_CONFIG2:
>> - *     SW_OFF - SD0 is connected to eMMC
>> - *     SW_ON  - SD0 is connected to uSD0 card
>> - * @SW_CONFIG3:
>> - *     SW_OFF - SD2 is connected to SoC
>> - *     SW_ON  - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
>> - */
>> -#define SW_CONFIG2     SW_OFF
>> -#define SW_CONFIG3     SW_ON
>> +#include "rzg3s-smarc-switches.h"
>>
>>  / {
>>         compatible = "renesas,rzg3s-smarcm", "renesas,r9a08g045s33", "renesas,r9a08g045";
>> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h b/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
>> new file mode 100644
>> index 000000000000..e2d9b953f627
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
> 
> I agree with Rob about the license.
> 
>> +/*
>> + * On-board switches for the Renesas RZ/G3S SMARC Module and RZ SMARC Carrier II
>> + * boards.
>> + *
>> + * Copyright (C) 2024 Renesas Electronics Corp.
>> + */
>> +
>> +#ifndef __RZG3S_SMARC_SWITCHES__
>> +#define __RZG3S_SMARC_SWITCHES__
>> +
>> +/*
>> + * On-board switches' states:
>> + * @SW_OFF: switch's state is OFF
>> + * @SW_ON:  switch's state is ON
>> + */
>> +#define SW_OFF         0
>> +#define SW_ON          1
>> +
>> +/*
>> + * SW_CONFIG[x] switches' states:
>> + * @SW_CONFIG2:
>> + *     SW_OFF - SD0 is connected to eMMC
>> + *     SW_ON  - SD0 is connected to uSD0 card
>> + * @SW_CONFIG3:
>> + *     SW_OFF - SD2 is connected to SoC
>> + *     SW_ON  - SCIF3, SSI3, IRQ0, IRQ1 connected to SoC
> 
> Note that the original comment above says "SCIF1, SSI0", and looking
> at the schematics (IC7 and IC8 controlled by SW_SD2_EN#), that is
> actually correct?

You're right, I'm not sure why I've changed it. I'll fix it in the next
version.

Thank  you for your review,
Claudiu

> 
>> + */
>> +#define SW_CONFIG2     SW_OFF
>> +#define SW_CONFIG3     SW_ON
>> +
>> +#endif /* __RZG3S_SMARC_SWITCHES__ */
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

