Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0237C8584
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 14:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbjJMMTs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 08:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbjJMMTq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 08:19:46 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2A77EBF;
        Fri, 13 Oct 2023 05:19:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,222,1694703600"; 
   d="scan'208";a="182975503"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Oct 2023 21:19:41 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EA8BB4004476;
        Fri, 13 Oct 2023 21:19:41 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v2 2/2] rswitch: Add PM ops
Date:   Fri, 13 Oct 2023 21:19:36 +0900
Message-Id: <20231013121936.364678-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231013121936.364678-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231013121936.364678-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
 drivers/net/ethernet/renesas/rswitch.c | 43 ++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 7640144db79b..34b7ce6b771e 100644
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
@@ -1995,11 +1997,52 @@ static void renesas_eth_sw_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static int renesas_eth_sw_suspend(struct device *dev)
+{
+	struct rswitch_private *priv = dev_get_drvdata(dev);
+	struct net_device *ndev;
+	unsigned int i;
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
+static int renesas_eth_sw_resume(struct device *dev)
+{
+	struct rswitch_private *priv = dev_get_drvdata(dev);
+	struct net_device *ndev;
+	unsigned int i;
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
+static DEFINE_SIMPLE_DEV_PM_OPS(renesas_eth_sw_pm_ops, renesas_eth_sw_suspend,
+				renesas_eth_sw_resume);
+
 static struct platform_driver renesas_eth_sw_driver_platform = {
 	.probe = renesas_eth_sw_probe,
 	.remove_new = renesas_eth_sw_remove,
 	.driver = {
 		.name = "renesas_eth_sw",
+		.pm = pm_sleep_ptr(&renesas_eth_sw_pm_ops),
 		.of_match_table = renesas_eth_sw_of_table,
 	}
 };
-- 
2.25.1

