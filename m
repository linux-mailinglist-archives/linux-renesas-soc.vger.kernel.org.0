Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22FB261F7B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 22:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730438AbgIHUDy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 16:03:54 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35797 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730383AbgIHPXx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 11:23:53 -0400
Received: by mail-ot1-f68.google.com with SMTP id o6so3891363ota.2;
        Tue, 08 Sep 2020 08:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uC1cvCJ+pM8qUK4hL/kUkIxefBBuCEw0YKcBPMkPoNs=;
        b=nm1n3UUoLD2d1RxEPgr2SF/LQURIJbsGnRd9RaLZI6+2HlzwnLyP6GODtHHNxVOEp6
         RFdhp83sH4L+rlu9KLzRey8tIOL1ThBhyJE2fC0UKU8flBBfkvPb5VwG57eZTKtqGWxI
         eezXhLW2SaNXUI6QbWKmPdK7TqS9kbb52JLLtL/uaG1k/lP1acC/KpBHkDlAKs0r2cBD
         S+0R4sYKo6Pw3/4M4uGHMlJgZN2Rrd993u+HhSxWMCZueQilY0oFL0ConaQldwGEidlJ
         0kigLO3uI/au8GaaNzPKfDP7fVDKwvhlDnjEaq+yylK2Y1bZGXSEHXQdk7iyVYJp0JWP
         k1fQ==
X-Gm-Message-State: AOAM531Qc+mosKpo5j1xUAzH3WzB81cKJNBkrkiTbsVOmmM/4vHHcNE+
        WQy1+LtLZwXaSkYU6qfOsDXN1PFVZ01JIc/6BTE=
X-Google-Smtp-Source: ABdhPJyPPGW0IzuS/Wm/kMVmODouySmAnsJKnB7nJzzjuvj1pfqgr/fDisARVogwffCk3gTff7BG39o/agwqNh/c65w=
X-Received: by 2002:a9d:162:: with SMTP id 89mr18697915otu.250.1599578543512;
 Tue, 08 Sep 2020 08:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 17:22:11 +0200
Message-ID: <CAMuHMdVAgN69p9FFnQdO4iHk2CHkeNaVui2Q-FOY6_BFVjQ-Nw@mail.gmail.com>
Subject: Re: [PATCH 12/14] clk: renesas: cpg-mssr: Add support for R-Car V3U
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch!

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Initial support for R-Car V3U (r8a779a0), including core, module
> clocks and register access, because register specification differs
> than R-Car Gen2/3.

differs from

> Inspired by patches in the BSP by LUU HOAI.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -30,6 +30,7 @@ config CLK_RENESAS
>         select CLK_R8A77980 if ARCH_R8A77980
>         select CLK_R8A77990 if ARCH_R8A77990
>         select CLK_R8A77995 if ARCH_R8A77995
> +       select CLK_R8A779A0 if ARCH_R8A779A0
>         select CLK_R9A06G032 if ARCH_R9A06G032
>         select CLK_SH73A0 if ARCH_SH73A0
>
> @@ -145,6 +146,9 @@ config CLK_R8A77995
>         bool "R-Car D3 clock support" if COMPILE_TEST
>         select CLK_RCAR_GEN3_CPG
>
> +config CLK_R8A779A0
> +       bool "R-Car V3U clock support" if COMPILE_TEST

Missing "select CLK_RENESAS_CPG_MSSR"

> +
>  config CLK_R9A06G032
>         bool "Renesas R9A06G032 clock driver"
>         help

> --- /dev/null
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -0,0 +1,479 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * r8a779a0 Clock Pulse Generator / Module Standby and Software Reset
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + *
> + * Based on r8a7795-cpg-mssr.c
> + *
> + * Copyright (C) 2015 Glider bvba
> + * Copyright (C) 2015 Renesas Electronics Corp.
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
> +#include <linux/kernel.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/soc/renesas/rcar-rst.h>
> +#include <linux/sys_soc.h>

This include is not needed.

