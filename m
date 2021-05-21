Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667BA38C9B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 17:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237194AbhEUPEc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 11:04:32 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:35520 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbhEUPEa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 11:04:30 -0400
Received: by mail-vk1-f180.google.com with SMTP id n7so4342089vkl.2;
        Fri, 21 May 2021 08:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AsUpcAbE1LpfPJXhSpy6toR3kQg1h9PRIuDeSpPtK44=;
        b=Vi4fkyJaslBsIYypGgK49b1SjhogmXYmWtFlCP5qaWssUfYhO5EpUzynXBejzNv3Bc
         Ri3eyYCOeltzDpD0nfCrAsHrZ5yQEFQ8uQMq2pnwvu5B0LDOWmY9MCnYiI036Vdyj0iP
         Sn2hKmgGkthcEBkBG0CpRGbxM1a5FVrIsWvUWZvVrIRYXwB2VNjEVGvxpjXxayYGUGMK
         Q7AFk6IaZy72n5BqZXgPbRoOkARCpZN61nLxUQppS2cweF8bBvlnI0yang3IfQRiU5Bm
         kK3kuEUJAtrgWIZq0Vq2qor+var98elDnmog+tXJTmOQXdAxUSUlgohcUBVcNGBkXfXt
         5UBA==
X-Gm-Message-State: AOAM533J+pvLuquufDrmZgLCvJfDiFDCks0RP4bh9m1XNgdMVZ60jFdq
        1dwBVaMF/+xK92JdM3horKsbKABCyXg9HkzCHGw=
X-Google-Smtp-Source: ABdhPJzHUXw5QJ3bzwByG6ggvWnoL2grdUvySxz1UzElw8NLOh0sqfV80msXTw9qoeAknqWtZmPSb7DHiFFqynxh2oM=
X-Received: by 2002:a1f:d8c3:: with SMTP id p186mr10223104vkg.1.1621609383515;
 Fri, 21 May 2021 08:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 17:02:51 +0200
Message-ID: <CAMuHMdWApLaGCcD_hpCz-+MhuXAyMx+bhHCWvHq81R+5JxsGFw@mail.gmail.com>
Subject: Re: [PATCH 13/16] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, May 14, 2021 at 9:24 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add CPG core wrapper for RZ/G2L family.
>
> Based on a patch in the BSP by Binh Nguyen
> <binh.nguyen.jz@renesas.com>.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -34,6 +34,10 @@ config CLK_RENESAS
>         select CLK_R9A06G032 if ARCH_R9A06G032
>         select CLK_SH73A0 if ARCH_SH73A0
>
> +config CLK_RENESAS_RZG2L
> +       bool "Renesas RZ/G2L SoC clock support" if COMPILE_TEST && !ARCH_RENESAS
> +       default y if ARCH_RENESAS

Why do you need this symbol here, and why does it default to y?

I guess the plan is to share this by the RZ/G2L(C) and RZ/G2UL clock
drivers, so probably you want to move it to the family-specific
section below, like CLK_RCAR_GEN3_CPG.

> +
>  if CLK_RENESAS
>
>  # SoC
> diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
> index ef0d2bba92bf..e4f3d7fab67c 100644
> --- a/drivers/clk/renesas/Makefile
> +++ b/drivers/clk/renesas/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_CLK_RCAR_CPG_LIB)                += rcar-cpg-lib.o
>  obj-$(CONFIG_CLK_RCAR_GEN2_CPG)                += rcar-gen2-cpg.o
>  obj-$(CONFIG_CLK_RCAR_GEN3_CPG)                += rcar-gen3-cpg.o
>  obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)  += rcar-usb2-clock-sel.o
> +obj-$(CONFIG_CLK_RENESAS_RZG2L)                += renesas-rzg2l-cpg.o

As CLK_RENESAS_RZG2L defaults to y, this is compiled by
default on ARCH_RENESAS.

