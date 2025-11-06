Return-Path: <linux-renesas-soc+bounces-24273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7854AC3CAF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 18:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47692189CF5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 17:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3189322128D;
	Thu,  6 Nov 2025 17:02:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F66B33342D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 17:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762448563; cv=none; b=BZSf2bBjx080EleOzHKiqQOm70Vrj/MD7cSx/TmdBxOHThHvpjTRgT7qh1V3sfhAuGBrMOiQCatchZKOTJtVc/qNrvOeSKP/tBG+syjlFyYJGG9AuJZch6etfh+X0KVnttZkIH6OXw/S60W8ptKHIyFCqMd1KB10e54Lk+WOnwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762448563; c=relaxed/simple;
	bh=Sz5yZDvrAqDWQ73BgqCKc6pgb4Y+o2NR2xbEM89iVfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTUAGnHxT6usyX+Cczhok1vMlrsqvUXgSK1SUTDRPTsjzskQ0FdgfzEjSfm5DPqKnbQxnja/XFHyrJzSHGhFWWalyZ5XyhXMUKApmeqszleAT+483oSb1rWJnJD3Sbusq+qDOMoFzWmCPc5o7gJI5woU2jMcXdL1Gr6gOogYw2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so1841160a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 09:02:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448555; x=1763053355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HaYqdPsMXwfHzpR9yoIkvINZrh5vn/MQcKn5Y6oG5U=;
        b=vz/hakcIvFulYq5mRTYxhY08yvYdHx+tEHcMh10cwnYhY3yKFFDMnfYXi5vhWL8iy1
         QrjLlNkNkbGG+KJ0EjPMMHoj5YRWMWLlZvkxpZu7CmEHGTssIAaEPulVOD+WUhz1s4mx
         Dopp49Ftjl7zO8TlAAsUjC369aSKaI8UernQ7VDhUsD6wmRhpQR7gYolvYz+6OmpQniK
         03w80gBxihXTNdT6ph+8XqUezAwYZ/OiNoul1fOYhUoSFOQFFlFQQTIKTvAMqUzN22i5
         ylzkskJJO6YXLNNyhM5XtzkwN30Br1jJzJb5olC2/aOEWFMDQPCtnBx1mWg9JOoXXfOF
         eQ6g==
X-Forwarded-Encrypted: i=1; AJvYcCVkaB85Whp/qztt6L7F6pEoGTPmJXY7vnmAEf5xUhTvynYp6f7CqDBM2iYXoTyBKtPm5sS+D3WCbCGWhmWh8gJFNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw3+R3TyAoHeNQEKxQ9TVEthPBK9fVXf2vz5ZJ4t3ZxIgwF/4W
	X8iaAfN7gMtjR8PJsE/Fo1v/L5KnAL2kOnwXLUMoHYBuy7lrmddFYeNmL4pxb5iQZIs=
X-Gm-Gg: ASbGncuJP2iZBHIGkRSzYayEFnGV04AGo7UI6jPFYvWnFzYkbS4OV7lhd7T93FaLnxn
	k0WEsQgWEib85sAaexvpgcA63JKlLk3PHGYK1jl0kRc6Ic9rlHMZ0I38A5xvDGhP3y7T4lFYUMD
	+YNtBNWe4w8NkFKKcwnR2O77XELTp+cRnMPzelJBrWWzAjYyS+tHc28B91azH8lfO1F97hDXi0n
	zxSC9tzCKuBY/chIh/jI1DZzWzN358XuKvFF3vXwzbS8Jt9qhO/6DSbvaOxaNM8mm8SneqOT2+5
	2X7Y1uCjA8pAXMY3k3yZnthhQxEXYYWFZw+D6S4jCzQ4v2BtgqqC2nYFr/YabOUSw6jGjZ7uSsu
	olY9bV8ToAROGJJ7yg4DnTSS9KhPe8YcAT83MhlxBVCluhttLq0brkZEKscPd0cnlSU+8156HZ+
	pk89RausX1qqk1Pu07WtUMIa3t3CE1uE1gVr5ThuWhRX4c6DpEJw4hUujuSIc=
