Return-Path: <linux-renesas-soc+bounces-586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F4A8029D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 02:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECCBA280C37
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 01:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6CC1C01;
	Mon,  4 Dec 2023 01:21:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 940C8FC;
	Sun,  3 Dec 2023 17:21:04 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,248,1695654000"; 
   d="scan'208";a="185170573"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Dec 2023 10:21:01 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CE01B411E23B;
	Mon,  4 Dec 2023 10:21:01 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v3 5/9] net: rswitch: Add a setting ext descriptor function
Date: Mon,  4 Dec 2023 10:20:54 +0900
Message-Id: <20231204012058.3876078-6-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204012058.3876078-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231204012058.3876078-1-yoshihiro.shimoda.uh@renesas.com>
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
index 4774130c417b..f94c76161794 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1518,6 +1518,51 @@ static int rswitch_stop(struct net_device *ndev)
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
@@ -1541,33 +1586,9 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
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
2.34.1


