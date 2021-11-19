Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE0F1456C6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 10:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhKSJjb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 04:39:31 -0500
Received: from mail-vk1-f174.google.com ([209.85.221.174]:44883 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232969AbhKSJja (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 04:39:30 -0500
Received: by mail-vk1-f174.google.com with SMTP id u68so5513600vke.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 01:36:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K6pUQJ8pyQkzbHxZwmUeymcTJqi29mxOuyrl7ESyUNI=;
        b=0szbfN3VtiW1b/ybOdNnGfJ8FVGTJ0gfkeBBIC/hl2udO//1TGE2cLfHvenzSxDjkT
         5kUWSr464JGoi2eVLe9pJkN0Cf396JmMTbc7ZLkIjRu/Na3XaRodV5i0xHdgqun7UVx+
         WxoAw50f/7rz+BFaWsXxbSOE1EeTqFmASIwxkdKU9Ml8h6Xbl9q6NGFYtGh6k/tlYMq2
         dMGH5R3Y2bwPUUXJPynWVD1j6Od7oyWVD8C4fpv1cDkEBj/KbJHVKtkg38IwKXOrFfHQ
         oH2I2v58I/sC6q0Mfm1P5WbaEvplkgna3L7RfW3mkno4wFrNm1ERVFHTPnhblxFrSl2H
         tV5g==
X-Gm-Message-State: AOAM531lmWAXYCRhVAD+iOLV42O6hykm+am0Q4VgQfzaI9c6zHAMoB7q
        DcUSb1+8zvfYUcHwBjiyHKeKu2hphz3H1A==
X-Google-Smtp-Source: ABdhPJwVx8cRMzAXnGUVGJLBg1nQk3PjDr+Uo/I6KaN1A/GB2Eru9+5Q2lfhmHLDjHgoPwo4pyIg0g==
X-Received: by 2002:a05:6122:1796:: with SMTP id o22mr116509140vkf.23.1637314588870;
        Fri, 19 Nov 2021 01:36:28 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id p3sm1456932vsr.3.2021.11.19.01.36.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 01:36:28 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id b192so5551709vkf.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 01:36:27 -0800 (PST)
X-Received: by 2002:a05:6122:50e:: with SMTP id x14mr115833208vko.7.1637314587611;
 Fri, 19 Nov 2021 01:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-2-miquel.raynal@bootlin.com> <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
 <20211119101907.2ce429e6@xps13>
In-Reply-To: <20211119101907.2ce429e6@xps13>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Nov 2021 10:36:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_uJv2dUk21DKJnLSUErhvObOb1wJOZTqv_UXZ0edRBQ@mail.gmail.com>
Message-ID: <CAMuHMdU_uJv2dUk21DKJnLSUErhvObOb1wJOZTqv_UXZ0edRBQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1 NAND controller
To:     Miquel Raynal <miquel.raynal@bootlin.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

On Fri, Nov 19, 2021 at 10:19 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Fri, 19 Nov 2021 09:41:35 +0100:
> > On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
> > <miquel.raynal@bootlin.com> wrote:
> > > Add a Yaml description for this Renesas NAND controller bindings.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/renesas,r9a06g032-nand-controller.yaml
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mtd/renesas,r9a06g032-nand-controller.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Renesas RZ/N1x NAND flash controller device tree bindings
> > > +
> > > +maintainers:
> > > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > > +
> > > +allOf:
> > > +  - $ref: "nand-controller.yaml"
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: renesas,r9a06g032-nand-controller
> >
> > As the NAND Flash Controller is present on all of RZ/N1D, RZ/N1S,
> > and RZ/N1L, I think you should add a family-specific compatible value
> > "renesas,rzn1-nand-controller" as a fallback.
>
> I see, that's right, I should have added two compatibles.
>
> As there is currently only one 'specific' compatible (r9axxx), should I
> describe the two compatibles as being mandatory? Or should I set the
> most specific one as optional and the least specific one (rzn1)
> mandatory?

Yes please.  Else you need to match on both in the driver, or we cannot
differentiate later if the need ever arises.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
