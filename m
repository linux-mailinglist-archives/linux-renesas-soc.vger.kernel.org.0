Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2DD2166CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 08:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgGGGun (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 02:50:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:40916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727008AbgGGGun (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 02:50:43 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F8FB2074F
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2020 06:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594104641;
        bh=GffjWrcd1WsRtPJ1h392se8rKoI280AVRqQ5U/fEgN4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=reF32Z3uuaEirhi6nhZQssflBUEw1sWpj+yp98c6Gq20iFrAP9zT0IOryKe6AScPf
         VYm6GBNYZFHohyG7H6aDLYdr/N57OJ50ZJ+cLbk2LL+I9wC6h8GSvo8ss5eKS4k/O5
         eeS7HAz9QbdijCBxL/5J/98be6/gelkWxa4E6AOU=
Received: by mail-ot1-f47.google.com with SMTP id h1so11383699otq.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2020 23:50:41 -0700 (PDT)
X-Gm-Message-State: AOAM530x8D+x+pRdZ4yYKBN8aw6n7p35nT/bTS6M+Js8xN9nI6XPAb7p
        Jv5AzYi5YPPZkHXPY1rBbluJoIyj8ki+TsAXL6o=
X-Google-Smtp-Source: ABdhPJzcW6c4D5BV5/WImqzsglpaC24OUWDn2mk4Cqw1pzwmFFilNzT0IecbC+gHNuuuy5s8VbcoV4kFhdi27oeAfhs=
X-Received: by 2002:a9d:6e85:: with SMTP id a5mr3979353otr.90.1594104640735;
 Mon, 06 Jul 2020 23:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200706150205.22053-1-geert+renesas@glider.be>
In-Reply-To: <20200706150205.22053-1-geert+renesas@glider.be>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 7 Jul 2020 09:50:29 +0300
X-Gmail-Original-Message-ID: <CAMj1kXFmpWKVAbjjTVztmUktxFpYutQQ1SOBqknPB74fcG0FEQ@mail.gmail.com>
Message-ID: <CAMj1kXFmpWKVAbjjTVztmUktxFpYutQQ1SOBqknPB74fcG0FEQ@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 6 Jul 2020 at 18:02, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
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
> Cc: Lukasz Stelmach <l.stelmach@samsung.com>
> ---
> Marked as RFC, because:
>   1. This is known to break crashkernel support, as the memory used by
>      the crashkernel is not marked reserved in DT (yet),
>   2. Russell won't apply this for v5.9 anyway,
>

Would it help if we make this behavior dependent on a simple heuristic, e.g.,

if (round_up(load_address, 128M) >= dram_end)
  use dram_start from DT
else
  use round_up(load_address, 128M)

That way, the fix is guaranteed to only take effect for systems that
cannot even boot otherwise, which fixes the crashkernel case, as well
as other potential regressions due to the load address of the core
kernel changing for existing boards.


> v7:
>   - Rebase on top of commits 161e04a5bae58a65 ("ARM: decompressor: split
>     off _edata and stack base into separate object") and
>     c7c06b8843c0aa65 ("kbuild: remove cc-option test of
>     -fno-stack-protector") in next-20200706.
>
> v6:
>   - Rebase on top of commit 7ae4a78daacf240a ("ARM: 8969/1:
>     decompressor: simplify libfdt builds"),
>   - Include <linux/libfdt.h> instead of <libfdt.h>,
>
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
>  arch/arm/boot/compressed/Makefile            |  5 +-
>  arch/arm/boot/compressed/fdt_get_mem_start.c | 56 ++++++++++++++++++++
>  arch/arm/boot/compressed/head.S              | 52 +++++++++++++++++-
>  3 files changed, 111 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/compressed/fdt_get_mem_start.c
>
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index b1147b7f2c8d372e..b1c09faf276e9193 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -81,10 +81,13 @@ libfdt_objs := fdt_rw.o fdt_ro.o fdt_wip.o fdt.o
>  ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
>  OBJS   += $(libfdt_objs) atags_to_fdt.o
>  endif
> +ifeq ($(CONFIG_USE_OF),y)
> +OBJS   += $(libfdt_objs) fdt_get_mem_start.o
> +endif
>
>  # -fstack-protector-strong triggers protection checks in this code,
>  # but it is being used too early to link to meaningful stack_chk logic.
> -$(foreach o, $(libfdt_objs) atags_to_fdt.o, \
> +$(foreach o, $(libfdt_objs) atags_to_fdt.o fdt_get_mem_start.o, \
>         $(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt -fno-stack-protector))
>
>  # These were previously generated C files. When you are building the kernel
> diff --git a/arch/arm/boot/compressed/fdt_get_mem_start.c b/arch/arm/boot/compressed/fdt_get_mem_start.c
> new file mode 100644
> index 0000000000000000..ae71fde731b869d7
> --- /dev/null
> +++ b/arch/arm/boot/compressed/fdt_get_mem_start.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/kernel.h>
> +#include <linux/libfdt.h>
> +#include <linux/sizes.h>
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
> index 434a16982e344fe4..802621756ac0480b 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -254,8 +254,56 @@ not_angel:
>                 .text
>
>  #ifdef CONFIG_AUTO_ZRELADDR
> +#ifdef CONFIG_USE_OF
>                 /*
> -                * Find the start of physical memory.  As we are executing
> +                * Find the start of physical memory.
> +                * Try the DTB first, if available.
> +                */
> +               adr     r0, LC1
> +               ldr     sp, [r0]        @ get stack location
> +               add     sp, sp, r0      @ apply relocation
> +
> +#ifdef CONFIG_ARM_APPENDED_DTB
> +               /*
> +                * Look for an appended DTB. If found, use it and
> +                * move stack away from it.
> +                */
> +               ldr     r6, [r0, #4]    @ get &_edata
> +               add     r6, r6, r0      @ relocate it
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
> @@ -273,6 +321,8 @@ not_angel:
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
