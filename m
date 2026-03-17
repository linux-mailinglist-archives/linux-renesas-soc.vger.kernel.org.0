Return-Path: <linux-renesas-soc+bounces-29569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULFtGDIiuWnQsAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:43:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 046492A7114
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57BFF30547C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B8B39FCAB;
	Tue, 17 Mar 2026 09:42:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DE13947B0;
	Tue, 17 Mar 2026 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740537; cv=none; b=cMLrEe0ZBIHRFx9j2l5C/7mHiw4SAczr3vqZcr9kBMWsx92cnMFKQgLa3XmFpN5nBGGy3yPj76U/SHVaxUYbedXwjfLJJscBYbtVSf958GEDkVB5rE4+8ZpNiL4HENsAi0SFhoKEG1+i7qMl48ifwj0nNHxFcxddw7C3lDLREOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740537; c=relaxed/simple;
	bh=AHTbZ5ZMDiHqSa7GUptX2ISx1icHznDQhy/RCqMiIuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CzZm4cr53eTAajr7pHivkUOspKhgVMYYd3gcOacCHC0hB/crbw5bQ5UhxRJ9FnS5nB2a9pamFscNTUqNPxy9jET5FUxq2GWUJOIMVyPZbYqnZheIeaqqYcj1yQf/ylqjb+m6lCCl5qqZPSXKFHLaGNkkGsaSx3YrG87eF8VH+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: +KS2qGdsQdaU/TwCMS89bA==
X-CSE-MsgGUID: +tJhItJfTP6TOuIPjR3/9w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Mar 2026 18:42:08 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 668844015D64;
	Tue, 17 Mar 2026 18:42:05 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 17 Mar 2026 10:41:55 +0100
Subject: [PATCH net-next 02/13] net: renesas: rswitch: use device instead
 of net_device
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rswitch_add_vlans-v1-2-3a57bfa0f2d1@renesas.com>
References: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
In-Reply-To: <20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773740518; l=6218;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=AHTbZ5ZMDiHqSa7GUptX2ISx1icHznDQhy/RCqMiIuo=;
 b=jZH6De2N6We4sLwxisf82+luQ0Jm32QArrFp+oRtllIEn6hVAeYRTJ8hqeJKLzznFLm479nef
 t1yCoVKgBZQAlJxbuuuG1hG6Y23Nzy1m04rk/1sH6rUzqqsV3bRCOjL
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29569-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.607];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 046492A7114
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In upcomming changes for adding vlan support struct net_device
will not be available in all cases, therefore use struct device
instead.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_main.c | 34 ++++++++++++++---------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index f6d1e610e7fa..f10e188bc0bd 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -302,13 +302,13 @@ static int rswitch_gwca_queue_alloc_rx_buf(struct rswitch_gwca_queue *gq,
 	return -ENOMEM;
 }
 
