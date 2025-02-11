Return-Path: <linux-renesas-soc+bounces-13039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C7A30921
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 11:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7A893A2FEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 10:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7F21C3308;
	Tue, 11 Feb 2025 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="picrD+3u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCA41F1510
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271111; cv=none; b=SBF3UZNu7cFAPbIKG57MCcO5mfN5pMLpyF5QvhgMlOTbUZSE3JcBQvGeaIN05L2LizlAxKgKkegdNNU6LOoJ4RKzx3wtRE7UJYv6xRNzDE9yluRFNUg3I/iWl8nFVp6EldrrU/GSoCg60Uo1KWH2xQRXJPyWk7UW01OXlVpr+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271111; c=relaxed/simple;
	bh=ARtF4OvwMld7TDHIHm/xgk9/+u1COpK4K0CUMaX3KTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHYzDFqFP5nY7N0+86BNszaVBZHBge7Otzk/fuFGCjxcW4EvnPq+cV5dcA1/Ogf6cZ/61G5OAl77exyXAUt3BaDeSEg02WI0LxqzqjXr7Qk940VjDzTJgmxuCikgqRhaSCnWsJDzqLzt6MI4gDHRLbqkCYVqn0AjN2U6ft53CaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=picrD+3u; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5de5e3729ecso5903998a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 02:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739271108; x=1739875908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSL6/7KbkCyWike0T72jibPU31Fl6EDKbQdc+JSt7yA=;
        b=picrD+3uUQ7eSIQ9Nj2d3RLIrBVVmOyePFfvhT/pUFWxulUDK/GnpRFsxXZO8YFnAW
         k97J6mRts3C2Syu9orXebhG/FGdOa/XGckdZoNvRztsw7jsNV4t5k2GvH0fSaIkJlzmc
         1emTrdkNGe+MgoW8xmnpGHxW20ca0yxeaq0QZ27A89ajd/ku/dFkze/Op0jqJP3cPara
         YmCURwyLd29FEfrzvRhGwTrhCUvLEmEzLCXqGVOtmAWr9p4UHahSgawknkxFUTmRWNc+
         Qco4QruPVB4QZz82OQoQB5vFAmcgZ7hP1AkYYrKV04c67ztQN+0klXLVYxPsvRQjMX37
         V/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739271108; x=1739875908;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSL6/7KbkCyWike0T72jibPU31Fl6EDKbQdc+JSt7yA=;
        b=ZqzVJIMLoKExUT05cf1ChD/rQN1ftW6/2VtVY7qWJ4++tQnJ8wvZzaoov2eKNocGyS
         czsFTbvITbbiUuW8kQ2r5TGrircTKlM5AWwWKSFYlSvhVRZAFjWecXrieR6vgiTB14/n
         szhjjIEMkxXuKo/qVHjHIJB1goRRIrd8sPH4SNzMU2QRywvyZX+gCqm1/lcsQwPlrsxT
         kqKzf+lWth5SoFvAnjoXPdhNZy/7gp8dCHaoWy9CtH357mqHZzca4U6eG/tW41tgWO4z
         dqx6atHpqH6GuLw9pbdmSB0kp6FBF33EV2K1ff7GuEX8KZZ/EdAFc+86lILcUGneO5/z
         4QYw==
X-Forwarded-Encrypted: i=1; AJvYcCW1mG768tdT3Nv+/OBN0RTUV2CzY7bzMhRaRSMrUoetrQ/PfrKVEJScKJGZG4/aixWSUdGhzf79+spBgfUrMVRFqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsChaye1rpJzQYgMyVabpVnz9F/KTBB+dobIGu3NZltNiTTmMe
	fBimARZKC20/acmO70F/zVYnzjiEw+Bw0B5LYQbBv1jhhST+z2RCEU03dkUv0H375m62aIO6O3f
	t
X-Gm-Gg: ASbGncsNccxZWpjF75vv42Jx/VKWt9bcSEvFAxjGcHk/MbT4AgS/qymo/u3GXI0E19s
	HG7Qt9octYYsgc5oxHMx4LxJqZcFCn5c2hsaPFY/fKMe1y1asjzBvWHNCr/lzWnXMo7gpl7TUvf
	MFAnL0qfmVx3K/qRCpwgqc8W173rxROhukXxy2hYafwdagr8AgjgLXQ5zTfcXMUG3rfBfVHDzIe
	pIzs/D3HIJN03soYwxYA4765Qlo6qfX/YxM3IIx6Ihril3rX0FZoTv0pHN953g2YQZEZasZUFB9
	Z0Bakhr1zcSfg67pQk7RHIO+
