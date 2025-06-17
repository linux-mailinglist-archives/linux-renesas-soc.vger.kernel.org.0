Return-Path: <linux-renesas-soc+bounces-18420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F2EADC538
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 10:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D2FB3B3346
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 08:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC4528FFC6;
	Tue, 17 Jun 2025 08:44:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF45D28FFE1;
	Tue, 17 Jun 2025 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750149873; cv=none; b=fm0tZXzzkqp4+9ISZ2sWXw960aEa327E6gnDjd7XXZcXpJdpvgBzU2KQmIP6pA+GVIFYCiRi9TEEvcsy0uIjSl4HdjOXail+A4eLOd6ceyZXYcWbswoaKCJTiKQ1jWJCrwP29RelJ3lxMwkpiBW4ItNiJjNDGK1cDjDPMqBGxeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750149873; c=relaxed/simple;
	bh=EMaZW0W6NTuCn8tFaeSafgDTZ6GVDT5IJeOSEngyzIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FC9RUxL2DadSO9D3rU5T8z3u/NcwKJ/h8otpigCvDMMSsNcEFQJKrJfdQVyK5hUZjcyYHMdXcQsJFLrFjF3rrbjUmJrnQ4N2vm9JGQoenxsz91eoMEkEaxNYt15bCO9gPzdrsHa3jNddC/Drxdk20Uk+dUnYjg4egFDGIq11Q7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87f1bd2229aso547479241.0;
        Tue, 17 Jun 2025 01:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750149869; x=1750754669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIpxA99mr6qgUAtAVkjCW/9Y2TY9goKEtR/+Z0STSCw=;
        b=Gezgqh4h3u8vxn4bHL+2WB1tvXAPhjqxmE/Obwu29gpU+r8xsfu5b2HaXw8ysBZ/H2
         zfcqJ/tG+WR4PhuHzChrpU5zFJTtIpk/4Jan/4EGugJsfaIvlZxyyFMXg82m5iLYBB96
         A9qMr5ckH8oog+3/vVXML4cjlVEX46TryBGhiXkODfhoi2GdK41DgRhON/Z7WwbbZ/8F
         jKAFuLtGVw/xNNgYWKIkZtWDhzXO2bT+t+B1xebk8kaSdFvZIA5bAL8EPDIwxkOdXVlE
         tcmE8OYQut5TYO2Tkj23bfCAbvWl4Bu8KdvkRVAzVH6rmc7KUHS5CXLq9wwDI3rh21QN
         7z9w==
X-Forwarded-Encrypted: i=1; AJvYcCU7NSffZT0H4cWUPfW1SJhNslDrUhR00XzoQQqL3V3ifMid92cLPURIY7Zu5808QD9zUy8MAa2b2nwtw4JJ@vger.kernel.org, AJvYcCV1xlpxtfQc9B6s8e5OdPNIhx9BwnaX4H6p+Kbi6ODwAAp2Q7MS+VyggOwjq1Z0Nb2kgbhONvbhJ/g3BXUr@vger.kernel.org, AJvYcCVYSMvmaYjxC8dIUpa/70YcmhqJTWStFQg5vqhqaIELCv1Bar1We6JwBP9KBtSQ0hACl9YK5nhqO6RqIJzTKJ2DmgU=@vger.kernel.org, AJvYcCXa373lfYmDdrNJ4ADz0NAkA5uQIXj6VoV1IuATe8EaLC7LT7JjGVXPg/xw9eFtbwYVMqJ25itumVAr@vger.kernel.org
X-Gm-Message-State: AOJu0YzPig2Z5PMQqK7Cga0F3h5Qfca6UIwYoWw1K/A/YBT1tIExtnFZ
	Y6fw3Io1U1EygFdC+3Otws54FBMHcpvAii50KqdnBlhHbJCB4s14Pr+Hn0B9dPGS
X-Gm-Gg: ASbGncuuFOwvKotT+6TzIaR7rHErz2frQ7FF3xdD6xLW5832TxEOtoFlAajGo04VEDY
	1gwwjLL7Gu+g/s1CzwBlAol8P7ybOjf8Vsi31v5YWTDa0I0p0smXMKjkc3SV02GzYHZ4ZBuuYpU
	M9GujpgC1QxAP2+pRcrRlTd4CKMnGmFFQ0ngl3ysRLsDyk3FxJPZc9wwUQWfI05FDNT+RKAPZQ4
	faTgCW7WTIBnzBprRylZQCqPyoxux/zobYxgpKKJo1lCIYpkCdWvth5Q9SwTNpYtERMIjhKzPkr
	2IKlfh/wLslv+PHldcIZmOmA16U0ZNPS4fjvuD5wfHHLITUg1XQ9ixAgHfFWtD6wlny11AYtjTN
	O3AtRuqUvD0wcEPVaU47XWRlX
