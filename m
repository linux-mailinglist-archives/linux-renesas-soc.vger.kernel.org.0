Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED697211FB6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2020 11:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgGBJX4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Jul 2020 05:23:56 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35220 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGBJXz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 05:23:55 -0400
Received: by mail-oi1-f193.google.com with SMTP id k4so23132504oik.2;
        Thu, 02 Jul 2020 02:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wCkBw3oirGVCWmjI/nTGUzVc7Xs3iHGv9e1O9Q6s09o=;
        b=MP7oqvcD8TQKBP99o4o1QkIoLNPrN49j441P1gCP1a+YnoSaIzlYruP2movZULeGWr
         3ogHW4Ra0SeG1gO0t4dZyw4joj5QcHpraNrq+fKX7mABOanN7L2h9Ydfu1x27U54QDvz
         ZUlWDMZCH+K6rshgO85WhBpvINF1baojpWctqQ3gGAeOeHJ9EQB8HVanFtSTa5qt1DL1
         y6Qfl1/Ka3Gm4RSSLFAkpQwuX1D+7vpySQsJi2E5VqcOI/a1ns6Cy4WWhArpGluoHpUh
         fUqYEdY/klyqnCjovYUUuZutSGRVb7cX2CoG9UZ79TBL8KpZl/gmFRfw5PvT5VeSF2ur
         Kmqg==
X-Gm-Message-State: AOAM533ozLJ6g2euFbMUVvjIdUalmrF8XREbjZfFk0MH/RNIk8sNBkLE
        OCn4ZD9qs2xQxpzMTrJ4UospF7l88d2jWdAbIoE=
X-Google-Smtp-Source: ABdhPJw7jZ2OCXYtQuwzO2vBYZO9WzxgfjqQAWCOrpQ0MQBQ23VXQWCzTcLKpgk/3C8CRK2ZBGKgvLN1JG/aS54Niis=
X-Received: by 2002:aca:1801:: with SMTP id h1mr18281530oih.148.1593681834441;
 Thu, 02 Jul 2020 02:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <1593618100-2151-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWU7kVJMuNMSGxZSjErmj7rB=tvXH3GANmPRjYz+=JP1g@mail.gmail.com> <CA+V-a8v+2fhqwRNCaGYbmh8E1FDyc2Xss3PHk12dpTt_pgmCFg@mail.gmail.com>
In-Reply-To: <CA+V-a8v+2fhqwRNCaGYbmh8E1FDyc2Xss3PHk12dpTt_pgmCFg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Jul 2020 11:23:42 +0200
Message-ID: <CAMuHMdVdCH-r-xMnDgUYzJfDCzUJCYt8CkSDp9E=tgfP01FrKw@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Initialize spinlock for uart console
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Wed, Jul 1, 2020 at 7:28 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, Jul 1, 2020 at 6:17 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Jul 1, 2020 at 5:42 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > serial core expects the spinlock to be initialized by the controller
> > > driver for serial console, this patch makes sure the spinlock is
> > > initialized, fixing the below issue:
> > >
> > > [    0.865928] BUG: spinlock bad magic on CPU#0, swapper/0/1
> > > [    0.865945]  lock: sci_ports+0x0/0x4c80, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
> > > [    0.865955] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc1+ #112
> > > [    0.865961] Hardware name: HopeRun HiHope RZ/G2H with sub board (DT)
> > > [    0.865968] Call trace:
> > > [    0.865979]  dump_backtrace+0x0/0x1d8
> > > [    0.865985]  show_stack+0x14/0x20
> > > [    0.865996]  dump_stack+0xe8/0x130
> > > [    0.866006]  spin_dump+0x6c/0x88
> > > [    0.866012]  do_raw_spin_lock+0xb0/0xf8
> > > [    0.866023]  _raw_spin_lock_irqsave+0x80/0xa0
> > > [    0.866032]  uart_add_one_port+0x3a4/0x4e0
> > > [    0.866039]  sci_probe+0x504/0x7c8
> > > [    0.866048]  platform_drv_probe+0x50/0xa0
> > > [    0.866059]  really_probe+0xdc/0x330
> > > [    0.866066]  driver_probe_device+0x58/0xb8
> > > [    0.866072]  device_driver_attach+0x6c/0x90
> > > [    0.866078]  __driver_attach+0x88/0xd0
> > > [    0.866085]  bus_for_each_dev+0x74/0xc8
> > > [    0.866091]  driver_attach+0x20/0x28
> > > [    0.866098]  bus_add_driver+0x14c/0x1f8
> > > [    0.866104]  driver_register+0x60/0x110
> > > [    0.866109]  __platform_driver_register+0x40/0x48
> > > [    0.866119]  sci_init+0x2c/0x34
> > > [    0.866127]  do_one_initcall+0x88/0x428
> > > [    0.866137]  kernel_init_freeable+0x2c0/0x328
> > > [    0.866143]  kernel_init+0x10/0x108
> > > [    0.866150]  ret_from_fork+0x10/0x18
> >
> > Interesting...
> >
> > How can I reproduce that? I do have CONFIG_DEBUG_SPINLOCK=y.
> > I'm wondering why haven't we seen this before...
> >
> I have attached .config for your reference.

Thank you!

I gave it a try with v5.8-rc1 on Salvator-XS with R-Car H3 ES2.0.
However, I couldn't reproduce the issue.
Does it happen on that specific board only? Is this serdev-related?
Note that I had to disable CONFIG_EXTRA_FIRMWARE, as I don't have the
firmware blobs it referenced.  Do I need them to trigger the issue?
As the .config has a few non-upstream options, do you have any patches
applied that might impact the issue?

Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