> +
> +#include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
> +
> +#include "renesas-cpg-mssr.h"
> +
> +enum rcar_r8a779a0_clk_types {
> +       CLK_TYPE_R8A779A0_MAIN = CLK_TYPE_CUSTOM,
> +       CLK_TYPE_R8A779A0_PLL1,
> +       CLK_TYPE_R8A779A0_PLL20,
> +       CLK_TYPE_R8A779A0_PLL21,
> +       CLK_TYPE_R8A779A0_PLL30,
> +       CLK_TYPE_R8A779A0_PLL31,
> +       CLK_TYPE_R8A779A0_PLL5,
> +       CLK_TYPE_R8A779A0_MDSEL,        /* Select parent/divider using mode pin */
> +       CLK_TYPE_R8A779A0_Z,
> +       CLK_TYPE_R8A779A0_OSC,  /* OSC EXTAL predivider and fixed divider */
> +
> +       /* SoC specific definitions start here */
> +       CLK_TYPE_R8A779A0_SOC_BASE,

This last definition is not needed.

> +};
> +
> +#define DEF_R8A779A0_MDSEL(_name, _id, _md, _parent0, _div0, _parent1, _div1) \
> +       DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_MDSEL,   \
> +                (_parent0) << 16 | (_parent1),         \
> +                .div = (_div0) << 16 | (_div1), .offset = _md)
> +
> +#define DEF_R8A779A0_OSC(_name, _id, _parent, _div)            \
> +       DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_OSC, _parent, .div = _div)

Perhaps you can just include "rcar-gen3-cpg.h", so you can use the
DEF_GEN3_MDSEL() and DEF_GEN3_OSC() definitions now (and probably
DEF_GEN3_SD later)?


> +
> +struct rcar_r8a779a0_cpg_pll_config {
> +       u8 extal_div;
> +       u8 pll1_mult;
> +       u8 pll1_div;
> +       u8 pll5_mult;
> +       u8 pll5_div;
> +       u8 osc_prediv;
> +};
> +
> +enum clk_ids {
> +       /* Core Clock Outputs exported to DT */
> +       LAST_DT_CORE_CLK = R8A779A0_CLK_OSCCLK,
> +
> +       /* External Input Clocks */
> +       CLK_EXTAL,
> +       CLK_EXTALR,
> +
> +       /* Internal Core Clocks */
> +       CLK_MAIN,
> +       CLK_PLL1,
> +       CLK_PLL20,
> +       CLK_PLL21,
> +       CLK_PLL30,
> +       CLK_PLL31,
> +       CLK_PLL5,
> +       CLK_PLL1_DIV2,
> +       CLK_PLL20_DIV2,
> +       CLK_PLL21_DIV2,
> +       CLK_PLL30_DIV2,
> +       CLK_PLL31_DIV2,
> +       CLK_PLL5_DIV2,
> +       CLK_PLL5_DIV4,
> +       CLK_S1,
> +       CLK_S2,
> +       CLK_S3,
> +       CLK_SDSRC,
> +       CLK_RPCSRC,
> +       CLK_OCO,
> +
> +       /* Module Clocks */
> +       MOD_CLK_BASE
> +};
> +
> +static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
> +       /* External Clock Inputs */
> +       DEF_INPUT("extal",  CLK_EXTAL),
> +       DEF_INPUT("extalr", CLK_EXTALR),
> +
> +       /* Internal Core Clocks */
> +       DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_R8A779A0_MAIN, CLK_EXTAL),
> +       DEF_BASE(".pll1",       CLK_PLL1, CLK_TYPE_R8A779A0_PLL1, CLK_MAIN),
> +       DEF_BASE(".pll20",      CLK_PLL20, CLK_TYPE_R8A779A0_PLL20, CLK_MAIN),
> +       DEF_BASE(".pll21",      CLK_PLL21, CLK_TYPE_R8A779A0_PLL21, CLK_MAIN),
> +       DEF_BASE(".pll30",      CLK_PLL30, CLK_TYPE_R8A779A0_PLL30, CLK_MAIN),
> +       DEF_BASE(".pll31",      CLK_PLL31, CLK_TYPE_R8A779A0_PLL31, CLK_MAIN),
> +       DEF_BASE(".pll5",       CLK_PLL5, CLK_TYPE_R8A779A0_PLL5, CLK_MAIN),
> +
> +       DEF_FIXED(".pll1_div2",  CLK_PLL1_DIV2,    CLK_PLL1,   2, 1),
> +       DEF_FIXED(".pll20_div2", CLK_PLL20_DIV2,   CLK_PLL20,  2, 1),
> +       DEF_FIXED(".pll21_div2", CLK_PLL21_DIV2,   CLK_PLL21,  2, 1),
> +       DEF_FIXED(".pll30_div2", CLK_PLL30_DIV2,   CLK_PLL30,  2, 1),
> +       DEF_FIXED(".pll31_div2", CLK_PLL31_DIV2,   CLK_PLL31,  2, 1),
> +       DEF_FIXED(".pll5_div2",  CLK_PLL5_DIV2,    CLK_PLL5,   2, 1),

