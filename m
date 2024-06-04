Return-Path: <linux-renesas-soc+bounces-5806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EFE8FABF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 09:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4419B236AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 07:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AFA140E50;
	Tue,  4 Jun 2024 07:29:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35BC83CB4;
	Tue,  4 Jun 2024 07:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717486141; cv=none; b=ODFQ6fu21fVBwX7rU3MQ6ptjBYBkrAnWid36GvwTjVnaZl0ZBoFe8vgG5k1SgGrxnLws2jcVNe2/63StoC0PAl7Zy/vIEiXzYRfKMMOK/FXtZxDSRwbfQDkLyL28c63Ka2m1cFW1IVuKLY2bT3NhOsR414xQTIJlKmx7K84FzoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717486141; c=relaxed/simple;
	bh=RvBmkc/0Z0rEHBdLhh543QGElROuM7v8GOvtolnFabg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rzFkbwe9mh9J5AEI00d1uOeq1b88wmxuMgggQ3xxr7sbqUW9yTyohtG/4CtlvNI7wdY31+jZr/FqYtiMKO4iZgNpepS28WkzHPVVnlA2uF0UmiamxeIJUqlng2YdPPv3zza6AzbTwacN2hsZNpNW54GVAKnb1ktzG/0ieQkgbnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,213,1712588400"; 
   d="scan'208";a="206651317"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jun 2024 16:28:55 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.239])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E545441FBB3D;
	Tue,  4 Jun 2024 16:28:50 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Simon Horman <horms@kernel.org>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v5 3/7] net: ravb: Refactor RX ring refill
Date: Tue,  4 Jun 2024 08:28:21 +0100
Message-Id: <20240604072825.7490-4-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240604072825.7490-1-paul.barker.ct@bp.renesas.com>
References: <20240604072825.7490-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To reduce code duplication, we add a new RX ring refill function which
can handle both the initial RX ring population (which was split between
ravb_ring_init() and ravb_ring_format()) and the RX ring refill after
polling (in ravb_rx()).

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
Changes v4->v5:
  * Re-wrapped to 80 cols, except where this would significantly impact
    readability.
  * Added Sergey's Reviewed-by tag.

Changes v3->v4:
  * Avoided unnecessarily re-ordering code in ravb_ring_init() and
    ravb_ring_format().

 drivers/net/ethernet/renesas/ravb_main.c | 150 +++++++++--------------
 1 file changed, 57 insertions(+), 93 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 472aa80002be..63d03929e3f5 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -317,35 +317,43 @@ static void ravb_ring_free(struct net_device *ndev, int q)
 	priv->tx_skb[q] = NULL;
 }
 
-static void ravb_rx_ring_format(struct net_device *ndev, int q)
+static u32
+ravb_rx_ring_refill(struct net_device *ndev, int q, u32 count, gfp_t gfp_mask)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
+	const struct ravb_hw_info *info = priv->info;
 	struct ravb_rx_desc *rx_desc;
-	unsigned int rx_ring_size;
 	dma_addr_t dma_addr;
-	unsigned int i;
+	u32 i, entry;
 
-	rx_ring_size = priv->info->rx_desc_size * priv->num_rx_ring[q];
-	memset(priv->rx_ring[q].raw, 0, rx_ring_size);
-	/* Build RX ring buffer */
-	for (i = 0; i < priv->num_rx_ring[q]; i++) {
-		/* RX descriptor */
-		rx_desc = ravb_rx_get_desc(priv, q, i);
-		rx_desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
-		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
-					  priv->info->rx_max_frame_size,
-					  DMA_FROM_DEVICE);
-		/* We just set the data size to 0 for a failed mapping which
-		 * should prevent DMA from happening...
-		 */
-		if (dma_mapping_error(ndev->dev.parent, dma_addr))
-			rx_desc->ds_cc = cpu_to_le16(0);
-		rx_desc->dptr = cpu_to_le32(dma_addr);
+	for (i = 0; i < count; i++) {
+		entry = (priv->dirty_rx[q] + i) % priv->num_rx_ring[q];
+		rx_desc = ravb_rx_get_desc(priv, q, entry);
+		rx_desc->ds_cc = cpu_to_le16(info->rx_max_desc_use);
+
+		if (!priv->rx_skb[q][entry]) {
+			priv->rx_skb[q][entry] = ravb_alloc_skb(ndev, info,
+								gfp_mask);
+			if (!priv->rx_skb[q][entry])
+				break;
+			dma_addr = dma_map_single(ndev->dev.parent,
+						  priv->rx_skb[q][entry]->data,
+						  priv->info->rx_max_frame_size,
+						  DMA_FROM_DEVICE);
+			skb_checksum_none_assert(priv->rx_skb[q][entry]);
+			/* We just set the data size to 0 for a failed mapping
+			 * which should prevent DMA from happening...
+			 */
+			if (dma_mapping_error(ndev->dev.parent, dma_addr))
+				rx_desc->ds_cc = cpu_to_le16(0);
+			rx_desc->dptr = cpu_to_le32(dma_addr);
+		}
+		/* Descriptor type must be set after all the above writes */
+		dma_wmb();
 		rx_desc->die_dt = DT_FEMPTY;
 	}
