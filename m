Return-Path: <linux-renesas-soc+bounces-11905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C71A03DA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 12:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 586F1165C6C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 11:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906DE1E570E;
	Tue,  7 Jan 2025 11:27:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6791EC013
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 11:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249225; cv=none; b=BzpHE0Da3/SvaW03xfc6AREV9pmZCz1btcy4Fed8tPyfrwfDcKMxDplwcMRTvPOFZR5qIl+Jfcwup5W4b1Hotl4pPf12IhPXxQ9ASCpG3P8nNJlQtliaNvSoBQC4atr+fjHn+GjAVsxvPfUakFPZMAQDvPAPAkqQAY+9nMFNcM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249225; c=relaxed/simple;
	bh=VfNRKOT53ab8Zm3boutAPlshoeM0y9EAZKV4KZNtkiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AyVfYo53fw4suWnZ4Cmu6hUeb9eVRnOqhdXF5q+jYFF8v37o1Tioz+aonVSkxJvJymFFHHo80tBWqhDvec07WGPA/bNkJj2hDEzWkFaQLNRiHZh45ezmxiUKTgDySjI1mGnqAmjygOXCd2h8qvHTA5yeKmBnK1EUBcrT4+30n7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:39d4:dc4e:b4ce:1377])
	by xavier.telenet-ops.be with cmsmtp
	id yBSz2D0063AZZFy01BSzH0; Tue, 07 Jan 2025 12:26:59 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tV7jb-00000008dfp-1nyE;
	Tue, 07 Jan 2025 12:26:59 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tV7je-000000059Or-3eC2;
	Tue, 07 Jan 2025 12:26:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] ARM: shmobile: rcar-gen2: Remove CMA reservation code
Date: Tue,  7 Jan 2025 12:26:55 +0100
Message-ID: <3d38f4fec20c4af46e4570012de7017eee9a39e9.1736249109.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If CONFIG_HIGHMEM=y, two reserved blocks are allocated on R-Car Gen2:

    cma: Reserved 256 MiB at 0x70000000 on node -1
    cma: Reserved 64 MiB at 0x6c000000 on node -1

The first block is reserved by the family-specific rcar_gen2_reserve(),
the second by the common arm_memblock_init() (shmobile_defconfig sets
CONFIG_CMA_SIZE_MBYTES=64).  As both blocks are reserved (eventually)
using dma_contiguous_reserve_area(), they both have the same name
("reserved").  Hence if CONFIG_CMA_SYSFS=y:

  sysfs: cannot create duplicate filename '/kernel/mm/cma/reserved'
   ...
   cma_sysfs_init from do_one_initcall+0x84/0x178
   ...
  kobject: kobject_add_internal failed for reserved with -EEXIST, don't try to register things with the same name in the same directory.

This causes cma_sysfs_init() to fail completely, and not to create
/sys/kernel/mm/cma/ at all.

Fix this by dropping the R-Car Gen2-specific reservation.  Compared to
when it was introduced, now there exist more flexible mechanisms to
control the size of memory reserved for CMA.  Users can reserve more
memory by increasing CONFIG_CMA_SIZE_MBYTES, passing the cma=<N> kernel
command line parameter, or adding a reserved-memory/linux,cma node to
DT.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note that increasing CONFIG_CMA_SIZE_MBYTES in shmobile_defconfig is not
a good idea, as it can also be used on other Renesas platforms that are
more memory-constrained than R-Car Gen2.

Should we add reserved-memory/linux,cma nodes to DT on all affected
boards?
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 76 ------------------------
 1 file changed, 76 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index c38367a10c794162..3cd34a42e39bb1d7 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -8,19 +8,15 @@
  */
 
 #include <linux/clocksource.h>
-#include <linux/device.h>
-#include <linux/dma-map-ops.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_clk.h>
-#include <linux/of_fdt.h>
 #include <linux/psci.h>
 #include <asm/mach/arch.h>
 #include <asm/secure_cntvoff.h>
 #include "common.h"
-#include "rcar-gen2.h"
 
 static const struct of_device_id cpg_matches[] __initconst = {
 	{ .compatible = "renesas,r8a7742-cpg-mssr", .data = "extal" },
@@ -122,76 +118,6 @@ static void __init rcar_gen2_timer_init(void)
 	timer_probe();
 }
 
-struct memory_reserve_config {
-	u64 reserved;
-	u64 base, size;
-};
-
-static int __init rcar_gen2_scan_mem(unsigned long node, const char *uname,
-				     int depth, void *data)
-{
-	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
-	const __be32 *reg, *endp;
-	int l;
-	struct memory_reserve_config *mrc = data;
-	u64 lpae_start = 1ULL << 32;
-
-	/* We are scanning "memory" nodes only */
-	if (type == NULL || strcmp(type, "memory"))
-		return 0;
-
-	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
-	if (reg == NULL)
-		reg = of_get_flat_dt_prop(node, "reg", &l);
-	if (reg == NULL)
-		return 0;
-
-	endp = reg + (l / sizeof(__be32));
-	while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
-		u64 base, size;
-
-		base = dt_mem_next_cell(dt_root_addr_cells, &reg);
-		size = dt_mem_next_cell(dt_root_size_cells, &reg);
-
-		if (base >= lpae_start)
-			continue;
-
-		if ((base + size) >= lpae_start)
-			size = lpae_start - base;
-
-		if (size < mrc->reserved)
-			continue;
-
-		if (base < mrc->base)
-			continue;
-
-		/* keep the area at top near the 32-bit legacy limit */
-		mrc->base = base + size - mrc->reserved;
-		mrc->size = mrc->reserved;
-	}
-
-	return 0;
-}
-
-static void __init rcar_gen2_reserve(void)
-{
-	struct memory_reserve_config mrc;
-
-	/* reserve 256 MiB at the top of the physical legacy 32-bit space */
-	memset(&mrc, 0, sizeof(mrc));
-	mrc.reserved = SZ_256M;
-
-	of_scan_flat_dt(rcar_gen2_scan_mem, &mrc);
-#ifdef CONFIG_DMA_CMA
-	if (mrc.size && memblock_is_region_memory(mrc.base, mrc.size)) {
-		static struct cma *rcar_gen2_dma_contiguous;
-
-		dma_contiguous_reserve_area(mrc.size, mrc.base, 0,
-					    &rcar_gen2_dma_contiguous, true);
-	}
-#endif
-}
-
 static const char * const rcar_gen2_boards_compat_dt[] __initconst = {
 	"renesas,r8a7790",
 	"renesas,r8a7791",
@@ -204,7 +130,6 @@ static const char * const rcar_gen2_boards_compat_dt[] __initconst = {
 DT_MACHINE_START(RCAR_GEN2_DT, "Generic R-Car Gen2 (Flattened Device Tree)")
 	.init_late	= shmobile_init_late,
 	.init_time	= rcar_gen2_timer_init,
-	.reserve	= rcar_gen2_reserve,
 	.dt_compat	= rcar_gen2_boards_compat_dt,
 MACHINE_END
 
@@ -220,6 +145,5 @@ static const char * const rz_g1_boards_compat_dt[] __initconst = {
 DT_MACHINE_START(RZ_G1_DT, "Generic RZ/G1 (Flattened Device Tree)")
 	.init_late	= shmobile_init_late,
 	.init_time	= rcar_gen2_timer_init,
-	.reserve	= rcar_gen2_reserve,
 	.dt_compat	= rz_g1_boards_compat_dt,
 MACHINE_END
-- 
2.43.0


