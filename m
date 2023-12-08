Return-Path: <linux-renesas-soc+bounces-845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2424C809AD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 05:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2D431F20226
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 04:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6C75678;
	Fri,  8 Dec 2023 04:10:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id E79511719;
	Thu,  7 Dec 2023 20:10:40 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,259,1695654000"; 
   d="scan'208";a="185740757"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Dec 2023 13:10:37 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CB32B415E8E5;
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
Subject: [PATCH net-next v5 5/9] net: rswitch: Add a setting ext descriptor function
Date: Fri,  8 Dec 2023 13:10:26 +0900
Message-Id: <20231208041030.2497657-6-yoshihiro.shimoda.uh@renesas.com>
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
this, add a setting ext descriptor function to improve code readability.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 73 +++++++++++++++++---------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index c2125fefc8c5..eda5ea56674c 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1519,6 +1519,51 @@ static int rswitch_stop(struct net_device *ndev)
 	return 0;
 };
 
+static bool rswitch_ext_desc_set_info1(struct rswitch_device *rdev,
+				       struct sk_buff *skb,
+				       struct rswitch_ext_desc *desc)
+{
+	desc->info1 = cpu_to_le64(INFO1_DV(BIT(rdev->etha->index)) |
+				  INFO1_IPV(GWCA_IPV_NUM) | INFO1_FMT);
+	if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
+		struct rswitch_gwca_ts_info *ts_info;
+
+		ts_info = kzalloc(sizeof(*ts_info), GFP_ATOMIC);
+		if (!ts_info)
+			return false;
+
+		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
+		rdev->ts_tag++;
+		desc->info1 |= cpu_to_le64(INFO1_TSUN(rdev->ts_tag) | INFO1_TXC);
+
+		ts_info->skb = skb_get(skb);
+		ts_info->port = rdev->port;
+		ts_info->tag = rdev->ts_tag;
+		list_add_tail(&ts_info->list, &rdev->priv->gwca.ts_info_list);
+
+		skb_tx_timestamp(skb);
+	}
+
+	return true;
+}
+
+static bool rswitch_ext_desc_set(struct rswitch_device *rdev,
+				 struct sk_buff *skb,
+				 struct rswitch_ext_desc *desc,
+				 dma_addr_t dma_addr, u16 len, u8 die_dt)
+{
+	rswitch_desc_set_dptr(&desc->desc, dma_addr);
+	desc->desc.info_ds = cpu_to_le16(len);
+	if (!rswitch_ext_desc_set_info1(rdev, skb, desc))
+		return false;
+
+	dma_wmb();
+
+	desc->desc.die_dt = die_dt;
+
+	return true;
+}
+
 static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
@@ -1542,33 +1587,9 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 	gq->skbs[gq->cur] = skb;
 	gq->unmap_addrs[gq->cur] = dma_addr;
 	desc = &gq->tx_ring[gq->cur];
-	rswitch_desc_set_dptr(&desc->desc, dma_addr);
-	desc->desc.info_ds = cpu_to_le16(skb->len);
-
-	desc->info1 = cpu_to_le64(INFO1_DV(BIT(rdev->etha->index)) |
-				  INFO1_IPV(GWCA_IPV_NUM) | INFO1_FMT);
-	if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
-		struct rswitch_gwca_ts_info *ts_info;
-
-		ts_info = kzalloc(sizeof(*ts_info), GFP_ATOMIC);
-		if (!ts_info)
-			goto err_unmap;
-
-		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
-		rdev->ts_tag++;
-		desc->info1 |= cpu_to_le64(INFO1_TSUN(rdev->ts_tag) | INFO1_TXC);
-
-		ts_info->skb = skb_get(skb);
-		ts_info->port = rdev->port;
-		ts_info->tag = rdev->ts_tag;
-		list_add_tail(&ts_info->list, &rdev->priv->gwca.ts_info_list);
-
-		skb_tx_timestamp(skb);
-	}
-
-	dma_wmb();
+	if (!rswitch_ext_desc_set(rdev, skb, desc, dma_addr, skb->len, DT_FSINGLE | DIE))
+		goto err_unmap;
 
-	desc->desc.die_dt = DT_FSINGLE | DIE;
 	wmb();	/* gq->cur must be incremented after die_dt was set */
 
 	gq->cur = rswitch_next_queue_index(gq, true, 1);
-- 
2.25.1


