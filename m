Return-Path: <linux-renesas-soc+bounces-59-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E29D17F3B41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 02:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E114A1C20E6B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 01:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889BC17CF;
	Wed, 22 Nov 2023 01:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5A8AD197;
	Tue, 21 Nov 2023 17:26:07 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,217,1695654000"; 
   d="scan'208";a="187651412"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2023 10:26:05 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 53CC6401006B;
	Wed, 22 Nov 2023 10:26:04 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net v2 3/3] net: rswitch: Fix missing dev_kfree_skb_any() in error path
Date: Wed, 22 Nov 2023 10:25:56 +0900
Message-Id: <20231122012556.3645840-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122012556.3645840-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231122012556.3645840-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before returning the rswitch_start_xmit() in the error path,
dev_kfree_skb_any() should be called. So, fix it.

Fixes: 33f5d733b589 ("net: renesas: rswitch: Improve TX timestamp accuracy")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 61c15e7a2a2c..ab5daf657fdd 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1517,10 +1517,8 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 		return ret;
 
 	dma_addr = dma_map_single(ndev->dev.parent, skb->data, skb->len, DMA_TO_DEVICE);
-	if (dma_mapping_error(ndev->dev.parent, dma_addr)) {
-		dev_kfree_skb_any(skb);
-		return ret;
-	}
+	if (dma_mapping_error(ndev->dev.parent, dma_addr))
+		goto err_kfree;
 
 	gq->skbs[gq->cur] = skb;
 	desc = &gq->tx_ring[gq->cur];
@@ -1533,10 +1531,8 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 		struct rswitch_gwca_ts_info *ts_info;
 
 		ts_info = kzalloc(sizeof(*ts_info), GFP_ATOMIC);
-		if (!ts_info) {
-			dma_unmap_single(ndev->dev.parent, dma_addr, skb->len, DMA_TO_DEVICE);
-			return ret;
-		}
+		if (!ts_info)
+			goto err_unmap;
 
 		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
 		rdev->ts_tag++;
@@ -1558,6 +1554,14 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 	gq->cur = rswitch_next_queue_index(gq, true, 1);
 	rswitch_modify(rdev->addr, GWTRC(gq->index), 0, BIT(gq->index % 32));
 
+	return ret;
+
+err_unmap:
+	dma_unmap_single(ndev->dev.parent, dma_addr, skb->len, DMA_TO_DEVICE);
+
+err_kfree:
+	dev_kfree_skb_any(skb);
+
 	return ret;
 }
 
-- 
2.25.1


