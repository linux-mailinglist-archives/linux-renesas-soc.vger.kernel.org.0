Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFD737CD385
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Oct 2023 07:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjJRF1J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Oct 2023 01:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjJRF1I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2023 01:27:08 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFF4B0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Oct 2023 22:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=Dg71jABRFFxFAs6VEuUBooR6bWlwptw1eIXzksL6fPM=; b=4HFJc7kXawQ6YmNcMm10THJLCx
        UT/2f5jpa10flaXdr2bBwKgBxkhcJa+cVP5vxUqnYmfQV9NjM9gipGPKzsX0qBEPr0f/nx1rvgmBL
        H1ZSRSQPBDOrM7ctfZla8ocGuPFxbh6WNdrw20+p1l2c3PFTIrM4xwZ5J76+tSadYxB28TPbW4wcy
        1tF1nrEiuTLZlQyhGT11+wkQeC/swQjSkXqakm0u22cEW+0Oc4lBsOFbiRZDjhDokRw+Gj9MWe25X
        H7E1HNGb4OQzk4yBU2ixSC4+Cpjzyf8q5lgGjB4odyWn2m3KWD3MnWi94YSyx1aG9mdIGrGNqp1SI
        Yy/DqEBA==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qsz5C-00Dp3e-0O;
        Wed, 18 Oct 2023 05:27:02 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Samuel Holland <samuel.holland@sifive.com>, soc@kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM and ERRATA_THEAD_PBMT
Date:   Wed, 18 Oct 2023 07:26:53 +0200
Message-Id: <20231018052654.50074-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231018052654.50074-1-hch@lst.de>
References: <20231018052654.50074-1-hch@lst.de>
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

RISCV_DMA_NONCOHERENT is also used for whacky non-standard
non-coherent ops that use different hooks in dma-direct.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/Kconfig        | 2 +-
 arch/riscv/Kconfig.errata | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0ac0b538379718..9c48fecc671918 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -273,7 +273,6 @@ config RISCV_DMA_NONCOHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
-	select DMA_DIRECT_REMAP if MMU
 
 config RISCV_NONSTANDARD_CACHE_OPS
 	bool
@@ -549,6 +548,7 @@ config RISCV_ISA_ZICBOM
 	depends on RISCV_ALTERNATIVE
 	default y
 	select RISCV_DMA_NONCOHERENT
+	select DMA_DIRECT_REMAP
 	help
 	   Adds support to dynamically detect the presence of the ZICBOM
 	   extension (Cache Block Management Operations) and enable its
diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 566bcefeab502c..e2c731cfed8cc6 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -77,6 +77,7 @@ config ERRATA_THEAD_PBMT
 config ERRATA_THEAD_CMO
 	bool "Apply T-Head cache management errata"
 	depends on ERRATA_THEAD && MMU
+	select DMA_DIRECT_REMAP
 	select RISCV_DMA_NONCOHERENT
 	default y
 	help
-- 
2.39.2

