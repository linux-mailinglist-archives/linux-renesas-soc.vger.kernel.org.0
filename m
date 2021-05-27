Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2EF392D21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 13:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234223AbhE0LxV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 07:53:21 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:46926 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbhE0LxU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 07:53:20 -0400
Received: by mail-vs1-f53.google.com with SMTP id q6so193958vsp.13;
        Thu, 27 May 2021 04:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MM60L9FmmGnYkH2rt7ny47piYs431Ioz2GCSUlGaeqE=;
        b=CIYR31ckj4nJRttIoy4DKFw1Njvey2COxtYXcDavbYawdCcYGkSHpR2hycwhj2gpcs
         BmDu4cETa9Z4gti8ttZhemjYAalipQJp7HnSZ6h5j24yspIQ8MarrDsW484JodGUV2+3
         ma0MG2lojQg0uUtOm4nWIeF/tPZQAmA8UJSKVbWt+cs7d20PDvu8AcY0JbAH/GwTjjK0
         dIsXEC0lMVWTxrpN0ZKiJ26ntzWEVih5OYg5Zs2faO8f46I98G7cVQPO6Z3oS3JAdl2K
         OG9IIxOjvqVCOmNdRLWrKZ5izHdlD3l9pKOF9ANk1t6Q1yOApLdFKJnohfpZdLtL6ksf
         5AwQ==
X-Gm-Message-State: AOAM5330oIqisu4/A0Ncl/qQeRzSwL0JVwOIacKufBuHPBqie1WD4XjX
        XDiFIMjvUigPYdDNfpwzOeKc04IqNal45NLLfs8=
X-Google-Smtp-Source: ABdhPJxdT6Go/4lKzNa9clhVsl87svarjZxvF1z+VMaXuZrbE7cM9wmKD1Qd9B5Cem0E3381sUR0AvU66boLwv5/ucM=
X-Received: by 2002:a67:8713:: with SMTP id j19mr1815177vsd.3.1622116306388;
 Thu, 27 May 2021 04:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUqpycW5mkX3nNn=q9TCp9gS9EZKTs0qwUAW+T+Ggh=8A@mail.gmail.com> <CA+V-a8u-dqrzsVfZ2MiBrANM+=RaBG=rZLcbG38Rc--wEpOaCg@mail.gmail.com>
In-Reply-To: <CA+V-a8u-dqrzsVfZ2MiBrANM+=RaBG=rZLcbG38Rc--wEpOaCg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 13:51:34 +0200
Message-ID: <CAMuHMdW0fihLr8_fOzvQ6=WjfR11T2K8UXsKrDCb4JvF79wM_w@mail.gmail.com>
Subject: Re: [PATCH 11/16] dt-bindings: clock: renesas: Document RZ/G2L SoC
 CPG driver
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

On Fri, May 21, 2021 at 8:43 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, May 21, 2021 at 4:04 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Document the device tree bindings of the Renesas RZ/G2L SoC clock
> > > driver in Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> > > @@ -0,0 +1,80 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Renesas RZ/G2L Clock Pulse Generator / Module Stop and Software Reset
> >
> > (Module Standby Mode
> > > +
> > > +maintainers:
> > > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > > +
> > > +description: |
> > > +  On Renesas RZ/G2L SoC, the CPG (Clock Pulse Generator) and MSTP
> > > +  (Module Stop and Software Reset) share the same register block.
> > > +
> > > +  They provide the following functionalities:
> > > +    - The CPG block generates various core clocks,
> > > +    - The MSTP block provides two functions:
> > > +        1. Module Stop, providing a Clock Domain to control the clock supply
> > > +           to individual SoC devices,
> > > +        2. Reset Control, to perform a software reset of individual SoC devices.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: renesas,r9a07g044l-cpg  # RZ/G2L
> >
> > renesas,r9a07g044-cpg?
> >
> As some IP blocks present in RZ/G2L aren't present in RZ/G2LC clock
> handling will differ so as a result SoC specific compatible string is
> added.

The RZ/G2L Hardware User's Manual Rev. 0.41 doesn't mention any
differences between the CPG on RZ/G2L and RZ/G2LC.  So I think it's
safe to have a single driver for both members.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
