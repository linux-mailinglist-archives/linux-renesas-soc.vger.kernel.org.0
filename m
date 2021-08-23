Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E093F4847
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Aug 2021 12:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236034AbhHWKJj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 06:09:39 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:37425 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233322AbhHWKJj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 06:09:39 -0400
Received: by mail-vk1-f180.google.com with SMTP id j26so4330659vkn.4;
        Mon, 23 Aug 2021 03:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BU2DlSn3ur6HPhL4Oh4RErnjmjkpcxqrzH4ZTbYCpGM=;
        b=GakXFVyUMq2ttSm4AEADRryLa6nl5c/Y2yZ8dc01nT5mGInuuomF6PYNVa60wp9SYe
         Zgk2CEunyiwSD2RZihyLqYROTC0Po3NN1pL99IkAtOuedatRfx/NaG08C5DiOv+XlvEm
         FNqTVuFFmY0AXazJcTQiu4dnrcE3tFz8gcCYQdSun3FxMcw8h69GP4czqaM6RLq/Y6F8
         ppB+v8yatweeJx7jnVfDNpGThCgLTIBWrDJKP/AUo+AGqKEkTX7ymyxhuQ/bt4UKj1Pm
         wbs9EaD4ooPTXsN5I86f0mNPYKaHqonfa3oneJjh78MfcjYTjlsMBCOvDW/LqN81FIIu
         LLfA==
X-Gm-Message-State: AOAM530JH93IuviI4Fdvxx8f1pIcvCtSaf4qe6Os+P9b13VziP1a/f9z
        4J6QeH4QRVl7Y6oBZtqWAAGLtd3aVCbQQQ7FkSgG7dt3xig=
X-Google-Smtp-Source: ABdhPJywBYA2gHrPQ6Hb1eVskybk1INXEsZEyPf0DOn2sMrApUi76rCQmQZP8RRyG8aTq4o77S+EsBr6TPSWgoootMk=
X-Received: by 2002:a1f:2c97:: with SMTP id s145mr17724142vks.24.1629713336392;
 Mon, 23 Aug 2021 03:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210815103014.21208-1-biju.das.jz@bp.renesas.com>
 <20210815103014.21208-4-biju.das.jz@bp.renesas.com> <OS0PR01MB5922B42107A6FB3191DECD1D86FD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922B42107A6FB3191DECD1D86FD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Aug 2021 12:08:45 +0200
Message-ID: <CAMuHMdVvzoDKN4vSjDhg+gmee=x4XuVuP1LQRxzE1zgaTG+h1g@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clk: renesas: rzg2l: Add support to handle coupled clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Aug 16, 2021 at 11:23 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: [PATCH v3 3/4] clk: renesas: rzg2l: Add support to handle coupled
> > clocks
> >
> > The AXI and CHI clocks use the same register bit for controlling clock
> > output. Add a new clock type for coupled clocks, which sets the
> > CPG_CLKON_ETH.CLK[01]_ON bit when at least one clock is enabled, and
> > clears the bit only when both clocks are disabled.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > @@ -423,11 +454,33 @@ static const struct clk_ops rzg2l_mod_clock_ops = {
> >       .is_enabled = rzg2l_mod_clock_is_enabled,  };
> >
> > +static struct mstp_clock
> > +*rzg2l_cpg_get_sibling_clk(struct mstp_clock *clock,
> > +                        struct rzg2l_cpg_priv *priv)
> > +{
> > +     struct mstp_clock *sibl_clk = NULL;
> > +     struct clk_hw *hw;
> > +     unsigned int i;
> > +
> > +     for (i = 0; i < priv->num_mod_clks; i++) {
> > +             if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
> > +                     continue;
> > +
> > +             hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
> > +             sibl_clk = to_mod_clock(hw);
> > +             if (clock->off == sibl_clk->off && clock->bit == sibl_clk-
> > >bit)
> > +                     break;
>
> Just found during testing, instead of "break" we should return sibl_clk;
> Otherwise for the first clock, it gets a wrong siblings,
> Which will be overridden with correct siblings during
> registration of other coupled clock.

Indeed.

> Currently it gets into the loop 4 *97 = 388 times during registration and the extra memory is 97*sizeof(mstp*) bytes.
> This solution simpler and neater.
>
> But not sure we should optimize this by adding all the coupled clocks
> into priv structure (4 * sizeof(mstp*) bytes + 4* enabled flags + 4* link pointer) ? and
> at run time enable/disable will go through this list, find the clock and coupled clk and based
> on coupled clk's enable status it will set clk's enabled status and set hardware clock
>
> In that case rzg2l_mod_clock_is_enabled will also need to find the clock from that list and
> return soft enabled status from priv structure.
>
> But this solution has runtime overhead of finding clk and coupled clk from the priv structure

Yeah, that should be slower, due to the look-up overhead.

As an alternative to the sibling pointer, you could store a pointer
to a shared atomic_t counter, and use atomic_{inc,dec}_return().
That requires extra storage (one atomic_t per coupled clock), and
avoids taking the spinlock.  But you have to take the spinlock later
anyway, for changing the clock bits, and you still need to store the
per-clock "soft" enable flag.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
