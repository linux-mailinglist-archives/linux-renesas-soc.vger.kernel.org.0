Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA1079C3CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 05:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241626AbjILDOc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 23:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236427AbjILDOX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 23:14:23 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B7842F8C9;
        Mon, 11 Sep 2023 18:49:45 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,244,1688396400"; 
   d="scan'208";a="179473814"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Sep 2023 10:49:44 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7560C41065C0;
        Tue, 12 Sep 2023 10:49:44 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net 2/2] net: renesas: rswitch: Add spin lock protection for irq {un}mask
Date:   Tue, 12 Sep 2023 10:49:36 +0900
Message-Id: <20230912014936.3175430-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230912014936.3175430-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230912014936.3175430-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add spin lock protection for irq {un}mask registers' control.

After napi_complete_done() and this protection were applied,
a lot of redundant interrupts no longer occur.

For example: when "iperf3 -c <ipaddr> -R" on R-Car S4-8 Spider
 Before the patches are applied: about 800,000 times happened
 After the patches were applied: about 100,000 times happened

Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 12 ++++++++++++
 drivers/net/ethernet/renesas/rswitch.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 26c8807d7dea..ea9186178091 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -799,6 +799,7 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
 	struct net_device *ndev = napi->dev;
 	struct rswitch_private *priv;
 	struct rswitch_device *rdev;
+	unsigned long flags;
 	int quota = budget;
 
 	rdev = netdev_priv(ndev);
@@ -817,8 +818,10 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
 	netif_wake_subqueue(ndev, 0);
 
 	if (napi_complete_done(napi, budget - quota)) {
+		spin_lock_irqsave(&priv->lock, flags);
 		rswitch_enadis_data_irq(priv, rdev->tx_queue->index, true);
 		rswitch_enadis_data_irq(priv, rdev->rx_queue->index, true);
+		spin_unlock_irqrestore(&priv->lock, flags);
 	}
 
 out:
@@ -835,8 +838,10 @@ static void rswitch_queue_interrupt(struct net_device *ndev)
 	struct rswitch_device *rdev = netdev_priv(ndev);
 
 	if (napi_schedule_prep(&rdev->napi)) {
+		spin_lock(&rdev->priv->lock);
 		rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
 		rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
+		spin_unlock(&rdev->priv->lock);
 		__napi_schedule(&rdev->napi);
 	}
 }
@@ -1440,14 +1445,17 @@ static void rswitch_ether_port_deinit_all(struct rswitch_private *priv)
 static int rswitch_open(struct net_device *ndev)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
+	unsigned long flags;
 
 	phy_start(ndev->phydev);
 
 	napi_enable(&rdev->napi);
 	netif_start_queue(ndev);
 
+	spin_lock_irqsave(&rdev->priv->lock, flags);
 	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, true);
 	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, true);
+	spin_unlock_irqrestore(&rdev->priv->lock, flags);
 
 	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
 		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDIE);
@@ -1461,6 +1469,7 @@ static int rswitch_stop(struct net_device *ndev)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
 	struct rswitch_gwca_ts_info *ts_info, *ts_info2;
+	unsigned long flags;
 
 	netif_tx_stop_all_queues(ndev);
 	bitmap_clear(rdev->priv->opened_ports, rdev->port, 1);
@@ -1476,8 +1485,10 @@ static int rswitch_stop(struct net_device *ndev)
 		kfree(ts_info);
 	}
 
+	spin_lock_irqsave(&rdev->priv->lock, flags);
 	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
 	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
+	spin_unlock_irqrestore(&rdev->priv->lock, flags);
 
 	phy_stop(ndev->phydev);
 	napi_disable(&rdev->napi);
@@ -1887,6 +1898,7 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
+	spin_lock_init(&priv->lock);
 
 	attr = soc_device_match(rswitch_soc_no_speed_change);
 	if (attr)
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 54f397effbc6..f0c16a37ea55 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1011,6 +1011,8 @@ struct rswitch_private {
 	struct rswitch_etha etha[RSWITCH_NUM_PORTS];
 	struct rswitch_mfwd mfwd;
 
+	spinlock_t lock;	/* lock interrupt registers' control */
+
 	bool etha_no_runtime_change;
 	bool gwca_halt;
 };
-- 
2.25.1

