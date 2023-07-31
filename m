Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75BFC7690E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Jul 2023 10:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbjGaIzu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 04:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbjGaIzN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 04:55:13 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2BE1FCE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jul 2023 01:53:45 -0700 (PDT)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B36893F189
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jul 2023 08:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1690793623;
        bh=N6m8Y5VRnV1e/ckYMUK97ifClIA5nUJuJFaD+GJ3VEY=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=WB69ovMMIlO8tMJ31Yt8n/WvmlChP13//XlMYfgVT7NbTHjcMzsL+8Ewc3N7y6YUn
         zVu0XLBARn2rZhzS8Vd6/DAA0KxnVys3S0iJwRLgCsGCzDJwU/+WRTz11yKYPttnLP
         bbrrHZqpbepvQDEGAr0m23CnqYAHLbzcLjtetDXHUXP23RVw+2uxnuCclCWa1/xU+v
         2ZMJwrASejnXSN4ZSj3nWJFLgH+NIJ7702IKry5ci3upO1EBg12kZnK+IPRcGTnCxY
         VOFcCit3r2Lj3sgCAysEXJsLG2wijDVeO6KDj+iTpSpQlbd5eFHExrbaWBoJ4NTiRF
         VJBNwkN5QbDgA==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-403ae7d56baso50287421cf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jul 2023 01:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793622; x=1691398422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6m8Y5VRnV1e/ckYMUK97ifClIA5nUJuJFaD+GJ3VEY=;
        b=EgNd6Gjf2TXT/IiEr6cAmiFChY0Bl1nOZQat5ePCWHfkCRxpIL54lZ8wRSjwG5Mmo+
         eKx2T2vhE5jUVxBQGpBwmO+VEXPBSRWOw90wD2+QyU+sRK1cuBtk0Ju+MVnPKmJPEWI1
         7Rkbz+6r4nOVwubY89DMoKINTYtDS6GDrDnwynTYLlC3Lp9uKSB3kpOUF5UQO6Laib5H
         b18S5bhC9XqrWtFySDAwMynpaK/rAyRgzrSODNxhCP0f0x3waW/QcK4L/yk/ZVBo807Y
         kOpCQHqNF90euHpcxVTFYRQNrUcvUJJnCa4yijIVRsv0SlfQoqwD+Hmr/Y7gNGEUu66Q
         Mj+g==
X-Gm-Message-State: ABy/qLavUXgUp5Z0NImGPa8bp+43zjGmFJKh2GLaEB/xsyekBLa14arj
        ftIGIhNrwN0XGHSVlXNgkAY80Fgk4pcwSWWP11AjUV2nFXRwFYbQvtSfwdnoT10q4tCmwC6tWuM
        5j/wCy+LCxJW2eH/AJAA5kNWSUuold3kRjLbKGHJ9b6bUNJ98ST7Aw95oKCMFVxom
X-Received: by 2002:ac8:5a04:0:b0:405:4734:6913 with SMTP id n4-20020ac85a04000000b0040547346913mr13058574qta.0.1690793622557;
        Mon, 31 Jul 2023 01:53:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE+tYXbcIzh66ANlscrJ7zvj52Tylo0cwh04v8laO+LDjM/rnuy8TFkp3Y6YCCwMr4uyYAc1HntFXd0dEy71fc=
X-Received: by 2002:ac8:5a04:0:b0:405:4734:6913 with SMTP id
 n4-20020ac85a04000000b0040547346913mr13058556qta.0.1690793622267; Mon, 31 Jul
 2023 01:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230702203429.237615-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230702203429.237615-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Mon, 31 Jul 2023 10:53:26 +0200
Message-ID: <CAJM55Z_ZoKY5A6icpkZo+U5JQ5rMfNmCWz35EJ9RrH7bEgv53g@mail.gmail.com>
Subject: Re: [PATCH v10 5/6] cache: Add L2 cache management for Andes AX45MP
 RISC-V core
To:     Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Conor Dooley <conor.dooley@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Guo Ren <guoren@kernel.org>,
        Andrew Jones <ajones@ventanamicro.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Samuel Holland <samuel@sholland.org>,
        linux-riscv@lists.infradead.org,
        Christoph Hellwig <hch@infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 2 Jul 2023 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> I/O Coherence Port (IOCP) provides an AXI interface for connecting
