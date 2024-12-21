Return-Path: <linux-renesas-soc+bounces-11675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8D99F9FF0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Dec 2024 10:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41161167846
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Dec 2024 09:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53751F0E2D;
	Sat, 21 Dec 2024 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dsvOAYGb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DCD1EE7D5
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Dec 2024 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734774896; cv=none; b=AZ4V704CwmyTNnskgAG4hyI2NNhloAGxFwVBRL25wvAaTDVzQbdhYGJMSGGjQIaevuayfkZrYTUamqPeRjq3R8zPXCQdtR3yqujSIRNrWW2iTUZsLBM2zhaX4tX/syoFwhPG9T1WoZLP9ZLVyOrGmOHyNLEWVlC4DLchk1Asxmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734774896; c=relaxed/simple;
	bh=21yFNzwfr0UlLcKGuuUepm3ZtReVGYrYIeKxCX+f3bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDrDQdYhLp9UpBmB3elH8H5zd2cKfpgJUWseFd+Th61pwW3Lj/DNC5RLOwXluuAekzKUxvdXQmJogmW6zVQt6RXxwyPs87fuS1RqocB/2Us+Bwb4NYRsY79rh9Nk8dDgybUU0xltG8+W6jQT1wu4Ku45e1DWiY6FD7irbtTAUno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dsvOAYGb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43622267b2eso27558305e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Dec 2024 01:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1734774893; x=1735379693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cwAZFmUQt4eB0rDP0wgTLdFM56hhqo5cdun9nc3XWhI=;
        b=dsvOAYGbBPA3Eext4/AfcijmAjAxFI7Kyik0hZa0kIqinm8lslPnVsaWhYeR48j1vC
         9W+h/wXbuBDtycvZGFPCDTl5ln1ch+mGeev205g9H1s5T+iRK1cU/RVwQe20FsD6WGWq
         OEUwBpwll+dB4xRhShtiP5pOLuaZQ5sMy6XazFdVaGdilM0011Q0I12DDuu0ZZG8tO9F
         ywf1vdq5FHMZgT7tXMy1PZjp9GR4tJjqjgTOoggKHqLHxEA8HLg9vrmZwg/jSW6ip1Jf
         wg/mCnbFHj5iQNJnJW57Nx5wujIEYcKgOADc+/zWYyZUuNxB85EDzjeQVFBwtSqo+TIb
         KPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734774893; x=1735379693;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwAZFmUQt4eB0rDP0wgTLdFM56hhqo5cdun9nc3XWhI=;
        b=ZcVp6pwPnWoh3MI5rCrzFywJQOV9m0B+Z5t1s0Fymilbg/Na56h1w47olyxrBohr3W
         6rE0lhddqGnLRG/ImQUb9X3O1PX5n4Mtkq8xdSS7dkcwPPdB8jh0BHeJUnZL0f/r63i+
         qFiCeuursKDuyFWjqY1+PJZWXXG8o6bFtuCsoZaOUl2mxXVfbzdr/TRvf5USBE+BSicV
         G+fgRMpbRt1P8U6sAmzRsSRnR9rA/4ycIQyoZQBG8IhUZVKWNVp4AYnmAos4ESUcUwKR
         G6lOh0jCrJLabJf7sIhMaE50CgrnVxvO0pCPKX5WgaJ7M7m7iM9DftChc6j5fxj434YC
         ZBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRXuJmCnGYMVClpp5LdNe67Olg5Llbsjx3nlHkYDT4p0qmmxHwrE2KZK77GpBVoGkdAr/L1i2jQSS2MrELxbuLsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4XY9zKsNbl0kKOexGGz9rfS9UGsO4Ef8q0IKW2dU3DBQZo93X
	bLcCUdkuv/Z3QcVcgj32gEfcxg4NWyl99XFOlpWURR2TYfbuFjNR0r2l/K1O9Dg=
X-Gm-Gg: ASbGncuu6sJkwQrIFUXP0+r8yP7FG7N9dVbLPgn5Fa9YuKOZgv9zhP2tS9ywyidtBJf
	UcBTl0RZurUcnxvhq0MbOTF0HybWqH8YI2rMHKlL5kodu49lTRlbbdvKnsaEJu9i+UZPdKwr5V4
	wTY4nX91G1X821d586gZvKeb0cwNyNuNgp8nufDJ5SpQdwawBlaqYlCuKVhvt3/18qrsCHA0/vx
	VAgeWGpWHbfTA2LKqd5dAEnd/jQetoKpTUSJMIu2ReRhqVJplkNeccGX2pz3IypNQ==
X-Google-Smtp-Source: AGHT+IHcKoHkfYzPKUW32sn+bxr45pcsRO8/E29M/H30qFi/thG67nRERccO7sSQQ0/VwWFJDwPcFQ==
X-Received: by 2002:a05:600c:1c12:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-4366d356dfcmr48118195e9.31.1734774893024;
        Sat, 21 Dec 2024 01:54:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366128a44fsm70694785e9.43.2024.12.21.01.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 01:54:52 -0800 (PST)
