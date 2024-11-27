Return-Path: <linux-renesas-soc+bounces-10738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 766ED9DABCF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 17:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB482B24DA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 16:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A63202F72;
	Wed, 27 Nov 2024 16:29:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED8D201269;
	Wed, 27 Nov 2024 16:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732724940; cv=none; b=puJOr0XbPlnS0EVD4NBBhY9ZSFcjxPqOtj4zObrYXxFqVeysPafdLzn/D7XjnAm5OuC7InJRQbdEwTMH8CluO0tFKQBFrXpGPyAqX8tB6BeHy78tWfFimbeqHWnywsRRFKN8fJeKiVII9Cvc8YOLWiWRac0y9cWIUqVEQGFIPME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732724940; c=relaxed/simple;
	bh=K0+UzOqrZ522gdt8O1euYjxEX1JtMraCjuxBRFmOd1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rw+75Bb0sZz3PKJhkLXuBL9/1OZX/PcPSQrOEOo6HLW73gFqgpms6fEtBMx89tAdq95C69hRfac3V4AmAuVNKuNsQ+6ARCkojkPK/6Q/o8SAhVos5Cu+4qm6sHUL/F9L+QBArDBKmCEZB86Fp7tRcVVZvMmgatTtuk9OhHbUly8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa51bf95ce1so858959566b.3;
        Wed, 27 Nov 2024 08:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732724931; x=1733329731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhoGox/Y/qnISFpTctTC7YmzCxPu9xjctDpPDiZ/MzE=;
        b=NweY8kcYWuLLdcWN1igvf7uuHR09R/d9FPFOup+4RVUWWtABVm0/+6x+/ksAO64hg1
         6RayDtO3HtvFTnNycXOglV4NUuk+QWGobRji8gNC0YGf45p9C9/Xh67neweSl/FsRhc0
         PVQVW+pj+vmnCDJIiZMd0Xc2U2K/BGEaTlKWnxs1cuIoRotduWozkvnXkSJtprqs/mk2
         NDRzeeNOrleEBaegfotdEliNdxxgLcpCaFIRw5pc/x34iC9CfinEirQZ3M92gHjBeug9
         upV4/XXLayPv2p3OadgZZ9mgCV1X4u95p1zGpTc40LhnAZ4ekdkm+/EX98s/2IUqF97R
         q0TA==
X-Forwarded-Encrypted: i=1; AJvYcCULT48LIBnG0wa82Xk7qdwRg1tloPedGbKMXIdeP/wn4wYvAx+DbUU4y+ZuFxb5ZeYbp2WP02/6UAjE@vger.kernel.org, AJvYcCURf/nwEvJ4bGLs/6azzWF7x83HRp7/O0ked5fxLEN24p6eCqyu8pfL0XsKqdWiv2e2L7gyzBe6dVVKeT548r0lya0=@vger.kernel.org, AJvYcCWPATFtrxtFn0Mq075CLU8Vjhk3mRhH6us60aT8laifUekR0PoG8c+a4fmflh/ZEXkYbrH2WQW9+i6eTjzh@vger.kernel.org, AJvYcCWeu5yoV8x2Ialnt8ZQ4azUiSRkdOFAqTVhIHnAvyxAAelO9WC8vpi1xiAtmz/0INTb5PA2fNyc@vger.kernel.org, AJvYcCXYyFpDpGPyRQr/qqJKGqdhy8ETj9PwoCxj+o3MTK76Cs1YSm6Vm4pJfR0xTu7/sL67fORorAoMvY3qoMq0@vger.kernel.org, AJvYcCXwYmvMSUkwz37z10TXQV1JTDMeCIQITZSXUwVvKpM8OVb5uO82DVtM70MTmUceA3ZYaZqw3lhIuVWb@vger.kernel.org
X-Gm-Message-State: AOJu0YwIouEuMeN0KGcy2GgmGxmUDRiWrMez/Gzf9w2uIkecQemZFTJ0
	z82jis5JQnLo4is4Mq5mihdG+4cjkV5jiJiVv+ueNIVpclKbdhywy0q8XeUN5rs=
X-Gm-Gg: ASbGncsT7+x4CiXIV2akd/RJwQ2LzRTy0nHSFlBDtSP80Q/TLzC56E3fC6MFn2c2bUc
	Y4842axrbeXRhrqsDJM7/gYaDRK0t5c4jFr++ejcWAuLF+ICZH7135UD6waxq4wQLnfmupi/POH
	HOH5G0jqWdsflZJO4srbi86ArduREBrEbn1NsfHcU49MTBl6JKlbec4DtfzC/2UbXgEdOOwlux9
	IcTBmeLHv8bkp8zqW6vB7PLAi+8TiplQ4vhyjLcPeSXTkS+nRxfQeInGK7C+8TTZTBfl1v2XNdj
	F0kaQyFTbx+r
