Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20224611F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Nov 2021 11:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbhK2KVa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Nov 2021 05:21:30 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:41868 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234650AbhK2KTa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 05:19:30 -0500
Received: by mail-ua1-f42.google.com with SMTP id p37so32824699uae.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Nov 2021 02:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ApfswTLClXd7P1vfPysclDhxAh5BJExQ1LUH6zQE/1E=;
        b=3cGchA1/fTeflKxUqwORrPiQY+EN3RJLdfsCjsMUwxa4TuhJ11YHqtJ6HERr2VAe3j
         EZdvyPYyNgH/al/fW6ktzz7g2frBPoGQ/0cEkZi+LsnSOvhMeSmZgGklzCAaOc4TsC+p
         2mA3gHjFTtCkad+9UF2YGqIKWlgg4H9mgSb5pCyiQsLhHFOFVkoP/mqdpVNE0tolNwgj
         sZD3te7R9pRPeeRPLm+VxBwgMbhN+oxeNuuXBeit+a3lOdt8Q68ioTdwyCYLuMQxWzxL
         duaWhEqsWTjQ0FeF0n1tM66FoAg8nPZL6UOTjs6J9/fg6vVQlE2QbO1BdqewWtEhlOcZ
         nCtA==
X-Gm-Message-State: AOAM5322bu8mIz0WyEcLtUXA2TS/Gx3jbC3lFAYCkDTzlSrlEL3oOPzC
        mR5qvjx5Mkp919PP0L7Vt71+jEwK2uAtsg==
X-Google-Smtp-Source: ABdhPJxEHolXbCCn/uqNc1sZbIU1XG9ouWpRhZFWE8FWeSTyWCkW5YaiLMs4LCHLwkoaau4WNBn/Bw==
X-Received: by 2002:a67:6783:: with SMTP id b125mr30239036vsc.81.1638180972093;
        Mon, 29 Nov 2021 02:16:12 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id g16sm7859707vsp.18.2021.11.29.02.16.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 02:16:11 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id t13so32835738uad.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Nov 2021 02:16:11 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id o16mr30760064vst.5.1638180970757;
 Mon, 29 Nov 2021 02:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-4-biju.das.jz@bp.renesas.com> <c4869451-e879-aa58-29ba-ef3e94b03527@linaro.org>
 <OS0PR01MB592240481D7503FFC505BD5E86669@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592240481D7503FFC505BD5E86669@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Nov 2021 11:15:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE3A0WwhGYpVK52S0C5xMqccpvHp0hHdnqq3aawzb7DQ@mail.gmail.com>
Message-ID: <CAMuHMdUE3A0WwhGYpVK52S0C5xMqccpvHp0hHdnqq3aawzb7DQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM support
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju, Daniel,

On Mon, Nov 29, 2021 at 11:06 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L
> > OSTM support
> >
> > On 12/11/2021 19:44, Biju Das wrote:
> > > RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> > > deassert the reset line before accessing any registers.
> > >
> > > This patch adds an entry point for RZ/G2L so that we can deassert the
> > > reset line in probe callback.
> >
> > What is the connection between adding the reset line control and the
> > platform driver at the end of the driver ?
>
> The original driver has no arm architecture timer, so it needs to be

s/driver/SoC used with this driver/

> called very early in the boot and using of calls for handling the clocks.

Hence must be handled by TIMER_OF_DECLARE().

> Where as RZ/G2L has arm architecture timer and it needs to release the module
> Reset before accessing any registers. So it has to be built in and it needs cpg driver
> which happens at later stage compared to the original case, for de-asserting the reset.
>
> Geert, please correct me if I am wrong.

The reset driver is not available yet at TIMER_OF_DECLARE() time,
so of_reset_control_get_optional_exclusive() returns -EPROBE_DEFER
on RZ/G2L.  Fortunately there is no need to have this timer available
early on RZ/G2L, as it uses the arm architecture timer as the main
clock source.  Still, to be available at all, the platform driver
is needed to support re-probing after the reset driver has become
available.


> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > v2->v3:
> > >  * Added reset_control_put() on error path.
> > >  * enabled suppress_bind_attrs in ostm_device_driver structure
> > > v1->v2:
> > >  * Added reset handling inside ostm_init
> > >  * Used same compatible for builtin driver aswell
> > > ---
> > >  drivers/clocksource/renesas-ostm.c | 39
> > > +++++++++++++++++++++++++++++-
> > >  1 file changed, 38 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clocksource/renesas-ostm.c
> > > b/drivers/clocksource/renesas-ostm.c
> > > index 3d06ba66008c..21d1392637b8 100644
> > > --- a/drivers/clocksource/renesas-ostm.c
> > > +++ b/drivers/clocksource/renesas-ostm.c
> > > @@ -9,6 +9,8 @@
> > >  #include <linux/clk.h>
> > >  #include <linux/clockchips.h>
> > >  #include <linux/interrupt.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/reset.h>
> > >  #include <linux/sched_clock.h>
> > >  #include <linux/slab.h>
> > >
> > > @@ -159,6 +161,7 @@ static int __init ostm_init_clkevt(struct timer_of
> > > *to)
> > >
> > >  static int __init ostm_init(struct device_node *np)  {
> > > +   struct reset_control *rstc;
> > >     struct timer_of *to;
> > >     int ret;
> > >
> > > @@ -166,6 +169,14 @@ static int __init ostm_init(struct device_node *np)
> > >     if (!to)
> > >             return -ENOMEM;
> > >
> > > +   rstc = of_reset_control_get_optional_exclusive(np, NULL);
> > > +   if (IS_ERR(rstc)) {
> > > +           ret = PTR_ERR(rstc);
> > > +           goto err_free;
> > > +   }
> > > +
> > > +   reset_control_deassert(rstc);
> > > +
> > >     to->flags = TIMER_OF_BASE | TIMER_OF_CLOCK;
> > >     if (system_clock) {
> > >             /*
> > > @@ -178,7 +189,7 @@ static int __init ostm_init(struct device_node
> > > *np)
> > >
> > >     ret = timer_of_init(np, to);
> > >     if (ret)
> > > -           goto err_free;
> > > +           goto err_reset;
> > >
> > >     /*
> > >      * First probed device will be used as system clocksource. Any @@
> > > -203,9 +214,35 @@ static int __init ostm_init(struct device_node *np)
> > >
> > >  err_cleanup:
> > >     timer_of_cleanup(to);
> > > +err_reset:
> > > +   reset_control_assert(rstc);
> > > +   reset_control_put(rstc);
> > >  err_free:
> > >     kfree(to);
> > >     return ret;
> > >  }
> > >
> > >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> > > +
> > > +#ifdef CONFIG_ARCH_R9A07G044
> > > +static int __init ostm_probe(struct platform_device *pdev) {
> > > +   struct device *dev = &pdev->dev;
> > > +
> > > +   return ostm_init(dev->of_node);
> > > +}
> > > +
> > > +static const struct of_device_id ostm_of_table[] = {
> > > +   { .compatible = "renesas,ostm", },
> > > +   { /* sentinel */ }
> > > +};
> > > +
> > > +static struct platform_driver ostm_device_driver = {
> > > +   .driver = {
> > > +           .name = "renesas_ostm",
> > > +           .of_match_table = of_match_ptr(ostm_of_table),
> > > +           .suppress_bind_attrs = true,
> > > +   },
> > > +};
> > > +builtin_platform_driver_probe(ostm_device_driver, ostm_probe); #endif

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
