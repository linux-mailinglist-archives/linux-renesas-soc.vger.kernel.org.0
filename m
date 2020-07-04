Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C425214765
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2020 18:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgGDQdb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Jul 2020 12:33:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:63713 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726632AbgGDQdb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Jul 2020 12:33:31 -0400
IronPort-SDR: Pv9tsCcp2M2sGTgs+kksJz6ux5oTogm456bKfnPOm8BPctP6G2eBKZ1q3JmaEJj/m6gfFuGF1u
 rn0eCtOPaTiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9672"; a="135528397"
X-IronPort-AV: E=Sophos;i="5.75,312,1589266800"; 
   d="scan'208";a="135528397"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2020 09:33:29 -0700
IronPort-SDR: JcaW0l8d38BW7NXI8CxviYAg+AZP+LvbA5bpKIENYOO8/tDLRuUh38a68OO+ulAV7gAOmul2sx
 Ickhn7tyZD0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,312,1589266800"; 
   d="scan'208";a="313553616"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 04 Jul 2020 09:33:27 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jrl6V-00HaGf-Qa; Sat, 04 Jul 2020 19:33:27 +0300
Date:   Sat, 4 Jul 2020 19:33:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Russell King <rmk@arm.linux.org.uk>
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
Message-ID: <20200704163327.GH3703480@smile.fi.intel.com>
References: <20200217114016.49856-1-andriy.shevchenko@linux.intel.com>
 <20200217114016.49856-3-andriy.shevchenko@linux.intel.com>
 <20200524171032.GA218301@roeck-us.net>
 <CAMuHMdXvummZiDBu72WJmdanyP2r4dab8SbVLZaTRNrBfnRmTw@mail.gmail.com>
 <CAMuHMdUSG4UZ_Dj8Jqof8vaPrLabqZws8RpwZCzcLRLkFCVWmA@mail.gmail.com>
 <20200704154326.GG3703480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200704154326.GG3703480@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jul 04, 2020 at 06:43:26PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 03, 2020 at 01:31:24PM +0200, Geert Uytterhoeven wrote:
> > On Thu, Jul 2, 2020 at 4:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Sun, May 24, 2020 at 7:11 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > On Mon, Feb 17, 2020 at 01:40:12PM +0200, Andy Shevchenko wrote:
> > > > > In the future we would like to disable power management on the serial devices
> > > > > used as kernel consoles to avoid weird behaviour in some cases. However,
> > > > > disabling PM may prevent system to go to deep sleep states, which in its turn
> > > > > leads to the higher power consumption.
> > > > >
> > > > > Tony Lindgren proposed a work around, i.e. allow user to detach such consoles
> > > > > to make PM working again. In case user wants to see what's going on, it also
> > > > > provides a mechanism to attach console back.
> > > > >
> > > > > Link: https://lists.openwall.net/linux-kernel/2018/09/29/65
> > > > > Suggested-by: Tony Lindgren <tony@atomide.com>
> > > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > > > --- a/drivers/tty/serial/serial_core.c
> > > > > +++ b/drivers/tty/serial/serial_core.c
> > > > > @@ -1919,7 +1919,7 @@ static inline bool uart_console_enabled(struct uart_port *port)
> > > > >   */
> > > > >  static inline void uart_port_spin_lock_init(struct uart_port *port)
> > > > >  {
> > > > > -     if (uart_console_enabled(port))
> > > > > +     if (uart_console(port))
> > > >
> > > > This results in lockdep splashes such as the one attached below. Is there
> > >
> > > Or "BUG: spinlock bad magic on CPU#3, swapper/0/1", cfr. [1].
> > > So far I hadn't noticed that, as the issue only shows up when using the
> > > legacy way of passing a "console=ttyS*" kernel command line parameter,
> > > and not when relying on the modern "chosen/stdout-path" DT property.
> > >
> > > > any special reason for this change ? It is not really explained in the
> > > > commit description.
> > >
> > > Indeed. Why this change?
> > >
> > > I also don't agree with your typical fix for drivers, which is like:
> > >
> > >     @@ -567,6 +567,9 @@ static int hv_probe(struct platform_device *op)
> > >             sunserial_console_match(&sunhv_console, op->dev.of_node,
> > >                                     &sunhv_reg, port->line, false);
> > >
> > >     +       /* We need to initialize lock even for non-registered console */
> > >     +       spin_lock_init(&port->lock);
> > >     +
> > >             err = uart_add_one_port(&sunhv_reg, port);
> > >                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >                   calls uart_port_spin_lock_init()
> > >
> > >             if (err)
> > >                     goto out_unregister_driver;
> > >
> > > as this initializes the spinlock twice for non-console= ports.
> > 
> > I had a deeper look...
> > 
> >     /*
> >      * Ensure that the serial console lock is initialised early.
> >      * If this port is a console, then the spinlock is already initialised.
> >      */
> >     static inline void uart_port_spin_lock_init(struct uart_port *port)
> >     {
> >             if (uart_console(port))
> >                     return;
> > 
> >             spin_lock_init(&port->lock);
> >             lockdep_set_class(&port->lock, &port_lock_key);
> >     }
> > 
> > So according to the comment, the spinlock is assumed to be already
> > initialized, as the port is already in use as a console.  Makes sense.
> 
> Thanks, Geert! Yes, the change makes code aligned with a comment. I did it due
> to some issues with attaching / detaching consoles (I can try to reproduce
> later, perhaps next week, I'm a bit limited now to fulfil kernel work /
> testing).
> 
> > Now, where should it be initialized?
> >   1. For modern DT systems, chosen/stdout-path is used, and the spinlock
> >      is initialized in register_earlycon(), just before calling
> >      register_console(). And everything's fine.
> > 
> >   2. With "console=" (even on DT systems with chosen/stdout-path),
> >      the serial console must gets registered differently.
> >      Naively, I assumed that's done in the serial driver, but apparently
> >      that is no longer the case: the single register_console() call in
> >      drivers/tty/serial/sh-sci.c is used on legacy SuperH only.
> >      So we're back to drivers/tty/serial/serial_core.c, which calls
> >      register_console(), but does so _after_ taking the spinlock:
> > 
> >          uart_add_one_port()
> >              uart_port_spin_lock_init() /* skips spin_lock_init()! */
> >              uart_configure_port()
> >                  spin_lock_irqsave(&port->lock, flags); /* BUG! */
> >                  register_console())
> > 
> > So who's to blame for _not_ initializing the spinlock?
> 
> This is a very good question. Code is so old and I don't know why we have such
> interesting implementation among serial drivers. The 8250 does this
> initialisation at console_initcall() when it *properly* calls
> register_console() before adding port (yet).
> 
>     /*
>      * If this driver supports console, and it hasn't been
>      * successfully registered yet, try to re-register it.
>      * It may be that the port was not available.
>      */
>     if (port->cons && !(port->cons->flags & CON_ENABLED))
>             register_console(port->cons);
> 
> Seems like a chicken-egg problem. Any advice?