Please align the values in the last column.

> +       DEF_FIXED(".pll5_div4",  CLK_PLL5_DIV4,    CLK_PLL5_DIV2,   2, 1),
> +       DEF_FIXED(".s1",        CLK_S1,            CLK_PLL1_DIV2,   2, 1),
> +       DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,   133, 50),

div = 8, mul = 3 sounds more likely.
Or perhaps S2 is derived from PLL5, which runs at a multiple of 400 MHz?
Or perhaps S2 does not exist...

> +       DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,   4, 1),
> +       DEF_RATE(".oco",        CLK_OCO,           32768),
> +
> +       /* Core Clock Outputs */
> +       DEF_FIXED("zx",         R8A779A0_CLK_ZX,     CLK_PLL20_DIV2,  2, 1),
> +       DEF_FIXED("s1d1",       R8A779A0_CLK_S1D1,   CLK_S1, 1, 1),
> +       DEF_FIXED("s1d2",       R8A779A0_CLK_S1D2,   CLK_S1, 2, 1),
> +       DEF_FIXED("s1d4",       R8A779A0_CLK_S1D4,   CLK_S1, 4, 1),
> +       DEF_FIXED("s1d8",       R8A779A0_CLK_S1D8,   CLK_S1, 8, 1),
> +       DEF_FIXED("s1d12",      R8A779A0_CLK_S1D12,  CLK_S1, 12, 1),
> +       DEF_FIXED("s2d1",       R8A779A0_CLK_S2D1,   CLK_S2, 1, 1),
> +       DEF_FIXED("s2d2",       R8A779A0_CLK_S2D2,   CLK_S2, 2, 1),
> +       DEF_FIXED("s2d4",       R8A779A0_CLK_S2D4,   CLK_S2, 4, 1),
> +       DEF_FIXED("s3d1",       R8A779A0_CLK_S3D1,   CLK_S3, 1, 1),
> +       DEF_FIXED("s3d2",       R8A779A0_CLK_S3D2,   CLK_S3, 2, 1),
> +       DEF_FIXED("s3d4",       R8A779A0_CLK_S3D4,   CLK_S3, 4, 1),

Please align the values in the last column.

> +       DEF_FIXED("zs",         R8A779A0_CLK_ZS,     CLK_PLL1_DIV2,   4, 1),
> +       DEF_FIXED("zt",         R8A779A0_CLK_ZT,     CLK_PLL1_DIV2,   2, 1),
> +       DEF_FIXED("ztr",        R8A779A0_CLK_ZTR,    CLK_PLL1_DIV2,   2, 1),
> +       DEF_FIXED("zr",         R8A779A0_CLK_ZR,     CLK_PLL1_DIV2,   1, 1),

ZR = PLL6 / 4.
Is PLL6 the same as PLL1, they always run at the same rate?
There don't seem to be any registers documented to control PLL6VCO.

