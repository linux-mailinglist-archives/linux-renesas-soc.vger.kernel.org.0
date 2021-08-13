Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104823EB5BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 14:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240317AbhHMMrG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 08:47:06 -0400
Received: from mail-vk1-f174.google.com ([209.85.221.174]:35578 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240145AbhHMMrG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 08:47:06 -0400
Received: by mail-vk1-f174.google.com with SMTP id j196so639210vkj.2;
        Fri, 13 Aug 2021 05:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V5RjiKLMWDH0ahAdzgWLlr/LG2nA488gOEkNcwgtNh8=;
        b=l2kigl41N4xpg64dqOAF4Ea5wAVm4ZXIETuagC7NPBffxrZyxDzoxIf8qKyZ0NO8IC
         A1RWVrkKwiHd1hyUdFqje1Lskjd4X5TUIx1IT1ZFxsz1sB22vwJxfNzcQ/xozqlclBui
         3+BfAdFFDy3+VsRMxDLF0NCzJLeXjEySyBjAYS4Rc1sywh6tO/Dw3vQDgPHzMAQnls4r
         FMHAZAAv+TBtEPNVpUTMYIyOwPTjuAPlUZnGYdjvTSgibbv9Spif5hf3mCtP4wUFgbMr
         00KLeBHazLu8/8VfLF/M463YGawibpewgtHOaJBjxL/34HHeO2dpXq6OxbOPhaASrjcb
         Nf5Q==
X-Gm-Message-State: AOAM533sx8D/aX3B9O/N63r8ByakhoqW38fPLLIEKjc1jX+a0oph5mld
        aAkORs+Y+BM64S0Wy89Xsfe286zqxQ10LngSeOM=
X-Google-Smtp-Source: ABdhPJx7OxcX4wXqg7AVRBwVv2z1YYnO+/6xUjTsGGEKyV9jaAZLVqg300lBjNllCnVV6nNNZuXc7zHIeOUGawAP3MU=
X-Received: by 2002:a1f:a102:: with SMTP id k2mr1211484vke.4.1628858798745;
 Fri, 13 Aug 2021 05:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210727141749.17783-1-biju.das.jz@bp.renesas.com>
 <20210727141749.17783-4-biju.das.jz@bp.renesas.com> <CAMuHMdUyiarunEWaQPyR+R+7RbMBXm-xaE1HpuyTwCcNymVS2g@mail.gmail.com>
 <OS0PR01MB5922E8535729D5AF997B33E986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUcvRzW0dsdsq7j2JWfu=64JzM9M=z=qvhUhDFwXHuwQQ@mail.gmail.com> <OS0PR01MB5922495A19B0CDDD50D525D486FA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922495A19B0CDDD50D525D486FA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 Aug 2021 14:46:27 +0200
Message-ID: <CAMuHMdW6xKWp-KKv0exfx-JBb_GXjhvM3hczFSE77j4iORaM3A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drivers: clk: renesas: rzg2l-cpg: Add support to
 handle coupled clocks
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

On Fri, Aug 13, 2021 at 2:17 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v2 3/4] drivers: clk: renesas: rzg2l-cpg: Add support
> > to handle coupled clocks
> > On Thu, Aug 12, 2021 at 9:00 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH v2 3/4] drivers: clk: renesas: rzg2l-cpg: Add
> > > > support to handle coupled clocks On Tue, Jul 27, 2021 at 4:18 PM
> > > > Biju Das <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > The AXI and CHI clocks use the same register bit for controlling
> > > > > clock output. Add a new clock type for coupled clocks, which sets
> > > > > the CPG_CLKON_ETH.CLK[01]_ON bit when at least one clock is
> > > > > enabled, and clears the bit only when both clocks are disabled.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Reviewed-by: Lad Prabhakar
> > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > > > @@ -333,12 +333,16 @@ rzg2l_cpg_register_core_clk(const struct
> > > > cpg_core_clk *core,
> > > > >   * @hw: handle between common and hardware-specific interfaces
> > > > >   * @off: register offset
> > > > >   * @bit: ON/MON bit
> > > > > + * @is_coupled: flag to indicate coupled clock
> > > > > + * @on_cnt: ON count for coupled clocks
> > > > >   * @priv: CPG/MSTP private data
> > > > >   */
> > > > >  struct mstp_clock {
> > > > >         struct clk_hw hw;
> > > > >         u16 off;
> > > > >         u8 bit;
> > > > > +       bool is_coupled;
> > > > > +       u8 on_cnt;
> > > >
> > > > While u8 is probably sufficient, you may want to use unsigned int,
> > > > as there will be a gap anyway due to alignment rules.
> > > >
> > > > >         struct rzg2l_cpg_priv *priv;  };
> > > > >
> > > > > @@ -392,11 +396,37 @@ static int rzg2l_mod_clock_endisable(struct
> > > > > clk_hw *hw, bool enable)
> > > > >
> > > > >  static int rzg2l_mod_clock_enable(struct clk_hw *hw)  {
> > > > > +       struct mstp_clock *clock = to_mod_clock(hw);
> > > > > +       struct rzg2l_cpg_priv *priv = clock->priv;
> > > > > +       unsigned long flags;
> > > > > +
> > > > > +       spin_lock_irqsave(&priv->rmw_lock, flags);
> > > > > +       clock->on_cnt++;
> > > > > +       if (clock->is_coupled && clock->on_cnt > 1) {
> > > > > +               spin_unlock_irqrestore(&priv->rmw_lock, flags);
> > > > > +               return 1;
> > > > > +       }
> > > > > +
> > > > > +       spin_unlock_irqrestore(&priv->rmw_lock, flags);
> > > >
> > > > I think you can avoid taking the spinlock and touching the counter
> > > > if the is_coupled flag is not set.
> > >
> > > OK.
> > >
> > > >
> > > > > +
> > > > >         return rzg2l_mod_clock_endisable(hw, true);  }
> > > >
> > > > However, I'm wondering how this can work?
> > > >
> > > >       DEF_COUPLED("eth0_axi", R9A07G044_ETH0_CLK_AXI,
> > R9A07G044_CLK_M0,
> > > >                               0x57c, 0),
> > > >       DEF_COUPLED("eth0_chi", R9A07G044_ETH0_CLK_CHI,
> > R9A07G044_CLK_ZT,
> > > >                               0x57c, 0),
> > > >
> > > > This will create 2 independent clocks, each with their own
> > > > mstp_clock structure that has the is_coupled flag set.  Hence each
> > > > clock has its own counter. Shouldn't the counter be shared?
> > > > Am I missing something?
> > >
> > > Oops. You are correct. I need to add this counter to priv instead of
> > mstp_clocks.
> >
> > On second thought, a counter is overkill. A simple flag should be
> > sufficient, as the clk core only calls .{en,dis}able() when the clock is
> > {dis,en}enabled.
>
> Just to clarify, simple flag, did you mean to use bit flag? (ie, 2 bits , since we have 2 module clocks)
> when core clock calls enable, set a bit and reset the bit during disable.
>
> Then based on the 2bits, either turn on/off clock or just return the status.
>
> Please correct me, if my understanding wrong?

Just one bool or bit in a bitfield, the second flag will be in the
other struct mstp_clock (can there be three coupled clocks?).

So I think something like below should work:

     struct mstp_clock {
            struct clk_hw hw;
            u16 off;
            u8 bit;
    +       bool enabled;
            struct rzg2l_cpg_priv *priv;
    +       struct mstp_clock *siblings;
     };

.enabled needs to track the soft state of the clock.
The actual coupling is handled through .siblings, which points to the
other coupled clock (or forms a circular list if you can have more than
two coupled clocks).  When registering a clock, if mod->is_coupled
is set, you walk all already registered module clocks to find one
with the same off and bit, and link them together.

In .{en,dis}able(), you only {en,dis}able the hardware clock if all
other clocks in the list are disabled.

if it turns out too costly to add a pointer to each clock (depends
on slab granularity), you can also use a different struct for coupled
clocks:

    struct mstp_coupled_clock {
            struct mstp_clock mstp;
            struct mstp_coupled_clock *siblings;
    };

but then you do need another flag in mstp_clock to indicate it is
a coupled clock, that can be converted to mstp_coupled_clock using
container_of().

Does that make sense?
Have a nice weekend!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
