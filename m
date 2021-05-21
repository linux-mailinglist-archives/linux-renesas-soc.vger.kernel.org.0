Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1035238CDAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 20:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235476AbhEUSo1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 14:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhEUSo0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 14:44:26 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C084BC061574;
        Fri, 21 May 2021 11:43:01 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id r7so6699844ybs.10;
        Fri, 21 May 2021 11:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FWtdDuSKaLUXcujU5F4tqzi/gqM6kON5tve8kEsdyNo=;
        b=oFxbMftNWJ/GrWSWgc0sb7gWv1HTAhWnUuVXEKqalJyRj62kNebG8XmVsnB0Q2PS1Y
         MHYLKuqkAlkmBWwr0rUN5kymp0o6uzPZQ2AZO66bxFqOcFYyfJoTNlL73/G9VfGaotyb
         7dTe82F6XHdtAHbM+AvVsd7Hc/rJkLZWy8DUMUTCz3AWaHIF5fxxJiACB7ogLzcaV+Nn
         ZYOAqZduCavvmh8KmnkSvXKhdptCHamimTmDSIMBl22f3enWC3tetrvrN5dgiwWth6Db
         ixsMDKq6NyHbwQF/3cJuepUEmLVnSWcPu1u4NMX2SiBW/+Q6lqGaZMR1usc0FgTR4V0l
         MrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FWtdDuSKaLUXcujU5F4tqzi/gqM6kON5tve8kEsdyNo=;
        b=TDtdITLeM4Ag5Byo8CGC1XHV/YmBleZqO36P8RTl0a9v/S292BW7Fvk76qYGC2U2UB
         lhouZGz/vmLW+L+1p9Zkw/jugLkYDrdKwObq1iOVW5e22OpJ4ndGQN/fmS/9upDYrrbi
         vjZcfdVuq7f+5WMkHbXHh4uH9qdgrjI+2DxIBcgkOU8HWcDpfCP9n2/aRSOGC/Qq6nh3
         fkZjsauRYfBqxRJrEQZyWl9Lo7JMkPNS1B7BF0fuYWISYmE3AGlxFGKLdrbBVONoNcoT
         7szedb6ndBvkfKOLNj/3OziStjaNY0Z9+FU+n9PXqUmBSse8kuNmm/ngp0e6IfJ38U39
         kpiQ==
X-Gm-Message-State: AOAM532mE1MJxnoTFfjTiOnX6CRuX4AhU4BR8bzV9xRlXYnOy0SKbGcI
        WMMVT0AUZ9Jj/UxXQ9FHp86H9/xFacgOLKko2pA=
X-Google-Smtp-Source: ABdhPJw7Ho+BnwKzS9opX/ah1rN3NfhTEL7mMbkREE72S2PvJVZGoSa1QSqPlIv08eHOhsje4FZ4s7m5L9h8qEttD3A=
X-Received: by 2002:a25:208:: with SMTP id 8mr15530089ybc.47.1621622581067;
 Fri, 21 May 2021 11:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-12-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUqpycW5mkX3nNn=q9TCp9gS9EZKTs0qwUAW+T+Ggh=8A@mail.gmail.com>
In-Reply-To: <CAMuHMdUqpycW5mkX3nNn=q9TCp9gS9EZKTs0qwUAW+T+Ggh=8A@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 21 May 2021 19:42:35 +0100
Message-ID: <CA+V-a8u-dqrzsVfZ2MiBrANM+=RaBG=rZLcbG38Rc--wEpOaCg@mail.gmail.com>
Subject: Re: [PATCH 11/16] dt-bindings: clock: renesas: Document RZ/G2L SoC
 CPG driver
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

On Fri, May 21, 2021 at 4:04 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Document the device tree bindings of the Renesas RZ/G2L SoC clock
> > driver in Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Renesas RZ/G2L Clock Pulse Generator / Module Stop and Software Reset
>
> (Module Standby Mode
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +
> > +description: |
> > +  On Renesas RZ/G2L SoC, the CPG (Clock Pulse Generator) and MSTP
> > +  (Module Stop and Software Reset) share the same register block.
> > +
> > +  They provide the following functionalities:
> > +    - The CPG block generates various core clocks,
> > +    - The MSTP block provides two functions:
> > +        1. Module Stop, providing a Clock Domain to control the clock supply
> > +           to individual SoC devices,
> > +        2. Reset Control, to perform a software reset of individual SoC devices.
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a07g044l-cpg  # RZ/G2L
>
> renesas,r9a07g044-cpg?
>
As some IP blocks present in RZ/G2L aren't present in RZ/G2LC clock
handling will differ so as a result SoC specific compatible string is
added.

> I believe it's the same block on RZ/G2L ('044l) and RZ/G2LC ('044c).
>
> > +  '#clock-cells':
> > +    description: |
> > +      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
> > +        and a core clock reference, as defined in
> > +        <dt-bindings/clock/*-cpg-mssr.h>
>
> <dt-bindings/clock/r9a07g044l-cpg.h>
>
Indeed

> > +      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
> > +        a module number, as defined in the datasheet.
>
> Also in <dt-bindings/clock/r9a07g044l-cpg.h>?
>
Agreed.

> > +    const: 2
> > +
> > +  '#power-domain-cells':
> > +    description:
> > +      SoC devices that are part of the CPG/MSTP Clock Domain and can be
> > +      power-managed through Module Stop should refer to the CPG device node
> > +      in their "power-domains" property, as documented by the generic PM Domain
> > +      bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
> > +    const: 0
> > +
> > +  '#reset-cells':
> > +    description:
> > +      The single reset specifier cell must be the module number, as defined in
> > +      the datasheet.
>
> Also in <dt-bindings/clock/r9a07g044l-cpg.h>?
>
Agreed.

Cheers,
Prabhakar

> > +    const: 1
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
