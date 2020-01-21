Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0A814473E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2020 23:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbgAUWZC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Jan 2020 17:25:02 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:58050 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728760AbgAUWZC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jan 2020 17:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7urlhm3YYIAvJLoxdAE4aRzk6SajZZfeX8I+FK3EC7Q=; b=mk/ar71y/mBHSuWO8hz/GY+s9
        7y56He1cSaia9cqtkjwHyhOAWbLW7+jMcWHp4RRzAyvN5So+0B2XwGCc3VDesWVZiFzzOTLFkkz2I
        BP1NZ36o0tisNdknMCmFWsV7N3n1dRNgusJtifLi5Y9rzayiws72pe9PZ6y+dAJqtDHDcq05AFFGO
        Df5cP39BWuBzYY6b/hQhHZr4MNTpn0uihmwOHhDpJalwMp3DlTdOoc3S9VItL7xRgCuXzkjCC5ol7
        uK7wAVftssofLxVhi60xjvfC2ZxqgexwR70rJPvFUGVfsqO9NhE+HkMxkoRGlOixSNrYPmB4tVVjo
        XXAf5O5dw==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:37368)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iu1wu-0007Zc-0k; Tue, 21 Jan 2020 22:24:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iu1wo-0004Bz-06; Tue, 21 Jan 2020 22:24:34 +0000
