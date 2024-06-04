Return-Path: <linux-renesas-soc+bounces-5810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 980028FAC04
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 09:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B676A1C2100E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 07:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A0214386C;
	Tue,  4 Jun 2024 07:29:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5BA14198E;
	Tue,  4 Jun 2024 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717486160; cv=none; b=QzJK64PnwF5RSzQm0lG71tK0712DsDBhjM97PibF5SmUH6y12/bZQ9ftdDBl7/fdkGZSDgn+BzHhP8SazcjNCX1cEtDreDzvaFfhRHdE2qDJiunPysy8fWo32X0OOD5Me+yIZM+sotK5lssLMYkATKf5I5icxE0V38Bt/+QiX5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717486160; c=relaxed/simple;
	bh=UILWbnWLJi8QKNzh4xrmQEEB/svoX2/buW0DpPwS4hc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DR0WbDUIAAKRBiVNF50kmjtrkVbd4V2BRGZfUljccsg2e5BpVFC2hJNKY36tLL3zaxqL/vlV0JuG73Hs9cLip1eaF6IPlFzDHIiMSWGFkBsCe2KP0OSmifYXQw2ZMwVC9B68cJrt8n6AZ5chtn+DQlYFe3KldZU1OWRnazBMBDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,213,1712588400"; 
   d="scan'208";a="206651400"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jun 2024 16:29:17 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.239])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 976A241FCFCA;
	Tue,  4 Jun 2024 16:29:12 +0900 (JST)
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
Subject: [net-next PATCH v5 7/7] net: ravb: Allocate RX buffers via page pool
Date: Tue,  4 Jun 2024 08:28:25 +0100
Message-Id: <20240604072825.7490-8-paul.barker.ct@bp.renesas.com>
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

This patch makes multiple changes that can't be separated:

  1) Allocate plain RX buffers via a page pool instead of allocating
     SKBs, then use build_skb() when a packet is received.
  2) For GbEth IP, reduce the RX buffer size to 2kB.
  3) For GbEth IP, merge packets which span more than one RX descriptor
     as SKB fragments instead of copying data.

Implementing (1) without (2) would require the use of an order-1 page
pool (instead of an order-0 page pool split into page fragments) for
GbEth.

Implementing (2) without (3) would leave us no space to re-assemble
packets which span more than one RX descriptor.

Implementing (3) without (1) would not be possible as the network stack
expects to use put_page() or page_pool_put_page() to free SKB fragments
after an SKB is consumed.

RX checksum offload support is adjusted to handle both linear and
nonlinear (fragmented) packets.

This patch gives the following improvements during testing with iperf3.

  * RZ/G2L:
    * TCP RX: same bandwidth at -43% CPU load (70% -> 40%)
    * UDP RX: same bandwidth at -17% CPU load (88% -> 74%)

  * RZ/G2UL:
    * TCP RX: +30% bandwidth (726Mbps -> 941Mbps)
    * UDP RX: +417% bandwidth (108Mbps -> 558Mbps)

  * RZ/G3S:
    * TCP RX: +64% bandwidth (562Mbps -> 920Mbps)
    * UDP RX: +420% bandwidth (90Mbps -> 468Mbps)

  * RZ/Five:
    * TCP RX: +217% bandwidth (145Mbps -> 459Mbps)
    * UDP RX: +470% bandwidth (20Mbps -> 114Mbps)

