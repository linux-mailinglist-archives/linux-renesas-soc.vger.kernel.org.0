Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7DE812052
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2019 18:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfEBQeO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 May 2019 12:34:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:54666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbfEBQeO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 May 2019 12:34:14 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 817932089E;
        Thu,  2 May 2019 16:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556814852;
        bh=eMiYeQXXUxvfQ7LJ0EIgH3LMmW2c0/4ABzHSnxGM3ps=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kpqw9Y7NEZtlx9iAni0FvKOMvVRDphwUxSOt+H6NNG9Q81d/IgVVBVJr/5y8I5wD0
         dYEM+w1++XaPTtqgPYR9z02wGrkH6etYDS1wWEPYIZ4In5fKpjO14Ynl2HO8Vw0u2S
         a+3H1YLx0kxZvCvRDoW+cO5bA5r/4L1fIzxmsQAw=
Received: by mail-qt1-f182.google.com with SMTP id c13so3215084qtn.8;
        Thu, 02 May 2019 09:34:12 -0700 (PDT)
X-Gm-Message-State: APjAAAW0rY9KodRFhW3yNDVkZPIa0jkA0ZJV2ELv62qnHhO57+Lia9fJ
        Vs3qKHgYbJz/YH/W8Fb/XkNJhV1LGmvDbC0FeQ==
X-Google-Smtp-Source: APXvYqwQy5Ht0iZ+rzBKCl+A98xklqo+dp3TSfwhB+GoSQkgV/kmLxoJg+GUz9Aeek4oStROPvxQd/lh8eKTIXqVbxQ=
X-Received: by 2002:aed:3f6b:: with SMTP id q40mr4069583qtf.26.1556814851750;
 Thu, 02 May 2019 09:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190430121254.3737-1-geert+renesas@glider.be>
 <20190430121254.3737-2-geert+renesas@glider.be> <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
 <29e95406-b9fb-fbb6-9240-c3914d885e88@arm.com> <CAL_Jsq+FJDdka9BMcXvGveBHiUf=YUU=3gz3e2wxjtXZ+K+NEA@mail.gmail.com>
 <506a3763-62c4-6381-c0d2-d5c5ecacd333@arm.com>
In-Reply-To: <506a3763-62c4-6381-c0d2-d5c5ecacd333@arm.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 2 May 2019 11:33:59 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+G-X05RhKmN+U=OYJcc4_0BmxkgFoPiYfBsSFo8QdZ_g@mail.gmail.com>
Message-ID: <CAL_Jsq+G-X05RhKmN+U=OYJcc4_0BmxkgFoPiYfBsSFo8QdZ_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/A1 Interrupt Controller
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 2, 2019 at 9:02 AM Marc Zyngier <marc.zyngier@arm.com> wrote:
>
> On 30/04/2019 21:25, Rob Herring wrote:
> > On Tue, Apr 30, 2019 at 10:34 AM Marc Zyngier <marc.zyngier@arm.com> wrote:
> >>
> >> On 30/04/2019 16:02, Rob Herring wrote:
> >>> On Tue, Apr 30, 2019 at 7:13 AM Geert Uytterhoeven
> >>> <geert+renesas@glider.be> wrote:
> >>>>
> >>>> Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
> >>>>
> >>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>> ---
> >>>> v2:
> >>>>   - Add "renesas,gic-spi-base",
> >>>>   - Document RZ/A2M.
> >>>> ---
> >>>>  .../renesas,rza1-irqc.txt                     | 30 +++++++++++++++++++
> >>>>  1 file changed, 30 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> >>>> new file mode 100644
> >>>> index 0000000000000000..ea8ddb6955338ccd
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> >>>> @@ -0,0 +1,30 @@
> >>>> +DT bindings for the Renesas RZ/A1 Interrupt Controller
> >>>> +
> >>>> +The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
> >>>> +RZ/A1 and RZ/A2 SoCs:
> >>>> +  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
> >>>> +    interrupts,
> >>>> +  - NMI edge select.
> >>>> +
> >>>> +Required properties:
> >>>> +  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
> >>>> +               fallback.
> >>>> +               Examples with soctypes are:
> >>>> +                 - "renesas,r7s72100-irqc" (RZ/A1H)
> >>>> +                 - "renesas,r7s9210-irqc" (RZ/A2M)
> >>>> +  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
> >>>> +                                in interrupts.txt in this directory)
> >>>> +  - interrupt-controller: Marks the device as an interrupt controller
> >>>> +  - reg: Base address and length of the memory resource used by the interrupt
> >>>> +         controller
> >>>> +  - renesas,gic-spi-base: Lowest GIC SPI interrupt number this block maps to.
> >>>
> >>> Why isn't this just an 'interrupts' property?
> >>
> >> That's likely because of kernel limitations. The DT code does an
> >> of_populate() on any device that it finds, parse the "interrupts"
> >> propertiy, resulting in the irq_descs being populated.
> >>
> >> That creates havoc, as these interrupts are not for this device, but for
> >> something that is connected to it. This is merely a bridge of some sort.
> >
> > 'interrupt-map' would avoid that problem I think.
>
> I'm afraid it doesn't scale at all. Case in point, the GICv3 ITS. Up to
> 32bit worth of IDs. How do you represent that using an interrupt-map?
> Agreed, that's the extreme case, but representing more than a handful of
> interrupts using an interrupt-map is a pain.

Neither does a "parent's irq base" property scale. It works well if
you have a single linear range, but not any other case. So there's can
something scale to any possible mapping and can we express simple
cases in a compact form. Essentially we need to express the mapping
for a range of irqs with the assumption that we can add the child irq
number to the parent (otherwise I don't think you can scale it). That
also requires assumptions about what the irq specifiers contain. All
the custom properties do that anyway, but the standard interrupt
properties do not.

Perhaps we just need some interrupt controller specific hook to handle
more complicated cases of interrupt-map. If we can't map the child to
the parent using the standard matching (masking), then punt it to the
driver to find a match however it wants. So you could have something
like this:

interrupt-map-mask = <0xffffffff 0>;
interrupt-map = <<child base 1> 0 &gic GIC_SPI <parent base 1>
IRQ_TYPE_LEVEL_HIGH>,
        <<child base 2> 0 &gic GIC_SPI <parent base 2> IRQ_TYPE_LEVEL_HIGH>;

Then it is up to the driver to decide how to map an entry and it
doesn't require an exact match in DT. I've of course given little
thought to how exactly we wire up that driver hook. :)

> >> Furthermore, this is a rather long established practice: gic-v2m,
> >> gic-v3-mbi, mediatek,sysirq, mediatek,cirq... All the bits of glue that
> >> for one reason or another plug onto the GIC use the same method.
> >
> > All handling the mapping to the parent in their own way...
>
> Yes, and that's the problem. We need a scalable way to describe ranges
> of interrupts that are "forwarded" (for the lack of a better term), but
> now "owned" by the the interrupt controller.

Do we need to solve that now and for this case? Yes, 8 entries of
interrupt-map is more verbose than just a property specifying a base
irq, but I'd prefer standard over non-standard.

OTOH, I guess what's one more custom property...

Rob
