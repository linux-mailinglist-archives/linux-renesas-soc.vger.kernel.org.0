Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1600F1B2AFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 17:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgDUPTy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 11:19:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:36758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbgDUPTx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 11:19:53 -0400
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30B802071E;
        Tue, 21 Apr 2020 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587482392;
        bh=6pQ5Fl6XDDkIlYeisUC+JGG6bIFAxA2suWc1oOnu2Bk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o51SkeQVBeMTzvfrkUyqvhkauOLwyIKOYOX6wk0qe5Y39xmulFt1ZJYE9yRaLMuDo
         B2Y5OUiX5y2pKhzCBf26MxcRfj9LFQpkuTXD6kS5lLZvWbOS2pm53Q2ky2x+2k72hi
         M5yArvlwpRvMYWac/RKzPzhTvOFSz7dkG0vNgzs8=
Received: by mail-io1-f45.google.com with SMTP id e9so7802835iok.9;
        Tue, 21 Apr 2020 08:19:52 -0700 (PDT)
X-Gm-Message-State: AGi0PuY2+aJVFgfgeUEYZnMgGyip7yyq9UnRNPwDClEd1TTfn0u5SX4I
        ctNgAqPpWnOOJcGCPqV/8DPoxw07AUQhsKCl/ME=
X-Google-Smtp-Source: APiQypK86d/gbXZ9XjywCEBYarrScAdD3A/GQPWxFzXW0yGEmlTCtRK2vk5QK6EZWIf5M3cLWqI7T9TtzGOFx6vL42s=
X-Received: by 2002:a6b:ef03:: with SMTP id k3mr21408289ioh.203.1587482391395;
 Tue, 21 Apr 2020 08:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200415153409.30112-1-geert+renesas@glider.be>
In-Reply-To: <20200415153409.30112-1-geert+renesas@glider.be>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 21 Apr 2020 17:19:40 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHm=xA4gafwAaBn8=YcAsQCYDNmZ=4REsfvEUgZShm3Ww@mail.gmail.com>
Message-ID: <CAMj1kXHm=xA4gafwAaBn8=YcAsQCYDNmZ=4REsfvEUgZShm3Ww@mail.gmail.com>
Subject: Re: [PATCH v5] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 15 Apr 2020 at 17:34, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Currently, the start address of physical memory is obtained by masking
> the program counter with a fixed mask of 0xf8000000.  This mask value
> was chosen as a balance between the requirements of different platforms.
> However, this does require that the start address of physical memory is
> a multiple of 128 MiB, precluding booting Linux on platforms where this
> requirement is not fulfilled.
>
> Fix this limitation by obtaining the start address from the DTB instead,
> if available (either explicitly passed, or appended to the kernel).
> Fall back to the traditional method when needed.
>
> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> i.e. not at a multiple of 128 MiB.
>
> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>

This is ready to go into the patch system, no?

The sooner Russell picks it up, the sooner I can respin my patches
that go on top.

Thanks,

