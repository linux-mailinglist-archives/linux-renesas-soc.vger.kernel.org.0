Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A727C296F91
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 14:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463955AbgJWMmp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 08:42:45 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34915 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S373407AbgJWMmo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 08:42:44 -0400
Received: by mail-oi1-f195.google.com with SMTP id w191so1716573oif.2;
        Fri, 23 Oct 2020 05:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RjpCnjRYrt8usXfUiWWJM/i9Xqzzc0nEFPFueT3x2oI=;
        b=ZxAZmXlYAcpKnkrpWhwstTSLSa0LglOyJtqw73AfeM1hmX4ijkmN7vXMM+/QlIB+ri
         9W5Fl4efO1pGOmZS2hZG/vKwPnnI+loW/SlfiqM4hl8slzd5gDbl3GA35/qNg28jWiQW
         XCOAW8TM0X0xfBxrAsp+QHOGVbSTAPmTRvPYP3iIRN6hh9XjTYCQvGeP58Af+mLQQ2FU
         GEkFc9t0T8DDUzTvlSGmAK9QB2tO7M24SrWQQ+PwPc7DqNuyaMAx0U3Jyz/A1cRoHOfO
         Ssi/tb8Fu7Bbl1ZogOAiHuzuSJPsKT0zOw12r0VgG6LylAK75gkNjwGaGlHNlBb+i1MI
         HOfw==
X-Gm-Message-State: AOAM533iez2HLnncX5y9bTV8ZOaxfP8/cJYhkhQZfHUMwee+BIwnUvGR
        EE5dgv/FcMYI647IepKVJXEFv1FFGcOONFNFskc=
X-Google-Smtp-Source: ABdhPJybx+NEzgUJybBLn+A/LL5wFPpu5es5hgHmPOZ4aeJkJtuRPxSh7JojLW3XGJ9dCA5JI9clJQa2OxyqukLcHPs=
X-Received: by 2002:aca:f203:: with SMTP id q3mr1413369oih.148.1603456963090;
 Fri, 23 Oct 2020 05:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201016121709.8447-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201016121709.8447-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVPfoU_X3A4ioy9TeJHmovE5P=fDYpShsWTzFYXmZoiww@mail.gmail.com> <CA+V-a8tX0qxFyf85QAC0h2t-s2Uo3EiQvJz2PU0+vw=ov1d2rA@mail.gmail.com>
In-Reply-To: <CA+V-a8tX0qxFyf85QAC0h2t-s2Uo3EiQvJz2PU0+vw=ov1d2rA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Oct 2020 14:42:32 +0200
Message-ID: <CAMuHMdUdVhp-g_3G2+MZd9thyxojB-w1SnmPd0XuWgB4XztOzg@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r8a774c0: Add RPC clocks
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

On Fri, Oct 23, 2020 at 1:06 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Oct 22, 2020 at 3:09 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Oct 16, 2020 at 2:17 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> > > as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
> > > driver.
> > >
> > > Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> > > +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> > > @@ -73,6 +74,12 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
> > >         DEF_FIXED(".s2",       CLK_S2,             CLK_PLL1,       4, 1),
> > >         DEF_FIXED(".s3",       CLK_S3,             CLK_PLL1,       6, 1),
> > >         DEF_FIXED(".sdsrc",    CLK_SDSRC,          CLK_PLL1,       2, 1),
> > > +       DEF_BASE(".rpcsrc",    CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
> > > +
> > > +       DEF_BASE("rpc",        R8A774C0_CLK_RPC, CLK_TYPE_GEN3_RPC,
> > > +                CLK_RPCSRC),
> > > +       DEF_BASE("rpcd2",      R8A774C0_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
> > > +                R8A774C0_CLK_RPC),
> > >
> > >         DEF_DIV6_RO(".r",      CLK_RINT,           CLK_EXTAL, CPG_RCKCR, 32),
> > >
> >
> > > @@ -275,6 +283,10 @@ static int __init r8a774c0_cpg_mssr_init(struct device *dev)
> > >         return rcar_gen3_cpg_init(cpg_pll_config, 0, cpg_mode);
> > >  }
> > >
> > > +static const struct clk_div_table cpg_rpcsrc_div_table[] = {
> > > +       { 0, 5 }, { 1, 3 }, { 2, 8 }, {3, 2}, {0, 0},
> > > +};
> >
> > The above models RPCSRC as a clock generated by dividing PLL1 by either
> > 5, 3, 8, or 2.  This does not match the hardware user's manual, which
> > states that RPCSRC is either PLL1 divided by 5 or 3, or PLL0 divided by
> > 8 or 2.
> >
> Oops I completely missed that.
>
> But as per the manual (R-Car manual Rev.2.20) which I am referring to
> 5, 3 and 2 are sourced from PLL1 and 5/8 (ie D3/E3) are sourced from
> PLL0.

True, I misread the clocksource of the last entry.

> > I think you need a new clock type (CLK_TYPE_GEN3E_RPCSRC, as it applies
> > to RZ/G2E, and R-Car E3?), which registers a composite clock consisting
> > of a mux and divider.  This is a bit similar to the RPC/RPCD2 clocks,
> > which are composite clocks consisting of a divider and a gate.
> >
> atm rcar_gen3_cpg_clk_register() only supports single parent, so if I
> am getting it right you mean I need to add two separate entries for
> RPSRC  one with PLL0 and one with PLL1 ?

You can encode a second parent in the high halfword, cfr. what
CLK_TYPE_GEN3_MDSEL and CLK_TYPE_GEN3_RCKSEL.

Note to myself: convert cpg_core_clk to a union, to make encoding
and decoding easier.

> > Note that R-Car D3 is similar, except that PLL0 is divided by 5 or 2, which
> > means yet another clock type (and div_table).
> >
> I'm a bit confused here for D3 PLL0 is divided by 5 (n=5) ?

Sorry, same misreading as above.
Have a nice weekend!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