X-Google-Smtp-Source: AGHT+IEoVy9zeiCkR6+/AyNFfYJaZ/G+HpHD8IKAKLPTNSIarjN6mkPEykOqFGF6Tb+kN5crpEGugg==
X-Received: by 2002:a05:6402:2110:b0:640:a836:eaca with SMTP id 4fb4d7f45d1cf-6413e438102mr137698a12.0.1762448555109;
        Thu, 06 Nov 2025 09:02:35 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f86ea13sm2298177a12.37.2025.11.06.09.02.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 09:02:34 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640b4a52950so1790156a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 09:02:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLJOMGhOSzuPnbouScS+v1XDgEO/w8MxM1iqMwp58vC9f7k3ZaGEmU3Y/TI8OdroM3uf6Q3pUR1vQAIlg3VGfhUA==@vger.kernel.org
X-Received: by 2002:a05:6402:5214:b0:637:dfb1:33a8 with SMTP id
 4fb4d7f45d1cf-6413eec4a2cmr109416a12.3.1762448553296; Thu, 06 Nov 2025
 09:02:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923154707.1089900-1-cosmin-gabriel.tanislav.xa@renesas.com> <CAMuHMdWRCGYLRK_WBmbB0cRP7PHiGPSi3U1jdWSVKaTSweruUw@mail.gmail.com>
