Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB952ECDFD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Jan 2021 11:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbhAGKg4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Jan 2021 05:36:56 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38711 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbhAGKgz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jan 2021 05:36:55 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210107103612euoutp02a1fb8022ee88ef8c12be23da5b99fe55~X7NCrxMLT0505205052euoutp02I
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Jan 2021 10:36:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210107103612euoutp02a1fb8022ee88ef8c12be23da5b99fe55~X7NCrxMLT0505205052euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1610015772;
        bh=wbJ/vbrNHmhwHSTNavymCrd+oN/Z41ZCrflhtjtkEGY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=QL0nNuGCtI+tO3p1QCbxTmHps+4mQuI/lvLtEuALo17J41TLO7Fx8AykWjDpofXeT
         DjGdTn9Zwisczwyzc+dRlI0n5rzLRuZKknlWSb2ZH6xGggVHcdXPVCHXofiJD3jqlV
         VZb/yNkddublrtvUTO5A363vxOtr46WTT+d+G37M=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210107103612eucas1p1396257f02a09e1a8236c3c105b29c982~X7NCIgpWT2789627896eucas1p15;
        Thu,  7 Jan 2021 10:36:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 24.6C.45488.C14E6FF5; Thu,  7
        Jan 2021 10:36:12 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210107103611eucas1p16d38f3c6e48a3d9f5d2dd4559ef12cdf~X7NBtaHV-2598725987eucas1p15;
        Thu,  7 Jan 2021 10:36:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210107103611eusmtrp11b7e28bf14d36a04ec544fcdeef23b1e~X7NBs2gsz2008920089eusmtrp1A;
        Thu,  7 Jan 2021 10:36:11 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-00-5ff6e41c6f87
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F0.2D.21957.B14E6FF5; Thu,  7
        Jan 2021 10:36:11 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210107103610eusmtip12f87d0fccb06fcea4e06d3c6416f1873~X7NAyyjDw0445504455eusmtip1A;
        Thu,  7 Jan 2021 10:36:10 +0000 (GMT)
