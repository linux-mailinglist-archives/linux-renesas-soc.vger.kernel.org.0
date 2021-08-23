Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0C43F4816
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Aug 2021 12:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234619AbhHWKB2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 06:01:28 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:35511 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbhHWKBX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 06:01:23 -0400
Received: by mail-vk1-f180.google.com with SMTP id t11so4073194vkc.2;
        Mon, 23 Aug 2021 03:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PCcKsdPZ/RTcZhhk1cxfqR3xDypslOMq5mStiR2yzt0=;
        b=DUqOSSHnhXS7j+lFKlwdykTfXXhzcXrHm8AJ6+y8HK54JikuOxLq/wyaDwVdLx5X8Q
         c7OsiSvo5yOUImPtKjWn/xlmvkLeDcFTmnRIx+XbPsVGMogFIi/r007KIvvaXYYTFN9t
         VY6Geg62vHTpliYwQFZqdbORHX5LxnXJjSpm1ex/SiZhz+3UGekpTivMEj2f20RO6mx0
         6Z1LRutc/i9OLr8wuZViynh5bdIELEJyp8NDdBSLI7c2mLL/Go3JLTUj/d9P7+kvu1Ug
         rB7W62Uv1ZAInjZ/za5N6Qk8WM5dgtuMKoSLN6w+H0iSBwAd0sc1SFOl965YPyZyvrO3
         FnUA==
X-Gm-Message-State: AOAM531OZoHtcosKxJlHflakgA4T78KWEW1kMdEdORhKzupo2Veh6jiC
        YqfGxGXT5Gy14afWQDc17CB2AQj5hvIXrRF7L5s=
X-Google-Smtp-Source: ABdhPJy3vbHHLJEMeuCgOsyI2+V0Tj/GGufleeHGg7F8wIfKKj0ZYsfuDR9sV2QCKdqYUPK0+/pV5s+YUbM7jsGZxY8=
X-Received: by 2002:ac5:c85c:: with SMTP id g28mr21197285vkm.5.1629712840243;
 Mon, 23 Aug 2021 03:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210815103014.21208-1-biju.das.jz@bp.renesas.com> <20210815103014.21208-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210815103014.21208-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Aug 2021 12:00:28 +0200
Message-ID: <CAMuHMdXj8xmJ0ySOJQ74AjkTDJUQwTJ93rYjyRPnJ1dwGfj1xg@mail.gmail.com>
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

On Sun, Aug 15, 2021 at 12:30 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The AXI and CHI clocks use the same register bit for controlling clock
> output. Add a new clock type for coupled clocks, which sets the
> CPG_CLKON_ETH.CLK[01]_ON bit when at least one clock is enabled, and
> clears the bit only when both clocks are disabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Reworked as per Geert's suggestion
>  * Added enabled flag to track the status of clock, if it is coupled
>    with another clock
>  * Introduced siblings pointer which points to the other coupled
>    clock
>  * coupled clock linking is done during module clk register.
>  * rzg2l_mod_clock_is_enabled function returns soft state of the
>    module clocks, if it is coupled with another clock
>  * Updated the commit header

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -392,11 +396,35 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
>
>  static int rzg2l_mod_clock_enable(struct clk_hw *hw)
>  {
> +       struct mstp_clock *clock = to_mod_clock(hw);
> +       struct mstp_clock *siblings = clock->siblings;
> +
> +       if (siblings) {
> +               if (siblings->enabled) {
> +                       clock->enabled = true;
> +                       return 0;
> +               }
> +
> +               clock->enabled = true;

clock->enabled is set to true regardless of the if condition.
This also needs locking, in case both clocks are changed concurrently:

    spin_lock_irqsave(&priv->rmw_lock, flags);
    enabled = siblings->enabled;
    clock->enabled = true;
    spin_unlock_irqrestore(&priv->rmw_lock, flags);
    if (enabled)
            return 0;

> +       }
> +
>         return rzg2l_mod_clock_endisable(hw, true);
>  }
>
>  static void rzg2l_mod_clock_disable(struct clk_hw *hw)
>  {
> +       struct mstp_clock *clock = to_mod_clock(hw);
> +       struct mstp_clock *siblings = clock->siblings;
> +
> +       if (siblings) {
> +               if (siblings->enabled) {
> +                       clock->enabled = false;
> +                       return;
> +               }
> +
> +               clock->enabled = false;

Likewise.

> +       }
> +
>         rzg2l_mod_clock_endisable(hw, false);
>  }
>
> @@ -412,6 +440,9 @@ static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
>                 return 1;
>         }
>
> +       if (clock->siblings)
> +               return clock->enabled;
> +
>         value = readl(priv->base + CLK_MON_R(clock->off));
>
>         return !(value & bitmask);
> @@ -423,11 +454,33 @@ static const struct clk_ops rzg2l_mod_clock_ops = {
>         .is_enabled = rzg2l_mod_clock_is_enabled,
>  };
>
> +static struct mstp_clock
> +*rzg2l_cpg_get_sibling_clk(struct mstp_clock *clock,
> +                          struct rzg2l_cpg_priv *priv)
> +{
> +       struct mstp_clock *sibl_clk = NULL;

clk?
It's only a sibling when the condition inside the loop is true.

> +       struct clk_hw *hw;
> +       unsigned int i;
> +
> +       for (i = 0; i < priv->num_mod_clks; i++) {
> +               if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
> +                       continue;
> +
> +               hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
> +               sibl_clk = to_mod_clock(hw);
> +               if (clock->off == sibl_clk->off && clock->bit == sibl_clk->bit)
> +                       break;
> +       }
> +
> +       return sibl_clk;
> +}
> +
>  static void __init
>  rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
>                            const struct rzg2l_cpg_info *info,
>                            struct rzg2l_cpg_priv *priv)
>  {
> +       struct mstp_clock *sibling_clock = NULL;
>         struct mstp_clock *clock = NULL;
>         struct device *dev = priv->dev;
>         unsigned int id = mod->id;
> @@ -484,6 +537,15 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
>
>         dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
>         priv->clks[id] = clk;
> +
> +       if (mod->is_coupled) {
> +               sibling_clock = rzg2l_cpg_get_sibling_clk(clock, priv);
> +               if (sibling_clock) {
> +                       clock->siblings = sibling_clock;
> +                       sibling_clock->siblings = clock;
> +               }

You forgot to initialize mstp_clock.enabled to match the current
hardware state.

> +       }
> +
>         return;
>
>  fail:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
