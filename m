Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63404790C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 16:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235599AbhLQP5i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 10:57:38 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:44580 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238669AbhLQP5h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 10:57:37 -0500
Received: by mail-vk1-f170.google.com with SMTP id u68so1808406vke.11;
        Fri, 17 Dec 2021 07:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SB2NWsmLTsepxyoQU9H+PL596jXArbv3qXU+p+X0c80=;
        b=LtVgfeYoZkVvUL6I8Dab81L+1ffJnXokdCDuhHvrBNci5Pjm5a7GmbAMEtKgEjpynv
         9rmQOdWkhVZeb52H3sx8Odj+NXAPkygbJrpoHe70m6jwvf+KJb9lzIYzfjY8UrODoMsY
         RaVTylSlDBPK+PBvuL6EcEhSgCe3ULe1mltxxG7W4MQLMuvpABBIDg7/eTbmDhxg5f1W
         y3am+g/NRtdpIcA9F6JZnQAnIkyTO8sauM7Wlj5/KLlzHCBXK+YTuxWth2Egj8uZOYmb
         ZkqX+6xbL3oAZM9TAqB6/v8NdCbw1iKk5vU2AXoXTVSEGAn4ubtitqosM05Hn/DA+6Pn
         Do3g==
X-Gm-Message-State: AOAM533Cn8FsCmmk8Ib8v42J6CwTQrWYXXuvSwD8/PMwXXfTqm7JRzby
        +VDd58PxH96QJT5pRapmV1Qx47fGN9iD+A==
X-Google-Smtp-Source: ABdhPJx47cEiW/iuReh+eN3IzGyFTt7KoF2ASY/Bn814a+Srm/9DkA4ompCtxT0b2NYkqXGruIp85A==
X-Received: by 2002:a05:6122:21a2:: with SMTP id j34mr1553066vkd.17.1639756656874;
        Fri, 17 Dec 2021 07:57:36 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id r202sm125674vkf.28.2021.12.17.07.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 07:57:36 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 70so1819428vkx.7;
        Fri, 17 Dec 2021 07:57:36 -0800 (PST)
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr1456326vke.33.1639756341701;
 Fri, 17 Dec 2021 07:52:21 -0800 (PST)
MIME-Version: 1.0
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
 <20211217142033.353599-2-miquel.raynal@bootlin.com> <CAMuHMdWnyLjzDf0oC1ttTarY4kaJD+xcrnkvug-i+8GHgRWmyg@mail.gmail.com>
 <20211217165102.6950cf40@xps13>
In-Reply-To: <20211217165102.6950cf40@xps13>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Dec 2021 16:52:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbusN_wdLYPP4DuVJ+E+OAw7_v-9o9sY-t=YdiM7271g@mail.gmail.com>
Message-ID: <CAMuHMdVbusN_wdLYPP4DuVJ+E+OAw7_v-9o9sY-t=YdiM7271g@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: mtd: renesas: Describe Renesas R-Car
 Gen3 & RZ/N1 NAND controller
To:     Miquel Raynal <miquel.raynal@bootlin.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

On Fri, Dec 17, 2021 at 4:51 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Fri, 17 Dec 2021 16:44:59 +0100:
> > On Fri, Dec 17, 2021 at 3:20 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > Add a Yaml description for this Renesas NAND controller.
> > >
> > > As this controller is embedded on different SoC families, provide:
> > > * a family-specific "r-car-gen3" compatible and a more specific
> > >   "r8a77951" one
> > > * a family-specific "rzn1" compatible and a more specific "r9a06g032"
> > >   one
> > >
> > > More compatibles can be added later if new SoCs with this controller
> > > must be supported.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Thanks for the update!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
> > > @@ -0,0 +1,66 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mtd/renesas-nandc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Renesas R-Car Gen3 & RZ/N1x NAND flash controller device tree bindings
> > > +
> > > +maintainers:
> > > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > > +
> > > +allOf:
> > > +  - $ref: "nand-controller.yaml"
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - renesas,r8a77951-nandc
> > > +          - const: renesas,rcar-gen3-nandc
> >
> > Might be a bit premature to add these before they have been tested,
> > and because there are small differences in integration, cfr. below.
> >
> > > +
> > > +      - items:
> > > +          - enum:
> > > +              - renesas,r9a06g032-nandc
> > > +          - const: renesas,rzn1-nandc
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: APB host controller clock
> > > +      - description: External NAND bus clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: hclk
> > > +      - const: eclk
> >
> > On R-Car Gen3, there's a single module clock.
> > Plus a power-domain to manage that.
> >
> > Actually the RZ/N1 clock driver also registers a PM Domain, so letting
> > Runtime PM manage the clocks may work on RZ/N1, too...
> >
> > On R-Car Gen3, there's also a module reset.
>
> Ok, I didn't know. I propose to drop the r-car-gen3 compatible entirely
> from the driver and the binding when I'll apply the series. Is it fine
> for you?

Yes, that's fine for me. Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
