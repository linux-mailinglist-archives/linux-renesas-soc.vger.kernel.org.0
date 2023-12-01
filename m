Return-Path: <linux-renesas-soc+bounces-487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F004E80033D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 06:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A4A0B210D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 05:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39A51172F;
	Fri,  1 Dec 2023 05:47:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8356B170C;
	Thu, 30 Nov 2023 21:47:06 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,240,1695654000"; 
   d="scan'208";a="184959777"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2023 14:47:01 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 04477417F0F5;
	Fri,  1 Dec 2023 14:47:01 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v2 8/9] net: rswitch: Add jumbo frames handling for TX
Date: Fri,  1 Dec 2023 14:46:54 +0900
Message-Id: <20231201054655.3731772-9-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201054655.3731772-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231201054655.3731772-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the driver would like to transmit a jumbo frame like 2KiB or more,
it should be split into multiple queues. In the near future, to support
this, add handling specific descriptor types F{START,MID,END}. However,
such jumbo frames will not happen yet because the maximum MTU size is
still default for now.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 50 ++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 009e6bfdad27..c5e3ee8f82bc 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1631,15 +1631,44 @@ static bool rswitch_ext_desc_set(struct rswitch_device *rdev,
 	return true;
 }
 
+static u8 rswitch_ext_desc_get_die_dt(unsigned int nr_desc, unsigned int index)
+{
+	if (nr_desc == 1)
+		return DT_FSINGLE | DIE;
+	if (index == 0)
+		return DT_FSTART;
+	if (nr_desc - 1 == index)
+		return DT_FEND | DIE;
+	return DT_FMID;
+}
+
+static u16 rswitch_ext_desc_get_len(u8 die_dt, unsigned int orig_len)
+{
+	switch (die_dt & DT_MASK) {
+	case DT_FSINGLE:
+	case DT_FEND:
+		return (orig_len % RSWITCH_DESC_BUF_SIZE) ?: RSWITCH_DESC_BUF_SIZE;
+	case DT_FSTART:
+	case DT_FMID:
+		return RSWITCH_DESC_BUF_SIZE;
+	default:
+		return 0;
+	}
+}
+
 static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
 	struct rswitch_gwca_queue *gq = rdev->tx_queue;
+	dma_addr_t dma_addr, dma_addr_orig;
 	netdev_tx_t ret = NETDEV_TX_OK;
 	struct rswitch_ext_desc *desc;
-	dma_addr_t dma_addr;
+	unsigned int i, nr_desc;
+	u8 die_dt;
+	u16 len;
 
-	if (rswitch_get_num_cur_queues(gq) >= gq->ring_size - 1) {
+	nr_desc = (skb->len - 1) / RSWITCH_DESC_BUF_SIZE + 1;
+	if (rswitch_get_num_cur_queues(gq) >= gq->ring_size - nr_desc) {
 		netif_stop_subqueue(ndev, 0);
 		return NETDEV_TX_BUSY;
 	}
@@ -1647,19 +1676,26 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 	if (skb_put_padto(skb, ETH_ZLEN))
 		return ret;
 
-	dma_addr = dma_map_single(ndev->dev.parent, skb->data, skb->len, DMA_TO_DEVICE);
+	dma_addr_orig = dma_map_single(ndev->dev.parent, skb->data, skb->len, DMA_TO_DEVICE);
 	if (dma_mapping_error(ndev->dev.parent, dma_addr))
 		goto err_kfree;
 
 	gq->skbs[gq->cur] = skb;
 	gq->unmap_addrs[gq->cur] = dma_addr;
-	desc = &gq->tx_ring[gq->cur];
-	if (!rswitch_ext_desc_set(rdev, skb, desc, dma_addr, skb->len, DT_FSINGLE | DIE))
-		goto err_unmap;
+
+	/* DT_FSTART should be set at last. So, this is reverse order. */
+	for (i = nr_desc; i-- > 0; ) {
+		desc = &gq->tx_ring[rswitch_next_queue_index(gq, true, i)];
+		die_dt = rswitch_ext_desc_get_die_dt(nr_desc, i);
+		dma_addr = dma_addr_orig + i * RSWITCH_DESC_BUF_SIZE;
+		len = rswitch_ext_desc_get_len(die_dt, skb->len);
+		if (!rswitch_ext_desc_set(rdev, skb, desc, dma_addr, len, die_dt))
+			goto err_unmap;
+	}
 
 	wmb();	/* gq->cur must be incremented after die_dt was set */
 
-	gq->cur = rswitch_next_queue_index(gq, true, 1);
+	gq->cur = rswitch_next_queue_index(gq, true, nr_desc);
 	rswitch_modify(rdev->addr, GWTRC(gq->index), 0, BIT(gq->index % 32));
 
 	return ret;
-- 
2.34.1