-static void rswitch_gwca_queue_free(struct net_device *ndev,
+static void rswitch_gwca_queue_free(struct device *dev,
 				    struct rswitch_gwca_queue *gq)
 {
 	unsigned int i;
 
 	if (!gq->dir_tx) {
-		dma_free_coherent(ndev->dev.parent,
+		dma_free_coherent(dev,
 				  sizeof(struct rswitch_ext_ts_desc) *
 				  (gq->ring_size + 1), gq->rx_ring, gq->ring_dma);
 		gq->rx_ring = NULL;
@@ -318,7 +318,7 @@ static void rswitch_gwca_queue_free(struct net_device *ndev,
 		kfree(gq->rx_bufs);
 		gq->rx_bufs = NULL;
 	} else {
-		dma_free_coherent(ndev->dev.parent,
+		dma_free_coherent(dev,
 				  sizeof(struct rswitch_ext_desc) *
 				  (gq->ring_size + 1), gq->tx_ring, gq->ring_dma);
 		gq->tx_ring = NULL;
@@ -357,7 +357,7 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
 		if (rswitch_gwca_queue_alloc_rx_buf(gq, 0, gq->ring_size) < 0)
 			goto out;
 
-		gq->rx_ring = dma_alloc_coherent(ndev->dev.parent,
+		gq->rx_ring = dma_alloc_coherent(&priv->pdev->dev,
 						 sizeof(struct rswitch_ext_ts_desc) *
 						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
 	} else {
@@ -367,7 +367,7 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
 		gq->unmap_addrs = kzalloc_objs(*gq->unmap_addrs, gq->ring_size);
 		if (!gq->unmap_addrs)
 			goto out;
-		gq->tx_ring = dma_alloc_coherent(ndev->dev.parent,
+		gq->tx_ring = dma_alloc_coherent(&priv->pdev->dev,
 						 sizeof(struct rswitch_ext_desc) *
 						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
 	}
@@ -385,7 +385,7 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
 	return 0;
 
 out:
-	rswitch_gwca_queue_free(ndev, gq);
+	rswitch_gwca_queue_free(&priv->pdev->dev, gq);
 
 	return -ENOMEM;
 }
@@ -467,12 +467,11 @@ static void rswitch_gwca_ts_queue_fill(struct rswitch_private *priv,
 	}
 }
 
-static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
+static int rswitch_gwca_queue_ext_ts_fill(struct device *dev,
 					  struct rswitch_gwca_queue *gq,
 					  unsigned int start_index,
 					  unsigned int num)
 {
-	struct rswitch_device *rdev = netdev_priv(ndev);
 	struct rswitch_ext_ts_desc *desc;
 	unsigned int i, index;
 	dma_addr_t dma_addr;
@@ -481,18 +480,17 @@ static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
 		index = (i + start_index) % gq->ring_size;
 		desc = &gq->rx_ring[index];
 		if (!gq->dir_tx) {
-			dma_addr = dma_map_single(ndev->dev.parent,
+			dma_addr = dma_map_single(dev,
 						  gq->rx_bufs[index] + RSWITCH_HEADROOM,
 						  RSWITCH_MAP_BUF_SIZE,
 						  DMA_FROM_DEVICE);
-			if (dma_mapping_error(ndev->dev.parent, dma_addr))
+			if (dma_mapping_error(dev, dma_addr))
 				goto err;
 
 			desc->desc.info_ds = cpu_to_le16(RSWITCH_DESC_BUF_SIZE);
 			rswitch_desc_set_dptr(&desc->desc, dma_addr);
 			dma_wmb();
 			desc->desc.die_dt = DT_FEMPTY | DIE;
-			desc->info1 = cpu_to_le64(INFO1_SPN(rdev->etha->index));
 		} else {
 			desc->desc.die_dt = DT_EEMPTY | DIE;
 		}
@@ -506,7 +504,7 @@ static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
 			index = (i + start_index) % gq->ring_size;
 			desc = &gq->rx_ring[index];
 			dma_addr = rswitch_desc_get_dptr(&desc->desc);
-			dma_unmap_single(ndev->dev.parent, dma_addr,
+			dma_unmap_single(dev, dma_addr,
 					 RSWITCH_MAP_BUF_SIZE, DMA_FROM_DEVICE);
 		}
 	}
@@ -514,7 +512,7 @@ static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
 	return -ENOMEM;
 }
 
-static int rswitch_gwca_queue_ext_ts_format(struct net_device *ndev,
+static int rswitch_gwca_queue_ext_ts_format(struct device *dev,
 					    struct rswitch_private *priv,
 					    struct rswitch_gwca_queue *gq)
 {
@@ -524,7 +522,7 @@ static int rswitch_gwca_queue_ext_ts_format(struct net_device *ndev,
 	int err;
 
 	memset(gq->rx_ring, 0, ring_size);
-	err = rswitch_gwca_queue_ext_ts_fill(ndev, gq, 0, gq->ring_size);
+	err = rswitch_gwca_queue_ext_ts_fill(dev, gq, 0, gq->ring_size);
 	if (err < 0)
 		return err;
 
@@ -636,7 +634,7 @@ static void rswitch_txdmac_free(struct net_device *ndev)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
 
-	rswitch_gwca_queue_free(ndev, rdev->tx_queue);
+	rswitch_gwca_queue_free(ndev->dev.parent, rdev->tx_queue);
 	rswitch_gwca_put(rdev->priv, rdev->tx_queue);
 }
 
@@ -670,7 +668,7 @@ static void rswitch_rxdmac_free(struct net_device *ndev)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
 
-	rswitch_gwca_queue_free(ndev, rdev->rx_queue);
+	rswitch_gwca_queue_free(ndev->dev.parent, rdev->rx_queue);
 	rswitch_gwca_put(rdev->priv, rdev->rx_queue);
 }
 
@@ -679,7 +677,7 @@ static int rswitch_rxdmac_init(struct rswitch_private *priv, unsigned int index)
 	struct rswitch_device *rdev = priv->rdev[index];
 	struct net_device *ndev = rdev->ndev;
 
-	return rswitch_gwca_queue_ext_ts_format(ndev, priv, rdev->rx_queue);
+	return rswitch_gwca_queue_ext_ts_format(ndev->dev.parent, priv, rdev->rx_queue);
 }
 
 static int rswitch_gwca_hw_init(struct rswitch_private *priv)
@@ -870,7 +868,7 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 	ret = rswitch_gwca_queue_alloc_rx_buf(gq, gq->dirty, num);
 	if (ret < 0)
 		goto err;
-	ret = rswitch_gwca_queue_ext_ts_fill(ndev, gq, gq->dirty, num);
+	ret = rswitch_gwca_queue_ext_ts_fill(ndev->dev.parent, gq, gq->dirty, num);
 	if (ret < 0)
 		goto err;
 	gq->dirty = rswitch_next_queue_index(gq, false, num);

-- 
2.43.0


