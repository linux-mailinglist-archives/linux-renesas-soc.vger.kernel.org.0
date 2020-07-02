Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70234212DF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2020 22:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgGBUjN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Jul 2020 16:39:13 -0400
Received: from muru.com ([72.249.23.125]:60534 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgGBUjN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 16:39:13 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C80958062;
        Thu,  2 Jul 2020 20:40:05 +0000 (UTC)
Date:   Thu, 2 Jul 2020 13:39:10 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] serial: core: Allow detach and attach serial
 device for console
Message-ID: <20200702203910.GO53169@atomide.com>
References: <20200217114016.49856-1-andriy.shevchenko@linux.intel.com>
 <20200217114016.49856-3-andriy.shevchenko@linux.intel.com>
 <20200524171032.GA218301@roeck-us.net>
 <CAMuHMdXvummZiDBu72WJmdanyP2r4dab8SbVLZaTRNrBfnRmTw@mail.gmail.com>
 <20200702193553.GN53169@atomide.com>
 <CAMuHMdUn5MK6tTd6ohFxa=K9NNHRbDp9P7gvPD52fCp2OsLnYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUn5MK6tTd6ohFxa=K9NNHRbDp9P7gvPD52fCp2OsLnYA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

* Geert Uytterhoeven <geert@linux-m68k.org> [200702 20:04]:
> Hi Tony,
> 
> On Thu, Jul 2, 2020 at 9:35 PM Tony Lindgren <tony@atomide.com> wrote:
> > * Geert Uytterhoeven <geert@linux-m68k.org> [200702 14:50]:
> > > On Sun, May 24, 2020 at 7:11 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > any special reason for this change ? It is not really explained in the
> > > > commit description.
> > >
> > > Indeed. Why this change?
> >
> > For a kernel console, we want it to work for important oopses
> > etc without trying to enable DMA or power on regulators for example.
> 
> [...]
> 
> Thanks for the explanation about irqsafe consoles!
> I think I cannot disagree with that ;-)

You're welcome..

> Sorry for being a bit unclear, but my question (and I guess Günter's
> question, too) was about this particular change:
> 
>      static inline void uart_port_spin_lock_init(struct uart_port *port)
>      {
>     -     if (uart_console_enabled(port))
>     +     if (uart_console(port))
> 
> This change seems to be completely unrelated, is not explained in the
> commit description, and is the cause of the regression we're seeing.

..sorry looks I missed the context a bit then :) Hmm yeah not sure about
this change above.

Regards,

Tony