This comment even more interesting...

    /*
     * Ensure that the modem control lines are de-activated.
     * keep the DTR setting that is set in uart_set_options()
     * We probably don't need a spinlock around this, but
     */

Investigation shows that this comes from (see history.git from history group)
commit 33c0d1b0c3ebb61243d9b19ce70d9063acff2aac
Author: Russell King <rmk@arm.linux.org.uk>
Date:   Sun Jul 21 02:39:46 2002 -0700

    [PATCH] Serial driver stuff

According to documentation ->set_mctrl() is called with lock taken. Hmm...

So, removing that spin lock and moving spin lock initialisation call after
uart_configure_port should fix this for all. But I'm not sure we don't break
anything.

From d361b1b35f4e8d318c584f224d67240b775fbe7f Mon Sep 17 00:00:00 2001
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Sat, 4 Jul 2020 19:30:39 +0300
Subject: [PATCH 1/1] serial: core: Drop ambiguous spin lock in
 uart_configure_port()

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/serial_core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 3cc183acf7ba..b4ed1e20dd5c 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -2374,11 +2374,8 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 		/*
 		 * Ensure that the modem control lines are de-activated.
 		 * keep the DTR setting that is set in uart_set_options()
-		 * We probably don't need a spinlock around this, but
 		 */
-		spin_lock_irqsave(&port->lock, flags);
 		port->ops->set_mctrl(port, port->mctrl & TIOCM_DTR);
-		spin_unlock_irqrestore(&port->lock, flags);
 
 		/*
 		 * If this driver supports console, and it hasn't been
@@ -2886,8 +2883,6 @@ int uart_add_one_port(struct uart_driver *drv, struct uart_port *uport)
 		goto out;
 	}
 
-	uart_port_spin_lock_init(uport);
-
 	if (uport->cons && uport->dev)
 		of_console_check(uport->dev->of_node, uport->cons->name, uport->line);
 
@@ -2896,6 +2891,8 @@ int uart_add_one_port(struct uart_driver *drv, struct uart_port *uport)
 
 	port->console = uart_console(uport);
 
+	uart_port_spin_lock_init(uport);
+
 	num_groups = 2;
 	if (uport->attr_group)
 		num_groups++;

-- 
With Best Regards,
Andy Shevchenko


