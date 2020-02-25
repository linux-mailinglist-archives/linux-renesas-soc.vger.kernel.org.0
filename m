Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97C4116BF86
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2020 12:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729317AbgBYLX5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Feb 2020 06:23:57 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40285 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728981AbgBYLX4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 06:23:56 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200225112355euoutp0110f3b1279def82d44fa8d4fb24e29ab3~2oXM-Y9xv3009830098euoutp018
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Feb 2020 11:23:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200225112355euoutp0110f3b1279def82d44fa8d4fb24e29ab3~2oXM-Y9xv3009830098euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582629835;
        bh=atqhp8WeChHbAQActEzaRe4WrCnFCL+vUzQP77yeMYU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=RR0FiCE8TLMw3ugeGqrPikJ63/luCXtlaQS9w1iDcptG4U6Q6WRlRhcngIyKZ/7Ex
         0IAGmd3ovPdPxyibQTH/f70mcQNnYh+1wAaNCAlnW4gnkGgiAfutemXWoQuNm9RmXh
         UDW0GLbffl/+fq16KChXqaLeT9HEyY7wUIpBMoR4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200225112355eucas1p23601e4b3736ff4bb2232ea6a4e809012~2oXMt_yu00861208612eucas1p2G;
        Tue, 25 Feb 2020 11:23:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id DE.77.60698.BC3055E5; Tue, 25
        Feb 2020 11:23:55 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c~2oXMW4bWm0510405104eucas1p1t;
        Tue, 25 Feb 2020 11:23:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200225112354eusmtrp2e10492927528cb96b3f6e4eb2f2905aa~2oXMWO6UO2085720857eusmtrp2q;
        Tue, 25 Feb 2020 11:23:54 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-d3-5e5503cbf3ea
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 23.41.08375.AC3055E5; Tue, 25
        Feb 2020 11:23:54 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200225112354eusmtip25ff54412f93e606865b23eb0d917868a~2oXLzOd0g0143701437eusmtip2a;
        Tue, 25 Feb 2020 11:23:54 +0000 (GMT)
