Return-Path: <linux-renesas-soc+bounces-18440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B93FBADC9EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 13:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8FD6188A02A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 11:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB702DF3EA;
	Tue, 17 Jun 2025 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4mcFmG7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3E5230D0E;
	Tue, 17 Jun 2025 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160984; cv=none; b=MqH6+EE0atkLXpUYJBsx3zyYDs0+IJgOgGKjyLrx5sMzLY2JTepEaAVnJW65sovx3NQ/L2BuTvbjQ13I4UqAERpVFo1MiIzAqqoe7R54gU1SQtKFQMfvU/jxRm+7ZEwDdQyshAfA+vuKPxnMgHddlltqwZkw056FTBK6l8VADWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160984; c=relaxed/simple;
	bh=+3jejbzi/UX8Ec0mhpgozWv+X0A0PGWADEU6Rnouo9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWgv7DjJY50J0NoV0fhMuc5csGr+RCapCzUFwgABrKfskP1sWZnvEroudJfNPbDqGpVbRKt61+jE1zwKo9Qux+EK0WyuYGkCheRt67AKC60apPjCl9ZNWg6SdO2Zq5slbM5tsum3D0DBvDmJVDVP9/7tsAZWVP9rGRCrkGAe4s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4mcFmG7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso5444839f8f.1;
        Tue, 17 Jun 2025 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750160980; x=1750765780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4P5jqw3g9OutfxFCvzVYfN1sp9bg/IIyWYucQYRsIF4=;
        b=D4mcFmG73woELy5dBVZotyntrkPaq33azwc+MjirdCMeocK5cUCzGRwiQXAfUpnusv
         TOihNF83QW2C3FhYal7FG4YStPasr6m1mxNPs4mkUjS4+BfSjMSyb9o+8UG3Z+PbIWh/
         FvXlh/5hhIwu1fjNBcK8PI9lrxrSFB6Oa0JLq7Cggn0fsAdZnhuWk6nlCu+RJCAZ1mDQ
         4hR2Ip+FJWR00T9CrcFUlD6YUwfSEGXASfRlaIfcqlff3IxicZNQmjAXfVI2bajlZVkP
         3m+klCGOuzp4nNz0Uh4jVUzOksFSxhJpg3JoFOSwQzivubyYLC9n1UIsRPH+PsXLCFqL
         1MrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750160980; x=1750765780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4P5jqw3g9OutfxFCvzVYfN1sp9bg/IIyWYucQYRsIF4=;
        b=VNCV7Ve+Cbu6iLG9f6q9mHaKIeRo1QHaSHxfH1gF165PfXn7b9uXlthLntcMwQDSoO
         jR6YJvaWeOUIHPP8mXxr3Hon7kPhRYJP5rTC6SAsLFjYpOeSJv+KdeTBj/iaDkGGmcaq
         r0Ow624rRMb8fe9vn0Na2OAPNOTvXnafdmRr5cVYt0DW9APl0VVnc2q0CjDEVObllyIV
         BU0pgeUTMeM5c3QWIKgQmK20OpJG268rJPNpV++A7l3DN+okvf585/R9Y1EjZkl9/N+a
         NSZApLgF+DeBA7UtSke36EI050TZZ2G9VYZbnUv9ACkdQPHebezzY2/vDsrLbY2gjRJq
         +4jA==
X-Forwarded-Encrypted: i=1; AJvYcCU14rJN3tvMpF2H51LJR0Hxtc00k9CUm79pdPxqva+xV820x+G+xCjag9jxuQMYuv0KL/gthlIgL2DtLz9m@vger.kernel.org, AJvYcCVJ8cu1Duu9U24Qos5+Nyy5aXIrf2PXEAX8kTc5pXi76ft37M1iC9Wrv8aGMaDDKHv76B8Hu4oqf2fL@vger.kernel.org, AJvYcCWC6L9zk6NX7MSQu+Tn+VvYRem1UQdlHCe3nSXqXm4haPwdCg/sG7uCeoFY1PtzV2+W7K5fo2jiDCoMI2D/@vger.kernel.org, AJvYcCWlwObHDajH+SkZ9xbbpH8Y15bQWIpsHj6omiS/qKsTkoXqK7jmToOV0rtojlJOUXMqYDc3++UocNF8kf5k47Nu2tc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd02GfQMna1YKd+5o7bxUdcqKdmzvCtz81kZQkt7ld8NboGXtM
	t5C78tGDQoSPpkiX3zKq6NFiYN/bCAQxmgpLyZNSI0frEsRs3690xnPUA6uZJooeF1GMFLwLt33
	KZ2Fwnsh2vbs4vXit9u/5m4TdgitO3Fw=
X-Gm-Gg: ASbGnctBtY4wDRrUmW1162Vv4KNE6mkpb6qSeV/jLMt2D1kTbrcNb317YhLKxc5ia7+
	n9ADb+hkWbtPi89MrO5EdMlHKKCm4bcF4UQ5LmOI3nWqeCJxsRLRM2RjCCtiBMWXmUoxWjmblEN
	aR7wq70nKlG1IemC0yFegzgBEJiZuoQ3tmsJr4r4wzXufbuSk/CP8L
