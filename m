Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C433C84AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 14:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239405AbhGNMxl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 08:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239349AbhGNMxk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 08:53:40 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCBDC0613DB
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 05:50:48 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by xavier.telenet-ops.be with bizsmtp
        id V0qW2500k1ccfby010qX5W; Wed, 14 Jul 2021 14:50:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLO-0018dY-Nk; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLN-00AaEs-TU; Wed, 14 Jul 2021 14:50:29 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>, Mike Rapoport <rppt@kernel.org>
Cc:     Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-mm@kvack.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 10/10] ARM: Parse kdump DT properties
Date:   Wed, 14 Jul 2021 14:50:20 +0200
Message-Id: <daaed4fcfe5ad62056cfb6f4ebea026f6b8a99f5.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
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
The corresponding patch for kexec-tools is "[PATCH] arm: kdump: Add DT
properties to crash dump kernel's DTB", which is still valid:
https://lore.kernel.org/linux-arm-kernel/20200902154129.6358-1-geert+renesas@glider.be/

v4:
  - Remove references to architectures in chosen.txt, to avoid having to
    change this again when more architectures copy kdump support,
  - Remove the architecture-specific code for parsing
    "linux,usable-memory-range" and "linux,elfcorehdr", as the FDT core
    code now takes care of this,
  - Move chosen.txt change to patch changing the FDT core,
  - Use IS_ENABLED(CONFIG_CRASH_DUMP) instead of #ifdef,

v3:
  - Rebase on top of accepted solution for DTB memory information
    handling, which is part of v5.12-rc1,

v2:
  - Rebase on top of reworked DTB memory information handling.
---
 .../arm/boot/compressed/fdt_check_mem_start.c | 48 ++++++++++++++++---
 arch/arm/mm/init.c                            | 30 ++++++++++++
 2 files changed, 72 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/compressed/fdt_check_mem_start.c b/arch/arm/boot/compressed/fdt_check_mem_start.c
index 62450d824c3ca180..9291a2661bdfe57f 100644
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
index 6162a070a4104a26..dfaee199554dda97 100644
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
@@ -221,8 +222,35 @@ void check_cpu_icache_size(int cpuid)
 }
 #endif
 
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
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP) || !elfcorehdr_size)
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
+
 void __init arm_memblock_init(const struct machine_desc *mdesc)
 {
+	/* Handle linux,usable-memory-range property */
+	memblock_cap_memory_range(cap_mem_addr, cap_mem_size);
+
 	/* Register the kernel text, kernel data and initrd with memblock. */
 	memblock_reserve(__pa(KERNEL_START), KERNEL_END - KERNEL_START);
 
@@ -236,6 +264,8 @@ void __init arm_memblock_init(const struct machine_desc *mdesc)
 
 	early_init_fdt_scan_reserved_mem();
 
+	reserve_elfcorehdr();
+
 	/* reserve memory for DMA contiguous allocations */
 	dma_contiguous_reserve(arm_dma_limit);
 
-- 
2.25.1

