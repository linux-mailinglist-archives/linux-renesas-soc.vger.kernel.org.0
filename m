Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE5C77EBB2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Nov 2023 03:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjKOC1N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 21:27:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjKOC1N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 21:27:13 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 46551C4;
        Tue, 14 Nov 2023 18:27:09 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.03,303,1694703600"; 
   d="scan'208";a="186791585"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Nov 2023 11:27:08 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 99570400F331;
        Wed, 15 Nov 2023 11:27:08 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@kernel.org>
Subject: [PATCH net v3] ravb: Fix races between ravb_tx_timeout_work() and net related ops
Date:   Wed, 15 Nov 2023 11:26:44 +0900
Message-Id: <20231115022644.2316961-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix races between ravb_tx_timeout_work() and functions of net_device_ops
and ethtool_ops by using rtnl_trylock() and rtnl_unlock(). Note that
since ravb_close() is under the rtnl lock and calls cancel_work_sync(),
ravb_tx_timeout_work() should calls rtnl_trylock(). Otherwise, a deadlock
may happen in ravb_tx_timeout_work() like below:

CPU0			CPU1
			ravb_tx_timeout()
			schedule_work()
...
__dev_close_many()
// Under rtnl lock
ravb_close()
cancel_work_sync()
// Waiting
			ravb_tx_timeout_work()
			rtnl_lock()
			// This is possible to cause a deadlock

And, if rtnl_trylock() fails and the netif is still running,
rescheduling the work with 1 msec delayed. So, using
schedule_delayed_work() instead of schedule_work().

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Simon Horman <horms@kernel.org>
---
Changes from v2:
https://lore.kernel.org/netdev/20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com/
 - Add rescheduling if rtnl_trylock() fails and the netif is still running
   and update commit description for it.
 - Add Reviewed-by tags.

Changes from v1:
https://lore.kernel.org/all/20231017085341.813335-1-yoshihiro.shimoda.uh@renesas.com/
 - Modify commit description.
 - Use goto in a error path.

 drivers/net/ethernet/renesas/ravb.h      |  2 +-
 drivers/net/ethernet/renesas/ravb_main.c | 20 +++++++++++++++-----
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index e0f8276cffed..e9bb8ee3ba2d 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1081,7 +1081,7 @@ struct ravb_private {
 	u32 cur_tx[NUM_TX_QUEUE];
 	u32 dirty_tx[NUM_TX_QUEUE];
 	struct napi_struct napi[NUM_RX_QUEUE];
-	struct work_struct work;
+	struct delayed_work work;
 	/* MII transceiver section. */
 	struct mii_bus *mii_bus;	/* MDIO bus control */
 	int link;
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c70cff80cc99..ca7db8a5b412 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1863,17 +1863,24 @@ static void ravb_tx_timeout(struct net_device *ndev, unsigned int txqueue)
 	/* tx_errors count up */
 	ndev->stats.tx_errors++;
 
-	schedule_work(&priv->work);
+	schedule_delayed_work(&priv->work, 0);
 }
 
 static void ravb_tx_timeout_work(struct work_struct *work)
 {
-	struct ravb_private *priv = container_of(work, struct ravb_private,
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct ravb_private *priv = container_of(dwork, struct ravb_private,
 						 work);
 	const struct ravb_hw_info *info = priv->info;
 	struct net_device *ndev = priv->ndev;
 	int error;
 
+	if (!rtnl_trylock()) {
+		if (netif_running(ndev))
+			schedule_delayed_work(&priv->work, msecs_to_jiffies(10));
+		return;
+	}
+
 	netif_tx_stop_all_queues(ndev);
 
 	/* Stop PTP Clock driver */
@@ -1907,7 +1914,7 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 		 */
 		netdev_err(ndev, "%s: ravb_dmac_init() failed, error %d\n",
 			   __func__, error);
-		return;
+		goto out_unlock;
 	}
 	ravb_emac_init(ndev);
 
@@ -1917,6 +1924,9 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 		ravb_ptp_init(ndev, priv->pdev);
 
 	netif_tx_start_all_queues(ndev);
+
+out_unlock:
+	rtnl_unlock();
 }
 
 /* Packet transmit function for Ethernet AVB */
@@ -2167,7 +2177,7 @@ static int ravb_close(struct net_device *ndev)
 			of_phy_deregister_fixed_link(np);
 	}
 
-	cancel_work_sync(&priv->work);
+	cancel_delayed_work_sync(&priv->work);
 
 	if (info->multi_irqs) {
 		free_irq(priv->tx_irqs[RAVB_NC], ndev);
@@ -2687,7 +2697,7 @@ static int ravb_probe(struct platform_device *pdev)
 	ndev->base_addr = res->start;
 
 	spin_lock_init(&priv->lock);
-	INIT_WORK(&priv->work, ravb_tx_timeout_work);
+	INIT_DELAYED_WORK(&priv->work, ravb_tx_timeout_work);
 
 	error = of_get_phy_mode(np, &priv->phy_interface);
 	if (error && error != -ENODEV)
-- 
2.25.1

