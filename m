Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6D8D105BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 May 2019 09:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfEAHQz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 May 2019 03:16:55 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:44789 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfEAHQz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 May 2019 03:16:55 -0400
Received: by mail-vs1-f65.google.com with SMTP id j184so9409805vsd.11;
        Wed, 01 May 2019 00:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nMAztx+niF0rjgBsTBcRVWZKFQ1zhY6tWWp3MolxdTE=;
        b=nrr5cTupPC4occ+r8zMB053llPHMj1sKFE9HW5PWbLq7Ghmd3kehqb5XlM3P5AGEYH
         6oq6Xlj3OOfYN5TIkSamAUZR0Rt0q9bpgDJ/n1yosWKKhwkX6+KVgNGboAdIa4MlgfXZ
         PI9tuHqSculqhWwaIE0zc8LedmNxRXaR6mwi+pSN766bsB2P2bCItiokH7o1MdY5LEko
         fZMB5goIbpuaWMNfvHJGA04pAqqnApYf9MBsVqJHQLiYtOXJzFJqx9F1ghmLf5wpgGYd
         lRdO7auNviW/3kBJ+831UCH02dNh7TaTYTRSjSzvKFlByRR5lXAARA5FG7peKKEtcu/I
         IZsA==
X-Gm-Message-State: APjAAAU+72aoF0nLzXj75X18p/YItwn8892S0+f66nmAjICVB4xaCZhu
        l4U9DWfkVVZFQCLkCaj+q2W+mo30gmv7V1lR3sg=
X-Google-Smtp-Source: APXvYqzWSlP00i5y3FO3uyB0eC/PSGgr1BiCxz4n4K9fNkT2o1GgBISYNrXofxtkEIS2gYzGCdKDd387g2F/JGJEG6Y=
X-Received: by 2002:a67:83cf:: with SMTP id f198mr9345888vsd.63.1556695013995;
 Wed, 01 May 2019 00:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190430121254.3737-1-geert+renesas@glider.be>
 <20190430121254.3737-2-geert+renesas@glider.be> <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
 <29e95406-b9fb-fbb6-9240-c3914d885e88@arm.com> <CAL_Jsq+FJDdka9BMcXvGveBHiUf=YUU=3gz3e2wxjtXZ+K+NEA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+FJDdka9BMcXvGveBHiUf=YUU=3gz3e2wxjtXZ+K+NEA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 May 2019 09:16:41 +0200
Message-ID: <CAMuHMdWgrcfABOVZti+BYn6ujcYjUHNL7oeyJLgaxB8uPp5hwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/A1 Interrupt Controller
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Marc Zyngier <marc.zyngier@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Tue, Apr 30, 2019 at 10:26 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Tue, Apr 30, 2019 at 10:34 AM Marc Zyngier <marc.zyngier@arm.com> wrote:
> > On 30/04/2019 16:02, Rob Herring wrote:
> > > On Tue, Apr 30, 2019 at 7:13 AM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > >>
> > >> Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
> > >>
> > >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >> ---
> > >> v2:
> > >>   - Add "renesas,gic-spi-base",
> > >>   - Document RZ/A2M.
> > >> ---
> > >>  .../renesas,rza1-irqc.txt                     | 30 +++++++++++++++++++
> > >>  1 file changed, 30 insertions(+)
> > >>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > >> new file mode 100644
> > >> index 0000000000000000..ea8ddb6955338ccd
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > >> @@ -0,0 +1,30 @@
> > >> +DT bindings for the Renesas RZ/A1 Interrupt Controller
> > >> +
> > >> +The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
> > >> +RZ/A1 and RZ/A2 SoCs:
> > >> +  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
> > >> +    interrupts,
> > >> +  - NMI edge select.
> > >> +
> > >> +Required properties:
> > >> +  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
> > >> +               fallback.
> > >> +               Examples with soctypes are:
> > >> +                 - "renesas,r7s72100-irqc" (RZ/A1H)
> > >> +                 - "renesas,r7s9210-irqc" (RZ/A2M)
> > >> +  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
> > >> +                                in interrupts.txt in this directory)
> > >> +  - interrupt-controller: Marks the device as an interrupt controller
> > >> +  - reg: Base address and length of the memory resource used by the interrupt
> > >> +         controller
> > >> +  - renesas,gic-spi-base: Lowest GIC SPI interrupt number this block maps to.
> > >
> > > Why isn't this just an 'interrupts' property?
> >
> > That's likely because of kernel limitations. The DT code does an
> > of_populate() on any device that it finds, parse the "interrupts"
> > propertiy, resulting in the irq_descs being populated.
> >
> > That creates havoc, as these interrupts are not for this device, but for
> > something that is connected to it. This is merely a bridge of some sort.
>
> 'interrupt-map' would avoid that problem I think.

"interrupt-map" seems to be meant for translation on a bus?
What to do with the child and parent unit addresses fields?
The parent unit address size depends on the #address-cells of the parent
interrupt-controller (i.e. GIC, so it's zero).
But the child unit address size depends on the #address-cells of the bus node
on which the child is located, so that's a (non-zero) bus #address-cells
(from the root node), not an interrupt-controller #address-cells.

Each line in an interrupt-map also contains a child interrupt specifier.
As the RZ/A1 IRQC supports 8 interrupt inputs with 4 sense types,
that would mean 32 lines? Or should I just ignore the senses here,
and specify 0?

i.e. interrupt-map = <0 0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH,
                      0 1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH,
                      0 2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH,
                      0 3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH,
                      0 4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH,
                      0 5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH,
                      0 6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH,
                      0 7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;

(using zero for the child unit addresses, too)?

> > Furthermore, this is a rather long established practice: gic-v2m,
> > gic-v3-mbi, mediatek,sysirq, mediatek,cirq... All the bits of glue that
> > for one reason or another plug onto the GIC use the same method.
>
> All handling the mapping to the parent in their own way...
>
> > > Plus, without 'interrupts' walking the hierarchy is broken.
> >
> > Erm... Which hierarchy?
>
> of_irq_init() expects that an interrupt-controller without an
> interrupt-parent is the root controller. So you're right. We only need

That applies to IRQCHIP_DECLARE() drivers only, not platform device
drivers, right?

> to have an 'interrupt-parent', but not 'interrupts'.

This is implied by "interrupt-parent = <&gic>;" on the soc node.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
