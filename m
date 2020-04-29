Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C121BD718
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2020 10:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgD2IVc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Apr 2020 04:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726625AbgD2IVb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Apr 2020 04:21:31 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5D9C03C1AE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2020 01:21:31 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:182a:142e:a95f:66c2])
        by laurent.telenet-ops.be with bizsmtp
        id YYMN2200C0w8ZL601YMNip; Wed, 29 Apr 2020 10:21:28 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jThy6-0005bT-4l; Wed, 29 Apr 2020 10:21:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jThy6-0004FA-1N; Wed, 29 Apr 2020 10:21:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v6] ARM: boot: Obtain start of physical memory from DTB
Date:   Wed, 29 Apr 2020 10:21:20 +0200
Message-Id: <20200429082120.16259-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently, the start address of physical memory is obtained by masking
the program counter with a fixed mask of 0xf8000000.  This mask value
was chosen as a balance between the requirements of different platforms.
However, this does require that the start address of physical memory is
a multiple of 128 MiB, precluding booting Linux on platforms where this
requirement is not fulfilled.

Fix this limitation by obtaining the start address from the DTB instead,
if available (either explicitly passed, or appended to the kernel).
Fall back to the traditional method when needed.

This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
i.e. not at a multiple of 128 MiB.

Suggested-by: Nicolas Pitre <nico@fluxnic.net>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
---
This depends on "[PATCH v5] ARM: decompressor: simplify libfdt builds"
(https://lore.kernel.org/r/20200422130853.1907809-1-masahiroy@kernel.org)

v6:
  - Rebase on top of "[PATCH v5] ARM: decompressor: simplify libfdt
    builds",
  - Include <linux/libfdt.h> instead of <libfdt.h>,

v5:
  - Add Tested-by, Reviewed-by,
  - Round up start of memory to satisfy 16 MiB alignment rule,

v4:
  - Fix stack location after commit 184bf653a7a452c1 ("ARM:
    decompressor: factor out routine to obtain the inflated image
    size"),

v3:
  - Add Reviewed-by,
  - Fix ATAGs with appended DTB,
  - Add Tested-by,

v2:
  - Use "cmp r0, #-1", instead of "cmn r0, #1",
  - Add missing stack setup,
  - Support appended DTB.
---
 arch/arm/boot/compressed/Makefile            |  5 +-
 arch/arm/boot/compressed/fdt_get_mem_start.c | 56 ++++++++++++++++++++
 arch/arm/boot/compressed/head.S              | 54 ++++++++++++++++++-
 3 files changed, 113 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/compressed/fdt_get_mem_start.c

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 00602a6fba04733f..c873d3882375f5e5 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -81,11 +81,14 @@ libfdt_objs := fdt_rw.o fdt_ro.o fdt_wip.o fdt.o
 ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
 OBJS	+= $(libfdt_objs) atags_to_fdt.o
 endif
+ifeq ($(CONFIG_USE_OF),y)
+OBJS	+= $(libfdt_objs) fdt_get_mem_start.o
+endif
 
 # -fstack-protector-strong triggers protection checks in this code,
 # but it is being used too early to link to meaningful stack_chk logic.
 nossp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
-$(foreach o, $(libfdt_objs) atags_to_fdt.o, \
+$(foreach o, $(libfdt_objs) atags_to_fdt.o fdt_get_mem_start.o, \
 	$(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt $(nossp-flags-y)))
 
 # These were previously generated C files. When you are building the kernel
diff --git a/arch/arm/boot/compressed/fdt_get_mem_start.c b/arch/arm/boot/compressed/fdt_get_mem_start.c
new file mode 100644
index 0000000000000000..ae71fde731b869d7
--- /dev/null
+++ b/arch/arm/boot/compressed/fdt_get_mem_start.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/kernel.h>
+#include <linux/libfdt.h>
+#include <linux/sizes.h>
+
+static const void *getprop(const void *fdt, const char *node_path,
+			   const char *property)
+{
+	int offset = fdt_path_offset(fdt, node_path);
+
+	if (offset == -FDT_ERR_NOTFOUND)
+		return NULL;
+
+	return fdt_getprop(fdt, offset, property, NULL);
+}
+
+static uint32_t get_addr_size(const void *fdt)
+{
+	const __be32 *addr_len = getprop(fdt, "/", "#address-cells");
+
+	if (!addr_len) {
+		/* default */
+		return 1;
+	}
+
+	return fdt32_to_cpu(*addr_len);
+}
+
+/*
+ * Get the start of physical memory
+ */
+
+unsigned long fdt_get_mem_start(const void *fdt)
+{
+	uint32_t addr_size, mem_start;
+	const __be32 *memory;
+
+	if (!fdt)
+		return -1;
+
+	if (*(__be32 *)fdt != cpu_to_fdt32(FDT_MAGIC))
+		return -1;
+
+	/* Find the first memory node */
+	memory = getprop(fdt, "/memory", "reg");
+	if (!memory)
+		return -1;
+
+	/* There may be multiple cells on LPAE platforms */
+	addr_size = get_addr_size(fdt);
+
+	mem_start = fdt32_to_cpu(memory[addr_size - 1]);
+	/* Must be a multiple of 16 MiB for phys/virt patching */
+	return round_up(mem_start, SZ_16M);
+}
diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index e8e1c866e413a287..1d7c86624b3eeddc 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -254,8 +254,58 @@ not_angel:
 		.text
 
 #ifdef CONFIG_AUTO_ZRELADDR
+#ifdef CONFIG_USE_OF
 		/*
-		 * Find the start of physical memory.  As we are executing
+		 * Find the start of physical memory.
+		 * Try the DTB first, if available.
+		 */
+		adr	r0, LC0
+		ldr	r1, [r0]	@ get absolute LC0
+		ldr	sp, [r0, #24]	@ get stack location
+		sub	r1, r0, r1	@ compute relocation offset
+		add	sp, sp, r1	@ apply relocation
+
+#ifdef CONFIG_ARM_APPENDED_DTB
+		/*
+		 * Look for an appended DTB. If found, use it and
+		 * move stack away from it.
+		 */
+		ldr	r6, [r0, #12]	@ get &_edata
+		add	r6, r6, r1	@ relocate it
+		ldmia	r6, {r0, r5}	@ get DTB signature and size
+#ifndef __ARMEB__
+		ldr	r1, =0xedfe0dd0	@ sig is 0xd00dfeed big endian
+		/* convert DTB size to little endian */
+		eor	r2, r5, r5, ror #16
+		bic	r2, r2, #0x00ff0000
+		mov	r5, r5, ror #8
+		eor	r5, r5, r2, lsr #8
+#else
+		ldr	r1, =0xd00dfeed
+#endif
+		cmp	r0, r1		@ do we have a DTB there?
+		bne	1f
+
+		/* preserve 64-bit alignment */
+		add	r5, r5, #7
+		bic	r5, r5, #7
+		add	sp, sp, r5	@ if so, move stack above DTB
+		mov	r0, r6		@ and extract memory start from DTB
+		b	2f
+
+1:
+#endif /* CONFIG_ARM_APPENDED_DTB */
+
+		mov	r0, r8
+2:
+		bl	fdt_get_mem_start
+		mov	r4, r0
+		cmp	r0, #-1
+		bne	1f
+#endif /* CONFIG_USE_OF */
+
+		/*
+		 * Fall back to the traditional method.  As we are executing
 		 * without the MMU on, we are in the physical address space.
 		 * We just need to get rid of any offset by aligning the
 		 * address.
@@ -273,6 +323,8 @@ not_angel:
 		 */
 		mov	r4, pc
 		and	r4, r4, #0xf8000000
+
+1:
 		/* Determine final kernel image address. */
 		add	r4, r4, #TEXT_OFFSET
 #else
-- 
2.17.1

