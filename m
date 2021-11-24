Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7817D45C503
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 14:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349903AbhKXNyl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 08:54:41 -0500
Received: from mail-vk1-f179.google.com ([209.85.221.179]:34522 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346362AbhKXNv1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 08:51:27 -0500
Received: by mail-vk1-f179.google.com with SMTP id j1so1543225vkr.1;
        Wed, 24 Nov 2021 05:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fYzt8qdJYxcYfguedI1hqdQD/QiiuEvhO4ChElAudfo=;
        b=TV7rdsaDbHkPjAATClN5sljXOtWAQZKafwKjHrKgxU8Z75iPQTAdGHDGDoX+7DiZu3
         hfGfrLbSQCoBBZQcAwtlIEN7hnpPP1KdhTti2SDpwAaot1aUQqT17R5ofd8K0eFgXt5n
         Z1FGAG9nIDtuHhtBGAqovd21sueBs7hdOHSmIDQsdNMavvy8l65YwcdnW6KNTVZ23jnS
         JqHnUJx8s8f30/Rr4dsY7yZvpaCs988/lWmKa2d+5K5k/s1xOvMRekJ9otxVfFAUfWFw
         fIjT5jfXcZKyL0S5OBhzpQg7QEax6xG0SSbeOsI2BmSK0wACBACLu9W511Ry9sueIP2n
         JRDw==
X-Gm-Message-State: AOAM532xRYQZwPNW41E8iXGMAp+0s+D2c1cDM+VLXR2mjGcHlPbB2G69
        9r65H/E0T6V8RgopwCOdfJAzxtEVDYlUVQ==
X-Google-Smtp-Source: ABdhPJxW2H4obpTingt908zHnfMZDxnMxmWM/IuFw2t6WdDLbRJvj8F+hW0OwMA0AQVVaaPZQUyARg==
X-Received: by 2002:a05:6122:50e:: with SMTP id x14mr27823913vko.7.1637761696537;
        Wed, 24 Nov 2021 05:48:16 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 23sm7794155vkk.17.2021.11.24.05.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 05:48:16 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id l24so5256577uak.2;
        Wed, 24 Nov 2021 05:48:16 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr23000736vsl.35.1637761694879;
 Wed, 24 Nov 2021 05:48:14 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-13-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-13-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 14:48:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUc4PTbo7Fi962qp3RZStR+04S1trhVcnfdynocpQWvBQ@mail.gmail.com>
Message-ID: <CAMuHMdUc4PTbo7Fi962qp3RZStR+04S1trhVcnfdynocpQWvBQ@mail.gmail.com>
Subject: Re: [PATCH 12/16] clk: renesas: cpg-mssr: Add support for R-Car S4-8
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch!

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Initial support for R-Car S4-8 (r8a779f0), including core, module
> clocks, resets, and register access, because register specification
> differs from R-Car Gen2/3. The register layout of V3U is a similar
> with R-Car S4-8 so that renames CLK_REG_LAYOUT_RCAR_V3U as
> CLK_REG_LAYOUT_RCAR_GEN4. However, PLL names differ between V3U
> and S4-8.

This is a small difference, so I think more code can be shared between
R-Car V3U and S4-8 (see below).

> Inspired by patches in the BSP by LUU HOAI.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

>  drivers/clk/renesas/Kconfig             |  10 ++
>  drivers/clk/renesas/Makefile            |   2 +
>  drivers/clk/renesas/r8a779a0-cpg-mssr.c |   2 +-
>  drivers/clk/renesas/r8a779f0-cpg-mssr.c | 188 ++++++++++++++++++++++++
>  drivers/clk/renesas/rcar-gen4-cpg.c     | 141 ++++++++++++++++++
>  drivers/clk/renesas/rcar-gen4-cpg.h     |  76 ++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.c  |  42 ++++--
>  drivers/clk/renesas/renesas-cpg-mssr.h  |   3 +-
>  8 files changed, 448 insertions(+), 16 deletions(-)
>  create mode 100644 drivers/clk/renesas/r8a779f0-cpg-mssr.c
>  create mode 100644 drivers/clk/renesas/rcar-gen4-cpg.c
>  create mode 100644 drivers/clk/renesas/rcar-gen4-cpg.h

Just like for the SYSC driver, I think it wouldn't hurt to split this
patch in two parts: one patch to generalize r8a779a0-cpg-mssr.c for
R-Car Gen4, and a second patch to introduce support for R-Car S4-8.

> +static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
> +       /* External Clock Inputs */
> +       DEF_INPUT("extal",      CLK_EXTAL),
> +       DEF_INPUT("extalr",     CLK_EXTALR),
> +
> +       /* Internal Core Clocks */
> +       DEF_BASE(".main", CLK_MAIN,     CLK_TYPE_GEN4_MAIN, CLK_EXTAL),
> +       DEF_BASE(".pll1", CLK_PLL1,     CLK_TYPE_GEN4_PLL1, CLK_MAIN),
> +       DEF_BASE(".pll3", CLK_PLL3,     CLK_TYPE_GEN4_PLL3, CLK_MAIN),
> +       DEF_BASE(".pll2", CLK_PLL2,     CLK_TYPE_GEN4_PLL2, CLK_MAIN),
> +       DEF_BASE(".pll6", CLK_PLL6,     CLK_TYPE_GEN4_PLL6, CLK_MAIN),
> +       DEF_BASE(".pll5", CLK_PLL5,     CLK_TYPE_GEN4_PLL5, CLK_MAIN),

Please sort PLLn by index.

> +
> +       DEF_FIXED(".pll1_div2", CLK_PLL1_DIV2,  CLK_PLL1,       2, 1),
> +       DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2,  CLK_PLL2,       2, 1),
> +       DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2,  CLK_PLL3,       2, 1),
> +       DEF_FIXED(".pll5_div2", CLK_PLL5_DIV2,  CLK_PLL5,       2, 1),
> +       DEF_FIXED(".pll5_div4", CLK_PLL5_DIV4,  CLK_PLL5_DIV2,  2, 1),
> +       DEF_FIXED(".pll6_div2", CLK_PLL6_DIV2,  CLK_PLL6,       2, 1),
> +       DEF_FIXED(".s0",        CLK_S0,         CLK_PLL1_DIV2,  2, 1),
> +       DEF_FIXED(".sdsrc",     CLK_SDSRC,      CLK_PLL5_DIV2,  2, 1),

