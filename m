Return-Path: <linux-renesas-soc+bounces-283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 753767F9F80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 13:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5F0F1C20B6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 12:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D711DFCB;
	Mon, 27 Nov 2023 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id C8B9C13A;
	Mon, 27 Nov 2023 04:24:23 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,230,1695654000"; 
   d="scan'208";a="188255212"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Nov 2023 21:24:22 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DEFC04009414;
	Mon, 27 Nov 2023 21:24:22 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net v4] ravb: Fix races between ravb_tx_timeout_work() and net related ops
Date: Mon, 27 Nov 2023 21:24:20 +0900
Message-Id: <20231127122420.3706751-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

If rtnl_trylock() fails, rescheduling the work with sleep for 1 msec.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes from v3:
https://lore.kernel.org/all/20231115022644.2316961-1-yoshihiro.shimoda.uh@renesas.com/
 - Based on v2 patch. This means that delayed work is not used.
 - Add rescheduling the work if rtnl_trylock() fails.
 - Drop Reviewed-by tags because implementation was changed.

Changes from v2:
https://lore.kernel.org/netdev/20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com/
 - Add rescheduling if rtnl_trylock() fails and the netif is still running
   and update commit description for it.
 - Add Reviewed-by tags.

 drivers/net/ethernet/renesas/ravb_main.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c70cff80cc99..7c007ecd3ff6 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1874,6 +1874,12 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 	struct net_device *ndev = priv->ndev;
 	int error;
 
+	if (!rtnl_trylock()) {
+		usleep_range(1000, 2000);
+		schedule_work(&priv->work);
+		return;
+	}
+
 	netif_tx_stop_all_queues(ndev);
 
 	/* Stop PTP Clock driver */
@@ -1907,7 +1913,7 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 		 */
 		netdev_err(ndev, "%s: ravb_dmac_init() failed, error %d\n",
 			   __func__, error);
-		return;
+		goto out_unlock;
 	}
 	ravb_emac_init(ndev);
 
@@ -1917,6 +1923,9 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 		ravb_ptp_init(ndev, priv->pdev);
 
 	netif_tx_start_all_queues(ndev);
+
+out_unlock:
+	rtnl_unlock();
 }
 
 /* Packet transmit function for Ethernet AVB */
-- 
2.25.1


