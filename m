Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9A7663D59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 10:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjAJJ42 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 04:56:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbjAJJ42 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 04:56:28 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 12EA93E0CC;
        Tue, 10 Jan 2023 01:56:26 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,314,1665414000"; 
   d="scan'208";a="148842826"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jan 2023 18:56:26 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 657AC4237EB9;
        Tue, 10 Jan 2023 18:56:26 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net] net: ethernet: renesas: rswitch: Fix ethernet-ports handling
Date:   Tue, 10 Jan 2023 18:55:59 +0900
Message-Id: <20230110095559.314429-1-yoshihiro.shimoda.uh@renesas.com>
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

If one of ports in the ethernet-ports was disabled, this driver
failed to probe all ports. So, fix it.

Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 The checkpatch.pl reports the following ERROR:

    Macros with multiple statements should be enclosed in a do - while loop

 However, include/linux/cpufreq.h has similar macros and the same ERROR
 happened. So, I assume that the ERROR can be ignored.

 drivers/net/ethernet/renesas/rswitch.c | 22 +++++++++++++---------
 drivers/net/ethernet/renesas/rswitch.h | 12 ++++++++++++
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 6441892636db..6818216212df 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1074,8 +1074,11 @@ static struct device_node *rswitch_get_port_node(struct rswitch_device *rdev)
 			port = NULL;
 			goto out;
 		}
-		if (index == rdev->etha->index)
+		if (index == rdev->etha->index) {
+			if (!of_device_is_available(port))
+				port = NULL;
 			break;
+		}
 	}
 
 out:
@@ -1106,7 +1109,7 @@ static int rswitch_etha_get_params(struct rswitch_device *rdev)
 
 	port = rswitch_get_port_node(rdev);
 	if (!port)
-		return -ENODEV;
+		return 0;	/* ignored */
 
 	err = of_get_phy_mode(port, &rdev->etha->phy_interface);
 	of_node_put(port);
@@ -1324,13 +1327,13 @@ static int rswitch_ether_port_init_all(struct rswitch_private *priv)
 {
 	int i, err;
 
-	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
+	rswitch_for_each_enabled_port(priv, i) {
 		err = rswitch_ether_port_init_one(priv->rdev[i]);
 		if (err)
 			goto err_init_one;
 	}
 
-	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
+	rswitch_for_each_enabled_port(priv, i) {
 		err = rswitch_serdes_init(priv->rdev[i]);
 		if (err)
 			goto err_serdes;
@@ -1339,12 +1342,12 @@ static int rswitch_ether_port_init_all(struct rswitch_private *priv)
 	return 0;
 
 err_serdes:
-	for (i--; i >= 0; i--)
+	rswitch_for_each_enabled_port_reverse(priv, i)
 		rswitch_serdes_deinit(priv->rdev[i]);
 	i = RSWITCH_NUM_PORTS;
 
 err_init_one:
-	for (i--; i >= 0; i--)
+	rswitch_for_each_enabled_port_reverse(priv, i)
 		rswitch_ether_port_deinit_one(priv->rdev[i]);
 
 	return err;
@@ -1608,6 +1611,7 @@ static int rswitch_device_alloc(struct rswitch_private *priv, int index)
 	netif_napi_add(ndev, &rdev->napi, rswitch_poll);
 
 	port = rswitch_get_port_node(rdev);
+	rdev->disabled = !port;
 	err = of_get_ethdev_address(port, ndev);
 	of_node_put(port);
 	if (err) {
@@ -1707,16 +1711,16 @@ static int rswitch_init(struct rswitch_private *priv)
 	if (err)
 		goto err_ether_port_init_all;
 
-	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
+	rswitch_for_each_enabled_port(priv, i) {
 		err = register_netdev(priv->rdev[i]->ndev);
 		if (err) {
-			for (i--; i >= 0; i--)
+			rswitch_for_each_enabled_port_reverse(priv, i)
 				unregister_netdev(priv->rdev[i]->ndev);
 			goto err_register_netdev;
 		}
 	}
 
-	for (i = 0; i < RSWITCH_NUM_PORTS; i++)
+	rswitch_for_each_enabled_port(priv, i)
 		netdev_info(priv->rdev[i]->ndev, "MAC address %pM\n",
 			    priv->rdev[i]->ndev->dev_addr);
 
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index edbdd1b98d3d..628bd5b0b3de 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -13,6 +13,17 @@
 #define RSWITCH_MAX_NUM_QUEUES	128
 
 #define RSWITCH_NUM_PORTS	3
+#define rswitch_for_each_enabled_port(priv, i)		\
+	for (i = 0; i < RSWITCH_NUM_PORTS; i++)		\
+		if (priv->rdev[i]->disabled)		\
+			continue;			\
+		else
+
+#define rswitch_for_each_enabled_port_reverse(priv, i)	\
+	for (i--; i >= 0; i--)				\
+		if (priv->rdev[i]->disabled)		\
+			continue;			\
+		else
 
 #define TX_RING_SIZE		1024
 #define RX_RING_SIZE		1024
@@ -938,6 +949,7 @@ struct rswitch_device {
 	struct rswitch_gwca_queue *tx_queue;
 	struct rswitch_gwca_queue *rx_queue;
 	u8 ts_tag;
+	bool disabled;
 
 	int port;
 	struct rswitch_etha *etha;
-- 
2.25.1

