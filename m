Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9E0392D0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 13:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234134AbhE0LtP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 07:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233270AbhE0LtO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 07:49:14 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2759C061574;
        Thu, 27 May 2021 04:47:40 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id z38so253624ybh.5;
        Thu, 27 May 2021 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uAvn4qJmbR7pfsWrroZ0CpB4BVEbmomEKDPF3PtlO9Q=;
        b=Pgyvf5UZZlOlje+DRt5xMdDa/bInnZPl9vYw4fr6na3v2is5metZCFw0K+2sJh+u7H
         0zdLzfCNEocGoW/fo2SdQ8WVXE8txJ2dXIUbLnQVxzqcKLVBoTkcpjADfeHWf/I9heK5
         +PRZ8FT1cphqzk8/asfCdsaydQpZ03qWxikvGF9wNH6iwuIrGbb+yLhPDzlNtLlMFyC0
         YJc/aFyXbBm3K1Y7mi4LxSyXyjFL0plD8cJsSnAb3CSciSzkfFOF6j2CDSeNPFHTsxt/
         RJF3YI3489LlhC4lmgV2SQDYDGFrf06+uC37/8wKkDjFB8yYwKiMdJFJROmzOzAM5E3x
         c5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uAvn4qJmbR7pfsWrroZ0CpB4BVEbmomEKDPF3PtlO9Q=;
        b=lS7xP6nUS/nEC0/8OfmW2PJMakyRb5Rwo/XEzCy06EDEGzb/Oil9t4ees50QORc93y
         guarK+QPrWHlZZbOzK1FcZFd/j76zGW/TK5H0RbZRLW6dbx3n+PTNFLj1G2LhNOXouNk
         yFOQTg1kidIZnoxtIXXHCgzDLPR8VyOCB3po1IbYNp6LwOQ2sGGFcDoHUVqch2+mRO19
         tD8REsgziEMsA4VfObaiMh8WGbZUyhCYOCoA9MUBN9iVnbPO+dvfda/jeQW929p4QY3J
         mT8XMZPJ9IRO2/F2D8UsVTq4+PH9YsvToHgn6DpgK7ybHHHTICReRCU9LwM6wgKlahyD
         zVIw==
X-Gm-Message-State: AOAM532prg+Z8uw/GeJ+z6/HpZpGAGE6T2wEn76AS4ZiBJJ5/SxUvc0A
        6JVKqtxDsmRho7JqkAys1IIbh5s7sXk1uMxj/Gk=
X-Google-Smtp-Source: ABdhPJzSWw3v1y5zfVZV8NDGqJl70Whj+zfZ0W2Vfv6uxkL3uU2XbiCIe3bcX9FmGEF3G4ld8NmnTGJTmQN+HXKq7Ro=
X-Received: by 2002:a25:8190:: with SMTP id p16mr3955667ybk.156.1622116060146;
 Thu, 27 May 2021 04:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU40pLb3LvEghkT0pryLtHdXj+U1R7Y7L6-_6euVohyUw@mail.gmail.com>
 <CA+V-a8tFsAO2yYqURT1gYS14_Eax1VqJ1YbgcnfZADtOMLXFMA@mail.gmail.com> <CAMuHMdWc-ZdrpsOu_QhUvh7D3ap7ZC4LM_vKwnLnGCAEmAoryA@mail.gmail.com>
In-Reply-To: <CAMuHMdWc-ZdrpsOu_QhUvh7D3ap7ZC4LM_vKwnLnGCAEmAoryA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 27 May 2021 12:47:14 +0100
Message-ID: <CA+V-a8vL1hEz0m0C934NLfLtniU+eGfn8YmBkQsB04wtHo_y_w@mail.gmail.com>
Subject: Re: [PATCH 01/16] dt-bindings: arm: renesas: Document Renesas RZ/G2UL SoC
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

On Thu, May 27, 2021 at 12:29 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, May 21, 2021 at 6:54 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, May 21, 2021 at 2:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > Add device tree bindings documentation for Renesas RZ/G2UL SoC.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > > > @@ -302,6 +302,12 @@ properties:
> > > >                - renesas,rzn1d400-db # RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
> > > >            - const: renesas,r9a06g032
> > > >
> > > > +      - description: RZ/G2UL (R9A07G043)
> > > > +        items:
> > > > +          - enum:
> > > > +              - renesas,r9a07g043u11 # Single Cortex-A55 RZ/G2UL
> > >
> > > Is there any specific reason you're including the final "1", unlike the
> > > RZ/G2{L,LC} binding?
> > >
> > To be consistent with the RZ/G2L family of SoC's "1" is appended to
> > the compatible string.
>
My bad, the reason for adding 1 in the end was there are two variants
of RZ/G2UL [1].  For the next respin I'll include renesas,r9a07g043u12
too.

> No, for RZ/G2L you have:
>
>     renesas,r9a07g044c1 for r9a07g044c12
>     renesas,r9a07g044c2 for r9a07g044c22
>     renesas,r9a07g044l1 for r9a07g044l13 and r9a07g044l14
>     renesas,r9a07g044l2 for r9a07g044l23 and r9a07g044l24
>
> i.e. the compatible value lacks the final digit.
>
> For RZ/G2UL, I do not know if we have to distinguish between
> r9a07g043u11 and r9a07g043u12.
>
Some IP blocks are missing in type2 compared to type1. And at the
higher level we might want to know the exact SoC type the board is
built ?

> > > As RZ/G2UL is always single-core, perhaps this compatible value can be
> > > dropped?
> > >
> > Do agree with you.
>
> In light of the continued discussion for [PATCH 02/16], perhaps it's
> good to keep it anyway?
>
Yes will keep the compatible string.

[1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-arm-based-high-end-32-64-bit-mpus/rzg2ul-general-purpose-microprocessors-single-core-arm-cortex-a55-10-ghz-cpu-2ch-giga-bit-ethernet

Cheers,
Prabhakar
