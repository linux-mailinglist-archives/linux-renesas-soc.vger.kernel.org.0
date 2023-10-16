Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2DE7C9F25
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 07:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbjJPFs1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 01:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbjJPFsX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 01:48:23 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7956BFB;
        Sun, 15 Oct 2023 22:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=+FPz7Ddw0opVwX7ZO8En7vSHubL/dQg5n7dN1DBxBIs=; b=JaJecFTPI62ol/ujAU6+xzdcS1
        xxYEqP903rSRjbZaAaTdgiFl5T2wuyVPVV/SGhnHZ4D2oXimjn1tKzK0urB2sGTYywR0F0qTzvp2l
        rp6d1g9BRSwlfAkYI2o2vysJl3EX8Yykt+hNFFLZ+9lz3e3PAubXPCAp/k/FpVNfxjALodLVLIL2r
        v/L1j8fraL8vFKcR+GWCm5dsuWCSzPgXAGE1G7hCazeirfazrLI8YnnJq9rqMUM8KoeW0hGkcmZ1B
        puIcMPPV517sjRY5xh2DTm/taqP+/hiCQIQIt6xx/jNr2jV9WmLSdBN+qMCjt5AL1P9tESsEzJ9P3
        RlzR0oOA==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qsGSb-008QlK-2d;
        Mon, 16 Oct 2023 05:48:14 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
Subject: [PATCH 06/12] dma-direct: add a CONFIG_ARCH_DMA_ALLOC symbol
Date:   Mon, 16 Oct 2023 07:47:48 +0200
Message-Id: <20231016054755.915155-7-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231016054755.915155-1-hch@lst.de>
References: <20231016054755.915155-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Instead of using arch_dma_alloc if none of the generic coherent
allocators are used, require the architectures to explicitly opt into
providing it.  This will used to deal with the case of m68knommu and
coldfire where we can't do any coherent allocations whatsoever, and
also makes it clear that arch_dma_alloc is a last resort.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/Kconfig    |  1 +
 arch/m68k/Kconfig   |  1 +
 arch/parisc/Kconfig |  1 +
 kernel/dma/Kconfig  |  9 +++++++++
 kernel/dma/direct.c | 12 ++----------
 5 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9557808e8937b1..a3fdf584278f86 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -4,6 +4,7 @@ config ARM
 	default y
 	select ARCH_32BIT_OFF_T
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE if HAVE_KRETPROBES && FRAME_POINTER && !ARM_UNWIND
+	select ARCH_DMA_ALLOC if MMU
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 3e318bf9504c5b..0430b8ba6b5cc6 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -3,6 +3,7 @@ config M68K
 	bool
 	default y
 	select ARCH_32BIT_OFF_T
+	select ARCH_DMA_ALLOC if !MMU || COLDFIRE
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index a15ab147af2e07..30a4916fa9b0cc 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -3,6 +3,7 @@ config PARISC
 	def_bool y
 	select ALTERNATE_USER_ADDRESS_SPACE
 	select ARCH_32BIT_OFF_T if !64BIT
+	select ARCH_DMA_ALLOC if PA11
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select HAVE_FUNCTION_TRACER
 	select HAVE_FUNCTION_GRAPH_TRACER
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 4524db877eba36..515d2063b509ac 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -144,6 +144,15 @@ config DMA_DIRECT_REMAP
 	select DMA_COHERENT_POOL
 	select DMA_NONCOHERENT_MMAP
 
+#
+# Fallback to arch code for DMA allocations.  This should eventually go away.
+#
+config ARCH_DMA_ALLOC
+	depends on !ARCH_HAS_DMA_SET_UNCACHED
+	depends on !DMA_DIRECT_REMAP
+	depends on !DMA_GLOBAL_POOL
+	bool
+
 config DMA_CMA
 	bool "DMA Contiguous Memory Allocator"
 	depends on HAVE_DMA_CONTIGUOUS && CMA
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 9596ae1aa0dacf..ec410af1d8a14e 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -220,13 +220,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		return dma_direct_alloc_no_mapping(dev, size, dma_handle, gfp);
 
 	if (!dev_is_dma_coherent(dev)) {
-		/*
-		 * Fallback to the arch handler if it exists.  This should
-		 * eventually go away.
-		 */
-		if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-		    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-		    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
+		if (IS_ENABLED(CONFIG_ARCH_DMA_ALLOC) &&
 		    !is_swiotlb_for_alloc(dev))
 			return arch_dma_alloc(dev, size, dma_handle, gfp,
 					      attrs);
@@ -330,9 +324,7 @@ void dma_direct_free(struct device *dev, size_t size,
 		return;
 	}
 
-	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
+	if (IS_ENABLED(CONFIG_ARCH_DMA_ALLOC) &&
 	    !dev_is_dma_coherent(dev) &&
 	    !is_swiotlb_for_alloc(dev)) {
 		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
-- 
2.39.2

