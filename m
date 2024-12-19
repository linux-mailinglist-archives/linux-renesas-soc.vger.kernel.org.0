Return-Path: <linux-renesas-soc+bounces-11570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0C9F7D2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 15:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E9251664D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 14:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0C386343;
	Thu, 19 Dec 2024 14:31:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819CE17C;
	Thu, 19 Dec 2024 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734618673; cv=none; b=kcyQAeOgzOHej9FwrQ05FHeVQWW7c1scZKeAamf6qJB64AF7d7qJOvQJHRilLmPyxESYm2LYCufQ68PJJipoDYVT372EKi3CHloQJL0inKKmmslM0H4eAwsxiBqInk57y9sDAZKDqrkrxJGo0Xq6X2z2z8Mo8kh0v+W03Y6CTjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734618673; c=relaxed/simple;
	bh=O3c1HDGlffaugxMLDkaiaAUvcRObTVM0/ZxRcXgZbJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4eRCPn1NmPdfrlERzaqZYeMOc4La/TRsHkSslwpAEVQwOuhDHobCNySga8fZfYVgyFWrft1Z7AZi9zeAceCAitwcAiR4rIdh3Qu0OpaBhqbVRjXSEurwjGnDhTVnMsi9GU9o8MRBMhFyLItDD5LQvJkJDmIb+vHKVjgA6J3TVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4678cce3d60so7240961cf.2;
        Thu, 19 Dec 2024 06:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734618669; x=1735223469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Slw4YP8lL80cmcS0c5L4jvkuQ269ay/GSYhL7053lKA=;
        b=OTwD8QKClNTz0gOGWrzt+kgj3cI0qxB6jTMTn0XGeqnoOSTaxLRJvsAP1yS3ttkyLC
         dM0aEVRcHZsgNqFqmvWIGFo9mZuwuYE99/uhXcYbWkNMXT9EKb1EJTR7W0UGVOiGwhWo
         dD7/4tdatgXXNxqf2DDac0VnlQutTER9P0froXvYC6N4zE9UzqnPPppi+eb76jORVe19
         fXcjzEoTk0eAut7BhkRVb0yeq11OfJxt+M7UVn4s6PsGE4Pcpl5nhE3U0Zl7f5qpay2I
         uxqhPe3iO2ephqo4NGKSlGiaL2ApA7nqb4mdyN9v/OGRVJDFZg/hk8x62C9rDw+GKCGM
         wk2A==
X-Forwarded-Encrypted: i=1; AJvYcCVM8Jjq1SCi6wNm1h8dk0B7eQP2FeHWYgwuLYh/mB0ErVihMp/XUTYP0z5kMpiE4U02+wBr4oRIJFPc7s4=@vger.kernel.org, AJvYcCVpb8XykFdMtKyM6tmhVcADjKC32Wza9B7YMinDVPF19nVRF3JLRFf/jnKzdpn4k85XXsz57CgV@vger.kernel.org, AJvYcCXSVhR9r65v6RfPnctOwCbUysLAdCY89bmdN8q6tgxbdJh62hEZaLX4gcgrDd6wFX35O0Zmer7YWxi1x0Ex/l8SNP0=@vger.kernel.org, AJvYcCXTkw2vDEXdxX58uk9wOLStlFzuiqm2HZP+GMPNkRZfzV3wAJo4C42PzPlwnnyxj485tqes2wL2iyIbNzW8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy30H9+ywXZzY8KS8YnzOCqA1KkqpcHaFy+Z9b/0XKswsceGv9N
	VXE4uUNnLfbRX3bsnYQJGv5AHn11IyFbDoXKtP5aRfd4u7VGr6CqwO0WLNZN
X-Gm-Gg: ASbGncsFEDvaNIFpISfUnA5HMKQxKDnwBMMwYpQlvp9TmiRLa4HUU1PG/m/1Bkxe4sc
	CV+XEf98H/H12p9M8VJrhJRWRFRQtJgPCJoFo7n5H1eLiszuIVnSGIGoIZql485MOzUKmIN6EOm
	T0bQZ8rPskoiOcqcIEjq77DqNd/fGMSlegzsW/wTtBbCzIBmSVl+zWJdQbR3Qdp4Ry5OGUXW0jO
	Q+ytuPYIOPYqok/pRDIkEuqK6IO0alQc+sBU35iazXja9Ic74RnfcCrmP3TO1l5W4u/6pfeXnMq
	+dITgQ/Ib0cTkbniXEs=