Message-ID: <c2b64230-f038-4da7-bc07-235072535ae1@tuxon.dev>
Date: Sat, 21 Dec 2024 11:54:51 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 0/6] serial: sh-sci: Fixes for earlycon and
 keep_bootcon
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lethal@linux-sh.org,
 g.liakhovetski@gmx.de, groeck@chromium.org, mka@chromium.org,
 ulrich.hecht+renesas@gmail.com, ysato@users.sourceforge.jp,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
 <Z1DLyQdzUzJzRUJJ@shikoro> <b6c7b4d3-021c-4a4b-9e91-316603b348c1@tuxon.dev>
 <CAMuHMdWx97OnPWnQn78oL+vVuQXmeaJP-byc_4ZwBMZhMOorxw@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdWx97OnPWnQn78oL+vVuQXmeaJP-byc_4ZwBMZhMOorxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 19.12.2024 17:11, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Dec 5, 2024 at 9:39 AM Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 04.12.2024 23:38, Wolfram Sang wrote:
>>>> in the following scenarios:
>>>>
>>>> 1/ "earlycon keep_bootcon" were present in bootargs
>>>> 2/ only "earlycon" was present in bootargs
>>>> 3/ none of the "earlycon" or "earlycon keep_bootcon" were present in
>>>>    bootargs
>>> ...
>>>> Please give it a try on your devices as well.
>>>
>>> Will happily do so. Is there something to look for? Except for "it
>>> works"?
>>
>> As this code touches the earlycon functionality, of interest are the 3
>> cases highlighted above:
>>
>> 1/ "earlycon keep_bootcon" are both present in bootargs
>> 2/ only "earlycon" is present in bootargs
>> 3/ none of the "earlycon" or "earlycon keep_bootcon" are present in
>>    bootargs
>>
>> One other thing, that I was currently able to test only on RZ/G3S, is to
>> see how it behaves when the debug serial is described in DT with an alias
>> other than zero. E.g., on [1] the debug serial alias on RZ/G3S was changed
>> from 0 to 3. With the new alias (3) there were issues that I've tried to
>> fix with this series.
> 
> I gave this a try on Koelsch, which has two easily-accessible usb-serial
> ports, for all three cases above.  Originally, I had CONFIG_VT_CONSOLE=y
> (tty0 takes over from earlycon rather early), but I had to disable
> that to exercise all code paths (ttySC0 takes over much later).
> 
>   A. CONFIG_VT_CONSOLE=y: OK
>   B. CONFIG_VT_CONSOLE=y earlycon: OK
>        early_console_setup: mapbase 0x00000000e6e60000
>        earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
>        printk: legacy bootconsole [scif0] enabled
>        printk: legacy console [tty0] enabled
>        printk: legacy bootconsole [scif0] disabled
>        early_console_exit: Clearing sci_ports[0]
>   C. CONFIG_VT_CONSOLE=n earlycon: OK
>        early_console_setup: mapbase 0x00000000e6e60000
>        earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
>        printk: legacy bootconsole [scif0] enabled
>        printk: legacy console [ttySC0] enabled
>        printk: legacy bootconsole [scif0] disabled
>        early_console_exit: Not clearing sci_ports[0]
>   D. CONFIG_VT_CONSOLE=y earlycon keep_bootcon: OK
>        early_console_setup: mapbase 0x00000000e6e60000
>        earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
>        printk: legacy bootconsole [scif0] enabled
>        printk: legacy console [tty0] enabled
> 
> So all good, but note that these cases worked fine without your
> series, too.
> 
> The real troublesome cases involve using earlycon on a different
> serial port than serial0.  As I don't have any Renesas boards where
> chosen/stdout-path does not use serial0, I tried exchanging the serial0
> and serial1 DT aliases, and updating chosen/stdout-path accordingly.
> 
>   E. CONFIG_VT_CONSOLE=y: OK
>   F. CONFIG_VT_CONSOLE=y earlycon: OK
>        early_console_setup: mapbase 0x00000000e6e60000
>        earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
>        printk: legacy bootconsole [scif0] enabled
>        printk: legacy console [tty0] enabled
>        printk: legacy bootconsole [scif0] disabled
>        early_console_exit: Clearing sci_ports[0]
>   G. CONFIG_VT_CONSOLE=y earlycon keep_bootcon: SCIF1 missing
>        early_console_setup: mapbase 0x00000000e6e60000
>        earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
>        printk: legacy bootconsole [scif0] enabled
>        printk: legacy console [tty0] enabled
>        sh-sci e6e68000.serial: error -EBUSY: sci_port[0] is used by earlycon!
>   H. CONFIG_VT_CONSOLE=n earlycon: SCIF1 missing
>        early_console_setup: mapbase 0x00000000e6e60000
>        earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
>        printk: legacy bootconsole [scif0] enabled
>        printk: legacy console [ttySC1] enabled
>        printk: legacy bootconsole [scif0] disabled
>        early_console_exit: Not clearing sci_ports[0]
>        sh-sci e6e68000.serial: error -EBUSY: sci_port[0] is used by earlycon!
> 
> Case G gives a missing SCIF1, because sci_port[0] is still
> used for earlycon, as expected.
> Case H also gives a missing SCIF1, but should succeed IMHO, as earlycon
> is no longer active.  I think early_console_exit() should clear the
> earlycon flag regardless.

I'll double check it.

> 
> Note that before your series, cases E-F worked too, but cases G-H gave
> an initialized but broken SCIF1 instead.
> 
> Now, can we improve?
>   - Can we use a proper id instead of zero for earlycon, e.g.
>     sci_probe_earlyprintk() does fill in early_serial_console.index?

I looked into that but, as of my investigation, index zero is the one used
in the earlyprintk initialization process. sci_probe_earlyprintk() is
called from sci_probe(). I'll double checked it though, anyway.


>   - Alternatively, can we use a separate sci_port structure instead
>     of abusing sci_ports[0]?

I explored this too, but didn't manage to make it work.

Thank you for running all these tests,
Claudiu

> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


