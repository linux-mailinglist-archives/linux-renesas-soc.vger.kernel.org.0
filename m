Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B49B456C3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 10:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234138AbhKSJWN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 04:22:13 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:40767 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232838AbhKSJWN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 04:22:13 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B9AF2E0003;
        Fri, 19 Nov 2021 09:19:08 +0000 (UTC)
Date:   Fri, 19 Nov 2021 10:19:07 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1 NAND
 controller
Message-ID: <20211119101907.2ce429e6@xps13>
In-Reply-To: <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
        <20211118111940.1275351-2-miquel.raynal@bootlin.com>
        <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

geert@linux-m68k.org wrote on Fri, 19 Nov 2021 09:41:35 +0100:

> Hi Miquel,
> 
> CC Gareth
> 
> On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> > Add a Yaml description for this Renesas NAND controller bindings.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>  
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/renesas,r9a06g032-nand-controller.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/renesas,r9a06g032-nand-controller.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/N1x NAND flash controller device tree bindings
> > +
> > +maintainers:
> > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > +
> > +allOf:
> > +  - $ref: "nand-controller.yaml"
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a06g032-nand-controller  
> 
> As the NAND Flash Controller is present on all of RZ/N1D, RZ/N1S,
> and RZ/N1L, I think you should add a family-specific compatible value
> "renesas,rzn1-nand-controller" as a fallback.

I see, that's right, I should have added two compatibles.

As there is currently only one 'specific' compatible (r9axxx), should I
describe the two compatibles as being mandatory? Or should I set the
most specific one as optional and the least specific one (rzn1)
mandatory?

I'll then rename the yaml file, the MAINTAINERS entry and the
compatible in the driver of course.

> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    nand-controller@40102000 {
> > +        compatible = "renesas,r9a06g032-nand-controller";
> > +        reg = <0x40102000 0x2000>;
> > +        interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&hclk_nand>, <&clk_nand>;  
> 
> This clocks property is not based on an actual .dtsi, right?

It's not indeed. As said in the cover letter I am going to work on the
clock tree (nov-dec 2021) because I would like to have this driver fully
working on a mainline base. So far I used a mixed vendor/upstream DT
just to have access to the clocks and focus on the 'real' feature but
now that it is working I am going to switch on the clocks side
(hopefully with your support :) ).

> 
> > +        clock-names = "hclk", "eclk";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +    };  
> 
> The rest looks good to me.

Thanks for the review!

Thanks,
Miquèl
