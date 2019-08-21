Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91C0A97C30
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 16:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729059AbfHUOMM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 10:12:12 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:50710 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729045AbfHUOMM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 10:12:12 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 04B9B25AEB1;
        Thu, 22 Aug 2019 00:12:10 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E30999405AE; Wed, 21 Aug 2019 16:12:07 +0200 (CEST)
Date:   Wed, 21 Aug 2019 16:12:07 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] clocksource/drivers/ostm: Use unique device name
 instead of ostm
Message-ID: <20190821141207.wpjodltdidgr5lir@verge.net.au>
References: <20190807084635.24173-1-geert+renesas@glider.be>
 <20190807084635.24173-4-geert+renesas@glider.be>
 <20190816131129.eh4jgsdle77kulaq@verge.net.au>
 <CAMuHMdWVJQ7T06O0Mxj4Zxq9OrMYaVfXyhZSc4_wSi_EbnMohw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWVJQ7T06O0Mxj4Zxq9OrMYaVfXyhZSc4_wSi_EbnMohw@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 16, 2019 at 03:18:06PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Aug 16, 2019 at 3:11 PM Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Aug 07, 2019 at 10:46:35AM +0200, Geert Uytterhoeven wrote:
> > > Currently all OSTM devices are called "ostm", also in kernel messages.
> > >
> > > As there can be multiple instances in an SoC, this can confuse the user.
> > > Hence construct a unique name from the DT node name, like is done for
> > > platform devices.
> > >
> > > On RSK+RZA1, the boot log changes like:
> > >
> > >     -clocksource: ostm: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
> > >     +clocksource: ostm fcfec000.timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
> > >      sched_clock: 32 bits at 33MHz, resolution 30ns, wraps every 64440619504ns
> > >     -ostm: used for clocksource
> > >     -ostm: used for clock events
> > >     +ostm fcfec000.timer: used for clocksource
> > >     +ostm fcfec400.timer: used for clock events
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v3:
> > >   - Make the name format similar to the one used for platform devices,
> > >   - Use kasprintf() instead of buffer size guessing,
> > >   - Use a real example from rskrza1.
> > >
> > > v2 (by Jacopo):
> > >   - Use np->full_name.
> > > ---
> > >  drivers/clocksource/renesas-ostm.c | 45 ++++++++++++++++++++----------
> > >  1 file changed, 30 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
> > > index 1e22e54d7b0df40d..659e3ec7b86714e3 100644
> > > --- a/drivers/clocksource/renesas-ostm.c
> > > +++ b/drivers/clocksource/renesas-ostm.c
> 
> > > @@ -195,22 +195,35 @@ static int __init ostm_init(struct device_node *np)
> > >       if (!ostm)
> > >               return -ENOMEM;
> > >
> > > -     ostm->base = of_iomap(np, 0);
> > > -     if (!ostm->base) {
> > > +     ret = of_address_to_resource(np, 0, &res);
> > > +     if (ret) {
> > > +             pr_err("ostm: Failed to obtain I/O memory\n");
> > > +             goto err_free;
> > > +     }
> > > +
> > > +     ostm->name = kasprintf(GFP_KERNEL, "ostm %llx.%s",
> > > +                            (unsigned long long)res.start, np->name);
> >
> > I'm not sure, but looking at printk-formats.rst it seems that
> > %pa[p] as a format specifier for resource_size_t. If so it may
> > allow dropping the cast above.
> 
> Using "%pa" adds a "0x" prefix, which we don't want here.

Thanks, got it.
