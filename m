Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70B42126E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2020 16:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730321AbgGBOtJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Jul 2020 10:49:09 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35412 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730312AbgGBOtI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 10:49:08 -0400
Received: by mail-ot1-f67.google.com with SMTP id d4so24344899otk.2;
        Thu, 02 Jul 2020 07:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WuhVfNAZUsHwdGGVre6U87YOfHxjCbHm/sJoV4RDVi4=;
        b=qOILtWIPloAHcVKQBBnOP4ox/xdlDMB3Ud3t7s2gYEV7MI6qJ4VEZuCYtxxJEqAhP2
         G1SbQlFtQt7OufGtpHYkMhAVDjMJtPJg1pVax6+yNycqvoMd2fA/YJYDAWIuZgqB/YES
         D2an8hUc3NdndDMkubtjTPYmwKuaFfc6zykvhGDMOzHFC8Qy9MazGLqeFibJHYRURtj5
         0CQheTZGR6QbuWHbuoGBA+BorvgZyz7zqq+R5TOs4v6Umfg6vcMnT2Gvhg4cHByvqwEB
         Rcn8y5H/g30Gp2qf3rL3Yl8JxPULlEx0RjM+ZyY9vHUcNoVxmzWCAtubZJQY1qMEACzi
         ODYw==
X-Gm-Message-State: AOAM531T3hYGLezknL+8iRMaJPgODoPYexOg9UBrwPJQm1VCLaqHS7fu
        98qtfgrRwUF0Aafm09eH6HbHwp5GRRCGOuFjnwR5me1a9qY=
X-Google-Smtp-Source: ABdhPJyclt1UeyUm0bHvdNeHnAeyynojoJb+gjjxKBPFtu6qL3+USd95fh1KkMvch4B4yzP8znhFKUkLvlJHWzgP90c=
X-Received: by 2002:a9d:6254:: with SMTP id i20mr26956706otk.145.1593701346474;
 Thu, 02 Jul 2020 07:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200217114016.49856-1-andriy.shevchenko@linux.intel.com>
 <20200217114016.49856-3-andriy.shevchenko@linux.intel.com> <20200524171032.GA218301@roeck-us.net>
In-Reply-To: <20200524171032.GA218301@roeck-us.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Jul 2020 16:48:55 +0200
Message-ID: <CAMuHMdXvummZiDBu72WJmdanyP2r4dab8SbVLZaTRNrBfnRmTw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] serial: core: Allow detach and attach serial
 device for console
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

