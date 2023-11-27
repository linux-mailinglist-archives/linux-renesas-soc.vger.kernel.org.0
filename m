Return-Path: <linux-renesas-soc+bounces-274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3060A7F9F06
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 12:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 615151C20C98
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 11:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511091C2A9;
	Mon, 27 Nov 2023 11:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 84243CB;
	Mon, 27 Nov 2023 03:53:40 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,230,1695654000"; 
   d="scan'208";a="188253117"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Nov 2023 20:53:39 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CEA83400CEE4;
	Mon, 27 Nov 2023 20:53:39 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next 1/9] net: rswitch: Drop unused argument/return value
Date: Mon, 27 Nov 2023 20:53:26 +0900
Message-Id: <20231127115334.3670790-2-yoshihiro.shimoda.uh@renesas.com>
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

Drop unused argument and return value of rswitch_tx_free() to
simplify the code.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 89e7a6551c64..8c03c0e18003 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -761,20 +761,19 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 	return 0;
 }
 
-static int rswitch_tx_free(struct net_device *ndev, bool free_txed_only)
+static void rswitch_tx_free(struct net_device *ndev)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
 	struct rswitch_gwca_queue *gq = rdev->tx_queue;
 	struct rswitch_ext_desc *desc;
 	dma_addr_t dma_addr;
 	struct sk_buff *skb;
-	int free_num = 0;
 	int size;
 
 	for (; rswitch_get_num_cur_queues(gq) > 0;
 	     gq->dirty = rswitch_next_queue_index(gq, false, 1)) {
 		desc = &gq->tx_ring[gq->dirty];
-		if (free_txed_only && (desc->desc.die_dt & DT_MASK) != DT_FEMPTY)
+		if ((desc->desc.die_dt & DT_MASK) != DT_FEMPTY)
 			break;
 
 		dma_rmb();
@@ -786,14 +785,11 @@ static int rswitch_tx_free(struct net_device *ndev, bool free_txed_only)
 					 size, DMA_TO_DEVICE);
 			dev_kfree_skb_any(gq->skbs[gq->dirty]);
 			gq->skbs[gq->dirty] = NULL;
-			free_num++;
 		}
 		desc->desc.die_dt = DT_EEMPTY;
 		rdev->ndev->stats.tx_packets++;
 		rdev->ndev->stats.tx_bytes += size;
 	}
-
-	return free_num;
 }
 
 static int rswitch_poll(struct napi_struct *napi, int budget)
@@ -808,7 +804,7 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
 	priv = rdev->priv;
 
 retry:
-	rswitch_tx_free(ndev, true);
+	rswitch_tx_free(ndev);
 
 	if (rswitch_rx(ndev, &quota))
 		goto out;
-- 
2.34.1