This relies on the default setting of the SD-IF0 Clock Frequency
Control Register 1 (SD0CKCR1)?

> +       DEF_RATE(".oco",        CLK_OCO,        32768),
> +
> +       DEF_BASE(".rpcsrc",     CLK_RPCSRC,             CLK_TYPE_GEN4_RPCSRC, CLK_PLL5),
> +       DEF_BASE(".rpc",        R8A779F0_CLK_RPC,       CLK_TYPE_GEN4_RPC, CLK_RPCSRC),
> +       DEF_BASE("rpcd2",       R8A779F0_CLK_RPCD2,     CLK_TYPE_GEN4_RPCD2, R8A779F0_CLK_RPC),
> +
> +       /* Core Clock Outputs */
> +       DEF_FIXED("s0d2",       R8A779F0_CLK_S0D2,      CLK_S0,         2, 1),
> +       DEF_FIXED("s0d3",       R8A779F0_CLK_S0D3,      CLK_S0,         3, 1),
> +       DEF_FIXED("s0d4",       R8A779F0_CLK_S0D4,      CLK_S0,         4, 1),
> +       DEF_FIXED("cl16m",      R8A779F0_CLK_CL16M,     CLK_S0,         48, 1),
> +       DEF_FIXED("s0d2_mm",    R8A779F0_CLK_S0D2_MM,   CLK_S0,         2, 1),
> +       DEF_FIXED("s0d3_mm",    R8A779F0_CLK_S0D3_MM,   CLK_S0,         3, 1),
> +       DEF_FIXED("s0d4_mm",    R8A779F0_CLK_S0D4_MM,   CLK_S0,         4, 1),
> +       DEF_FIXED("cl16m_mm",   R8A779F0_CLK_CL16M_MM,  CLK_S0,         48, 1),
> +       DEF_FIXED("s0d2_rt",    R8A779F0_CLK_S0D2_RT,   CLK_S0,         2, 1),
> +       DEF_FIXED("s0d3_rt",    R8A779F0_CLK_S0D3_RT,   CLK_S0,         3, 1),
> +       DEF_FIXED("s0d4_rt",    R8A779F0_CLK_S0D4_RT,   CLK_S0,         4, 1),
> +       DEF_FIXED("s0d6_rt",    R8A779F0_CLK_S0D6_RT,   CLK_S0,         6, 1),
> +       DEF_FIXED("cl16m_rt",   R8A779F0_CLK_CL16M_RT,  CLK_S0,         48, 1),
> +       DEF_FIXED("s0d3_per",   R8A779F0_CLK_S0D3_PER,  CLK_S0,         3, 1),
> +       DEF_FIXED("s0d6_per",   R8A779F0_CLK_S0D6_PER,  CLK_S0,         6, 1),
> +       DEF_FIXED("s0d12_per",  R8A779F0_CLK_S0D12_PER, CLK_S0,         12, 1),
> +       DEF_FIXED("s0d24_per",  R8A779F0_CLK_S0D24_PER, CLK_S0,         24, 1),
> +       DEF_FIXED("cl16m_per",  R8A779F0_CLK_CL16M_PER, CLK_S0,         48, 1),
> +       DEF_FIXED("s0d2_hsc",   R8A779F0_CLK_S0D2_HSC,  CLK_S0,         2, 1),
> +       DEF_FIXED("s0d3_hsc",   R8A779F0_CLK_S0D3_HSC,  CLK_S0,         3, 1),
> +       DEF_FIXED("s0d4_hsc",   R8A779F0_CLK_S0D4_HSC,  CLK_S0,         4, 1),
> +       DEF_FIXED("s0d6_hsc",   R8A779F0_CLK_S0D6_HSC,  CLK_S0,         6, 1),
> +       DEF_FIXED("s0d12_hsc",  R8A779F0_CLK_S0D12_HSC, CLK_S0,         12, 1),
> +       DEF_FIXED("cl16m_hsc",  R8A779F0_CLK_CL16M_HSC, CLK_S0,         48, 1),
> +       DEF_FIXED("s0d2_cc",    R8A779F0_CLK_S0D2_CC,   CLK_S0,         2, 1),
> +       DEF_FIXED("rsw",        R8A779F0_CLK_RSW2,      CLK_PLL5,       2, 1),