On Sun, May 24, 2020 at 7:11 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On Mon, Feb 17, 2020 at 01:40:12PM +0200, Andy Shevchenko wrote:
> > In the future we would like to disable power management on the serial devices
> > used as kernel consoles to avoid weird behaviour in some cases. However,
> > disabling PM may prevent system to go to deep sleep states, which in its turn
> > leads to the higher power consumption.
> >
> > Tony Lindgren proposed a work around, i.e. allow user to detach such consoles
> > to make PM working again. In case user wants to see what's going on, it also
> > provides a mechanism to attach console back.
> >
> > Link: https://lists.openwall.net/linux-kernel/2018/09/29/65
> > Suggested-by: Tony Lindgren <tony@atomide.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> > --- a/drivers/tty/serial/serial_core.c
> > +++ b/drivers/tty/serial/serial_core.c
> > @@ -1919,7 +1919,7 @@ static inline bool uart_console_enabled(struct uart_port *port)
> >   */
> >  static inline void uart_port_spin_lock_init(struct uart_port *port)
> >  {
> > -     if (uart_console_enabled(port))
> > +     if (uart_console(port))
>
> This results in lockdep splashes such as the one attached below. Is there

Or "BUG: spinlock bad magic on CPU#3, swapper/0/1", cfr. [1].
So far I hadn't noticed that, as the issue only shows up when using the
legacy way of passing a "console=ttyS*" kernel command line parameter,
and not when relying on the modern "chosen/stdout-path" DT property.

> any special reason for this change ? It is not really explained in the
> commit description.

Indeed. Why this change?

I also don't agree with your typical fix for drivers, which is like:

    @@ -567,6 +567,9 @@ static int hv_probe(struct platform_device *op)
            sunserial_console_match(&sunhv_console, op->dev.of_node,
                                    &sunhv_reg, port->line, false);

    +       /* We need to initialize lock even for non-registered console */
    +       spin_lock_init(&port->lock);
    +
            err = uart_add_one_port(&sunhv_reg, port);
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                  calls uart_port_spin_lock_init()

            if (err)
                    goto out_unregister_driver;

as this initializes the spinlock twice for non-console= ports.

> [   15.439094] INFO: trying to register non-static key.
> [   15.439146] the code is fine but needs lockdep annotation.
> [   15.439196] turning off the locking correctness validator.
> [   15.439392] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc6-00244-gcaffb99b6929 #1
> [   15.439469] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
> [   15.439887] [<c0112578>] (unwind_backtrace) from [<c010c4f4>] (show_stack+0x10/0x14)
> [   15.439982] [<c010c4f4>] (show_stack) from [<c06dfcb0>] (dump_stack+0xe4/0x11c)
> [   15.440053] [<c06dfcb0>] (dump_stack) from [<c01883e4>] (register_lock_class+0x8a0/0x924)
> [   15.440127] [<c01883e4>] (register_lock_class) from [<c01884d4>] (__lock_acquire+0x6c/0x2e80)
> [   15.440202] [<c01884d4>] (__lock_acquire) from [<c018756c>] (lock_acquire+0xf8/0x4f4)
> [   15.440274] [<c018756c>] (lock_acquire) from [<c0ddf02c>] (_raw_spin_lock_irqsave+0x50/0x64)
> [   15.440350] [<c0ddf02c>] (_raw_spin_lock_irqsave) from [<c07af5d8>] (uart_add_one_port+0x3a4/0x504)
> [   15.440431] [<c07af5d8>] (uart_add_one_port) from [<c089c990>] (platform_drv_probe+0x48/0x98)
> [   15.440506] [<c089c990>] (platform_drv_probe) from [<c089a708>] (really_probe+0x214/0x344)
> [   15.440578] [<c089a708>] (really_probe) from [<c089a948>] (driver_probe_device+0x5c/0x16c)
> [   15.440650] [<c089a948>] (driver_probe_device) from [<c089ac00>] (device_driver_attach+0x58/0x60)
> [   15.440727] [<c089ac00>] (device_driver_attach) from [<c089ac8c>] (__driver_attach+0x84/0xc0)
> [   15.440800] [<c089ac8c>] (__driver_attach) from [<c08987e8>] (bus_for_each_dev+0x70/0xb4)
> [   15.440874] [<c08987e8>] (bus_for_each_dev) from [<c08999a4>] (bus_add_driver+0x154/0x1e0)
> [   15.440946] [<c08999a4>] (bus_add_driver) from [<c089ba38>] (driver_register+0x74/0x108)
> [   15.441020] [<c089ba38>] (driver_register) from [<c144edb8>] (imx_uart_init+0x20/0x40)
> [   15.441090] [<c144edb8>] (imx_uart_init) from [<c010232c>] (do_one_initcall+0x80/0x3ac)
> [   15.441162] [<c010232c>] (do_one_initcall) from [<c1400ff0>] (kernel_init_freeable+0x170/0x204)
> [   15.441241] [<c1400ff0>] (kernel_init_freeable) from [<c0dd5c48>] (kernel_init+0x8/0x118)
> [   15.441313] [<c0dd5c48>] (kernel_init) from [<c0100134>] (ret_from_fork+0x14/0x20)
> [   15.441414] Exception stack(0xc609ffb0 to 0xc609fff8)
> [   15.441571] ffa0:                                     00000000 00000000 00000000 00000000
> [   15.441738] ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [   15.441872] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000

Thanks for your answer!

[1] https://lore.kernel.org/r/1593618100-2151-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
