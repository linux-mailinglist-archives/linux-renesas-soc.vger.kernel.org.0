Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4B225AF96
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 17:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgIBPlp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 11:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbgIBPln (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 11:41:43 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D462EC061244
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2020 08:41:42 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id P3hf230044C55Sk013hf3R; Wed, 02 Sep 2020 17:41:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kDUtH-0006b0-9w; Wed, 02 Sep 2020 17:41:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kDUtH-0001fL-7A; Wed, 02 Sep 2020 17:41:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>
Cc:     Akashi Takahiro <takahiro.akashi@linaro.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm: kdump: Add DT properties to crash dump kernel's DTB
Date:   Wed,  2 Sep 2020 17:41:29 +0200
Message-Id: <20200902154129.6358-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Pass the following properties to the crash dump kernel, to provide a
modern DT interface between kexec and the crash dump kernel:

  - linux,elfcorehdr: ELF core header segment, similar to the
    "elfcorehdr=" kernel parameter.
  - linux,usable-memory-range: Usable memory reserved for the crash dump
    kernel.
    This makes the memory reservation explicit, so Linux no longer needs
    to mask the program counter, and rely on the "mem=" kernel parameter
    to obtain the start and size of usable memory.

For backwards compatibility, the "elfcorehdr=" and "mem=" kernel
parameters are still appended to the kernel command line.

Loosely based on the ARM64 version by Akashi Takahiro.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 kexec/arch/arm/crashdump-arm.c    |  10 ++-
 kexec/arch/arm/crashdump-arm.h    |   2 +
 kexec/arch/arm/kexec-zImage-arm.c | 137 ++++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+), 2 deletions(-)

diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
index daa478868b4976d7..1ec1826c24b52ed9 100644
--- a/kexec/arch/arm/crashdump-arm.c
+++ b/kexec/arch/arm/crashdump-arm.c
@@ -54,7 +54,7 @@ struct memory_ranges usablemem_rgns = {
 };
 
 /* The boot-time physical memory range reserved for crashkernel region */
-static struct memory_range crash_kernel_mem;
+struct memory_range crash_kernel_mem;
 
 /* reserved regions */
 #define CRASH_MAX_RESERVED_RANGES 2
@@ -64,6 +64,8 @@ static struct memory_ranges crash_reserved_rgns = {
 	.ranges = crash_reserved_ranges,
 };
 
+struct memory_range elfcorehdr_mem;
+
 static struct crash_elf_info elf_info = {
 	.class		= ELFCLASS32,
 	.data		= ELFDATANATIVE,
@@ -307,7 +309,11 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
 					  crash_kernel_mem.start,
 					  crash_kernel_mem.end, -1, 0);
 
-	dbgprintf("elfcorehdr: %#lx\n", elfcorehdr);
+	elfcorehdr_mem.start = elfcorehdr;
+	elfcorehdr_mem.end = elfcorehdr + bufsz - 1;
+
+	dbgprintf("elfcorehdr 0x%llx-0x%llx\n", elfcorehdr_mem.start,
+		  elfcorehdr_mem.end);
 	cmdline_add_elfcorehdr(mod_cmdline, elfcorehdr);
 
 	/*
diff --git a/kexec/arch/arm/crashdump-arm.h b/kexec/arch/arm/crashdump-arm.h
index 6e87b13c4b8c86fe..bbdf8bf9de58eb5d 100644
--- a/kexec/arch/arm/crashdump-arm.h
+++ b/kexec/arch/arm/crashdump-arm.h
@@ -13,6 +13,8 @@ extern "C" {
 
 
 extern struct memory_ranges usablemem_rgns;
+extern struct memory_range crash_kernel_mem;
+extern struct memory_range elfcorehdr_mem;
 
 struct kexec_info;
 
diff --git a/kexec/arch/arm/kexec-zImage-arm.c b/kexec/arch/arm/kexec-zImage-arm.c
index 925a9be120aa401a..e056f79124240e40 100644
--- a/kexec/arch/arm/kexec-zImage-arm.c
+++ b/kexec/arch/arm/kexec-zImage-arm.c
@@ -4,6 +4,7 @@
  */
 #define _GNU_SOURCE
 #define _XOPEN_SOURCE
+#include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
@@ -374,6 +375,103 @@ static const struct zimage_tag *find_extension_tag(const char *buf, off_t len,
 	return NULL;
 }
 