Subject: Re: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
Date:   Tue, 25 Feb 2020 12:23:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200127140716.15673-1-geert+renesas@glider.be>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e1e7+6k6XUaHswKRgVW6syg20MrsLihSRRmBD5W3lRyKpuz
        LEjRsBpJ20SW06moUFlpmo/UNFviI8ucopgPIhSZ0TR8pZaW82r53+d8z/f3+54Dh8REzTYu
        ZHRsAiuPlcaICVu8umWh070DCwqVqMdweknbwqfzdRk4XVLTgNGGHC2iK0b6bOiq8Qkebcxq
        QHSe2UzQg5pMdEzA9PSZMObXohYxY213CEbz0Z15WZzMZKRNEMyDJQkz90GDM9MV284ILtoe
        iWBjohNZuadvuG2UbtYlXn3gercxnUhB6j0qJCCB2g+5dSpkZRH1GMFC4wUVsl3hGQSvR7p5
        XDGNoPxzK7b+Iit7Yq3xCEFR3iTiCguCpsxivtXlSPmDtn9u1eVEpfGgft60GoJRidDRMIxb
        maC8QGVREVYWUr5Q2DvAszJO7YT+UqONlTdTIZDz5B3OeRygPXt0hUlSQPlA/ZiE+3I71Fhy
        MY6dYWA0n8dNOsCHTPUtjv1geMqwpjvCt9ZKPseu8Kc2f3VOoNIQfO18zueK+wh6Uh8iznUY
        hjoXCWswRrlBWZ0nJx+HwioDZpWBsoN+iwM3gx1oq3VrshDupos49y7Qt5b+i33b1Y2pkVi/
        YTH9hm30G7bR/88tQHgJcmaVClkkq/COZa95KKQyhTI20uNynKwCrdxWx3Lr7CvU+PuSEVEk
        Em8SQsO5UJGNNFGRJDMiIDGxk9AfnQ0VCSOkSTdYeVyYXBnDKoxoC4mLnYXeheMhIipSmsBe
        Zdl4Vr7e5ZEClxRE/DzfMpZHVSQzJ38c2nuizFtjX/C9vD3e/LQos7wvqFnem2tKnpy6EvhF
        LX/26cVw7b6Zo47KGgNpDo5evndQlFrZFTSjtDulCzBgJdODQz5+s6ausGDzsH1pSli3pq1t
        /r1ua/X0G60l9bapKdAt3HVxKUC2w1kvlNyMO92SJcYVUVKv3ZhcIf0L7opCl1cDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsVy+t/xe7qnmEPjDHbM1LD4O+kYu8X86b0s
        Fqu272W2mDt7EqPFpsfXWC22vnzHZHFo6l5Gi3kvXrBZ3J44mdGB0+PytYvMHr9/TWL0eHai
        nc1j4lldj81L6j16m9+xefT/NfD4dmYii8fnTXIBnFF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
        ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GdO/ShVMMK+4dKiNrYFxgnYXIyeHhICJxNSZ
        75i6GLk4hASWMkr03zjEDJGQkTg5rYEVwhaW+HOtiw2i6DWjxJ9Zc9hAEsIC3hKTbnwD6xYR
        aGaS+N9yjgkkwSxQJrHk/wkwW0jARmL7773sIDabgKFE19susGZeATuJRVdvgdWwCKhK3Fh3
        CGybqECsxI2ZHUwQNYISJ2c+Yeli5ODgFLCV2P3MAGK8mcS8zQ+ZIWx5ie1v50DZ4hK3nsxn
        msAoNAtJ9ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYKRuO/Zz8w7G
        SxuDDzEKcDAq8fBK7A2OE2JNLCuuzD3EKMHBrCTC680YFCfEm5JYWZValB9fVJqTWnyI0RTo
        t4nMUqLJ+cAkklcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgdGl
        abLd06JrSd2Vbue9AgvX3nlx+8BVlWUse+0+ts07Y5C4jqt+z+aYmZ+ydLblOWx8kO300FMg
        tFt1F9MWDVMO+d4XZ7OK3B2sey5x3v+w/ttRAZ0H+3cVGLhtjFWf9eietHbHuvWMq3muWNl6
        nkzkmHx+scpJ/rSIh2+fb1Q8s+JBbqRzhokSS3FGoqEWc1FxIgCzddqq6gIAAA==
X-CMS-MailID: 20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c
References: <20200127140716.15673-1-geert+renesas@glider.be>
        <CGME20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c@eucas1p1.samsung.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 27.01.2020 15:07, Geert Uytterhoeven wrote:
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
> ---
> Against arm/for-next.

This patch landed recently in linux-next. It breaks legacy booting from 
the zImage + appended DT + cmdline/memory info provided via ATAGs. I 
will debug it further once I find some spare time. What I noticed so 
far, the cmdline/memory info is not read from the ATAGs, only the values 
provided via appended DT are used.