X-Google-Smtp-Source: AGHT+IFMnnYZ+pjG8+JWodgW3GrzWG4MhQiRhrETarsYLmq9cfGpEPPF0Mh3Xvd3g+xLkZ9TaXSss0j55wQ46l7D4bQ=
X-Received: by 2002:a05:6000:2c12:b0:3a4:e68e:d33c with SMTP id
 ffacd0b85a97d-3a572e2dcafmr10806198f8f.47.1750160979760; Tue, 17 Jun 2025
 04:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616213927.475921-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250616213927.475921-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUU-EyU3DgqP9KDmeT_A4i-xaE9hAUOvYFQcbYmpJc2ng@mail.gmail.com>
In-Reply-To: <CAMuHMdUU-EyU3DgqP9KDmeT_A4i-xaE9hAUOvYFQcbYmpJc2ng@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 17 Jun 2025 12:49:13 +0100
X-Gm-Features: AX0GCFt57kGEIA-PKHbNLObdyw93QsTMKg_5oT9XHkfnEChXyzD9lLoEbnOPV-Q
Message-ID: <CA+V-a8vnOY-aA+kfJgDabJG-g3PLS8Y8TBiudzJmJN46Yz8BZQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] tty: serial: sh-sci: Use port ops callbacks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Jun 17, 2025 at 9:44=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 16 Jun 2025 at 23:39, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Replace direct calls to internal helpers such as sci_stop_tx(),
> > sci_start_tx(), sci_stop_rx(), sci_set_mctrl(), sci_enable_ms(), and
> > sci_request_port() with their corresponding port ops callbacks.
> >
> > This change improves consistency and abstraction across the driver and
> > prepares the codebase for adding support for the RSCI driver on the
> > Renesas RZ/T2H SoC, which heavily reuses the existing SCI driver.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> I am a bit reluctant to increase the number of indirect calls in a
> driver that is also used on (old and slow) SH systems...
>
Ok, I will do that. My initial thought was just to replace the direct
calls where it's shared, But for consistency I replaced them all.

> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -880,7 +880,7 @@ static void sci_transmit_chars(struct uart_port *po=
rt)
> >                         sci_serial_out(port, SCSCR, ctrl);
> >                 }
> >
> > -               sci_stop_tx(port);
> > +               s->port.ops->stop_tx(port);
>
> RSCI has its own implementation of sci_port_ops.transmit_chars(), so
> I think it is better to avoid the overhead of an indirect call, and keep
> calling sci_stop_tx() directly.
>
Ok, I will drop this change.

>          }
> >  }
> >
> > @@ -1497,7 +1497,7 @@ static void sci_dma_tx_work_fn(struct work_struct=
 *work)
> >  switch_to_pio:
> >         uart_port_lock_irqsave(port, &flags);
> >         s->chan_tx =3D NULL;
> > -       sci_start_tx(port);
> > +       s->port.ops->start_tx(port);
>
> This function is indeed shared by sh-sci and rsci, but still unused
> by the latter as it does not support DMA yet.
>
Ok, I will drop this change.

> >         uart_port_unlock_irqrestore(port, flags);
> >         return;
> >  }
> > @@ -2289,8 +2289,8 @@ void sci_shutdown(struct uart_port *port)
> >         mctrl_gpio_disable_ms_sync(to_sci_port(port)->gpios);
> >
> >         uart_port_lock_irqsave(port, &flags);
> > -       sci_stop_rx(port);
> > -       sci_stop_tx(port);
> > +       s->port.ops->stop_rx(port);
> > +       s->port.ops->stop_tx(port);
>
> OK.
>
> >         s->ops->shutdown_complete(port);
> >         uart_port_unlock_irqrestore(port, flags);
> >
> > @@ -2684,7 +2684,7 @@ static void sci_set_termios(struct uart_port *por=
t, struct ktermios *termios,
> >         }
> >         if (port->flags & UPF_HARD_FLOW) {
> >                 /* Refresh (Auto) RTS */
> > -               sci_set_mctrl(port, port->mctrl);
> > +               s->port.ops->set_mctrl(port, port->mctrl);
>
> RSCI has its own implementation of uart_ops.set_termios(), so please
> keep the direct call.
>
Ok, I will drop this change.

> >         }
> >
> >         /*
> > @@ -2721,7 +2721,7 @@ static void sci_set_termios(struct uart_port *por=
t, struct ktermios *termios,
> >         sci_port_disable(s);
> >
> >         if (UART_ENABLE_MS(port, termios->c_cflag))
> > -               sci_enable_ms(port);
> > +               s->port.ops->enable_ms(port);
>
> Likewise.
> And once RSCI fully implements uart_ops.set_termios(), I think
> it can just reuse sci_enable_ms().
>
Ok, I will drop this change.

> >  }
> >
> >  void sci_pm(struct uart_port *port, unsigned int state,
> > @@ -2827,7 +2827,7 @@ void sci_config_port(struct uart_port *port, int =
flags)
> >                 struct sci_port *sport =3D to_sci_port(port);
> >
> >                 port->type =3D sport->cfg->type;
> > -               sci_request_port(port);
> > +               sport->port.ops->request_port(port);
>
> Both sh-sci and rsci use sci_request_port() as their
> uart_ops.request_port() callbacks, so please use a direct call.
>
Ok, I will drop this change.

Cheers,
Prabhakar