Subject: Re: [PATCH v12] ARM: uncompress: Validate start of physical memory
 against passed DTB
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <092e7ed2-da95-fa4a-9949-1a23388a7b67@samsung.com>
Date:   Thu, 7 Jan 2021 11:36:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104130111.1269694-1-geert+renesas@glider.be>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHKsWRmVeSWpSXmKPExsWy7djPc7oyT77FG/x8zWPx88t7Rou/k46x
        W8yf3stisfrjY0aLVdv3MlvMnT2J0eLmoRWMFlP+LGey2PT4GqvF5V1z2Cy2vnzHZHFo6l5G
        i3kvXrBZ/Lu2kcXi9sTJjA78HpevXWT2+P1rEqPHsxPtbB4Tz+p67Jx1l91j06pONo871/aw
        eWxeUu/R2/yOzaP/r4HHtzMTWTz6tqxi9Pi8SS6AN4rLJiU1J7MstUjfLoEr4++uXcwFl6Ir
        5h2YzdLAeNyti5GTQ0LARGLF7YUsXYxcHEICKxglfv/7xgzhfGGUeHFzBTuE85lRYseteaww
        LYu+34dqWc4o8fn0GUYI5yOjxPz/O5hBqoQFEiS+bjwKViUi8I5R4t+9BiYQh1ngFZPE1hdb
        mECq2AQMJbredrGB2LwCdhKn7x9gBLFZBFQkXm/eA1YjKpAkcXxfNzNEjaDEyZlPWEBsTgF7
        ie/zvoDVMwvIS2x/O4cZwhaXuPVkPtgyCYFLnBK/pl2DOtxF4sStmYwQtrDEq+Nb2CFsGYnT
        k3tYIBqaGSUenlvLDuH0MEpcbpoB1WEtcefcL6BTOYBWaEqs36UPEXaUaOvdzAgSlhDgk7jx
        VhDiCD6JSdumM0OEeSU62oQgqtUkZh1fB7f24IVLzBMYlWYheW0WkndmIXlnFsLeBYwsqxjF
        U0uLc9NTi43zUsv1ihNzi0vz0vWS83M3MQKT5Ol/x7/uYFzx6qPeIUYmDsZDjBIczEoivBbH
        vsQL8aYkVlalFuXHF5XmpBYfYpTmYFES5921dU28kEB6YklqdmpqQWoRTJaJg1OqgWkj37LJ
        MRKJBe9/LyrYuttf6VLOlGla5YIxESvWsjz6El9XI736VXaegGf5r4rzlu6xmXp7H5w2c52/
        XmupglXJ72WZp1J1iiTdJyxcsMpiruO/FW8+5K6ZP/vAropbU+zviLS37Syv/Fipc29Pgriq
        R/ih1mP9spUTLr9+PnnbtYnNtpeOiIWcM2x2OX82+0kjdxh/wM0VPszTl/6rZLgx/55JZknj
        uag/S77sMOaPYN+kWJ/w1rpRn32WV/HEq9/V1/qp/Z9dvCqg9+I8CR+hmbFXjjBkhrIbzv7a
        vfPKxaB1WQH8iWfFznxwfeLY6H9qScX7+meagu8b3iWwKfUG1goYz3EIKq0O9tqzwkmJpTgj
        0VCLuag4EQBzF+wvAQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRmVeSWpSXmKPExsVy+t/xu7rST77FG9y5pGXx88t7Rou/k46x
        W8yf3stisfrjY0aLVdv3MlvMnT2J0eLmoRWMFlP+LGey2PT4GqvF5V1z2Cy2vnzHZHFo6l5G
        i3kvXrBZ/Lu2kcXi9sTJjA78HpevXWT2+P1rEqPHsxPtbB4Tz+p67Jx1l91j06pONo871/aw
        eWxeUu/R2/yOzaP/r4HHtzMTWTz6tqxi9Pi8SS6AN0rPpii/tCRVISO/uMRWKdrQwkjP0NJC
        z8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4++uXcwFl6Ir5h2YzdLAeNyti5GTQ0LARGLR
        9/ssXYxcHEICSxklZn5bzQSRkJE4Oa2BFcIWlvhzrYsNoug9o8TPtqtgCWGBBImvG4+CdYsI
        vGOUuL2iD8xhFnjDJHFnyz92iJZJjBLXDv5kAWlhEzCU6HoLMouTg1fATuL0/QOMIDaLgIrE
        6817gHZzcIgKJEksfusEUSIocXLmE7BWTgF7ie/zvoCVMwuYSczb/JAZwpaX2P52DpQtLnHr
        yXymCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIEpoRtx35u
        3sE479VHvUOMTByMhxglOJiVRHgtjn2JF+JNSaysSi3Kjy8qzUktPsRoCvTORGYp0eR8YFLK
        K4k3NDMwNTQxszQwtTQzVhLn3Tp3TbyQQHpiSWp2ampBahFMHxMHp1QD0/zG0ldz7hk+Sb1z
        K006c8JXjsoZ+x5tcZ3g6r0uNPqf2MLmSVEvpiVM/qVytXLPRZ32G898FGamZ3y8dNdxsm1r
        yl83OSf5hgm5dZWpz2v3dm98O3X/OrmPMQLzJT+bZzRN2qq4Nllt7kc+t7CIRU7T7yRJ10lp
        pb46ltbkuMxrzlcnz6Pbv2pJ9X80vMy0IUN0Vf4Expz3TU9t0ybUOG6JU1Cs78jIkni6+ZpW
        xYX5K892nJP0aJDufMO9UMfjw/uPh+M8vhh6cKWUTNBfrZN5riQ+2fR4wsX54jFvXOwSKnX3
        2KbVXp64wPeLGl/wxPebckr2qHrVfHzgFKyzvtf4XJCA1RQ7A7OaKb53lFiKMxINtZiLihMB
        ACB1t5IDAAA=
X-CMS-MailID: 20210107103611eucas1p16d38f3c6e48a3d9f5d2dd4559ef12cdf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210104130133eucas1p2d4e75b0dfd3afca7af8952ff09568070
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210104130133eucas1p2d4e75b0dfd3afca7af8952ff09568070
References: <CGME20210104130133eucas1p2d4e75b0dfd3afca7af8952ff09568070@eucas1p2.samsung.com>
        <20210104130111.1269694-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 04.01.2021 14:01, Geert Uytterhoeven wrote:
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
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Acked-by: Nicolas Pitre <nico@fluxnic.net>

I've checked all of my arm 32bit test systems and they still boot fine 
with this patch. Feel free to add my:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

although I didn't test exactly the new features added by it.

