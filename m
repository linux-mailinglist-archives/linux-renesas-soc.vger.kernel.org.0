Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72423D57C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jul 2021 12:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbhGZKKl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 06:10:41 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:46809 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbhGZKKi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 06:10:38 -0400
Received: by mail-vs1-f52.google.com with SMTP id e4so4923763vsr.13;
        Mon, 26 Jul 2021 03:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wvdqUxhKHERv2+qH78DqFNp9d492y4Gj2NbnLroMcG4=;
        b=NIFEzRkIcJM8gy7c2pReBaWLBVy4EC86/TB4AUryLFvJNarFBnb3g8UYoe2HMuW8IM
         jPvWbE6ck0p1N1/rtq9oKK+s9g/YFdeiMXKSJoFZg2lOyOzHTThi0pZko2UOfaeN6evk
         io1Z70y6F29cCp5hiRnJI/lds/bSTxkkjNsOobv4OvF7FFq84JgpvRAmMGcAMiL2Yk4Y
         ePn8gH7Sn/biGFcAMT5UkILgTTnyEmburnvoAoFxuudFWxgeHkd8HWt23wFo6p4EiG9n
         bF6FFGhGKIMBiYHVeFePwDnV7YAsfkjEaqNBds6WwJ3gSjWHwYj15eJVyziQ2NL+dBjS
         Wv7Q==
X-Gm-Message-State: AOAM531V1G2fgmDtg8D9M8Cadxr9sDKKBlZBUO4Mr8WdRNEFt4ZW5vnv
        DxvfBpk2/VOjIKFFyyWc34l8RPp1X4z23IKE4h0=
X-Google-Smtp-Source: ABdhPJxuK1MzUBFblnvJWV6kTkW1CdPYOaUnP5qW5WZDvgWaXwIb6gWYvFjd7LeSVq/GNhpEjeg1fHb6MnE1EPlyt1E=
X-Received: by 2002:a05:6102:2828:: with SMTP id ba8mr11473034vsb.18.1627296666266;
 Mon, 26 Jul 2021 03:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com> <20210722141351.13668-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210722141351.13668-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Jul 2021 12:50:55 +0200
Message-ID: <CAMuHMdX29xg08j+dfcWFZZGhSXS_bvUni94EQe6q6=fcUFGvsg@mail.gmail.com>
Subject: Re: [PATCH net-next 03/18] drivers: clk: renesas: r9a07g044-cpg: Add
 ethernet clock sources
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Thu, Jul 22, 2021 at 4:14 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Ethernet reference clock can be sourced from PLL5_2 or PLL6_2. Add support
> for ethernet source clock selection using SEL_PLL_6_2 mux.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -35,8 +35,10 @@ enum clk_ids {
>         CLK_PLL3_DIV4,
>         CLK_PLL4,
>         CLK_PLL5,
> +       CLK_PLL5_2,

Why do you need this? We already have CLK_PLL5_DIV2?

>         CLK_PLL5_DIV2,
>         CLK_PLL6,
> +       CLK_PLL6_DIV2,
>         CLK_P1_DIV2,
>
>         /* Module Clocks */
> @@ -53,6 +55,9 @@ static const struct clk_div_table dtable_1_32[] = {
>         {0, 0},
>  };
>
> +/* Mux clock tables */
> +static const char * const sel_pll6_2[] = { ".pll6_2_div2", ".pll5_2_div2" };

".pll6_div2", ".pll5_div2"

> +
>  static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
>         /* External Clock Inputs */
>         DEF_INPUT("extal", CLK_EXTAL),
> @@ -64,6 +69,11 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
>         DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 133, 2),
>         DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 133, 2),
>
> +       DEF_FIXED(".pll5", CLK_PLL5, CLK_EXTAL, 125, 1),
> +       DEF_FIXED(".pll5_2", CLK_PLL5_2, CLK_PLL5, 1, 6),

Suffix "_2" but divided by 6?
Why do you need this clock?

> +
> +       DEF_FIXED(".pll6", CLK_PLL6, CLK_EXTAL, 125, 6),
> +
>         DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
>         DEF_FIXED(".pll2_div16", CLK_PLL2_DIV16, CLK_PLL2, 1, 16),
>         DEF_FIXED(".pll2_div20", CLK_PLL2_DIV20, CLK_PLL2, 1, 20),
> @@ -73,6 +83,9 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
>         DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
>         DEF_FIXED(".pll3_div4", CLK_PLL3_DIV4, CLK_PLL3, 1, 4),
>
> +       DEF_FIXED(".pll5_2_div2", CLK_PLL5_DIV2, CLK_PLL5_2, 1, 2),

".pll5_div2"
Figure 8.3 ("Clock System Diagram (2)") says the parent is CLK_PLL5?

> +       DEF_FIXED(".pll6_2_div2", CLK_PLL6_DIV2, CLK_PLL6, 1, 2),

".pll6_div2"

> +
>         /* Core output clk */
>         DEF_FIXED("I", R9A07G044_CLK_I, CLK_PLL1, 1, 1),
>         DEF_DIV("P0", R9A07G044_CLK_P0, CLK_PLL2_DIV16, DIVPL2A,
> @@ -83,6 +96,10 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
>         DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G044_CLK_P1, 1, 2),
>         DEF_DIV("P2", R9A07G044_CLK_P2, CLK_PLL3_DIV2_4_2,
>                 DIVPL3A, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
> +       DEF_FIXED("M0", R9A07G044_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
> +       DEF_FIXED("ZT", R9A07G044_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
> +       DEF_MUX("HP", R9A07G044_CLK_HP, SEL_PLL6_2,
> +               sel_pll6_2, ARRAY_SIZE(sel_pll6_2), 0, CLK_MUX_HIWORD_MASK),

OK.

>  };
>
>  static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
> diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
> index 148db5de253b..5202c0512483 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -11,6 +11,7 @@
>
>  #define CPG_PL2_DDIV           (0x204)
>  #define CPG_PL3A_DDIV          (0x208)
> +#define CPG_PL6_ETH_SSEL       (0x418)
>
>  /* n = 0/1/2 for PLL1/4/6 */
>  #define CPG_SAMPLL_CLK1(n)     (0x04 + (16 * n))
> @@ -24,6 +25,11 @@
>  #define DIVPL3A                DDIV_PACK(CPG_PL3A_DDIV, 0, 3)
>  #define DIVPL3B                DDIV_PACK(CPG_PL3A_DDIV, 4, 3)
>
> +#define SEL_PLL_PACK(offset, bitpos, size) \
> +               (((offset) << 20) | ((bitpos) << 12) | ((size) << 8))

I think the addition of SEL_PLL_PACK() should be moved to
[PATCH 02/18].

> +
> +#define SEL_PLL6_2     SEL_PLL_PACK(CPG_PL6_ETH_SSEL, 0, 1)
> +
>  /**
>   * Definitions of CPG Core Clocks
>   *

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