> +       DEF_FIXED("dsi",        R8A779A0_CLK_DSI,    CLK_PLL5_DIV4,   1, 1),
> +       DEF_FIXED("cnndsp",     R8A779A0_CLK_CNNDSP, CLK_PLL5_DIV4,   1, 1),
> +       DEF_FIXED("vip",        R8A779A0_CLK_VIP,    CLK_PLL5,        5, 1),
> +       DEF_FIXED("adgh",       R8A779A0_CLK_ADGH,   CLK_PLL5_DIV4,   1, 1),
> +       DEF_FIXED("icu",        R8A779A0_CLK_ICU,    CLK_PLL5_DIV4,   2, 1),
> +       DEF_FIXED("icud2",      R8A779A0_CLK_ICUD2,  CLK_PLL5_DIV4,   4, 1),
> +       DEF_FIXED("vcbus",      R8A779A0_CLK_VCBUS,  CLK_PLL5_DIV4,   1, 1),
> +
> +       DEF_FIXED("cbfusa",     R8A779A0_CLK_CBFUSA, CLK_MAIN,   2, 1),
> +
> +       DEF_DIV6P1("mso",       R8A779A0_CLK_MSO,    CLK_PLL5_DIV4, 0x87c),
> +       DEF_DIV6P1("canfd",     R8A779A0_CLK_CANFD,  CLK_PLL5_DIV4, 0x878),
> +       DEF_DIV6P1("csi0",      R8A779A0_CLK_CSI0,   CLK_PLL5_DIV4, 0x880),
> +       DEF_DIV6P1("fray",      R8A779A0_CLK_FRAY,   CLK_PLL5_DIV4, 0x88c),

The FRAY register doesn't seem to be documented?

> +       DEF_DIV6P1("post",      R8A779A0_CLK_POST,   CLK_PLL5_DIV4, 0x890),
> +       DEF_DIV6P1("post2",     R8A779A0_CLK_POST2,  CLK_PLL5_DIV4, 0x894),
> +       DEF_DIV6P1("post3",     R8A779A0_CLK_POST3,  CLK_PLL5_DIV4, 0x898),
> +
> +       DEF_R8A779A0_OSC("osc", R8A779A0_CLK_OSCCLK, CLK_EXTAL,     8),
> +       DEF_R8A779A0_MDSEL("r", R8A779A0_CLK_RCLK, 29, CLK_EXTALR, 1, CLK_OCO, 1),
> +};
> +
> +static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
> +       DEF_MOD("scif0",        702,    R8A779A0_CLK_S1D8),
> +       DEF_MOD("scif1",        703,    R8A779A0_CLK_S1D8),
> +       DEF_MOD("scif3",        704,    R8A779A0_CLK_S1D8),
> +       DEF_MOD("scif4",        705,    R8A779A0_CLK_S1D8),
> +};
> +
> +static const unsigned int r8a779a0_crit_mod_clks[] __initconst = {
> +       MOD_CLK_ID(408),        /* INTC-AP (GIC) */

There's no entry for this clock in r8a779a0_mod_clks[] above, so please
drop this.
Also, the INTC-AP clock is not documented, unfortunately.

> +};
> +
> +#define CPG_PLL20CR            0x0834
> +#define CPG_PLL21CR            0x0838
> +#define CPG_PLL30CR            0x083c
> +#define CPG_PLL31CR            0x0840
> +
> +static spinlock_t cpg_lock;
> +
> +static void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
> +{
> +       unsigned long flags;
> +       u32 val;
> +
> +       spin_lock_irqsave(&cpg_lock, flags);
> +       val = readl(reg);
> +       val &= ~clear;
> +       val |= set;
> +       writel(val, reg);
> +       spin_unlock_irqrestore(&cpg_lock, flags);
> +};
> +
> +/*
> + * Z Clock & Z2 Clock

All the Z clock code is currently unused.

> +struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
> +       const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
> +       struct clk **clks, void __iomem *base,
> +       struct raw_notifier_head *notifiers)
> +{

> +       case CLK_TYPE_R8A779A0_PLL20:
> +               value = readl(base + CPG_PLL20CR);
> +               mult = (((value >> 24) & 0x7f) + 1) * 2;
> +               break;
> +
> +       case CLK_TYPE_R8A779A0_PLL21:
> +               value = readl(base + CPG_PLL21CR);
> +               mult = (((value >> 24) & 0x7f) + 1) * 2;
> +               break;
> +
> +       case CLK_TYPE_R8A779A0_PLL30:
> +               value = readl(base + CPG_PLL30CR);
> +               mult = (((value >> 24) & 0x7f) + 1) * 2;
> +               break;
> +
> +       case CLK_TYPE_R8A779A0_PLL31:
> +               value = readl(base + CPG_PLL31CR);
> +               mult = (((value >> 24) & 0x7f) + 1) * 2;
> +               break;

Perhaps CLK_TYPE_R8A779A0_PLL[23][01] can share a common type, encoding
the register offset in cpg_core_clk.offset?

> +const struct cpg_mssr_info r8a779a0_cpg_mssr_info __initconst = {
> +       /* Core Clocks */
> +       .core_clks = r8a779a0_core_clks,
> +       .num_core_clks = ARRAY_SIZE(r8a779a0_core_clks),
> +       .last_dt_core_clk = LAST_DT_CORE_CLK,
> +       .num_total_core_clks = MOD_CLK_BASE,
> +
> +       /* Module Clocks */
> +       .mod_clks = r8a779a0_mod_clks,
> +       .num_mod_clks = ARRAY_SIZE(r8a779a0_mod_clks),
> +       .num_hw_mod_clks = 12 * 32,

