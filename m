Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24BA114A5AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2020 15:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgA0OHV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Jan 2020 09:07:21 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:34708 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgA0OHV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Jan 2020 09:07:21 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id vS7J210055USYZQ01S7JqT; Mon, 27 Jan 2020 15:07:18 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iw52s-0000ua-3G; Mon, 27 Jan 2020 15:07:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iw52s-00045X-0p; Mon, 27 Jan 2020 15:07:18 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
Date:   Mon, 27 Jan 2020 15:07:16 +0100
Message-Id: <20200127140716.15673-1-geert+renesas@glider.be>
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
---
Against arm/for-next.

Tested with the following configurations:
  - zImage + DTB (r8a7791/koelsch),
  - uImage + DTB (r8a73a4/ape6evm, r7s72100/rskrza1, r7s9210/rza2mevb),
  - zImage with appended DTB (r8a7740/armadillo, sh73a0/kzm9g).

v2:
  - Use "cmp r0, #-1", instead of "cmn r0, #1",
  - Add missing stack setup,
  - Support appended DTBs.

v1: https://lore.kernel.org/linux-arm-kernel/20200121192741.20597-1-geert+renesas@glider.be/
---
 arch/arm/boot/compressed/Makefile            |  6 ++-
 arch/arm/boot/compressed/fdt_get_mem_start.c | 52 ++++++++++++++++++++
 arch/arm/boot/compressed/head.S              | 52 +++++++++++++++++++-
 3 files changed, 108 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/compressed/fdt_get_mem_start.c

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index da599c3a11934332..bbfecd648a1a3b57 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -86,12 +86,15 @@ libfdt_objs	:= $(addsuffix .o, $(basename $(libfdt)))
 $(addprefix $(obj)/,$(libfdt) $(libfdt_hdrs)): $(obj)/%: $(srctree)/scripts/dtc/libfdt/%
 	$(call cmd,shipped)
 
-$(addprefix $(obj)/,$(libfdt_objs) atags_to_fdt.o): \
+$(addprefix $(obj)/,$(libfdt_objs) atags_to_fdt.o fdt_get_mem_start.o): \
 	$(addprefix $(obj)/,$(libfdt_hdrs))
 
 ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
 OBJS	+= $(libfdt_objs) atags_to_fdt.o
 endif
+ifeq ($(CONFIG_USE_OF),y)
+OBJS	+= $(libfdt_objs) fdt_get_mem_start.o
+endif
 
 targets       := vmlinux vmlinux.lds piggy_data piggy.o \
 		 lib1funcs.o ashldi3.o bswapsdi2.o \
@@ -116,6 +119,7 @@ CFLAGS_fdt.o := $(nossp-flags-y)
 CFLAGS_fdt_ro.o := $(nossp-flags-y)
 CFLAGS_fdt_rw.o := $(nossp-flags-y)
 CFLAGS_fdt_wip.o := $(nossp-flags-y)
+CFLAGS_fdt_get_mem_start.o := $(nossp-flags-y)
 
 ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin -I$(obj)
 asflags-y := -DZIMAGE
diff --git a/arch/arm/boot/compressed/fdt_get_mem_start.c b/arch/arm/boot/compressed/fdt_get_mem_start.c
new file mode 100644
index 0000000000000000..2c5ac47f656317ee
--- /dev/null
+++ b/arch/arm/boot/compressed/fdt_get_mem_start.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <libfdt.h>
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
+	const __be32 *memory;
+	uint32_t addr_size;
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
+	return fdt32_to_cpu(memory[addr_size - 1]);
+}
diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 927f5dc413d7dff2..aa2d7de2ddc86fa8 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -235,8 +235,56 @@ not_angel:
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
+		ldr	sp, [r0, #28]	@ get stack location
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
+		mov	r8, r6		@ use it if so
+		/* preserve 64-bit alignment */
+		add	r5, r5, #7
+		bic	r5, r5, #7
+		add	sp, sp, r5	@ and move stack above it
+
+1:
+#endif /* CONFIG_ARM_APPENDED_DTB */
+
+		mov	r0, r8
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
@@ -254,6 +302,8 @@ not_angel:
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

