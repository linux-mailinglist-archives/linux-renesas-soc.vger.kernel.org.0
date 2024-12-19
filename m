Return-Path: <linux-renesas-soc+bounces-11561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA24D9F78C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 10:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E984E7A1D3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 09:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BD7221D9A;
	Thu, 19 Dec 2024 09:46:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3353B22147F;
	Thu, 19 Dec 2024 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734601619; cv=none; b=RKxewt8hNkTaOPElIstmC7YXrG9KVYrIgoiaFobmHRKJo0ojqW0VbNYOKHvTAXSP8/+Ogm/QVj84wEWC8Bvor7wNoBG6th+ld3bGxgZ5EuPu3HhdJnOr9r6Kz6hIlZ0JOSiKfSekEwzNUY6oVGh2tx3HB035GPcSWDMwgvNJyi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734601619; c=relaxed/simple;
	bh=tWz5Bd3aD1b0GWp7x1NbJ6DD76mR5gh7zAMd90ft3iI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHDvH7DIjhaAFOfDYti6KTGBW5OviFQiymY8LwUsh5JqK+M/QFYkaK/1+kVxFcaoqYYTU0MPpEdbjaIaCwMvR9Hw9ETzos2CUULL1QVQDPvq4L3IBjlq6y4CIGtNIdWpQGpBHKeyR893PEJREiJFaMc4gTNTXPrtLE7tYQyis7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5188e0c2b52so179707e0c.1;
        Thu, 19 Dec 2024 01:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734601614; x=1735206414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQkVmKegM8Fg2J5H+MVzwaxCCpxxwBWa8ORq2tqNriM=;
        b=N7crex5RX0D4tKqbzSYOrmDJmpz1uTVRlsB44EqT0CJPAnXwGSK1X7sbvBZZUNQmhi
         cX2/b4Uwt0stXIlOZFP73uobqYPIw15nviKA7/nL4GRNa/7uSaLR5cEy8xnEhVmbYVz3
         N1q5xIDppPFDf09IoArZj2uPEr/n24+sZ9TvVHpD1lpp3rwM96uN5aVavyMF+Ch73g52
         PHsFLKLPB4rUlte5WXRHY6C23hZvTD3hVRZFDfV5VWjin31TOaQ0MoYrxWT1jPXBteoJ
         H9oCPKLUNmtwUpbbBNmuvXY9OCvNJm1UP8nigBRRQm+6FhxIfT1dXiMrFFpr1Fmc8UMi
         cehQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2MWI2swakgpejzQ7H/j8OpKmiZ37jUvgFmxalKIePOny652X/F/RdsngVXiVm/y4UD20SJvdMnQoOJxNC@vger.kernel.org, AJvYcCVEQ3E6hgVNnLJv17hK/fxpq8kpHqj3fSr4CpZy7i89xEywy/rmaRp9GvpDhr+DPvmc6I5dv5k3iWza5lM=@vger.kernel.org, AJvYcCVi7xZj1dxUcpMij25ZZcXc5NDdUt62uF8pabQDjaWviQkHDwXeGoIJvJE/4hGC3ff1z4YhylzLS+12WK1Gf/IYhsc=@vger.kernel.org, AJvYcCVw4VsdWLGgJ0Kvxt0ltbGA4ep6DJLpK1EDbr+cZf7cXqYRFwGJvShpMsRv6AlbqUTabzjztCEM@vger.kernel.org
X-Gm-Message-State: AOJu0YzrAsL8EfBpmJ+MFeM/1SX8U2XJyDQru5A3XC6+J4RBBCF42gEk
	ovGcvdmVdqQ+ZLxy2Uxg4bzcSzpBK7AFPjzphA493fvCVJsPUfUFXm1JavDS
X-Gm-Gg: ASbGncu9Sd5Z2jLUWlaJkd5tv5e/clBgJ9eoWSnuz8Fqd4gMOs/pMD6KcBgvt620gt4
	ARYemdpILhLICvwlYL0NGcA6K1YtM4rm1RNRkwVvWnDXSFCm2hWwzRf+V3eb+6wjO5rDsAn/Ah3
	x3d1ct6Yd8Sme823Mo9soxqepqyDYc1806BofMmd1fHjDJxFdYyM8ABOfNzXbbINZeyvHg+IX8F
	gAhmivTh8q4+bl3I6AO1tEOYJZgdPXcuHTCjOiWCDnX1A6VMXEbDSW17IkKyLUxZVomCwQYmjaF
	mwujDUCJqa7tlzWNKnHIDYI=
