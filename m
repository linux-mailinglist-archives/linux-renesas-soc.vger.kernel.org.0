Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63B26D39BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2019 08:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfJKG50 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Oct 2019 02:57:26 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41856 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbfJKG50 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Oct 2019 02:57:26 -0400
Received: by mail-ot1-f66.google.com with SMTP id g13so7078053otp.8;
        Thu, 10 Oct 2019 23:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3CSGSMCoXU01E0Dw28w9E519WxiXh9MrZBmlxqtckH8=;
        b=AxfH/SuYPrlnqGnIrqwAAI6trw1pPB99l0FcXLkTKw++2rVp6o+iMQh9VUqs4b946O
         qr1RrWMBY0REtauUJzBWnBDe+u8sK3qyOuueKe6+0+O2hkFr31oY38ewAUZJ6WnV0Bxi
         q9RroMFgnikcwBXM5Kx9fz/8c0rYWiOescDqSpScnkkNhHS7yPM89ltGi0ZYykNRnVr2
         t5kh8kLnDv2U4XjpWDBapnWtZ7p4QKpsoFxDW1vm0ySuBVJEBY5Gd9fIFhsHs9rtgejP
         VElzQZIVPyDx5d7GZTs64cXIFNysUWYkTyJ2qzPCbLob1BdYYsLsPOpfgX6TYp13aYNW
         f/Ig==
X-Gm-Message-State: APjAAAV7p7V1vkFBOgiPo2d3s41ltbfZgZPCpV6EntEFm2DAtgZIJp7r
        IIo79aADlOtlqfYbOznGg47vHud06X4ACVF2thQ=
X-Google-Smtp-Source: APXvYqyLxIYdCXEnFY/0+bGNvbFKi2B/ePBFpmshvQMFUYvn6XDKcno60UqrShjqDhWRghZtNHFwhQtyM7l2SDzPn70=
X-Received: by 2002:a05:6830:1544:: with SMTP id l4mr3511360otp.297.1570777045295;
 Thu, 10 Oct 2019 23:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <1569527977-21213-1-git-send-email-ykaneko0929@gmail.com> <20191010220709.GA1314@bogus>
In-Reply-To: <20191010220709.GA1314@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Oct 2019 08:57:13 +0200
Message-ID: <CAMuHMdWR3HnT1-yp+i0OXAr2xF-6MANJDuXz1hj9WC1eUJjRAQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: irqchip: renesas: intc-irqpin: convert
 bindings to json-schema
To:     Rob Herring <robh@kernel.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob, Kaneko-san,

On Fri, Oct 11, 2019 at 12:07 AM Rob Herring <robh@kernel.org> wrote:
> On Fri, Sep 27, 2019 at 04:59:37AM +0900, Yoshihiro Kaneko wrote:
> > Convert R-/SH-Mobile IRQPin Controller bindings documentation to json-schema.
> >
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
> > @@ -0,0 +1,102 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/renesas,intc-irqpin.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: DT bindings for the R-/SH-Mobile irqpin controller
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>

Looks like I received many maintainerships recently ;-)

> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,intc-irqpin-r8a7740  # R-Mobile A1
> > +          - renesas,intc-irqpin-r8a7778  # R-Car M1A
> > +          - renesas,intc-irqpin-r8a7779  # R-Car H1
> > +          - renesas,intc-irqpin-sh73a0   # SH-Mobile AG5
> > +      - const: renesas,intc-irqpin
> > +
> > +  reg:
> > +    # Base address and length of each register bank used by the external
> > +    # IRQ pins driven by the interrupt controller hardware module. The base
> > +    # addresses, length and number of required register banks varies with
> > +    # soctype.
> > +    minItems: 1

minItems: 5

> > +    maxItems: 6
>
> Every entry is the same thing?

No they're not.

First entry is the Interrupt control register.
Second entry is the Interrupt priority register.
Third entry is the Interrupt source register.
Fourth entry is the Interrupt mask register.
Fifth entry is the Interrupt mask clear register.
Sixth entry is the optional Interrupt control register for ICR0 with IRLM bit.

The fact that SH/R-Mobile SoCs have 4 instances of this block, with
interleaved registers, and different register widths, doesn't help much,
and I understand that was the reason for the individual register
descriptions.

This is a very old binding, which tried to describe everything in DT,
using a generic compatible value.  Of course this lead to a mess when
having different register layouts, optional registers, and a
sense-bitfield-width property...

The modern way would be to describe all differences in the driver, based
on SoC-specific compatible values.
Given this is for rather old SoCs, I see no point in upgrading the bindings.

> > +    irqpin1: interrupt-controller@e6900004 {
> > +        compatible = "renesas,intc-irqpin-r8a7740",
> > +                     "renesas,intc-irqpin";
> > +        #interrupt-cells = <2>;
> > +        interrupt-controller;
> > +        reg = <0xe6900004 4>,
> > +              <0xe6900014 4>,
> > +              <0xe6900024 1>,
> > +              <0xe6900044 1>,
> > +              <0xe6900064 1>;
>
> Really only 1 byte?

Yep. Some registers are 8-bit on some SoCs...

> > +        interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
>
> <> each interrupt specifier.
>
> Above you said there is only 1 interrupt...

Which is wrong.  But the description was correct.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
