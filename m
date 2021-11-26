Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C614245ED10
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 12:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345746AbhKZL6u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 06:58:50 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:33282 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345868AbhKZL4u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 06:56:50 -0500
Received: by mail-vk1-f170.google.com with SMTP id d130so5793876vke.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 03:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Vr6LQRx/2btwNNMMTPm/WQ+WFiCgvUsdZ5S4F38wac=;
        b=AhAY22w3IsKstDTVZOOeWD+r+3P4Sm6SiCz7lgukP8DG8myHDjNPzIPpf59dwoiFjW
         +xYMTGecYVFeAm6/AXv99mOtqXXSK40rZqLD4bno82beJTj2ZJuc9AtNhCA5TT3EznQq
         HBPUF8gJHThU4rwowMhrpwIZaMYrglSRTf0vEUMfeH/K+RX7jxxYcmK3YjpWEkArqYtZ
         +53S6hpW5VgOMCdKqLIcNpFkM5BtmkFlnLUNfXF5gn03PkTiWhNik7TM0hskX4udyzNV
         NQzTb+q/jKlJVTdoSzvN/7WNpJU5Mv26HJ6hpM/pB5Ulzh4iQeJ6kBNck1xo4SE6tmPJ
         78+w==
X-Gm-Message-State: AOAM532yyGc1/3qFXNCkgJ2u1Gp8lNh2Ul44dlbmhmzkW6lHOZ4Un7Su
        f4UTAjJ5IvmM8Sq3v11It0csjJNA8IR3Ag==
X-Google-Smtp-Source: ABdhPJyoOuPKWfEQQ7PvGmqtHJwGud9JbwaGrFcM5JCFy2F1dfMtsokqtNT1Xj4FG/sdP7GC94C1/g==
X-Received: by 2002:a05:6122:2210:: with SMTP id bb16mr18570851vkb.28.1637927617174;
        Fri, 26 Nov 2021 03:53:37 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id c21sm3409948vso.21.2021.11.26.03.53.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 03:53:35 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id n6so18092698uak.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 03:53:35 -0800 (PST)
X-Received: by 2002:a05:6102:3ed4:: with SMTP id n20mr16273698vsv.57.1637927615195;
 Fri, 26 Nov 2021 03:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-2-miquel.raynal@bootlin.com> <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
 <20211119101907.2ce429e6@xps13> <CAMuHMdU_uJv2dUk21DKJnLSUErhvObOb1wJOZTqv_UXZ0edRBQ@mail.gmail.com>
 <20211126124649.498366ee@xps13>
In-Reply-To: <20211126124649.498366ee@xps13>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Nov 2021 12:53:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX74Lj4Jy8Wpmy3Qze36knV5btGEa0O8Y0BjH4m51_D8w@mail.gmail.com>
Message-ID: <CAMuHMdX74Lj4Jy8Wpmy3Qze36knV5btGEa0O8Y0BjH4m51_D8w@mail.gmail.com>
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

On Fri, Nov 26, 2021 at 12:46 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Fri, 19 Nov 2021 10:36:16 +0100:
> > On Fri, Nov 19, 2021 at 10:19 AM Miquel Raynal
> > <miquel.raynal@bootlin.com> wrote:
> > > geert@linux-m68k.org wrote on Fri, 19 Nov 2021 09:41:35 +0100:
> > > > On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
> > > > <miquel.raynal@bootlin.com> wrote:
> > > > > Add a Yaml description for this Renesas NAND controller bindings.
> > > > >
> > > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/mtd/renesas,r9a06g032-nand-controller.yaml
> > > > > @@ -0,0 +1,60 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/mtd/renesas,r9a06g032-nand-controller.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Renesas RZ/N1x NAND flash controller device tree bindings
> > > > > +
> > > > > +maintainers:
> > > > > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: "nand-controller.yaml"
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: renesas,r9a06g032-nand-controller
> > > >
> > > > As the NAND Flash Controller is present on all of RZ/N1D, RZ/N1S,
> > > > and RZ/N1L, I think you should add a family-specific compatible value
> > > > "renesas,rzn1-nand-controller" as a fallback.
> > >
> > > I see, that's right, I should have added two compatibles.
> > >
> > > As there is currently only one 'specific' compatible (r9axxx), should I
> > > describe the two compatibles as being mandatory? Or should I set the
> > > most specific one as optional and the least specific one (rzn1)
> > > mandatory?
> >
> > Yes please.
>
> I am a little bit confused to which answered you said yes.

My apologies: yes to making both mandatory.

> >  Else you need to match on both in the driver, or we cannot
> > differentiate later if the need ever arises.
>
> I believe you meant "yes the two should be described as mandatory in the
> bindings" (at least for now) so that when the need arises, the most
> specific one can be replaced with a oneOf choice. Am I right?

Exactly.

You can already use "enum" for the most-specific one, so it's clear where
to add new lines, and to minimize future changes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