X-Google-Smtp-Source: AGHT+IGkzaQczw5HupLSBSC9OG58i3xOsAJR2nM/rhptgXTUii39REDpddFugyuat8Ca+EXMbd2xPw==
X-Received: by 2002:a05:6102:8359:b0:4e9:8f71:bd6e with SMTP id ada2fe7eead31-4e98f71bfe3mr41701137.0.1750149868593;
        Tue, 17 Jun 2025 01:44:28 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f21ab5768sm1107859241.10.2025.06.17.01.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 01:44:28 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87f1bd2229aso547466241.0;
        Tue, 17 Jun 2025 01:44:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLLPpg6cY7Nvmzi1gnwmmbMtvrypuTX2RWHOAKv2HCLgfS0QDxbfebsMbkD56Oy2cPUcFyY4HTxBSv0NAd@vger.kernel.org, AJvYcCW8M+TKKDHgubmG0a9+sRSvtLeOEb2aUmT+UX74syO9S/uNoNvFcS0JztcTdJV+J1PjHepgcNBNGTEeieG3r5pOMKc=@vger.kernel.org, AJvYcCWGS1sav0xl0j0gYXgaWk6u/FmGektBKAcGYECXYNjByukMqUezGiMHYn6MQ7AN3oRudroqtWjUTTkf@vger.kernel.org, AJvYcCWvEsKjaHLQGBIlpQw1Gijr+W1BjqM/CbE0oMkwGwwXfFG6xH3H+XiDJ+lDu8HFOmNtCZe7wChy5CQi6P3s@vger.kernel.org
X-Received: by 2002:a05:6102:26c2:b0:4e2:ecd8:a1f with SMTP id
 ada2fe7eead31-4e7f6186014mr6831759137.1.1750149867998; Tue, 17 Jun 2025
 01:44:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616213927.475921-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250616213927.475921-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250616213927.475921-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 10:44:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUU-EyU3DgqP9KDmeT_A4i-xaE9hAUOvYFQcbYmpJc2ng@mail.gmail.com>
X-Gm-Features: AX0GCFu96slHpR78sWUkf3MntdiwPRfZq6OEEltMiCRMN1dl7oBZu7rvTpsJ3sE
Message-ID: <CAMuHMdUU-EyU3DgqP9KDmeT_A4i-xaE9hAUOvYFQcbYmpJc2ng@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] tty: serial: sh-sci: Use port ops callbacks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 16 Jun 2025 at 23:39, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Replace direct calls to internal helpers such as sci_stop_tx(),
> sci_start_tx(), sci_stop_rx(), sci_set_mctrl(), sci_enable_ms(), and
> sci_request_port() with their corresponding port ops callbacks.
>
> This change improves consistency and abstraction across the driver and
> prepares the codebase for adding support for the RSCI driver on the
> Renesas RZ/T2H SoC, which heavily reuses the existing SCI driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

I am a bit reluctant to increase the number of indirect calls in a
driver that is also used on (old and slow) SH systems...

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -880,7 +880,7 @@ static void sci_transmit_chars(struct uart_port *port)
>                         sci_serial_out(port, SCSCR, ctrl);
>                 }
>
> -               sci_stop_tx(port);
> +               s->port.ops->stop_tx(port);

RSCI has its own implementation of sci_port_ops.transmit_chars(), so
I think it is better to avoid the overhead of an indirect call, and keep
calling sci_stop_tx() directly.

         }
>  }
>
> @@ -1497,7 +1497,7 @@ static void sci_dma_tx_work_fn(struct work_struct *work)
>  switch_to_pio:
>         uart_port_lock_irqsave(port, &flags);
>         s->chan_tx = NULL;
> -       sci_start_tx(port);
> +       s->port.ops->start_tx(port);

This function is indeed shared by sh-sci and rsci, but still unused
by the latter as it does not support DMA yet.

>         uart_port_unlock_irqrestore(port, flags);
>         return;
>  }
> @@ -2289,8 +2289,8 @@ void sci_shutdown(struct uart_port *port)
>         mctrl_gpio_disable_ms_sync(to_sci_port(port)->gpios);
>
>         uart_port_lock_irqsave(port, &flags);
> -       sci_stop_rx(port);
> -       sci_stop_tx(port);
> +       s->port.ops->stop_rx(port);
> +       s->port.ops->stop_tx(port);

OK.

>         s->ops->shutdown_complete(port);
>         uart_port_unlock_irqrestore(port, flags);
>
> @@ -2684,7 +2684,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
>         }
>         if (port->flags & UPF_HARD_FLOW) {
>                 /* Refresh (Auto) RTS */
> -               sci_set_mctrl(port, port->mctrl);
> +               s->port.ops->set_mctrl(port, port->mctrl);

RSCI has its own implementation of uart_ops.set_termios(), so please
keep the direct call.

>         }
>
>         /*
> @@ -2721,7 +2721,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
>         sci_port_disable(s);
>
>         if (UART_ENABLE_MS(port, termios->c_cflag))
> -               sci_enable_ms(port);
> +               s->port.ops->enable_ms(port);

Likewise.
And once RSCI fully implements uart_ops.set_termios(), I think
it can just reuse sci_enable_ms().

>  }
>
>  void sci_pm(struct uart_port *port, unsigned int state,
> @@ -2827,7 +2827,7 @@ void sci_config_port(struct uart_port *port, int flags)
>                 struct sci_port *sport = to_sci_port(port);
>
>                 port->type = sport->cfg->type;
> -               sci_request_port(port);
> +               sport->port.ops->request_port(port);

Both sh-sci and rsci use sci_request_port() as their
uart_ops.request_port() callbacks, so please use a direct call.

>         }
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

