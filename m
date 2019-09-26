Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 120C9BF9DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 21:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfIZTLY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 15:11:24 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39006 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbfIZTLY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 15:11:24 -0400
Received: by mail-ot1-f65.google.com with SMTP id s22so116087otr.6;
        Thu, 26 Sep 2019 12:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bFL9v6D93ACN9q3ttEmF32gjw/ecfuNEclRJg6gg4Zo=;
        b=O58Wcbv3FiMAUnw5p2J5B07Dnq0IfzxJgsMaNqAjVaAwlktzwLj9CeURq2LBDlmR+0
         cVAdpbmdFY4X/nQOEFfvwnyEXEEW4SqCVI5mZKCRDJ264cyAsAFi2YmXrzRKb0eoA2RF
         LEJpozpSxBXWuGePXOr2fQOwTSnBsUoxtVngz2DiscbjujQ/JDbl5CZJh7QH+t8ahykZ
         FFwevnfP6q6HFc+xwpQkQcnhGZEeefDEc8LmBs9KVp5tDGGadC/TpkILlO8jSGmWkSFq
         cYBrRYAvguN9+h3P6k3IQ7kZ6nMrIUawGmYTw0HrDRI52/ZVe+zmZY1dRog1icaQKLUG
         uEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bFL9v6D93ACN9q3ttEmF32gjw/ecfuNEclRJg6gg4Zo=;
        b=bmkyOoJBA+0Fkq2SjQkA4OA5TItXwuIzMETUsW7+Gnw/AfN0acsxBpd6wibjd0jPf9
         8VgrFuzz95ER8bqHSJwQZRAvvDgzuqPxDDEnSrkR8TSHZo2Zl/6lvoSV+tZci7BqvInp
         q89BM5mhez7gyEiz4bhTUKwP6RtrxeDW8dal5klyMP6sHBVRMhQNfxksIwQIgeONNadG
         DkmV26JFW9mIWv1mkMUFrWAdrDrSGGAexTpYIpA4zFljoApseY1NbAdioRej69M3fAfa
         JtYcXJ547eU/xej+i0BKmVQdFKfnWQrH5Je6+sEgNNYrwjxXtAA/6RYP4BmeJb6j1fIx
         0Y0A==
X-Gm-Message-State: APjAAAXUVrL8w8m3nyN0fcXjb30G7wxPRfpiycFlzGba1214+Z9R7Q0a
        PPfgpPfWCBPtxmaYM8+KOENA7oqYcpkd0HQ5CwIFDos9
X-Google-Smtp-Source: APXvYqy0XWM7wxtAieVkO2swc9qGgC6AOjtJ/hvDAjWmDyqt+0jHpfcN8jYTv07FPatR60lUUG0nezt/afXfUIFlGMw=
X-Received: by 2002:a9d:3445:: with SMTP id v63mr211032otb.192.1569525081276;
 Thu, 26 Sep 2019 12:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <1569008061-10459-1-git-send-email-ykaneko0929@gmail.com> <20190923113042.rz2ooqjrupvmt7si@verge.net.au>
In-Reply-To: <20190923113042.rz2ooqjrupvmt7si@verge.net.au>
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date:   Fri, 27 Sep 2019 04:11:10 +0900
Message-ID: <CAH1o70KT8CDGhS723GgXG+60TTnDchHfpvQ2+1f8A1wy0DFnRA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: irqchip: renesas: intc-irqpin: convert
 bindings to json-schema
To:     Simon Horman <horms@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon-san,

Thank you for your review.