> Tested with the following configurations:
>    - zImage + DTB (r8a7791/koelsch),
>    - uImage + DTB (r8a73a4/ape6evm, r7s72100/rskrza1, r7s9210/rza2mevb),
>    - zImage with appended DTB (r8a7740/armadillo, sh73a0/kzm9g).
>
> v2:
>    - Use "cmp r0, #-1", instead of "cmn r0, #1",
>    - Add missing stack setup,
>    - Support appended DTBs.
>
> v1: https://lore.kernel.org/linux-arm-kernel/20200121192741.20597-1-geert+renesas@glider.be/
> ---
>   arch/arm/boot/compressed/Makefile            |  6 ++-
>   arch/arm/boot/compressed/fdt_get_mem_start.c | 52 ++++++++++++++++++++
>   arch/arm/boot/compressed/head.S              | 52 +++++++++++++++++++-
>   3 files changed, 108 insertions(+), 2 deletions(-)
>   create mode 100644 arch/arm/boot/compressed/fdt_get_mem_start.c
>
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index da599c3a11934332..bbfecd648a1a3b57 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -86,12 +86,15 @@ libfdt_objs	:= $(addsuffix .o, $(basename $(libfdt)))
>   $(addprefix $(obj)/,$(libfdt) $(libfdt_hdrs)): $(obj)/%: $(srctree)/scripts/dtc/libfdt/%
>   	$(call cmd,shipped)
>   
> -$(addprefix $(obj)/,$(libfdt_objs) atags_to_fdt.o): \
> +$(addprefix $(obj)/,$(libfdt_objs) atags_to_fdt.o fdt_get_mem_start.o): \
>   	$(addprefix $(obj)/,$(libfdt_hdrs))
>   
>   ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
>   OBJS	+= $(libfdt_objs) atags_to_fdt.o
>   endif
> +ifeq ($(CONFIG_USE_OF),y)
> +OBJS	+= $(libfdt_objs) fdt_get_mem_start.o
> +endif
>   
>   targets       := vmlinux vmlinux.lds piggy_data piggy.o \
>   		 lib1funcs.o ashldi3.o bswapsdi2.o \
> @@ -116,6 +119,7 @@ CFLAGS_fdt.o := $(nossp-flags-y)
>   CFLAGS_fdt_ro.o := $(nossp-flags-y)
>   CFLAGS_fdt_rw.o := $(nossp-flags-y)
>   CFLAGS_fdt_wip.o := $(nossp-flags-y)
> +CFLAGS_fdt_get_mem_start.o := $(nossp-flags-y)
>   
>   ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin -I$(obj)
>   asflags-y := -DZIMAGE
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
> index 927f5dc413d7dff2..aa2d7de2ddc86fa8 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -235,8 +235,56 @@ not_angel:
>   		.text
>   
>   #ifdef CONFIG_AUTO_ZRELADDR
> +#ifdef CONFIG_USE_OF
>   		/*
> -		 * Find the start of physical memory.  As we are executing
> +		 * Find the start of physical memory.
> +		 * Try the DTB first, if available.
> +		 */
> +		adr	r0, LC0
> +		ldr	r1, [r0]	@ get absolute LC0
> +		ldr	sp, [r0, #28]	@ get stack location
> +		sub	r1, r0, r1	@ compute relocation offset
> +		add	sp, sp, r1	@ apply relocation
> +
> +#ifdef CONFIG_ARM_APPENDED_DTB
> +		/*
> +		 * Look for an appended DTB. If found, use it and
> +		 * move stack away from it.
> +		 */
> +		ldr	r6, [r0, #12]	@ get &_edata
> +		add	r6, r6, r1	@ relocate it
> +		ldmia	r6, {r0, r5}	@ get DTB signature and size
> +#ifndef __ARMEB__
> +		ldr	r1, =0xedfe0dd0	@ sig is 0xd00dfeed big endian
> +		/* convert DTB size to little endian */
> +		eor	r2, r5, r5, ror #16
> +		bic	r2, r2, #0x00ff0000
> +		mov	r5, r5, ror #8
> +		eor	r5, r5, r2, lsr #8
> +#else
> +		ldr	r1, =0xd00dfeed
> +#endif
> +		cmp	r0, r1		@ do we have a DTB there?
> +		bne	1f
> +
> +		mov	r8, r6		@ use it if so
> +		/* preserve 64-bit alignment */
> +		add	r5, r5, #7
> +		bic	r5, r5, #7
> +		add	sp, sp, r5	@ and move stack above it
> +
> +1:
> +#endif /* CONFIG_ARM_APPENDED_DTB */
> +
> +		mov	r0, r8
> +		bl	fdt_get_mem_start
> +		mov	r4, r0
> +		cmp	r0, #-1
> +		bne	1f
> +#endif /* CONFIG_USE_OF */
> +
> +		/*
> +		 * Fall back to the traditional method.  As we are executing
>   		 * without the MMU on, we are in the physical address space.
>   		 * We just need to get rid of any offset by aligning the
>   		 * address.
> @@ -254,6 +302,8 @@ not_angel:
>   		 */
>   		mov	r4, pc
>   		and	r4, r4, #0xf8000000
> +
> +1:
>   		/* Determine final kernel image address. */
>   		add	r4, r4, #TEXT_OFFSET
>   #else

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