X-Google-Smtp-Source: AGHT+IHIsEhdoz04sxZbwPALVDW9Fif99Pnk1jRBPbhg4gSwUpvRo2PLusqOd2I5PlP+4mrbRBEIyQ==
X-Received: by 2002:ac8:5802:0:b0:467:5367:7d09 with SMTP id d75a77b69052e-46908de2502mr99818831cf.16.1734618669298;
        Thu, 19 Dec 2024 06:31:09 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb2c81dsm6471591cf.84.2024.12.19.06.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 06:31:08 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6dd0d09215aso6810676d6.2;
        Thu, 19 Dec 2024 06:31:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsDCXSxSfLx+XhL638+EH3nvpp2THUxfJtDVM1lJ+gjH7RSTy8oSSf60288r1cmnlxWlQGBY76@vger.kernel.org, AJvYcCWLZ1s5bvdyIovHWdLznoseg+yRWST3YHh8e6MW8qxpIM6PmLU4Z/ewFFMjLRNJA3E3pjAEH912VXrYS8g=@vger.kernel.org, AJvYcCWRhfevNJTo+A+ktnYm8u8QRFR/CDHx4f60JQ0eiQmTmqVz+GGKe2tFYgjzvatuDLLIbT49H0AqEbJfznmd@vger.kernel.org, AJvYcCWsKsNO0oeRaz/u1rn4ZeWeTWvlgy4+HvhaZL7ZGOYE9w0eZupjZm2bhdydY2hvYQZvT6yiFve+H83x6OdSTOh0y8I=@vger.kernel.org
X-Received: by 2002:a05:6214:5284:b0:6cb:d4e6:2507 with SMTP id
 6a1803df08f44-6dd091ceacbmr109855286d6.22.1734618668621; Thu, 19 Dec 2024
 06:31:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com> <20241204155806.3781200-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241204155806.3781200-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Dec 2024 15:30:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWB2q7=gkHUsmVWwZMCWaj-htUpOQCr24y5HsbQvM+HMA@mail.gmail.com>
Message-ID: <CAMuHMdWB2q7=gkHUsmVWwZMCWaj-htUpOQCr24y5HsbQvM+HMA@mail.gmail.com>
Subject: Re: [PATCH RFT 6/6] serial: sh-sci: Increment the runtime usage
 counter for the earlycon device
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
> In the sh-sci driver, serial ports are mapped to the sci_ports[] array,
> with earlycon mapped at index zero.
>
> The uart_add_one_port() function eventually calls __device_attach(),
> which, in turn, calls pm_request_idle(). The identified code path is as
> follows:
>
> uart_add_one_port() ->
>   serial_ctrl_register_port() ->
>     serial_core_register_port() ->
>       serial_core_port_device_add() ->
>         serial_base_port_add() ->
>           device_add() ->
>             bus_probe_device() ->
>               device_initial_probe() ->
>                 __device_attach() ->
>                   // ...
>                   if (dev->p->dead) {
>                     // ...
>                   } else if (dev->driver) {
>                     // ...
>                   } else {
>                     // ...
>                     pm_request_idle(dev);
>                     // ...
>                   }
>
> The earlycon device clocks are enabled by the bootloader. However, the
> pm_request_idle() call in __device_attach() disables the SCI port clocks
> while earlycon is still active.
>
> The earlycon write function, serial_console_write(), calls
> sci_poll_put_char() via serial_console_putchar(). If the SCI port clocks
> are disabled, writing to earlycon may sometimes cause the SR.TDFE bit to
> remain unset indefinitely, causing the while loop in sci_poll_put_char()
> to never exit. On single-core SoCs, this can result in the system being
> blocked during boot when this issue occurs.
>
> To resolve this, increment the runtime PM usage counter for the earlycon
> SCI device before registering the UART port.
>
> Fixes: 0b0cced19ab1 ("serial: sh-sci: Add CONFIG_SERIAL_EARLYCON support"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3435,7 +3435,24 @@ static int sci_probe_single(struct platform_device=
 *dev,
>                 sciport->port.flags |=3D UPF_HARD_FLOW;
>         }
>
> +       /*
> +        * In case:
> +        * - this is the earlycon port (mapped on index 0 in sci_ports[])=
 and
> +        * - it now maps to an alias other than zero and
> +        * - the earlycon is still alive (e.g., "earlycon keep_bootcon" i=
s
> +        *   available in bootargs)
> +        *
> +        * we need to avoid disabling clocks and PM domains through the r=
untime
> +        * PM APIs called in __device_attach(). For this, increment the r=
untime
> +        * PM reference counter (the clocks and PM domains were already e=
nabled
> +        * by the bootloader). Otherwise the earlycon may access the HW w=
hen it
> +        * has no clocks enabled leading to failures (infinite loop in
> +        * sci_poll_put_char()).
> +        */
> +
>         if (sci_ports[0].earlycon && sci_ports[0].port.mapbase =3D=3D sci=
_res->start) {

Now there are two tests for mapbase: here and in sci_probe()...

> +               pm_runtime_get_noresume(&dev->dev);
> +
>                 /*
>                  * Skip cleanup up the sci_port[0] in early_console_exit(=
), this
>                  * port is the same as the earlycon one.

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