X-Google-Smtp-Source: AGHT+IF8Z4HlPXNnZSiZ5jqoj4V3FykB6cPdjovbHxiauMq1l/fzh7MszuTQdVbW3Nc5+ySZWrz7Cw==
X-Received: by 2002:a05:6102:5489:b0:4a3:ab95:9637 with SMTP id ada2fe7eead31-4b2bbddac55mr2387417137.12.1734601614344;
        Thu, 19 Dec 2024 01:46:54 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98be8asm154077137.2.2024.12.19.01.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 01:46:54 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-518a52c8b5aso190933e0c.2;
        Thu, 19 Dec 2024 01:46:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9RmJK+qJpYBDkEyOfsGbNm4zhcMv6YLnrAxHcH/07BLPMVl0flrsrx5jXKCeRzZ2KPhqs75b8@vger.kernel.org, AJvYcCUL+ZGenXWyYEDogYPC1s7c4D2qnGPyUAwcTer0K65Ted5zTgJgS/WNPAWRXQ3fg9+HKXaJ3fHRst7DYYM=@vger.kernel.org, AJvYcCVorndGz854xVq3KBCe21YUsTKmhMk9xjyQW1HZ3jA2qeCHK0iN/5g2xRE+cxWRUgWoWOJOydC9Is4U7OUHLewwaXo=@vger.kernel.org, AJvYcCXcCxtBwkYqX7zQiwIQIySzZfzVL/8NEidGRYX8MA8Vu2mzYjjKiGKvn4fzdNQPbHVBAIJdVJShpQWOlRx3@vger.kernel.org
X-Received: by 2002:a05:6102:c8f:b0:4b2:4836:cd63 with SMTP id
 ada2fe7eead31-4b2bbf4397dmr2868804137.26.1734601613861; Thu, 19 Dec 2024
 01:46:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com> <20241204155806.3781200-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241204155806.3781200-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Dec 2024 10:46:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWv-+gWkH2K0r740BaKLwnTm7RdOTd71DkWMDR0A52qEA@mail.gmail.com>
Message-ID: <CAMuHMdWv-+gWkH2K0r740BaKLwnTm7RdOTd71DkWMDR0A52qEA@mail.gmail.com>
Subject: Re: [PATCH RFT 1/6] serial: sh-sci: Check if TX data was written to
 device in .tx_empty()
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
> On the Renesas RZ/G3S, when doing suspend to RAM, the uart_suspend_port()
> is called. The uart_suspend_port() calls 3 times the
> struct uart_port::ops::tx_empty() before shutting down the port.
>
> According to the documentation, the struct uart_port::ops::tx_empty()
> API tests whether the transmitter FIFO and shifter for the port is
> empty.
>
> The Renesas RZ/G3S SCIFA IP reports the number of data units stored in th=
e
> transmit FIFO through the FDR (FIFO Data Count Register). The data units
> in the FIFOs are written in the shift register and transmitted from there=
.
> The TEND bit in the Serial Status Register reports if the data was
> transmitted from the shift register.
>
> In the previous code, in the tx_empty() API implemented by the sh-sci
> driver, it is considered that the TX is empty if the hardware reports the
> TEND bit set and the number of data units in the FIFO is zero.
>
> According to the HW manual, the TEND bit has the following meaning:
>
> 0: Transmission is in the waiting state or in progress.
> 1: Transmission is completed.
>
> It has been noticed that when opening the serial device w/o using it and
> then switch to a power saving mode, the tx_empty() call in the
> uart_port_suspend() function fails, leading to the "Unable to drain
> transmitter" message being printed on the console. This is because the
> TEND=3D0 if nothing has been transmitted and the FIFOs are empty. As the
> TEND=3D0 has double meaning (waiting state, in progress) we can't
> determined the scenario described above.
>
> Add a software workaround for this. This sets a variable if any data has
> been sent on the serial console (when using PIO) or if the DMA callback h=
as
> been called (meaning something has been transmitted). In the tx_empty()
> API the status of the DMA transaction is also checked and if it is
> completed or in progress the code falls back in checking the hardware
> registers instead of relying on the software variable.
>
> Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch, which is now commit 7cc0e0a43a910524 ("serial:
sh-sci: Check if TX data was written to device in .tx_empty()") in
v6.13-rc3.

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -885,6 +887,7 @@ static void sci_transmit_chars(struct uart_port *port=
)
>                 }
>
>                 sci_serial_out(port, SCxTDR, c);
> +               s->tx_occurred =3D true;

And you cannot use the existing port->icount.tx below, as that is not
reset to zero on sci_startup(), right?

>
>                 port->icount.tx++;

Which brings me to the real reason for replying to this patch:
apparently port->icount.tx is updated only for PIO, not for DMA...

>         } while (--count > 0);

> @@ -2247,6 +2275,7 @@ static int sci_startup(struct uart_port *port)
>
>         dev_dbg(port->dev, "%s(%d)\n", __func__, port->line);
>
> +       s->tx_occurred =3D false;
>         sci_request_dma(port);
>
>         ret =3D sci_request_irq(s);

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

