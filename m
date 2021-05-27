Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD044392D16
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 13:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbhE0Lvk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 07:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbhE0Lvk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 07:51:40 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2EABC061574;
        Thu, 27 May 2021 04:50:06 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id y2so206388ybq.13;
        Thu, 27 May 2021 04:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q1kENDG0WR8mOBK1OsInJzP26DtLwlvBt7ZWJLHTsCU=;
        b=ethVlmFYyKvR07Bfu9hSsFdqECyFYAc27wDmhxhmRy+O+zS8rHtUNJB7sO1v8LJPQt
         DC5z4Q4kKHt7QZjqLYlovBiZ6pPK/aT4WH7NMKRWWYhXhkO8rK3xNsS9bP9CK1Xv0JCi
         iBDf+bY5dnYTILyxnI8VvkElAeCJenOPE+XLFrLPtzhkbEFA5R/DoTbKTsROK00sMWWg
         y9+Ol7/zsRHv1QNWw6ICt+gIfBm33k7j6ZxDZc4wimTtFi1jP9klA/3fRLZNiJmRr87g
         rptRrDVUyJp9uS1Ue+lfkofBl3dY3EiWwAC36pu7jZD5Efz5vKLULPV3UjsZbhMdB4Jx
         p9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q1kENDG0WR8mOBK1OsInJzP26DtLwlvBt7ZWJLHTsCU=;
        b=cFEshztxC4y9RHZ9ISJ2YXas7gRkBNNkQcUBIo9KMtrcH7Q1AMR9pC+WbcWtZmsyLA
         JEQqvNdfdJ7NwY6b9q9ofCcXzJ8rvNItTlB165mi62VCcuDLfPHIToJdfwGl2fuauPJn
         yVCTD8cMoS6fY3rHEHQn2FUiw9dlH+Wk9qNq81TC2VzVRHcvNOr9t5PeXHGbkA8/N3zN
         5VIvfw+E9Wr53yApLMY+pEbUGpqGRK/yZtsqLkSEmxhaLO2dCptYGwGXP7mDoSvycQMo
         rIYUnoi7uZgvpQYAh+oZ+beLo6Bvcsvtv3Yvut3nPvAhQ9yvyncyBR2XbZuZvWAVdwDG
         7dPA==
X-Gm-Message-State: AOAM5339/Gh0ORyIYNV4fITQOqBzI2TGNwZw9ZLx2spMt0XZgTCrrGro
        YNMf8mzy5ukb+YGgOo2uEThmnI249c6r9N46dRM=
X-Google-Smtp-Source: ABdhPJyxwMUStrDxwfF3K0zzCJrk3hadYFH3qRVvvtR+hbTLebxhsKoBQApK/1kGsfGE7L5iwcI/D2VUdnoE4W4PhPY=
X-Received: by 2002:a5b:54a:: with SMTP id r10mr4049339ybp.476.1622116205936;
 Thu, 27 May 2021 04:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXdATYWRGL9PMkR_Fj-m-E5GUuPbHq0hZ_Mh=ceedF=RA@mail.gmail.com>
 <CA+V-a8uNB-RyyweQ--vjdiA1NRB7_-VRYBPq9YUxFT4pFRTKBA@mail.gmail.com> <CAMuHMdWKdrn7ikT_qRrb0pVYxk3g7MgVk+qwJER61gbesQiPHA@mail.gmail.com>
In-Reply-To: <CAMuHMdWKdrn7ikT_qRrb0pVYxk3g7MgVk+qwJER61gbesQiPHA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 27 May 2021 12:49:40 +0100
Message-ID: <CA+V-a8uB5308YszoxeuTr_3UwXC-BK9bXz58B2iR4kfadTUOjg@mail.gmail.com>
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

On Thu, May 27, 2021 at 12:28 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, May 21, 2021 at 7:10 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, May 21, 2021 at 2:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > Add device tree bindings documentation for Renesas RZ/G2{L,LC}
> > > > SoC variants.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > >
> > > > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > > > @@ -308,6 +308,15 @@ properties:
> > > >                - renesas,r9a07g043u11 # Single Cortex-A55 RZ/G2UL
> > > >            - const: renesas,r9a07g043
> > > >
> > > > +      - description: RZ/G2{L,LC} (R9A07G044)
> > > > +        items:
> > > > +          - enum:
> > > > +              - renesas,r9a07g044c1 # Single Cortex-A55 RZ/G2LC
> > > > +              - renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
> > > > +              - renesas,r9a07g044l1 # Single Cortex-A55 RZ/G2L
> > > > +              - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
> > >
> > > Given the LSI DEVID is the same for all four, and presumably they're
> > > thus the same die with different packaging, do we need these four
> > > compatible values?
> > >
> > Yes the LSI DEVID is the same for all the above, so as to
> > differentiate between each SoC's, these compatible strings are added.
>
> OK, especially for single-core versus dual-core, this can be useful,
> if "integration issues" pop up depending on the number of cores
> or other functionality being present.
>
> > * For example some IP blocks which are present on RZ/G2L aren't
> > present in RZ/G2LC.
>
> That'll be handled by the .dtsi, right?
>
Agreed.

Cheers,
Prabhakar

> > * Adding this to DTS gives an opportunity to stop booting if the wrong
> > DTB is loaded into the board.
>
> This only works for SoCs with different LSI DEVIDs.
> As all four above have the same LSI DEVID, you can only distinguish
> them by the main compatible value.  It does not protect against
> loading an RZ/G2LC DTB on an RZ/G2L board or vice versa.
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