>
>  # Generic
>  obj-$(CONFIG_CLK_RENESAS_CPG_MSSR)     += renesas-cpg-mssr.o
> diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
> new file mode 100644
> index 000000000000..dc54ffc6114c
> --- /dev/null
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
> @@ -0,0 +1,958 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G2L Clock Pulse Generator
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + *
> + * Based on renesas-cpg-mssr.c
> + *
> + * Copyright (C) 2015 Glider bvba
> + * Copyright (C) 2013 Ideas On Board SPRL
> + * Copyright (C) 2015 Renesas Electronics Corp.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clk/renesas.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_domain.h>
> +#include <linux/psci.h>

Unused

> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +#include "renesas-rzg2l-cpg.h"
> +
> +#ifdef DEBUG
> +#define WARN_DEBUG(x)  WARN_ON(x)
> +#else
> +#define WARN_DEBUG(x)  do { } while (0)
> +#endif
> +
> +#define DIV_RSMASK(v, s, m)    ((v >> s) & m)
> +#define GET_REG(val)           ((val >> 20) & 0xfff)
> +#define GET_SHIFT(val)         ((val >> 12) & 0xff)
> +#define GET_WIDTH(val)         ((val >> 8) & 0xf)
> +
> +#define KDIV(val)              DIV_RSMASK(val, 16, 0xffff)
> +#define MDIV(val)              DIV_RSMASK(val, 6, 0x3ff)
> +#define PDIV(val)              DIV_RSMASK(val, 0, 0x3f)
> +#define SDIV(val)              DIV_RSMASK(val, 0, 0x7)
> +#define REFDIV(val)            DIV_RSMASK(val, 8, 0x3f)
> +#define POSTDIV1(val)          DIV_RSMASK(val, 0, 0x7)
> +#define POSTDIV2(val)          DIV_RSMASK(val, 4, 0x7)
> +#define FRACIN(val)            DIV_RSMASK(val, 8, 0xffffff)
> +#define INITIN(val)            DIV_RSMASK(val, 16, 0xfff)
> +
> +/**
> + * Clock Pulse Generator Private Data

struct cpg_mssr_priv - Clock Pulse Generator Private Data

> + *
> + * @rcdev: Optional reset controller entity
> + * @dev: CPG/MSSR device

CPG?

> + * @base: CPG/MSSR register block base address

CPG?

> + * @rmw_lock: protects RMW register accesses
> + * @clks: Array containing all Core and Module Clocks
> + * @num_core_clks: Number of Core Clocks in clks[]
> + * @num_mod_clks: Number of Module Clocks in clks[]
> + * @last_dt_core_clk: ID of the last Core Clock exported to DT
> + * @notifiers: Notifier chain to save/restore clock state for system resume
> + * @info: Pointer to platform data
> + */
> +struct cpg_mssr_priv {

rzg2l_cpg_priv?

> +#ifdef CONFIG_RESET_CONTROLLER
> +       struct reset_controller_dev rcdev;
> +#endif
> +       struct device *dev;
> +       void __iomem *base;
> +       spinlock_t rmw_lock;
> +
> +       struct clk **clks;
> +       unsigned int num_core_clks;
> +       unsigned int num_mod_clks;
> +       unsigned int last_dt_core_clk;
> +
> +       struct raw_notifier_head notifiers;
> +       const struct cpg_mssr_info *info;
> +};


> +struct div2_clk {
> +       struct clk_hw hw;
> +       unsigned int conf;
> +       const struct clk_div_table *dtable;
> +       unsigned int confs;
> +       const struct clk_div_table *dtables;

Please don't interleave pointers and integers on a 64-bit platform,
as it requires padding to keep the pointers naturally aligned.
Same for struct pll_clk below.

> +       void __iomem *base;
> +       struct cpg_mssr_priv *priv;
> +};
> +
> +#define to_d2clk(_hw)  container_of(_hw, struct div2_clk, hw)
> +
> +static unsigned int div2_clock_get_div(unsigned int val,
> +                                      const struct clk_div_table *t,
> +                                      int length)

unsigned int

