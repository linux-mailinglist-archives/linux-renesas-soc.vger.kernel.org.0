Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683A32CD58F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 13:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbgLCMfH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 07:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728609AbgLCMfH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 07:35:07 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB165C061A4F
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Dec 2020 04:34:26 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id zoaG230074C55Sk06oaGAu; Thu, 03 Dec 2020 13:34:24 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kknoN-007hYK-VC; Thu, 03 Dec 2020 13:34:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kknoN-00C5VC-Af; Thu, 03 Dec 2020 13:34:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kexec@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] ARM: Parse kdump DT properties
Date:   Thu,  3 Dec 2020 13:34:14 +0100
Message-Id: <20201203123414.2881043-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Parse the following DT properties in the crash dump kernel, to provide a
modern interface between kexec and the crash dump kernel:
  - linux,elfcorehdr: ELF core header segment, similar to the
    "elfcorehdr=" kernel parameter.
  - linux,usable-memory-range: Usable memory reserved for the crash dump
    kernel.
    This makes the memory reservation explicit.  If present, Linux no
    longer needs to mask the program counter, and rely on the "mem="
    kernel parameter to obtain the start and size of usable memory.

For backwards compatibility, the traditional method to derive the start
of memory is still used if "linux,usable-memory-range" is absent, and
the "elfcorehdr=" and "mem=" kernel parameters are still parsed.

Loosely based on the ARM64 version by Akashi Takahiro.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH v10 0/3] ARM: uncompress: Validate start of
physical memory against passed DTB"
https://lore.kernel.org/linux-arm-kernel/20201203121916.2870975-1-geert+renesas@glider.be/

The corresponding patch for kexec-tools is "[PATCH] arm: kdump: Add DT
properties to crash dump kernel's DTB:
https://lore.kernel.org/linux-arm-kernel/20200902154129.6358-1-geert+renesas@glider.be/

v2:
  - Rebase on top of reworked DTB memory information handling,
---
 Documentation/devicetree/bindings/chosen.txt  |  4 +-
 .../arm/boot/compressed/fdt_check_mem_start.c | 48 ++++++++--
 arch/arm/mm/init.c                            | 90 +++++++++++++++++++
 3 files changed, 134 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 45e79172a646c537..ba75c58413667760 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -79,7 +79,7 @@ a different secondary CPU release mechanism)
 linux,usable-memory-range
 -------------------------
 
-This property (arm64 only) holds a base address and size, describing a
+This property (arm and arm64 only) holds a base address and size, describing a
 limited region in which memory may be considered available for use by
 the kernel. Memory outside of this range is not available for use.
 
@@ -106,7 +106,7 @@ respectively, of the root node.
 linux,elfcorehdr
 ----------------
 
-This property (currently used only on arm64) holds the memory range,
+This property (currently used only on arm and arm64) holds the memory range,
 the address and the size, of the elf core header which mainly describes
 the panicked kernel's memory layout as PT_LOAD segments of elf format.
 e.g.
diff --git a/arch/arm/boot/compressed/fdt_check_mem_start.c b/arch/arm/boot/compressed/fdt_check_mem_start.c
index e58c3a79c8a31ec4..4625f554194a2279 100644
--- a/arch/arm/boot/compressed/fdt_check_mem_start.c
+++ b/arch/arm/boot/compressed/fdt_check_mem_start.c
@@ -55,16 +55,17 @@ static uint64_t get_val(const fdt32_t *cells, uint32_t ncells)
  * DTB, and, if out-of-range, replace it by the real start address.
  * To preserve backwards compatibility (systems reserving a block of memory
  * at the start of physical memory, kdump, ...), the traditional method is
