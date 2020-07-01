Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05F2F2111CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2020 19:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729465AbgGARRt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Jul 2020 13:17:49 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41009 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbgGARRs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Jul 2020 13:17:48 -0400
Received: by mail-ot1-f66.google.com with SMTP id k15so21958879otp.8;
        Wed, 01 Jul 2020 10:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4DeJKT3rF87H8O2OZ1E1YXv2QMAJ3DSeaSi7+IyNvX0=;
        b=OkLCFK/7dazsHs3C/Lif6TQIX9HAbvJEOC/R7WYIkbiQDycXW2jgHVt1JIJubuxWFH
         qjlKe0HpENn0H5QkVMw5my6ObH1vAZGwkVlpajsq+0QAW0G0/OzZxVPVXGvxHvr1uaEN
         bwCG+d3EuDWvG3TAifX93jupQBW3vUg88heLLqBr6uVydM6hnqLoqs/aKN5+n5wzQQMC
         gN2bDV2cx3SrnuvyCKfxdPLlmQQu7YaEnhY8NjjAa7BWVPkRze2zy5fLc8cOHKGpczFv
         eGIO82YsC2WMLsrxR2ZuXnYiU//tpUAkWiXTC3Sm4nIYk/hqATiBobDNj49LJ8IJPftV
         fA9w==
X-Gm-Message-State: AOAM533RaLAxAfW5BLoR5iloaHaofUn1D/E+E+nnthoYX0UxV7kWqQZl
        8zQ599wt8yEJW0pBAV3RhY9K6OUGFunYka7g9x0=
X-Google-Smtp-Source: ABdhPJwI1jpyvfp6Syqw8VPHxjayT22lizXhfFASeRsifC+fTjXmjqOeKnVBTI4zyPXPDV+t6Og7OsZoD6/VwVAjvLA=
X-Received: by 2002:a9d:6254:: with SMTP id i20mr23441092otk.145.1593623867483;
 Wed, 01 Jul 2020 10:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <1593618100-2151-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1593618100-2151-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Jul 2020 19:17:36 +0200
Message-ID: <CAMuHMdWU7kVJMuNMSGxZSjErmj7rB=tvXH3GANmPRjYz+=JP1g@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Initialize spinlock for uart console
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Jul 1, 2020 at 5:42 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> serial core expects the spinlock to be initialized by the controller
> driver for serial console, this patch makes sure the spinlock is
> initialized, fixing the below issue:
>
> [    0.865928] BUG: spinlock bad magic on CPU#0, swapper/0/1
> [    0.865945]  lock: sci_ports+0x0/0x4c80, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
> [    0.865955] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc1+ #112
> [    0.865961] Hardware name: HopeRun HiHope RZ/G2H with sub board (DT)
> [    0.865968] Call trace:
> [    0.865979]  dump_backtrace+0x0/0x1d8
> [    0.865985]  show_stack+0x14/0x20
> [    0.865996]  dump_stack+0xe8/0x130
> [    0.866006]  spin_dump+0x6c/0x88
> [    0.866012]  do_raw_spin_lock+0xb0/0xf8
> [    0.866023]  _raw_spin_lock_irqsave+0x80/0xa0
> [    0.866032]  uart_add_one_port+0x3a4/0x4e0
> [    0.866039]  sci_probe+0x504/0x7c8
> [    0.866048]  platform_drv_probe+0x50/0xa0
> [    0.866059]  really_probe+0xdc/0x330
> [    0.866066]  driver_probe_device+0x58/0xb8
> [    0.866072]  device_driver_attach+0x6c/0x90
> [    0.866078]  __driver_attach+0x88/0xd0
> [    0.866085]  bus_for_each_dev+0x74/0xc8
> [    0.866091]  driver_attach+0x20/0x28
> [    0.866098]  bus_add_driver+0x14c/0x1f8
> [    0.866104]  driver_register+0x60/0x110
> [    0.866109]  __platform_driver_register+0x40/0x48
> [    0.866119]  sci_init+0x2c/0x34
> [    0.866127]  do_one_initcall+0x88/0x428
> [    0.866137]  kernel_init_freeable+0x2c0/0x328
> [    0.866143]  kernel_init+0x10/0x108
> [    0.866150]  ret_from_fork+0x10/0x18

Interesting...

How can I reproduce that? I do have CONFIG_DEBUG_SPINLOCK=y.
I'm wondering why haven't we seen this before...

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
