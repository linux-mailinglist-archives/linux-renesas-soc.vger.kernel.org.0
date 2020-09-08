Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B972611E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 15:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbgIHNOn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 09:14:43 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34541 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729843AbgIHLUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 07:20:17 -0400
Received: by mail-ot1-f67.google.com with SMTP id h17so13723571otr.1;
        Tue, 08 Sep 2020 04:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RPqC3r9E/TZDrvd4WWg7D8OZwsoshvyMH2HsoPmhD2Q=;
        b=Aq4/XPS01LtnTI7Q5KUq3oHPDgwyvBECNYsU/cAkSKDkI7FpupKbNnRyx8KJYWLo4A
         g8A1dyUCVcxnbpTOZa+Fmdo7wkVSzITI1b/fAZUmoG6sUzJee1xbZ+4q5WRg1IFPhD4+
         HFwnPcUrJDAAJ50aLRoUb4kzmrYym9mjQm8H4fwjM5fcNvrfJ0kzmAUP58G+uQlRkM0Y
         wNFQpsRYdSGZCmZCMk58Ug6/y85iAflm3t1uUUoLs6SBjszjhqp8/TbI10NwnhSELcOP
         gmJe+JZweGf81/kzdKeayT/kSte/zpvLgTwFTM+9U8XKvG3s3qnljWGtDBX+hVgLMEST
         TFPQ==
X-Gm-Message-State: AOAM531kJow/HdL2HZrT2ePhGRm4JxS81BYs5sS8osT/SW1E2+6QdWBc
        YVsjAznf/yZsYfizN1r3L9H3Iws0ByhqMhTO+Zk=
X-Google-Smtp-Source: ABdhPJxOmzGxOLy3uf2VUgEOCtB6hpV6fkIGf0UgzLmhoHUPBZi+4iFlW4Rr5TXApOJ6rPkJfwyDYs6Wugidge+74oE=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr17159128otl.145.1599564015710;
 Tue, 08 Sep 2020 04:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 13:20:04 +0200
Message-ID: <CAMuHMdXi-nZ4XgxygdkRePJ60rGeUP4aA7Yds29z9cqWt+-KmA@mail.gmail.com>
Subject: Re: [PATCH 10/14] soc: renesas: r8a779a0-sysc: Add r8a779a0 support
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

 nHi Shimoda-san,

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for R-Car V3U (R8A779A0) SoC power areas and
> register access, because register specification differs
> than R-Car Gen2/3.
>
> Inspired by patches in the BSP by Tho Vu.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/soc/renesas/r8a779a0-sysc.c
> @@ -0,0 +1,460 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas R-Car V3U System Controller
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk/renesas.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +#include <linux/of_address.h>
> +#include <linux/pm_domain.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/io.h>
> +#include <linux/soc/renesas/rcar-sysc.h>
> +#include <linux/sys_soc.h>
> +#include <linux/syscore_ops.h>

The above 3 includes are not needed.

> +
> +#include <dt-bindings/power/r8a779a0-sysc.h>
> +
> +#include "rcar-sysc.h"

You don't reuse the rcar-sysc driver itself, but you do reuse its header
file.  As the comments in rcar-sysc.h refer to registers that have been
renamed (e.g. PWR*), and SYSCEXTMASK no longer exists, it might be
easier for the casual reader to drop the include, copy the PD_*
definitions, and define new r8a779a0_sysc_area and r8a779a0_sysc_info
structures instead, using the new naming.

