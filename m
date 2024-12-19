Return-Path: <linux-renesas-soc+bounces-11569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD20D9F7D1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 15:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 926337A42D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 14:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A470622579B;
	Thu, 19 Dec 2024 14:26:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A019A2253EC;
	Thu, 19 Dec 2024 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734618390; cv=none; b=VxJzcQ9LKWwxkFGF1CjAuQX7ygZd4ZizSj8nD6mdsZ0g7Aqu5+717+1B+7qFf28l7CiZsXzwRzhzR5uw96zJKqj8Rl5e/61sD5vWcnuAJZ3Tt4ST5W/HaMy+FCala7ol1mvNzcYx1vcP0+PZ5NYYppbXqcazhSC9KI74cQheMpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734618390; c=relaxed/simple;
	bh=KBJjRI5mqxGcNIeAXKKgF34+8zWjVnIZHAG33K9FR14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSgUGbYKt0vpGDLQK+iPWhFe0G5dni+SlAlNIuimTNpRZpgfdBINHkGq7yc1gDbeTUbBaGKxjB1MzhviMG1RKfEbeqsM/nP/96pHCys0dWKszfmnVgJ/BTDugx3zyiZ9274HHOH3bzvEQZuEnd8dBRJjRM3uGMYNqy13zMp8ajA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85bc5d0509bso191606241.1;
        Thu, 19 Dec 2024 06:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734618386; x=1735223186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KTtGN1r1ChM/7EIlJYs61YaS4BRSkC5X51/XkWLFLs=;
        b=N38getLBJ8kavv+93wmohmchhCnp1Y2OXa+oPM2yjU+i8O8cEZ1w9RADf3ZmTDv55A
         nNf2qir2ky7s2ha1gZOER0MZ4772S028GZHon4apE5qAQHpQ4+GL3kOChyWBaJww+tLX
         u5lLDJzY9g0E1WjGLoRTXbuEmZU/31w76GVI4Ui21Ixa/7YNNakZfpQySGJ2eeAYz/TX
         ksT/BXVe5J98wrkMuWaZOGhkU4IHSHEjXpnd4ymNEtTetx61o6Vo3DUTyFR9HSOGPtNb
         Da46QMKvJFjZBnxghBWhoA/15vV7wAOZO/4/cdvrdzlQufMo0nVOPr4YOfF+sw3ByitL
         yx2g==
X-Forwarded-Encrypted: i=1; AJvYcCVLtplmnodAl959WjMqzvbnvKFfAylWNmazqpNDVGR5ymD0y8RkmymaC41L1rAU9QAs/Vn2WLUVT9zGEerr@vger.kernel.org, AJvYcCVvAkA3t/H0OdA1lacsiltDxqLEKmiXft0bJ5rQjHWuRfegfJc7ljPbQjyLIMtWQsFA7lcqRsrQ44OigVY=@vger.kernel.org, AJvYcCWvs0Ea5w0O+Cq/v5Bm/r6LwUXSFBDXyBv+MTKFWGXEH8emub0OPwC4MjepLp6wjZXJFkF/AbQG9fqVC939Vff3e1c=@vger.kernel.org, AJvYcCXu4kayIXBg+v/cf1Ko++SfyPadeS7x1GqioZnME0YYBLtcL9zfBzARgZPCaKeEfA6cr8PqruAL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+1uvCwltXVSB1YOcFZnxpuKHb0d1+e95r0gE0lQTxAPgrRzqe
	YTly6gfT2DcStKlIfusIhyfZb7MwLVsA5n31rlPjxrcs8qBbjIKvM8F5TN8m
X-Gm-Gg: ASbGnctNmrsnJXKKNm+qKi6+Z+O3yH/14P+l+G4NwQktrM+qkpzL+nASLuDfjrvI3mp
	m3COawGMigxzUAs/HiLPZeX9lEOc5AOYHBXRlZ/pkmCdQnjVL8n9eBpAH2YEoEUD8o73WOuAglS
	b9/YTGdZ4jCnBJWUuILVZQ7V1qeqLwi1NqA7EuK1JykmF/aZj3/kUuZcF2FEwbAlMzLW4sFOsRJ
	NZ903Tp5XZ35dR3/OlyGWNPLQW2OJdQYS/hlJZGVsdi4n04LbS+BHF1pkD7XCvq3gqh7MFAcgA+
	qN+Ax3OP4l33QkwwdGI=
X-Google-Smtp-Source: AGHT+IHsPd4x11IAYFbJ4VodpW/BJ72/P5rdTG/F06adgBn0fXzLoG3/Smls8IpHisR4jgHPRWuW1w==
X-Received: by 2002:a05:6122:3112:b0:516:2833:1b8d with SMTP id 71dfb90a1353d-51b648720b1mr3320918e0c.11.1734618386324;
        Thu, 19 Dec 2024 06:26:26 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac6bfc9sm232612241.16.2024.12.19.06.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 06:26:26 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afde39e360so202660137.0;
        Thu, 19 Dec 2024 06:26:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6IztmtlAjwd0g5CPpgUFG2Qbqq3fInbwzYAISjfJNJmSFZfIS23uc6eE3K97i+mNkOsBUUNTsbwto8fxJpSwwlqA=@vger.kernel.org, AJvYcCUvD7vUF1fCDiTzOC4g4WDATzuOZssX4IOJoXOiUX53J5o5B0PWmWZTk9hgclN5rb8t65jH59zlsqkH3Bpf@vger.kernel.org, AJvYcCVDPkM1FGyHy44iIePDmhV6N3b0QFSuIYoRnX42un1ingvZR+Gsc+qvVO9MqlGQBZeb+sowEbPh@vger.kernel.org, AJvYcCXQAvs8VX+RJ8EBi0+ldKOCxs7MW1QVm0eE0AX8PJczY+em68gyJvIVPZWFxI08Aq6sRiv2/sRtgfmHxlk=@vger.kernel.org
