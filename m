Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6891213958
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jul 2020 13:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgGCLbi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jul 2020 07:31:38 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:39028 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgGCLbh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jul 2020 07:31:37 -0400
Received: by mail-qk1-f195.google.com with SMTP id l6so28457153qkc.6;
        Fri, 03 Jul 2020 04:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TL6dVQUtU8/3vH+JvDwwJWgtzGDLgHPNaLQXhZw2R5M=;
        b=cGw3n4qE6hhPSuFoSBMpaI9dPqeTrLT6HMGvvUvEG/SWsldHB0WO7llxgfHs4CJh8p
         +HDleyne46F46FQCw9u3yvIyTB6QeL7efrQhb9Rto7ZCQjwUSxuc9lgSksVvUL8v7Z58
         7iRxklArB8Gy8yk5dI+trXukOa8YHxpNwDnTmvQuEAkE0lZamdmFQaZtmU+GVJ87On5+
         ltvYJly5x3VtYxsub9rFYTBsH5hxVwX6LzbNzoj/8BwCYDTyIEuJDV1T4Rsqi/ge0RLm
         UV7UasonxhLZCZgpzsGwpWA2I1aa363CzTERAeUuAxJkrBDrf98pkkTBz006rxwpgeN9
         7WGQ==
X-Gm-Message-State: AOAM5309toTbsm62vAGL6JQ15i/zLfPv1oAtIRVqa7dJW/yU3nJ0Ip4p
        jNk9eKnO5FOeVAGHAQ8F12wsGpxkqOMvPBEKpcc8FDtXV9s=
X-Google-Smtp-Source: ABdhPJxKbd3vT3N0Z5oGMhZ/eQuEhGDBe8dHubXS1ddYmf1Rm94FViRORM1rx5oP5lWJ3s7qgGnhj2/EIzHkQwGdNGk=
X-Received: by 2002:a37:6343:: with SMTP id x64mr34366378qkb.114.1593775896336;
 Fri, 03 Jul 2020 04:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200217114016.49856-1-andriy.shevchenko@linux.intel.com>
 <20200217114016.49856-3-andriy.shevchenko@linux.intel.com>
 <20200524171032.GA218301@roeck-us.net> <CAMuHMdXvummZiDBu72WJmdanyP2r4dab8SbVLZaTRNrBfnRmTw@mail.gmail.com>
In-Reply-To: <CAMuHMdXvummZiDBu72WJmdanyP2r4dab8SbVLZaTRNrBfnRmTw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 Jul 2020 13:31:24 +0200
Message-ID: <CAMuHMdUSG4UZ_Dj8Jqof8vaPrLabqZws8RpwZCzcLRLkFCVWmA@mail.gmail.com>
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

On Thu, Jul 2, 2020 at 4:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, May 24, 2020 at 7:11 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On Mon, Feb 17, 2020 at 01:40:12PM +0200, Andy Shevchenko wrote:
> > > In the future we would like to disable power management on the serial devices
> > > used as kernel consoles to avoid weird behaviour in some cases. However,
> > > disabling PM may prevent system to go to deep sleep states, which in its turn
> > > leads to the higher power consumption.
> > >
> > > Tony Lindgren proposed a work around, i.e. allow user to detach such consoles
> > > to make PM working again. In case user wants to see what's going on, it also
> > > provides a mechanism to attach console back.
> > >
> > > Link: https://lists.openwall.net/linux-kernel/2018/09/29/65
> > > Suggested-by: Tony Lindgren <tony@atomide.com>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> > > --- a/drivers/tty/serial/serial_core.c
> > > +++ b/drivers/tty/serial/serial_core.c
> > > @@ -1919,7 +1919,7 @@ static inline bool uart_console_enabled(struct uart_port *port)
> > >   */
> > >  static inline void uart_port_spin_lock_init(struct uart_port *port)
> > >  {
> > > -     if (uart_console_enabled(port))
> > > +     if (uart_console(port))
> >
> > This results in lockdep splashes such as the one attached below. Is there
>
> Or "BUG: spinlock bad magic on CPU#3, swapper/0/1", cfr. [1].
> So far I hadn't noticed that, as the issue only shows up when using the
> legacy way of passing a "console=ttyS*" kernel command line parameter,
> and not when relying on the modern "chosen/stdout-path" DT property.
>
> > any special reason for this change ? It is not really explained in the
> > commit description.
>
> Indeed. Why this change?
>
> I also don't agree with your typical fix for drivers, which is like:
>
>     @@ -567,6 +567,9 @@ static int hv_probe(struct platform_device *op)
>             sunserial_console_match(&sunhv_console, op->dev.of_node,
>                                     &sunhv_reg, port->line, false);
>
>     +       /* We need to initialize lock even for non-registered console */
>     +       spin_lock_init(&port->lock);
>     +
>             err = uart_add_one_port(&sunhv_reg, port);
>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                   calls uart_port_spin_lock_init()
>
>             if (err)
>                     goto out_unregister_driver;
>
> as this initializes the spinlock twice for non-console= ports.

I had a deeper look...

    /*
     * Ensure that the serial console lock is initialised early.
     * If this port is a console, then the spinlock is already initialised.
     */
    static inline void uart_port_spin_lock_init(struct uart_port *port)
    {
            if (uart_console(port))
                    return;

            spin_lock_init(&port->lock);
            lockdep_set_class(&port->lock, &port_lock_key);
    }

So according to the comment, the spinlock is assumed to be already
initialized, as the port is already in use as a console.  Makes sense.
Now, where should it be initialized?
  1. For modern DT systems, chosen/stdout-path is used, and the spinlock
     is initialized in register_earlycon(), just before calling
     register_console(). And everything's fine.

  2. With "console=" (even on DT systems with chosen/stdout-path),
     the serial console must gets registered differently.
     Naively, I assumed that's done in the serial driver, but apparently
     that is no longer the case: the single register_console() call in
     drivers/tty/serial/sh-sci.c is used on legacy SuperH only.
     So we're back to drivers/tty/serial/serial_core.c, which calls
     register_console(), but does so _after_ taking the spinlock:

         uart_add_one_port()
             uart_port_spin_lock_init() /* skips spin_lock_init()! */
             uart_configure_port()
                 spin_lock_irqsave(&port->lock, flags); /* BUG! */
                 register_console())

So who's to blame for _not_ initializing the spinlock?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
