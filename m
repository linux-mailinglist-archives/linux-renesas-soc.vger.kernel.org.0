Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69AD6212D2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2020 21:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgGBTf5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Jul 2020 15:35:57 -0400
Received: from muru.com ([72.249.23.125]:60514 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbgGBTf4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 15:35:56 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 049398062;
        Thu,  2 Jul 2020 19:36:48 +0000 (UTC)
Date:   Thu, 2 Jul 2020 12:35:53 -0700
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
Message-ID: <20200702193553.GN53169@atomide.com>
References: <20200217114016.49856-1-andriy.shevchenko@linux.intel.com>
 <20200217114016.49856-3-andriy.shevchenko@linux.intel.com>
 <20200524171032.GA218301@roeck-us.net>
 <CAMuHMdXvummZiDBu72WJmdanyP2r4dab8SbVLZaTRNrBfnRmTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXvummZiDBu72WJmdanyP2r4dab8SbVLZaTRNrBfnRmTw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

* Geert Uytterhoeven <geert@linux-m68k.org> [200702 14:50]:
> On Sun, May 24, 2020 at 7:11 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > any special reason for this change ? It is not really explained in the
> > commit description.
> 
> Indeed. Why this change?

For a kernel console, we want it to work for important oopses
etc without trying to enable DMA or power on regulators for example.

And we want to get rid of pm_runtime_irq_safe() usage as that takes
a permanent usage count on the parent device. This causes issue where
uart can keep an interconnect instance from idling with let's say
genpd :)

Also, we cannot easily make the serial driver PM runtime generic
without removing the pm_runtime_irq_safe() dependency as it would
currently wrongly impose the same nasty dependency to all the serial
drivers.

So when a kernel console is attached, we want to keep it from idling.

For PM related testing, just detaching kernel console and configuring
it's autosuspend timeout works nicely with dmesg -w. Or actually in
that case using pstore console is even better.

Andy has a series pending for generic serial PM runtime support,
I guess he's going to be posting it as soon as the pending regressions
are dealt with.

Regards,

Tony