- * always used if it yields a valid address.
+ * used if it yields a valid address, unless the "linux,usable-memory-range"
+ * property is present.
  *
  * Return value: start address of physical memory to use
  */
 uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
 {
-	uint32_t addr_cells, size_cells, base;
+	uint32_t addr_cells, size_cells, usable_base, base;
 	uint32_t fdt_mem_start = 0xffffffff;
-	const fdt32_t *reg, *endp;
-	uint64_t size, end;
+	const fdt32_t *usable, *reg, *endp;
+	uint64_t size, usable_end, end;
 	const char *type;
 	int offset, len;
 
@@ -80,6 +81,27 @@ uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
 	if (addr_cells > 2 || size_cells > 2)
 		return mem_start;
 
+	/*
+	 * Usable memory in case of a crash dump kernel
+	 * This property describes a limitation: memory within this range is
+	 * only valid when also described through another mechanism
+	 */
+	usable = get_prop(fdt, "/chosen", "linux,usable-memory-range",
+			  (addr_cells + size_cells) * sizeof(fdt32_t));
+	if (usable) {
+		size = get_val(usable + addr_cells, size_cells);
+		if (!size)
+			return mem_start;
+
+		if (addr_cells > 1 && fdt32_ld(usable)) {
+			/* Outside 32-bit address space */
+			return mem_start;
+		}
+
+		usable_base = fdt32_ld(usable + addr_cells - 1);
+		usable_end = usable_base + size;
+	}
+
 	/* Walk all memory nodes and regions */
 	for (offset = fdt_next_node(fdt, -1, NULL); offset >= 0;
 	     offset = fdt_next_node(fdt, offset, NULL)) {
@@ -107,7 +129,20 @@ uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
 
 			base = fdt32_ld(reg + addr_cells - 1);
 			end = base + size;
-			if (mem_start >= base && mem_start < end) {
+			if (usable) {
+				/*
+				 * Clip to usable range, which takes precedence
+				 * over mem_start
+				 */
+				if (base < usable_base)
+					base = usable_base;
+
+				if (end > usable_end)
+					end = usable_end;
+
+				if (end <= base)
+					continue;
+			} else if (mem_start >= base && mem_start < end) {
 				/* Calculated address is valid, use it */
 				return mem_start;
 			}
@@ -123,7 +158,8 @@ uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
 	}
 
 	/*
-	 * The calculated address is not usable.
+	 * The calculated address is not usable, or was overridden by the
+	 * "linux,usable-memory-range" property.
 	 * Use the lowest usable physical memory address from the DTB instead,
 	 * and make sure this is a multiple of 2 MiB for phys/virt patching.
 	 */
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index d54d69cf17322d33..83f80a8a13d6afd1 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -4,6 +4,7 @@
  *
  *  Copyright (C) 1995-2005 Russell King
  */
+#include <linux/crash_dump.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/swap.h>
@@ -210,8 +211,95 @@ void check_cpu_icache_size(int cpuid)
 }
 #endif
 
+#ifdef CONFIG_OF_EARLY_FLATTREE
+static int __init early_init_dt_scan_usablemem(unsigned long node,
+		const char *uname, int depth, void *data)
+{
+	struct memblock_region *usablemem = data;
+	const __be32 *reg;
+	int len;
+
+	if (depth != 1 || strcmp(uname, "chosen") != 0)
+		return 0;
+
+	reg = of_get_flat_dt_prop(node, "linux,usable-memory-range", &len);
+	if (!reg || (len < (dt_root_addr_cells + dt_root_size_cells)))
+		return 1;
+
+	usablemem->base = dt_mem_next_cell(dt_root_addr_cells, &reg);
+	usablemem->size = dt_mem_next_cell(dt_root_size_cells, &reg);
+	return 1;
+}
+
+static void __init fdt_enforce_memory_region(void)
+{
+	struct memblock_region reg = {
+		.size = 0,
+	};
+
+	of_scan_flat_dt(early_init_dt_scan_usablemem, &reg);
+
+	if (reg.size)
+		memblock_cap_memory_range(reg.base, reg.size);
+}
+
+#else
+static inline void fdt_enforce_memory_region(void) { }
+#endif
+
+#if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_OF_EARLY_FLATTREE)
+static int __init early_init_dt_scan_elfcorehdr(unsigned long node,
+		const char *uname, int depth, void *data)
+{
+	const __be32 *reg;
+	int len;
+
+	if (depth != 1 || strcmp(uname, "chosen") != 0)
+		return 0;
+
+	reg = of_get_flat_dt_prop(node, "linux,elfcorehdr", &len);
+	if (!reg || (len < (dt_root_addr_cells + dt_root_size_cells)))
+		return 1;
+
+	elfcorehdr_addr = dt_mem_next_cell(dt_root_addr_cells, &reg);
+	elfcorehdr_size = dt_mem_next_cell(dt_root_size_cells, &reg);
+	return 1;
+}
+
+/*
+ * reserve_elfcorehdr() - reserves memory for elf core header
+ *
+ * This function reserves the memory occupied by an elf core header
+ * described in the device tree. This region contains all the
+ * information about primary kernel's core image and is used by a dump
+ * capture kernel to access the system memory on primary kernel.
+ */
+static void __init reserve_elfcorehdr(void)
+{
+	of_scan_flat_dt(early_init_dt_scan_elfcorehdr, NULL);
+
+	if (!elfcorehdr_size)
+		return;
+
+	if (memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)) {
+		pr_warn("elfcorehdr is overlapped\n");
+		return;
+	}
+
+	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
+
+	pr_info("Reserving %llu KiB of memory at 0x%llx for elfcorehdr\n",
+		elfcorehdr_size >> 10, elfcorehdr_addr);
+}
+#else
+static inline void reserve_elfcorehdr(void) { }
+#endif
+
 void __init arm_memblock_init(const struct machine_desc *mdesc)
 {
+	/* Handle linux,usable-memory-range property */
+	fdt_enforce_memory_region();
+
 	/* Register the kernel text, kernel data and initrd with memblock. */
 	memblock_reserve(__pa(KERNEL_START), KERNEL_END - KERNEL_START);
 
@@ -225,6 +313,8 @@ void __init arm_memblock_init(const struct machine_desc *mdesc)
 
 	early_init_fdt_scan_reserved_mem();
 
+	reserve_elfcorehdr();
+
 	/* reserve memory for DMA contiguous allocations */
 	dma_contiguous_reserve(arm_dma_limit);
 
-- 
2.25.1

