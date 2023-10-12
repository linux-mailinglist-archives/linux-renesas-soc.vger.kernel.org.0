Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE7747C6DC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Oct 2023 14:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347193AbjJLMQh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Oct 2023 08:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347211AbjJLMQg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 08:16:36 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 882FDB7;
        Thu, 12 Oct 2023 05:16:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,218,1694703600"; 
   d="scan'208";a="182840405"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Oct 2023 21:16:33 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E6EF042C9E68;
        Thu, 12 Oct 2023 21:16:33 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next] rswitch: Add PM ops
Date:   Thu, 12 Oct 2023 21:16:18 +0900
Message-Id: <20231012121618.267315-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add PM ops for Suspend to Idle. When the system suspended,
the Ethernet Serdes's clock will be stopped. So, this driver needs
to re-initialize the Ethernet Serdes by phy_init() in
renesas_eth_sw_resume(). Otherwise, timeout happened in phy_power_on().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the latest net-next.git / next branch.
 After applied this patch with the following patches, the system can
 enter/exit Suspend to Idle without any error:

https://lore.kernel.org/netdev/20230201131454.1928136-1-yoshihiro.shimoda.uh@renesas.com/
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=510b18cf23b9bd8a982ef7f1fb19f3968a2bf787
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=053f13f67be6d02781730c9ac71abde6e9140610

 drivers/net/ethernet/renesas/rswitch.c | 43 ++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 0023ff254915..301053db61ac 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -17,6 +17,7 @@
 #include <linux/of_net.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/rtnetlink.h>
 #include <linux/slab.h>
@@ -1315,6 +1316,7 @@ static int rswitch_phy_device_init(struct rswitch_device *rdev)
 	if (!phydev)
 		goto out;
 	__set_bit(rdev->etha->phy_interface, phydev->host_interfaces);
+	phydev->mac_managed_pm = true;
 
 	phydev = of_phy_connect(rdev->ndev, phy, rswitch_adjust_link, 0,
 				rdev->etha->phy_interface);
@@ -1991,11 +1993,52 @@ static void renesas_eth_sw_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static int __maybe_unused renesas_eth_sw_suspend(struct device *dev)
+{
+	struct rswitch_private *priv = dev_get_drvdata(dev);
+	struct net_device *ndev;
+	int i;
+
+	rswitch_for_each_enabled_port(priv, i) {
+		ndev = priv->rdev[i]->ndev;
+		if (netif_running(ndev)) {
+			netif_device_detach(ndev);
+			rswitch_stop(ndev);
+		}
+		if (priv->rdev[i]->serdes->init_count)
+			phy_exit(priv->rdev[i]->serdes);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused renesas_eth_sw_resume(struct device *dev)
+{
+	struct rswitch_private *priv = dev_get_drvdata(dev);
+	struct net_device *ndev;
+	int i;
+
+	rswitch_for_each_enabled_port(priv, i) {
+		phy_init(priv->rdev[i]->serdes);
+		ndev = priv->rdev[i]->ndev;
+		if (netif_running(ndev)) {
+			rswitch_open(ndev);
+			netif_device_attach(ndev);
+		}
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(renesas_eth_sw_pm_ops, renesas_eth_sw_suspend,
+			 renesas_eth_sw_resume);
+
 static struct platform_driver renesas_eth_sw_driver_platform = {
 	.probe = renesas_eth_sw_probe,
 	.remove_new = renesas_eth_sw_remove,
 	.driver = {
 		.name = "renesas_eth_sw",
+		.pm = &renesas_eth_sw_pm_ops,
 		.of_match_table = renesas_eth_sw_of_table,
 	}
 };
-- 
2.25.1

