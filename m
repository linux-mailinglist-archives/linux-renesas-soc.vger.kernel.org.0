Return-Path: <linux-renesas-soc+bounces-17042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA8AB5578
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 594447B7FC7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 12:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3843E28E570;
	Tue, 13 May 2025 13:00:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA58814A8B;
	Tue, 13 May 2025 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141228; cv=none; b=V9bv1FrSO7yJ59IsKaUxwbZr9mh4Cbqwn2vc/l1F2KFXY76IirYw1FwEC9Ae3supKbKMaIgrMtOskyyceLMh+s0tzm6pwxWKNA5Mm1168WchKZvNH5XTeYmSCh5zSzICMgrlmrRKAo+JhkFdmbRdTVdy8fl2uubgei6vmMphW0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141228; c=relaxed/simple;
	bh=Lf8uF/Q1FE+GhjmXdklD8IWYFlGj2Q+vf/VzLofI2qQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tb/MrIRaKMuCpI8EExglgAPWmWDaS57xLT8SEmyH4AepwNGjuwXQpdnwwkJenWzDHUsxJUThkzlyi1yu6QaeKrnKG33BeuqY0Hwqgn9vwwplOgp2xSFLKdLeVpUgsqG1dis1QqjMrAA6zN4Y2frd2ezSDvJh1vuWadbJkFMUNDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52b2290e290so3872757e0c.1;
        Tue, 13 May 2025 06:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141224; x=1747746024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5jzqleEKHGuOiPowZ5FE8XDwnarjmdZVgRL/24IkJo=;
        b=SJymN+a3CWjeTC0CLi6sd8cdpwetkkF5W4afXA5HMgZbvPS2sDbcV9UDW70Eo3992+
         w3EwBUuNKanBpE1512PbJwVXOVpZ7hWXm+eqpufT+/P6pBgZ7Nl3gWJLVnhuXVEtGOyw
         2P/MXAl1NN72IHscsi3ajoLZBomy2bsyz8MLa7WaCbm6JPFkQ/2OuwxsOnq3p04BA/W6
         7nJ5e49aCU95ACIQm/9UV6KaYuivW+StqFENU1IObYhbKNjfDIOJFtq7bQlIg3zQJLZa
         EcvJYm61FPmS6ACj19P1qA2W/W+bFLWvIyIGP/4NNu4BSgZ1F5aTFbkUV6o8zFKOKgMq
         S+YA==
X-Forwarded-Encrypted: i=1; AJvYcCUUYdhyK3ScvF67ZyRbJF0HtMeHckxz+M2idxuUUH8X6NsKlM4COB8xTuUDgGHjalp7jORj0HJN9+l3M728zsrqS0Q=@vger.kernel.org, AJvYcCVEVrldfyM47yrvWXzlyctKuSM3PLr1UsaoA8yGhYZmuR2MEsGSBOPfsD85zGPGPWhJL9KsH9z62kNmN/aS@vger.kernel.org, AJvYcCVzuWa0Wjh7FtuPokAKNO5ntu7OtpVkSwj86PtALpMnA9DVBe7cGwc8AI8zPb2yRvTAwsiP+B1pqfvya3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXhzw0A391VQJ+jRj+OqirLXgTx0V3ufXsDjaJQ3t2z/co8fGi
	MEx7844lLxjUScy9BjS/ijmUKBHHddkg5k1RhTjkfE0fZ0r9FXk5aeGJjZGn
X-Gm-Gg: ASbGncv4xCqd5Cg4+UVA2m/uNgSqm42DitWlUyzdiPxI65wDfmAw+8C1eoTsINtFhJb
	slbwqzBRImm/SmTMNCpyfOjSDIRTO0QuXDyLugAQI7ajANHyk4Sc9zccegSlu5CI0oinHcVVE+a
	SKdbB7bXEgo7DFi4mIjq8pjFNH6xyWSmPsEswyzxs9zlDMXzL1TKRij8EkKvN6z7NkoDfmqOQEX
	d6K5XpPBFNhqI39hCy1MoRY8GTNk6zNucTv0SnzsqqQsIXYFbABcpYqijsII8nxkvsCVUDwoMaf
	F3tqTtYf+m/sDQTJq6c/l0e74vItsqBlZPvm32NXHvTzZoZtyzG8rLD9XI7F3smuzgGgN9lOWlE
	+RM9ZgSyoyzLZn178lA==