2019=E5=B9=B49=E6=9C=8823=E6=97=A5(=E6=9C=88) 20:30 Simon Horman <horms@ver=
ge.net.au>:
>
> On Sat, Sep 21, 2019 at 04:34:21AM +0900, Yoshihiro Kaneko wrote:
> > Convert R-/SH-Mobile IRQPin Controller bindings documentation to json-s=
chema.
> >
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > ---
> >  .../interrupt-controller/renesas,intc-irqpin.txt   |  62 -------------
> >  .../interrupt-controller/renesas,intc-irqpin.yaml  | 102 +++++++++++++=
++++++++
> >  2 files changed, 102 insertions(+), 62 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/renesas,intc-irqpin.txt
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/renesas,intc-irqpin.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/ren=
esas,intc-irqpin.txt b/Documentation/devicetree/bindings/interrupt-controll=
er/renesas,intc-irqpin.txt
> > deleted file mode 100644
> > index 772c550..0000000
> > --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,in=
tc-irqpin.txt
> > +++ /dev/null
> > @@ -1,62 +0,0 @@
> > -DT bindings for the R-/SH-Mobile irqpin controller
> > -
> > -Required properties:
> > -
> > -- compatible: has to be "renesas,intc-irqpin-<soctype>", "renesas,intc=
-irqpin"
> > -  as fallback.
> > -  Examples with soctypes are:
> > -    - "renesas,intc-irqpin-r8a7740" (R-Mobile A1)
> > -    - "renesas,intc-irqpin-r8a7778" (R-Car M1A)
> > -    - "renesas,intc-irqpin-r8a7779" (R-Car H1)
> > -    - "renesas,intc-irqpin-sh73a0" (SH-Mobile AG5)
> > -
> > -- reg: Base address and length of each register bank used by the exter=
nal
> > -  IRQ pins driven by the interrupt controller hardware module. The bas=
e
> > -  addresses, length and number of required register banks varies with =
soctype.
> > -- interrupt-controller: Identifies the node as an interrupt controller=
.
> > -- #interrupt-cells: has to be <2>: an interrupt index and flags, as de=
fined in
> > -  interrupts.txt in this directory.
> > -- interrupts: Must contain a list of interrupt specifiers. For each in=
terrupt
> > -  provided by this irqpin controller instance, there must be one entry=
,
> > -  referring to the corresponding parent interrupt.
> > -
> > -Optional properties:
> > -
> > -- any properties, listed in interrupts.txt, and any standard resource =
allocation
> > -  properties
> > -- sense-bitfield-width: width of a single sense bitfield in the SENSE =
register,
> > -  if different from the default 4 bits
> > -- control-parent: disable and enable interrupts on the parent interrup=
t
> > -  controller, needed for some broken implementations
> > -- clocks: Must contain a reference to the functional clock.  This prop=
erty is
> > -  mandatory if the hardware implements a controllable functional clock=
 for
> > -  the irqpin controller instance.
> > -- power-domains: Must contain a reference to the power domain. This pr=
operty is
> > -  mandatory if the irqpin controller instance is part of a controllabl=
e power
> > -  domain.
> > -
> > -
> > -Example
> > --------
> > -
> > -     irqpin1: interrupt-controller@e6900004 {
> > -             compatible =3D "renesas,intc-irqpin-r8a7740",
> > -                          "renesas,intc-irqpin";
> > -             #interrupt-cells =3D <2>;
> > -             interrupt-controller;
> > -             reg =3D <0xe6900004 4>,
> > -                     <0xe6900014 4>,
> > -                     <0xe6900024 1>,
> > -                     <0xe6900044 1>,
> > -                     <0xe6900064 1>;
> > -             interrupts =3D <0 149 IRQ_TYPE_LEVEL_HIGH
> > -                           0 149 IRQ_TYPE_LEVEL_HIGH
> > -                           0 149 IRQ_TYPE_LEVEL_HIGH
> > -                           0 149 IRQ_TYPE_LEVEL_HIGH
> > -                           0 149 IRQ_TYPE_LEVEL_HIGH
> > -                           0 149 IRQ_TYPE_LEVEL_HIGH
> > -                           0 149 IRQ_TYPE_LEVEL_HIGH
> > -                           0 149 IRQ_TYPE_LEVEL_HIGH>;
> > -             clocks =3D <&mstp2_clks R8A7740_CLK_INTCA>;
> > -             power-domains =3D <&pd_a4s>;
> > -     };
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/ren=
esas,intc-irqpin.yaml b/Documentation/devicetree/bindings/interrupt-control=
ler/renesas,intc-irqpin.yaml
> > new file mode 100644
> > index 0000000..d4d3cf8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,in=
tc-irqpin.yaml
> > @@ -0,0 +1,102 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/renesas,intc-i=
rqpin.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: DT bindings for the R-/SH-Mobile irqpin controller
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@xxxxxxxxx>
>
> I guess Geert's email address got fuzzed somehow.

