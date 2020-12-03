Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67BA42CDB54
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 17:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbgLCQfX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 11:35:23 -0500
Received: from pb-smtp21.pobox.com ([173.228.157.53]:64304 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgLCQfW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 11:35:22 -0500
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 13FA210A607;
        Thu,  3 Dec 2020 11:34:37 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=ZERIB8kn6CEGcM6yPmYNEfoZ5Q8=; b=SIzpR9
        joHIW5WtfGBffL4USHDaV92DFfHTaXB19WjXtBAVPlZn0BONBtrs/5oNbXdewq/P
        T9f4g+lpK7tPiXprYYpdLrQ0sLSTQLb8suo9+9KnRMBXrtKJ0ivwycY4i0gANdVk
        CYH35vobKg7ydl8NiBcufOsemeYagREumwxB0=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 0CC3D10A606;
        Thu,  3 Dec 2020 11:34:37 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=UsuuBg8Sf3/o4ZN+pIGUH6KfDILZu7DeR1Rqe4Ugs2s=; b=ExGQSIx2YnYFXMS7y1IBblsbw1IFGGlNsOcJ5IVRHR3DLjBpC5aOAkvUYkvysfYCR8ZaLsk7l9AWHEtjnxJ/pIqmB7zWyNZpkT0Dv7cyY7ueGHO/T7XUzHHnjVO84gKr8cM7Dwsksi71Jzxww/laXSJIZJuhUUp5cmqawjbQOCs=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id DE4F710A604;
        Thu,  3 Dec 2020 11:34:33 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 298D72DA0B35;
        Thu,  3 Dec 2020 11:34:32 -0500 (EST)
Date:   Thu, 3 Dec 2020 11:34:32 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
cc:     Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/3] ARM: uncompress: Validate start of physical
 memory against passed DTB
In-Reply-To: <20201203121916.2870975-4-geert+renesas@glider.be>
Message-ID: <s1pr1q61-onsn-8soq-p134-ops1q0s64461@syhkavp.arg>
References: <20201203121916.2870975-1-geert+renesas@glider.be> <20201203121916.2870975-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 6CEC4B40-3585-11EB-9367-D609E328BF65-78420484!pb-smtp21.pobox.com
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 3 Dec 2020, Geert Uytterhoeven wrote:

> Currently, the start address of physical memory is obtained by masking
> the program counter with a fixed mask of 0xf8000000.  This mask value
> was chosen as a balance between the requirements of different platforms.
> However, this does require that the start address of physical memory is
> a multiple of 128 MiB, precluding booting Linux on platforms where this
> requirement is not fulfilled.
> 
> Fix this limitation by validating the masked address against the memory
> information in the passed DTB.  Only use the start address
> from DTB when masking would yield an out-of-range address, prefer the
> traditional method in all other cases.  Note that this applies only to the
> explicitly passed DTB on modern systems, and not to a DTB appended to
> the kernel, or to ATAGS.  The appended DTB may need to be augmented by
> information from ATAGS, which may need to rely on knowledge of the start
> address of physical memory itself.
> 
> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> i.e. not at a multiple of 128 MiB.
> 
> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'm not that intimate with dt contents so:

Acked-by: Nicolas Pitre <nico@fluxnic.net>

And it would be a good idea to repeat the GOT fixup caviat comment 
before calling fdt_check_mem_start.