In-Reply-To: <CAMuHMdWRCGYLRK_WBmbB0cRP7PHiGPSi3U1jdWSVKaTSweruUw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 18:02:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXb0hPPR9feTVrHDvyzEbiOEG7Vy5ec_bnwdXTZ=9Cg8Q@mail.gmail.com>
X-Gm-Features: AWmQ_blWAJjuL3S2mf-_klybP6MpuG6h9woX8spkwghV9sy5gQZ33dOTZbj4xGI
Message-ID: <CAMuHMdXb0hPPR9feTVrHDvyzEbiOEG7Vy5ec_bnwdXTZ=9Cg8Q@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: sh-sci: fix RSCI FIFO overrun handling
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Nam Cao <namcao@linutronix.de>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, stable@vger.kernel.org, 
	Biju Das <biju.das.au@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC Biju, linux-renesas-soc (let's hope for real)

On Thu, 6 Nov 2025 at 17:54, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Cosmin,
>
> On Tue, 23 Sept 2025 at 17:47, Cosmin Tanislav
> <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > The receive error handling code is shared between RSCI and all other
> > SCIF port types, but the RSCI overrun_reg is specified as a memory
> > offset, while for other SCIF types it is an enum value used to index
> > into the sci_port_params->regs array, as mentioned above the
> > sci_serial_in() function.
> >
> > For RSCI, the overrun_reg is CSR (0x48), causing the sci_getreg() call
> > inside the sci_handle_fifo_overrun() function to index outside the
> > bounds of the regs array, which currently has a size of 20, as specified
> > by SCI_NR_REGS.
> >
> > Because of this, we end up accessing memory outside of RSCI's
> > rsci_port_params structure, which, when interpreted as a plat_sci_reg,
> > happens to have a non-zero size, causing the following WARN when
> > sci_serial_in() is called, as the accidental size does not match the
> > supported register sizes.
> >
> > The existence of the overrun_reg needs to be checked because
> > SCIx_SH3_SCIF_REGTYPE has overrun_reg set to SCLSR, but SCLSR is not
> > present in the regs array.
> >
> > Avoid calling sci_getreg() for port types which don't use standard
> > register handling.
> >
> > Use the ops->read_reg() and ops->write_reg() functions to properly read
> > and write registers for RSCI, and change the type of the status variable
> > to accommodate the 32-bit CSR register.
> >
> > sci_getreg() and sci_serial_in() are also called with overrun_reg in the
> > sci_mpxed_interrupt() interrupt handler, but that code path is not used
> > for RSCI, as it does not have a muxed interrupt.
> >
> > ------------[ cut here ]------------
> > Invalid register access
> > WARNING: CPU: 0 PID: 0 at drivers/tty/serial/sh-sci.c:522 sci_serial_in+0x38/0xac
> > Modules linked in: renesas_usbhs at24 rzt2h_adc industrialio_adc sha256 cfg80211 bluetooth ecdh_generic ecc rfkill fuse drm backlight ipv6
> > CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.17.0-rc1+ #30 PREEMPT
> > Hardware name: Renesas RZ/T2H EVK Board based on r9a09g077m44 (DT)
> > pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > pc : sci_serial_in+0x38/0xac
> > lr : sci_serial_in+0x38/0xac
> > sp : ffff800080003e80
> > x29: ffff800080003e80 x28: ffff800082195b80 x27: 000000000000000d
> > x26: ffff8000821956d0 x25: 0000000000000000 x24: ffff800082195b80
> > x23: ffff000180e0d800 x22: 0000000000000010 x21: 0000000000000000
> > x20: 0000000000000010 x19: ffff000180e72000 x18: 000000000000000a
> > x17: ffff8002bcee7000 x16: ffff800080000000 x15: 0720072007200720
> > x14: 0720072007200720 x13: 0720072007200720 x12: 0720072007200720
> > x11: 0000000000000058 x10: 0000000000000018 x9 : ffff8000821a6a48
> > x8 : 0000000000057fa8 x7 : 0000000000000406 x6 : ffff8000821fea48
> > x5 : ffff00033ef88408 x4 : ffff8002bcee7000 x3 : ffff800082195b80
> > x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff800082195b80
> > Call trace:
> >  sci_serial_in+0x38/0xac (P)
> >  sci_handle_fifo_overrun.isra.0+0x70/0x134
> >  sci_er_interrupt+0x50/0x39c
> >  __handle_irq_event_percpu+0x48/0x140
> >  handle_irq_event+0x44/0xb0
> >  handle_fasteoi_irq+0xf4/0x1a0
> >  handle_irq_desc+0x34/0x58
> >  generic_handle_domain_irq+0x1c/0x28
> >  gic_handle_irq+0x4c/0x140
> >  call_on_irq_stack+0x30/0x48
> >  do_interrupt_handler+0x80/0x84
> >  el1_interrupt+0x34/0x68
> >  el1h_64_irq_handler+0x18/0x24
> >  el1h_64_irq+0x6c/0x70
> >  default_idle_call+0x28/0x58 (P)
> >  do_idle+0x1f8/0x250
> >  cpu_startup_entry+0x34/0x3c
> >  rest_init+0xd8/0xe0
> >  console_on_rootfs+0x0/0x6c
> >  __primary_switched+0x88/0x90
> > ---[ end trace 0000000000000000 ]---
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 0666e3fe95ab ("serial: sh-sci: Add support for RZ/T2H SCI")
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
>
> Thanks for your patch, which is now commit ef8fef45c74b5a00 ("tty:
> serial: sh-sci: fix RSCI FIFO overrun handling") in v6.18-rc3.
>
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -1014,16 +1014,18 @@ static int sci_handle_fifo_overrun(struct uart_port *port)
> >         struct sci_port *s = to_sci_port(port);
> >         const struct plat_sci_reg *reg;
> >         int copied = 0;
> > -       u16 status;
> > +       u32 status;
> >
> > -       reg = sci_getreg(port, s->params->overrun_reg);
> > -       if (!reg->size)
> > -               return 0;
> > +       if (s->type != SCI_PORT_RSCI) {
> > +               reg = sci_getreg(port, s->params->overrun_reg);
> > +               if (!reg->size)
> > +                       return 0;
> > +       }
> >
> > -       status = sci_serial_in(port, s->params->overrun_reg);
> > +       status = s->ops->read_reg(port, s->params->overrun_reg);
> >         if (status & s->params->overrun_mask) {
> >                 status &= ~s->params->overrun_mask;
> > -               sci_serial_out(port, s->params->overrun_reg, status);
> > +               s->ops->write_reg(port, s->params->overrun_reg, status);
> >
> >                 port->icount.overrun++;
> >
>
> Ouch, this is really becoming fragile, and thus hard to maintain.
> See also "[PATCH v2 2/2] serial: sh-sci: Fix deadlock during RSCI FIFO
> overrun error".
> Are you sure this is the only place where that can happen?
> sci_getreg() and sci_serial_{in,out}() are used all over the place.
>
> [1] https://lore.kernel.org/20251029082101.92156-3-biju.das.jz@bp.renesas.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