> +{
> +       int i;

unsigned int (for all positive loop counters)

> +
> +       for (i = 0; i <= length; i++)
> +               if (val == t[i].val)
> +                       return t[i].div;
> +
> +       /* return div=1 if failed */
> +       return 1;
> +}

> +static long rzg2l_cpg_div2_clk_round_rate(struct clk_hw *hw,
> +                                         unsigned long rate,
> +                                         unsigned long *parent_rate)

Please implement .determine_rate() instead of .round_rate() in new
drivers.

> +{
> +       unsigned long best_diff = (unsigned long)-1;
> +       unsigned int best_div, best_divs, div, divs;
> +       struct div2_clk *d2clk = to_d2clk(hw);
> +       unsigned long diff;
> +       int i, j, n, ns;
> +
> +       n = BIT(GET_WIDTH(d2clk->conf)) - 1;
> +       ns = BIT(GET_WIDTH(d2clk->confs)) - 1;
> +       for (i = 0; i <= n; i++) {
> +               for (j = 0; j <= ns; j++) {
> +                       div = div2_clock_get_div(i, d2clk->dtable, n);
> +                       divs = div2_clock_get_div(j, d2clk->dtables, ns);
> +                       diff = abs(*parent_rate - (rate * div * divs));
> +                       if (best_diff > diff) {
> +                               best_diff = diff;
> +                               best_div = div;
> +                               best_divs = divs;
> +                       }
> +               }
> +       }
> +
> +       return DIV_ROUND_CLOSEST_ULL((u64)*parent_rate, best_div * best_divs);
> +}

> +/**
> + * struct mstp_clock - MSTP gating clock
> + * @hw: handle between common and hardware-specific interfaces
> + * @bit: 16bits register offset, 8bits ON/MON, 8bits RESET
> + * @priv: CPG/MSSR private data
> + */
> +struct mstp_clock {
> +       struct clk_hw hw;
> +       u32 bit;

I think the code accessing this field can be simplified by not packing
everything into a 32-bit value:

    u16 off;
    u8 onoff;
    u8 reset;

> +       struct cpg_mssr_priv *priv;
> +};

> diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.h b/drivers/clk/renesas/renesas-rzg2l-cpg.h
> new file mode 100644
> index 000000000000..8dce6b5546b1
> --- /dev/null
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h
> @@ -0,0 +1,221 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RZ/G2L Clock Pulse Generator
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __RENESAS_RZG2L_CPG_H__
> +#define __RENESAS_RZG2L_CPG_H__
> +
> +/* Register offset */
> +/* n : 0, 1, 2 : PLL1, PLL4, PLL6 */
> +#define PLL146_CLK1_R(n)       (0x04 + (16 * n))
> +#define PLL146_CLK2_R(n)       (0x08 + (16 * n))
> +#define PLL146_MON_R(n)                (0x0C + (16 * n))
> +#define PLL146_STBY_R(n)       (0x00 + (16 * n))
> +
> +/* n : 0, 1, 2 : PLL2, PLL3, PLL5 */
> +#define PLL235_CLK1_R(n)       (0x104 + (32 * n))
> +#define PLL235_CLK3_R(n)       (0x10c + (32 * n))
> +#define PLL235_CLK4_R(n)       (0x110 + (32 * n))
> +#define PLL235_MON_R(n)                (0x11C + (32 * n))
> +#define PLL235_STBY_R(n)       (0x100 + (32 * n))
> +
> +#define PLL1_DIV_R             (0x200)
> +#define PLL2_DIV_R             (0x204)
> +#define PLL3A_DIV_R            (0x208)
> +#define PLL3B_DIV_R            (0x20c)
> +#define PLL6_DIV_R             (0x210)
> +#define PL2SDHI_SEL_R          (0x218)
> +#define CLK_STATUS_R           (0x280)
> +#define CA55_SSEL_R            (0x400)
> +#define PL2_SSEL_R             (0x404)
> +#define PL3_SSEL_R             (0x408)
> +#define PL4_DSEL_R             (0x21C)
> +#define PL5_SSEL_R             (0x410)
> +#define PL6_SSEL_R             (0x414)
> +#define PL6_ETH_SSEL_R         (0x418)
> +#define PL5_SDIV_R             (0x420)
> +#define OTHERFUNC1_R           (0xBE8)
> +#define CLK_ON_R(reg)          (0x500 + reg)
> +#define CLK_MON_R(reg)         (0x680 + reg)
> +#define CLK_RST_R(reg)         (0x800 + reg)
> +#define CLK_MRST_R(reg)                (0x980 + reg)