X-Google-Smtp-Source: AGHT+IHcVrVPIAuWgKApjNqoRnkxJ2a4yhQaBw6UP0mYP+tLYBac75iovzedsLTjUPAdGRwuPKO+hw==
X-Received: by 2002:a67:e7c1:0:b0:4bb:eb4a:f9f0 with SMTP id ada2fe7eead31-4deed3e9364mr15668658137.24.1747141210987;
        Tue, 13 May 2025 06:00:10 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea8580188sm6666294137.4.2025.05.13.06.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 06:00:10 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52d9a275c27so18870e0c.0;
        Tue, 13 May 2025 06:00:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0yS4CgJDryvGPyrwZsdg66aurXu3oJhBWT4ziH5jnJSryQtmyEd0X3ER33c7/TbzWJpEYpnMsMboYXPfn0T8jw+Y=@vger.kernel.org, AJvYcCUueNxxMGBX41e+oWZoZR+rjmNFn+qL5KoudFrrBPduWUqMic6foR+i0u33+7LSVKiIb1kcY2Fd4QPsesaY@vger.kernel.org, AJvYcCVcqbZEYOJlCtXUq6IqrnkPRAsVhYAVSXBgpuDFjQFtXnLzV8Ek/63f/XELeLBg3fGVs7I+9lsrh7GOT7s=@vger.kernel.org
X-Received: by 2002:a05:6102:5e97:b0:4cb:5e02:7538 with SMTP id
 ada2fe7eead31-4deed3e8a2amr15558738137.22.1747141199461; Tue, 13 May 2025
 05:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com> <20250429081956.3804621-8-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250429081956.3804621-8-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 14:59:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWa1_UtOEgKHoOfaN4aYvpVobjX_QK=auND_cs_uwxjnQ@mail.gmail.com>
X-Gm-Features: AX0GCFvkAoqeV-D9pQF8d2sZ0d4oB6jC2nrqk0-bdLnpi5fLeLiUatOYEBMrKZ4
Message-ID: <CAMuHMdWa1_UtOEgKHoOfaN4aYvpVobjX_QK=auND_cs_uwxjnQ@mail.gmail.com>
Subject: Re: [PATCH v8 07/11] serial: sh-sci: Use private port ID
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

Thanks for your patch!

You forgot to CC the serial maintainers.

On Tue, 29 Apr 2025 at 10:20, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> From: Thierry Bultel <thierry.bultel@linatsea.fr>
>
> New port types cannot be added in serial_core.h, which is shared with
> userspace.
> In order to support new port types, the coming new ones will have
> BIT(15) set in the id value, and in this case, uartport->type is
> set to PORT_GENERIC.
> This commit therefore changes all the places where the port type is
> read, by not relying on uartport->type but on the private
> value stored in struct sci_port.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

scripts/checkpatch.pl:
WARNING: From:/Signed-off-by: email address mismatch: 'From: Thierry
Bultel <thierry.bultel@linatsea.fr>' != 'Signed-off-by: Thierry Bultel
<thierry.bultel.yh@bp.renesas.com>'

> --- a/drivers/tty/serial/sh-sci-common.h
> +++ b/drivers/tty/serial/sh-sci-common.h
> @@ -142,6 +142,9 @@ struct sci_port {
>         int                             rx_fifo_timeout;
>         u16                             hscif_tot;
>
> +       unsigned int                    type;

u16 should be sufficient, as you store the new info in bit 15.
Even u8 is sufficient (but then you have to move the new bit to bit
7), and has the advantage of not increasing the size of the structure,
as there was still a 2-byte hole.

> +       unsigned int                    regtype;

u8?

> +
>         const struct sci_port_ops *ops;
>
>         bool has_rtscts;
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index ff1986dc6af3..2abf80230a77 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -75,6 +75,8 @@
>
>  #define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
>
> +#define SCI_PUBLIC_PORT_ID(port) (!((port) & BIT(15)) ? (port) : PORT_GENERIC)

Please simplify by inverting the check:

    ((port) & BIT(15)) ? PORT_GENERIC : port

> +
>  static struct sci_port sci_ports[SCI_NPORTS];
>  static unsigned long sci_ports_in_use;
>  static struct uart_driver sci_uart_driver;

> @@ -3050,6 +3063,9 @@ static int sci_init_single(struct platform_device *dev,
>
>         sci_port->cfg   = p;
>
> +       sci_port->type  = p->type;
> +       sci_port->regtype = p->regtype;
> +
>         port->iotype    = UPIO_MEM;
>         port->line      = index;
>         port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_SH_SCI_CONSOLE);

> @@ -3799,7 +3815,8 @@ int __init scix_early_console_setup(struct earlycon_device *device,
>         if (!device->port.membase)
>                 return -ENODEV;
>
> -       device->port.type = data->type;
> +       device->port.type = SCI_PUBLIC_PORT_ID(data->type);
> +
>         sci_ports[0].port = device->port;

Here you have to fill in sci_ports[0].type and sci_ports[0].regtype,
like in sci_init_single(), else they are always zero when using
earlycon.

>
>         port_cfg.type = data->type;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

