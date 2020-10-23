Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39F5296D54
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 13:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S462755AbgJWLGW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 07:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S462754AbgJWLGU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 07:06:20 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B17AC0613CE;
        Fri, 23 Oct 2020 04:06:18 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id b138so870989yba.5;
        Fri, 23 Oct 2020 04:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C6tDpxrPvO2txeQMW3b7anFd1euvgBbroarKLdTIHWM=;
        b=j7PDDrCRZ2t5WLja4U6quYl4fuju83vmjbKBnpvVA6cJljlq1mlE0i1niPHbo2qgxU
         814X6Vv8AeTdixMi9yTlQSi5Rv7g1rFKQ1HL3ggHq27n9XrtqnZEfK9y5p3BacGOo6/y
         1UuVnbC/eSsnxHuizWwMZ/ySa+qUR3VpdswGI04kAOGTp5TSkRIfnc3+11MiF16DfHM4
         ZOMEvQnBYS77OAicU+XKD1w6y7P/5KK66Cqni57M1kPwuqbwaWvU/eOdVj3tZd32ALS6
         kuT/92r5Ti6JNtPg6UTGUsqAFQXBr9qaOIkniIBuv1D/E3p9Hhqk1wMiMvgf2CJ6a8Ji
         8Gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C6tDpxrPvO2txeQMW3b7anFd1euvgBbroarKLdTIHWM=;
        b=Tj6B44/sE/XiesJeSWVOEhpLivjGYsx9u/zE+9WWemPk/OJT33Fq4W0ZICIwv+S3ne
         /lfe32LqeJsxTG2fYccE6HxCnjuaUERWEG+9eeYoz9uf3RhsYmaK6rmGQHjAlQs9U8Gh
         6NSK1KXM2PxojsSNRqY9f/9b2y35oC/+MS+bbr70ZC35B6NvIxFuF3sWfv7Uqw2WURdZ
         W4iU2ncNRuG2mj/pJ3g2zvxne0rjtPkKwCXJbsiwIflth+vtGLvga9cfOfN7x9VK9Gl/
         Am3tpogHYNRajKHiO6eQQ89Gi1IVV3zY92RnuCTaMHRuy+QZLZVhQY3okJffCP5Qegbh
         DGRw==
X-Gm-Message-State: AOAM5307tTIRx+vsjFKCz2wNUp/AxndJMy6UtmawxYBopOnXww4ZqOoV
        45qOmzXziDY4Mfw+POr4QDm9GXH/+Afklf4+gcJXAOlnAQRr4Q==
X-Google-Smtp-Source: ABdhPJytm7w35ctnRVaSIkSiRPwWwcD+5Re1wjcFIRqen5YATV77dN56tGqr5AUjCWK0sIuE4DgjeVCWOfSKQ6n2ma8=
X-Received: by 2002:a25:41c9:: with SMTP id o192mr2410179yba.127.1603451177822;
 Fri, 23 Oct 2020 04:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201016121709.8447-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201016121709.8447-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVPfoU_X3A4ioy9TeJHmovE5P=fDYpShsWTzFYXmZoiww@mail.gmail.com>
In-Reply-To: <CAMuHMdVPfoU_X3A4ioy9TeJHmovE5P=fDYpShsWTzFYXmZoiww@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 23 Oct 2020 12:05:51 +0100
Message-ID: <CA+V-a8tX0qxFyf85QAC0h2t-s2Uo3EiQvJz2PU0+vw=ov1d2rA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r8a774c0: Add RPC clocks
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

Thank you for the review.

On Thu, Oct 22, 2020 at 3:09 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Oct 16, 2020 at 2:17 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> > as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
> > driver.
> >
> > Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> > @@ -73,6 +74,12 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
> >         DEF_FIXED(".s2",       CLK_S2,             CLK_PLL1,       4, 1),
> >         DEF_FIXED(".s3",       CLK_S3,             CLK_PLL1,       6, 1),
> >         DEF_FIXED(".sdsrc",    CLK_SDSRC,          CLK_PLL1,       2, 1),
> > +       DEF_BASE(".rpcsrc",    CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
> > +
> > +       DEF_BASE("rpc",        R8A774C0_CLK_RPC, CLK_TYPE_GEN3_RPC,
> > +                CLK_RPCSRC),
> > +       DEF_BASE("rpcd2",      R8A774C0_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
> > +                R8A774C0_CLK_RPC),
> >
> >         DEF_DIV6_RO(".r",      CLK_RINT,           CLK_EXTAL, CPG_RCKCR, 32),
> >
>
> > @@ -275,6 +283,10 @@ static int __init r8a774c0_cpg_mssr_init(struct device *dev)
> >         return rcar_gen3_cpg_init(cpg_pll_config, 0, cpg_mode);
> >  }
> >
> > +static const struct clk_div_table cpg_rpcsrc_div_table[] = {
> > +       { 0, 5 }, { 1, 3 }, { 2, 8 }, {3, 2}, {0, 0},
> > +};
>
> The above models RPCSRC as a clock generated by dividing PLL1 by either
> 5, 3, 8, or 2.  This does not match the hardware user's manual, which
> states that RPCSRC is either PLL1 divided by 5 or 3, or PLL0 divided by
> 8 or 2.
>
Oops I completely missed that.

But as per the manual (R-Car manual Rev.2.20) which I am referring to
5, 3 and 2 are sourced from PLL1 and 5/8 (ie D3/E3) are sourced from
PLL0.

> I think you need a new clock type (CLK_TYPE_GEN3E_RPCSRC, as it applies
> to RZ/G2E, and R-Car E3?), which registers a composite clock consisting
> of a mux and divider.  This is a bit similar to the RPC/RPCD2 clocks,
> which are composite clocks consisting of a divider and a gate.
>
atm rcar_gen3_cpg_clk_register() only supports single parent, so if I
am getting it right you mean I need to add two separate entries for
RPSRC  one with PLL0 and one with PLL1 ?

> Note that R-Car D3 is similar, except that PLL0 is divided by 5 or 2, which
> means yet another clock type (and div_table).
>
I'm a bit confused here for D3 PLL0 is divided by 5 (n=5) ?

Cheers,
Prabhakar

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
