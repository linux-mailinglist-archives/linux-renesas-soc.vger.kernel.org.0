Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC8D27BFBBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Oct 2023 14:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbjJJMtG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Oct 2023 08:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231959AbjJJMtG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 08:49:06 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CE42CB7;
        Tue, 10 Oct 2023 05:49:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,212,1694703600"; 
   d="scan'208";a="178774641"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Oct 2023 21:49:02 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1784543EB677;
        Tue, 10 Oct 2023 21:49:02 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net 1/2] rswitch: Fix renesas_eth_sw_remove() implementation
Date:   Tue, 10 Oct 2023 21:48:57 +0900
Message-Id: <20231010124858.183891-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010124858.183891-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231010124858.183891-1-yoshihiro.shimoda.uh@renesas.com>
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

Fix functions calling order and a condition in renesas_eth_sw_remove().
Otherwise, kernel NULL pointer dereference happens from phy_stop() if
a net device opens.

Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index fc01ad3f340d..4d7c48288047 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1964,15 +1964,17 @@ static void rswitch_deinit(struct rswitch_private *priv)
 	rswitch_gwca_hw_deinit(priv);
 	rcar_gen4_ptp_unregister(priv->ptp_priv);
 
-	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
+	rswitch_for_each_enabled_port(priv, i) {
 		struct rswitch_device *rdev = priv->rdev[i];
 
-		phy_exit(priv->rdev[i]->serdes);
-		rswitch_ether_port_deinit_one(rdev);
 		unregister_netdev(rdev->ndev);
-		rswitch_device_free(priv, i);
+		rswitch_ether_port_deinit_one(rdev);
+		phy_exit(priv->rdev[i]->serdes);
 	}
 
+	for (i = 0; i < RSWITCH_NUM_PORTS; i++)
+		rswitch_device_free(priv, i);
+
 	rswitch_gwca_ts_queue_free(priv);
 	rswitch_gwca_linkfix_free(priv);
 
-- 
2.25.1

