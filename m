Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C642C7C9F24
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 07:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjJPFs1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 01:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbjJPFsY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 01:48:24 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A14A1;
        Sun, 15 Oct 2023 22:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=nLXJ74DIlmTyEfUCPxCnxHOKUZ2EbH9X62hrp3In1pc=; b=09FmZ4C/8PRH4IgHw5MMHG02Ny
        tTIrjcr6BA4ng0RZblTOiQIedflmn/wKbA5qX4pOe3gvVxcol1aSzltYvqgGVP9B4/fqNbKFrwpIS
        zv4YrACogT+ZSpR4Wg0vSg+b7ADzdLb3VXTZ4fcu5fY+fdJUzK60grBma2GPM+gF08XxQl/WCddP3
        tvj/64IYNZvmz7MvVQKsjjHfuZ8ITh3u2Pq8D6doV0Ro0E2OZ9HxI20HOLWwvTLwGce7qd5l3Hm0N
        V0z3YjmoJZ5/WK13hizinR7du2LzmudVqcK1MlZ+lLUK/IhZPmQ6uipRfKrkLAgfBYVGi5u7CbBuZ
        tLAWwddQ==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qsGSe-008QoD-1S;
        Mon, 16 Oct 2023 05:48:16 +0000
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
Subject: [PATCH 07/12] dma-direct: simplify the use atomic pool logic in dma_direct_alloc
Date:   Mon, 16 Oct 2023 07:47:49 +0200
Message-Id: <20231016054755.915155-8-hch@lst.de>
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

The logic in dma_direct_alloc when to use the atomic pool vs remapping
grew a bit unreadable.  Consolidate it into a single check, and clean
up the set_uncached vs remap logic a bit as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index ec410af1d8a14e..1327d04fa32a25 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -234,27 +234,22 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 					dma_handle);
 
 		/*
-		 * Otherwise remap if the architecture is asking for it.  But
-		 * given that remapping memory is a blocking operation we'll
-		 * instead have to dip into the atomic pools.
+		 * Otherwise we require the architecture to either be able to
+		 * mark arbitrary parts of the kernel direct mapping uncached,
+		 * or remapped it uncached.
 		 */
+		set_uncached = IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED);
 		remap = IS_ENABLED(CONFIG_DMA_DIRECT_REMAP);
-		if (remap) {
-			if (dma_direct_use_pool(dev, gfp))
-				return dma_direct_alloc_from_pool(dev, size,
-						dma_handle, gfp);
-		} else {
-			if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED))
-				return NULL;
-			set_uncached = true;
-		}
+		if (!set_uncached && !remap)
+			return NULL;
 	}
 
 	/*
-	 * Decrypting memory may block, so allocate the memory from the atomic
-	 * pools if we can't block.
+	 * Remapping or decrypting memory may block, allocate the memory from
+	 * the atomic pools instead if we aren't allowed block.
 	 */
-	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
+	if ((remap || force_dma_unencrypted(dev)) &&
+	    dma_direct_use_pool(dev, gfp))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
 	/* we always manually zero the memory once we are done */
-- 
2.39.2

