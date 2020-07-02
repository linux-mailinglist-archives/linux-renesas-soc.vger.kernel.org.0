Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8A9212C61
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2020 20:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgGBScm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Jul 2020 14:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbgGBScl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 14:32:41 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96193C08C5C1;
        Thu,  2 Jul 2020 11:32:41 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 5so22850441oty.11;
        Thu, 02 Jul 2020 11:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hMrZ0Fj8O9t2zoQt5sBCV5iZNG5UmOz4mlK4r+ZvSv4=;
        b=CzsL7kJoPW2fZd8IVxltbQ3frKNOayoCUlS4J2ae+orU+yca/P3LpW3IOwY0QpNFNa
         wJL3LdlmG7A2T2qK5mvheSPjU2YnSOHy5cUslzy5nybq43sFzO938GNAeJzo0msS3B08
         OBbWOguwktU9s8P5h0j5mH4fBVTR55mWir2b9XyZ0t3tbp3Wy8gjpYtSikToqWfyiIb4
         oC1zCZmxXR+Bm0aV26KLRIZ2LQtOj2x9v0GbAK4Bw8suksDkVib0pjQ0POIQfO73JAK6
         Heep7c9hvzBI8QtQUmYcw29cSB5t2nPgkKTQWGlAe/rM9uux+QZHFjeHOHD1Qc+ctjHp
         QPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hMrZ0Fj8O9t2zoQt5sBCV5iZNG5UmOz4mlK4r+ZvSv4=;
        b=CF9GzDRCUDgkn7qYR6/0E9lYngsq7wM9NfsEO5Fhxv1MSQ6ZnqhCsV0pzTpSi4PB9z
         UAN/Kti8g2PsYywvG0xqIr71r66VAGMV42GN3IPA/1MbYxbwazw/VvboH4mrOsuN/pc1
         ESrg6GWkA64CN8gCpt+ePtT/QNpF8cycsSFCVu4Q96W9OPzjF0M1CMvViK0XQuEDjrX4
         PvCfIDX86936Z3VoQo9yQxufPwj2czv7K6E75J3K81ZeIQdkykIcPY3yV05uG43PzwEt
         t95tQTO7uzZqpLeScQGbH1EG1xlqd/pRqKvOYQYmmziHSHcTM9Ywmtrbr4XXLYfTCDks
         305w==
X-Gm-Message-State: AOAM530XA9n5jkQ3SGJO/2m0ol3a+yN2gdzSM3WDBJSYZsyjgto/GTOJ
        HZGnq8zKozM6BnIp19zeQ+1h+ZHbaE7LQF+196Q=
X-Google-Smtp-Source: ABdhPJyF4e3whEm/wKrGvNp5pUH/88OopaC3saaBmqlAoJT+L4iXrqeBT8+JVvd2NCynrZtAOa6+Sq5HjJ34LbyOtQs=
X-Received: by 2002:a9d:7dd3:: with SMTP id k19mr15778847otn.43.1593714760853;
 Thu, 02 Jul 2020 11:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <1593618100-2151-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWU7kVJMuNMSGxZSjErmj7rB=tvXH3GANmPRjYz+=JP1g@mail.gmail.com>
 <CA+V-a8v+2fhqwRNCaGYbmh8E1FDyc2Xss3PHk12dpTt_pgmCFg@mail.gmail.com>
 <CAMuHMdVdCH-r-xMnDgUYzJfDCzUJCYt8CkSDp9E=tgfP01FrKw@mail.gmail.com>
 <CA+V-a8s3JgtGsSSsCF335p1S6Yq5veqe6nAQNK03wNSxAU0XCA@mail.gmail.com>
 <CA+V-a8vq4rJAoA583O_28NK2cCEFAzDszDQTPRQHWiXCtDxd-w@mail.gmail.com>
 <CAMuHMdU2N6TD9=eHZPBozo-yTP-c0uQLqmGszHmsJDc6YGHeoQ@mail.gmail.com>
 <CA+V-a8u+NYL9MNV_oFz6JnfQzE=bNo0fx6jnzVgj2xsvquT8eg@mail.gmail.com> <CAMuHMdUSxyPtk-FJkF2M=eyTtoU1cfeioaSn3hQ7YxEpwBJWsA@mail.gmail.com>
In-Reply-To: <CAMuHMdUSxyPtk-FJkF2M=eyTtoU1cfeioaSn3hQ7YxEpwBJWsA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 2 Jul 2020 19:32:13 +0100
Message-ID: <CA+V-a8tmi=U-9pyMzc8dQL0ZPfFYuzXdj8o2SzDAWsTboDDnMA@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Initialize spinlock for uart console
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