"rsw2"?

> +       DEF_FIXED("cbfusa",     R8A779F0_CLK_CBFUSA,    CLK_EXTAL,      2, 1),
> +       DEF_FIXED("cpex",       R8A779F0_CLK_CPEX,      CLK_EXTAL,      2, 1),
> +
> +       DEF_GEN4_SD("sd0",      R8A779F0_CLK_SD0,       CLK_SDSRC,      0x870),
> +       DEF_DIV6P1("mso",       R8A779F0_CLK_MSO,       CLK_PLL5_DIV4, 0x087C),

0x87c

> +
> +       DEF_GEN4_OSC("osc",     R8A779F0_CLK_OSC,       CLK_EXTAL,      8),
> +       DEF_GEN4_MDSEL("r",     R8A779F0_CLK_R, 29, CLK_EXTALR, 1, CLK_OCO, 1),
> +};
> +
> +static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
> +       DEF_MOD("scif0",        702,    R8A779F0_CLK_S0D12_PER),
> +       DEF_MOD("scif1",        703,    R8A779F0_CLK_S0D12_PER),
> +       DEF_MOD("scif3",        704,    R8A779F0_CLK_S0D12_PER),
> +       DEF_MOD("scif4",        705,    R8A779F0_CLK_S0D12_PER),
> +};
> +
> +/*
> + * CPG Clock Data
> + */
> +/*
> + *   MD         EXTAL          PLL1    PLL2    PLL3    PLL5    PLL6    OSC
> + * 14 13 (MHz)
> + * ----------------------------------------------------------------
> + * 0  0         16.66 / 1      x200    x150    x200    x200    x134    /15

EXTAL is 16 MHz?

> + * 0  1         20    / 1      x160    x120    x160    x160    x106    /19
> + * 1  0         Prohibited setting
> + * 1  1         40    / 2      x160    x120    x160    x160    x106    /38
> + */
> +#define CPG_PLL_CONFIG_INDEX(md)       ((((md) & BIT(14)) >> 13) | \
> +                                        (((md) & BIT(13)) >> 13))
> +
> +static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] = {
> +       /* EXTAL div    PLL1 mult/div   PLL2 mult/div   PLL3 mult/div   PLL5 mult/div   PLL6 mult/div   OSC prediv */
> +       { 1,            200,    1,      150,    1,      200,    1,      200,    1,      134,    1,      16,     },

OSC prediv is 15?

> +       { 1,            160,    1,      120,    1,      160,    1,      160,    1,      106,    1,      19,     },
> +       { 0,            0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      },
> +       { 2,            160,    1,      120,    1,      160,    1,      160,    1,      106,    1,      38,     },
> +};

