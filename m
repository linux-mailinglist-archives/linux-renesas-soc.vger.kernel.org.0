Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9FA1208C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2019 18:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbfEBQvJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 May 2019 12:51:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:57762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbfEBQvJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 May 2019 12:51:09 -0400
Received: from mail-yw1-f52.google.com (mail-yw1-f52.google.com [209.85.161.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C98932177B;
        Thu,  2 May 2019 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556815867;
        bh=j/F8Err226AP96vXweFKgqE+muADxZNr6D1JUPjWuMo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D+buKVZ/P+c/5dK5QJ0Uf4jsZV3M1JyWnPYzYabnXXKA+lV7cVhOq5uuDNoErLxGh
         DYYwlBoeWa5RbbYSJq+S7JuHtkTU+Q59GytDOoxS/dIEtEWlmk6nGKFOFypERbq+qJ
         yBVp20iDZIb64E7XUC4PEEiNXvqSuba9eaYQkgJc=
Received: by mail-yw1-f52.google.com with SMTP id t79so2077984ywc.7;
        Thu, 02 May 2019 09:51:07 -0700 (PDT)
X-Gm-Message-State: APjAAAUX++UMEdBrS5SJl1AinvpDQGXPR1j99cmRAruk7uFQOIts6K3h
        Qwsng0+c7go8za8VAnxmNylGE66NN4yK+IO7ZA==
X-Google-Smtp-Source: APXvYqxD9LcjXVbe2ii7BTnARq19nBFtVGc/blWrzvG4y4x6vf5IRzZXMon1pIFvBdx0Wj5at9/tiBhSlHx/nyRzhX0=
X-Received: by 2002:a25:3850:: with SMTP id f77mr3852123yba.93.1556815866946;
 Thu, 02 May 2019 09:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190430121254.3737-1-geert+renesas@glider.be>
 <20190430121254.3737-2-geert+renesas@glider.be> <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
 <29e95406-b9fb-fbb6-9240-c3914d885e88@arm.com> <CAL_Jsq+FJDdka9BMcXvGveBHiUf=YUU=3gz3e2wxjtXZ+K+NEA@mail.gmail.com>
 <CAMuHMdWgrcfABOVZti+BYn6ujcYjUHNL7oeyJLgaxB8uPp5hwg@mail.gmail.com>
 <CAL_JsqKq0KP9H4DumyxJTjD=7rqwgOM=+5jHhkUxQqamrA3h7g@mail.gmail.com> <CAMuHMdVWG4LDAAht-6Rendt8L96vW+VEJK4tGnOCMJ38pRDybA@mail.gmail.com>
In-Reply-To: <CAMuHMdVWG4LDAAht-6Rendt8L96vW+VEJK4tGnOCMJ38pRDybA@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 2 May 2019 11:50:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ34-0T_XjmRaXc3YTp4OHhptUaO3F+yygAy6L0iaNhdg@mail.gmail.com>
Message-ID: <CAL_JsqJ34-0T_XjmRaXc3YTp4OHhptUaO3F+yygAy6L0iaNhdg@mail.gmail.com>
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

On Thu, May 2, 2019 at 5:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Wed, May 1, 2019 at 9:38 PM Rob Herring <robh+dt@kernel.org> wrote:
> > On Wed, May 1, 2019 at 2:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Apr 30, 2019 at 10:26 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > > On Tue, Apr 30, 2019 at 10:34 AM Marc Zyngier <marc.zyngier@arm.com> wrote:
> > > > > On 30/04/2019 16:02, Rob Herring wrote:
> > > > > > On Tue, Apr 30, 2019 at 7:13 AM Geert Uytterhoeven
> > > > > > <geert+renesas@glider.be> wrote:
> > > > > >>
> > > > > >> Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
> > > > > >>
> > > > > >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > >> ---
> > > > > >> v2:
> > > > > >>   - Add "renesas,gic-spi-base",
> > > > > >>   - Document RZ/A2M.
> > > > > >> ---
> > > > > >>  .../renesas,rza1-irqc.txt                     | 30 +++++++++++++++++++
> > > > > >>  1 file changed, 30 insertions(+)
> > > > > >>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > > > > >>
> > > > > >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > > > > >> new file mode 100644
> > > > > >> index 0000000000000000..ea8ddb6955338ccd
> > > > > >> --- /dev/null
> > > > > >> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > > > > >> @@ -0,0 +1,30 @@
> > > > > >> +DT bindings for the Renesas RZ/A1 Interrupt Controller
> > > > > >> +
> > > > > >> +The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
> > > > > >> +RZ/A1 and RZ/A2 SoCs:
> > > > > >> +  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
> > > > > >> +    interrupts,
> > > > > >> +  - NMI edge select.
> > > > > >> +
> > > > > >> +Required properties:
> > > > > >> +  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
> > > > > >> +               fallback.
> > > > > >> +               Examples with soctypes are:
> > > > > >> +                 - "renesas,r7s72100-irqc" (RZ/A1H)
> > > > > >> +                 - "renesas,r7s9210-irqc" (RZ/A2M)
> > > > > >> +  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
> > > > > >> +                                in interrupts.txt in this directory)
> > > > > >> +  - interrupt-controller: Marks the device as an interrupt controller
> > > > > >> +  - reg: Base address and length of the memory resource used by the interrupt
> > > > > >> +         controller
> > > > > >> +  - renesas,gic-spi-base: Lowest GIC SPI interrupt number this block maps to.
> > > > > >
> > > > > > Why isn't this just an 'interrupts' property?
> > > > >
> > > > > That's likely because of kernel limitations. The DT code does an
> > > > > of_populate() on any device that it finds, parse the "interrupts"
> > > > > propertiy, resulting in the irq_descs being populated.
> > > > >
> > > > > That creates havoc, as these interrupts are not for this device, but for
> > > > > something that is connected to it. This is merely a bridge of some sort.
> > > >
> > > > 'interrupt-map' would avoid that problem I think.
> > >
> > > "interrupt-map" seems to be meant for translation on a bus?
> > > What to do with the child and parent unit addresses fields?
> > > The parent unit address size depends on the #address-cells of the parent
> > > interrupt-controller (i.e. GIC, so it's zero).
> > > But the child unit address size depends on the #address-cells of the bus node
> > > on which the child is located, so that's a (non-zero) bus #address-cells
> > > (from the root node), not an interrupt-controller #address-cells.
> >
> > The #address-cells is always retrieved from the interrupt-parent node
> > (or its parent). The interrupt-parent can implicitly be the child's
> > parent, but that is rarely used in modern systems.
>
> That's not what Devicetree Specification, Release v0.2 says:
>
>     child unit address The unit address of the child node being mapped.
>     The number of 32-bit cells required to specify this is described by
>     the #address-cells property of the bus node on which the child is
>     located.
>
> 2.4.4 Interrupt Mapping Example (for PCI) says the bus node is the PCI
> bridge, with #address-cells = <3>.

PCI is more inline with the spec wording, but systems evolved where
the interrupt hierarchy doesn't match the bus hierarchy.

> But in the RZ/A1 case the child unit address is irrelevant, as its an
> external interrupt input not related to a specific bus.  It could be
> used by a device without unit address (e.g. gpio-keys), or some device
> on an external local bus (root #adress-cells is <1> on 32-bit without
> LPAE, but this block could be reused in a future LPAE or arm64 SoCs),
> or on e.g. an SPI or i2c bus, with its own #adress-cells value
> (coincidentally <1>, too).
>
> I see of_irq_parse_raw() does use the address-cells of the parent
> interrupt controller (which is usually 0) when iterating its way up,
> following interrupt-map.
>
> So the child unit address does have two different meanings?

Indeed. That's why you'll see interrupt-controller nodes with the odd
'#address-cells = <0>;' in them. It's often omitted because it only
matters if there's an interrupt-map. We should clarify the spec.

Rob
