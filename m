Return-Path: <linux-renesas-soc+bounces-11775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 731EE9FFD41
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 18:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81771188370B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 17:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D885187848;
	Thu,  2 Jan 2025 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="B5CKa+qF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FFE1A83F4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jan 2025 17:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735840680; cv=none; b=fUYcLdg3W56ZJN9Ez/CntmSJHKYTmDYVz0ixzXgfNgieC1skpeXD5UnoNeT5V+EkzuLPBz2if/ib9zGluqFaY8FepWk9hxKlBGJfB5J82Q/nPsm8xpNbAuSAIEwuzedReUQ60rGxPPsxspsdRHFZmA1TZYI7b/JrkdSnYo0U6sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735840680; c=relaxed/simple;
	bh=BIcJqQF1mo60m28noB9BsulTBQmAdlnN81edK4ZGNqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i59gmvTvQ3A2a8Uljj/nBNky+qUYw5JH67ZSp30x5ztee8X8HfMWq8aalPXd2/3pROSN+kQDSZQ1m0wy2VaAwG5w4dj0p8SBeKSNExwFrzWFkqq1IBhKoIn/fgtAb0kZk4Q3EfZNerpblVZwop70EnG5nOKZo/A5+VZfSLIqqmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=B5CKa+qF; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso19955051a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jan 2025 09:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735840676; x=1736445476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vdwjwzzmzafgm42srJ5AurIcIbkmKFY6keundMQJSPE=;
        b=B5CKa+qFvOJqGw7shn+NivIH3doaqjXy7hFCFjJ6wSkTlPGaMedM0BJoqYxFdELzrV
         Z3H2JYbKmQ373JPs69OW2KvD1+oo46T5jL6dnBBMvd5ugsa34pIvlet0Htd28y2gLfK9
         /1mV/K/ALKd+nbwnLFbfdyKoqswbe/8BTODbi60yeHW/JoqSua2kc+d+4IAwiEg2J9Zl
         rIwNs6CajtBDhlGdWX3qEDoOpyXwBbxzj9LTahADhlKso53Fa9LQpEooYnkDepv9AEWU
         furQbR4Z+N+bnnlDVS44Qszbccf4wZag/808hxh8BcPq7SrNPHoKjC2L89HTvg/vRHOg
         7qEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735840676; x=1736445476;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vdwjwzzmzafgm42srJ5AurIcIbkmKFY6keundMQJSPE=;
        b=l/Vkh08flF8dOIt23lOaa28znLQZpBh9BCQXMnYl4w7upgZyOSW6KqFfJdXoFINCyX
         Ymx+pd0tQbsujSvGdiOPOsb04lDTi9X95J8hPZGDAI50zfGTIabLNy+dH7Pvq4Ya5BME
         QPNpIYVLyY8LFsV3JRnFNnavJqbPf2rlp5SzGu7g2dGFA5cZ1+0yj0nkCWZ7hYeg1IIJ
         jGq/j/aN0OJM4xDvwopUjDFXrotTI5un5cRyDLWGFY3Zkl7Dw4TgA2wmHyoUMaSLRWIM
         +MLIEwXCGGUaGOK/SbAM+sU0cl8ykmzfgtO8XluPkINBkzFTRZdNE+p6sPvw0Son/JIV
         WihQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrF81W7M7h4y4o/4dhiaH8AydIwt2A+pL+USYAUf1zdpLQGTuwy88KtNQ6FEf6zSPDLy0LEzqif/33ra32wxAuOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys1g3IJxHeKbkwnCYMJw6yvI4i8ph3amNHwD5LmgLO6kf0tet/
	0R075NDzp15VB4n20l/n/DSpCRcd+YgjdyYm7JYdsrnqD+czHfn3YaBz6RNUeQI=
X-Gm-Gg: ASbGnctGNW2NBx0NBd4ZNjRwlHyy2zzKk78eo1hGkIDdnRVRqbdVumtbcKP57CWBstX
	zg6IclJzaMzX+uQyy2nT/hQZxoqcYSd5n5Ys4WyplA/paIgpTqZ3UnxVvwpIR0Kj0rGV3qQTqrR
	adONh1z5l9UvaM7fuwEzDGFXI09dURUp+m1+0jLZCzYR+Nx8dw8NY4BWnIbbD/IdSLG/fO0FSiv
	g0Dq14F+F95vfuRqOJ0KGFMcNHwqAXmYEPXJxm9QWye0nvVN6363VlKDdpb50Macg==