X-Received: by 2002:a05:6102:2d09:b0:4af:ef82:ce8b with SMTP id
 ada2fe7eead31-4b2bbf52e54mr4065877137.26.1734618385637; Thu, 19 Dec 2024
 06:26:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com> <20241204155806.3781200-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241204155806.3781200-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Dec 2024 15:26:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXz8FHRLPOuHPKvjmq2FCidY20MrCmSsq+pK1QUg-fk2A@mail.gmail.com>
Message-ID: <CAMuHMdXz8FHRLPOuHPKvjmq2FCidY20MrCmSsq+pK1QUg-fk2A@mail.gmail.com>
Subject: Re: [PATCH RFT 5/6] serial: sh-sci: Clean sci_ports[0] after at
 earlycon exit
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	lethal@linux-sh.org, g.liakhovetski@gmx.de, groeck@chromium.org, 
	mka@chromium.org, ulrich.hecht+renesas@gmail.com, ysato@users.sourceforge.jp, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Dec 4, 2024 at 4:58=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The early_console_setup() function initializes sci_ports[0].port with an
> object of type struct uart_port obtained from the struct earlycon_device
> passed as an argument to early_console_setup().
>
> Later, during serial port probing, the serial port used as earlycon
> (e.g., port A) might be remapped to a different position in the sci_ports=
[]
> array, and a different serial port (e.g., port B) might be assigned to sl=
ot
> 0. For example:
>
> sci_ports[0] =3D port B
> sci_ports[X] =3D port A
>
> In this scenario, the new port mapped at index zero (port B) retains the
> data associated with the earlycon configuration. Consequently, after the
> Linux boot process, any access to the serial port now mapped to
> sci_ports[0] (port B) will block the original earlycon port (port A).
>
> To address this, introduce an early_console_exit() function to clean up
> sci_ports[0] when earlycon is exited.
>
> To prevent the cleanup of sci_ports[0] while the serial device is still
> being used by earlycon, introduce the struct sci_port::probing flag and
> account for it in early_console_exit().
>
> Fixes: 0b0cced19ab1 ("serial: sh-sci: Add CONFIG_SERIAL_EARLYCON support"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes since the integrated patch:
> - adjust the commit message to address Geert comments at [1]
> - Introduce the struct sci_port::probing flag to prevent the cleanup
>   of sci_ports[0] while the serial device is still being used by earlycon

Thanks for the update!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -159,6 +159,7 @@ struct sci_port {
>         bool autorts;
>         bool tx_occurred;
>         bool earlycon;
> +       bool probing;

This is only used in sci_ports[0], so it can be a single global flag,
instead of a flag embedded in each sci_port structure.

>  };
>
>  #define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
> @@ -3386,7 +3387,8 @@ static struct plat_sci_port *sci_parse_dt(struct pl=
atform_device *pdev,
>  static int sci_probe_single(struct platform_device *dev,
>                                       unsigned int index,
>                                       struct plat_sci_port *p,
> -                                     struct sci_port *sciport)
> +                                     struct sci_port *sciport,
> +                                     struct resource *sci_res)
>  {
>         int ret;
>
> @@ -3433,12 +3435,15 @@ static int sci_probe_single(struct platform_devic=
e *dev,
>                 sciport->port.flags |=3D UPF_HARD_FLOW;
>         }
>
> -       ret =3D uart_add_one_port(&sci_uart_driver, &sciport->port);
> -       if (ret) {
> -               return ret;
> +       if (sci_ports[0].earlycon && sci_ports[0].port.mapbase =3D=3D sci=
_res->start) {
> +               /*
> +                * Skip cleanup up the sci_port[0] in early_console_exit(=
), this

Double up

> +                * port is the same as the earlycon one.
> +                */
> +               sci_ports[0].probing =3D true;
>         }
>
> -       return 0;
> +       return uart_add_one_port(&sci_uart_driver, &sciport->port);
>  }
>
>  static int sci_probe(struct platform_device *dev)
> @@ -3496,7 +3501,7 @@ static int sci_probe(struct platform_device *dev)
>
>         platform_set_drvdata(dev, sp);
>
> -       ret =3D sci_probe_single(dev, dev_id, p, sp);
> +       ret =3D sci_probe_single(dev, dev_id, p, sp, res);
>         if (ret)
>                 return ret;
>
> @@ -3579,6 +3584,20 @@ sh_early_platform_init_buffer("earlyprintk", &sci_=
driver,
>  #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
>  static struct plat_sci_port port_cfg;
>
> +static int early_console_exit(struct console *co)
> +{
> +       struct sci_port *sci_port =3D &sci_ports[0];
> +
> +       /*
> +        * Clean the slot used by earlycon. A new SCI device might
> +        * map to this slot.
> +        */
> +       if (sci_port->earlycon && !sci_port->probing)
> +               memset(sci_port, 0, sizeof(*sci_port));

Aha, so this clears sci_port.earlycon, too (cfr. my comment on
PATCH 4/6). Still, I don't think this is sufficient: shouldn't
sci_port.earlycon be cleared unconditionally?

> +
> +       return 0;
> +}
> +
>  static int __init early_console_setup(struct earlycon_device *device,
>                                       int type)
>  {
> @@ -3596,6 +3615,8 @@ static int __init early_console_setup(struct earlyc=
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


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