+static int get_cells_size(void *fdt, uint32_t *address_cells,
+			  uint32_t *size_cells)
+{
+	int nodeoffset;
+	const uint32_t *prop = NULL;
+	int prop_len;
+
+	/* default values */
+	*address_cells = 1;
+	*size_cells = 1;
+
+	/* under root node */
+	nodeoffset = fdt_path_offset(fdt, "/");
+	if (nodeoffset < 0)
+		return -1;
+
+	prop = fdt_getprop(fdt, nodeoffset, "#address-cells", &prop_len);
+	if (prop) {
+		if (prop_len != sizeof(*prop))
+			return -1;
+
+		*address_cells = fdt32_to_cpu(*prop);
+	}
+
+	prop = fdt_getprop(fdt, nodeoffset, "#size-cells", &prop_len);
+	if (prop) {
+		if (prop_len != sizeof(*prop))
+			return -1;
+
+		*size_cells = fdt32_to_cpu(*prop);
+	}
+
+	dbgprintf("%s: #address-cells:%d #size-cells:%d\n", __func__,
+		  *address_cells, *size_cells);
+	return 0;
+}
+
+static bool cells_size_fitted(uint32_t address_cells, uint32_t size_cells,
+			      struct memory_range *range)
+{
+	dbgprintf("%s: %llx-%llx\n", __func__, range->start, range->end);
+
+	/* if *_cells >= 2, cells can hold 64-bit values anyway */
+	if ((address_cells == 1) && (range->start >= (1ULL << 32)))
+		return false;
+
+	if ((size_cells == 1) &&
+	    ((range->end - range->start + 1) >= (1ULL << 32)))
+		return false;
+
+	return true;
+}
+
+static void fill_property(void *buf, uint64_t val, uint32_t cells)
+{
+	uint32_t val32;
+	int i;
+
+	if (cells == 1) {
+		val32 = cpu_to_fdt32((uint32_t)val);
+		memcpy(buf, &val32, sizeof(uint32_t));
+	} else {
+		for (i = 0;
+		     i < (cells * sizeof(uint32_t) - sizeof(uint64_t)); i++)
+			*(char *)buf++ = 0;
+
+		val = cpu_to_fdt64(val);
+		memcpy(buf, &val, sizeof(uint64_t));
+	}
+}
+
+static int setup_dtb_prop_range(char **bufp, off_t *sizep, int parentoffset,
+				const char *node_name, const char *prop_name,
+				struct memory_range *range,
+				uint32_t address_cells, uint32_t size_cells)
+{
+	void *buf, *prop;
+	size_t buf_size;
+	int result;
+
+	buf_size = (address_cells + size_cells) * sizeof(uint32_t);
+	prop = buf = xmalloc(buf_size);
+
+	fill_property(prop, range->start, address_cells);
+	prop += address_cells * sizeof(uint32_t);
+
+	fill_property(prop, range->end - range->start + 1, size_cells);
+	prop += size_cells * sizeof(uint32_t);
+
+	result = setup_dtb_prop(bufp, sizep, parentoffset, node_name,
+				prop_name, buf, buf_size);
+
+	free(buf);
+
+	return result;
+}
+
 int zImage_arm_load(int argc, char **argv, const char *buf, off_t len,
 	struct kexec_info *info)
 {
@@ -381,6 +479,7 @@ int zImage_arm_load(int argc, char **argv, const char *buf, off_t len,
 	unsigned long base, kernel_base;
 	unsigned int atag_offset = 0x1000; /* 4k offset from memory start */
 	unsigned int extra_size = 0x8000; /* TEXT_OFFSET */
+	uint32_t address_cells, size_cells;
 	const struct zimage_tag *tag;
 	size_t kernel_mem_size;
 	const char *command_line;
@@ -390,6 +489,7 @@ int zImage_arm_load(int argc, char **argv, const char *buf, off_t len,
 	const char *ramdisk_buf;
 	int opt;
 	int use_atags;
+	int result;
 	char *dtb_buf;
 	off_t dtb_length;
 	char *dtb_file;
@@ -733,6 +833,43 @@ int zImage_arm_load(int argc, char **argv, const char *buf, off_t len,
 				return -1;
 		}
 
+		if (info->kexec_flags & KEXEC_ON_CRASH) {
+			/* Determine #address-cells and #size-cells */
+			result = get_cells_size(dtb_buf, &address_cells,
+						&size_cells);
+			if (result) {
+				fprintf(stderr, "Cannot determine cells-size.\n");
+				return -1;
+			}
+
+			if (!cells_size_fitted(address_cells, size_cells,
+					       &elfcorehdr_mem)) {
+				fprintf(stderr, "elfcorehdr doesn't fit cells-size.\n");
+				return -1;
+			}
+
+			if (!cells_size_fitted(address_cells, size_cells,
+					       &crash_kernel_mem)) {
+				fprintf(stderr, "kexec: usable memory range doesn't fit cells-size.\n");
+				return -1;
+			}
+
+			/* Add linux,elfcorehdr */
+			if (setup_dtb_prop_range(&dtb_buf, &dtb_length, 0,
+						 "chosen", "linux,elfcorehdr",
+						 &elfcorehdr_mem,
+						 address_cells, size_cells))
+				return -1;
+
+			/* Add linux,usable-memory-range */
+			if (setup_dtb_prop_range(&dtb_buf, &dtb_length, 0,
+						 "chosen",
+						 "linux,usable-memory-range",
+						 &crash_kernel_mem,
+						 address_cells, size_cells))
+				return -1;
+		}
+
 		/*
 		 * The dtb must also be placed above the memory used by
 		 * the zImage.  We don't care about its position wrt the
-- 
2.17.1