X-Google-Smtp-Source: AGHT+IEclYxqDj/gw3ex0A5AseUgwI+61bsYn5H8911VEyjPwwC7u5j2r+gESJWRIInAMs7gLs2/gQ==
X-Received: by 2002:a05:6402:2346:b0:5d3:bc1d:e56b with SMTP id 4fb4d7f45d1cf-5d81ddfdf76mr35136627a12.16.1735840676286;
        Thu, 02 Jan 2025 09:57:56 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedbd0sm19114731a12.55.2025.01.02.09.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 09:57:55 -0800 (PST)
Message-ID: <38fc5c6a-e4b5-46d6-89df-3aea9a33f79b@tuxon.dev>
Date: Thu, 2 Jan 2025 19:57:54 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 6/6] serial: sh-sci: Increment the runtime usage
 counter for the earlycon device
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 lethal@linux-sh.org, g.liakhovetski@gmx.de, groeck@chromium.org,
 mka@chromium.org, ulrich.hecht+renesas@gmail.com,
 ysato@users.sourceforge.jp, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
 <20241204155806.3781200-7-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWB2q7=gkHUsmVWwZMCWaj-htUpOQCr24y5HsbQvM+HMA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdWB2q7=gkHUsmVWwZMCWaj-htUpOQCr24y5HsbQvM+HMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 19.12.2024 16:30, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Dec 4, 2024 at 4:58 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> In the sh-sci driver, serial ports are mapped to the sci_ports[] array,
>> with earlycon mapped at index zero.
>>
>> The uart_add_one_port() function eventually calls __device_attach(),
>> which, in turn, calls pm_request_idle(). The identified code path is as
>> follows:
>>
>> uart_add_one_port() ->
>>   serial_ctrl_register_port() ->
>>     serial_core_register_port() ->
>>       serial_core_port_device_add() ->
>>         serial_base_port_add() ->
>>           device_add() ->
>>             bus_probe_device() ->
>>               device_initial_probe() ->
>>                 __device_attach() ->
>>                   // ...
>>                   if (dev->p->dead) {
>>                     // ...
>>                   } else if (dev->driver) {
>>                     // ...
>>                   } else {
>>                     // ...
>>                     pm_request_idle(dev);
>>                     // ...
>>                   }
>>
>> The earlycon device clocks are enabled by the bootloader. However, the
>> pm_request_idle() call in __device_attach() disables the SCI port clocks
>> while earlycon is still active.
>>
>> The earlycon write function, serial_console_write(), calls
>> sci_poll_put_char() via serial_console_putchar(). If the SCI port clocks
>> are disabled, writing to earlycon may sometimes cause the SR.TDFE bit to
>> remain unset indefinitely, causing the while loop in sci_poll_put_char()
>> to never exit. On single-core SoCs, this can result in the system being
>> blocked during boot when this issue occurs.
>>
>> To resolve this, increment the runtime PM usage counter for the earlycon
>> SCI device before registering the UART port.
>>
>> Fixes: 0b0cced19ab1 ("serial: sh-sci: Add CONFIG_SERIAL_EARLYCON support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/tty/serial/sh-sci.c
>> +++ b/drivers/tty/serial/sh-sci.c
>> @@ -3435,7 +3435,24 @@ static int sci_probe_single(struct platform_device *dev,
>>                 sciport->port.flags |= UPF_HARD_FLOW;
>>         }
>>
>> +       /*
>> +        * In case:
>> +        * - this is the earlycon port (mapped on index 0 in sci_ports[]) and
>> +        * - it now maps to an alias other than zero and
>> +        * - the earlycon is still alive (e.g., "earlycon keep_bootcon" is
>> +        *   available in bootargs)
>> +        *
>> +        * we need to avoid disabling clocks and PM domains through the runtime
>> +        * PM APIs called in __device_attach(). For this, increment the runtime
>> +        * PM reference counter (the clocks and PM domains were already enabled
>> +        * by the bootloader). Otherwise the earlycon may access the HW when it
>> +        * has no clocks enabled leading to failures (infinite loop in
>> +        * sci_poll_put_char()).
>> +        */
>> +
>>         if (sci_ports[0].earlycon && sci_ports[0].port.mapbase == sci_res->start) {
> 
> Now there are two tests for mapbase: here and in sci_probe()...

I'm not sure how can we avoid it. We need to re-check it in this function
as the sci_probe_single() is the one that enables the runtime PM. Would you
prefer to move the devm_pm_runtime_enable() in sci_probe() and have the
pm_runtime_get_noresume() in sci_probe() as well?

Thank you,
Claudiu

> 
>> +               pm_runtime_get_noresume(&dev->dev);
>> +
>>                 /*
>>                  * Skip cleanup up the sci_port[0] in early_console_exit(), this
>>                  * port is the same as the earlycon one.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


