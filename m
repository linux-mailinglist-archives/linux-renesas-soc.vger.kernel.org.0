Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306792B3EBF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Nov 2020 09:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgKPIeO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 03:34:14 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40114 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgKPIeN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 03:34:13 -0500
Received: by mail-oi1-f196.google.com with SMTP id m143so17972362oig.7;
        Mon, 16 Nov 2020 00:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qygB+REaFsOOV9fGBhE+vHDIJeGIu419PsbJCw4QwlQ=;
        b=drNJXX8/JEu/eMofli6tYi1krg/EmaKQhxfMJVbr4YEWhlotASABMf2aHn80YaP7q3
         K/IWgWv1VMddJjYK2E0tmJN6oQL/BqTYjcGqTEmdztwH50u0MaiQvyljAVq4WVf1FQXE
         TOWQosCOtLr54nqw3VO8vxOHUVQ0K/t4vXpk7sChk3cEvtXaUdzmy/rwQNk1mtDRvYWr
         6LYg4i9UYbevTPCste9O4eGMt1jCMhux2f241Javh0AMXhK1JK4hqGWoDT1X7PK7ZIBb
         umLDibMbm/dI0++fEU5983lZdTYRSOaFkeckPkPE6iw9Yd5FLcNlnyycUgUhnNeVO5TF
         GVvA==
X-Gm-Message-State: AOAM531aAjKBB+1eO2jAqvRiGjY05N/SPOqVkWHsLzoi1A/UGYZqTL0q
        DNXLGqq48/BbQ/evL909awEDc1gu4XaYbyRVBuwLcH/yb9JpCg==
X-Google-Smtp-Source: ABdhPJxtFw4iY9Add4/wu2RThyQC0S93hB21Syy+sYgaFi/lBZlEwzSW7jRbTOptUFfTos11/qps+LovaycKU30Hb0c=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr8575370oia.153.1605515651319;
 Mon, 16 Nov 2020 00:34:11 -0800 (PST)
MIME-Version: 1.0
References: <20201110125609.30246-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201110125609.30246-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Nov 2020 09:33:59 +0100
Message-ID: <CAMuHMdUky4OEvCLnDYr3C-PB+PKdSx3U5+dCfhiftDhf3RKmAQ@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: r8a774c0: Add RPC clocks
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Tue, Nov 10, 2020 at 1:56 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
> driver.
>
> Add new clk type CLK_TYPE_GEN3E3_RPCSRC to register rpcsrc as a fixed
> clock on R-Car Gen3 E3 (and also RZ/G2E which is identical to E3 SoC),
> parent and the divider is set based on the register value CPG_RPCCKCR[4:3]
> (parent is cross verified against MD[4:1] pins) which has been set prior
> to booting the kernel.
>
> MD[4] MD[3] MD[2] MD[1]
>   0     0     0    1     -> RPCSRC CLK source is PLL1
>   0     0     1    1     -> RPCSRC CLK source is PLL1
>   0     1     0    0     -> RPCSRC CLK source is PLL1
>   1     0     1    1     -> RPCSRC CLK source is PLL1
>   x     x     x    x     -> For any other values RPCSRC CLK source is PLL0
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> ---
> v2->v3
> * Implemented as a fixed clock

Sounds fine to me.  If we ever need to configure this clock from Linux,
the driver can be changed.

> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -427,6 +427,19 @@ static struct clk * __init cpg_sd_clk_register(const char *name,
>         return clk;
>  }
>
> +static bool __init cpg_rpcsrc_e3_parent_is_pll0(u32 mode)
> +{
> +       unsigned int e3_rpcsrc = (mode & GENMASK(4, 1)) >> 1;
> +       unsigned int pll1[] = { 0x1, 0x3, 0x4, 0xb, };
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(pll1); i++)
> +               if (e3_rpcsrc == pll1[i])
> +                       return false;

Did you know gcc (version 9.3.0) generates smaller code for:

        switch (e3_rpcsrc) {
        case 0x1:
        case 0x3:
        case 0x4:
        case 0xb:
                return false;

        default:
                return true;
        }

?

> @@ -696,6 +709,42 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>                                                   cpg_rpcsrc_div_table,
>                                                   &cpg_lock);
>
> +       case CLK_TYPE_GEN3E3_RPCSRC:
> +               /*
> +                * Register RPCSRC as fixed factor clock based on the
> +                * MD[4:1] pins and CPG_RPCCKCR[4:3] register value for
> +                * which has been set prior to booting the kernel.
> +                */
> +
> +               value = (readl(base + CPG_RPCCKCR) & GENMASK(4, 3)) >> 3;
> +               if (cpg_rpcsrc_e3_parent_is_pll0(cpg_mode)) {
> +                       if (value != 2)
> +                               return ERR_PTR(-EINVAL);
> +               } else {
> +                       if (value == 2)
> +                               return ERR_PTR(-EINVAL);
> +               }

IMHO this cross-verification is not needed, and harmful: it prevents the
boot loader from changing the configuration, which I think is a valid
use case.

> +
> +               switch (value) {
> +               case 0:
> +                       div = 5;
> +                       break;
> +               case 1:
> +                       div = 3;
> +                       break;
> +               case 2:
> +                       parent = clks[core->parent >> 16];
> +                       if (IS_ERR(parent))
> +                               return ERR_CAST(parent);
> +                       div = 8;

R-Car D3 is very similar, but uses div = 5 instead of 8.
Perhaps this value can be retrieved from cpg_core_clk.div?
Of course, we can do that later, when D3 support is added.

> +                       break;
> +               case 3:
> +               default:
> +                       div = 2;
> +                       break;
> +               }
> +               break;
> +
>         case CLK_TYPE_GEN3_RPC:
>                 return cpg_rpc_clk_register(core->name, base,
>                                             __clk_get_name(parent), notifiers);

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
