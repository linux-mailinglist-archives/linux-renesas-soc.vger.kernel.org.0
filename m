Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767C538CB59
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 18:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237842AbhEUQ4U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 12:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237802AbhEUQ4T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 12:56:19 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802D0C0613ED;
        Fri, 21 May 2021 09:54:55 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id y2so28316233ybq.13;
        Fri, 21 May 2021 09:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qNDhTrL0N439MhCKg5eDpr3/xHuRHa7DwSQYNtIdcTc=;
        b=WwdqXcgkSphVGeoYQlwRAjESqehVHk0iWq4Hwnz7H3YB9/GZzb75+r6bEGjrTtxd5y
         fHmyW12pXz0H0J38qTEh5DVLXJPLPjxK7eDSM9BSM/OY4QcSiLfMjiMHaT8lNCn9ZCZQ
         LdUfN3LPQNTCCWG0bUIgoGtxLdjnPnrEqhEYdr48aKDzNm6AbjeP1Ya/VyfGoy8E3Omd
         ZSZKpZdII0x+uSWvYiBBMxnLf01qzYYioqVEYlr74q2OBgKNneIBb8R+VNjvFO9C+kju
         zeo/+/BCxzlIOzUH0ieeLtpcVMdtxif1ksyL6v+I2C9YXsr7IR+clK/KvLMcBUT2cpjk
         SVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qNDhTrL0N439MhCKg5eDpr3/xHuRHa7DwSQYNtIdcTc=;
        b=Xy4LDMgY/52pL3FI4tEYmBqGo7K73h1SnvVZQ9dx5xol4bZEjBmetFGJi0uBVRQLh1
         stb5pxwdU4EMSNpsboszkKAATKP6GkM1/n0JLVANUZcg264eDGXbLUd9vTHFhxSXs+vN
         nyyn/kVUc6AVQgIzKYik9cGrsfW077x3YKfWptf49kBPSzUTAIxiy+QpdDUdkqKAkZN1
         1ZsGCoUJKDWvDVqK65xm5u8k2teJVvQFmAsvB0r9N9zs8sphkqC6YrtXdRJQK3RNuZr4
         HfuYoFG0NodwP1eNvn0rt7OPnmFsd9+JYwY4cRVRI2p7Hp03xuIcaXaKw0hwoCfOBtD+
         tg+A==
X-Gm-Message-State: AOAM530s3q1GTtG/SxJ4tDj4LJoXcfPM+C3EluxKlXEfdHyB2N1Mfpz6
        DqcZXYGHIncyFwNMWCOOs/4GMJQ9mXxE/O76dnUKa2iu5JkA6Q==
X-Google-Smtp-Source: ABdhPJxONwR6QDdA9LeS1LweNBya46DuCsYhueVEKoLegPrTeGkUQu8Juviv7rZjLX7+D4hzR13IAdqfWFpN2ysDQ3A=
X-Received: by 2002:a25:358a:: with SMTP id c132mr16256369yba.179.1621616093932;
 Fri, 21 May 2021 09:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU40pLb3LvEghkT0pryLtHdXj+U1R7Y7L6-_6euVohyUw@mail.gmail.com>
In-Reply-To: <CAMuHMdU40pLb3LvEghkT0pryLtHdXj+U1R7Y7L6-_6euVohyUw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 21 May 2021 17:54:28 +0100
Message-ID: <CA+V-a8tFsAO2yYqURT1gYS14_Eax1VqJ1YbgcnfZADtOMLXFMA@mail.gmail.com>
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

Thank you for the review.

On Fri, May 21, 2021 at 2:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add device tree bindings documentation for Renesas RZ/G2UL SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > @@ -302,6 +302,12 @@ properties:
> >                - renesas,rzn1d400-db # RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
> >            - const: renesas,r9a06g032
> >
> > +      - description: RZ/G2UL (R9A07G043)
> > +        items:
> > +          - enum:
> > +              - renesas,r9a07g043u11 # Single Cortex-A55 RZ/G2UL
>
> Is there any specific reason you're including the final "1", unlike the
> RZ/G2{L,LC} binding?
>
To be consistent with the RZ/G2L family of SoC's "1" is appended to
the compatible string.

> As RZ/G2UL is always single-core, perhaps this compatible value can be
> dropped?
>
Do agree with you.

> > +          - const: renesas,r9a07g043
> > +
> >  additionalProperties: true
>
> For now, there are no users of this binding?
> I assume you're posting it already, as RZ/G2UL is pin-compatible with RZ/G2LC,
> and thus can be used interchangeably on the G2L SOM?
> However, the DTS board part in this series is for RZ/G2L, not RZ/GLC?
>
Intention here is to start with RZ/G2L SoC first  so that the core
changes (pinctrl/CPG) hit upstream and for the rest of the SoC's it
will be followed up.

Cheers,
Prabhakar

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.14, after the above have been
> resolved.
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
