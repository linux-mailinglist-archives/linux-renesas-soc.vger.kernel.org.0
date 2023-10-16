Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCB017C9F1F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 07:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbjJPFsP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 01:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjJPFsO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 01:48:14 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921C7F4;
        Sun, 15 Oct 2023 22:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=WUNnW2AzudcNr4qo2U1qAYpqA55+BUJ9igvSrFrJsk0=; b=k9gRQmW3KX85+dvAm7SRblzVlF
        8yt/+UihM/RmRRmyHk7PBZmtccb2GrfmrT5QymkNnPZTjG6GkUfDtN/+PBwoFbAtc2nTHA1LofGoZ
        kh1TQEbcNuFER0Y9kUOxeWC1WE5P4Py6NxanrNWyKv0AR3+Udgz+XfDE9DFlZ/B2w/2c8KMYbxZma
        RpSFh2lh7P5O/gyf+225JI9+v+QQ0TJkz/9EKr3Bjh0UTx8crzMs8TqaTNr2h9IQ5h0U1knAU9VWB
        CUnV+4VVZ0xZgseUkikX2np0Wpg+R+/8MsNZAeJDEXqdinkkQKFYAh7i+HIfcbEsQgHcg3oI1I1qA
        FdymHa9g==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qsGSP-008QfY-1h;
        Mon, 16 Oct 2023 05:48:01 +0000
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
Subject: [PATCH 01/12] riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT
Date:   Mon, 16 Oct 2023 07:47:43 +0200
Message-Id: <20231016054755.915155-2-hch@lst.de>
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

RISCV_NONSTANDARD_CACHE_OPS is also used for the pmem cache maintenance
helpers, which are built into the kernel unconditionally.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/Kconfig          | 1 -
 drivers/cache/Kconfig       | 2 +-
 drivers/soc/renesas/Kconfig | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6daf..0ac0b538379718 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -277,7 +277,6 @@ config RISCV_DMA_NONCOHERENT
 
 config RISCV_NONSTANDARD_CACHE_OPS
 	bool
-	depends on RISCV_DMA_NONCOHERENT
 	help
 	  This enables function pointer support for non-standard noncoherent
 	  systems to handle cache management.
diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index a57677f908f3ba..d6e5e3abaad8af 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -3,7 +3,7 @@ menu "Cache Drivers"
 
 config AX45MP_L2_CACHE
 	bool "Andes Technology AX45MP L2 Cache controller"
-	depends on RISCV_DMA_NONCOHERENT
+	depends on RISCV
 	select RISCV_NONSTANDARD_CACHE_OPS
 	help
 	  Support for the L2 cache controller on Andes Technology AX45MP platforms.
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 12040ce116a551..880c544bb2dfda 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -335,7 +335,7 @@ config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	depends on NONPORTABLE
 	select ARCH_RZG2L
-	select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
+	select AX45MP_L2_CACHE
 	select DMA_GLOBAL_POOL
 	select ERRATA_ANDES if RISCV_SBI
 	select ERRATA_ANDES_CMO if ERRATA_ANDES
-- 
2.39.2

