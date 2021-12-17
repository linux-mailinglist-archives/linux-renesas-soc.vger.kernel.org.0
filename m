Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B38479059
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 16:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235840AbhLQPvK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 10:51:10 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:53349 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbhLQPvJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 10:51:09 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7D67460007;
        Fri, 17 Dec 2021 15:51:04 +0000 (UTC)
Date:   Fri, 17 Dec 2021 16:51:02 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Wolfram Sang <wsa@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: mtd: renesas: Describe Renesas
 R-Car Gen3 & RZ/N1 NAND controller
Message-ID: <20211217165102.6950cf40@xps13>
In-Reply-To: <CAMuHMdWnyLjzDf0oC1ttTarY4kaJD+xcrnkvug-i+8GHgRWmyg@mail.gmail.com>
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
        <20211217142033.353599-2-miquel.raynal@bootlin.com>
        <CAMuHMdWnyLjzDf0oC1ttTarY4kaJD+xcrnkvug-i+8GHgRWmyg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

geert@linux-m68k.org wrote on Fri, 17 Dec 2021 16:44:59 +0100:

> Hi Miquel,
> 
> On Fri, Dec 17, 2021 at 3:20 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > Add a Yaml description for this Renesas NAND controller.
> >
> > As this controller is embedded on different SoC families, provide:
> > * a family-specific "r-car-gen3" compatible and a more specific
> >   "r8a77951" one
> > * a family-specific "rzn1" compatible and a more specific "r9a06g032"
> >   one
> >
> > More compatibles can be added later if new SoCs with this controller
> > must be supported.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Rob Herring <robh@kernel.org>  
> 
> Thanks for the update!
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/renesas-nandc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car Gen3 & RZ/N1x NAND flash controller device tree bindings
> > +
> > +maintainers:
> > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > +
> > +allOf:
> > +  - $ref: "nand-controller.yaml"
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r8a77951-nandc
> > +          - const: renesas,rcar-gen3-nandc  
> 
> Might be a bit premature to add these before they have been tested,
> and because there are small differences in integration, cfr. below.
> 
> > +
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a06g032-nandc
> > +          - const: renesas,rzn1-nandc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: APB host controller clock
> > +      - description: External NAND bus clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: hclk
> > +      - const: eclk  
> 
> On R-Car Gen3, there's a single module clock.
> Plus a power-domain to manage that.
> 
> Actually the RZ/N1 clock driver also registers a PM Domain, so letting
> Runtime PM manage the clocks may work on RZ/N1, too...
> 
> On R-Car Gen3, there's also a module reset.

Ok, I didn't know. I propose to drop the r-car-gen3 compatible entirely
from the driver and the binding when I'll apply the series. Is it fine
for you?

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
> > +
> > +    nand-controller@40102000 {
> > +        compatible = "renesas,r9a06g032-nandc", "renesas,rzn1-nandc";
> > +        reg = <0x40102000 0x2000>;
> > +        interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&sysctrl R9A06G032_HCLK_NAND>, <&sysctrl R9A06G032_CLK_NAND>;
> > +        clock-names = "hclk", "eclk";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +    };  
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


Thanks,
Miquèl
