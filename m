Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 126D97AECE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 14:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234560AbjIZMbM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 08:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234605AbjIZMbM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 08:31:12 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C3A7910A;
        Tue, 26 Sep 2023 05:31:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="181033875"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Sep 2023 21:31:02 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2A1224004CFB;
        Tue, 26 Sep 2023 21:31:02 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH net v3] rswitch: Fix PHY station management clock setting
Date:   Tue, 26 Sep 2023 21:30:54 +0900
Message-Id: <20230926123054.3976752-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix the MPIC.PSMCS value following the programming example in the
section 6.4.2 Management Data Clock (MDC) Setting, Ethernet MAC IP,
S4 Hardware User Manual Rev.1.00.

The value is calculated by
    MPIC.PSMCS = clk[MHz] / (MDC frequency[MHz] * 2) - 1
with the input clock frequency from clk_get_rate() and MDC frequency
of 2.5MHz. Otherwise, this driver cannot communicate PHYs on the R-Car
S4 Starter Kit board.

Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
Reported-by: Tam Nguyen <tam.nguyen.xa@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
Changes from v2:
https://lore.kernel.org/all/20230926081156.3930074-1-yoshihiro.shimoda.uh@renesas.com/
 - Change subject.

Changes from v1:
https://lore.kernel.org/all/20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com/
 - Revise the formula on the commit description.
 - Calculate the PSMCS value by using clk_get_raate().
 -- So, change author and Add Reported-by.

 drivers/net/ethernet/renesas/rswitch.c | 13 ++++++++++++-
 drivers/net/ethernet/renesas/rswitch.h |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index ea9186178091..fc01ad3f340d 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2022 Renesas Electronics Corporation
  */
 
+#include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/etherdevice.h>
@@ -1049,7 +1050,7 @@ static void rswitch_rmac_setting(struct rswitch_etha *etha, const u8 *mac)
 static void rswitch_etha_enable_mii(struct rswitch_etha *etha)
 {
 	rswitch_modify(etha->addr, MPIC, MPIC_PSMCS_MASK | MPIC_PSMHT_MASK,
-		       MPIC_PSMCS(0x05) | MPIC_PSMHT(0x06));
+		       MPIC_PSMCS(etha->psmcs) | MPIC_PSMHT(0x06));
 	rswitch_modify(etha->addr, MPSM, 0, MPSM_MFF_C45);
 }
 
@@ -1693,6 +1694,12 @@ static void rswitch_etha_init(struct rswitch_private *priv, int index)
 	etha->index = index;
 	etha->addr = priv->addr + RSWITCH_ETHA_OFFSET + index * RSWITCH_ETHA_SIZE;
 	etha->coma_addr = priv->addr;
+
+	/* MPIC.PSMCS = (clk [MHz] / (MDC frequency [MHz] * 2) - 1.
+	 * Calculating PSMCS value as MDC frequency = 2.5MHz. So, multiply
+	 * both the numerator and the denominator by 10.
+	 */
+	etha->psmcs = clk_get_rate(priv->clk) / 100000 / (25 * 2) - 1;
 }
 
 static int rswitch_device_alloc(struct rswitch_private *priv, int index)
@@ -1900,6 +1907,10 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	spin_lock_init(&priv->lock);
 
+	priv->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
 	attr = soc_device_match(rswitch_soc_no_speed_change);
 	if (attr)
 		priv->etha_no_runtime_change = true;
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index f0c16a37ea55..04f49a7a5843 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -915,6 +915,7 @@ struct rswitch_etha {
 	bool external_phy;
 	struct mii_bus *mii;
 	phy_interface_t phy_interface;
+	u32 psmcs;
 	u8 mac_addr[MAX_ADDR_LEN];
 	int link;
 	int speed;
@@ -1012,6 +1013,7 @@ struct rswitch_private {
 	struct rswitch_mfwd mfwd;
 
 	spinlock_t lock;	/* lock interrupt registers' control */
+	struct clk *clk;
 
 	bool etha_no_runtime_change;
 	bool gwca_halt;
-- 
2.25.1

