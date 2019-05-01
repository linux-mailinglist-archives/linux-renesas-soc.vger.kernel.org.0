Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB04210D4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 May 2019 21:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfEATin (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 May 2019 15:38:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:49388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726004AbfEATim (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 May 2019 15:38:42 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17C8D21670;
        Wed,  1 May 2019 19:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556739521;
        bh=3r13nXEJ/55Q/6bcHEMx6ujePRfuqPpaN3lyt842VmY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=089rLRllTb8+Hm/6P1egJyBZnX9sB8aKtVtWwogTnxXRsJuTn4DBQ1NC8Si4aWC4v
         sOFQ9CsmsKXAG5eYC4HMcDNFQIvoZM3tSAjl6Y8Ew1+szgJd0yOz16wQ8wG6YeVwGl
         vfLQ4gipfpktss6CffbKiN0D3er8MCXTYV0qxtIk=
Received: by mail-qt1-f175.google.com with SMTP id c13so1160670qtn.8;
        Wed, 01 May 2019 12:38:41 -0700 (PDT)
X-Gm-Message-State: APjAAAWkdBpmbmll8h1l8zXj4ep1AQk6ok68FquOlGAtr+qp+aN51SUB
        NndaEau4edhsPI8V1u7WE7fqu7mR3FhZeE6Lag==
X-Google-Smtp-Source: APXvYqyvDY9yv37xfenzQ3oQK4fKJuQiVVo4N665MF6Ku+f5ZwXO7oFy/tj3G/zv+m8eSK7TOR5xnEpNff7satGEkbc=
X-Received: by 2002:aed:3f6b:: with SMTP id q40mr21394587qtf.26.1556739520237;
 Wed, 01 May 2019 12:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190430121254.3737-1-geert+renesas@glider.be>
 <20190430121254.3737-2-geert+renesas@glider.be> <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
 <29e95406-b9fb-fbb6-9240-c3914d885e88@arm.com> <CAL_Jsq+FJDdka9BMcXvGveBHiUf=YUU=3gz3e2wxjtXZ+K+NEA@mail.gmail.com>
 <CAMuHMdWgrcfABOVZti+BYn6ujcYjUHNL7oeyJLgaxB8uPp5hwg@mail.gmail.com>
In-Reply-To: <CAMuHMdWgrcfABOVZti+BYn6ujcYjUHNL7oeyJLgaxB8uPp5hwg@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 1 May 2019 14:38:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKq0KP9H4DumyxJTjD=7rqwgOM=+5jHhkUxQqamrA3h7g@mail.gmail.com>
Message-ID: <CAL_JsqKq0KP9H4DumyxJTjD=7rqwgOM=+5jHhkUxQqamrA3h7g@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/A1 Interrupt Controller
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Wed, May 1, 2019 at 2:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Tue, Apr 30, 2019 at 10:26 PM Rob Herring <robh+dt@kernel.org> wrote:
> > On Tue, Apr 30, 2019 at 10:34 AM Marc Zyngier <marc.zyngier@arm.com> wrote:
> > > On 30/04/2019 16:02, Rob Herring wrote:
> > > > On Tue, Apr 30, 2019 at 7:13 AM Geert Uytterhoeven
> > > > <geert+renesas@glider.be> wrote:
> > > >>
> > > >> Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
> > > >>
> > > >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >> ---
> > > >> v2:
> > > >>   - Add "renesas,gic-spi-base",
> > > >>   - Document RZ/A2M.
> > > >> ---
> > > >>  .../renesas,rza1-irqc.txt                     | 30 +++++++++++++++++++
> > > >>  1 file changed, 30 insertions(+)
> > > >>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > > >>
> > > >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > > >> new file mode 100644
> > > >> index 0000000000000000..ea8ddb6955338ccd
> > > >> --- /dev/null
> > > >> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > > >> @@ -0,0 +1,30 @@
> > > >> +DT bindings for the Renesas RZ/A1 Interrupt Controller
> > > >> +
> > > >> +The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
> > > >> +RZ/A1 and RZ/A2 SoCs:
> > > >> +  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
> > > >> +    interrupts,
> > > >> +  - NMI edge select.
> > > >> +
> > > >> +Required properties:
> > > >> +  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
> > > >> +               fallback.
> > > >> +               Examples with soctypes are:
> > > >> +                 - "renesas,r7s72100-irqc" (RZ/A1H)
> > > >> +                 - "renesas,r7s9210-irqc" (RZ/A2M)
> > > >> +  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
> > > >> +                                in interrupts.txt in this directory)
> > > >> +  - interrupt-controller: Marks the device as an interrupt controller
> > > >> +  - reg: Base address and length of the memory resource used by the interrupt
> > > >> +         controller
> > > >> +  - renesas,gic-spi-base: Lowest GIC SPI interrupt number this block maps to.
> > > >
> > > > Why isn't this just an 'interrupts' property?
> > >
> > > That's likely because of kernel limitations. The DT code does an
> > > of_populate() on any device that it finds, parse the "interrupts"
> > > propertiy, resulting in the irq_descs being populated.
> > >
> > > That creates havoc, as these interrupts are not for this device, but for
> > > something that is connected to it. This is merely a bridge of some sort.
> >
> > 'interrupt-map' would avoid that problem I think.
>
> "interrupt-map" seems to be meant for translation on a bus?
> What to do with the child and parent unit addresses fields?
> The parent unit address size depends on the #address-cells of the parent
> interrupt-controller (i.e. GIC, so it's zero).
> But the child unit address size depends on the #address-cells of the bus node
> on which the child is located, so that's a (non-zero) bus #address-cells
> (from the root node), not an interrupt-controller #address-cells.

The #address-cells is always retrieved from the interrupt-parent node
(or its parent). The interrupt-parent can implicitly be the child's
parent, but that is rarely used in modern systems.

> Each line in an interrupt-map also contains a child interrupt specifier.
> As the RZ/A1 IRQC supports 8 interrupt inputs with 4 sense types,
> that would mean 32 lines? Or should I just ignore the senses here,
> and specify 0?

You can ignore parts of the child cells with interrupt-map-mask, so
you should just need 8 entries.

> i.e. interrupt-map = <0 0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH,
>                       0 1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH,
>                       0 2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH,
>                       0 3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH,
>                       0 4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH,
>                       0 5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH,
>                       0 6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH,
>                       0 7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>
> (using zero for the child unit addresses, too)?
>
> > > Furthermore, this is a rather long established practice: gic-v2m,
> > > gic-v3-mbi, mediatek,sysirq, mediatek,cirq... All the bits of glue that
> > > for one reason or another plug onto the GIC use the same method.
> >
> > All handling the mapping to the parent in their own way...
> >
> > > > Plus, without 'interrupts' walking the hierarchy is broken.
> > >
> > > Erm... Which hierarchy?
> >
> > of_irq_init() expects that an interrupt-controller without an
> > interrupt-parent is the root controller. So you're right. We only need
>
> That applies to IRQCHIP_DECLARE() drivers only, not platform device
> drivers, right?

Right.

Rob
