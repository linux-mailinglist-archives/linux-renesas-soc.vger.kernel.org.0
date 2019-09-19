Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAE30B7915
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2019 14:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389147AbfISMOV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 08:14:21 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33811 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388585AbfISMOU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 08:14:20 -0400
Received: by mail-ot1-f65.google.com with SMTP id m19so1014535otp.1;
        Thu, 19 Sep 2019 05:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QvLoduNjWDq0irr4KmoFrcMnRkzTNuqWd9dd0EIo4qA=;
        b=NUcHB4ECLWXZ5lpvpWEbL1VzzRnEePXy357KUTmGR/L5wncupdtS2ZbK8kJ5XSCPR+
         Hfd0t5v76KPx9gQenG6e/4FveSYQlm2Iq4KUzRFe5RBUqJv2rwQfEh4Lp39KJWHlCtH3
         J3yBe7f8Fw8itjKBEiytVCxLg0v4ZzkvxcDakqCzSKIiP6g+iSksgL7GTwmjmfH1s9WV
         vYHtsEWFqlLNF+9/X+Jg7kIUyEPQUzjQGFEN6TR2je+HHYNm6Z7mJRjXHytwQq/qu8ab
         /QRsin83kUbQ2IYGBP6uC2uaq9zhmy+SWAZEO6dyW6qCZAtzqmPIQzYQ1V+OBMzjqRYS
         X3lQ==
X-Gm-Message-State: APjAAAU2Nq5vwPXjKxBpR8rWzE4k8tyyzI9U6RbAxSORw1EdZ9646z23
        JS6ZI7h9l29RkHNOVVn50vZeaWgFiBNZIXMeBTU=
X-Google-Smtp-Source: APXvYqxpJBNDWF7UZ7/K/0JRvYuxdPCLIvwKYAzQ/RK4j0IdrJdhtUuq0yye09WgmEfrGPF+voRk28xoNDEpfn0vwgw=
X-Received: by 2002:a9d:730d:: with SMTP id e13mr2241059otk.145.1568895259523;
 Thu, 19 Sep 2019 05:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <1568819121-32737-1-git-send-email-ykaneko0929@gmail.com> <20190919120333.77qabr675rne7zlu@verge.net.au>
In-Reply-To: <20190919120333.77qabr675rne7zlu@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Sep 2019 14:14:07 +0200
Message-ID: <CAMuHMdWHyzwkqQv-4Dpo-omO7Z96NATANjyrtufbZQ7naCDPQQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: irqchip: renesas-irqc: convert bindings
 to json-schema
To:     Simon Horman <horms@verge.net.au>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Thu, Sep 19, 2019 at 2:03 PM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Sep 19, 2019 at 12:05:21AM +0900, Yoshihiro Kaneko wrote:
> > Convert Renesas Interrupt Controller bindings documentation to json-schema.
> >
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
> > @@ -0,0 +1,84 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/renesas,irqc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,irqc-r8a73a4        # R-Mobile APE6
> > +          - renesas,irqc-r8a7743        # RZ/G1M
> > +          - renesas,irqc-r8a7744        # RZ/G1N
> > +          - renesas,irqc-r8a7745        # RZ/G1E
> > +          - renesas,irqc-r8a77470       # RZ/G1C
> > +          - renesas,irqc-r8a7790        # R-Car H2
> > +          - renesas,irqc-r8a7791        # R-Car M2-W
> > +          - renesas,irqc-r8a7792        # R-Car V2H
> > +          - renesas,irqc-r8a7793        # R-Car M2-N
> > +          - renesas,irqc-r8a7794        # R-Car E2
> > +          - renesas,intc-ex-r8a774a1    # RZ/G2M
> > +          - renesas,intc-ex-r8a774c0    # RZ/G2E
> > +          - renesas,intc-ex-r8a7795     # R-Car H3
> > +          - renesas,intc-ex-r8a7796     # R-Car M3-W
> > +          - renesas,intc-ex-r8a77965    # R-Car M3-N
> > +          - renesas,intc-ex-r8a77970    # R-Car V3M
> > +          - renesas,intc-ex-r8a77980    # R-Car V3H
> > +          - renesas,intc-ex-r8a77990    # R-Car E3
> > +          - renesas,intc-ex-r8a77995    # R-Car D3
> > +      - const: renesas,irqc
> > +
> > +  '#interrupt-cells':
> > +    # an interrupt index and flags, as defined in interrupts.txt in
> > +    # this directory
> > +    const: 2
> > +
> > +  interrupt-controller: true
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 32
>
> Is 'interrupts' required?

Yes, there must be one upstream interrupt for each supported interrupt input.
The number of inputs is SoC-specific.

> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/r8a7790-clock.h>
> > +
> > +    irqc0: interrupt-controller@e61c0000 {
> > +        compatible = "renesas,irqc-r8a7790", "renesas,irqc";
> > +        #interrupt-cells = <2>;
> > +        interrupt-controller;
> > +        reg = <0 0xe61c0000 0 0x200>;
> > +        interrupts = <0 0 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <0 1 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <0 2 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <0 3 IRQ_TYPE_LEVEL_HIGH>;

While at it, one may want to replace s/0/GIC_SPI/.

> > +        clocks = <&mstp4_clks R8A7790_CLK_IRQC>;

and update clocks for the new CPG/MSTP bindings.

> > +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
