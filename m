Return-Path: <linux-renesas-soc+bounces-2741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CE5854248
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 06:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EFC31F21EBE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 05:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734A4C14F;
	Wed, 14 Feb 2024 05:20:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90CDCC147
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 05:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707888058; cv=none; b=fvpVkZuRP56vnBPBBxl+t7XWY/hGkQKgZ1obu5HBoM6EHev7RTTgc3KizB/RXc35BF3pvDEZlc6V3hGtrbJtF3Ta3UZ4dSWSXH+8S0S98s4ThpbSpe8vvOKeOMxEqX0YbGt4rmyDbLCtzrzvOEFKkykXsLjfTiVGphT0n1I/CUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707888058; c=relaxed/simple;
	bh=CP+t6cpCwZ5EAWaev+NCD60ud8qqlBOPGGNDRykIjWM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jPJCXPCrHWH/eGy7srJchr+BQnSqErqou/uXIOWEbw0+AqrQb+ULJlNvVJxcDpmABOXpky7YYAFWpRZW6i3PhoQ3Ny4nAflA5t8/EN3zyFn+rcXkHOYfpQ1G+Y8W7BmW6XNIqAKbKppwbNkuXg1Lj6R/FmKrBClAuQRvY/fPG80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.06,159,1705330800"; 
   d="scan'208";a="193876759"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Feb 2024 14:20:54 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0C5D04190465;
	Wed, 14 Feb 2024 14:20:54 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] irqchip/gic-v3-its: Workaround Renesas R-Car GICv3 ITS
Date: Wed, 14 Feb 2024 14:20:50 +0900
Message-Id: <20240214052050.1966439-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GICv3 ITS on Renesas R-Car has limitations:
 - It can access lower 32-bits memory area only.
 - It cannot use Sharable/cache attributes.

So, set ITS_FLAGS_FORCE_NON_SHAREABLE flag, and set GFP_DMA to all
memory allocation APIs for getting lower 32-bits memory area on
the R-Car. Note that GFP_DMA32 cannot work correctly because
the environment doens't have DMA32 zone like below:

[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000048000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000004ffffffff]

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/Kconfig               |  9 +++++
 drivers/irqchip/irq-gic-v3-its.c | 59 +++++++++++++++++++++-----------
 2 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c1a16a9dae72..49fe3006e142 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1250,6 +1250,15 @@ config SOCIONEXT_SYNQUACER_PREITS
 
 	  If unsure, say Y.
 
+config RENESAS_RCAR_GIC_ITS
+	bool "Renesas R-Car: Workaround for GICv3 ITS"
+	default n
+	help
+	  Renesas R-Car Gen4 SoCs has a limitation about GICv3 ITS which can
+	  access lower 32-bits memory address range only.
+
+	  If unsure, say Y.
+
 endmenu # "ARM errata workarounds via the alternatives framework"
 
 choice
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index d097001c1e3e..e0e672b561b9 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -186,6 +186,7 @@ static LIST_HEAD(its_nodes);
 static DEFINE_RAW_SPINLOCK(its_lock);
 static struct rdists *gic_rdists;
 static struct irq_domain *its_parent;
+static gfp_t its_gfp_quirk;
 
 static unsigned long its_list_map;
 static u16 vmovp_seq_num;
