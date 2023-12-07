Return-Path: <linux-renesas-soc+bounces-814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD998082A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 09:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56B081F219A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 08:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416FC315B1;
	Thu,  7 Dec 2023 08:13:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3BC38B2;
	Thu,  7 Dec 2023 00:13:07 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,256,1695654000"; 
   d="scan'208";a="185639171"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Dec 2023 17:12:53 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DFB2140108E9;
	Thu,  7 Dec 2023 17:12:53 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v4 7/9] net: rswitch: Add jumbo frames handling for RX
Date: Thu,  7 Dec 2023 17:12:44 +0900
Message-Id: <20231207081246.1557582-8-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207081246.1557582-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231207081246.1557582-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If this hardware receives a jumbo frame like 2KiB or more, it will be
split into multiple queues. In the near future, to support this,
add handling specific descriptor types F{START,MID,END}. However, such
jumbo frames will not happen yet because the maximum MTU size is still
default for now.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 86 +++++++++++++++++++++++---
 drivers/net/ethernet/renesas/rswitch.h |  2 +
 2 files changed, 78 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 6bd76a88bd40..36c70131594d 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -714,6 +714,80 @@ static int rswitch_gwca_halt(struct rswitch_private *priv)
 	return err;
 }
 
+static struct sk_buff *rswitch_rx_handle_desc(struct net_device *ndev,
+					      struct rswitch_gwca_queue *gq,
+					      struct rswitch_ext_ts_desc *desc)
+{
+	dma_addr_t dma_addr = rswitch_desc_get_dptr(&desc->desc);
+	u16 pkt_len = le16_to_cpu(desc->desc.info_ds) & RX_DS;
+	u8 die_dt = desc->desc.die_dt & DT_MASK;
+	struct sk_buff *skb = NULL;
+
+	dma_unmap_single(ndev->dev.parent, dma_addr, RSWITCH_MAP_BUF_SIZE,
+			 DMA_FROM_DEVICE);
+
+	/* The RX descriptor order will be one of the following:
+	 * - FSINGLE
+	 * - FSTART -> FEND
+	 * - FSTART -> FMID -> FEND
+	 */
+
+	/* Check whether the descriptor is unexpected order */
+	switch (die_dt) {
+	case DT_FSTART:
+	case DT_FSINGLE:
+		if (gq->skb_fstart) {
+			dev_kfree_skb_any(gq->skb_fstart);
+			gq->skb_fstart = NULL;
+			ndev->stats.rx_dropped++;
+		}
+		break;
+	case DT_FMID:
+	case DT_FEND:
+		if (!gq->skb_fstart) {
+			ndev->stats.rx_dropped++;
+			return NULL;
+		}
+		break;
+	default:
+		break;
+	}
+
+	/* Handle the descriptor */
+	switch (die_dt) {
+	case DT_FSTART:
+	case DT_FSINGLE:
+		skb = build_skb(gq->rx_bufs[gq->cur], RSWITCH_BUF_SIZE);
+		if (skb) {
+			skb_reserve(skb, RSWITCH_HEADROOM);
+			skb_put(skb, pkt_len);
+			gq->pkt_len = pkt_len;
+			if (die_dt == DT_FSTART) {
+				gq->skb_fstart = skb;
+				skb = NULL;
+			}
+		}
+		break;
+	case DT_FMID:
+	case DT_FEND:
+		skb_add_rx_frag(gq->skb_fstart, skb_shinfo(gq->skb_fstart)->nr_frags,
+				virt_to_page(gq->rx_bufs[gq->cur]),
+				offset_in_page(gq->rx_bufs[gq->cur]) + RSWITCH_HEADROOM,
+				pkt_len, RSWITCH_BUF_SIZE);
+		if (die_dt == DT_FEND) {
+			skb = gq->skb_fstart;
+			gq->skb_fstart = NULL;
+		}
+		gq->pkt_len += pkt_len;
+		break;
+	default:
+		netdev_err(ndev, "%s: unexpected value (%x)\n", __func__, die_dt);
+		break;
+	}
+
+	return skb;
+}
+
 static bool rswitch_rx(struct net_device *ndev, int *quota)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
@@ -721,9 +795,7 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 	struct rswitch_ext_ts_desc *desc;
 	int limit, boguscnt, ret;
 	struct sk_buff *skb;
-	dma_addr_t dma_addr;
 	unsigned int num;
-	u16 pkt_len;
 	u32 get_ts;
 
 	if (*quota <= 0)
@@ -735,15 +807,9 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 	desc = &gq->rx_ring[gq->cur];
 	while ((desc->desc.die_dt & DT_MASK) != DT_FEMPTY) {
 		dma_rmb();
-		pkt_len = le16_to_cpu(desc->desc.info_ds) & RX_DS;
-		dma_addr = rswitch_desc_get_dptr(&desc->desc);
-		dma_unmap_single(ndev->dev.parent, dma_addr,
-				 RSWITCH_MAP_BUF_SIZE, DMA_FROM_DEVICE);
-		skb = build_skb(gq->rx_bufs[gq->cur], RSWITCH_BUF_SIZE);
+		skb = rswitch_rx_handle_desc(ndev, gq, desc);
 		if (!skb)
 			goto out;
-		skb_reserve(skb, RSWITCH_HEADROOM);
-		skb_put(skb, pkt_len);
 
 		get_ts = rdev->priv->ptp_priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
 		if (get_ts) {
@@ -759,7 +825,7 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 		skb->protocol = eth_type_trans(skb, ndev);
 		napi_gro_receive(&rdev->napi, skb);
 		rdev->ndev->stats.rx_packets++;
-		rdev->ndev->stats.rx_bytes += pkt_len;
+		rdev->ndev->stats.rx_bytes += gq->pkt_len;
 
 out:
 		gq->rx_bufs[gq->cur] = NULL;
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 17e617ec4187..4252677e2a55 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -965,6 +965,8 @@ struct rswitch_gwca_queue {
 		/* For RX */
 		struct {
 			void **rx_bufs;
+			struct sk_buff *skb_fstart;
+			u16 pkt_len;
 		};
 	};
 };
-- 
2.34.1