There is no significant impact on bandwidth or CPU load in testing on
RZ/G2H or R-Car M3N.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
Changes v4->v5:
  * Re-wrapped to 80 cols, except where this would significantly impact
    readability.
  * Included <net/page_pool/types.h> in ravb.h.
  * Moved rx_buffer_size so it is in the same place in ravb_hw_info as
    rx_max_desc_use was previously.
  * Used reverse xmas tree ordering in variable declarations.
  * Split lines after binary operators, instead of before.
  * Factor subtraction of sizeof(__sum16) out of the if condition in
    ravb_rx_csum_gbeth().
  * Add blank lines after variable declarations where needed.
  * Used goto instead of break to handle napi_build_skb() failure in
    ravb_rx_gbeth(). Break was incorrectly scoped to the surrounding
    switch statement, when it's the outer loop we really want to break
    out of.
  * Used continue instead of break to handle NULL priv->rx_1st_skb in
    ravb_rx_gbeth() as we may still be able to process further
    descriptors.
  * Unconditionally set priv->rx_1st_skb = NULL after processing a
    packet in ravb_rx_gbeth(). We don't need to check die_dt as this
    will be a no-op for single descriptor packets.
  * Moved napi_build_skb() call after dma_sync_single_for_cpu() in
    ravb_rx_rcar() to align the order of operations with ravb_rx_gbeth()
    and ensure the data is sync'd before it is accessed.
  * Moved zeroing of rx_buff->page to the end of packet processing in
    ravb_rx_rcar() to align the order of operations with
    ravb_rx_gbeth().

Changes v3->v4:
  * Used a separate page pool for each RX queue.
  * Passed struct ravb_rx_desc to ravb_alloc_rx_buffer() so that we can
    simplify the calling function.
  * Explained the calculation of rx_desc->ds_cc.
  * Added handling of nonlinear SKBs in ravb_rx_csum_gbeth().

 drivers/net/ethernet/renesas/ravb.h      |  11 +-
 drivers/net/ethernet/renesas/ravb_main.c | 258 +++++++++++++++--------
 2 files changed, 174 insertions(+), 95 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 6a7aa7dd17e6..6b2444d31fcc 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -19,6 +19,7 @@
 #include <linux/phy.h>
 #include <linux/platform_device.h>
 #include <linux/ptp_clock_kernel.h>
+#include <net/page_pool/types.h>
 
 #define BE_TX_RING_SIZE	64	/* TX ring size for Best Effort */
 #define BE_RX_RING_SIZE	1024	/* RX ring size for Best Effort */
