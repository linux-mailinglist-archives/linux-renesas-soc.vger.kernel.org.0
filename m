Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA673E8E64
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 12:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237042AbhHKKUO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 06:20:14 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:43995 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237097AbhHKKTT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 06:19:19 -0400
Received: by mail-ua1-f48.google.com with SMTP id 91so919363uas.10;
        Wed, 11 Aug 2021 03:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Q8s4XNFeaTBVMJpdK2ZXWr71zWi9KOshVe6J/hLmG0=;
        b=phTaiy//oEFyJpDd9dco2KNpWoRaf6dllK1C/t56K8/VTJKwbLvqLB4H4v9WRcnFMQ
         9ZPfwllQAEc6qzTqGJvJYGG2ezObLJ9qTY61KMnqrZ1bF8OxWKHFcupJNyp/hXQdu7L4
         spTSrPTB8sXCDpW+uyRkEmzewqgQwjlMVWRevD+f8q0CubCTJL1LMFLesFIZIomaaEIE
         T2wYxSwU0OQJj+y03w6e4Xl1nUOGdDPCCcsJWVyXuXqPL3Iv2r00gmU+GSoOW6Pu2FKP
         W7sIhyW6t9UC3j9DERTaO5DJzsCUWfoZPN8wy7cwVW9urakBUoseV6suLFnOGnl4h/t1
         F3zQ==
X-Gm-Message-State: AOAM533Mir6EId/aotn0ATx9l8QW68xaollG7X488ggBT13n2sIIY6IX
        trzuoVmRbc0vPBKAXGDbV+iMMhcIibRHu07q1GE=
X-Google-Smtp-Source: ABdhPJz9jKBmKIOVtcsOAAI+3GFI9FI+L+BCBb2dLvY/fKRWFwwvfQjHoHo1eIB1c5tUNSUe1NCXC4YYTH7yEtvtwxU=
X-Received: by 2002:a9f:31ad:: with SMTP id v42mr11867333uad.58.1628677134985;
 Wed, 11 Aug 2021 03:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210727141749.17783-1-biju.das.jz@bp.renesas.com> <20210727141749.17783-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210727141749.17783-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Aug 2021 12:18:43 +0200
Message-ID: <CAMuHMdUyiarunEWaQPyR+R+7RbMBXm-xaE1HpuyTwCcNymVS2g@mail.gmail.com>
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

On Tue, Jul 27, 2021 at 4:18 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The AXI and CHI clocks use the same register bit for controlling clock
> output. Add a new clock type for coupled clocks, which sets the
> CPG_CLKON_ETH.CLK[01]_ON bit when at least one clock is enabled, and
> clears the bit only when both clocks are disabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -333,12 +333,16 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
>   * @hw: handle between common and hardware-specific interfaces
>   * @off: register offset
>   * @bit: ON/MON bit
> + * @is_coupled: flag to indicate coupled clock
> + * @on_cnt: ON count for coupled clocks
>   * @priv: CPG/MSTP private data
>   */
>  struct mstp_clock {
>         struct clk_hw hw;
>         u16 off;
>         u8 bit;
> +       bool is_coupled;
> +       u8 on_cnt;

While u8 is probably sufficient, you may want to use unsigned int,
as there will be a gap anyway due to alignment rules.

>         struct rzg2l_cpg_priv *priv;
>  };
>
> @@ -392,11 +396,37 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
>
>  static int rzg2l_mod_clock_enable(struct clk_hw *hw)
>  {
> +       struct mstp_clock *clock = to_mod_clock(hw);
> +       struct rzg2l_cpg_priv *priv = clock->priv;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&priv->rmw_lock, flags);
> +       clock->on_cnt++;
> +       if (clock->is_coupled && clock->on_cnt > 1) {
> +               spin_unlock_irqrestore(&priv->rmw_lock, flags);
> +               return 1;
> +       }
> +
> +       spin_unlock_irqrestore(&priv->rmw_lock, flags);

I think you can avoid taking the spinlock and touching the counter
if the is_coupled flag is not set.

> +
>         return rzg2l_mod_clock_endisable(hw, true);
>  }

However, I'm wondering how this can work?

      DEF_COUPLED("eth0_axi", R9A07G044_ETH0_CLK_AXI, R9A07G044_CLK_M0,
                              0x57c, 0),
      DEF_COUPLED("eth0_chi", R9A07G044_ETH0_CLK_CHI, R9A07G044_CLK_ZT,
                              0x57c, 0),

This will create 2 independent clocks, each with their own mstp_clock
structure that has the is_coupled flag set.  Hence each clock has
its own counter. Shouldn't the counter be shared?
Am I missing something?

And what about rzg2l_mod_clock_is_enabled()?
Shouldn't it reflect the soft state instead of the shared hardware
state?

>  static void rzg2l_mod_clock_disable(struct clk_hw *hw)
>  {
> +       struct mstp_clock *clock = to_mod_clock(hw);
> +       struct rzg2l_cpg_priv *priv = clock->priv;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&priv->rmw_lock, flags);
> +       clock->on_cnt--;
> +       if (clock->is_coupled && clock->on_cnt) {
> +               spin_unlock_irqrestore(&priv->rmw_lock, flags);
> +               return;
> +       }
> +
> +       spin_unlock_irqrestore(&priv->rmw_lock, flags);
> +
>         rzg2l_mod_clock_endisable(hw, false);
>  }
>
> @@ -475,6 +505,7 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
>
>         clock->off = mod->off;
>         clock->bit = mod->bit;
> +       clock->is_coupled = mod->is_coupled;
>         clock->priv = priv;
>         clock->hw.init = &init;
>
> diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
> index 5202c0512483..191c403aa52f 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -93,6 +93,7 @@ enum clk_types {
>   * @parent: id of parent clock
>   * @off: register offset
>   * @bit: ON/MON bit
> + * @is_coupled: flag to indicate coupled clock
>   */
>  struct rzg2l_mod_clk {
>         const char *name;
> @@ -100,17 +101,25 @@ struct rzg2l_mod_clk {
>         unsigned int parent;
>         u16 off;
>         u8 bit;
> +       bool is_coupled;
>  };
>
> -#define DEF_MOD(_name, _id, _parent, _off, _bit)       \
> +#define DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _is_coupled)     \
>         { \
>                 .name = _name, \
>                 .id = MOD_CLK_BASE + (_id), \
>                 .parent = (_parent), \
>                 .off = (_off), \
>                 .bit = (_bit), \
> +               .is_coupled = (_is_coupled), \
>         }
>
> +#define DEF_MOD(_name, _id, _parent, _off, _bit)       \
> +       DEF_MOD_BASE(_name, _id, _parent, _off, _bit, false)
> +
> +#define DEF_COUPLED(_name, _id, _parent, _off, _bit)   \
> +       DEF_MOD_BASE(_name, _id, _parent, _off, _bit, true)
> +
>  /**
>   * struct rzg2l_reset - Reset definitions
>   *

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
