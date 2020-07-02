Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A260212679
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2020 16:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbgGBOj6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Jul 2020 10:39:58 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35868 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728179AbgGBOj6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 10:39:58 -0400
Received: by mail-ot1-f67.google.com with SMTP id 72so24315554otc.3;
        Thu, 02 Jul 2020 07:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xiJxaOaLoSSoP/MXad7n201rwLtW9CdhI5jJlFa+KSM=;
        b=iXedo5ah1qsyZewSpnngZRv88M5PAD8vlUPf2+Eb1D+a/6W2HjkVJONcCt5LHuxMnN
         NEOkwEPl6kEIUAz2gcz4NW6jNBbAkqSbkiifSbDJrqKOauag07iCZiKdH7TIbycN9fo8
         oiLc2jZs65pBUBqZJmFrRaIJznFJnXYCr8ofGOhjHKc/YIGOZbtxZPK1o9KS9QBYMcc9
         8wE1YsxM8PSm9ZYG0zCoWFdMnV24F0dt+eoNhVXea2mRoQZWSx6AjsEMN8Y9PeOj3+vM
         rOnElciL1o2lYjq12e2vQU/r3GCwDG06KfoCRZI7G2BC4yvlYPwq9NtRPva98pvZbvQ/
         2KQQ==
X-Gm-Message-State: AOAM533ofIghtOO2/nAzK2ZJ6suGHB3j9eeWRNVlHLdvZo6vpnLqnVZs
        NIY8qjK5djgfoKmCeYut/UTl6qNxzwQbqqV2Ylw=
X-Google-Smtp-Source: ABdhPJyP42inE/TMOj+L+cFsJcbt3757WHyJF91kt+gPhSMX9ZNnOfpaY1Y5npS99t6WRtwjFdvvoEMDdHyzE+12ykI=
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr14567992otp.250.1593700796830;
 Thu, 02 Jul 2020 07:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <1593618100-2151-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWU7kVJMuNMSGxZSjErmj7rB=tvXH3GANmPRjYz+=JP1g@mail.gmail.com>
 <CA+V-a8v+2fhqwRNCaGYbmh8E1FDyc2Xss3PHk12dpTt_pgmCFg@mail.gmail.com>
 <CAMuHMdVdCH-r-xMnDgUYzJfDCzUJCYt8CkSDp9E=tgfP01FrKw@mail.gmail.com>
 <CA+V-a8s3JgtGsSSsCF335p1S6Yq5veqe6nAQNK03wNSxAU0XCA@mail.gmail.com>
 <CA+V-a8vq4rJAoA583O_28NK2cCEFAzDszDQTPRQHWiXCtDxd-w@mail.gmail.com>
 <CAMuHMdU2N6TD9=eHZPBozo-yTP-c0uQLqmGszHmsJDc6YGHeoQ@mail.gmail.com> <CA+V-a8u+NYL9MNV_oFz6JnfQzE=bNo0fx6jnzVgj2xsvquT8eg@mail.gmail.com>
In-Reply-To: <CA+V-a8u+NYL9MNV_oFz6JnfQzE=bNo0fx6jnzVgj2xsvquT8eg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Jul 2020 16:39:45 +0200
Message-ID: <CAMuHMdUSxyPtk-FJkF2M=eyTtoU1cfeioaSn3hQ7YxEpwBJWsA@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Initialize spinlock for uart console
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Thu, Jul 2, 2020 at 4:05 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:

