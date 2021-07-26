Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A193D58DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jul 2021 13:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233603AbhGZLJv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 07:09:51 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:35526 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233538AbhGZLJu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 07:09:50 -0400
Received: by mail-ua1-f48.google.com with SMTP id d6so3437928uav.2;
        Mon, 26 Jul 2021 04:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GJQ6q0OpBi5sfHnfjigtWbdNVBxVNK2iG0yp+M1j45E=;
        b=l/xQ3GQ/LvnWdZVBrWvrMnA/mEoHb30mYVSmNc3I5bbj63NhX5lMwKKHG2eKoPwGKy
         T4Q+m92zw3+RlwqKDhSdX1STPYx8IbtB+jHwP0jeS4sleC3m79/a9PNg35/DaTvkKV9c
         5Ha5vr20ji+tw4ZeGP0eOlIm57cbUcFFvQs1mew7o89/Eq1qgFIVJKvbM2b11WDR/aHH
         M8dWhVgy6GM6lyTraEfyPadKiBoA4/E8XKrsw52CVzVjef3LvdzSqdlw8CsV4Z/6/yPY
         Xn8kFNVJqPfD1tdXdsE5hL3KO1DbcJjuzHbAR4Z/v0jrq8NFzXfLS/+uHXDiZ3H0Mtwq
         uncg==
X-Gm-Message-State: AOAM533wltZgvUJsdXZtoZiYmBB40GD69JQOlCym2yD9v0ee+gd7/ivP
        m6gXmzy1eNXbBUSrRMQ49RX5rzz8s8IGlVQv4sg=
X-Google-Smtp-Source: ABdhPJz2hQMDbragka6GOlVZgVFcRPv9SDIv6mbz8hMXQ9CpjfIKOUYFUVVQdmWQUFlm8fbovYChU3+Eg6fZcnB9+Nk=
X-Received: by 2002:ab0:2554:: with SMTP id l20mr12414639uan.58.1627300218112;
 Mon, 26 Jul 2021 04:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
 <20210722141351.13668-4-biju.das.jz@bp.renesas.com> <CAMuHMdX29xg08j+dfcWFZZGhSXS_bvUni94EQe6q6=fcUFGvsg@mail.gmail.com>
 <OS0PR01MB592269086F41E4E83BBFE48486E89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592269086F41E4E83BBFE48486E89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Jul 2021 13:50:07 +0200
Message-ID: <CAMuHMdWRckaH1snBt12Xbv90V_sNW2VM7+CZvmD9CaLcpdGWOQ@mail.gmail.com>
Subject: Re: [PATCH net-next 03/18] drivers: clk: renesas: r9a07g044-cpg: Add
 ethernet clock sources
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

On Mon, Jul 26, 2021 at 1:43 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH net-next 03/18] drivers: clk: renesas: r9a07g044-cpg:
> > Add ethernet clock sources
> > On Thu, Jul 22, 2021 at 4:14 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Ethernet reference clock can be sourced from PLL5_2 or PLL6_2. Add
> > > support for ethernet source clock selection using SEL_PLL_6_2 mux.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/r9a07g044-cpg.c
> > > +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> > > @@ -35,8 +35,10 @@ enum clk_ids {
> > >         CLK_PLL3_DIV4,
> > >         CLK_PLL4,
> > >         CLK_PLL5,
> > > +       CLK_PLL5_2,
> >
> > Why do you need this? We already have CLK_PLL5_DIV2?
>
> As per clock list HP =250 MHz.
>
> With PLL5_DIV2 the frequency, what we get is 3000 x 1/2 = 1500 MHz, which is incorrect
>
> There is some issue with HW manual. It is not clear. I have requested to fix those issue.
>
> Actually PLL5 generates 3 clk outputs (As per page 403 of manual)
>
> FOUTPOSTDIV= 3000
> FOUT3 = 500
> FOUT1PH0 = 1500
>
> To match the clock list document and Figure 8.3 Clock system diagram for HP clock.
> This clock has to be FOUT3.
>
> FOUT3(second PLL5 clock source)* 1/2 =250 MHz(HP clock).
>
> On the HW manual, Divider name for PLL5 is mentioned as PLL_5_2_DIV12 and for PLL6 as PLL6_2_DIV2.
>
> >
> > >         CLK_PLL5_DIV2,
> > >         CLK_PLL6,
> > > +       CLK_PLL6_DIV2,
> > >         CLK_P1_DIV2,
> > >
> > >         /* Module Clocks */
> > > @@ -53,6 +55,9 @@ static const struct clk_div_table dtable_1_32[] = {
> > >         {0, 0},
> > >  };
> > >
> > > +/* Mux clock tables */
> > > +static const char * const sel_pll6_2[] = { ".pll6_2_div2",
> > > +".pll5_2_div2" };
> >
> > ".pll6_div2", ".pll5_div2"
>
> Basically PLL6 generates 2 clock outputs. That is the reason it is termed as PLL6_2 for second clock
> And pll5 generates 3 clock outputs and pll5_2(second clock source) is used for HP.
>
> To match the register definition, I will change this to ".pll6_2_div2" and ".pll5_2_div12". Is it ok?

OK, thanks for the explanation!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