I will fix it...

>
> > +  - Guennadi Liakhovetski <g.liakhovetski@gmx.de>
>
> I believe that its been a while since Guennadi worked in this area.
> I'd suggest not including him as a maintainer of this binding.

I understood.

>
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
> > +    # Base address and length of each register bank used by the extern=
al
> > +    # IRQ pins driven by the interrupt controller hardware module. The=
 base
> > +    # addresses, length and number of required register banks varies w=
ith
> > +    # soctype.
> > +    minItems: 1
> > +    maxItems: 6
> > +
> > +  interrupt-controller: true
> > +    # Identifies the node as an interrupt controller.
> > +
> > +  '#interrupt-cells':
> > +    # an interrupt index and flags, as defined in interrupts.txt in th=
is
> > +    # directory.
> > +    const: 2
> > +
> > +  interrupts:
> > +    # Must contain a list of interrupt specifiers. For each interrupt
> > +    # provided by this irqpin controller instance, there must be one e=
ntry,
> > +    # referring to the corresponding parent interrupt.
> > +    maxItems: 1
> > +
> > +  sense-bitfield-width:
> > +    # width of a single sense bitfield in the SENSE register, if diffe=
rent
> > +    # from the default 4 bits
> > +    maxItems: 1
>
> I wonder if we need to give this field a type, something like this?
>
>   sense-bitfield-width:
>     # Comment
>     $ref: /schemas/types.yaml#/definitions/uint32
>     maxItems: 1

I will do it.

>
>     Also, I wonder if there should be some constraints on the values.
>     (I don't know if these constraints are correct)
>
>     minimum: 1
>     maximum: 64
>     default: 4

I don't know the correct maximum value.

>
> > +
> > +  control-parent:
> > +    # disable and enable interrupts on the parent interrupt controller=
,
> > +    # needed for some broken implementations
> > +    maxItems: 1
>
> I think we can describe this as a boolean.
>
>   control-parent:
>      # Comment
>      type: boolean

I will do it.

>
>
> > +
> > +  clocks:
> > +    # Must contain a reference to the functional clock.  This property=
 is
> > +    # mandatory if the hardware implements a controllable functional c=
lock for
> > +    # the irqpin controller instance.
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    # Must contain a reference to the power domain. This property is
> > +    # mandatory if the irqpin controller instance is part of a control=
lable
> > +    # power domain.
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupt-controller
> > +  - '#interrupt-cells'
> > +  - interrupts
>
> Is 'clocks' also required?

It is explained that 'clocks' is optional in renesas,intc-irqpin.txt.
In fact, 'clocks' is not defined in the irqpin node of r8a7778.dtsi
and r8a7779.dtsi.


Regards,
Kaneko

>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r8a7740-clock.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    irqpin1: interrupt-controller@e6900004 {
> > +        compatible =3D "renesas,intc-irqpin-r8a7740",
> > +                     "renesas,intc-irqpin";
> > +        #interrupt-cells =3D <2>;
> > +        interrupt-controller;
> > +        reg =3D <0xe6900004 4>,
> > +              <0xe6900014 4>,
> > +              <0xe6900024 1>,
> > +              <0xe6900044 1>,
> > +              <0xe6900064 1>;
> > +        interrupts =3D <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> > +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&mstp2_clks R8A7740_CLK_INTCA>;
> > +        power-domains =3D <&pd_a4s>;
> > +    };
> > --
> > 1.9.1
> >