> ---
> v5:
>   - Add Tested-by, Reviewed-by,
>   - Round up start of memory to satisfy 16 MiB alignment rule,
>
> v4:
>   - Fix stack location after commit 184bf653a7a452c1 ("ARM:
>     decompressor: factor out routine to obtain the inflated image
>     size"),
>
> v3:
>   - Add Reviewed-by,
>   - Fix ATAGs with appended DTB,
>   - Add Tested-by,
>
> v2:
>   - Use "cmp r0, #-1", instead of "cmn r0, #1",
>   - Add missing stack setup,
>   - Support appended DTB.
> ---
>  arch/arm/boot/compressed/Makefile            |  6 ++-
>  arch/arm/boot/compressed/fdt_get_mem_start.c | 57 ++++++++++++++++++++
>  arch/arm/boot/compressed/head.S              | 54 ++++++++++++++++++-
>  3 files changed, 115 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/compressed/fdt_get_mem_start.c
>
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index 9c11e7490292f0e0..82e4cee97cb5d905 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -86,12 +86,15 @@ libfdt_objs := $(addsuffix .o, $(basename $(libfdt)))
>  $(addprefix $(obj)/,$(libfdt) $(libfdt_hdrs)): $(obj)/%: $(srctree)/scripts/dtc/libfdt/%
>         $(call cmd,shipped)
>
> -$(addprefix $(obj)/,$(libfdt_objs) atags_to_fdt.o): \
> +$(addprefix $(obj)/,$(libfdt_objs) atags_to_fdt.o fdt_get_mem_start.o): \
>         $(addprefix $(obj)/,$(libfdt_hdrs))
>
>  ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
>  OBJS   += $(libfdt_objs) atags_to_fdt.o
>  endif
> +ifeq ($(CONFIG_USE_OF),y)
> +OBJS   += $(libfdt_objs) fdt_get_mem_start.o
> +endif
>
>  targets       := vmlinux vmlinux.lds piggy_data piggy.o \
>                  lib1funcs.o ashldi3.o bswapsdi2.o \
> @@ -115,6 +118,7 @@ CFLAGS_fdt.o := $(nossp-flags-y)
>  CFLAGS_fdt_ro.o := $(nossp-flags-y)
>  CFLAGS_fdt_rw.o := $(nossp-flags-y)
>  CFLAGS_fdt_wip.o := $(nossp-flags-y)
> +CFLAGS_fdt_get_mem_start.o := $(nossp-flags-y)
>
>  ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin \
>              -I$(obj) $(DISABLE_ARM_SSP_PER_TASK_PLUGIN)
> diff --git a/arch/arm/boot/compressed/fdt_get_mem_start.c b/arch/arm/boot/compressed/fdt_get_mem_start.c
> new file mode 100644
> index 0000000000000000..e29caa4cbfecb36a
> --- /dev/null
> +++ b/arch/arm/boot/compressed/fdt_get_mem_start.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/kernel.h>
> +#include <linux/sizes.h>
> +
> +#include <libfdt.h>
> +
> +static const void *getprop(const void *fdt, const char *node_path,
> +                          const char *property)
> +{
> +       int offset = fdt_path_offset(fdt, node_path);
> +
> +       if (offset == -FDT_ERR_NOTFOUND)
> +               return NULL;
> +
> +       return fdt_getprop(fdt, offset, property, NULL);
> +}
> +
> +static uint32_t get_addr_size(const void *fdt)
> +{
> +       const __be32 *addr_len = getprop(fdt, "/", "#address-cells");
> +
> +       if (!addr_len) {
> +               /* default */
> +               return 1;
> +       }
> +
> +       return fdt32_to_cpu(*addr_len);
> +}
> +
> +/*
> + * Get the start of physical memory
> + */
> +
> +unsigned long fdt_get_mem_start(const void *fdt)
> +{
> +       uint32_t addr_size, mem_start;
> +       const __be32 *memory;
> +
> +       if (!fdt)
> +               return -1;
> +
> +       if (*(__be32 *)fdt != cpu_to_fdt32(FDT_MAGIC))
> +               return -1;
> +
> +       /* Find the first memory node */
> +       memory = getprop(fdt, "/memory", "reg");
> +       if (!memory)
> +               return -1;
> +
> +       /* There may be multiple cells on LPAE platforms */
> +       addr_size = get_addr_size(fdt);
> +
> +       mem_start = fdt32_to_cpu(memory[addr_size - 1]);
> +       /* Must be a multiple of 16 MiB for phys/virt patching */
> +       return round_up(mem_start, SZ_16M);
> +}
> diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
> index cabdd8f4a2482e2b..2d2a42865b3974da 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -254,8 +254,58 @@ not_angel:
>                 .text
>
>  #ifdef CONFIG_AUTO_ZRELADDR
> +#ifdef CONFIG_USE_OF
>                 /*
> -                * Find the start of physical memory.  As we are executing
> +                * Find the start of physical memory.
> +                * Try the DTB first, if available.
> +                */
> +               adr     r0, LC0
> +               ldr     r1, [r0]        @ get absolute LC0
> +               ldr     sp, [r0, #24]   @ get stack location
> +               sub     r1, r0, r1      @ compute relocation offset
> +               add     sp, sp, r1      @ apply relocation
> +
> +#ifdef CONFIG_ARM_APPENDED_DTB
> +               /*
> +                * Look for an appended DTB. If found, use it and
> +                * move stack away from it.
> +                */
> +               ldr     r6, [r0, #12]   @ get &_edata
> +               add     r6, r6, r1      @ relocate it
> +               ldmia   r6, {r0, r5}    @ get DTB signature and size
> +#ifndef __ARMEB__
> +               ldr     r1, =0xedfe0dd0 @ sig is 0xd00dfeed big endian
> +               /* convert DTB size to little endian */
> +               eor     r2, r5, r5, ror #16
> +               bic     r2, r2, #0x00ff0000
> +               mov     r5, r5, ror #8
> +               eor     r5, r5, r2, lsr #8
> +#else
> +               ldr     r1, =0xd00dfeed
> +#endif
> +               cmp     r0, r1          @ do we have a DTB there?
> +               bne     1f
> +
> +               /* preserve 64-bit alignment */
> +               add     r5, r5, #7
> +               bic     r5, r5, #7
> +               add     sp, sp, r5      @ if so, move stack above DTB
> +               mov     r0, r6          @ and extract memory start from DTB
> +               b       2f
> +
> +1:
> +#endif /* CONFIG_ARM_APPENDED_DTB */
> +
> +               mov     r0, r8
> +2:
> +               bl      fdt_get_mem_start
> +               mov     r4, r0
> +               cmp     r0, #-1
> +               bne     1f
> +#endif /* CONFIG_USE_OF */
> +
> +               /*
> +                * Fall back to the traditional method.  As we are executing
>                  * without the MMU on, we are in the physical address space.
>                  * We just need to get rid of any offset by aligning the
>                  * address.
> @@ -273,6 +323,8 @@ not_angel:
>                  */
>                 mov     r4, pc
>                 and     r4, r4, #0xf8000000
> +
> +1:
>                 /* Determine final kernel image address. */
>                 add     r4, r4, #TEXT_OFFSET
>  #else
> --
> 2.17.1
>
