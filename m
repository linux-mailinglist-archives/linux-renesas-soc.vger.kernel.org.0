Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13C0E100BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 22:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfD3U0B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 16:26:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:35792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbfD3U0B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 16:26:01 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F216F21744;
        Tue, 30 Apr 2019 20:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556655960;
        bh=DSxEhAEipVnpxa4FsOU9wQm9HGZcB8UKp6vsmLFKzKI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hWGNDLin8Jv7R3octK9+WNK6NDkFYqRon781t/+3Uaohgl5JBv0p8/YLze24pXZPA
         BnB/vbFXRIBB3+ftQnARjE7ILIkYGn0fJVbShd9VrtK0ZNVoNzckTnIRx6vAWjIOJm
         rFyC/x1QpMlMO7dUwXT7s/gVuO/syR9PmXkZqYb0=
Received: by mail-qt1-f171.google.com with SMTP id p20so17849432qtc.9;
        Tue, 30 Apr 2019 13:25:59 -0700 (PDT)
X-Gm-Message-State: APjAAAW9W6gIt7cWbGdE8J/vRA1Wbb7iJ4DK1LMNGN5/IRc6el4VWDNX
        bR8fQy/A/UWS+VPoB9sFBmhDJ/ogRqN5KqHnzw==
X-Google-Smtp-Source: APXvYqxCFou195GvOeGCcRlljrl+D9VyKQ+Gjb47JpcOdGhFwHx38K3aZX9kIiEUbEXlzu2ItILlnXJhN99f9b9CsTY=
X-Received: by 2002:aed:306c:: with SMTP id 99mr1000209qte.38.1556655959214;
 Tue, 30 Apr 2019 13:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190430121254.3737-1-geert+renesas@glider.be>
 <20190430121254.3737-2-geert+renesas@glider.be> <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
 <29e95406-b9fb-fbb6-9240-c3914d885e88@arm.com>
In-Reply-To: <29e95406-b9fb-fbb6-9240-c3914d885e88@arm.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 30 Apr 2019 15:25:47 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+FJDdka9BMcXvGveBHiUf=YUU=3gz3e2wxjtXZ+K+NEA@mail.gmail.com>
Message-ID: <CAL_Jsq+FJDdka9BMcXvGveBHiUf=YUU=3gz3e2wxjtXZ+K+NEA@mail.gmail.com>
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

On Tue, Apr 30, 2019 at 10:34 AM Marc Zyngier <marc.zyngier@arm.com> wrote:
>
> On 30/04/2019 16:02, Rob Herring wrote:
> > On Tue, Apr 30, 2019 at 7:13 AM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> >>
> >> Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >> v2:
> >>   - Add "renesas,gic-spi-base",
> >>   - Document RZ/A2M.
> >> ---
> >>  .../renesas,rza1-irqc.txt                     | 30 +++++++++++++++++++
> >>  1 file changed, 30 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> >> new file mode 100644
> >> index 0000000000000000..ea8ddb6955338ccd
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> >> @@ -0,0 +1,30 @@
> >> +DT bindings for the Renesas RZ/A1 Interrupt Controller
> >> +
> >> +The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
> >> +RZ/A1 and RZ/A2 SoCs:
> >> +  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
> >> +    interrupts,
> >> +  - NMI edge select.
> >> +
> >> +Required properties:
> >> +  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
> >> +               fallback.
> >> +               Examples with soctypes are:
> >> +                 - "renesas,r7s72100-irqc" (RZ/A1H)
> >> +                 - "renesas,r7s9210-irqc" (RZ/A2M)
> >> +  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
> >> +                                in interrupts.txt in this directory)
> >> +  - interrupt-controller: Marks the device as an interrupt controller
> >> +  - reg: Base address and length of the memory resource used by the interrupt
> >> +         controller
> >> +  - renesas,gic-spi-base: Lowest GIC SPI interrupt number this block maps to.
> >
> > Why isn't this just an 'interrupts' property?
>
> That's likely because of kernel limitations. The DT code does an
> of_populate() on any device that it finds, parse the "interrupts"
> propertiy, resulting in the irq_descs being populated.
>
> That creates havoc, as these interrupts are not for this device, but for
> something that is connected to it. This is merely a bridge of some sort.

'interrupt-map' would avoid that problem I think.

> Furthermore, this is a rather long established practice: gic-v2m,
> gic-v3-mbi, mediatek,sysirq, mediatek,cirq... All the bits of glue that
> for one reason or another plug onto the GIC use the same method.

All handling the mapping to the parent in their own way...

> > Plus, without 'interrupts' walking the hierarchy is broken.
>
> Erm... Which hierarchy?

of_irq_init() expects that an interrupt-controller without an
interrupt-parent is the root controller. So you're right. We only need
to have an 'interrupt-parent', but not 'interrupts'.

Rob
