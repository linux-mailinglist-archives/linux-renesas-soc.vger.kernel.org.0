Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A07C87C9F28
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 07:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjJPFsf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 01:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbjJPFsa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 01:48:30 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7BAD6;
        Sun, 15 Oct 2023 22:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=Xvh7Q4BkliSXnT7Ag6Or9ECxhuG0z7KZ9ZBBigZbpKk=; b=sXex8CGidA3UYIp/+9bbjcFPx+
        pMqiOUbeWagvKBIYUxlfbSzifLi+AoxfLOLyxRUpbIaW0RlerBxsLHobzV54a3U69NmvuIGo6iEM0
        48QlWkRmyAF9b3GJ9y294r+C/nLNKehncrQgxYzmiqxYVRM8mbsH2kEgWP483P19hy2pOF32gwafW
        7Onn+RGB0EOUXMnvuUTHO2S9tGzXaHQs3xC3fnAcHxb/PUE2PgVuX6YV/DfXwXrCEbt0HXkghIQCB
        rO3hR3D3Vie8+pOBFxheoh0Ypv5VJ61IZptaCLg1wBKNYzK8jqFuDaazksDZe0EjUOTddFbsU9xw6
        pQQne1RQ==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qsGSj-008Qua-13;
        Mon, 16 Oct 2023 05:48:21 +0000
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
Subject: [PATCH 09/12] m68k: use the coherent DMA code for coldfire without data cache
Date:   Mon, 16 Oct 2023 07:47:51 +0200
Message-Id: <20231016054755.915155-10-hch@lst.de>
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

Coldfire cores configured without a data cache are DMA coherent and
should thus simply use the simple coherent version of dma-direct.

Introduce a new COLDFIRE_COHERENT_DMA Kconfig symbol as a convenient
short hand for such configurations, and a M68K_NONCOHERENT_DMA symbol
for all cases where we need to build non-coherent DMA infrastructure
to simplify the Kconfig and code conditionals.

Not building the non-coherent DMA code slightly reduces the code
size for such configurations.

Numers for m5249evb_defconfig below:

  text	   data	    bss	    dec	    hex	filename
2896158	 401052	  65392	3362602	 334f2a	vmlinux.before
2895166	 400988	  65392	3361546	 334b0a	vmlinux.after

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/Kconfig         |  8 ++++----
 arch/m68k/Kconfig.cpu     | 12 ++++++++++++
 arch/m68k/kernel/Makefile |  2 +-
 arch/m68k/kernel/dma.c    |  2 +-
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 0430b8ba6b5cc6..6c585eae89f4dc 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -3,19 +3,19 @@ config M68K
 	bool
 	default y
 	select ARCH_32BIT_OFF_T
-	select ARCH_DMA_ALLOC if !MMU || COLDFIRE
+	select ARCH_DMA_ALLOC if M68K_NONCOHERENT_DMA && COLDFIRE
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
-	select ARCH_HAS_DMA_PREP_COHERENT if HAS_DMA && MMU && !COLDFIRE
-	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if HAS_DMA
+	select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE
+	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
 	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
 	select ARCH_NO_PREEMPT if !COLDFIRE
 	select ARCH_USE_MEMTEST if MMU_MOTOROLA
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
-	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
+	select DMA_DIRECT_REMAP if M68K_NONCOHERENT_DMA && !COLDFIRE
 	select GENERIC_ATOMIC64
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IOMAP
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index b826e9c677b2ae..e8905d38c714c4 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -535,3 +535,15 @@ config CACHE_COPYBACK
 	  The ColdFire CPU cache is set into Copy-back mode.
 endchoice
 endif # HAVE_CACHE_CB
+
+# Coldfire cores that do not have a data cache configured can do coherent DMA.
+config COLDFIRE_COHERENT_DMA
+	bool
+	default y
+	depends on COLDFIRE
+	depends on !HAVE_CACHE_CB && !CONFIG_CACHE_D && !CONFIG_CACHE_BOTH
+
+config M68K_NONCOHERENT_DMA
+	bool
+	default y
+	depends on HAS_DMA && !COLDFIRE_COHERENT_DMA
diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index af015447dfb4c1..01fb69a5095f43 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -23,7 +23,7 @@ obj-$(CONFIG_MMU_MOTOROLA) += ints.o vectors.o
 obj-$(CONFIG_MMU_SUN3) += ints.o vectors.o
 obj-$(CONFIG_PCI) += pcibios.o
 
-obj-$(CONFIG_HAS_DMA)	+= dma.o
+obj-$(CONFIG_M68K_NONCOHERENT_DMA) += dma.o
 
 obj-$(CONFIG_KEXEC)		+= machine_kexec.o relocate_kernel.o
 obj-$(CONFIG_BOOTINFO_PROC)	+= bootinfo_proc.o
diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index 2e192a5df949bb..f83870cfa79b37 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -17,7 +17,7 @@
 
 #include <asm/cacheflush.h>
 
-#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
+#ifndef CONFIG_COLDFIRE
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	cache_push(page_to_phys(page), size);
-- 
2.39.2