X-Google-Smtp-Source: AGHT+IE+pjw5J8OCDMAGZEuyAcL74rbOEwKc8VL/2+CUBSPN+EkT698DKtPyKyyXST33D24HsM7PFA==
X-Received: by 2002:a17:906:32c2:b0:aa5:2bfb:2ec5 with SMTP id a640c23a62f3a-aa580edf6f4mr388193766b.5.1732724931360;
        Wed, 27 Nov 2024 08:28:51 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b28f719sm718718166b.12.2024.11.27.08.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 08:28:50 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ced377447bso9486350a12.1;
        Wed, 27 Nov 2024 08:28:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU11r/WqvZLXxubdR9QL6aipC1rG3sug4/d/TGzPi7DOOWTovIRXMDXsX2PahFWkxcqkrvi4XeXLv+u@vger.kernel.org, AJvYcCU5e4JoV3OhNHRZrufuPK5uExxklLsWmOUqP8V7Q51NQtFgxfMvxwr3QG4/U13NtyEFhPXQJD4ej/iLdPvZ@vger.kernel.org, AJvYcCV7KXYFcipGuu9anCdXBeuysaG+faZQBAlUwfzn3fwAsR2+S3cEjYA9X1Nb3qajjPbd2WaIZFsBqDKfaq01sQxH6xc=@vger.kernel.org, AJvYcCWuP0hD89ddKnSAvXioOkdwtI4rr5/FxfF85Ntlc7up5R4Oc0X2R9AG3WAu1QLlzMlW5ffO5mzxyW2h+WlC@vger.kernel.org, AJvYcCX2ly4alxBAgAYg7FTydS91tWz7BkB9EhtVGVIDtWRqKIiywOdLlD9wGv9byBIF497zsCiRVhv49E45@vger.kernel.org, AJvYcCXtx9KFM42ZCRJzDGFy4iKaiS+qg3hdr262Kg72HmKZdqJDDatx20pr/S4+KUKnpqa7YqHd+eD5@vger.kernel.org
X-Received: by 2002:a17:906:4c1:b0:aa5:2f8a:b94f with SMTP id
 a640c23a62f3a-aa581076afbmr296034666b.54.1732724929585; Wed, 27 Nov 2024
 08:28:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106120118.1719888-1-claudiu.beznea.uj@bp.renesas.com> <20241106120118.1719888-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241106120118.1719888-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 17:28:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX57_AEYC_6CbrJn-+B+ivU8oFiXR0FXF7Lrqv5dWZWYA@mail.gmail.com>
Message-ID: <CAMuHMdX57_AEYC_6CbrJn-+B+ivU8oFiXR0FXF7Lrqv5dWZWYA@mail.gmail.com>
Subject: Re: [PATCH 3/9] serial: sh-sci: Clean sci_ports[0] after at earlycon exit
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, p.zabel@pengutronix.de, 
	lethal@linux-sh.org, g.liakhovetski@gmx.de, ysato@users.sourceforge.jp, 
	ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

Thanks for your patch, which is now commit 3791ea69a4858b81 ("serial:
sh-sci: Clean sci_ports[0] after at earlycon exit") in tty/tty-next.

On Wed, Nov 6, 2024 at 1:02=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The early_console_setup() function initializes the sci_ports[0].port with
> an object of type struct uart_port obtained from the object of type
> struct earlycon_device received as argument by the early_console_setup().
>
> It may happen that later, when the rest of the serial ports are probed,
> the serial port that was used as earlycon (e.g., port A) to be mapped to =
a
> different position in sci_ports[] and the slot 0 to be used by a differen=
t
> serial port (e.g., port B), as follows:
>
> sci_ports[0] =3D port A
> sci_ports[X] =3D port B

Haven't you mixed A and B?

> In this case, the new port mapped at index zero will have associated data
> that was used for earlycon.

Oops, do you have a simple reproducer for this?

> In case this happens, after Linux boot, any access to the serial port tha=
t
> maps on sci_ports[0] (port A) will block the serial port that was used as
> earlycon (port B).

Again, A <-> B?

> To fix this, add early_console_exit() that clean the sci_ports[0] at
> earlycon exit time.
>
> Fixes: 0b0cced19ab1 ("serial: sh-sci: Add CONFIG_SERIAL_EARLYCON support"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

This causes a crash (lock-up without any output) when
CONFIG_DEBUG_SPINLOCK=3Dy (e.g. CONFIG_PROVE_LOCKING=3Dy).

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3546,6 +3546,32 @@ sh_early_platform_init_buffer("earlyprintk", &sci_=
driver,
>  #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
>  static struct plat_sci_port port_cfg __initdata;
>
> +static int early_console_exit(struct console *co)
> +{
> +       struct sci_port *sci_port =3D &sci_ports[0];
> +       struct uart_port *port =3D &sci_port->port;
> +       unsigned long flags;
> +       int locked =3D 1;
> +
> +       if (port->sysrq)
> +               locked =3D 0;
> +       else if (oops_in_progress)
> +               locked =3D uart_port_trylock_irqsave(port, &flags);
> +       else
> +               uart_port_lock_irqsave(port, &flags);
> +
> +       /*
> +        * Clean the slot used by earlycon. A new SCI device might
> +        * map to this slot.
> +        */
> +       memset(sci_ports, 0, sizeof(*sci_port));

Nit: I'd rather use "*sci_port" instead of "sci_ports".

> +
> +       if (locked)
> +               uart_port_unlock_irqrestore(port, flags);

"BUG: spinlock bad magic", as you've just cleared the port, including
the spinlock.

I guess we can just remove all locking from this function to fix this?

However, could it happen that the new device taking slot 0 is probed
before the early console is terminated?  In that case, its active
sci_ports[] entry would be cleared when early_console_exit() is called.

Also, what happens if "earlycon keep_bootcon" is passed on the kernel
command line, and the new device takes slot 0?

Thanks!

> +
> +       return 0;
> +}
> +
>  static int __init early_console_setup(struct earlycon_device *device,
>                                       int type)
>  {
> @@ -3562,6 +3588,8 @@ static int __init early_console_setup(struct earlyc=
on_device *device,
>                        SCSCR_RE | SCSCR_TE | port_cfg.scscr);
>
>         device->con->write =3D serial_console_write;
> +       device->con->exit =3D early_console_exit;
> +
>         return 0;
>  }
>  static int __init sci_early_console_setup(struct earlycon_device *device=
,

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

