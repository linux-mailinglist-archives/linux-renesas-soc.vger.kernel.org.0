Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0212B3F51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Nov 2020 10:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbgKPJCG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 04:02:06 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41732 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728398AbgKPJCE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 04:02:04 -0500
Received: by mail-oi1-f195.google.com with SMTP id m13so18017543oih.8;
        Mon, 16 Nov 2020 01:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PfVGMxG4nUIJTFYRuzVvD7gtL2LeHv09UmzUT6YR6Oo=;
        b=J5FCGjhJwkPw95VtAf39En5UoQODDjTOmGj0fXWTKXpdpB/6O5NYynipBYMPRzYTR2
         rFZYzP8rzuwpFFkfQBmOzn8NrkrEz9HR/POC6/nF7MpW842pzzXoz6/pvWER1W037c9a
         CBG5nwl7fp3Eq79owyIcU3jeVOdxsjZJ5y1lqvZkqlhcFfokipcqIDPPcUaVGCukTt2a
         Q1vf7IERWkefFzCvrO64ZOxqqNROBLO+8wwe2UfoU3bx7I6C1Obw+chkvJfMATO1MZqj
         o8B3SjRWGnQ3G6D5ZdERaHdXTxXrbYfx0X5AG1PdI0aCG9Tr1DbeoP3pTvQDBeeCe5rF
         OUBw==
X-Gm-Message-State: AOAM531JH9Kn3aqfCSCzDLaUi8l2JNqbtJFu291dUtVB1hBbOeHyHY0M
        AVmtjQlCzHBNzIDBN6EcCwCXn3SMtkMXNdar1Fs=
X-Google-Smtp-Source: ABdhPJw1KRq4bcWs2ksyQMsr4EkLmMFPD3xERkj0p3g3e09mJQB6VbCmnuTJdMtAuFJ/V7VYnHGJxe+ZPrzzgPUmcsQ=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr8615767oia.153.1605517323566;
 Mon, 16 Nov 2020 01:02:03 -0800 (PST)
MIME-Version: 1.0
References: <20201110125609.30246-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUky4OEvCLnDYr3C-PB+PKdSx3U5+dCfhiftDhf3RKmAQ@mail.gmail.com> <CA+V-a8sxgHASsAMmvu-qkd47MbSa3Wr1T+8_Qj05qPYircdCHQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sxgHASsAMmvu-qkd47MbSa3Wr1T+8_Qj05qPYircdCHQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Nov 2020 10:01:52 +0100
Message-ID: <CAMuHMdXkPDepLkJnGdMO2anzcRm7ofJ5RnWkYtaZM4ZeMOUf9Q@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: r8a774c0: Add RPC clocks
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Mon, Nov 16, 2020 at 9:54 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Nov 16, 2020 at 8:34 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Nov 10, 2020 at 1:56 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> > > as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
> > > driver.
> > >
> > > Add new clk type CLK_TYPE_GEN3E3_RPCSRC to register rpcsrc as a fixed
> > > clock on R-Car Gen3 E3 (and also RZ/G2E which is identical to E3 SoC),
> > > parent and the divider is set based on the register value CPG_RPCCKCR[4:3]
> > > (parent is cross verified against MD[4:1] pins) which has been set prior
> > > to booting the kernel.
> > >
> > > MD[4] MD[3] MD[2] MD[1]
> > >   0     0     0    1     -> RPCSRC CLK source is PLL1
> > >   0     0     1    1     -> RPCSRC CLK source is PLL1
> > >   0     1     0    0     -> RPCSRC CLK source is PLL1
> > >   1     0     1    1     -> RPCSRC CLK source is PLL1
> > >   x     x     x    x     -> For any other values RPCSRC CLK source is PLL0
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > +               switch (value) {
> > > +               case 0:
> > > +                       div = 5;
> > > +                       break;
> > > +               case 1:
> > > +                       div = 3;
> > > +                       break;
> > > +               case 2:
> > > +                       parent = clks[core->parent >> 16];
> > > +                       if (IS_ERR(parent))
> > > +                               return ERR_CAST(parent);
> > > +                       div = 8;
> >
> > R-Car D3 is very similar, but uses div = 5 instead of 8.
> > Perhaps this value can be retrieved from cpg_core_clk.div?
> > Of course, we can do that later, when D3 support is added.
> >
> Agreed, should the below be OK ?
>
> #define DEF_FIXED_RPCSRC_E3(_name, _id, _parent0, _parent1, _div)

Fine, but then I would drop the _E3 suffix ;-)

Alternatively, you can just hide the fixed 8 inside the macro, and add a
seperate macro for D3 later.

Up to you.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