The register offsets are only used by renesas-rzg2l-cpg.c, so they
can be moved there.

> +
> +#define SEL_PLL1       (CA55_SSEL_R << 20 | 0 << 12 | 1 << 8)
> +#define SEL_PLL2_1     (PL2_SSEL_R << 20 | 0 << 12 | 1 << 8)
> +#define SEL_PLL2_2     (PL2_SSEL_R << 20 | 4 << 12 | 1 << 8)
> +#define SEL_PLL3_1     (PL3_SSEL_R << 20 | 0 << 12 | 1 << 8)
> +#define SEL_PLL3_2     (PL3_SSEL_R << 20 | 4 << 12 | 1 << 8)
> +#define SEL_PLL3_3     (PL3_SSEL_R << 20 | 8 << 12 | 1 << 8)
> +#define SEL_PLL4       (PL4_DSEL_R << 20 | 8 << 12 | 1 << 8)
> +#define SEL_PLL5_1     (PL5_SSEL_R << 20 | 0 << 12 | 1 << 8)
> +#define SEL_PLL5_2     (PL5_SSEL_R << 20 | 4 << 12 | 1 << 8)
> +#define SEL_PLL5_3     (PL5_SSEL_R << 20 | 0 << 12 | 1 << 8)
> +#define SEL_PLL5_4     (OTHERFUNC1_R << 20 | 0 << 12 | 1 << 8)
> +#define SEL_PLL6_1     (PL6_SSEL_R << 20 | 0 << 12 | 1 << 8)
> +#define SEL_PLL6_2     (PL6_ETH_SSEL_R << 20 | 0 << 12 | 1 << 8)
> +#define SEL_ETH                (PL6_ETH_SSEL_R << 20 | 4 << 12 | 1 << 8)
> +#define SEL_G1_1       (PL6_SSEL_R << 20 | 4 << 12 | 1 << 8)
> +#define SEL_G1_2       (PL6_SSEL_R << 20 | 8 << 12 | 1 << 8)
> +#define SEL_G2         (PL6_SSEL_R << 20 | 12 << 12 | 1 << 8)
> +#define SEL_SDHI0      (PL2SDHI_SEL_R << 20 | 0 << 12 | 2 << 8)
> +#define SEL_SDHI1      (PL2SDHI_SEL_R << 20 | 4 << 12 | 2 << 8)
> +#define DIVPL1         (PLL1_DIV_R << 20 | 0 << 12 | 2 << 8)
> +#define DIVPL2A                (PLL2_DIV_R << 20 | 0 << 12 | 3 << 8)
> +#define DIVPL2B                (PLL2_DIV_R << 20 | 4 << 12 | 3 << 8)
> +#define DIVPL2C                (PLL2_DIV_R << 20 | 8 << 12 | 3 << 8)
> +#define DIVDSILPCL     (PLL2_DIV_R << 20 | 12 << 12 | 2 << 8)
> +#define DIVPL3A                (PLL3A_DIV_R << 20 | 0 << 12 | 3 << 8)
> +#define DIVPL3B                (PLL3A_DIV_R << 20 | 4 << 12 | 3 << 8)
> +#define DIVPL3C                (PLL3A_DIV_R << 20 | 8 << 12 | 3 << 8)
> +#define DIVPL3CLK200FIX        (PLL3B_DIV_R << 20 | 0 << 12 | 3 << 8)
> +#define DIVGPU         (PLL6_DIV_R << 20 | 0 << 12 | 2 << 8)
> +#define DIVDSIB                (PL5_SDIV_R << 20 | 8 << 12 | 4 << 8)
> +#define DIVDSIA                (PL5_SDIV_R << 20 | 0 << 12 | 2 << 8)
> +
> +#define PLL146_STBY(n) (PLL146_STBY_R(n) << 20 | 2 << 16 | 0 << 12)
> +#define PLL146_MON(n)  (PLL146_MON_R(n) << 20 | 4 << 16 | 0 << 12)
> +#define PLL235_STBY(n) (PLL235_STBY_R(n) << 20 | 2 << 16 | 0 << 12)
> +#define PLL235_MON(n)  (PLL235_MON_R(n) << 20 | 4 << 16 | 0 << 12)
> +
> +#define PLL146_CONF(n) (PLL146_CLK1_R(n) << 22 | PLL146_CLK2_R(n) << 12 | 0)
> +#define PLL235_CONF(n) (PLL235_CLK1_R(n) << 22 | PLL235_CLK3_R(n) << 12 | PLL235_CLK4_R(n))
> +
> +#define GET_REG1(val)  ((val >> 22) & 0x3ff)
> +#define GET_REG2(val)  ((val >> 12) & 0x3ff)
> +#define GET_REG3(val)  (val & 0x3ff)

