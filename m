Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2BB3FB6E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Aug 2021 15:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236735AbhH3NWx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Aug 2021 09:22:53 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:34784 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236609AbhH3NWw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Aug 2021 09:22:52 -0400
Received: by mail-ua1-f43.google.com with SMTP id l24so7792884uai.1;
        Mon, 30 Aug 2021 06:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tulhgSVoxeTOojsoAsEpBrUnTXS8uw7hLO3RXtcVYJg=;
        b=ODWBENU2Ua73I0i91NDU2ldHP2vYzLTX9diXHuscVDYSzwTy0MK5bMgtkwt4E5i1UL
         62Q6p2kzegfwE/ILC9j8p5QVvOgHlMLZ9K+shebsu2QD19rtHAS4BU8e6a1BK9x0zxuK
         9iBd03TMLW84B2Xxbd8Xml9mthZUYVKPfv9621WfCpYFeUYIO+wowYVqDELuTV1Srldq
         J/I4pC+ALhhE7v7Bwmbon51NISIMT+geLYih698uyioE4OVlpBiX0cXTgNOnmLhXeiCr
         i2LZfzavsCeFjHU2nh9Z37G5611SaBtM016aNcs4aCKvwezRR/Vdtt9NvMH4E6taX4AH
         mP3A==
X-Gm-Message-State: AOAM531z05uxFSU44LugpET2GMGW7i3i7BGqcOk8APSmS5YbpZ25tJ73
        /GfhY4p/mVMbA4bIN6FvOHgCDesFSGRujTxSbiU=
X-Google-Smtp-Source: ABdhPJzJ04o53AzwnlEMqTT60E0ti5rrv/o1UEgsXMdzMrbZzkRGozvnzAuD3EvEJdFkMkPvlkyV2iz+GaZwPUikkMA=
X-Received: by 2002:a9f:35aa:: with SMTP id t39mr14181233uad.89.1630329718210;
 Mon, 30 Aug 2021 06:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210815103014.21208-1-biju.das.jz@bp.renesas.com>
 <20210815103014.21208-4-biju.das.jz@bp.renesas.com> <CAMuHMdXj8xmJ0ySOJQ74AjkTDJUQwTJ93rYjyRPnJ1dwGfj1xg@mail.gmail.com>
 <OS0PR01MB592221C0F7BBD92216EDA1B986C49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592231527BC613A0BFCB200286CB9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592231527BC613A0BFCB200286CB9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Aug 2021 15:21:46 +0200
Message-ID: <CAMuHMdVHwEb8ktTHeBjutZkBmS9j0Ud8NwN60hCK-xjgaWXDhQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clk: renesas: rzg2l: Add support to handle coupled clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Aug 30, 2021 at 10:36 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: RE: [PATCH v3 3/4] clk: renesas: rzg2l: Add support to handle
> > coupled clocks
> > > On Sun, Aug 15, 2021 at 12:30 PM Biju Das <biju.das.jz@bp.renesas.com>
> > > wrote:
> > > > The AXI and CHI clocks use the same register bit for controlling
> > > > clock output. Add a new clock type for coupled clocks, which sets
> > > > the CPG_CLKON_ETH.CLK[01]_ON bit when at least one clock is enabled,
> > > > and clears the bit only when both clocks are disabled.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v2->v3:
> > > >  * Reworked as per Geert's suggestion
> > > >  * Added enabled flag to track the status of clock, if it is coupled
> > > >    with another clock
> > > >  * Introduced siblings pointer which points to the other coupled
> > > >    clock
> > > >  * coupled clock linking is done during module clk register.
> > > >  * rzg2l_mod_clock_is_enabled function returns soft state of the
> > > >    module clocks, if it is coupled with another clock
> > > >  * Updated the commit header

> > > You forgot to initialize mstp_clock.enabled to match the current
> > > hardware state.
> >
> > OK. will initialize mstp_clock.enabled to match the current hardware
> > state.
>
> While working on this, I found a bug in clk driver with patch
> ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
>
> As per H/W manual(0.50), clock monitor status "1" means clock is supplied and
> "0" means clock supply is stopped.
>
> But the "rzg2l_mod_clock_is_enabled" function returns inverted value instead.

Oops...

> Due to this wrong status, The unused_clk_function never switch off the unused clocks,
> before spawning before init.
>
> After fixing "rzg2l_mod_clock_is_enabled" function and found that board is not booting.
> Reason is, unused_clk_function turns off IA_55 and dmac clocks.
>
> On further investigation, turning off IA55_CLK[1] and DMAC_ACLK[2]
> leading GIC interrupts failure.
>
> I made IA55_CLK and DMAC_ACLK as critical clocks as even if, we disable the corresponding driver,
> GIC interrupts should work and with that I am able to mount rootFS.
>
> So I guess fixing "rzg2l_mod_clock_is_enabled" and Adding critical clocks "IA55_CLK" and "DMAC_ACLK"
> Should be a single patch??

Depends on the order, if they are separate patches ;-)
I think it makes sense to have two separate patches, and thus add
the critical clocks first.

> Then I tested DMA it was failing, as driver is not turning ON DMA_PCLK. So added PM
> Routines to handle DMA clocks and with that DMA driver is working. This will be a separate
> Patch for dmac driver.

OK.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
