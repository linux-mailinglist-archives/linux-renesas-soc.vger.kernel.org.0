Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7FA376E7D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Aug 2023 14:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232809AbjHCMHF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Aug 2023 08:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235132AbjHCMHC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2023 08:07:02 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8D96730D1;
        Thu,  3 Aug 2023 05:06:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,252,1684767600"; 
   d="scan'208";a="171804059"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Aug 2023 21:06:33 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A203540065A4;
        Thu,  3 Aug 2023 21:06:33 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next 1/2] net: renesas: rswitch: Add runtime speed change support
Date:   Thu,  3 Aug 2023 21:06:20 +0900
Message-Id: <20230803120621.1471440-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230803120621.1471440-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230803120621.1471440-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The latest SoC version can support runtime speed change. So,
add detect SoC version by using soc_device_match() and then
reconfigure the hardware of this and SerDes if needed.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 27 +++++++++++++++++++++++---
 drivers/net/ethernet/renesas/rswitch.h |  1 +
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 0ba7fb75d589..2c1c584f0ca4 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -20,6 +20,7 @@
 #include <linux/rtnetlink.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/sys_soc.h>
 
 #include "rswitch.h"
 
@@ -1243,7 +1244,6 @@ static void rswitch_adjust_link(struct net_device *ndev)
 	struct rswitch_device *rdev = netdev_priv(ndev);
 	struct phy_device *phydev = ndev->phydev;
 
-	/* Current hardware has a restriction not to change speed at runtime */
 	if (phydev->link != rdev->etha->link) {
 		phy_print_status(phydev);
 		if (phydev->link)
@@ -1252,13 +1252,23 @@ static void rswitch_adjust_link(struct net_device *ndev)
 			phy_power_off(rdev->serdes);
 
 		rdev->etha->link = phydev->link;
+
+		if (!rdev->priv->etha_no_runtime_change &&
+		    phydev->speed != rdev->etha->speed) {
+			rdev->etha->speed = phydev->speed;
+
+			rswitch_etha_hw_init(rdev->etha, rdev->ndev->dev_addr);
+			phy_set_speed(rdev->serdes, rdev->etha->speed);
+		}
 	}
 }
 
 static void rswitch_phy_remove_link_mode(struct rswitch_device *rdev,
 					 struct phy_device *phydev)
 {
-	/* Current hardware has a restriction not to change speed at runtime */
+	if (!rdev->priv->etha_no_runtime_change)
+		return;
+
 	switch (rdev->etha->speed) {
 	case SPEED_2500:
 		phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_1000baseT_Full_BIT);
@@ -1347,7 +1357,8 @@ static int rswitch_ether_port_init_one(struct rswitch_device *rdev)
 		err = rswitch_etha_hw_init(rdev->etha, rdev->ndev->dev_addr);
 		if (err < 0)
 			return err;
-		rdev->etha->operated = true;
+		if (rdev->priv->etha_no_runtime_change)
+			rdev->etha->operated = true;
 	}
 
 	err = rswitch_mii_register(rdev);
@@ -1853,8 +1864,14 @@ static int rswitch_init(struct rswitch_private *priv)
 	return err;
 }
 
+static const struct soc_device_attribute rswitch_soc_match[]  = {
+	{ .soc_id = "r8a779f0", .revision = "ES1.0" },
+	{ /* Sentinel */ }
+};
+
 static int renesas_eth_sw_probe(struct platform_device *pdev)
 {
+	const struct soc_device_attribute *attr;
 	struct rswitch_private *priv;
 	struct resource *res;
 	int ret;
@@ -1869,6 +1886,10 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	attr = soc_device_match(rswitch_soc_match);
+	if (attr)
+		priv->etha_no_runtime_change = true;
+
 	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev);
 	if (!priv->ptp_priv)
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index bb9ed971a97c..54f397effbc6 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1011,6 +1011,7 @@ struct rswitch_private {
 	struct rswitch_etha etha[RSWITCH_NUM_PORTS];
 	struct rswitch_mfwd mfwd;
 
+	bool etha_no_runtime_change;
 	bool gwca_halt;
 };
 
-- 
2.25.1