> ---
> v10:
>   - Update for commit 9443076e4330a14a ("ARM: p2v: reduce p2v alignment
>     requirement to 2 MiB"),
>   - Use OF_DT_MAGIC macro,
>   - Rename fdt_get_mem_start() to fdt_check_mem_start(),
>   - Skip validation if there is an appended DTB,
>   - Pass mem_start to fdt_check_mem_start() to streamline code,
>   - Optimize register allocation,
>   - Update CONFIG_AUTO_ZRELADDR help text,
>   - Check all memory nodes and ranges (not just the first one), and
>     "linux,usable-memory", similar to early_init_dt_scan_memory(),
>   - Drop Reviewed-by, Tested-by tags,
> 
> v9:
>   - Add minlen parameter to getprop(), for better validation of
>     memory properties,
>   - Only use start of memory from the DTB if masking would yield an
>     out-of-range address, to fix kdump, as suggested by Ard.
> 
> v8:
>   - Rebase on top of commit 893ab00439a45513 ("kbuild: remove cc-option
>     test of -fno-stack-protector"),
> 
> v7:
>   - Rebase on top of commit 161e04a5bae58a65 ("ARM: decompressor: split
>     off _edata and stack base into separate object"),
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
>  arch/arm/Kconfig                              |   7 +-
>  arch/arm/boot/compressed/Makefile             |   5 +-
>  .../arm/boot/compressed/fdt_check_mem_start.c | 131 ++++++++++++++++++
>  arch/arm/boot/compressed/head.S               |  32 ++++-
>  4 files changed, 168 insertions(+), 7 deletions(-)
>  create mode 100644 arch/arm/boot/compressed/fdt_check_mem_start.c
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index b2bf019dcefa6379..c341aa6fa862455c 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1908,9 +1908,10 @@ config AUTO_ZRELADDR
>  	help
>  	  ZRELADDR is the physical address where the decompressed kernel
>  	  image will be placed. If AUTO_ZRELADDR is selected, the address
> -	  will be determined at run-time by masking the current IP with
> -	  0xf8000000. This assumes the zImage being placed in the first 128MB
> -	  from start of memory.
> +	  will be determined at run-time, either by masking the current IP
> +	  with 0xf8000000, or, if invalid, from the DTB passed in r2.
> +	  This assumes the zImage being placed in the first 128MB from
> +	  start of memory.
>  
>  config EFI_STUB
>  	bool
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index a815b1ae990d2d48..7361d45dc2ad603e 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -87,10 +87,13 @@ libfdt_objs := fdt_rw.o fdt_ro.o fdt_wip.o fdt.o
>  ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
>  OBJS	+= $(libfdt_objs) atags_to_fdt.o
>  endif
> +ifeq ($(CONFIG_USE_OF),y)
> +OBJS	+= $(libfdt_objs) fdt_check_mem_start.o
> +endif
>  
>  # -fstack-protector-strong triggers protection checks in this code,
>  # but it is being used too early to link to meaningful stack_chk logic.
> -$(foreach o, $(libfdt_objs) atags_to_fdt.o, \
> +$(foreach o, $(libfdt_objs) atags_to_fdt.o fdt_check_mem_start.o, \
>  	$(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt -fno-stack-protector))
>  
>  # These were previously generated C files. When you are building the kernel
> diff --git a/arch/arm/boot/compressed/fdt_check_mem_start.c b/arch/arm/boot/compressed/fdt_check_mem_start.c
> new file mode 100644
> index 0000000000000000..0bd39319d8a7f973
> --- /dev/null
> +++ b/arch/arm/boot/compressed/fdt_check_mem_start.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/kernel.h>
> +#include <linux/libfdt.h>
> +#include <linux/sizes.h>
> +
> +static const void *get_prop(const void *fdt, const char *node_path,
> +			    const char *property, int minlen)
> +{
> +	const void *prop;
> +	int offset, len;
> +
> +	offset = fdt_path_offset(fdt, node_path);
> +	if (offset < 0)
> +		return NULL;
> +
> +	prop = fdt_getprop(fdt, offset, property, &len);
> +	if (!prop || len < minlen)
> +		return NULL;
> +
> +	return prop;
> +}
> +
> +static uint32_t get_cells(const void *fdt, const char *name)
> +{
> +	const fdt32_t *prop = get_prop(fdt, "/", name, sizeof(fdt32_t));
> +
> +	if (!prop) {
> +		/* default */
> +		return 1;
> +	}
> +
> +	return fdt32_ld(prop);
> +}
> +
> +static uint64_t get_val(const fdt32_t *cells, uint32_t ncells)
> +{
> +	uint64_t r = 0;
> +
> +	r = fdt32_ld(cells);
> +	if (ncells > 1)
> +		r = (r << 32) | fdt32_ld(cells + 1);
> +
> +	return r;
> +}
> +
> +/*
> + * Check the start of physical memory
> + *
> + * Traditionally, the start address of physical memory is obtained by masking
> + * the program counter.  However, this does require that this address is a
> + * multiple of 128 MiB, precluding booting Linux on platforms where this
> + * requirement is not fulfilled.
> + * Hence validate the calculated address against the memory information in the
> + * DTB, and, if out-of-range, replace it by the real start address.
> + * To preserve backwards compatibility (systems reserving a block of memory
> + * at the start of physical memory, kdump, ...), the traditional method is
> + * always used if it yields a valid address.
> + *
> + * Return value: start address of physical memory to use
> + */
> +uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
> +{
> +	uint32_t addr_cells, size_cells, base;
> +	uint32_t fdt_mem_start = 0xffffffff;
> +	const fdt32_t *reg, *endp;
> +	uint64_t size, end;
> +	const char *type;
> +	int offset, len;
> +
> +	if (!fdt)
> +		return mem_start;
> +
> +	if (fdt_magic(fdt) != FDT_MAGIC)
> +		return mem_start;
> +
> +	/* There may be multiple cells on LPAE platforms */
> +	addr_cells = get_cells(fdt, "#address-cells");
> +	size_cells = get_cells(fdt, "#size-cells");
> +	if (addr_cells > 2 || size_cells > 2)
> +		return mem_start;
> +
> +	/* Walk all memory nodes and regions */
> +	for (offset = fdt_next_node(fdt, -1, NULL); offset >= 0;
> +	     offset = fdt_next_node(fdt, offset, NULL)) {
> +		type = fdt_getprop(fdt, offset, "device_type", NULL);
> +		if (!type || strcmp(type, "memory"))
> +			continue;
> +
> +		reg = fdt_getprop(fdt, offset, "linux,usable-memory", &len);
> +		if (!reg)
> +			reg = fdt_getprop(fdt, offset, "reg", &len);
> +		if (!reg)
> +			continue;
> +
> +		for (endp = reg + (len / sizeof(fdt32_t));
> +		     endp - reg >= addr_cells + size_cells;
> +		     reg += addr_cells + size_cells) {
> +			size = get_val(reg + addr_cells, size_cells);
> +			if (!size)
> +				continue;
> +
> +			if (addr_cells > 1 && fdt32_ld(reg)) {
> +				/* Outside 32-bit address space, skipping */
> +				continue;
> +			}
> +
> +			base = fdt32_ld(reg + addr_cells - 1);
> +			end = base + size;
> +			if (mem_start >= base && mem_start < end) {
> +				/* Calculated address is valid, use it */
> +				return mem_start;
> +			}
> +
> +			if (base < fdt_mem_start)
> +				fdt_mem_start = base;
> +		}
> +	}
> +
> +	if (fdt_mem_start == 0xffffffff) {
> +		/* No usable memory found, falling back to default */
> +		return mem_start;
> +	}
> +
> +	/*
> +	 * The calculated address is not usable.
> +	 * Use the lowest usable physical memory address from the DTB instead,
> +	 * and make sure this is a multiple of 2 MiB for phys/virt patching.
> +	 */
> +	return round_up(fdt_mem_start, SZ_2M);
> +}
> diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
> index d9cce7238a365081..1b6425df87e84e71 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -282,10 +282,36 @@ not_angel:
>  		 * are already placing their zImage in (eg) the top 64MB
>  		 * of this range.
>  		 */
> -		mov	r4, pc
> -		and	r4, r4, #0xf8000000
> +		mov	r0, pc
> +		and	r0, r0, #0xf8000000
> +#ifdef CONFIG_USE_OF
> +		adr	r1, LC1
> +#ifdef CONFIG_ARM_APPENDED_DTB
> +		/*
> +		 * Look for an appended DTB.  If found, we cannot use it to
> +		 * validate the calculated start of physical memory, as its
> +		 * memory nodes may need to be augmented by ATAGS stored at
> +		 * an offset from the same start of physical memory.
> +		 */
> +		ldr	r2, [r1, #4]	@ get &_edata
> +		add	r2, r2, r1	@ relocate it
> +		ldr	r2, [r2]	@ get DTB signature
> +		ldr	r3, =OF_DT_MAGIC
> +		cmp	r2, r3		@ do we have a DTB there?
> +		beq	1f		@ if yes, skip validation
> +#endif /* CONFIG_ARM_APPENDED_DTB */
> +
> +		/* Make sure we have some stack */
> +		ldr	sp, [r1]	@ get stack location
> +		add	sp, sp, r1	@ apply relocation
> +
> +		/* Validate calculated start against passed DTB */
> +		mov	r1, r8
> +		bl	fdt_check_mem_start
> +1:
> +#endif /* CONFIG_USE_OF */
>  		/* Determine final kernel image address. */
> -		add	r4, r4, #TEXT_OFFSET
> +		add	r4, r0, #TEXT_OFFSET
>  #else
>  		ldr	r4, =zreladdr
>  #endif
> -- 
> 2.25.1
> 
> 
