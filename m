Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B29902BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 15:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfHPNSS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 09:18:18 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39789 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfHPNSS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 09:18:18 -0400
Received: by mail-oi1-f193.google.com with SMTP id 16so4765543oiq.6;
        Fri, 16 Aug 2019 06:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xx/lQjnyVEC/T+4LtRKQPAUwCt7vLIOEtgCgS23jvYQ=;
        b=gU2c67S8AGKpc0IVShpMKlsrVsMvr7/XNEw9AOWgchVvKYZMI7AAoCE1Lkver9vQDx
         dNgLW4nzRpcua0OauqLKmUiB7/0lgMI4GCMu+a/jCG2AZRaqyozWHkwQ8mu17GKpg5eO
         oL4WSCDpugwJ5Ce51yv+NRQyC7Irl/CVvt/tlGU9pUye4fQJLx9nCyJduvrNANp0xr1U
         5kWX9clwc3r57zm/TTRmhNHrCll3Liyvr1BEcyh6+c2cfaQpu2L/WBcm738oF48TLyvu
         gY8VnrC49n88qgWe9gHlWyp3HXSIjWuYsVw2At2J/qjqKjadljDJnrvbsjZ8MfBJiH0c
         PKfA==
X-Gm-Message-State: APjAAAUK3M48e73bvlaZC6EKqe2mDEZT5FEbhxlTav3IDqIG+wnUAZhN
        iLi0O/WL1wLsBCB6eyOofaDR3JjkEHTc0BOnUWQ=
X-Google-Smtp-Source: APXvYqyHp5MLPLLOq5qWTv1V3mnwMOTlhAqT3RFxJ4i96GI99bh8rftOheMD2YjojXIBEtS+AhAcLrBBNFDh0Vc+aqo=
X-Received: by 2002:aca:f4ca:: with SMTP id s193mr4737389oih.131.1565961497676;
 Fri, 16 Aug 2019 06:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190807084635.24173-1-geert+renesas@glider.be>
 <20190807084635.24173-4-geert+renesas@glider.be> <20190816131129.eh4jgsdle77kulaq@verge.net.au>
In-Reply-To: <20190816131129.eh4jgsdle77kulaq@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Aug 2019 15:18:06 +0200
Message-ID: <CAMuHMdWVJQ7T06O0Mxj4Zxq9OrMYaVfXyhZSc4_wSi_EbnMohw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clocksource/drivers/ostm: Use unique device name
 instead of ostm
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, Aug 16, 2019 at 3:11 PM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Aug 07, 2019 at 10:46:35AM +0200, Geert Uytterhoeven wrote:
> > Currently all OSTM devices are called "ostm", also in kernel messages.
> >
> > As there can be multiple instances in an SoC, this can confuse the user.
> > Hence construct a unique name from the DT node name, like is done for
> > platform devices.
> >
> > On RSK+RZA1, the boot log changes like:
> >
> >     -clocksource: ostm: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
> >     +clocksource: ostm fcfec000.timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
> >      sched_clock: 32 bits at 33MHz, resolution 30ns, wraps every 64440619504ns
> >     -ostm: used for clocksource
> >     -ostm: used for clock events
> >     +ostm fcfec000.timer: used for clocksource
> >     +ostm fcfec400.timer: used for clock events
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - Make the name format similar to the one used for platform devices,
> >   - Use kasprintf() instead of buffer size guessing,
> >   - Use a real example from rskrza1.
> >
> > v2 (by Jacopo):
> >   - Use np->full_name.
> > ---
> >  drivers/clocksource/renesas-ostm.c | 45 ++++++++++++++++++++----------
> >  1 file changed, 30 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
> > index 1e22e54d7b0df40d..659e3ec7b86714e3 100644
> > --- a/drivers/clocksource/renesas-ostm.c
> > +++ b/drivers/clocksource/renesas-ostm.c

> > @@ -195,22 +195,35 @@ static int __init ostm_init(struct device_node *np)
> >       if (!ostm)
> >               return -ENOMEM;
> >
> > -     ostm->base = of_iomap(np, 0);
> > -     if (!ostm->base) {
> > +     ret = of_address_to_resource(np, 0, &res);
> > +     if (ret) {
> > +             pr_err("ostm: Failed to obtain I/O memory\n");
> > +             goto err_free;
> > +     }
> > +
> > +     ostm->name = kasprintf(GFP_KERNEL, "ostm %llx.%s",
> > +                            (unsigned long long)res.start, np->name);
>
> I'm not sure, but looking at printk-formats.rst it seems that
> %pa[p] as a format specifier for resource_size_t. If so it may
> allow dropping the cast above.

Using "%pa" adds a "0x" prefix, which we don't want here.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
