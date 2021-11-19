Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC7C456BCE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 09:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbhKSIqd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 03:46:33 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:34441 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232969AbhKSIqd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 03:46:33 -0500
Received: by mail-ua1-f46.google.com with SMTP id n6so19820787uak.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 00:43:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8WOd2SODEE+htCsUwpfTOfsY7kLZIEqXetxyg07nI8k=;
        b=aNdgz2p1Bi2dLA2V7qZLCe7eHJ/slO3gbiHK87eWxk7vFMi/YkzizD47wLwhjqdjf6
         A+wiXTmK7dseGPdq/P1B/UurTJ25qzlxPf2ZtF+zHbIQzdaxa23AsSbGFTT2xwbmStbG
         A1qzNKDBVpYgcCg5LqjUSkiFvmZbKkODTnYnibUpEiHyVmmgDW2bzh49E1Yt0vIrECaY
         vvrGRpssdvIiNK8vQX6gAJuX8qqyIjocNqNN4mGCVD7TMP75SC1au6cyZv+egjxI4Z+B
         rJrmjfJ+aEXKHyrjhtbR0TX973M2dYB1DvnnDEtKrvwD+Ix0gM4GGcun1PBAQJmx/Bhk
         qKOA==
X-Gm-Message-State: AOAM533bkRMfLdkBGi5Dj0T4UImSmecO4amilypyYR66x4TDLRZavfrT
        FO0HH6CDZx+0oieryqZl/IJC8WgNABDiPQ==
X-Google-Smtp-Source: ABdhPJzUupp1LfLh7ccxhHPfGIfQ7IXM94j17M02qeMQIeOWqKJ5R+7qEqWMN9OSxh/O4VBPnC6/MA==
X-Received: by 2002:a67:c79a:: with SMTP id t26mr81829739vsk.37.1637311411189;
        Fri, 19 Nov 2021 00:43:31 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id h7sm1282977vkk.2.2021.11.19.00.43.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 00:43:30 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id az37so19683906uab.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 00:43:30 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr46605103uae.122.1637311410025;
 Fri, 19 Nov 2021 00:43:30 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-2-miquel.raynal@bootlin.com> <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
In-Reply-To: <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Nov 2021 09:43:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMJ+KMSCWRs3KpzMnf2KkQjbXqFPH9ceJ5y04mQzv6=w@mail.gmail.com>
Message-ID: <CAMuHMdWMJ+KMSCWRs3KpzMnf2KkQjbXqFPH9ceJ5y04mQzv6=w@mail.gmail.com>
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

On Fri, Nov 19, 2021 at 9:41 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
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

And please rename the file to renesas,rzn1-nand-controller.yaml.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