> ---
> Submitted to RMK's patch tracker.
>
> v12:
>    - Drop unneeded initialization of r in get_val(),
>
> v11:
>    - Add Reviewed-by, Acked-by,
>    - Document GOT fixup caveat,
>
> v10:
>    - Update for commit 9443076e4330a14a ("ARM: p2v: reduce p2v alignment
>      requirement to 2 MiB"),
>    - Use OF_DT_MAGIC macro,
>    - Rename fdt_get_mem_start() to fdt_check_mem_start(),
>    - Skip validation if there is an appended DTB,
>    - Pass mem_start to fdt_check_mem_start() to streamline code,
>    - Optimize register allocation,
>    - Update CONFIG_AUTO_ZRELADDR help text,
>    - Check all memory nodes and ranges (not just the first one), and
>      "linux,usable-memory", similar to early_init_dt_scan_memory(),
>    - Drop Reviewed-by, Tested-by tags,
>
> v9:
>    - Add minlen parameter to getprop(), for better validation of
>      memory properties,
>    - Only use start of memory from the DTB if masking would yield an
>      out-of-range address, to fix kdump, as suggested by Ard.
>
> v8:
>    - Rebase on top of commit 893ab00439a45513 ("kbuild: remove cc-option
>      test of -fno-stack-protector"),
>
> v7:
>    - Rebase on top of commit 161e04a5bae58a65 ("ARM: decompressor: split
>      off _edata and stack base into separate object"),
>
> v6:
>    - Rebase on top of commit 7ae4a78daacf240a ("ARM: 8969/1:
>      decompressor: simplify libfdt builds"),
>    - Include <linux/libfdt.h> instead of <libfdt.h>,
>
> v5:
>    - Add Tested-by, Reviewed-by,
>    - Round up start of memory to satisfy 16 MiB alignment rule,
>
> v4:
>    - Fix stack location after commit 184bf653a7a452c1 ("ARM:
>      decompressor: factor out routine to obtain the inflated image
>      size"),
>
> v3:
>    - Add Reviewed-by,
>    - Fix ATAGs with appended DTB,
>    - Add Tested-by,
>
> v2:
>    - Use "cmp r0, #-1", instead of "cmn r0, #1",
>    - Add missing stack setup,
>    - Support appended DTB.
> ---
>   arch/arm/Kconfig                              |   7 +-
>   arch/arm/boot/compressed/Makefile             |   5 +-
>   .../arm/boot/compressed/fdt_check_mem_start.c | 131 ++++++++++++++++++
>   arch/arm/boot/compressed/head.S               |  36 ++++-
>   4 files changed, 172 insertions(+), 7 deletions(-)
>   create mode 100644 arch/arm/boot/compressed/fdt_check_mem_start.c
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 138248999df7421e..9860057775ee72a9 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1875,9 +1875,10 @@ config AUTO_ZRELADDR
>   	help
>   	  ZRELADDR is the physical address where the decompressed kernel
>   	  image will be placed. If AUTO_ZRELADDR is selected, the address
> -	  will be determined at run-time by masking the current IP with
> -	  0xf8000000. This assumes the zImage being placed in the first 128MB
> -	  from start of memory.
> +	  will be determined at run-time, either by masking the current IP
> +	  with 0xf8000000, or, if invalid, from the DTB passed in r2.
> +	  This assumes the zImage being placed in the first 128MB from
> +	  start of memory.
>   
>   config EFI_STUB
>   	bool
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index fb521efcc6c20a4f..fd94e27ba4fa3d12 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -87,10 +87,13 @@ libfdt_objs := fdt_rw.o fdt_ro.o fdt_wip.o fdt.o
>   ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
>   OBJS	+= $(libfdt_objs) atags_to_fdt.o
>   endif
> +ifeq ($(CONFIG_USE_OF),y)
> +OBJS	+= $(libfdt_objs) fdt_check_mem_start.o
> +endif
>   
>   # -fstack-protector-strong triggers protection checks in this code,
>   # but it is being used too early to link to meaningful stack_chk logic.
> -$(foreach o, $(libfdt_objs) atags_to_fdt.o, \
> +$(foreach o, $(libfdt_objs) atags_to_fdt.o fdt_check_mem_start.o, \
>   	$(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt -fno-stack-protector))
>   
>   # These were previously generated C files. When you are building the kernel
> diff --git a/arch/arm/boot/compressed/fdt_check_mem_start.c b/arch/arm/boot/compressed/fdt_check_mem_start.c
> new file mode 100644
> index 0000000000000000..62450d824c3ca180
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
> +	uint64_t r;
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
> index d9cce7238a365081..04f6b7bb7c43b66c 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -282,10 +282,40 @@ not_angel:
>   		 * are already placing their zImage in (eg) the top 64MB
>   		 * of this range.
>   		 */
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
> +		/*
> +		 * Make sure we have some stack before calling C code.
> +		 * No GOT fixup has occurred yet, but none of the code we're
> +		 * about to call uses any global variables.
> +		 */
> +		ldr	sp, [r1]	@ get stack location
> +		add	sp, sp, r1	@ apply relocation
> +
> +		/* Validate calculated start against passed DTB */
> +		mov	r1, r8
> +		bl	fdt_check_mem_start
> +1:
> +#endif /* CONFIG_USE_OF */
>   		/* Determine final kernel image address. */
> -		add	r4, r4, #TEXT_OFFSET
> +		add	r4, r0, #TEXT_OFFSET
>   #else
>   		ldr	r4, =zreladdr
>   #endif

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

