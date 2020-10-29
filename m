Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAFD29EE32
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Oct 2020 15:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgJ2O3K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Oct 2020 10:29:10 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:42408 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgJ2O3K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 10:29:10 -0400
Received: by mail-oo1-f67.google.com with SMTP id l26so735740oop.9;
        Thu, 29 Oct 2020 07:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Om9WUjh4cubJwGaGg9gntuiRkHiaoGi/Sm+rG3LGg3M=;
        b=iaQ17wd/eK4ed1F4DYkowMz4hlNGw32fjoEznv/SWnEunjqd4oPW304AxxRf3lgQ0C
         9X4Tw0NRl6Goi4nfPgV4tXxlCPvSv9FFyE+Rkedtz1VlM3YyRYG8J6dkHQB9g5VRCvWk
         XJbUHDixadAriDuO/Fwezmw9ZkQKLZTReVIg+miztTNFapCxK/3O3PYBAdvo9caFHx+j
         eOkUtzOgL8G3rrKEABS6RVrye1oxrysT6ODa6+357YkfHfqIjJU54yURrUGgLtCEl/Zl
         6CAJ7i7V12EIH9ybmh1aI8+ietcLWmpk/mnjyInZBx3NAMlyd2u0S4oSFWDHWBbVnzyp
         0OjQ==
X-Gm-Message-State: AOAM532Jc4CVLF7m57HWRKJunRXPZE+YGonC4wrXSc7zw26gaIVumd3J
        6DFaGLNEuD9QElMnmA3LO20zggjrw8v4WmcjkN8=
X-Google-Smtp-Source: ABdhPJw7YlP1lEV530rXHjS9xtnhZh1Vq9wCndTfLh4fCs3RdWXOrequIUwIhf9iOd/F4dNMTHRaU553LofDOScJkwc=
X-Received: by 2002:a4a:8892:: with SMTP id j18mr3445928ooa.40.1603981748538;
 Thu, 29 Oct 2020 07:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201029105515.16309-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201029105515.16309-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Oct 2020 15:28:57 +0100
Message-ID: <CAMuHMdVGO+DEgsTr62nA+egU2etZA_vwE9GrOG1JPWBvv90UXg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r8a774c0: Add RPC clocks
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

On Thu, Oct 29, 2020 at 11:55 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> as well as the RPC-IF module clock, in the RZ/G2E (R8A774C0) CPG/MSSR
> driver.

Thanks for your patch!

> Add new clk type CLK_TYPE_GEN3E3_RPCSRC to handle registering rpcsrc
> clock as the source for RPCSRC can be either PLL0/PLL1 and this depends
> on MD[1:4] pins where as compared to other R-Car Gen3 SoC's the RPCSRC
> clock source is always PLL1.
>
> MD[4] MD[3] MD[2] MD[1]
>   0     0     0    1     -> RPCSRC CLK source is PLL1
>   0     0     1    1     -> RPCSRC CLK source is PLL1
>   0     1     0    0     -> RPCSRC CLK source is PLL1
>   1     0     1    1     -> RPCSRC CLK source is PLL1
>   x     x     x    x     -> For any other values RPCSRC CLK source is PLL0

AFAIU, the _initial values_ of the RPCCKCR bits depend on the MD pins.
They can still be changed at run-time, and might have been changed by
the bootloader before transferring control to Linux.

> R-Car Gen3 manual Rev.2.20 has in-correct information related to
> determining the clock source for RPCSRC.

Which part of the information is not correct?
Where can I find corrected information?
Is my understanding above incorrect, too?

> --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c

> @@ -73,6 +74,12 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
>         DEF_FIXED(".s2",       CLK_S2,             CLK_PLL1,       4, 1),
>         DEF_FIXED(".s3",       CLK_S3,             CLK_PLL1,       6, 1),
>         DEF_FIXED(".sdsrc",    CLK_SDSRC,          CLK_PLL1,       2, 1),
> +       DEF_BASE(".rpcsrc",    CLK_RPCSRC, CLK_TYPE_GEN3E3_RPCSRC, (CLK_PLL1 << 16) | CLK_PLL0),

You may want to add a new DEF_* helper macro for this.

> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -441,6 +441,14 @@ static const struct clk_div_table cpg_rpcsrc_div_table[] = {
>         { 2, 5 }, { 3, 6 }, { 0, 0 },
>  };
>
> +static const struct clk_div_table cpg_rpcsrc_e3_pll0_div_table[] = {
> +       { 2, 8 }, { 0, 0 },
> +};
> +
> +static const struct clk_div_table cpg_rpcsrc_e3_pll1_div_table[] = {
> +       { 0, 5 }, { 1, 3 }, { 3, 2 }, { 0, 0 },
> +};
> +
>  static const struct clk_div_table cpg_rpc_div_table[] = {
>         { 1, 2 }, { 3, 4 }, { 5, 6 }, { 7, 8 }, { 0, 0 },
>  };
> @@ -515,6 +523,18 @@ static struct clk * __init cpg_rpcd2_clk_register(const char *name,
>         return clk;
>  }
>
> +static int __init cpg_rpcsrc_e3_get_parent(u32 mode)
> +{
> +       unsigned int e3_rpcsrc = (mode & GENMASK(4, 1)) >> 1;
> +       unsigned int pll1[] = { 0x1, 0x3, 0x4, 0xb, };
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(pll1); i++)
> +               if (e3_rpcsrc == pll1[i])
> +                       return 1;
> +
> +       return 0;
> +}
>
>  static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
>  static unsigned int cpg_clk_extalr __initdata;
> @@ -552,6 +572,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>         const struct clk *parent;
>         unsigned int mult = 1;
>         unsigned int div = 1;
> +       int e3_rpcsrc_parent;
>         u32 value;
>
>         parent = clks[core->parent & 0xffff];   /* some types use high bits */
> @@ -696,6 +717,22 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>                                                   cpg_rpcsrc_div_table,
>                                                   &cpg_lock);
>
> +       case CLK_TYPE_GEN3E3_RPCSRC:
> +               e3_rpcsrc_parent = cpg_rpcsrc_e3_get_parent(cpg_mode);

This is not correct if the boot loader has changed the parent clock.

> +               if (e3_rpcsrc_parent) {
> +                       parent = clks[core->parent >> 16];
> +                       if (IS_ERR(parent))
> +                               return ERR_CAST(parent);
> +               }
> +
> +               return clk_register_divider_table(NULL, core->name,
> +                                                 __clk_get_name(parent), 0,
> +                                                 base + CPG_RPCCKCR, 3, 2, 0,
> +                                                 e3_rpcsrc_parent ?
> +                                                 cpg_rpcsrc_e3_pll1_div_table :
> +                                                 cpg_rpcsrc_e3_pll0_div_table,
> +                                                 &cpg_lock);
> +

So you want to keep the parent clock selection fixed, but still allow
the system to change the divider?
Why not support changing the parent too, by modeling this as a composite
clock consisting of a mux and a divider?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