-	rx_desc = ravb_rx_get_desc(priv, q, i);
-	rx_desc->dptr = cpu_to_le32((u32)priv->rx_desc_dma[q]);
-	rx_desc->die_dt = DT_LINKFIX; /* type */
+
+	return i;
 }
 
 /* Format skb and descriptor buffer for Ethernet AVB */
@@ -353,6 +361,7 @@ static void ravb_ring_format(struct net_device *ndev, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	unsigned int num_tx_desc = priv->num_tx_desc;
+	struct ravb_rx_desc *rx_desc;
 	struct ravb_tx_desc *tx_desc;
 	struct ravb_desc *desc;
 	unsigned int tx_ring_size = sizeof(*tx_desc) * priv->num_tx_ring[q] *
@@ -364,7 +373,13 @@ static void ravb_ring_format(struct net_device *ndev, int q)
 	priv->dirty_rx[q] = 0;
 	priv->dirty_tx[q] = 0;
 
-	ravb_rx_ring_format(ndev, q);
+	/* Regular RX descriptors have already been initialized by
+	 * ravb_rx_ring_refill(), we just need to initialize the final link
+	 * descriptor.
+	 */
+	rx_desc = ravb_rx_get_desc(priv, q, priv->num_rx_ring[q]);
+	rx_desc->dptr = cpu_to_le32((u32)priv->rx_desc_dma[q]);
+	rx_desc->die_dt = DT_LINKFIX; /* type */
 
 	memset(priv->tx_ring[q], 0, tx_ring_size);
 	/* Build TX ring buffer */
@@ -408,11 +423,9 @@ static void *ravb_alloc_rx_desc(struct net_device *ndev, int q)
 static int ravb_ring_init(struct net_device *ndev, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
-	const struct ravb_hw_info *info = priv->info;
 	unsigned int num_tx_desc = priv->num_tx_desc;
 	unsigned int ring_size;
-	struct sk_buff *skb;
-	unsigned int i;
+	u32 num_filled;
 
 	/* Allocate RX and TX skb rings */
 	priv->rx_skb[q] = kcalloc(priv->num_rx_ring[q],
@@ -422,12 +435,18 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 	if (!priv->rx_skb[q] || !priv->tx_skb[q])
 		goto error;
 
-	for (i = 0; i < priv->num_rx_ring[q]; i++) {
-		skb = ravb_alloc_skb(ndev, info, GFP_KERNEL);
-		if (!skb)
-			goto error;
-		priv->rx_skb[q][i] = skb;
-	}
+	/* Allocate all RX descriptors. */
+	if (!ravb_alloc_rx_desc(ndev, q))
+		goto error;
+
+	/* Populate RX ring buffer. */
+	priv->dirty_rx[q] = 0;
+	ring_size = priv->info->rx_desc_size * priv->num_rx_ring[q];
+	memset(priv->rx_ring[q].raw, 0, ring_size);
+	num_filled = ravb_rx_ring_refill(ndev, q, priv->num_rx_ring[q],
+					 GFP_KERNEL);
+	if (num_filled != priv->num_rx_ring[q])
+		goto error;
 
 	if (num_tx_desc > 1) {
 		/* Allocate rings for the aligned buffers */
@@ -437,12 +456,6 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 			goto error;
 	}
 
-	/* Allocate all RX descriptors. */
-	if (!ravb_alloc_rx_desc(ndev, q))
-		goto error;
-
-	priv->dirty_rx[q] = 0;
-
 	/* Allocate all TX descriptors. */
 	ring_size = sizeof(struct ravb_tx_desc) *
 		    (priv->num_tx_ring[q] * num_tx_desc + 1);
@@ -762,11 +775,9 @@ static struct sk_buff *ravb_get_skb_gbeth(struct net_device *ndev, int entry,
 static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
-	const struct ravb_hw_info *info = priv->info;
 	struct net_device_stats *stats;
 	struct ravb_rx_desc *desc;
 	struct sk_buff *skb;
-	dma_addr_t dma_addr;
 	int rx_packets = 0;
 	u8  desc_status;
 	u16 desc_len;
@@ -854,32 +865,9 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 	}
 
 	/* Refill the RX ring buffers. */
-	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) {
-		entry = priv->dirty_rx[q] % priv->num_rx_ring[q];
-		desc = &priv->rx_ring[q].desc[entry];
-		desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
-
-		if (!priv->rx_skb[q][entry]) {
-			skb = ravb_alloc_skb(ndev, info, GFP_ATOMIC);
-			if (!skb)
-				break;
-			dma_addr = dma_map_single(ndev->dev.parent,
-						  skb->data,
-						  priv->info->rx_max_frame_size,
-						  DMA_FROM_DEVICE);
-			skb_checksum_none_assert(skb);
-			/* We just set the data size to 0 for a failed mapping
-			 * which should prevent DMA  from happening...
-			 */
-			if (dma_mapping_error(ndev->dev.parent, dma_addr))
-				desc->ds_cc = cpu_to_le16(0);
-			desc->dptr = cpu_to_le32(dma_addr);
-			priv->rx_skb[q][entry] = skb;
-		}
-		/* Descriptor type must be set after all the above writes */
-		dma_wmb();
-		desc->die_dt = DT_FEMPTY;
-	}
+	priv->dirty_rx[q] += ravb_rx_ring_refill(ndev, q,
+						 priv->cur_rx[q] - priv->dirty_rx[q],
+						 GFP_ATOMIC);
 
 	stats->rx_packets += rx_packets;
 	return rx_packets;
@@ -889,12 +877,10 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
-	const struct ravb_hw_info *info = priv->info;
 	struct net_device_stats *stats = &priv->stats[q];
 	struct ravb_ex_rx_desc *desc;
 	unsigned int limit, i;
 	struct sk_buff *skb;
-	dma_addr_t dma_addr;
 	struct timespec64 ts;
 	int rx_packets = 0;
 	u8  desc_status;
@@ -964,31 +950,9 @@ static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
 	}
 
 	/* Refill the RX ring buffers. */
-	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) {
-		entry = priv->dirty_rx[q] % priv->num_rx_ring[q];
-		desc = &priv->rx_ring[q].ex_desc[entry];
-		desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
-
-		if (!priv->rx_skb[q][entry]) {
-			skb = ravb_alloc_skb(ndev, info, GFP_ATOMIC);
-			if (!skb)
-				break;	/* Better luck next round. */
-			dma_addr = dma_map_single(ndev->dev.parent, skb->data,
-						  priv->info->rx_max_frame_size,
-						  DMA_FROM_DEVICE);
-			skb_checksum_none_assert(skb);
-			/* We just set the data size to 0 for a failed mapping
-			 * which should prevent DMA  from happening...
-			 */
-			if (dma_mapping_error(ndev->dev.parent, dma_addr))
-				desc->ds_cc = cpu_to_le16(0);
-			desc->dptr = cpu_to_le32(dma_addr);
-			priv->rx_skb[q][entry] = skb;
-		}
-		/* Descriptor type must be set after all the above writes */
-		dma_wmb();
-		desc->die_dt = DT_FEMPTY;
-	}
+	priv->dirty_rx[q] += ravb_rx_ring_refill(ndev, q,
+						 priv->cur_rx[q] - priv->dirty_rx[q],
+						 GFP_ATOMIC);
 
 	stats->rx_packets += rx_packets;
 	return rx_packets;
-- 
2.39.2


