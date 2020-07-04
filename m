Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD222146FE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2020 17:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgGDPnb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Jul 2020 11:43:31 -0400
Received: from mga17.intel.com ([192.55.52.151]:1800 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726405AbgGDPn3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Jul 2020 11:43:29 -0400
IronPort-SDR: oi6M9obSKre6GvD4EF6pCjSli8NOnK0/6NzDniUwh0EF4vI/1bSt7xogd2KKRAjJ2uzfEUZqp6
 VDTBdoTAUSIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9672"; a="127342672"
X-IronPort-AV: E=Sophos;i="5.75,312,1589266800"; 
   d="scan'208";a="127342672"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2020 08:43:28 -0700
IronPort-SDR: MAZ0xP3vUfi9MZMMEjm5bfDIET10U//0KH2tb7+fL+c3zgf2Oe+622pksYJN3BZSYEc3veQ6l8
 qeXG4hoQfI3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,312,1589266800"; 
   d="scan'208";a="426624084"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 04 Jul 2020 08:43:26 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jrkK6-00HZtZ-Ok; Sat, 04 Jul 2020 18:43:26 +0300
Date:   Sat, 4 Jul 2020 18:43:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] serial: core: Allow detach and attach serial
 device for console
Message-ID: <20200704154326.GG3703480@smile.fi.intel.com>
References: <20200217114016.49856-1-andriy.shevchenko@linux.intel.com>
 <20200217114016.49856-3-andriy.shevchenko@linux.intel.com>
 <20200524171032.GA218301@roeck-us.net>
 <CAMuHMdXvummZiDBu72WJmdanyP2r4dab8SbVLZaTRNrBfnRmTw@mail.gmail.com>
 <CAMuHMdUSG4UZ_Dj8Jqof8vaPrLabqZws8RpwZCzcLRLkFCVWmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUSG4UZ_Dj8Jqof8vaPrLabqZws8RpwZCzcLRLkFCVWmA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 03, 2020 at 01:31:24PM +0200, Geert Uytterhoeven wrote:
> On Thu, Jul 2, 2020 at 4:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, May 24, 2020 at 7:11 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > On Mon, Feb 17, 2020 at 01:40:12PM +0200, Andy Shevchenko wrote:
> > > > In the future we would like to disable power management on the serial devices
> > > > used as kernel consoles to avoid weird behaviour in some cases. However,
> > > > disabling PM may prevent system to go to deep sleep states, which in its turn
> > > > leads to the higher power consumption.
> > > >
> > > > Tony Lindgren proposed a work around, i.e. allow user to detach such consoles
> > > > to make PM working again. In case user wants to see what's going on, it also
> > > > provides a mechanism to attach console back.
> > > >
> > > > Link: https://lists.openwall.net/linux-kernel/2018/09/29/65
> > > > Suggested-by: Tony Lindgren <tony@atomide.com>
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > > > --- a/drivers/tty/serial/serial_core.c
> > > > +++ b/drivers/tty/serial/serial_core.c
> > > > @@ -1919,7 +1919,7 @@ static inline bool uart_console_enabled(struct uart_port *port)
> > > >   */
> > > >  static inline void uart_port_spin_lock_init(struct uart_port *port)
> > > >  {
> > > > -     if (uart_console_enabled(port))
> > > > +     if (uart_console(port))
> > >
> > > This results in lockdep splashes such as the one attached below. Is there
> >
> > Or "BUG: spinlock bad magic on CPU#3, swapper/0/1", cfr. [1].
> > So far I hadn't noticed that, as the issue only shows up when using the
> > legacy way of passing a "console=ttyS*" kernel command line parameter,
> > and not when relying on the modern "chosen/stdout-path" DT property.
> >
> > > any special reason for this change ? It is not really explained in the
> > > commit description.
> >
> > Indeed. Why this change?
> >
> > I also don't agree with your typical fix for drivers, which is like:
> >
> >     @@ -567,6 +567,9 @@ static int hv_probe(struct platform_device *op)
> >             sunserial_console_match(&sunhv_console, op->dev.of_node,
> >                                     &sunhv_reg, port->line, false);
> >
> >     +       /* We need to initialize lock even for non-registered console */
> >     +       spin_lock_init(&port->lock);
> >     +
> >             err = uart_add_one_port(&sunhv_reg, port);
> >                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >                   calls uart_port_spin_lock_init()
> >
> >             if (err)
> >                     goto out_unregister_driver;
> >
> > as this initializes the spinlock twice for non-console= ports.
> 
> I had a deeper look...
> 
>     /*
>      * Ensure that the serial console lock is initialised early.
>      * If this port is a console, then the spinlock is already initialised.
>      */
>     static inline void uart_port_spin_lock_init(struct uart_port *port)
>     {
>             if (uart_console(port))
>                     return;
> 
>             spin_lock_init(&port->lock);
>             lockdep_set_class(&port->lock, &port_lock_key);
>     }
> 
> So according to the comment, the spinlock is assumed to be already
> initialized, as the port is already in use as a console.  Makes sense.

Thanks, Geert! Yes, the change makes code aligned with a comment. I did it due
to some issues with attaching / detaching consoles (I can try to reproduce
later, perhaps next week, I'm a bit limited now to fulfil kernel work /
testing).

> Now, where should it be initialized?
>   1. For modern DT systems, chosen/stdout-path is used, and the spinlock
>      is initialized in register_earlycon(), just before calling
>      register_console(). And everything's fine.
> 
>   2. With "console=" (even on DT systems with chosen/stdout-path),
>      the serial console must gets registered differently.
>      Naively, I assumed that's done in the serial driver, but apparently
>      that is no longer the case: the single register_console() call in
>      drivers/tty/serial/sh-sci.c is used on legacy SuperH only.
>      So we're back to drivers/tty/serial/serial_core.c, which calls
>      register_console(), but does so _after_ taking the spinlock:
> 
>          uart_add_one_port()
>              uart_port_spin_lock_init() /* skips spin_lock_init()! */
>              uart_configure_port()
>                  spin_lock_irqsave(&port->lock, flags); /* BUG! */
>                  register_console())
> 
> So who's to blame for _not_ initializing the spinlock?

This is a very good question. Code is so old and I don't know why we have such
interesting implementation among serial drivers. The 8250 does this
initialisation at console_initcall() when it *properly* calls
register_console() before adding port (yet).

    /*
     * If this driver supports console, and it hasn't been
     * successfully registered yet, try to re-register it.
     * It may be that the port was not available.
     */
    if (port->cons && !(port->cons->flags & CON_ENABLED))
            register_console(port->cons);

Seems like a chicken-egg problem. Any advice?

-- 
With Best Regards,
Andy Shevchenko


