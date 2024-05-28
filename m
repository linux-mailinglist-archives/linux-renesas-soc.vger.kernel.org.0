Return-Path: <linux-renesas-soc+bounces-5547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8C78D1F9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 17:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDF8E1C20B30
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 15:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DF5172BCE;
	Tue, 28 May 2024 15:04:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B095D172BC4;
	Tue, 28 May 2024 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716908643; cv=none; b=gUvDISldos7s9JIUqCrz+A0YGgNVd9JVIYO3pj0f9ubBlFaWq5EQlZNDdtg7D4QSGRiSW4nbIOeJG5a6fC6EoA+25jw7fs9nHDsAY+kSCA5DO/hBstNWrG+rGwQ52gcWJPIVXGYYJsPZUQmsdskUMPnN2f+lnbWU5xKMVFPzCVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716908643; c=relaxed/simple;
	bh=pWzNgkphtXiXy7iPTuWnI/yyhbvkBC3hyyHWSsy8Ppo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GJ8zR1X7iL/HV/TXiVKW3ZR91P0zPOXhZxrngD4rstVy4MQE7uypPJgD1igqjjVyMRrYIpFXDoQzhuNDBjm5eW7VNGoPkgAOotB9J1l0SlTdNdjFMyuh+jPVcgNgT0LoOmazuBZPcUD+IhRKfKtOL+Wyhk7Iu4ShRHuuZNSGg50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,195,1712588400"; 
   d="scan'208";a="209903721"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 May 2024 00:03:54 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.69])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AE1B4400CF1E;
	Wed, 29 May 2024 00:03:49 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v4 1/7] net: ravb: Simplify poll & receive functions
Date: Tue, 28 May 2024 16:03:33 +0100
Message-Id: <20240528150339.6791-2-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't need to pass the work budget to ravb_rx() by reference, it's
cleaner to pass this by value and return the amount of work done. This
allows us to simplify the ravb_poll() function and use the common
`work_done` variable name seen in other network drivers for consistency
and ease of understanding.

This is a pure refactor and should not affect behaviour.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb.h      |  2 +-
 drivers/net/ethernet/renesas/ravb_main.c | 27 +++++++++++-------------
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index b48935ec7e28..71de2a7aa27c 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1039,7 +1039,7 @@ struct ravb_ptp {
 };
 
 struct ravb_hw_info {
-	bool (*receive)(struct net_device *ndev, int *quota, int q);
+	int (*receive)(struct net_device *ndev, int budget, int q);
 	void (*set_rate)(struct net_device *ndev);
 	int (*set_feature)(struct net_device *ndev, netdev_features_t features);
 	int (*dmac_init)(struct net_device *ndev);
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 4d100283c30f..193ad05383a8 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -759,7 +759,7 @@ static struct sk_buff *ravb_get_skb_gbeth(struct net_device *ndev, int entry,
 }
 
 /* Packet receive function for Gigabit Ethernet */
-static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
+static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
@@ -781,7 +781,7 @@ static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
 	for (i = 0; i < limit; i++, priv->cur_rx[q]++) {
 		entry = priv->cur_rx[q] % priv->num_rx_ring[q];
 		desc = &priv->rx_ring[q].desc[entry];
-		if (rx_packets == *quota || desc->die_dt == DT_FEMPTY)
+		if (rx_packets == budget || desc->die_dt == DT_FEMPTY)
 			break;
 
 		/* Descriptor type must be checked before all other reads */
@@ -882,12 +882,11 @@ static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
 	}
 
 	stats->rx_packets += rx_packets;
-	*quota -= rx_packets;
-	return *quota == 0;
+	return rx_packets;
 }
 
 /* Packet receive function for Ethernet AVB */
-static bool ravb_rx_rcar(struct net_device *ndev, int *quota, int q)
+static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
@@ -906,7 +905,7 @@ static bool ravb_rx_rcar(struct net_device *ndev, int *quota, int q)
 	for (i = 0; i < limit; i++, priv->cur_rx[q]++) {
 		entry = priv->cur_rx[q] % priv->num_rx_ring[q];
 		desc = &priv->rx_ring[q].ex_desc[entry];
-		if (rx_packets == *quota || desc->die_dt == DT_FEMPTY)
+		if (rx_packets == budget || desc->die_dt == DT_FEMPTY)
 			break;
 
 		/* Descriptor type must be checked before all other reads */
@@ -992,17 +991,16 @@ static bool ravb_rx_rcar(struct net_device *ndev, int *quota, int q)
 	}
 
 	stats->rx_packets += rx_packets;
-	*quota -= rx_packets;
-	return *quota == 0;
+	return rx_packets;
 }
 
 /* Packet receive function for Ethernet AVB */
-static bool ravb_rx(struct net_device *ndev, int *quota, int q)
+static int ravb_rx(struct net_device *ndev, int budget, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
 
-	return info->receive(ndev, quota, q);
+	return info->receive(ndev, budget, q);
 }
 
 static void ravb_rcv_snd_disable(struct net_device *ndev)
@@ -1319,13 +1317,12 @@ static int ravb_poll(struct napi_struct *napi, int budget)
 	unsigned long flags;
 	int q = napi - priv->napi;
 	int mask = BIT(q);
-	int quota = budget;
-	bool unmask;
+	int work_done;
 
 	/* Processing RX Descriptor Ring */
 	/* Clear RX interrupt */
 	ravb_write(ndev, ~(mask | RIS0_RESERVED), RIS0);
-	unmask = !ravb_rx(ndev, &quota, q);
+	work_done = ravb_rx(ndev, budget, q);
 
 	/* Processing TX Descriptor Ring */
 	spin_lock_irqsave(&priv->lock, flags);
@@ -1344,7 +1341,7 @@ static int ravb_poll(struct napi_struct *napi, int budget)
 	if (priv->rx_fifo_errors != ndev->stats.rx_fifo_errors)
 		ndev->stats.rx_fifo_errors = priv->rx_fifo_errors;
 
-	if (!unmask)
+	if (work_done == budget)
 		goto out;
 
 	napi_complete(napi);
@@ -1361,7 +1358,7 @@ static int ravb_poll(struct napi_struct *napi, int budget)
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 out:
-	return budget - quota;
+	return work_done;
 }
 
 static void ravb_set_duplex_gbeth(struct net_device *ndev)
-- 
2.39.2