Date:   Tue, 21 Jan 2020 22:24:33 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: boot: Obtain start of physical memory from DTB
Message-ID: <20200121222433.GK25745@shell.armlinux.org.uk>
References: <20200121192741.20597-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121192741.20597-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 21, 2020 at 08:27:41PM +0100, Geert Uytterhoeven wrote:
> Currently, the start address of physical memory is obtained by masking
> the program counter with a fixed mask of 0xf8000000.  This mask value
> was chosen as a balance between the requirements of different platforms.
> However, this does require that the start address of physical memory is
> a multiple of 128 MiB, precluding booting Linux on platforms where this
> requirement is not fulfilled.
> 
> Fix this limitation by obtaining the start address from the passed DTB
> instead, if available.  Note that for now this is limited to DTBs passed
> explicitly by the boot loader.  DTBs appended to a zImage or uImage are
> not inspected.  Fall back to the traditional method when needed.
> 
> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> i.e. not at a multiple of 128 MiB.
> 
> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against arm/for-next.
> 
> Tested with the following configurations:
>   - zImage + DTB (r8a7791/koelsch): physical memory start address
>     obtained from DT,
>   - uImage + DTB (r8a73a4/ape6evm, r7s72100/rskrza1, r7s9210/rza2mevb):
>     physical memory start address obtained from DT,
>   - zImage with appended DTB (r8a7740/armadillo, sh73a0/kzm9g): physical
>     memory start address obtained by masking, as before.
> 
> An appended DTB is currently processed after the start of physical
> memory is obtained.  Hence obtaining that address from an appended DTB
> requires moving/copying that copy.  Given the complexity w.r.t. the
> "restart" label, and the lack of a need for me to support this, I didn't
> implement that part.
> ---
>  arch/arm/boot/compressed/Makefile            |  6 ++-
>  arch/arm/boot/compressed/fdt_get_mem_start.c | 52 ++++++++++++++++++++
>  arch/arm/boot/compressed/head.S              | 16 +++++-
>  3 files changed, 72 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/compressed/fdt_get_mem_start.c
> 
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index da599c3a11934332..bbfecd648a1a3b57 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -86,12 +86,15 @@ libfdt_objs	:= $(addsuffix .o, $(basename $(libfdt)))
>  $(addprefix $(obj)/,$(libfdt) $(libfdt_hdrs)): $(obj)/%: $(srctree)/scripts/dtc/libfdt/%
>  	$(call cmd,shipped)
>  
> -$(addprefix $(obj)/,$(libfdt_objs) atags_to_fdt.o): \
> +$(addprefix $(obj)/,$(libfdt_objs) atags_to_fdt.o fdt_get_mem_start.o): \
>  	$(addprefix $(obj)/,$(libfdt_hdrs))
>  
>  ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
>  OBJS	+= $(libfdt_objs) atags_to_fdt.o
>  endif
> +ifeq ($(CONFIG_USE_OF),y)
> +OBJS	+= $(libfdt_objs) fdt_get_mem_start.o
> +endif
>  
>  targets       := vmlinux vmlinux.lds piggy_data piggy.o \
>  		 lib1funcs.o ashldi3.o bswapsdi2.o \
> @@ -116,6 +119,7 @@ CFLAGS_fdt.o := $(nossp-flags-y)
>  CFLAGS_fdt_ro.o := $(nossp-flags-y)
>  CFLAGS_fdt_rw.o := $(nossp-flags-y)
>  CFLAGS_fdt_wip.o := $(nossp-flags-y)
> +CFLAGS_fdt_get_mem_start.o := $(nossp-flags-y)
>  
>  ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin -I$(obj)
>  asflags-y := -DZIMAGE
> diff --git a/arch/arm/boot/compressed/fdt_get_mem_start.c b/arch/arm/boot/compressed/fdt_get_mem_start.c
> new file mode 100644
> index 0000000000000000..2c5ac47f656317ee
> --- /dev/null
> +++ b/arch/arm/boot/compressed/fdt_get_mem_start.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <libfdt.h>
> +
> +static const void *getprop(const void *fdt, const char *node_path,
> +			   const char *property)
> +{
> +	int offset = fdt_path_offset(fdt, node_path);
> +
> +	if (offset == -FDT_ERR_NOTFOUND)
> +		return NULL;
> +
> +	return fdt_getprop(fdt, offset, property, NULL);
> +}
> +
> +static uint32_t get_addr_size(const void *fdt)
> +{
> +	const __be32 *addr_len = getprop(fdt, "/", "#address-cells");
> +
> +	if (!addr_len) {
> +		/* default */
> +		return 1;
> +	}
> +
> +	return fdt32_to_cpu(*addr_len);
> +}
> +
> +/*
> + * Get the start of physical memory
> + */
> +
> +unsigned long fdt_get_mem_start(const void *fdt)
> +{
> +	const __be32 *memory;
> +	uint32_t addr_size;
> +
> +	if (!fdt)
> +		return -1;
> +
> +	if (*(__be32 *)fdt != cpu_to_fdt32(FDT_MAGIC))
> +		return -1;
> +
> +	/* Find the first memory node */
> +	memory = getprop(fdt, "/memory", "reg");
> +	if (!memory)
> +		return -1;
> +
> +	/* There may be multiple cells on LPAE platforms */
> +	addr_size = get_addr_size(fdt);
> +
> +	return fdt32_to_cpu(memory[addr_size - 1]);
> +}
> diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
> index 927f5dc413d7dff2..cb4e6a84b156c204 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -235,8 +235,20 @@ not_angel:
>  		.text
>  
>  #ifdef CONFIG_AUTO_ZRELADDR
> +#ifdef CONFIG_USE_OF
>  		/*
> -		 * Find the start of physical memory.  As we are executing
> +		 * Find the start of physical memory.
> +		 * Try the passed DTB first, if available.
> +		 */
> +		mov	r0, r8
> +		bl	fdt_get_mem_start

NAK.  You don't have a stack setup here.  The fact this works for you
is merely due to "sp" happening to be pointing somewhere sane, but
there is no such requirement.  Therefore, this is fragile.

> +		mov	r4, r0
> +		cmn	r0, #1
> +		bne	1f
> +#endif
> +
> +		/*
> +		 * Fall back to the traditional method.  As we are executing
>  		 * without the MMU on, we are in the physical address space.
>  		 * We just need to get rid of any offset by aligning the
>  		 * address.
> @@ -254,6 +266,8 @@ not_angel:
>  		 */
>  		mov	r4, pc
>  		and	r4, r4, #0xf8000000
> +
> +1:
>  		/* Determine final kernel image address. */
>  		add	r4, r4, #TEXT_OFFSET
>  #else
> -- 
> 2.17.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
