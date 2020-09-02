Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA5D25AFC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 17:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728231AbgIBPpx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 11:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbgIBPpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 11:45:51 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F2DC061244
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2020 08:45:50 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id P3lg2300P4C55Sk063lhm2; Wed, 02 Sep 2020 17:45:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kDUxA-0006dV-SC; Wed, 02 Sep 2020 17:45:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kDUxA-0001mW-QF; Wed, 02 Sep 2020 17:45:40 +0200
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
        Simon Horman <horms@verge.net.au>,
        Akashi Takahiro <takahiro.akashi@linaro.org>,
        kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: Parse kdump DT properties
Date:   Wed,  2 Sep 2020 17:45:38 +0200
Message-Id: <20200902154538.6807-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
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
This depends on "[PATCH v9] ARM: boot: Validate start of physical memory
against DTB"
(https://lore.kernel.org/r/20200902153606.13652-1-geert+renesas@glider.be)

The counterpart patch for kexec-tools is "PATCH] arm: kdump: Add DT
properties to crash dump kernel's DTB"
(https://lore.kernel.org/r/20200902154129.6358-1-geert+renesas@glider.be)

 Documentation/devicetree/bindings/chosen.txt |  4 +-
 arch/arm/boot/compressed/fdt_get_mem_start.c | 18 +++-
 arch/arm/mm/init.c                           | 90 ++++++++++++++++++++
 3 files changed, 107 insertions(+), 5 deletions(-)

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
diff --git a/arch/arm/boot/compressed/fdt_get_mem_start.c b/arch/arm/boot/compressed/fdt_get_mem_start.c
index fd501ec3c14b4ae4..344fee8bfc7ab438 100644
--- a/arch/arm/boot/compressed/fdt_get_mem_start.c
+++ b/arch/arm/boot/compressed/fdt_get_mem_start.c
@@ -40,7 +40,7 @@ static uint32_t get_size(const void *fdt, const char *name)
 unsigned long fdt_get_mem_start(const void *fdt)
 {
 	uint32_t addr_size, size_size, mem_start, masked_pc;
-	const __be32 *memory;
+	const __be32 *usable, *memory;
 
 	if (!fdt)
 		return -1;
@@ -52,8 +52,16 @@ unsigned long fdt_get_mem_start(const void *fdt)
 	addr_size = get_size(fdt, "#address-cells");
 	size_size = get_size(fdt, "#size-cells");
 
-	/* Find the first memory node */
-	memory = get_prop(fdt, "/memory", "reg", addr_size + size_size);
+	/*
+	 * Find start of memory, either from "linux,usable-memory-range" (for
+	 * crashkernel), or from the first memory node
+	 */
+	usable = get_prop(fdt, "/chosen", "linux,usable-memory-range",
+			  addr_size + size_size);
+	if (usable)
+		memory = usable;
+	else
+		memory = get_prop(fdt, "/memory", "reg", addr_size + size_size);
 	if (!memory)
 		return -1;
 
@@ -62,6 +70,10 @@ unsigned long fdt_get_mem_start(const void *fdt)
 	/* Must be a multiple of 16 MiB for phys/virt patching */
 	mem_start = round_up(mem_start, SZ_16M);
 
+	/* "linux,usable-memory-range" is considered authoritative */
+	if (usable)
+		return mem_start;
+
 	/*
 	 * Traditionally, the start of memory is obtained by masking the
 	 * program counter.  Prefer that method, unless it would yield an
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 000c1b48e9734f4e..407fd847dbfc9280 100644
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
+                const char *uname, int depth, void *data)
+{
+        struct memblock_region *usablemem = data;
+        const __be32 *reg;
+        int len;
+
+        if (depth != 1 || strcmp(uname, "chosen") != 0)
+                return 0;
+
+        reg = of_get_flat_dt_prop(node, "linux,usable-memory-range", &len);
+        if (!reg || (len < (dt_root_addr_cells + dt_root_size_cells)))
+                return 1;
+
+        usablemem->base = dt_mem_next_cell(dt_root_addr_cells, &reg);
+        usablemem->size = dt_mem_next_cell(dt_root_size_cells, &reg);
+        return 1;
+}
+
+static void __init fdt_enforce_memory_region(void)
+{
+        struct memblock_region reg = {
+                .size = 0,
+        };
+
+        of_scan_flat_dt(early_init_dt_scan_usablemem, &reg);
+
+        if (reg.size)
+                memblock_cap_memory_range(reg.base, reg.size);
+}
+
+#else
+static inline void fdt_enforce_memory_region(void) { }
+#endif
+
+#if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_OF_EARLY_FLATTREE)
+static int __init early_init_dt_scan_elfcorehdr(unsigned long node,
+                const char *uname, int depth, void *data)
+{
+        const __be32 *reg;
+        int len;
+
+        if (depth != 1 || strcmp(uname, "chosen") != 0)
+                return 0;
+
+        reg = of_get_flat_dt_prop(node, "linux,elfcorehdr", &len);
+        if (!reg || (len < (dt_root_addr_cells + dt_root_size_cells)))
+                return 1;
+
+        elfcorehdr_addr = dt_mem_next_cell(dt_root_addr_cells, &reg);
+        elfcorehdr_size = dt_mem_next_cell(dt_root_size_cells, &reg);
+        return 1;
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
+        of_scan_flat_dt(early_init_dt_scan_elfcorehdr, NULL);
+
+        if (!elfcorehdr_size)
+                return;
+
+        if (memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)) {
+                pr_warn("elfcorehdr is overlapped\n");
+                return;
+        }
+
+        memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
+
+        pr_info("Reserving %llu KiB of memory at 0x%llx for elfcorehdr\n",
+                elfcorehdr_size >> 10, elfcorehdr_addr);
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
 
@@ -226,6 +314,8 @@ void __init arm_memblock_init(const struct machine_desc *mdesc)
 	early_init_fdt_reserve_self();
 	early_init_fdt_scan_reserved_mem();
 
+	reserve_elfcorehdr();
+
 	/* reserve memory for DMA contiguous allocations */
 	dma_contiguous_reserve(arm_dma_limit);
 
-- 
2.17.1

