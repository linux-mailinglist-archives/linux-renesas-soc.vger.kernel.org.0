Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 813747C9F29
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 07:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbjJPFsg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 01:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbjJPFsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 01:48:32 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A5EF2;
        Sun, 15 Oct 2023 22:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=mtaFs+wzt9HkB0YMSqJ/hXvaBaJHLD/P5gvZvdhiE64=; b=EV+u9l4mk8RQYm/EX2EbeAcc4w
        ogppRd8bc1GCnEqi8+1QYFO2eN1mWS0182wHGtTsvg2XVGJ06CM195uz13JFmYAf/wAd3zm4gEITP
        hq6jWIG6lN3s2ZDTHv+JUSOWDam664hqayTVCgBT9j2jOezFFb2BtKfIo6w4fKd82YQ7TmKqKhyIP
        1g7zWmPHlRNeOZKUwT8mn1fRNv8Yjukb54nGxgWUGS+81rnhDIPfj1tnuVtB8dooMOtrt5SICiC9I
        PAUcfJvEu3/R0L7h/lUYz05tL3Ux5f7iVfA3Xz8w9i8gmMFpEexY+FLdi5GjYcu+sHRGWJhxSnvjr
        JXYs2LgA==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qsGSl-008Qwm-2w;
        Mon, 16 Oct 2023 05:48:24 +0000
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
Subject: [PATCH 10/12] net: fec: use dma_alloc_noncoherent for data cache enabled coldfire
Date:   Mon, 16 Oct 2023 07:47:52 +0200
Message-Id: <20231016054755.915155-11-hch@lst.de>
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

Coldfire platforms with data caches can't properly implement
dma_alloc_coherent and currently just return noncoherent memory from
dma_alloc_coherent.

The fec driver than works around this with a flush of all caches in the
receive path. Make this hack a little less bad by using the explicit
dma_alloc_noncoherent API and documenting the hacky cache flushes so
that the DMA API level hack can be removed.

Also replace the check for CONFIG_M532x for said hack with a check
for COLDFIRE && !COLDFIRE_COHERENT_DMA.  While m532x is the only such
platform with a fec module, this makes the code more consistent and
easier to follow.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/net/ethernet/freescale/fec_main.c | 86 ++++++++++++++++++++---
 1 file changed, 76 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 77c8e9cfb44562..3fc3444402622b 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -406,6 +406,70 @@ static void fec_dump(struct net_device *ndev)
 	} while (bdp != txq->bd.base);
 }
 
+/*
+ * Coldfire does not support DMA coherent allocations, and has historically used
+ * a band-aid with a manual flush in fec_enet_rx_queue.
+ */
+#if defined(CONFIG_COLDFIRE) && !defined(CONFIG_COLDFIRE_COHERENT_DMA)
+static void *fec_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
+		gfp_t gfp)
+{
+	return dma_alloc_noncoherent(dev, size, handle, DMA_BIDIRECTIONAL, gfp);
+}
+
+static void fec_dma_free(struct device *dev, size_t size, void *cpu_addr,
+		dma_addr_t handle)
+{
+	dma_free_noncoherent(dev, size, cpu_addr, handle, DMA_BIDIRECTIONAL);
+}
+#else /* CONFIG_COLDFIRE && !CONFIG_COLDFIRE_COHERENT_DMA */
+static void *fec_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
+		gfp_t gfp)
+{
+	return dma_alloc_coherent(dev, size, handle, gfp);
+}
+
+static void fec_dma_free(struct device *dev, size_t size, void *cpu_addr,
+		dma_addr_t handle)
+{
+	dma_free_coherent(dev, size, cpu_addr, handle);
+}
+#endif /* !CONFIG_COLDFIRE && !CONFIG_COLDFIRE_COHERENT_DMA */
+
+struct fec_dma_devres {
+	size_t		size;
+	void		*vaddr;
+	dma_addr_t	dma_handle;
+};
+
+static void fec_dmam_release(struct device *dev, void *res)
+{
+	struct fec_dma_devres *this = res;
+
+	fec_dma_free(dev, this->size, this->vaddr, this->dma_handle);
+}
+
+static void *fec_dmam_alloc(struct device *dev, size_t size, dma_addr_t *handle,
+		gfp_t gfp)
+{
+	struct fec_dma_devres *dr;
+	void *vaddr;
+
+	dr = devres_alloc(fec_dmam_release, sizeof(*dr), gfp);
+	if (!dr)
+		return NULL;
+	vaddr = fec_dma_alloc(dev, size, handle, gfp);
+	if (!vaddr) {
+		devres_free(dr);
+		return NULL;
+	}
+	dr->vaddr = vaddr;
+	dr->dma_handle = *handle;
+	dr->size = size;
+	devres_add(dev, dr);
+	return vaddr;
+}
+
 static inline bool is_ipv4_pkt(struct sk_buff *skb)
 {
 	return skb->protocol == htons(ETH_P_IP) && ip_hdr(skb)->version == 4;
@@ -1660,7 +1724,11 @@ fec_enet_rx_queue(struct net_device *ndev, int budget, u16 queue_id)
 	}
 #endif
 