@@ -1051,7 +1052,7 @@ struct ravb_hw_info {
 	int stats_len;
 	u32 tccr_mask;
 	u32 rx_max_frame_size;
-	u32 rx_max_desc_use;
+	u32 rx_buffer_size;
 	u32 rx_desc_size;
 	unsigned aligned_tx: 1;
 	unsigned coalesce_irqs:1;	/* Needs software IRQ coalescing */
@@ -1071,6 +1072,11 @@ struct ravb_hw_info {
 	unsigned half_duplex:1;		/* E-MAC supports half duplex mode */
 };
 
+struct ravb_rx_buffer {
+	struct page *page;
+	unsigned int offset;
+};
+
 struct ravb_private {
 	struct net_device *ndev;
 	struct platform_device *pdev;
@@ -1094,7 +1100,8 @@ struct ravb_private {
 	struct ravb_tx_desc *tx_ring[NUM_TX_QUEUE];
 	void *tx_align[NUM_TX_QUEUE];
 	struct sk_buff *rx_1st_skb;
-	struct sk_buff **rx_skb[NUM_RX_QUEUE];
+	struct page_pool *rx_pool[NUM_RX_QUEUE];
+	struct ravb_rx_buffer *rx_buffers[NUM_RX_QUEUE];
 	struct sk_buff **tx_skb[NUM_TX_QUEUE];
 	u32 rx_over_errors;
 	u32 rx_fifo_errors;
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c89bb38492b4..c1546b916e4e 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -30,6 +30,7 @@
 #include <linux/reset.h>
 #include <linux/math64.h>
 #include <net/ip.h>
+#include <net/page_pool/helpers.h>
 
 #include "ravb.h"
 
@@ -113,25 +114,6 @@ static void ravb_set_rate_rcar(struct net_device *ndev)
 	}
 }
 
-static struct sk_buff *
-ravb_alloc_skb(struct net_device *ndev, const struct ravb_hw_info *info,
-	       gfp_t gfp_mask)
-{
-	struct sk_buff *skb;
-	u32 reserve;
-
-	skb = __netdev_alloc_skb(ndev, info->rx_max_frame_size + RAVB_ALIGN - 1,
-				 gfp_mask);
-	if (!skb)
-		return NULL;
-
-	reserve = (unsigned long)skb->data & (RAVB_ALIGN - 1);
-	if (reserve)
-		skb_reserve(skb, RAVB_ALIGN - reserve);
-
-	return skb;
-}
-
 /* Get MAC address from the MAC address registers
  *
  * Ethernet AVB device doesn't have ROM for MAC address.
@@ -257,21 +239,10 @@ static void ravb_rx_ring_free(struct net_device *ndev, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	unsigned int ring_size;
-	unsigned int i;
 
 	if (!priv->rx_ring[q].raw)
 		return;
 
-	for (i = 0; i < priv->num_rx_ring[q]; i++) {
-		struct ravb_rx_desc *desc = ravb_rx_get_desc(priv, q, i);
-
-		if (!dma_mapping_error(ndev->dev.parent,
-				       le32_to_cpu(desc->dptr)))
-			dma_unmap_single(ndev->dev.parent,
-					 le32_to_cpu(desc->dptr),
-					 priv->info->rx_max_frame_size,
-					 DMA_FROM_DEVICE);
-	}
 	ring_size = priv->info->rx_desc_size * (priv->num_rx_ring[q] + 1);
 	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q].raw,
 			  priv->rx_desc_dma[q]);
@@ -298,13 +269,16 @@ static void ravb_ring_free(struct net_device *ndev, int q)
 		priv->tx_ring[q] = NULL;
 	}
 
-	/* Free RX skb ringbuffer */
-	if (priv->rx_skb[q]) {
-		for (i = 0; i < priv->num_rx_ring[q]; i++)
-			dev_kfree_skb(priv->rx_skb[q][i]);
+	/* Free RX buffers */
+	for (i = 0; i < priv->num_rx_ring[q]; i++) {
+		if (priv->rx_buffers[q][i].page)
+			page_pool_put_page(priv->rx_pool[q],
+					   priv->rx_buffers[q][i].page,
+					   0, true);
 	}
-	kfree(priv->rx_skb[q]);
-	priv->rx_skb[q] = NULL;
+	kfree(priv->rx_buffers[q]);
+	priv->rx_buffers[q] = NULL;
+	page_pool_destroy(priv->rx_pool[q]);
 
 	/* Free aligned TX buffers */
 	kfree(priv->tx_align[q]);
@@ -317,36 +291,57 @@ static void ravb_ring_free(struct net_device *ndev, int q)
 	priv->tx_skb[q] = NULL;
 }
 
+static int
+ravb_alloc_rx_buffer(struct net_device *ndev, int q, u32 entry, gfp_t gfp_mask,
+		     struct ravb_rx_desc *rx_desc)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+	const struct ravb_hw_info *info = priv->info;
+	struct ravb_rx_buffer *rx_buff;
+	dma_addr_t dma_addr;
+	unsigned int size;
+
+	rx_buff = &priv->rx_buffers[q][entry];
+	size = info->rx_buffer_size;
+	rx_buff->page = page_pool_alloc(priv->rx_pool[q], &rx_buff->offset,
+					&size, gfp_mask);
+	if (unlikely(!rx_buff->page)) {
+		/* We just set the data size to 0 for a failed mapping which
+		 * should prevent DMA from happening...
+		 */
+		rx_desc->ds_cc = cpu_to_le16(0);
+		return -ENOMEM;
+	}
+
+	dma_addr = page_pool_get_dma_addr(rx_buff->page) + rx_buff->offset;
+	dma_sync_single_for_device(ndev->dev.parent, dma_addr,
+				   info->rx_buffer_size, DMA_FROM_DEVICE);
+	rx_desc->dptr = cpu_to_le32(dma_addr);
+
+	/* The end of the RX buffer is used to store skb shared data, so we need
+	 * to ensure that the hardware leaves enough space for this.
+	 */
+	rx_desc->ds_cc = cpu_to_le16(info->rx_buffer_size -
+				     SKB_DATA_ALIGN(sizeof(struct skb_shared_info)) -
+				     ETH_FCS_LEN + sizeof(__sum16));
+	return 0;
+}
+
 static u32
 ravb_rx_ring_refill(struct net_device *ndev, int q, u32 count, gfp_t gfp_mask)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