15 * 32

> +
> +       /* Critical Module Clocks */
> +       .crit_mod_clks = r8a779a0_crit_mod_clks,
> +       .num_crit_mod_clks = ARRAY_SIZE(r8a779a0_crit_mod_clks),
> +
> +       /* Callbacks */
> +       .init = r8a779a0_cpg_mssr_init,
> +       .cpg_clk_register = rcar_r8a779a0_cpg_clk_register,
> +
> +       /* The device has only MSTP Control Register */
> +       .mstpctrl = true,
> +};
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> index 5a306d2..c259e05 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -57,8 +57,14 @@ static const u16 mstpsr[] = {
>         0x9A0, 0x9A4, 0x9A8, 0x9AC,
>  };
>
> -#define        MSTPSR(i)       mstpsr[i]
> +static const u16 mstpsr_mstpcr_only[] = {
> +       0x2E00, 0x2E04, 0x2E08, 0x2E0C, 0x2E10, 0x2E14, 0x2E18, 0x2E1C,
> +       0x2E20, 0x2E24, 0x2E28, 0x2E2C, 0x2E30, 0x2E34, 0x2E38,
> +};
> +
> +static bool mstpcr_only;
>
> +#define        MSTPSR(i)       (mstpcr_only ? mstpsr_mstpcr_only[i] : mstpsr[i])

IMHO, ugly macro handling...

>
>  /*
>   * System Module Stop Control Register offsets
> @@ -69,7 +75,8 @@ static const u16 smstpcr[] = {
>         0x990, 0x994, 0x998, 0x99C,
>  };
>
> -#define        SMSTPCR(i)      smstpcr[i]
> +#define        SMSTPCR(i)      (mstpcr_only ? (mstpsr_mstpcr_only[i] - 0x100) : \
> +                        smstpcr[i])

.. more ugly macro handling.
Still, it doesn't handle the Software Reset and Clearing registers.

> @@ -140,7 +147,7 @@ struct cpg_mssr_priv {
>         struct {
>                 u32 mask;
>                 u32 val;
> -       } smstpcr_saved[ARRAY_SIZE(smstpcr)];
> +       } smstpcr_saved[ARRAY_SIZE(mstpsr_mstpcr_only)];

Basically the maximum number of registers to save.

> @@ -938,6 +951,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
>         priv->last_dt_core_clk = info->last_dt_core_clk;
>         RAW_INIT_NOTIFIER_HEAD(&priv->notifiers);
>         priv->stbyctrl = info->stbyctrl;
> +       mstpcr_only = info->mstpctrl;
>
>         for (i = 0; i < nclks; i++)
>                 priv->clks[i] = ERR_PTR(-ENOENT);
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
> index 1cc5694..061eb83 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.h
> @@ -131,6 +131,7 @@ struct cpg_mssr_info {
>         unsigned int last_dt_core_clk;
>         unsigned int num_total_core_clks;
>         bool stbyctrl;
> +       bool mstpctrl;

Personally, I don't like adding a second boolean flag, to be checked in
multiple places, hidden inside macros.

I think this can be handled better by defining multiple registers layout
variants using an enum, for
  1. R-Car Gen2/3-style register layouts,
  2. RZ/A-style register layouts,
  3. R-Car V3U-style register layout.
Then register tables pointers can be set up based on the enum value, and
code can check the enum value where needed.

Note that layout 1 can also be used for SH/R-Mobile, and we could easily
add a 4th layout for R-Car Gen1, if we ever migrate SH/R-Mobile and/or
R-Car Gen1 to CPG/MSSR.

What do you think?

>
>         /* Module Clocks */
>         const struct mssr_mod_clk *mod_clks;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
