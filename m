Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD114E132
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 13:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbfD2LVw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 07:21:52 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:38258 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbfD2LVw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 07:21:52 -0400
Received: by mail-vs1-f68.google.com with SMTP id s2so5652002vsi.5;
        Mon, 29 Apr 2019 04:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mdvxW3096oymhhLijkYwlB+4ZsQ9bTDeYLFTkhhoWT4=;
        b=Tz3mQopzxzwISpRkwz0O/IGw2FboxKSicIVwlbRyD8v2H6Oita7Y0CcJdb41dmDs7X
         2KpBbByf74KDVBKv+4lIh4RA3XAGLhvn8XIB045U4zJ23QWsG4BnEjw56S5yL/kJmAjS
         mXJeqdM7vRwtFhztFZwFmR15YIp3APxVlieTsr1BqrKe3Mi26IJFBaBBgyt19BcVjHit
         cVXO2MVqx18mqRhDN+MHSyCnOIZtOAg1A87p8Rdb16X2hz/jH8R3a/jkbSj8MPuLaGd8
         4s5BSiBh3DyZLrWSeq9elnNRk+2t2QUfCtKd4eYO2MxLZE0zw+YhuFV7o8WQClEGlW57
         0DhQ==
X-Gm-Message-State: APjAAAXCNgq4kSR2wwl4kmY1SNnezSXSXFuZWmvT43EfALv/I/kEMPX/
        L2Xx1XzUTMhmvcSSTQfkbCQEmiKP/XUcfZT5mIxbsA==
X-Google-Smtp-Source: APXvYqyBLXSgSzeSFGA+lrmZZStSQTkiEmGbyjDT4Q0RIadeIyRRYGNKYbjzOh25Yufe+6cvuTi49VY2gzPeSrKnTo8=
X-Received: by 2002:a05:6102:113:: with SMTP id z19mr1491142vsq.166.1556536911181;
 Mon, 29 Apr 2019 04:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190429093631.10799-1-geert+renesas@glider.be>
 <20190429093631.10799-3-geert+renesas@glider.be> <f9310d4c-8f9e-a837-3ed3-4d7c294efd3f@arm.com>
In-Reply-To: <f9310d4c-8f9e-a837-3ed3-4d7c294efd3f@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Apr 2019 13:21:39 +0200
Message-ID: <CAMuHMdU3i7vqs9hd7rfvYH8QtqvwUB5vgsa_fwo5L4E3DQ_d1Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] irqchip: Add Renesas RZ/A1 Interrupt Controller driver
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marc,

On Mon, Apr 29, 2019 at 12:07 PM Marc Zyngier <marc.zyngier@arm.com> wrote:
> On 29/04/2019 10:36, Geert Uytterhoeven wrote:
> > Add a driver for the Renesas RZ/A1 Interrupt Controller.
> >
> > This supports using up to 8 external interrupts on RZ/A1, with
> > configurable sense select.
> >
> > NMI edge select is not yet supported.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- /dev/null
> > +++ b/drivers/irqchip/irq-renesas-rza1.c