-	const struct ravb_hw_info *info = priv->info;
 	struct ravb_rx_desc *rx_desc;
-	dma_addr_t dma_addr;
 	u32 i, entry;
 
 	for (i = 0; i < count; i++) {
 		entry = (priv->dirty_rx[q] + i) % priv->num_rx_ring[q];
 		rx_desc = ravb_rx_get_desc(priv, q, entry);
-		rx_desc->ds_cc = cpu_to_le16(info->rx_max_desc_use);
 
-		if (!priv->rx_skb[q][entry]) {
-			priv->rx_skb[q][entry] = ravb_alloc_skb(ndev, info,
-								gfp_mask);
-			if (!priv->rx_skb[q][entry])
+		if (!priv->rx_buffers[q][entry].page) {
+			if (unlikely(ravb_alloc_rx_buffer(ndev, q, entry,
+							  gfp_mask, rx_desc)))
 				break;
-			dma_addr = dma_map_single(ndev->dev.parent,
-						  priv->rx_skb[q][entry]->data,
-						  priv->info->rx_max_frame_size,
-						  DMA_FROM_DEVICE);
-			skb_checksum_none_assert(priv->rx_skb[q][entry]);
-			/* We just set the data size to 0 for a failed mapping
-			 * which should prevent DMA from happening...
-			 */
-			if (dma_mapping_error(ndev->dev.parent, dma_addr))
-				rx_desc->ds_cc = cpu_to_le16(0);
-			rx_desc->dptr = cpu_to_le32(dma_addr);
 		}
 		/* Descriptor type must be set after all the above writes */
 		dma_wmb();
@@ -424,15 +419,32 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	unsigned int num_tx_desc = priv->num_tx_desc;
+	struct page_pool_params params = {
+		.order = 0,
+		.flags = PP_FLAG_DMA_MAP,
+		.pool_size = priv->num_rx_ring[q],
+		.nid = NUMA_NO_NODE,
+		.dev = ndev->dev.parent,
+		.dma_dir = DMA_FROM_DEVICE,
+	};
 	unsigned int ring_size;
 	u32 num_filled;
 
-	/* Allocate RX and TX skb rings */
-	priv->rx_skb[q] = kcalloc(priv->num_rx_ring[q],
-				  sizeof(*priv->rx_skb[q]), GFP_KERNEL);
+	/* Allocate RX page pool and buffers */
+	priv->rx_pool[q] = page_pool_create(&params);
+	if (IS_ERR(priv->rx_pool[q]))
+		goto error;
+
+	/* Allocate RX buffers */
+	priv->rx_buffers[q] = kcalloc(priv->num_rx_ring[q],
+				      sizeof(*priv->rx_buffers[q]), GFP_KERNEL);
+	if (!priv->rx_buffers[q])
+		goto error;
+
+	/* Allocate TX skb rings */
 	priv->tx_skb[q] = kcalloc(priv->num_tx_ring[q],
 				  sizeof(*priv->tx_skb[q]), GFP_KERNEL);
-	if (!priv->rx_skb[q] || !priv->tx_skb[q])
+	if (!priv->tx_skb[q])
 		goto error;
 
 	/* Allocate all RX descriptors. */
@@ -719,7 +731,9 @@ static void ravb_get_tx_tstamp(struct net_device *ndev)
 
 static void ravb_rx_csum_gbeth(struct sk_buff *skb)
 {
+	struct skb_shared_info *shinfo = skb_shinfo(skb);
 	__wsum csum_ip_hdr, csum_proto;
+	skb_frag_t *last_frag;
 	u8 *hw_csum;
 
 	/* The hardware checksum status is contained in sizeof(__sum16) * 2 = 4
@@ -729,12 +743,24 @@ static void ravb_rx_csum_gbeth(struct sk_buff *skb)
 	if (unlikely(skb->len < sizeof(__sum16) * 2))
 		return;
 
-	hw_csum = skb_tail_pointer(skb) - sizeof(__sum16);
+	if (skb_is_nonlinear(skb)) {
+		last_frag = &shinfo->frags[shinfo->nr_frags - 1];
+		hw_csum = skb_frag_address(last_frag) +
+			  skb_frag_size(last_frag);
+	} else {
+		hw_csum = skb_tail_pointer(skb);
+	}
+
+	hw_csum -= sizeof(__sum16);
 	csum_proto = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
 
 	hw_csum -= sizeof(__sum16);
 	csum_ip_hdr = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
-	skb_trim(skb, skb->len - 2 * sizeof(__sum16));
+
+	if (skb_is_nonlinear(skb))
+		skb_frag_size_sub(last_frag, 2 * sizeof(__sum16));
+	else
+		skb_trim(skb, skb->len - 2 * sizeof(__sum16));
 
 	/* TODO: IPV6 Rx checksum */
 	if (skb->protocol == htons(ETH_P_IP) && !csum_ip_hdr && !csum_proto)
@@ -756,25 +782,11 @@ static void ravb_rx_csum(struct sk_buff *skb)
 	skb_trim(skb, skb->len - sizeof(__sum16));
 }
 
-static struct sk_buff *ravb_get_skb_gbeth(struct net_device *ndev, int entry,
-					  struct ravb_rx_desc *desc)
-{
-	struct ravb_private *priv = netdev_priv(ndev);
-	struct sk_buff *skb;
-
-	skb = priv->rx_skb[RAVB_BE][entry];
-	priv->rx_skb[RAVB_BE][entry] = NULL;
-	dma_unmap_single(ndev->dev.parent, le32_to_cpu(desc->dptr),
-			 ALIGN(priv->info->rx_max_frame_size, 16),
-			 DMA_FROM_DEVICE);
-
-	return skb;
-}
-
 /* Packet receive function for Gigabit Ethernet */
 static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
+	const struct ravb_hw_info *info = priv->info;
 	struct net_device_stats *stats;
 	struct ravb_rx_desc *desc;
 	struct sk_buff *skb;
@@ -818,12 +830,30 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 			if (desc_status & MSC_CEEF)
 				stats->rx_missed_errors++;
 		} else {
+			struct ravb_rx_buffer *rx_buff;
+			void *rx_addr;
+
+			rx_buff = &priv->rx_buffers[q][entry];
+			rx_addr = page_address(rx_buff->page) + rx_buff->offset;
 			die_dt = desc->die_dt & 0xF0;
-			skb = ravb_get_skb_gbeth(ndev, entry, desc);
+			dma_sync_single_for_cpu(ndev->dev.parent,
+						le32_to_cpu(desc->dptr),
+						desc_len, DMA_FROM_DEVICE);
+
 			switch (die_dt) {
 			case DT_FSINGLE:
 			case DT_FSTART:
 				/* Start of packet: Set initial data length. */
+				skb = napi_build_skb(rx_addr,
+						     info->rx_buffer_size);
+				if (unlikely(!skb)) {
+					stats->rx_errors++;
+					page_pool_put_page(priv->rx_pool[q],
+							   rx_buff->page, 0,
+							   true);
+					goto refill;
+				}
+				skb_mark_for_recycle(skb);
 				skb_put(skb, desc_len);
 
 				/* Save this skb if the packet spans multiple
@@ -835,15 +865,30 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 
 			case DT_FMID:
 			case DT_FEND:
-				/* Continuing a packet: Move data into the saved
-				 * skb.
+				/* Continuing a packet: Add this buffer as an RX
+				 * frag.
 				 */
-				skb_copy_to_linear_data_offset(priv->rx_1st_skb,
-							       priv->rx_1st_skb->len,
-							       skb->data,
-							       desc_len);
-				skb_put(priv->rx_1st_skb, desc_len);
-				dev_kfree_skb(skb);
+
+				/* rx_1st_skb will be NULL if napi_build_skb()
+				 * failed for the first descriptor of a
+				 * multi-descriptor packet.
+				 */
+				if (unlikely(!priv->rx_1st_skb)) {
+					stats->rx_errors++;
+					page_pool_put_page(priv->rx_pool[q],
+							   rx_buff->page, 0,
+							   true);
+
+					/* We may find a DT_FSINGLE or DT_FSTART
+					 * descriptor in the queue which we can
+					 * process, so don't give up yet.
+					 */
+					continue;
+				}
+				skb_add_rx_frag(priv->rx_1st_skb,
+						skb_shinfo(priv->rx_1st_skb)->nr_frags,
+						rx_buff->page, rx_buff->offset,
+						desc_len, info->rx_buffer_size);
 
 				/* Set skb to point at the whole packet so that
 				 * we only need one code path for finishing a
@@ -865,10 +910,19 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 				stats->rx_bytes += skb->len;
 				napi_gro_receive(&priv->napi[q], skb);
 				rx_packets++;
+
+				/* Clear rx_1st_skb so that it will only be
+				 * non-NULL when valid.
+				 */
+				priv->rx_1st_skb = NULL;
 			}
+
+			/* Mark this RX buffer as consumed. */
+			rx_buff->page = NULL;
 		}
 	}
 
