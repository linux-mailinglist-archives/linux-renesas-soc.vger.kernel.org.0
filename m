Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E233E9FEA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 09:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234583AbhHLHzE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 03:55:04 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:45679 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbhHLHzD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 03:55:03 -0400
Received: by mail-ot1-f43.google.com with SMTP id r17-20020a0568302371b0290504f3f418fbso6654380oth.12;
        Thu, 12 Aug 2021 00:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bCu8UAxLtlKAFF4i1J2fDucS+c/HCmCh2Y70hZlzkM0=;
        b=Q9S+srOZxoqrHNbGysclNwOH+eIP9d6KTwxaQb7KxLXza7gZLa07V9iHEglyKN+zJm
         sR2rQ4EbUZ8N/ZrxQg3Dd95Db+jkLitgFRwzLiYOUIZ8jmb5b649JtORIpGtdtlXRb7u
         WpHQLE5wJNLgS/nq9yLVE3JLhhuvCMeklJ4nUJa/GQt3rkyHUvGHG4dP9IBLXqMrTsNF
         977cSyPi6t62HVxTMiXvxIbRo+eC838niZVzokUWINViUX4gPTaAPVMz0auXTKhb3Hkt
         o2xvnV5jPfiX/X3E4RXn+lpQ/hGdPOLfko6x6Ux/LTJR7ga4Zyfw3fCaFj464WpFyO19
         EjNg==
X-Gm-Message-State: AOAM533Z/toV9BO5pfekFa+VqkWeqNlYwSotAcoWrzA2o5dqKkk3zOXs
        ROKzWbzZWOc+4oifakhQ784zVlh0TiTtQZSNGNJgiFE+ao4=
X-Google-Smtp-Source: ABdhPJzOua0FkxXzPUHmTp6di9ixA+zU92T2+LDPZ8w8qTKfFa8WOwaI0PP555hxuHuEZvhn3Cwf3+LLKdCBNZfHt2I=
X-Received: by 2002:a05:6830:154c:: with SMTP id l12mr2438988otp.250.1628754878354;
 Thu, 12 Aug 2021 00:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210727141749.17783-1-biju.das.jz@bp.renesas.com>
 <20210727141749.17783-4-biju.das.jz@bp.renesas.com> <CAMuHMdUyiarunEWaQPyR+R+7RbMBXm-xaE1HpuyTwCcNymVS2g@mail.gmail.com>
 <OS0PR01MB5922E8535729D5AF997B33E986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922E8535729D5AF997B33E986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Aug 2021 09:54:26 +0200
Message-ID: <CAMuHMdUcvRzW0dsdsq7j2JWfu=64JzM9M=z=qvhUhDFwXHuwQQ@mail.gmail.com>
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

On Thu, Aug 12, 2021 at 9:00 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v2 3/4] drivers: clk: renesas: rzg2l-cpg: Add support
> > to handle coupled clocks
> > On Tue, Jul 27, 2021 at 4:18 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > The AXI and CHI clocks use the same register bit for controlling clock
> > > output. Add a new clock type for coupled clocks, which sets the
> > > CPG_CLKON_ETH.CLK[01]_ON bit when at least one clock is enabled, and
> > > clears the bit only when both clocks are disabled.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > @@ -333,12 +333,16 @@ rzg2l_cpg_register_core_clk(const struct
> > cpg_core_clk *core,
> > >   * @hw: handle between common and hardware-specific interfaces
> > >   * @off: register offset
> > >   * @bit: ON/MON bit
> > > + * @is_coupled: flag to indicate coupled clock
> > > + * @on_cnt: ON count for coupled clocks
> > >   * @priv: CPG/MSTP private data
> > >   */
> > >  struct mstp_clock {
> > >         struct clk_hw hw;
> > >         u16 off;
> > >         u8 bit;
> > > +       bool is_coupled;
> > > +       u8 on_cnt;
> >
> > While u8 is probably sufficient, you may want to use unsigned int, as
> > there will be a gap anyway due to alignment rules.
> >
> > >         struct rzg2l_cpg_priv *priv;
> > >  };
> > >
> > > @@ -392,11 +396,37 @@ static int rzg2l_mod_clock_endisable(struct
> > > clk_hw *hw, bool enable)
> > >
> > >  static int rzg2l_mod_clock_enable(struct clk_hw *hw)  {
> > > +       struct mstp_clock *clock = to_mod_clock(hw);
> > > +       struct rzg2l_cpg_priv *priv = clock->priv;
> > > +       unsigned long flags;
> > > +
> > > +       spin_lock_irqsave(&priv->rmw_lock, flags);
> > > +       clock->on_cnt++;
> > > +       if (clock->is_coupled && clock->on_cnt > 1) {
> > > +               spin_unlock_irqrestore(&priv->rmw_lock, flags);
> > > +               return 1;
> > > +       }
> > > +
> > > +       spin_unlock_irqrestore(&priv->rmw_lock, flags);
> >
> > I think you can avoid taking the spinlock and touching the counter if the
> > is_coupled flag is not set.
>
> OK.
>
> >
> > > +
> > >         return rzg2l_mod_clock_endisable(hw, true);  }
> >
> > However, I'm wondering how this can work?
> >
> >       DEF_COUPLED("eth0_axi", R9A07G044_ETH0_CLK_AXI, R9A07G044_CLK_M0,
> >                               0x57c, 0),
> >       DEF_COUPLED("eth0_chi", R9A07G044_ETH0_CLK_CHI, R9A07G044_CLK_ZT,
> >                               0x57c, 0),
> >
> > This will create 2 independent clocks, each with their own mstp_clock
> > structure that has the is_coupled flag set.  Hence each clock has its own
> > counter. Shouldn't the counter be shared?
> > Am I missing something?
>
> Oops. You are correct. I need to add this counter to priv instead of mstp_clocks.

On second thought, a counter is overkill. A simple flag should be
sufficient, as the clk core only calls .{en,dis}able() when the clock is
{dis,en}enabled.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