> +
> +static struct rcar_sysc_area r8a779a0_areas[] __initdata = {
> +       { "always-on",       0, 0, R8A779A0_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
> +       { "a3e0",       0x1500, 0, R8A779A0_PD_A3E0, R8A779A0_PD_ALWAYS_ON, PD_SCU },

I think you can drop:
  - chan_offs: it's always 0x1000 + pdr * 64,
  - chan_bit: it's always zero,

> +/* SYSC Common */
> +#define SYSCSR         0x000   /* SYSC Status Register */
> +#define SYSCPONSR(x)   (0x800 + ((x) * 0x4)) /* Power-ON Status Register 0 */
> +#define SYSCPOFFSR(x)  (0x808 + ((x) * 0x4)) /* Power-OFF Status Register */
> +#define SYSCISCR(x)    (0x810 + ((x) * 0x4)) /* Interrupt Status/Clear Register */
> +#define SYSCIER(x)     (0x820 + ((x) * 0x4)) /* Interrupt Enable Register */
> +#define SYSCIMR(x)     (0x830 + ((x) * 0x4)) /* Interrupt Mask Register */
> +
> +/* Power Domain Registers */
> +#define PDRSR(n)       (0x1000 + ((n) * 0x40))
> +#define PDRONCR(n)     (0x1004 + ((n) * 0x40))
> +#define PDROFFCR(n)    (0x1008 + ((n) * 0x40))
> +#define PDRESR(n)      (0x100C + ((n) * 0x40))

While PDRESRn is described, and shown in a figure, it was forgotten in
the Table 9.2 ("List of Registers (Power Domain Registers for each power
domain)").

> +
> +/* Power State */
> +#define PW_ACTIVE      1       /* Active setting */

"/* PWRON/PWROFF */"?

> +
> +/* PDRSR */
> +#define PDRSR_OFF              BIT(0)  /* Power-OFF state */
> +#define PDRSR_ON               BIT(4)  /* Power-ON state */
> +#define PDRSR_OFF_STATE                BIT(8)  /* Processing Power-OFF sequence */
> +#define PDRSR_ON_STATE         BIT(12) /* Processing Power-ON sequence */
> +
> +#define SYSCSR_PONENB          1       /* Ready for power resume requests */
> +#define SYSCSR_POFFENB         0       /* Ready for power shutoff requests */

These two bits are now combined into a single BUSY bit mask:
(doh, all bits sets is not busy?!?)

#define SYSCSR_BUSY    GENMASK(1, 0)    /* All bit sets is not busy */


> +
> +#define SYSCSR_RETRIES         1000
> +#define SYSCSR_DELAY_US                10
> +
> +#define PDRESR_RETRIES         1000
> +#define PDRESR_DELAY_US                10
> +
> +#define SYSCISR_RETRIES                1000
> +#define SYSCISR_DELAY_US       10
> +
> +#define R8A779A0_NUM_PD_ALWAYS_ON      64      /* Always-on power area */

Just use R8A779A0_PD_ALWAYS_ON instead?

> +
> +#define NUM_DOMAINS_EACH_REG   32

BITS_PER_TYPE(u32)?


> +
> +struct rcar_sysc_ch {
> +       u16 chan_offs;
> +       u8 chan_bit;
> +       u8 isr_bit;
> +};

As chan_offs is unused, and chan_bit is always zero, I think all use of
this struct can just be replaced by "unsigned int pdr"?

> +
> +static void __iomem *rcar_sysc_base;

s/rcar/r8a779a0/ everywhere?

> +static DEFINE_SPINLOCK(rcar_sysc_lock); /* SMP CPUs + I/O devices */
> +
> +static int rcar_sysc_pwr_on_off(const struct rcar_sysc_ch *sysc_ch, bool on)
> +{
> +       unsigned int sr_bit, reg_offs;

sr_bit is no longer needed.

> +       int k;
> +
> +       if (on) {
> +               sr_bit = SYSCSR_PONENB;
> +               reg_offs = PDRONCR(sysc_ch->isr_bit);
> +       } else {
> +               sr_bit = SYSCSR_POFFENB;
> +               reg_offs = PDROFFCR(sysc_ch->isr_bit);
> +       }
> +
> +       /* Wait until SYSC is ready to accept a power request */
> +       for (k = 0; k < SYSCSR_RETRIES; k++) {
> +               if (ioread32(rcar_sysc_base + SYSCSR) & BIT(sr_bit))

    if ((ioread32(rcar_sysc_base + SYSCSR) & SYSCSR_BUSY) == SYSCSR_BUSY)

> +                       break;
> +               udelay(SYSCSR_DELAY_US);
> +       }

Perhaps you can use readl_poll_timeout()?

> +
> +       if (k == SYSCSR_RETRIES)
> +               return -EAGAIN;
> +
> +       /* Submit power shutoff or power resume request */
> +       iowrite32(PW_ACTIVE, rcar_sysc_base + reg_offs);
> +
> +       return 0;
> +}
> +
> +static int clear_irq_flags(unsigned int reg_idx, unsigned int isr_mask)
> +{
> +       int k = 0;
> +
> +       iowrite32(isr_mask, rcar_sysc_base + SYSCISCR(reg_idx));
> +
> +       for (k = 0; k < SYSCISR_RETRIES; k++) {
> +               if ((ioread32(rcar_sysc_base + SYSCISCR(reg_idx)) & isr_mask) == 0)
> +                       break;
> +
> +               udelay(SYSCISR_DELAY_US);
> +       }

readl_poll_timeout()?

> +
> +       if (k == SYSCISR_RETRIES) {
> +               pr_err("\n %s : Can not clear IRQ flags in SYSCISCR", __func__);
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}

> +static bool has_cpg_mstp;

Please drop this and all related code, R-Car V3U does not use the legacy
CPG/MSSR PM Domain.

> +static const struct of_device_id rcar_sysc_matches[] __initconst = {
> +#ifdef CONFIG_SYSC_R8A779A0

Please drop the #ifdef, as compilation of this file already depends on
this symbol.

> +       { .compatible = "renesas,r8a779a0-sysc", .data = &r8a779a0_sysc_info },
> +#endif
> +       { /* sentinel */ }
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