+refill:
 	/* Refill the RX ring buffers. */
 	priv->dirty_rx[q] += ravb_rx_ring_refill(ndev, q,
 						 priv->cur_rx[q] - priv->dirty_rx[q],
@@ -882,6 +936,7 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
+	const struct ravb_hw_info *info = priv->info;
 	struct net_device_stats *stats = &priv->stats[q];
 	struct ravb_ex_rx_desc *desc;
 	unsigned int limit, i;
@@ -924,12 +979,23 @@ static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
 				stats->rx_missed_errors++;
 		} else {
 			u32 get_ts = priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE;
+			struct ravb_rx_buffer *rx_buff;
+			void *rx_addr;
 
-			skb = priv->rx_skb[q][entry];
-			priv->rx_skb[q][entry] = NULL;
-			dma_unmap_single(ndev->dev.parent, le32_to_cpu(desc->dptr),
-					 priv->info->rx_max_frame_size,
-					 DMA_FROM_DEVICE);
+			rx_buff = &priv->rx_buffers[q][entry];
+			rx_addr = page_address(rx_buff->page) + rx_buff->offset;
+			dma_sync_single_for_cpu(ndev->dev.parent,
+						le32_to_cpu(desc->dptr),
+						pkt_len, DMA_FROM_DEVICE);
+
+			skb = napi_build_skb(rx_addr, info->rx_buffer_size);
+			if (unlikely(!skb)) {
+				stats->rx_errors++;
+				page_pool_put_page(priv->rx_pool[q],
+						   rx_buff->page, 0, true);
+				break;
+			}
+			skb_mark_for_recycle(skb);
 			get_ts &= (q == RAVB_NC) ?
 					RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
 					~RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
@@ -951,6 +1017,9 @@ static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
 			napi_gro_receive(&priv->napi[q], skb);
 			rx_packets++;
 			stats->rx_bytes += pkt_len;
+
+			/* Mark this RX buffer as consumed. */
+			rx_buff->page = NULL;
 		}
 	}
 
