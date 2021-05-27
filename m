Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C196392CAB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 13:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbhE0LaK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 07:30:10 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:34356 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhE0LaK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 07:30:10 -0400
Received: by mail-vs1-f43.google.com with SMTP id x13so192023vsh.1;
        Thu, 27 May 2021 04:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=33GSI50sxu92I8IBITQZbN0A1jxl04eHMvNt/IrTGXc=;
        b=aa/oY4yZZUa8yyXmF5vkq6/da72PygoCYSVxB+IllQhHK/kLZAfUSjONkqHi1kSPIs
         JD0GxiavafwGTiiLykML129586f2Df2i9Z0WuuqiHGuGYOQDowNAWmKP80+6G+FmUxwu
         uzXcGx3Zs0YKlk7B4CqXqxiTWTLJW6HwOTUKRFeDVaoWd5Eq8G4X4Q16BlFKgU44mMaW
         6s/rZFDbXZFPoLoNQAN5EP/OPG95YX2Y35SLjdkR+7OHjco3Y6iggLe45VXYNYcwRe98
         uvbPqlm73+ytGDaGM7GuxKNq57oq5XG8QMo4Zlz+k75nEARDQYNLAMV5bA8O5JzU0QLT
         fozw==
X-Gm-Message-State: AOAM530Fty12jBHE7NFvAEQzcvkuDSz+K6Dcr+1uvMmKSg6yWaP7R/dB
        wRlZkucADDwfjgo3EcdgUSe1E3vt00ZtuhwCqIg=
X-Google-Smtp-Source: ABdhPJw7dGjhkE2M0QJo1TMHQN5dIq1LOERf9w53NN4gy0CAFSv/lT9VSrQegZJtzjXjzQqnotB7VDTxF3be56GaASM=
X-Received: by 2002:a67:4386:: with SMTP id q128mr1725781vsa.40.1622114915482;
 Thu, 27 May 2021 04:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXdATYWRGL9PMkR_Fj-m-E5GUuPbHq0hZ_Mh=ceedF=RA@mail.gmail.com> <CA+V-a8uNB-RyyweQ--vjdiA1NRB7_-VRYBPq9YUxFT4pFRTKBA@mail.gmail.com>
In-Reply-To: <CA+V-a8uNB-RyyweQ--vjdiA1NRB7_-VRYBPq9YUxFT4pFRTKBA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 13:28:24 +0200
Message-ID: <CAMuHMdWKdrn7ikT_qRrb0pVYxk3g7MgVk+qwJER61gbesQiPHA@mail.gmail.com>
Subject: Re: [PATCH 02/16] dt-bindings: arm: renesas: Document Renesas
 RZ/G2{L,LC} SoC variants
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, May 21, 2021 at 7:10 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, May 21, 2021 at 2:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Add device tree bindings documentation for Renesas RZ/G2{L,LC}
> > > SoC variants.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> >
> > > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > > @@ -308,6 +308,15 @@ properties:
> > >                - renesas,r9a07g043u11 # Single Cortex-A55 RZ/G2UL
> > >            - const: renesas,r9a07g043
> > >
> > > +      - description: RZ/G2{L,LC} (R9A07G044)
> > > +        items:
> > > +          - enum:
> > > +              - renesas,r9a07g044c1 # Single Cortex-A55 RZ/G2LC
> > > +              - renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
> > > +              - renesas,r9a07g044l1 # Single Cortex-A55 RZ/G2L
> > > +              - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
> >
> > Given the LSI DEVID is the same for all four, and presumably they're
> > thus the same die with different packaging, do we need these four
> > compatible values?
> >
> Yes the LSI DEVID is the same for all the above, so as to
> differentiate between each SoC's, these compatible strings are added.

OK, especially for single-core versus dual-core, this can be useful,
if "integration issues" pop up depending on the number of cores
or other functionality being present.

> * For example some IP blocks which are present on RZ/G2L aren't
> present in RZ/G2LC.

That'll be handled by the .dtsi, right?

> * Adding this to DTS gives an opportunity to stop booting if the wrong
> DTB is loaded into the board.

This only works for SoCs with different LSI DEVIDs.
As all four above have the same LSI DEVID, you can only distinguish
them by the main compatible value.  It does not protect against
loading an RZ/G2LC DTB on an RZ/G2L board or vice versa.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