> --- /dev/null
> +++ b/drivers/clk/renesas/rcar-gen4-cpg.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * R-Car Gen4 Clock Pulse Generator
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + *
> + * Based on rcar-gen3-cpg.c
> + *
> + * Copyright (C) 2015-2018 Glider bvba
> + * Copyright (C) 2019 Renesas Electronics Corp.
> + */
> +
> +#include <linux/bug.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/sys_soc.h>

Several of these includes are not needed.

> +
> +#include "renesas-cpg-mssr.h"
> +#include "rcar-gen4-cpg.h"
> +#include "rcar-cpg-lib.h"
> +
> +static const struct clk_div_table cpg_rpcsrc_div_table[] = {
> +       { 2, 5 }, { 3, 6 }, { 0, 0 },

The datasheet says { 0, 4 } and { 1, 6} are also supported,
just like on R-Car V3U.

> +};

> +struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
> +       const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
> +       struct clk **clks, void __iomem *base,
> +       struct raw_notifier_head *notifiers)
> +{
> +       const struct clk *parent;
> +       unsigned int mult = 1;
> +       unsigned int div = 1;
> +
> +       parent = clks[core->parent & 0xffff];   /* some types use high bits */
> +       if (IS_ERR(parent))
> +               return ERR_CAST(parent);
> +
> +       switch (core->type) {
> +       case CLK_TYPE_GEN4_MAIN:
> +               div = cpg_pll_config->extal_div;
> +               break;
> +
> +       case CLK_TYPE_GEN4_PLL1:
> +               mult = cpg_pll_config->pll1_mult;
> +               div = cpg_pll_config->pll1_div;
> +               break;
> +
> +       case CLK_TYPE_GEN4_PLL2:
> +               mult = cpg_pll_config->pll2_mult;
> +               div = cpg_pll_config->pll2_div;
> +               break;
> +
> +       case CLK_TYPE_GEN4_PLL3:
> +               mult = cpg_pll_config->pll3_mult;
> +               div = cpg_pll_config->pll3_div;
> +               break;
> +
> +       case CLK_TYPE_GEN4_PLL5:
> +               mult = cpg_pll_config->pll5_mult;
> +               div = cpg_pll_config->pll5_div;
> +               break;
> +
> +       case CLK_TYPE_GEN4_PLL6:
> +               mult = cpg_pll_config->pll6_mult;
> +               div = cpg_pll_config->pll6_div;
> +               break;

The Z clock handling for R-Car S4-8 seems to be the same as for R-Car
V3U, so you can move that here, too.

That leaves us with the different PLLn handling:
  1. I think you can just move the PLL2X_3C clock type for R-Car
     V3U here, too. It's only 4 lines of code. Then rcar-gen4-cpg.c
     can be shared by R-Car V3U and R-Car S4-8.
  2. Future full PLLn handling for R-Car S4-8 (using the PLLnCR1
     registers) will need switching from CLK_TYPE_GEN4_PLLn to a
     new clock type anyway.

> +       case CLK_TYPE_GEN4_SD:
> +               return cpg_sd_clk_register(core->name, base, core->offset,
> +                                          __clk_get_name(parent), notifiers,
> +                                          0);

This should be changed to:

   return cpg_sd_clk_register(core->name, base + core->offset,
                               __clk_get_name(parent));

due to the recent changes in renesas-clk to handle the SDH clock.

> +
> +       default:
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       return clk_register_fixed_factor(NULL, core->name,
> +                                        __clk_get_name(parent), 0, mult, div);
> +}

> --- /dev/null
> +++ b/drivers/clk/renesas/rcar-gen4-cpg.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * R-Car Gen4 Clock Pulse Generator
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __CLK_RENESAS_RCAR_GEN4_CPG_H__
> +#define __CLK_RENESAS_RCAR_GEN4_CPG_H__
> +
> +enum rcar_gen4_clk_types {
> +       CLK_TYPE_GEN4_MAIN = CLK_TYPE_CUSTOM,
> +       CLK_TYPE_GEN4_PLL1,
> +       CLK_TYPE_GEN4_PLL2,
> +       CLK_TYPE_GEN4_PLL3,
> +       CLK_TYPE_GEN4_PLL5,
> +       CLK_TYPE_GEN4_PLL6,
> +       CLK_TYPE_GEN4_SD,
> +       CLK_TYPE_GEN4_R,

So far unused.

> +       CLK_TYPE_GEN4_MDSEL,    /* Select parent/divider using mode pin */
> +       CLK_TYPE_GEN4_Z,
> +       CLK_TYPE_GEN4_ZG,

Both unused.

> +       CLK_TYPE_GEN4_OSC,      /* OSC EXTAL predivider and fixed divider */
> +       CLK_TYPE_GEN4_RPCSRC,
> +       CLK_TYPE_GEN4_RPC,
> +       CLK_TYPE_GEN4_RPCD2,
> +
> +       /* SoC specific definitions start here */
> +       CLK_TYPE_GEN4_SOC_BASE,
> +};
> +
> +#define DEF_GEN4_SD(_name, _id, _parent, _offset)      \
> +       DEF_BASE(_name, _id, CLK_TYPE_GEN4_SD, _parent, .offset = _offset)
> +
> +#define DEF_GEN4_MDSEL(_name, _id, _md, _parent0, _div0, _parent1, _div1) \
> +       DEF_BASE(_name, _id, CLK_TYPE_GEN4_MDSEL,       \
> +                (_parent0) << 16 | (_parent1),         \
> +                .div = (_div0) << 16 | (_div1), .offset = _md)
> +
> +#define DEF_GEN4_PE(_name, _id, _parent_clean, _div_clean, _parent_sscg, \
> +                   _div_sscg) \
> +       DEF_GEN4_MDSEL(_name, _id, 12, _parent_clean, _div_clean,       \
> +                      _parent_sscg, _div_sscg)

R-Car S4 does not have a PE clock, so please drop this.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