@@ -2596,7 +2665,8 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
-	.rx_max_desc_use = SZ_2K - ETH_FCS_LEN + sizeof(__sum16),
+	.rx_buffer_size = SZ_2K +
+			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
 	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
 	.internal_delay = 1,
 	.tx_counters = 1,
@@ -2620,7 +2690,8 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
-	.rx_max_desc_use = SZ_2K - ETH_FCS_LEN + sizeof(__sum16),
+	.rx_buffer_size = SZ_2K +
+			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
 	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
 	.aligned_tx = 1,
 	.gptp = 1,
@@ -2641,7 +2712,8 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
-	.rx_max_desc_use = SZ_2K - ETH_FCS_LEN + sizeof(__sum16),
+	.rx_buffer_size = SZ_2K +
+			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
 	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
 	.multi_irqs = 1,
 	.err_mgmt_irqs = 1,
@@ -2664,7 +2736,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats_gbeth),
 	.tccr_mask = TCCR_TSRQ0,
 	.rx_max_frame_size = SZ_8K,
-	.rx_max_desc_use = 4080,
+	.rx_buffer_size = SZ_2K,
 	.rx_desc_size = sizeof(struct ravb_rx_desc),
 	.aligned_tx = 1,
 	.coalesce_irqs = 1,
-- 
2.39.2


