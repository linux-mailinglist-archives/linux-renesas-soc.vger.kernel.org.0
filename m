Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84E8DFCC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 17:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfD3PYl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 11:24:41 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46488 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfD3PYl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 11:24:41 -0400
Received: by mail-vs1-f66.google.com with SMTP id e2so8196689vsc.13;
        Tue, 30 Apr 2019 08:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5I9tfm+JIBFFB8aDQ2MxHwPfmhhGeh3oomuM5oIr34I=;
        b=ZAWs/PxlHTcu9suecwUZjq+B5d9fnwcJ5gjnrRzHdP5peas/ALl9Orw4qxZVtklua5
         SMeB75tQ06XXQZPLykwR8ZYTWwCXrodefxSkQmEnaFQ9P03MieyUrbkxyrFfcpUt4Jgt
         BtBcv8yBtJf/jOQq7ZSRMOKFoSzhz2BOz3+3yqMn80no/s63WKBfc4LIzujUQDF7pxwo
         5CdqmGAUFgCE5wfBndxH85wD3i1dM3b7D7qxcWQOO0L2+94H+vVU2D0L6dEytz4LgCYJ
         5IiZ6626ipf6TGokMlRzynbVh6929A5Jyy16dRCznvZFgV4FRdG/KspEiPgS9K5AmwsQ
         Pl/Q==
X-Gm-Message-State: APjAAAXyhxSuT5xXilmfoMhh4SD9D9lGEmXQNhpxukwK4a1GT5h1CH5q
        oUX+DjnZAj1Z0ayaelkxMFTzja00rvi/rHU15Xg=
X-Google-Smtp-Source: APXvYqynhodOJpShgomuH87Sw5GBud3Lt4ozNjjqtSzAK0Rnc1klzbsHCXQRpH2AXuuUC8IooA+LrKTbULAXJfNRAgk=
X-Received: by 2002:a05:6102:113:: with SMTP id z19mr5685253vsq.166.1556637880271;
 Tue, 30 Apr 2019 08:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190430121254.3737-1-geert+renesas@glider.be>
 <20190430121254.3737-2-geert+renesas@glider.be> <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
In-Reply-To: <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 17:24:28 +0200
Message-ID: <CAMuHMdW9h8u81NkvSH8jSoCK5g=dFzSGJzmknmc9x-dNkqOycg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/A1 Interrupt Controller
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
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

On Tue, Apr 30, 2019 at 5:03 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Tue, Apr 30, 2019 at 7:13 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Add "renesas,gic-spi-base",
> >   - Document RZ/A2M.

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > @@ -0,0 +1,30 @@
> > +DT bindings for the Renesas RZ/A1 Interrupt Controller
> > +
> > +The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
> > +RZ/A1 and RZ/A2 SoCs:
> > +  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
> > +    interrupts,
> > +  - NMI edge select.
> > +
> > +Required properties:
> > +  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
> > +               fallback.
> > +               Examples with soctypes are:
> > +                 - "renesas,r7s72100-irqc" (RZ/A1H)
> > +                 - "renesas,r7s9210-irqc" (RZ/A2M)
> > +  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
> > +                                in interrupts.txt in this directory)
> > +  - interrupt-controller: Marks the device as an interrupt controller
> > +  - reg: Base address and length of the memory resource used by the interrupt
> > +         controller
> > +  - renesas,gic-spi-base: Lowest GIC SPI interrupt number this block maps to.
>
> Why isn't this just an 'interrupts' property? Plus, without

Because Marc told me this is what everyone uses...

> 'interrupts' walking the hierarchy is broken.

What is "interrupts walking"? Can you please elaborate?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