-#ifdef CONFIG_M532x
+#if defined(CONFIG_COLDFIRE) && !defined(CONFIG_COLDFIRE_COHERENT_DMA)
+	/*
+	 * Hacky flush of all caches instead of using the DMA API for the TSO
+	 * headers.
+	 */
 	flush_cache_all();
 #endif
 	rxq = fep->rx_queue[queue_id];
@@ -3288,10 +3356,9 @@ static void fec_enet_free_queue(struct net_device *ndev)
 	for (i = 0; i < fep->num_tx_queues; i++)
 		if (fep->tx_queue[i] && fep->tx_queue[i]->tso_hdrs) {
 			txq = fep->tx_queue[i];
-			dma_free_coherent(&fep->pdev->dev,
-					  txq->bd.ring_size * TSO_HEADER_SIZE,
-					  txq->tso_hdrs,
-					  txq->tso_hdrs_dma);
+			fec_dma_free(&fep->pdev->dev,
+				     txq->bd.ring_size * TSO_HEADER_SIZE,
+				     txq->tso_hdrs, txq->tso_hdrs_dma);
 		}
 
 	for (i = 0; i < fep->num_rx_queues; i++)
@@ -3321,10 +3388,9 @@ static int fec_enet_alloc_queue(struct net_device *ndev)
 		txq->tx_stop_threshold = FEC_MAX_SKB_DESCS;
 		txq->tx_wake_threshold = FEC_MAX_SKB_DESCS + 2 * MAX_SKB_FRAGS;
 
-		txq->tso_hdrs = dma_alloc_coherent(&fep->pdev->dev,
+		txq->tso_hdrs = fec_dma_alloc(&fep->pdev->dev,
 					txq->bd.ring_size * TSO_HEADER_SIZE,
-					&txq->tso_hdrs_dma,
-					GFP_KERNEL);
+					&txq->tso_hdrs_dma, GFP_KERNEL);
 		if (!txq->tso_hdrs) {
 			ret = -ENOMEM;
 			goto alloc_failed;
@@ -4043,8 +4109,8 @@ static int fec_enet_init(struct net_device *ndev)
 	bd_size = (fep->total_tx_ring_size + fep->total_rx_ring_size) * dsize;
 
 	/* Allocate memory for buffer descriptors. */
-	cbd_base = dmam_alloc_coherent(&fep->pdev->dev, bd_size, &bd_dma,
-				       GFP_KERNEL);
+	cbd_base = fec_dmam_alloc(&fep->pdev->dev, bd_size, &bd_dma,
+				  GFP_KERNEL);
 	if (!cbd_base) {
 		ret = -ENOMEM;
 		goto free_queue_mem;
-- 
2.39.2