> > +static void rza1_irqc_eoi(struct irq_data *d)
> > +{
> > +     struct rza1_irqc_priv *priv = irq_data_to_priv(d);
> > +     unsigned int bit = BIT(irqd_to_hwirq(d));
>
> Please use u32 instead of "unsigned int" for something that operates on
> HW registers.

Even for 16-bit registers?

> > +     u16 tmp;
> > +
> > +     tmp = readw(priv->base + IRQRR);
>
> Same thing here. It's less confusing to use a u32 and mask out the top
> bits if needed rather than having this implicit cast (applies all over
> the code).

... so yes.

>
> > +     if (tmp & bit)
> > +             writew(GENMASK(IRQC_NUM_IRQ - 1, 0) & ~bit, priv->base + IRQRR);
>
> Please use the _relaxed accessors all over the driver, you really do not
> need a DSB on each of these accesses.

OK.

> > +static int rza1_irqc_set_type(struct irq_data *d, unsigned int type)
> > +{
> > +     struct rza1_irqc_priv *priv = irq_data_to_priv(d);
> > +     unsigned int hw_irq = irqd_to_hwirq(d);
> > +     u16 sense, tmp;
> > +
> > +     switch (type & IRQ_TYPE_SENSE_MASK) {
> > +     case IRQ_TYPE_LEVEL_LOW:
> > +             sense = ICR1_IRQS_LEVEL_LOW;
> > +             break;
> > +
> > +     case IRQ_TYPE_EDGE_FALLING:
> > +             sense = ICR1_IRQS_EDGE_FALLING;
> > +             break;
> > +
> > +     case IRQ_TYPE_EDGE_RISING:
> > +             sense = ICR1_IRQS_EDGE_RISING;
> > +             break;
> > +
> > +     case IRQ_TYPE_EDGE_BOTH:
> > +             sense = ICR1_IRQS_EDGE_BOTH;
> > +             break;
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     tmp = readw(priv->base + ICR1);
> > +     tmp &= ~ICR1_IRQS_MASK(hw_irq);
> > +     tmp |= ICR1_IRQS(hw_irq, sense);
> > +     writew(tmp, priv->base + ICR1);
> > +     return 0;
>
> Don't you need to propagate the trigger configuration to the parent irqchip?

No, the line to the parent GIC is always configured for high-level.

> > +static int rza1_irqc_alloc(struct irq_domain *domain, unsigned int virq,
> > +                        unsigned int nr_irqs, void *arg)
> > +{
> > +     struct rza1_irqc_priv *priv = domain->host_data;
> > +     struct irq_fwspec *fwspec = arg;
> > +     struct irq_fwspec spec;
> > +     int ret;
> > +
> > +     ret = irq_domain_set_hwirq_and_chip(domain, virq, fwspec->param[0],
> > +                                         &priv->chip, priv);
> > +     if (ret)
> > +             return ret;
> > +
> > +     spec.fwnode = &priv->dev->of_node->fwnode;
> > +     spec.param_count = 3;
> > +     spec.param[0] = GIC_SPI;
> > +     spec.param[1] = priv->gic_spi_base + fwspec->param[0];
> > +     spec.param[2] = IRQ_TYPE_LEVEL_HIGH;
>
> This is related to my earlier question: Does this block turn everything
> into level interrupts?

That is my understanding of the hardware:
  - Low-level interrupts are cleared when input becomes high again,
  - Rising/falling/both edge interrupts are cleared by reading+writing IRQRR.

FTR, the Hardware User Manual is available from
https://www.renesas.com/eu/en/products/microcontrollers-microprocessors/rz/rza/rza1h.html#documents
(Section 7. Interrupt Controller).

> > +static int rza1_irqc_probe(struct platform_device *pdev)
> > +{

> > +     priv->chip.name = dev_name(dev);
>
> name should normally be used to identify the overall "class" of

OK, replacing by "rza1-irqc".

> interrupt. .device is what should be used for the device itself.

You mean .parent_device?
Been there, done that: if I fill that in with "dev", it fails with

    gpio-keys keyboard: Unable to claim irq 41; error -13
    gpio-keys: probe of keyboard failed with error -13

due to the call to pm_runtime_get_sync() in irq_chip_pm_get() failing.
This driver doesn't have (and doesn't need) Runtime PM.

> > +struct rza1_irqc_info rza1_irqc_info = {
> > +     .gic_spi_base = 0,
> > +};
>
> To answer your question in the cover letter, I'd rather this came from
> DT. And otherwise, it should be be static.

(Oops, forget the "static const")

Using a custom property, or derived from 8 interrupt specifiers in the
interrupts property?

> It otherwise looks good to me. If you respin it quickly enough, I'm
> happy to take it for 5.2.

Thanks, will do tomorrow, so Chris (in NC.US; let's hope he doesn't
celebrate Golden Week) has a chance to comment...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
