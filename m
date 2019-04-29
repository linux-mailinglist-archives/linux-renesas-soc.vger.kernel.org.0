Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2556E16B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 13:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbfD2Lgw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 07:36:52 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:54388 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727895AbfD2Lgw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 07:36:52 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 968B5A78;
        Mon, 29 Apr 2019 04:36:51 -0700 (PDT)
Received: from [10.1.196.92] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77AF23F5AF;
        Mon, 29 Apr 2019 04:36:49 -0700 (PDT)
Subject: Re: [PATCH 2/5] irqchip: Add Renesas RZ/A1 Interrupt Controller
 driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
References: <20190429093631.10799-1-geert+renesas@glider.be>
 <20190429093631.10799-3-geert+renesas@glider.be>
 <f9310d4c-8f9e-a837-3ed3-4d7c294efd3f@arm.com>
 <CAMuHMdU3i7vqs9hd7rfvYH8QtqvwUB5vgsa_fwo5L4E3DQ_d1Q@mail.gmail.com>
From:   Marc Zyngier <marc.zyngier@arm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=marc.zyngier@arm.com; prefer-encrypt=mutual; keydata=
 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
Organization: ARM Ltd
Message-ID: <e6c6dfe7-f67d-90a9-eee5-d30b94c7c978@arm.com>
Date:   Mon, 29 Apr 2019 12:36:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU3i7vqs9hd7rfvYH8QtqvwUB5vgsa_fwo5L4E3DQ_d1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 29/04/2019 12:21, Geert Uytterhoeven wrote:
> Hi Marc,
> 
> On Mon, Apr 29, 2019 at 12:07 PM Marc Zyngier <marc.zyngier@arm.com> wrote:
>> On 29/04/2019 10:36, Geert Uytterhoeven wrote:
>>> Add a driver for the Renesas RZ/A1 Interrupt Controller.
>>>
>>> This supports using up to 8 external interrupts on RZ/A1, with
>>> configurable sense select.
>>>
>>> NMI edge select is not yet supported.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>>> --- /dev/null
>>> +++ b/drivers/irqchip/irq-renesas-rza1.c
> 
>>> +static void rza1_irqc_eoi(struct irq_data *d)
>>> +{
>>> +     struct rza1_irqc_priv *priv = irq_data_to_priv(d);
>>> +     unsigned int bit = BIT(irqd_to_hwirq(d));
>>
>> Please use u32 instead of "unsigned int" for something that operates on
>> HW registers.
> 
> Even for 16-bit registers?

Ah, I'm so used to see 32bit accessors everywhere that I missed the fact
that this is a 16bit MMIO. How bizarre! ;-)

In general, try to have types that do match the actual size of the MMIO
access. There are a few exceptions to this rule (using an unsigned long
to be able to use bitmap operations, for example), but that's the
general idea.

> 
>>> +     u16 tmp;
>>> +
>>> +     tmp = readw(priv->base + IRQRR);
>>
>> Same thing here. It's less confusing to use a u32 and mask out the top
>> bits if needed rather than having this implicit cast (applies all over
>> the code).
> 
> ... so yes.

To sum it up:

readw/writew -> u16
readl/writel -> u32