X-Google-Smtp-Source: AGHT+IFOlRSXmPpMqNX1Hj05f5snUNJfrKfwz8DXHeQeL+jYNzKx2LjKje3P7Gnm5KJFqEO6VeZy/w==
X-Received: by 2002:a17:907:2ce5:b0:ab7:c115:68fd with SMTP id a640c23a62f3a-ab7da4fb5cbmr276750566b.53.1739271108039;
        Tue, 11 Feb 2025 02:51:48 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ecb3bc1asm3454766b.66.2025.02.11.02.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:51:47 -0800 (PST)
Message-ID: <01f30b36-2f8e-4209-bc73-b955916977d8@tuxon.dev>
Date: Tue, 11 Feb 2025 12:51:46 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] serial: sh-sci: Update the suspend/resume support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, p.zabel@pengutronix.de,
 geert+renesas@glider.be, wsa+renesas@sang-engineering.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250207113313.545432-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXis9-PjpKXP7eDGzdgox_jp8Gop6zgJBrnGrATdFTBTA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdXis9-PjpKXP7eDGzdgox_jp8Gop6zgJBrnGrATdFTBTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 11.02.2025 10:16, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, 7 Feb 2025 at 12:33, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S supports a power saving mode where power to most of the
>> SoC components is turned off. When returning from this power saving mode,
>> SoC components need to be re-configured.
>>
>> The SCIFs on the Renesas RZ/G3S need to be re-configured as well when
>> returning from this power saving mode. The sh-sci code already configures
>> the SCIF clocks, power domain and registers by calling uart_resume_port()
>> in sci_resume(). On suspend path the SCIF UART ports are suspended
>> accordingly (by calling uart_suspend_port() in sci_suspend()). The only
>> missing setting is the reset signal. For this assert/de-assert the reset
>> signal on driver suspend/resume.
>>
>> In case the no_console_suspend is specified by the user, the registers need
>> to be saved on suspend path and restore on resume path. To do this the
>> sci_console_save()/sci_console_restore() functions were added. There is no
>> need to cache/restore the status or FIFO registers. Only the control
>> registers. The registers that will be saved/restored on suspend/resume are
>> specified by the struct sci_suspend_regs data structure.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> The v4 of this patch was part of a series with 4 patches. As the rest of
>> the patches were applied I dropped the cover letter. The v4 cover letter
>> is located here:
>> https://lore.kernel.org/all/20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com
>>
>> Changes in v6:
>> - used sci_getreg() before saving/restoring registers to avoid
>>   WARN() on sci_serial_in()/sci_serial_out()
>> - splitted sci_console_save_restore() in 2 functions:
>>   sci_console_save()/sci_console_restore() as requested in the
>>   review process
>> - adjusted the patch description to reflect these changes
> 
> Thanks for the update!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> One philosophical comment below...
> 
>> --- a/drivers/tty/serial/sh-sci.c
>> +++ b/drivers/tty/serial/sh-sci.c
>> @@ -3546,13 +3559,57 @@ static int sci_probe(struct platform_device *dev)
>>         return 0;
>>  }
>>
>> +static void sci_console_save(struct sci_port *s)
>> +{
>> +       struct sci_suspend_regs *regs = &s->suspend_regs;
>> +       struct uart_port *port = &s->port;
>> +
>> +       if (sci_getreg(port, SCSMR)->size)
>> +               regs->scsmr = sci_serial_in(port, SCSMR);
>> +       if (sci_getreg(port, SCSCR)->size)
>> +               regs->scscr = sci_serial_in(port, SCSCR);
>> +       if (sci_getreg(port, SCFCR)->size)
>> +               regs->scfcr = sci_serial_in(port, SCFCR);
>> +       if (sci_getreg(port, SCSPTR)->size)
>> +               regs->scsptr = sci_serial_in(port, SCSPTR);
>> +       if (sci_getreg(port, SCBRR)->size)
>> +               regs->scbrr = sci_serial_in(port, SCBRR);
>> +       if (sci_getreg(port, SEMR)->size)
>> +               regs->semr = sci_serial_in(port, SEMR);
> 
> IMHO, it does not make much sense to check for the presence of the
> SCSMR, SCSCR, and SCBRR registers, as they exist on all variants,
> and are always accessed unconditionally in the rest of the code.

I kept it like this thinking that it may help keeping this common for
RZ/T2H (though I confess I haven't checked it) and avoid future WARN() on
other possible platforms. If you prefer, I can drop the checks you pointed.

Thank you,
Claudiu

> 
> Same for sci_console_restore().
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