On Thu, Jul 2, 2020 at 3:39 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Jul 2, 2020 at 4:05 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>
> > Hi Geert,
> >
> > On Thu, Jul 2, 2020 at 1:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > On Thu, Jul 2, 2020 at 1:42 PM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > On Thu, Jul 2, 2020 at 11:49 AM Lad, Prabhakar
> > > > <prabhakar.csengg@gmail.com> wrote:
> > > > > On Thu, Jul 2, 2020 at 10:23 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > On Wed, Jul 1, 2020 at 7:28 PM Lad, Prabhakar
> > > > > > <prabhakar.csengg@gmail.com> wrote:
> > > > > > > On Wed, Jul 1, 2020 at 6:17 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > > On Wed, Jul 1, 2020 at 5:42 PM Lad Prabhakar
> > > > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > > > > > > serial core expects the spinlock to be initialized by the controller
> > > > > > > > > driver for serial console, this patch makes sure the spinlock is
> > > > > > > > > initialized, fixing the below issue:
> > > > > > > > >
> > > > > > > > > [    0.865928] BUG: spinlock bad magic on CPU#0, swapper/0/1
> > > > > > > > > [    0.865945]  lock: sci_ports+0x0/0x4c80, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
> > > > > > > > > [    0.865955] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc1+ #112
> > > > > > > > > [    0.865961] Hardware name: HopeRun HiHope RZ/G2H with sub board (DT)
> > > > > > > > > [    0.865968] Call trace:
> > > > > > > > > [    0.865979]  dump_backtrace+0x0/0x1d8
> > > > > > > > > [    0.865985]  show_stack+0x14/0x20
> > > > > > > > > [    0.865996]  dump_stack+0xe8/0x130
> > > > > > > > > [    0.866006]  spin_dump+0x6c/0x88
> > > > > > > > > [    0.866012]  do_raw_spin_lock+0xb0/0xf8
> > > > > > > > > [    0.866023]  _raw_spin_lock_irqsave+0x80/0xa0
> > > > > > > > > [    0.866032]  uart_add_one_port+0x3a4/0x4e0
> > > > > > > > > [    0.866039]  sci_probe+0x504/0x7c8
> > > > > > > > > [    0.866048]  platform_drv_probe+0x50/0xa0
> > > > > > > > > [    0.866059]  really_probe+0xdc/0x330
> > > > > > > > > [    0.866066]  driver_probe_device+0x58/0xb8
> > > > > > > > > [    0.866072]  device_driver_attach+0x6c/0x90
> > > > > > > > > [    0.866078]  __driver_attach+0x88/0xd0
> > > > > > > > > [    0.866085]  bus_for_each_dev+0x74/0xc8
> > > > > > > > > [    0.866091]  driver_attach+0x20/0x28
> > > > > > > > > [    0.866098]  bus_add_driver+0x14c/0x1f8
> > > > > > > > > [    0.866104]  driver_register+0x60/0x110
> > > > > > > > > [    0.866109]  __platform_driver_register+0x40/0x48
> > > > > > > > > [    0.866119]  sci_init+0x2c/0x34
> > > > > > > > > [    0.866127]  do_one_initcall+0x88/0x428
> > > > > > > > > [    0.866137]  kernel_init_freeable+0x2c0/0x328
> > > > > > > > > [    0.866143]  kernel_init+0x10/0x108
> > > > > > > > > [    0.866150]  ret_from_fork+0x10/0x18
> > > > > > > >
> > > > > > > > Interesting...
> > > > > > > >
> > > > > > > > How can I reproduce that? I do have CONFIG_DEBUG_SPINLOCK=y.
> > > > > > > > I'm wondering why haven't we seen this before...
> > > > > > > >
> > > > > > > I have attached .config for your reference.
> > > > > >
> > > > > > Thank you!
> > > > > >
> > > > > > I gave it a try with v5.8-rc1 on Salvator-XS with R-Car H3 ES2.0.
> > > > > > However, I couldn't reproduce the issue.
> > > > > > Does it happen on that specific board only? Is this serdev-related?
> > > > > > Note that I had to disable CONFIG_EXTRA_FIRMWARE, as I don't have the
> > > > > > firmware blobs it referenced.  Do I need them to trigger the issue?
> > > > > > As the .config has a few non-upstream options, do you have any patches
> > > > > > applied that might impact the issue?
> > > > > >
> > > > > Can't think of any patches that might cause an issue, most of it are
> > > > > just the DT's and config additions. Nor do firmware blobs should
> > > > > affect it. I'll try and reproduce it on M3N and get back to you.
> > > > >
> > > > I did manage to replicate this issue on M3N (v5.8-rc3 tag with no
> > > > modifications), I have attached the config file and also the boot log
> > > > without this patch for your reference, after applying this patch I no
> > > > more see this issue.
> > >
> > > Thanks, the boot log finally gave me a clue, and allowed me to reproduce.
> > > The issue happens only when adding:
> > >
> > >     console=ttySC0,115200n8
> > >
> > Ack tested it on G2H.
> >
> > > to the kernel command line.  Which is something we never did on R-Car
> > > Gen3, as the console= parameter had been deprecated by chosen/stdout-path
> > > on DT systems long before.
> > >
> > > As we did use console= before on arm32, and drivers/tty/serial/sh-sci.c
> > > never called spinlock_init(), I'm wondering if this spinlock bug is
> > > actually a regression in serial_core.c?
> > >
> > Not sure if it's a regression in serial_core.c as I see some drivers
> > calling spin_lock_init().
>
> Bisected to commit a3cb39d258efef83 ("serial: core: Allow detach and
> attach serial device for console").
> The first change to drivers/tty/serial/serial_core.c is the culprit:
>
>      static inline void uart_port_spin_lock_init(struct uart_port *port)
>      {
>     -       if (uart_console_enabled(port))
>     +       if (uart_console(port))
>                     return;
>
>             spin_lock_init(&port->lock);
>
> as it now skips the spinlock initialization if a console= parameter
> is specified.
>
> Apparently we're not the only one bitten by that...
>
Thank you for bisecting through, that explains the culprit.

Cheers,
--Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
