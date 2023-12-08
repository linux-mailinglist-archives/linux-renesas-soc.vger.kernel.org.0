Return-Path: <linux-renesas-soc+bounces-849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D704809AE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 05:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D72AA1F20EEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 04:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D1363CD;
	Fri,  8 Dec 2023 04:10:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 68B311722;
	Thu,  7 Dec 2023 20:10:41 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,259,1695654000"; 
   d="scan'208";a="189614335"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Dec 2023 13:10:37 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B5E58415E8D6;
	Fri,  8 Dec 2023 13:10:37 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v5 4/9] net: rswitch: Add unmap_addrs instead of dma address in each desc
Date: Fri,  8 Dec 2023 13:10:25 +0900
Message-Id: <20231208041030.2497657-5-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208041030.2497657-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231208041030.2497657-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the driver would like to transmit a jumbo frame like 2KiB or more,
it should be split into multiple queues. In the near future, to support
this, add unmap_addrs array to unmap dma mapping address instead of dma
address in each TX descriptor because the descriptors may not have
the top dma address.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 19 +++++++++++--------
 drivers/net/ethernet/renesas/rswitch.h |  1 +
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index c6a96abe9dba..c2125fefc8c5 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -284,6 +284,8 @@ static void rswitch_gwca_queue_free(struct net_device *ndev,
 		gq->tx_ring = NULL;
 		kfree(gq->skbs);
 		gq->skbs = NULL;
+		kfree(gq->unmap_addrs);
+		gq->unmap_addrs = NULL;
 	}
 }
 
@@ -322,6 +324,9 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
 		gq->skbs = kcalloc(gq->ring_size, sizeof(*gq->skbs), GFP_KERNEL);
 		if (!gq->skbs)
 			return -ENOMEM;
+		gq->unmap_addrs = kcalloc(gq->ring_size, sizeof(*gq->unmap_addrs), GFP_KERNEL);
+		if (!gq->unmap_addrs)
+			goto out;
 		gq->tx_ring = dma_alloc_coherent(ndev->dev.parent,
 						 sizeof(struct rswitch_ext_desc) *
 						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
@@ -787,9 +792,7 @@ static void rswitch_tx_free(struct net_device *ndev)
 	struct rswitch_device *rdev = netdev_priv(ndev);
 	struct rswitch_gwca_queue *gq = rdev->tx_queue;
 	struct rswitch_ext_desc *desc;
-	dma_addr_t dma_addr;
 	struct sk_buff *skb;
-	unsigned int size;
 
 	for (; rswitch_get_num_cur_queues(gq) > 0;
 	     gq->dirty = rswitch_next_queue_index(gq, false, 1)) {
@@ -798,18 +801,17 @@ static void rswitch_tx_free(struct net_device *ndev)
 			break;
 
 		dma_rmb();
-		size = le16_to_cpu(desc->desc.info_ds) & TX_DS;
 		skb = gq->skbs[gq->dirty];
 		if (skb) {
-			dma_addr = rswitch_desc_get_dptr(&desc->desc);
-			dma_unmap_single(ndev->dev.parent, dma_addr,
-					 size, DMA_TO_DEVICE);
+			dma_unmap_single(ndev->dev.parent,
+					 gq->unmap_addrs[gq->dirty],
+					 skb->len, DMA_TO_DEVICE);
 			dev_kfree_skb_any(gq->skbs[gq->dirty]);
 			gq->skbs[gq->dirty] = NULL;
+			rdev->ndev->stats.tx_packets++;
+			rdev->ndev->stats.tx_bytes += skb->len;
 		}
 		desc->desc.die_dt = DT_EEMPTY;
-		rdev->ndev->stats.tx_packets++;
-		rdev->ndev->stats.tx_bytes += size;
 	}
 }
 
@@ -1538,6 +1540,7 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 		goto err_kfree;
 
 	gq->skbs[gq->cur] = skb;
+	gq->unmap_addrs[gq->cur] = dma_addr;
 	desc = &gq->tx_ring[gq->cur];
 	rswitch_desc_set_dptr(&desc->desc, dma_addr);
 	desc->desc.info_ds = cpu_to_le16(skb->len);
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index a407d85dcfad..2ac9a86b6238 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -956,6 +956,7 @@ struct rswitch_gwca_queue {
 		/* For TX */
 		struct {
 			struct sk_buff **skbs;
+			dma_addr_t *unmap_addrs;
 		};
 		/* For RX */
 		struct {
-- 
2.25.1