> 
>>
>>> +     if (tmp & bit)
>>> +             writew(GENMASK(IRQC_NUM_IRQ - 1, 0) & ~bit, priv->base + IRQRR);
>>
>> Please use the _relaxed accessors all over the driver, you really do not
>> need a DSB on each of these accesses.
> 
> OK.
> 
>>> +static int rza1_irqc_set_type(struct irq_data *d, unsigned int type)
>>> +{
>>> +     struct rza1_irqc_priv *priv = irq_data_to_priv(d);
>>> +     unsigned int hw_irq = irqd_to_hwirq(d);
>>> +     u16 sense, tmp;
>>> +
>>> +     switch (type & IRQ_TYPE_SENSE_MASK) {
>>> +     case IRQ_TYPE_LEVEL_LOW:
>>> +             sense = ICR1_IRQS_LEVEL_LOW;
>>> +             break;
>>> +
>>> +     case IRQ_TYPE_EDGE_FALLING:
>>> +             sense = ICR1_IRQS_EDGE_FALLING;
>>> +             break;
>>> +
>>> +     case IRQ_TYPE_EDGE_RISING:
>>> +             sense = ICR1_IRQS_EDGE_RISING;
>>> +             break;
>>> +
>>> +     case IRQ_TYPE_EDGE_BOTH:
>>> +             sense = ICR1_IRQS_EDGE_BOTH;
>>> +             break;
>>> +
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     tmp = readw(priv->base + ICR1);
>>> +     tmp &= ~ICR1_IRQS_MASK(hw_irq);
>>> +     tmp |= ICR1_IRQS(hw_irq, sense);
>>> +     writew(tmp, priv->base + ICR1);
>>> +     return 0;
>>
>> Don't you need to propagate the trigger configuration to the parent irqchip?
> 
> No, the line to the parent GIC is always configured for high-level.
> 
>>> +static int rza1_irqc_alloc(struct irq_domain *domain, unsigned int virq,
>>> +                        unsigned int nr_irqs, void *arg)
>>> +{
>>> +     struct rza1_irqc_priv *priv = domain->host_data;
>>> +     struct irq_fwspec *fwspec = arg;
>>> +     struct irq_fwspec spec;
>>> +     int ret;
>>> +
>>> +     ret = irq_domain_set_hwirq_and_chip(domain, virq, fwspec->param[0],
>>> +                                         &priv->chip, priv);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     spec.fwnode = &priv->dev->of_node->fwnode;
>>> +     spec.param_count = 3;
>>> +     spec.param[0] = GIC_SPI;
>>> +     spec.param[1] = priv->gic_spi_base + fwspec->param[0];
>>> +     spec.param[2] = IRQ_TYPE_LEVEL_HIGH;
>>
>> This is related to my earlier question: Does this block turn everything
>> into level interrupts?
> 
> That is my understanding of the hardware:
>   - Low-level interrupts are cleared when input becomes high again,
>   - Rising/falling/both edge interrupts are cleared by reading+writing IRQRR.
> 
> FTR, the Hardware User Manual is available from
> https://www.renesas.com/eu/en/products/microcontrollers-microprocessors/rz/rza/rza1h.html#documents
> (Section 7. Interrupt Controller).

OK, thanks for the detailed explanation.

> 
>>> +static int rza1_irqc_probe(struct platform_device *pdev)
>>> +{
> 
>>> +     priv->chip.name = dev_name(dev);
>>
>> name should normally be used to identify the overall "class" of
> 
> OK, replacing by "rza1-irqc".
> 
>> interrupt. .device is what should be used for the device itself.
> 
> You mean .parent_device?
> Been there, done that: if I fill that in with "dev", it fails with
> 
>     gpio-keys keyboard: Unable to claim irq 41; error -13
>     gpio-keys: probe of keyboard failed with error -13
> 
> due to the call to pm_runtime_get_sync() in irq_chip_pm_get() failing.
> This driver doesn't have (and doesn't need) Runtime PM.

OK, fair enough. Who needs PM anyway? ;-)

> 
>>> +struct rza1_irqc_info rza1_irqc_info = {
>>> +     .gic_spi_base = 0,
>>> +};
>>
>> To answer your question in the cover letter, I'd rather this came from
>> DT. And otherwise, it should be be static.
> 
> (Oops, forget the "static const")
> 
> Using a custom property, or derived from 8 interrupt specifiers in the
> interrupts property?

A custom property is fine by me (everybody does that anyway).

> 
>> It otherwise looks good to me. If you respin it quickly enough, I'm
>> happy to take it for 5.2.
> 
> Thanks, will do tomorrow, so Chris (in NC.US; let's hope he doesn't
> celebrate Golden Week) has a chance to comment...

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