> Hi Geert,
>
> On Thu, Jul 2, 2020 at 1:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Thu, Jul 2, 2020 at 1:42 PM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Thu, Jul 2, 2020 at 11:49 AM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > On Thu, Jul 2, 2020 at 10:23 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Wed, Jul 1, 2020 at 7:28 PM Lad, Prabhakar
> > > > > <prabhakar.csengg@gmail.com> wrote:
> > > > > > On Wed, Jul 1, 2020 at 6:17 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > On Wed, Jul 1, 2020 at 5:42 PM Lad Prabhakar
> > > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > > > > > serial core expects the spinlock to be initialized by the controller
> > > > > > > > driver for serial console, this patch makes sure the spinlock is
> > > > > > > > initialized, fixing the below issue:
> > > > > > > >
> > > > > > > > [    0.865928] BUG: spinlock bad magic on CPU#0, swapper/0/1
> > > > > > > > [    0.865945]  lock: sci_ports+0x0/0x4c80, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
> > > > > > > > [    0.865955] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc1+ #112
> > > > > > > > [    0.865961] Hardware name: HopeRun HiHope RZ/G2H with sub board (DT)
> > > > > > > > [    0.865968] Call trace:
> > > > > > > > [    0.865979]  dump_backtrace+0x0/0x1d8
> > > > > > > > [    0.865985]  show_stack+0x14/0x20
> > > > > > > > [    0.865996]  dump_stack+0xe8/0x130
> > > > > > > > [    0.866006]  spin_dump+0x6c/0x88
> > > > > > > > [    0.866012]  do_raw_spin_lock+0xb0/0xf8
> > > > > > > > [    0.866023]  _raw_spin_lock_irqsave+0x80/0xa0
> > > > > > > > [    0.866032]  uart_add_one_port+0x3a4/0x4e0
> > > > > > > > [    0.866039]  sci_probe+0x504/0x7c8
> > > > > > > > [    0.866048]  platform_drv_probe+0x50/0xa0
> > > > > > > > [    0.866059]  really_probe+0xdc/0x330
> > > > > > > > [    0.866066]  driver_probe_device+0x58/0xb8
> > > > > > > > [    0.866072]  device_driver_attach+0x6c/0x90
> > > > > > > > [    0.866078]  __driver_attach+0x88/0xd0
> > > > > > > > [    0.866085]  bus_for_each_dev+0x74/0xc8
> > > > > > > > [    0.866091]  driver_attach+0x20/0x28
> > > > > > > > [    0.866098]  bus_add_driver+0x14c/0x1f8
> > > > > > > > [    0.866104]  driver_register+0x60/0x110
> > > > > > > > [    0.866109]  __platform_driver_register+0x40/0x48
> > > > > > > > [    0.866119]  sci_init+0x2c/0x34
> > > > > > > > [    0.866127]  do_one_initcall+0x88/0x428
> > > > > > > > [    0.866137]  kernel_init_freeable+0x2c0/0x328
> > > > > > > > [    0.866143]  kernel_init+0x10/0x108
> > > > > > > > [    0.866150]  ret_from_fork+0x10/0x18
> > > > > > >
> > > > > > > Interesting...
> > > > > > >
> > > > > > > How can I reproduce that? I do have CONFIG_DEBUG_SPINLOCK=y.
> > > > > > > I'm wondering why haven't we seen this before...
> > > > > > >
> > > > > > I have attached .config for your reference.
> > > > >
> > > > > Thank you!
> > > > >
> > > > > I gave it a try with v5.8-rc1 on Salvator-XS with R-Car H3 ES2.0.
> > > > > However, I couldn't reproduce the issue.
> > > > > Does it happen on that specific board only? Is this serdev-related?
> > > > > Note that I had to disable CONFIG_EXTRA_FIRMWARE, as I don't have the
> > > > > firmware blobs it referenced.  Do I need them to trigger the issue?
> > > > > As the .config has a few non-upstream options, do you have any patches
> > > > > applied that might impact the issue?
> > > > >
> > > > Can't think of any patches that might cause an issue, most of it are
> > > > just the DT's and config additions. Nor do firmware blobs should
> > > > affect it. I'll try and reproduce it on M3N and get back to you.
> > > >
> > > I did manage to replicate this issue on M3N (v5.8-rc3 tag with no
> > > modifications), I have attached the config file and also the boot log
> > > without this patch for your reference, after applying this patch I no
> > > more see this issue.
> >
> > Thanks, the boot log finally gave me a clue, and allowed me to reproduce.
> > The issue happens only when adding:
> >
> >     console=ttySC0,115200n8
> >
> Ack tested it on G2H.
>
> > to the kernel command line.  Which is something we never did on R-Car
> > Gen3, as the console= parameter had been deprecated by chosen/stdout-path
> > on DT systems long before.
> >
> > As we did use console= before on arm32, and drivers/tty/serial/sh-sci.c
> > never called spinlock_init(), I'm wondering if this spinlock bug is
> > actually a regression in serial_core.c?
> >
> Not sure if it's a regression in serial_core.c as I see some drivers
> calling spin_lock_init().

Bisected to commit a3cb39d258efef83 ("serial: core: Allow detach and
attach serial device for console").
The first change to drivers/tty/serial/serial_core.c is the culprit:

     static inline void uart_port_spin_lock_init(struct uart_port *port)
     {
    -       if (uart_console_enabled(port))
    +       if (uart_console(port))
                    return;

            spin_lock_init(&port->lock);

as it now skips the spinlock initialization if a console= parameter
is specified.

Apparently we're not the only one bitten by that...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
