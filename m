Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8525925AF52
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 17:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgIBPgf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 11:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgIBPgf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 11:36:35 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739D6C061244
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2020 08:36:33 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id P3cM230084C55Sk013cMJq; Wed, 02 Sep 2020 17:36:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kDUo9-0006Vw-Ai; Wed, 02 Sep 2020 17:36:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kDUo9-0003Yv-8Q; Wed, 02 Sep 2020 17:36:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v9] ARM: boot: Validate start of physical memory against DTB
Date:   Wed,  2 Sep 2020 17:36:06 +0200
Message-Id: <20200902153606.13652-1-geert+renesas@glider.be>
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

Fix this limitation by validating the masked address against the first
memory node in the DTB, if available  (either explicitly passed, or
appended to the kernel).  Only use the start address from DTB when
masking would yield an out-of-range address.  Prefer the traditional
method in all other cases.

This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
i.e. not at a multiple of 128 MiB.

Suggested-by: Nicolas Pitre <nico@fluxnic.net>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Cc: Lukasz Stelmach <l.stelmach@samsung.com>
---
This is v9 of "ARM: boot: Obtain start of physical memory from DTB".

v9:
  - Add minlen parameter to getprop(), for better validation of
    memory properties,
  - Only use start of memory from the DTB if masking would yield an
    out-of-range address, to fix crashkernel, as suggested by Ard,

v8:
  - Rebase on top of commit 893ab00439a45513 ("kbuild: remove cc-option
    test of -fno-stack-protector"),

v7:
  - Rebase on top of commit 161e04a5bae58a65 ("ARM: decompressor: split
    off _edata and stack base into separate object"),

v6:
  - Rebase on top of commit 7ae4a78daacf240a ("ARM: 8969/1:
    decompressor: simplify libfdt builds"),
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
 arch/arm/boot/compressed/fdt_get_mem_start.c | 72 ++++++++++++++++++++
 arch/arm/boot/compressed/head.S              | 52 +++++++++++++-
 3 files changed, 127 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/compressed/fdt_get_mem_start.c

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index b1147b7f2c8d372e..b1c09faf276e9193 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -81,10 +81,13 @@ libfdt_objs := fdt_rw.o fdt_ro.o fdt_wip.o fdt.o
 ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
 OBJS	+= $(libfdt_objs) atags_to_fdt.o
 endif
+ifeq ($(CONFIG_USE_OF),y)
+OBJS	+= $(libfdt_objs) fdt_get_mem_start.o
+endif
 
 # -fstack-protector-strong triggers protection checks in this code,
 # but it is being used too early to link to meaningful stack_chk logic.
-$(foreach o, $(libfdt_objs) atags_to_fdt.o, \
+$(foreach o, $(libfdt_objs) atags_to_fdt.o fdt_get_mem_start.o, \
 	$(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt -fno-stack-protector))
 
 # These were previously generated C files. When you are building the kernel
diff --git a/arch/arm/boot/compressed/fdt_get_mem_start.c b/arch/arm/boot/compressed/fdt_get_mem_start.c
new file mode 100644
index 0000000000000000..fd501ec3c14b4ae4
--- /dev/null
+++ b/arch/arm/boot/compressed/fdt_get_mem_start.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/kernel.h>
+#include <linux/libfdt.h>
+#include <linux/sizes.h>
+
+static const void *get_prop(const void *fdt, const char *node_path,
+			    const char *property, int minlen)
+{
+	const void *prop;
+	int offset, len;
+
+	offset = fdt_path_offset(fdt, node_path);
+	if (offset == -FDT_ERR_NOTFOUND)
+		return NULL;
+
+	prop = fdt_getprop(fdt, offset, property, &len);
+	if (!prop || len < minlen)
+		return NULL;
+
+	return prop;
+}
+
+static uint32_t get_size(const void *fdt, const char *name)
+{
+	const __be32 *prop = get_prop(fdt, "/", name, 4);
+
+	if (!prop) {
+		/* default */
+		return 1;
+	}
+
+	return fdt32_to_cpu(*prop);
+}
+
+/*
+ * Get the start of physical memory
+ */
+
+unsigned long fdt_get_mem_start(const void *fdt)
+{
+	uint32_t addr_size, size_size, mem_start, masked_pc;
+	const __be32 *memory;
+
+	if (!fdt)
+		return -1;
+
+	if (*(__be32 *)fdt != cpu_to_fdt32(FDT_MAGIC))
+		return -1;
+
+	/* There may be multiple cells on LPAE platforms */
+	addr_size = get_size(fdt, "#address-cells");
+	size_size = get_size(fdt, "#size-cells");
+
+	/* Find the first memory node */
+	memory = get_prop(fdt, "/memory", "reg", addr_size + size_size);
+	if (!memory)
+		return -1;
+
+	mem_start = fdt32_to_cpu(memory[addr_size - 1]);
+
+	/* Must be a multiple of 16 MiB for phys/virt patching */
+	mem_start = round_up(mem_start, SZ_16M);
+
+	/*
+	 * Traditionally, the start of memory is obtained by masking the
+	 * program counter.  Prefer that method, unless it would yield an
+	 * out-of-range address.
+	 */
+	masked_pc = _RET_IP_ & 0xf8000000;
+	return masked_pc < mem_start ? mem_start : masked_pc;
+}
diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 434a16982e344fe4..802621756ac0480b 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -254,8 +254,56 @@ not_angel:
 		.text
 
 #ifdef CONFIG_AUTO_ZRELADDR
+#ifdef CONFIG_USE_OF
 		/*
-		 * Find the start of physical memory.  As we are executing
+		 * Find the start of physical memory.
+		 * Try the DTB first, if available.
+		 */
+		adr	r0, LC1
+		ldr	sp, [r0]	@ get stack location
+		add	sp, sp, r0	@ apply relocation
+
+#ifdef CONFIG_ARM_APPENDED_DTB
+		/*
+		 * Look for an appended DTB. If found, use it and
+		 * move stack away from it.
+		 */
+		ldr	r6, [r0, #4]	@ get &_edata
+		add	r6, r6, r0	@ relocate it
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
@@ -273,6 +321,8 @@ not_angel:
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

