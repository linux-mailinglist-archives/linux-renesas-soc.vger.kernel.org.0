Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B3438CB96
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 19:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhEURLk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 13:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhEURLk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 13:11:40 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26996C061574;
        Fri, 21 May 2021 10:10:16 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id y36so11810403ybi.11;
        Fri, 21 May 2021 10:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6PyJIHGnDYh6P31ntK4ge2w93dHWPRrD4kywlBEOeWc=;
        b=kALmOtFCp+8NprW7sjYSuh7FbN7jOmHzc2LDU3WTB83s3Tg15h10xuq0HhjkatVjHN
         ysLXDhTTxfvqOXFePbKR+zQixXEbSZhmvXlJ6JIs1lx/ciOHRkCcrz2WCP+pBeTRd8g9
         wYYmb1xlOf8P3fOsC9XEGH+OD5R6cEDya+2sxrtlUfi6qQvGouMs5IMsBIntZxIL6gQJ
         uk/+bl5osdAZNliiL71LhljwO15vgpd27tKxbk2xr7h1fK7nxGf12d2kVvgRD1uVSHnf
         LKUAHNNO8DSPdaZ7Owpd+g3IJBxUkNEWzarO7NXMN7d2as1G0BKVOf1E3gu69nxi2WjE
         +aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6PyJIHGnDYh6P31ntK4ge2w93dHWPRrD4kywlBEOeWc=;
        b=RS6HVqZZVOzl2i0lJ6J4Tkd6btAMHVELzYD7xRDmIpgIEp6Sm4ihS+FFevLU2hOl6C
         pPjLEYF+JtpfgrX8cXk9IzVyBY7vrb1+iRtL4ibbOqv74HY5bD9OzNPGTFMXXUTYzPY2
         vEnZQYwwCGrms7rfttWqL/I/uAjBa6E3cZ5LSThQQet7PJ5/WgN/1I1/eUxiayGsLeBH
         vlxPYuNqUMqBiFOcXn+2WGozPamKJ+gaTaV4ab9r+Sp1QtyhQjbqNCRO1s7EBpzFsimZ
         9DRx2JozOGDT6FwagwSMGh8nUl2MTM5mdVrnr2mY1wmWcVe/u9x3vwzy1dTNGjHDspLp
         W+wg==
X-Gm-Message-State: AOAM532hd7rl0rusXlJm0q9/7XoUQnxhn+OWFXPsnRPn+Ajq8q9h0+BW
        VpAgA/OOiWVAayXn1IByCmrbnJMJ9gKPOjdm/tcjUncyNQmrbw==
X-Google-Smtp-Source: ABdhPJyOXBxBWPxL6sPBpuZzkIVbeixOcFk8AsstI46d5WBRX0C/zS1v0WAX4R7QQeEIpFsdCA9NPbGJ0Mjs72+mE44=
X-Received: by 2002:a5b:54a:: with SMTP id r10mr16608668ybp.476.1621617015403;
 Fri, 21 May 2021 10:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXdATYWRGL9PMkR_Fj-m-E5GUuPbHq0hZ_Mh=ceedF=RA@mail.gmail.com>
In-Reply-To: <CAMuHMdXdATYWRGL9PMkR_Fj-m-E5GUuPbHq0hZ_Mh=ceedF=RA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 21 May 2021 18:09:49 +0100
Message-ID: <CA+V-a8uNB-RyyweQ--vjdiA1NRB7_-VRYBPq9YUxFT4pFRTKBA@mail.gmail.com>
Subject: Re: [PATCH 02/16] dt-bindings: arm: renesas: Document Renesas
 RZ/G2{L,LC} SoC variants
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

Thank you for the review.

On Fri, May 21, 2021 at 2:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hii Prabhakar,
>
> On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add device tree bindings documentation for Renesas RZ/G2{L,LC}
> > SoC variants.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
>
> > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > @@ -308,6 +308,15 @@ properties:
> >                - renesas,r9a07g043u11 # Single Cortex-A55 RZ/G2UL
> >            - const: renesas,r9a07g043
> >
> > +      - description: RZ/G2{L,LC} (R9A07G044)
> > +        items:
> > +          - enum:
> > +              - renesas,r9a07g044c1 # Single Cortex-A55 RZ/G2LC
> > +              - renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
> > +              - renesas,r9a07g044l1 # Single Cortex-A55 RZ/G2L
> > +              - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
>
> Given the LSI DEVID is the same for all four, and presumably they're
> thus the same die with different packaging, do we need these four
> compatible values?
>
Yes the LSI DEVID is the same for all the above, so as to
differentiate between each SoC's, these compatible strings are added.
* For example some IP blocks which are present on RZ/G2L aren't
present in RZ/G2LC.
* Adding this to DTS gives an opportunity to stop booting if the wrong
DTB is loaded into the board.

Cheers,
Prabhakar

> > +          - const: renesas,r9a07g044
> > +
> >  additionalProperties: true
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