> external non-caching masters, such as DMA controllers. The accesses
> from IOCP are coherent with D-Caches and L2 Cache.
>
> IOCP is a specification option and is disabled on the Renesas RZ/Five
> SoC due to this reason IP blocks using DMA will fail.
>
> The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> block that allows dynamic adjustment of memory attributes in the runtime.
> It contains a configurable amount of PMA entries implemented as CSR
> registers to control the attributes of memory locations in interest.
> Below are the memory attributes supported:
> * Device, Non-bufferable
> * Device, bufferable
> * Memory, Non-cacheable, Non-bufferable
> * Memory, Non-cacheable, Bufferable
> * Memory, Write-back, No-allocate
> * Memory, Write-back, Read-allocate
> * Memory, Write-back, Write-allocate
> * Memory, Write-back, Read and Write-allocate
>
> More info about PMA (section 10.3):
> Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
>
> As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> software. Firstly OpenSBI configures the memory region as
> "Memory, Non-cacheable, Bufferable" and passes this region as a global
> shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> allocations happen from this region and synchronization callbacks are
> implemented to synchronize when doing DMA transactions.
>
> Example PMA region passes as a DT node from OpenSBI:
>     reserved-memory {
>         #address-cells = <2>;
>         #size-cells = <2>;
>         ranges;
>
>         pma_resv0@58000000 {
>             compatible = "shared-dma-pool";
>             reg = <0x0 0x58000000 0x0 0x08000000>;
>             no-map;
>             linux,dma-default;
>         };
>     };
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Conor Dooley <conor.dooley@microchip.com> # tyre-kicking on a d1
> ---
> v8 -> v9
> * Updated function pointers
>
> v8 -> v9
> * Dropped exporting CMO functions as we no more used ALTERNATIVE_X() macro
> * Now using the riscv_noncoherent_register_cache_ops() for registering
>   CMO ops
> * Added RB tag from Conor
>
> v7 -> v8
> * Dropped function pointer usage
> * Now exporting the functions for clean/inval/flush
> * Switched to using early_initcall instead of arch_initcall
> * Dropped entry for "include/cache" from MAINTAINERS
> * Dropped dependency of RISCV on AX45MP_L2_CACHE
> * Returning error in case of cache line mismatch
> * Renamed clean/inval/flush functions
>
> v6 -> v7
> * Implemented flush callback
> * Dropped using riscv_dma_noncoherent_cmo_ops
>
> v5 -> v6
> * Moved driver to cache folder
> * Switched to new API for CMO
>
> v4 -> v5
> * Dropped code for configuring L2 cache
> * Dropped code for configuring PMA
> * Updated commit message
> * Added comments
> * Changed static branch enable/disable order
>
> RFC v3 -> v4
> * Made use of runtime patching instead of compile time
> * Now just exposing single function ax45mp_no_iocp_cmo() for CMO handling
> * Added a check to make sure cache line size is always 64 bytes
> * Renamed folder rzf -> rzfive
> * Improved Kconfig description
> * Dropped L2 cache configuration
> * Dropped unnecessary casts
> * Fixed comments pointed by Geert.
> ---
>  MAINTAINERS                  |   7 ++
>  drivers/Kconfig              |   2 +
>  drivers/Makefile             |   1 +
>  drivers/cache/Kconfig        |  11 ++
>  drivers/cache/Makefile       |   3 +
>  drivers/cache/ax45mp_cache.c | 213 +++++++++++++++++++++++++++++++++++
>  6 files changed, 237 insertions(+)
>  create mode 100644 drivers/cache/Kconfig
>  create mode 100644 drivers/cache/Makefile
>  create mode 100644 drivers/cache/ax45mp_cache.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55ac73793856..899452038a5b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20073,6 +20073,13 @@ S:     Supported
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>  F:     drivers/staging/
>
> +STANDALONE CACHE CONTROLLER DRIVERS
> +M:     Conor Dooley <conor@kernel.org>
> +L:     linux-riscv@lists.infradead.org
> +S:     Maintained
> +T:     git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:     drivers/cache
> +
>  STARFIRE/DURALAN NETWORK DRIVER
>  M:     Ion Badulescu <ionut@badula.org>
>  S:     Odd Fixes
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 514ae6b24cb2..2ae1b6707c2c 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -15,6 +15,8 @@ source "drivers/base/Kconfig"
>
>  source "drivers/bus/Kconfig"
>
> +source "drivers/cache/Kconfig"
> +
>  source "drivers/connector/Kconfig"
>
>  source "drivers/firmware/Kconfig"
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 7241d80a7b29..23eb201fe18a 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -11,6 +11,7 @@ ifdef building_out_of_srctree
>  MAKEFLAGS += --include-dir=$(srctree)
>  endif
>
> +obj-y                          += cache/
>  obj-y                          += irqchip/
>  obj-y                          += bus/
>
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> new file mode 100644
> index 000000000000..a57677f908f3
> --- /dev/null
> +++ b/drivers/cache/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +menu "Cache Drivers"
> +
> +config AX45MP_L2_CACHE
> +       bool "Andes Technology AX45MP L2 Cache controller"
> +       depends on RISCV_DMA_NONCOHERENT
> +       select RISCV_NONSTANDARD_CACHE_OPS
> +       help
> +         Support for the L2 cache controller on Andes Technology AX45MP platforms.
> +
> +endmenu
> diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
> new file mode 100644
> index 000000000000..2012e7fb978d
> --- /dev/null
> +++ b/drivers/cache/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_AX45MP_L2_CACHE) += ax45mp_cache.o
> diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/ax45mp_cache.c
> new file mode 100644
> index 000000000000..863bf0bfef98
> --- /dev/null
> +++ b/drivers/cache/ax45mp_cache.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * non-coherent cache functions for Andes AX45MP
> + *
> + * Copyright (C) 2023 Renesas Electronics Corp.
> + */
> +
> +#include <linux/cacheflush.h>
> +#include <linux/cacheinfo.h>
> +#include <linux/dma-direction.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +
> +#include <asm/dma-noncoherent.h>
> +
> +/* L2 cache registers */
> +#define AX45MP_L2C_REG_CTL_OFFSET              0x8
> +
> +#define AX45MP_L2C_REG_C0_CMD_OFFSET           0x40
> +#define AX45MP_L2C_REG_C0_ACC_OFFSET           0x48
> +#define AX45MP_L2C_REG_STATUS_OFFSET           0x80
> +
> +/* D-cache operation */
> +#define AX45MP_CCTL_L1D_VA_INVAL               0 /* Invalidate an L1 cache entry */
> +#define AX45MP_CCTL_L1D_VA_WB                  1 /* Write-back an L1 cache entry */
> +
> +/* L2 CCTL status */
> +#define AX45MP_CCTL_L2_STATUS_IDLE             0
> +
> +/* L2 CCTL status cores mask */
> +#define AX45MP_CCTL_L2_STATUS_C0_MASK          0xf
> +
> +/* L2 cache operation */
> +#define AX45MP_CCTL_L2_PA_INVAL                        0x8 /* Invalidate an L2 cache entry */
> +#define AX45MP_CCTL_L2_PA_WB                   0x9 /* Write-back an L2 cache entry */
> +
> +#define AX45MP_L2C_REG_PER_CORE_OFFSET         0x10
> +#define AX45MP_CCTL_L2_STATUS_PER_CORE_OFFSET  4
> +
> +#define AX45MP_L2C_REG_CN_CMD_OFFSET(n)        \
> +       (AX45MP_L2C_REG_C0_CMD_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
> +#define AX45MP_L2C_REG_CN_ACC_OFFSET(n)        \
> +       (AX45MP_L2C_REG_C0_ACC_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
> +#define AX45MP_CCTL_L2_STATUS_CN_MASK(n)       \
> +       (AX45MP_CCTL_L2_STATUS_C0_MASK << ((n) * AX45MP_CCTL_L2_STATUS_PER_CORE_OFFSET))
> +
> +#define AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM     0x80b
> +#define AX45MP_CCTL_REG_UCCTLCOMMAND_NUM       0x80c
> +
> +#define AX45MP_CACHE_LINE_SIZE                 64
> +
> +struct ax45mp_priv {
> +       void __iomem *l2c_base;
> +       u32 ax45mp_cache_line_size;
> +};
> +
> +static struct ax45mp_priv ax45mp_priv;
> +
> +/* L2 Cache operations */
> +static inline uint32_t ax45mp_cpu_l2c_get_cctl_status(void)
> +{
> +       return readl(ax45mp_priv.l2c_base + AX45MP_L2C_REG_STATUS_OFFSET);
> +}
> +
> +static void ax45mp_cpu_cache_operation(unsigned long start, unsigned long end,
> +                                      unsigned int l1_op, unsigned int l2_op)
> +{
> +       unsigned long line_size = ax45mp_priv.ax45mp_cache_line_size;
> +       void __iomem *base = ax45mp_priv.l2c_base;
> +       int mhartid = smp_processor_id();
> +       unsigned long pa;
> +
> +       while (end > start) {
> +               csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
> +               csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, l1_op);
> +
> +               pa = virt_to_phys((void *)start);
> +               writel(pa, base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid));
> +               writel(l2_op, base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid));
> +               while ((ax45mp_cpu_l2c_get_cctl_status() &
> +                       AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
> +                       AX45MP_CCTL_L2_STATUS_IDLE)
> +                       ;
> +
> +               start += line_size;
> +       }
> +}
> +
> +/* Write-back L1 and L2 cache entry */
> +static inline void ax45mp_cpu_dcache_wb_range(unsigned long start, unsigned long end)
> +{
> +       ax45mp_cpu_cache_operation(start, end, AX45MP_CCTL_L1D_VA_WB,
> +                                  AX45MP_CCTL_L2_PA_WB);
> +}
> +
> +/* Invalidate the L1 and L2 cache entry */
> +static inline void ax45mp_cpu_dcache_inval_range(unsigned long start, unsigned long end)
> +{
> +       ax45mp_cpu_cache_operation(start, end, AX45MP_CCTL_L1D_VA_INVAL,
> +                                  AX45MP_CCTL_L2_PA_INVAL);
> +}
> +
> +static void ax45mp_dma_cache_inv(phys_addr_t paddr, unsigned long size)
> +{
> +       unsigned long start = (unsigned long)phys_to_virt(paddr);
> +       unsigned long end = start + size;
> +       unsigned long line_size;
> +       unsigned long flags;
> +
> +       if (unlikely(start == end))
> +               return;
> +
> +       line_size = ax45mp_priv.ax45mp_cache_line_size;
> +
> +       start = start & (~(line_size - 1));
> +       end = ((end + line_size - 1) & (~(line_size - 1)));
> +
> +       local_irq_save(flags);
> +
> +       ax45mp_cpu_dcache_inval_range(start, end);
> +
> +       local_irq_restore(flags);
> +}
> +
> +static void ax45mp_dma_cache_wback(phys_addr_t paddr, unsigned long size)
> +{
> +       unsigned long start = (unsigned long)phys_to_virt(paddr);
> +       unsigned long end = start + size;
> +       unsigned long line_size;
> +       unsigned long flags;
> +
> +       line_size = ax45mp_priv.ax45mp_cache_line_size;
> +       start = start & (~(line_size - 1));
> +       local_irq_save(flags);
> +       ax45mp_cpu_dcache_wb_range(start, end);
> +       local_irq_restore(flags);
> +}
> +
> +static void ax45mp_dma_cache_wback_inv(phys_addr_t paddr, unsigned long size)
> +{
> +       ax45mp_dma_cache_wback(paddr, size);
> +       ax45mp_dma_cache_inv(paddr, size);
> +}
> +
> +static int ax45mp_get_l2_line_size(struct device_node *np)
> +{
> +       int ret;
> +
> +       ret = of_property_read_u32(np, "cache-line-size", &ax45mp_priv.ax45mp_cache_line_size);
> +       if (ret) {
> +               pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
> +               return ret;
> +       }
> +
> +       if (ax45mp_priv.ax45mp_cache_line_size != AX45MP_CACHE_LINE_SIZE) {
> +               pr_err("Expected cache-line-size to be 64 bytes (found:%u)\n",
> +                      ax45mp_priv.ax45mp_cache_line_size);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct riscv_cache_ops ax45mp_cmo_ops = {
> +       .wback = &ax45mp_dma_cache_wback,
> +       .inv = &ax45mp_dma_cache_inv,
> +       .wback_inv = &ax45mp_dma_cache_wback_inv,
> +};

Hi Prabhakar,

If you're respinning this patchset anyway, I think you can mark this
struct as __initdata since it's only used by
riscv_noncoherent_register_cache_ops which copies the contents.

> +
> +static const struct of_device_id ax45mp_cache_ids[] = {
> +       { .compatible = "andestech,ax45mp-cache" },
> +       { /* sentinel */ }
> +};
> +
> +static int __init ax45mp_cache_init(void)
> +{
> +       struct device_node *np;
> +       struct resource res;
> +       int ret;
> +
> +       np = of_find_matching_node(NULL, ax45mp_cache_ids);
> +       if (!of_device_is_available(np))
> +               return -ENODEV;
> +
> +       ret = of_address_to_resource(np, 0, &res);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * If IOCP is present on the Andes AX45MP core riscv_cbom_block_size
> +        * will be 0 for sure, so we can definitely rely on it. If
> +        * riscv_cbom_block_size = 0 we don't need to handle CMO using SW any
> +        * more so we just return success here and only if its being set we
> +        * continue further in the probe path.
> +        */
> +       if (!riscv_cbom_block_size)
> +               return 0;
> +
> +       ax45mp_priv.l2c_base = ioremap(res.start, resource_size(&res));
> +       if (!ax45mp_priv.l2c_base)
> +               return -ENOMEM;
> +
> +       ret = ax45mp_get_l2_line_size(np);
> +       if (ret) {
> +               iounmap(ax45mp_priv.l2c_base);
> +               return ret;
> +       }
> +
> +       riscv_noncoherent_register_cache_ops(&ax45mp_cmo_ops);
> +
> +       return 0;
> +}
> +early_initcall(ax45mp_cache_init);
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
