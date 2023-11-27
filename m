Return-Path: <linux-renesas-soc+bounces-282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCAD7F9F19
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 12:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88B33B21036
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 11:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B3F2D029;
	Mon, 27 Nov 2023 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 402FE13A;
	Mon, 27 Nov 2023 03:53:42 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,230,1695654000"; 
   d="scan'208";a="188253120"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Nov 2023 20:53:40 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0C8C6400C4CD;
	Mon, 27 Nov 2023 20:53:40 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next 3/9] net: rswitch: Use build_skb() for RX
Date: Mon, 27 Nov 2023 20:53:28 +0900
Message-Id: <20231127115334.3670790-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127115334.3670790-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231127115334.3670790-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If this hardware receives a jumbo frame like 2KiB or more, it will be
split into multiple queues. In near the future, to support this, use
build_skb() instead of netdev_alloc_skb_ip_align().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 72 +++++++++++++++-----------
 drivers/net/ethernet/renesas/rswitch.h | 19 ++++++-
 2 files changed, 58 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 0928003ad245..8337c860eb9a 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -235,19 +235,18 @@ static bool rswitch_is_queue_rxed(struct rswitch_gwca_queue *gq)
 	return false;
 }
 
-static int rswitch_gwca_queue_alloc_skb(struct rswitch_gwca_queue *gq,
-					unsigned int start_index,
-					unsigned int num)
+static int rswitch_gwca_queue_alloc_rx_buf(struct rswitch_gwca_queue *gq,
+					   unsigned int start_index,
+					   unsigned int num)
 {
 	unsigned int i, index;
 
 	for (i = 0; i < num; i++) {
 		index = (i + start_index) % gq->ring_size;
-		if (gq->skbs[index])
+		if (gq->rx_bufs[index])
 			continue;
-		gq->skbs[index] = netdev_alloc_skb_ip_align(gq->ndev,
-							    PKT_BUF_SZ + RSWITCH_ALIGN - 1);
-		if (!gq->skbs[index])
+		gq->rx_bufs[index] = netdev_alloc_frag(RSWITCH_BUF_SIZE);
+		if (!gq->rx_bufs[index])
 			goto err;
 	}
 
@@ -256,8 +255,8 @@ static int rswitch_gwca_queue_alloc_skb(struct rswitch_gwca_queue *gq,
 err:
 	for (; i-- > 0; ) {
 		index = (i + start_index) % gq->ring_size;
-		dev_kfree_skb(gq->skbs[index]);
-		gq->skbs[index] = NULL;
+		skb_free_frag(gq->rx_bufs[index]);
+		gq->rx_bufs[index] = NULL;
 	}
 
 	return -ENOMEM;
@@ -275,16 +274,17 @@ static void rswitch_gwca_queue_free(struct net_device *ndev,
 		gq->rx_ring = NULL;
 
 		for (i = 0; i < gq->ring_size; i++)
-			dev_kfree_skb(gq->skbs[i]);
+			skb_free_frag(gq->rx_bufs[i]);
+		kfree(gq->rx_bufs);
+		gq->rx_bufs = NULL;
 	} else {
 		dma_free_coherent(ndev->dev.parent,
 				  sizeof(struct rswitch_ext_desc) *
 				  (gq->ring_size + 1), gq->tx_ring, gq->ring_dma);
 		gq->tx_ring = NULL;
+		kfree(gq->skbs);
+		gq->skbs = NULL;
 	}
-
-	kfree(gq->skbs);
-	gq->skbs = NULL;
 }
 
 static void rswitch_gwca_ts_queue_free(struct rswitch_private *priv)
@@ -308,17 +308,19 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
 	gq->ring_size = ring_size;
 	gq->ndev = ndev;
 
-	gq->skbs = kcalloc(gq->ring_size, sizeof(*gq->skbs), GFP_KERNEL);
-	if (!gq->skbs)
-		return -ENOMEM;
-
 	if (!dir_tx) {
-		rswitch_gwca_queue_alloc_skb(gq, 0, gq->ring_size);
+		gq->rx_bufs = kcalloc(gq->ring_size, sizeof(*gq->rx_bufs), GFP_KERNEL);
+		if (!gq->rx_bufs)
+			goto out;
+		rswitch_gwca_queue_alloc_rx_buf(gq, 0, gq->ring_size);
 
 		gq->rx_ring = dma_alloc_coherent(ndev->dev.parent,
 						 sizeof(struct rswitch_ext_ts_desc) *
 						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
 	} else {
+		gq->skbs = kcalloc(gq->ring_size, sizeof(*gq->skbs), GFP_KERNEL);
+		if (!gq->skbs)
+			return -ENOMEM;
 		gq->tx_ring = dma_alloc_coherent(ndev->dev.parent,
 						 sizeof(struct rswitch_ext_desc) *
 						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
@@ -367,12 +369,13 @@ static int rswitch_gwca_queue_format(struct net_device *ndev,
 	for (i = 0, desc = gq->tx_ring; i < gq->ring_size; i++, desc++) {
 		if (!gq->dir_tx) {
 			dma_addr = dma_map_single(ndev->dev.parent,
-						  gq->skbs[i]->data, PKT_BUF_SZ,
+						  gq->rx_bufs[i] + RSWITCH_HEADROOM,
+						  RSWITCH_MAP_BUF_SIZE,
 						  DMA_FROM_DEVICE);
 			if (dma_mapping_error(ndev->dev.parent, dma_addr))
 				goto err;
 
-			desc->desc.info_ds = cpu_to_le16(PKT_BUF_SZ);
+			desc->desc.info_ds = cpu_to_le16(RSWITCH_DESC_BUF_SIZE);
 			rswitch_desc_set_dptr(&desc->desc, dma_addr);
 			desc->desc.die_dt = DT_FEMPTY | DIE;
 		} else {
@@ -395,8 +398,8 @@ static int rswitch_gwca_queue_format(struct net_device *ndev,
 	if (!gq->dir_tx) {
 		for (desc = gq->tx_ring; i-- > 0; desc++) {
 			dma_addr = rswitch_desc_get_dptr(&desc->desc);
-			dma_unmap_single(ndev->dev.parent, dma_addr, PKT_BUF_SZ,
-					 DMA_FROM_DEVICE);
+			dma_unmap_single(ndev->dev.parent, dma_addr,
+					 RSWITCH_MAP_BUF_SIZE, DMA_FROM_DEVICE);
 		}
 	}
 
@@ -433,12 +436,13 @@ static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
 		desc = &gq->rx_ring[index];
 		if (!gq->dir_tx) {
 			dma_addr = dma_map_single(ndev->dev.parent,
-						  gq->skbs[index]->data, PKT_BUF_SZ,
+						  gq->rx_bufs[index] + RSWITCH_HEADROOM,
+						  RSWITCH_MAP_BUF_SIZE,
 						  DMA_FROM_DEVICE);
 			if (dma_mapping_error(ndev->dev.parent, dma_addr))
 				goto err;
 
-			desc->desc.info_ds = cpu_to_le16(PKT_BUF_SZ);
+			desc->desc.info_ds = cpu_to_le16(RSWITCH_DESC_BUF_SIZE);
 			rswitch_desc_set_dptr(&desc->desc, dma_addr);
 			dma_wmb();
 			desc->desc.die_dt = DT_FEMPTY | DIE;
@@ -456,8 +460,8 @@ static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
 			index = (i + start_index) % gq->ring_size;
 			desc = &gq->rx_ring[index];
 			dma_addr = rswitch_desc_get_dptr(&desc->desc);
-			dma_unmap_single(ndev->dev.parent, dma_addr, PKT_BUF_SZ,
-					 DMA_FROM_DEVICE);
+			dma_unmap_single(ndev->dev.parent, dma_addr,
+					 RSWITCH_MAP_BUF_SIZE, DMA_FROM_DEVICE);
 		}
 	}
 
@@ -724,10 +728,15 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 	while ((desc->desc.die_dt & DT_MASK) != DT_FEMPTY) {
 		dma_rmb();
 		pkt_len = le16_to_cpu(desc->desc.info_ds) & RX_DS;
-		skb = gq->skbs[gq->cur];
-		gq->skbs[gq->cur] = NULL;
 		dma_addr = rswitch_desc_get_dptr(&desc->desc);
-		dma_unmap_single(ndev->dev.parent, dma_addr, PKT_BUF_SZ, DMA_FROM_DEVICE);
+		dma_unmap_single(ndev->dev.parent, dma_addr,
+				 RSWITCH_MAP_BUF_SIZE, DMA_FROM_DEVICE);
+		skb = build_skb(gq->rx_bufs[gq->cur], RSWITCH_BUF_SIZE);
+		if (!skb)
+			goto out;
+		skb_reserve(skb, RSWITCH_HEADROOM);
+		skb_put(skb, pkt_len);
+
 		get_ts = rdev->priv->ptp_priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
 		if (get_ts) {
 			struct skb_shared_hwtstamps *shhwtstamps;
@@ -739,12 +748,13 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 			ts.tv_nsec = __le32_to_cpu(desc->ts_nsec & cpu_to_le32(0x3fffffff));
 			shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
 		}
-		skb_put(skb, pkt_len);
 		skb->protocol = eth_type_trans(skb, ndev);
 		napi_gro_receive(&rdev->napi, skb);
 		rdev->ndev->stats.rx_packets++;
 		rdev->ndev->stats.rx_bytes += pkt_len;
 
+out:
+		gq->rx_bufs[gq->cur] = NULL;
 		gq->cur = rswitch_next_queue_index(gq, true, 1);
 		desc = &gq->rx_ring[gq->cur];
 
@@ -753,7 +763,7 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 	}
 
 	num = rswitch_get_num_cur_queues(gq);
-	ret = rswitch_gwca_queue_alloc_skb(gq, gq->dirty, num);
+	ret = rswitch_gwca_queue_alloc_rx_buf(gq, gq->dirty, num);
 	if (ret < 0)
 		goto err;
 	ret = rswitch_gwca_queue_ext_ts_fill(ndev, gq, gq->dirty, num);
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index f1c7f7cdefc2..a407d85dcfad 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -29,8 +29,13 @@
 #define RX_RING_SIZE		1024
 #define TS_RING_SIZE		(TX_RING_SIZE * RSWITCH_NUM_PORTS)
 
-#define PKT_BUF_SZ		1584
+#define RSWITCH_HEADROOM	(NET_SKB_PAD + NET_IP_ALIGN)
+#define RSWITCH_DESC_BUF_SIZE	2048
+#define RSWITCH_TAILROOM	SKB_DATA_ALIGN(sizeof(struct skb_shared_info))
 #define RSWITCH_ALIGN		128
+#define RSWITCH_BUF_SIZE	(RSWITCH_HEADROOM + RSWITCH_DESC_BUF_SIZE + \
+				 RSWITCH_TAILROOM + RSWITCH_ALIGN)
+#define RSWITCH_MAP_BUF_SIZE	(RSWITCH_BUF_SIZE - RSWITCH_HEADROOM)
 #define RSWITCH_MAX_CTAG_PCP	7
 
 #define RSWITCH_TIMEOUT_US	100000
@@ -945,8 +950,18 @@ struct rswitch_gwca_queue {
 	/* For [rt]x_ring */
 	unsigned int index;
 	bool dir_tx;
-	struct sk_buff **skbs;
 	struct net_device *ndev;	/* queue to ndev for irq */
+
+	union {
+		/* For TX */
+		struct {
+			struct sk_buff **skbs;
+		};
+		/* For RX */
+		struct {
+			void **rx_bufs;
+		};
+	};
 };
 
 struct rswitch_gwca_ts_info {
-- 
2.34.1