@@ -1846,7 +1847,7 @@ static int its_vlpi_map(struct irq_data *d, struct its_cmd_info *info)
 		struct its_vlpi_map *maps;
 
 		maps = kcalloc(its_dev->event_map.nr_lpis, sizeof(*maps),
-			       GFP_ATOMIC);
+			       GFP_ATOMIC | its_gfp_quirk);
 		if (!maps) {
 			ret = -ENOMEM;
 			goto out;
@@ -2044,7 +2045,7 @@ static struct lpi_range *mk_lpi_range(u32 base, u32 span)
 {
 	struct lpi_range *range;
 
-	range = kmalloc(sizeof(*range), GFP_KERNEL);
+	range = kmalloc(sizeof(*range), GFP_KERNEL | its_gfp_quirk);
 	if (range) {
 		range->base_id = base;
 		range->span = span;
@@ -2169,7 +2170,7 @@ static unsigned long *its_lpi_alloc(int nr_irqs, u32 *base, int *nr_ids)
 	if (err)
 		goto out;
 
-	bitmap = bitmap_zalloc(nr_irqs, GFP_ATOMIC);
+	bitmap = bitmap_zalloc(nr_irqs, GFP_ATOMIC | its_gfp_quirk);
 	if (!bitmap)
 		goto out;
 
@@ -2201,7 +2202,7 @@ static struct page *its_allocate_prop_table(gfp_t gfp_flags)
 {
 	struct page *prop_page;
 
-	prop_page = alloc_pages(gfp_flags, get_order(LPI_PROPBASE_SZ));
+	prop_page = alloc_pages(gfp_flags | its_gfp_quirk, get_order(LPI_PROPBASE_SZ));
 	if (!prop_page)
 		return NULL;
 
@@ -2335,7 +2336,7 @@ static int its_setup_baser(struct its_node *its, struct its_baser *baser,
 		order = get_order(GITS_BASER_PAGES_MAX * psz);
 	}
 
-	page = alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO, order);
+	page = alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO | its_gfp_quirk, order);
 	if (!page)
 		return -ENOMEM;
 
@@ -2808,7 +2809,7 @@ static bool allocate_vpe_l2_table(int cpu, u32 id)
 
 	/* Allocate memory for 2nd level table */
 	if (!table[idx]) {
-		page = alloc_pages(GFP_KERNEL | __GFP_ZERO, get_order(psz));
+		page = alloc_pages(GFP_KERNEL | __GFP_ZERO | its_gfp_quirk, get_order(psz));
 		if (!page)
 			return false;
 
@@ -2860,7 +2861,7 @@ static int allocate_vpe_l1_table(void)
 	if (val & GICR_VPROPBASER_4_1_VALID)
 		goto out;
 
-	gic_data_rdist()->vpe_table_mask = kzalloc(sizeof(cpumask_t), GFP_ATOMIC);
+	gic_data_rdist()->vpe_table_mask = kzalloc(sizeof(cpumask_t), GFP_ATOMIC | its_gfp_quirk);
 	if (!gic_data_rdist()->vpe_table_mask)
 		return -ENOMEM;
 
@@ -2927,7 +2928,7 @@ static int allocate_vpe_l1_table(void)
 
 	pr_debug("np = %d, npg = %lld, psz = %d, epp = %d, esz = %d\n",
 		 np, npg, psz, epp, esz);
-	page = alloc_pages(GFP_ATOMIC | __GFP_ZERO, get_order(np * PAGE_SIZE));
+	page = alloc_pages(GFP_ATOMIC | __GFP_ZERO | its_gfp_quirk, get_order(np * PAGE_SIZE));
 	if (!page)
 		return -ENOMEM;
 
@@ -2957,7 +2958,7 @@ static int its_alloc_collections(struct its_node *its)
 	int i;
 
 	its->collections = kcalloc(nr_cpu_ids, sizeof(*its->collections),
-				   GFP_KERNEL);
+				   GFP_KERNEL | its_gfp_quirk);
 	if (!its->collections)
 		return -ENOMEM;
 
@@ -2971,7 +2972,7 @@ static struct page *its_allocate_pending_table(gfp_t gfp_flags)
 {
 	struct page *pend_page;
 
-	pend_page = alloc_pages(gfp_flags | __GFP_ZERO,
+	pend_page = alloc_pages(gfp_flags | __GFP_ZERO | its_gfp_quirk,
 				get_order(LPI_PENDBASE_SZ));
 	if (!pend_page)
 		return NULL;
@@ -3319,7 +3320,7 @@ static bool its_alloc_table_entry(struct its_node *its,
 
 	/* Allocate memory for 2nd level table */
 	if (!table[idx]) {
-		page = alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO,
+		page = alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO | its_gfp_quirk,
 					get_order(baser->psz));
 		if (!page)
 			return false;
@@ -3415,7 +3416,7 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 	if (WARN_ON(!is_power_of_2(nvecs)))
 		nvecs = roundup_pow_of_two(nvecs);
 
-	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL | its_gfp_quirk);
 	/*
 	 * Even if the device wants a single LPI, the ITT must be
 	 * sized as a power of two (and you need at least one bit...).
@@ -3423,14 +3424,14 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 	nr_ites = max(2, nvecs);
 	sz = nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1);
 	sz = max(sz, ITS_ITT_ALIGN) + ITS_ITT_ALIGN - 1;
-	itt = kzalloc_node(sz, GFP_KERNEL, its->numa_node);
+	itt = kzalloc_node(sz, GFP_KERNEL | its_gfp_quirk, its->numa_node);
 	if (alloc_lpis) {
 		lpi_map = its_lpi_alloc(nvecs, &lpi_base, &nr_lpis);
 		if (lpi_map)
 			col_map = kcalloc(nr_lpis, sizeof(*col_map),
-					  GFP_KERNEL);
+					  GFP_KERNEL | its_gfp_quirk);
 	} else {
-		col_map = kcalloc(nr_ites, sizeof(*col_map), GFP_KERNEL);
+		col_map = kcalloc(nr_ites, sizeof(*col_map), GFP_KERNEL | its_gfp_quirk);
 		nr_lpis = 0;
 		lpi_base = 0;
 	}
@@ -4754,6 +4755,16 @@ static bool __maybe_unused its_enable_rk3588001(void *data)
 	return true;
 }
 
+static bool __maybe_unused its_enable_renesas_rcar_gic_its(void *data)
+{
+	struct its_node *its = data;
+
+	its->flags |= ITS_FLAGS_FORCE_NON_SHAREABLE;
+	its_gfp_quirk = GFP_DMA;
+
+	return true;
+}
+
 static bool its_set_non_coherent(void *data)
 {
 	struct its_node *its = data;
@@ -4815,6 +4826,14 @@ static const struct gic_quirk its_quirks[] = {
 		.mask   = 0xffffffff,
 		.init   = its_enable_rk3588001,
 	},
+#endif
+#ifdef CONFIG_RENESAS_RCAR_GIC_ITS
+	{
+		.desc   = "ITS: Renesas R-Car Gen4 GICv3 ITS",
+		.iidr   = 0x0201743b,
+		.mask   = 0xffffffff,
+		.init   = its_enable_renesas_rcar_gic_its,
+	},
 #endif
 	{
 		.desc   = "ITS: non-coherent attribute",
@@ -4974,7 +4993,7 @@ static int its_init_domain(struct its_node *its)
 	struct irq_domain *inner_domain;
 	struct msi_domain_info *info;
 
-	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL | its_gfp_quirk);
 	if (!info)
 		return -ENOMEM;
 
@@ -5011,7 +5030,7 @@ static int its_init_vpe_domain(void)
 
 	entries = roundup_pow_of_two(nr_cpu_ids);
 	vpe_proxy.vpes = kcalloc(entries, sizeof(*vpe_proxy.vpes),
-				 GFP_KERNEL);
+				 GFP_KERNEL | its_gfp_quirk);
 	if (!vpe_proxy.vpes)
 		return -ENOMEM;
 
@@ -5108,7 +5127,7 @@ static int __init its_probe_one(struct its_node *its)
 		}
 	}
 
-	page = alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO,
+	page = alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO | its_gfp_quirk,
 				get_order(ITS_CMD_QUEUE_SZ));
 	if (!page) {
 		err = -ENOMEM;
@@ -5352,7 +5371,7 @@ static struct its_node __init *its_node_init(struct resource *res,
 
 	pr_info("ITS %pR\n", res);
 
-	its = kzalloc(sizeof(*its), GFP_KERNEL);
+	its = kzalloc(sizeof(*its), GFP_KERNEL | its_gfp_quirk);
 	if (!its)
 		goto out_unmap;
 
@@ -5520,7 +5539,7 @@ static void __init acpi_table_parse_srat_its(void)
 		return;
 
 	its_srat_maps = kmalloc_array(count, sizeof(struct its_srat_map),
-				      GFP_KERNEL);
+				      GFP_KERNEL | its_gfp_quirk);
 	if (!its_srat_maps)
 		return;
 
-- 
2.25.1