The GET_REG() macros are only used by renesas-rzg2l-cpg.c.

> +
> +#define MSSR(off, on, res)     ((off & 0xffff) << 16 | \
> +                                (on & 0xff) << 8 | (res & 0xff))
> +#define MSSR_OFF(val)  ((val >> 16) & 0xffff)
> +#define MSSR_ON(val)   ((val >> 8) & 0xff)
> +#define MSSR_RES(val)  (val & 0xff)

Can be removed after mstp_clock.bit split.

> +/*
> + * Definitions of Module Clocks
> + * @name: handle between common and hardware-specific interfaces
> + * @id: clock index in array containing all Core and Module Clocks
> + * @parent: id of parent clock
> + * @bit: 16bits register offset, 8bits ON/MON, 8bits RESET
> + */
> +struct mssr_mod_clk {

rzg2l_mod_clk?

> +       const char *name;
> +       unsigned int id;
> +       unsigned int parent;
> +       unsigned int bit;

Same comment as for mstp_clock.bit.

> +};
> +
> +#define DEF_MOD(_name, _id, _parent, _bit)     \
> +       { .name = _name, .id = MOD_CLK_BASE + _id, .parent = _parent,\
> +       .bit = _bit }
> +
> +/**
> + * SoC-specific CPG/MSSR Description
> + *
> + * @core_clks: Array of Core Clock definitions
> + * @num_core_clks: Number of entries in core_clks[]
> + * @last_dt_core_clk: ID of the last Core Clock exported to DT
> + * @num_total_core_clks: Total number of Core Clocks (exported + internal)
> + *
> + * @pll_info: array of PLL register info
> + * @pll_info_size: Total number of PLL registers info
> + *
> + * @mod_clks: Array of Module Clock definitions
> + * @num_mod_clks: Number of entries in mod_clks[]
> + * @num_hw_mod_clks: Number of Module Clocks supported by the hardware
> + *
> + * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
> + *                 should not be disabled without a knowledgeable driver
> + * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
> + */
> +struct cpg_mssr_info {

rzg2l_cpg_info?

> +       /* Core Clocks */
> +       const struct cpg_core_clk *core_clks;
> +       unsigned int num_core_clks;
> +       unsigned int last_dt_core_clk;
> +       unsigned int num_total_core_clks;
> +
> +       /* Module Clocks */
> +       const struct mssr_mod_clk *mod_clks;
> +       unsigned int num_mod_clks;
> +       unsigned int num_hw_mod_clks;
> +
> +       /* Critical Module Clocks that should not be disabled */
> +       const unsigned int *crit_mod_clks;
> +       unsigned int num_crit_mod_clks;
> +};
> +
> +#endif

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
