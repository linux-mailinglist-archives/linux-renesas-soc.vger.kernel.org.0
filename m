Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD9E0B7EC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2019 18:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391661AbfISQJM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 12:09:12 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37544 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391655AbfISQJL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 12:09:11 -0400
Received: by mail-oi1-f194.google.com with SMTP id i16so3221871oie.4;
        Thu, 19 Sep 2019 09:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hO5ur43UWRQwBhSoXO1A1AHBjyep85Hij+KLBit2aJw=;
        b=fBx1m2K1wGG1ZbBKVSYNktigxEL/WLNGDX3S+XVZm6jR7jbiwUSUivM6saOEIOzWz9
         BkH3Ob4SdNqnIduk3E61SVTqadWUT2c/LImSigPHakBbpWvc3bh80KwMQBme8jHT6nTA
         p40AyMDkJO2Sga4WSgAgMPib6OcSdyatOqfEfSLE5Aa8g7yWPVF6lfTo9qij/zWNxS8q
         BH4W8kEpM7xPdNCB7vzNbh2N7GK6t4rdSktJ28dWSGe14pD3OPBEqXlg3Zl75MykcXdm
         6U142vdApDQmg+4nycB128OkJ7UVTrtoqZwg/D+BTlvT7fZXqp/aZlacGYcaMJgXdKUh
         /XYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hO5ur43UWRQwBhSoXO1A1AHBjyep85Hij+KLBit2aJw=;
        b=hN2owDfrZYqaL3VAVGhNWGNM12JTIMge7WeDaM10EyeNpX4Yal///gl1dcott107Nf
         xHsHDoAF5ChYTzwvS7CZWCubsSVTpfez8uEpe4RlCIiFbKmdE0dG923Azz1hN/Rp3RYp
         lIupdQnNa7T1CRKKVif5mO/QpSg4IeIMZWdtewGXPCmfrTBKj/UhALz0MQRfA3OY4/cv
         Uz3PbNI2wvpUPxhoBmIf5L8L16KBz9A0htVyZL+oy1+S49ww8q0g595jkVpYlyZtFvyM
         MTmlzTrWTm/i5C652XwlyYiXgD+i5oJt8lrZsvdwUm+u24uugAgI+Ao5u3rUqbSgfwyH
         evrw==
X-Gm-Message-State: APjAAAUs+XVR+xG2us/cdGZ9PXE7+GrKKw92aJfz5WIuO5CYd5Zk75Tq
        CbJ3hTQJL1OW+8ZTT/3OqL1fEtdx2bUwHxbydog=
X-Google-Smtp-Source: APXvYqxkoGIp83bYyfTVAM0Jq1mCy/2KR+OkOsuailbVhYYL60KwjLwQzMgOt7eJCTxowXtqrWzJg1UKmrBFxeYlgiw=
X-Received: by 2002:aca:dad4:: with SMTP id r203mr3001298oig.102.1568909350532;
 Thu, 19 Sep 2019 09:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <1568819121-32737-1-git-send-email-ykaneko0929@gmail.com>
 <20190919120333.77qabr675rne7zlu@verge.net.au> <CAMuHMdWHyzwkqQv-4Dpo-omO7Z96NATANjyrtufbZQ7naCDPQQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWHyzwkqQv-4Dpo-omO7Z96NATANjyrtufbZQ7naCDPQQ@mail.gmail.com>
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date:   Fri, 20 Sep 2019 01:08:59 +0900
Message-ID: <CAH1o70LSiPHOPS8=0XQH1xNhyFJgwXnBSXDcrs87xemnV22Jeg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: irqchip: renesas-irqc: convert bindings
 to json-schema
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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

Hi Geert-san,

Thanks for your review.
I will update this patch.

2019=E5=B9=B49=E6=9C=8819=E6=97=A5(=E6=9C=A8) 21:14 Geert Uytterhoeven <gee=
rt@linux-m68k.org>:
>
> Hi Simon,
>
> On Thu, Sep 19, 2019 at 2:03 PM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Sep 19, 2019 at 12:05:21AM +0900, Yoshihiro Kaneko wrote:
> > > Convert Renesas Interrupt Controller bindings documentation to json-s=
chema.
> > >
> > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,=
irqc.yaml
> > > @@ -0,0 +1,84 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/interrupt-controller/renesas,irqc=
.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
> > > +
> > > +maintainers:
> > > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - renesas,irqc-r8a73a4        # R-Mobile APE6
> > > +          - renesas,irqc-r8a7743        # RZ/G1M
> > > +          - renesas,irqc-r8a7744        # RZ/G1N
> > > +          - renesas,irqc-r8a7745        # RZ/G1E
> > > +          - renesas,irqc-r8a77470       # RZ/G1C
> > > +          - renesas,irqc-r8a7790        # R-Car H2
> > > +          - renesas,irqc-r8a7791        # R-Car M2-W
> > > +          - renesas,irqc-r8a7792        # R-Car V2H
> > > +          - renesas,irqc-r8a7793        # R-Car M2-N
> > > +          - renesas,irqc-r8a7794        # R-Car E2
> > > +          - renesas,intc-ex-r8a774a1    # RZ/G2M
> > > +          - renesas,intc-ex-r8a774c0    # RZ/G2E
> > > +          - renesas,intc-ex-r8a7795     # R-Car H3
> > > +          - renesas,intc-ex-r8a7796     # R-Car M3-W
> > > +          - renesas,intc-ex-r8a77965    # R-Car M3-N
> > > +          - renesas,intc-ex-r8a77970    # R-Car V3M
> > > +          - renesas,intc-ex-r8a77980    # R-Car V3H
> > > +          - renesas,intc-ex-r8a77990    # R-Car E3
> > > +          - renesas,intc-ex-r8a77995    # R-Car D3
> > > +      - const: renesas,irqc
> > > +
> > > +  '#interrupt-cells':
> > > +    # an interrupt index and flags, as defined in interrupts.txt in
> > > +    # this directory
> > > +    const: 2
> > > +
> > > +  interrupt-controller: true
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    minItems: 1
> > > +    maxItems: 32
> >
> > Is 'interrupts' required?
>
> Yes, there must be one upstream interrupt for each supported interrupt in=
put.
> The number of inputs is SoC-specific.
>
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    #include <dt-bindings/clock/r8a7790-clock.h>
> > > +
> > > +    irqc0: interrupt-controller@e61c0000 {
> > > +        compatible =3D "renesas,irqc-r8a7790", "renesas,irqc";
> > > +        #interrupt-cells =3D <2>;
> > > +        interrupt-controller;
> > > +        reg =3D <0 0xe61c0000 0 0x200>;
> > > +        interrupts =3D <0 0 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <0 1 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <0 2 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <0 3 IRQ_TYPE_LEVEL_HIGH>;
>
> While at it, one may want to replace s/0/GIC_SPI/.
>
> > > +        clocks =3D <&mstp4_clks R8A7790_CLK_IRQC>;
>
> and update clocks for the new CPG/MSTP bindings.
>
> > > +    };
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
