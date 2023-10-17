Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC2B87CC1D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Oct 2023 13:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbjJQLeH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Oct 2023 07:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbjJQLeG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 07:34:06 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 37D48B0;
        Tue, 17 Oct 2023 04:34:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,231,1694703600"; 
   d="scan'208";a="183380335"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Oct 2023 20:34:04 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 278164003EA8;
        Tue, 17 Oct 2023 20:34:04 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v3 1/2] rswitch: Use unsigned int for port related array index
Date:   Tue, 17 Oct 2023 20:34:01 +0900
Message-Id: <20231017113402.849735-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231017113402.849735-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231017113402.849735-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Array index should not be negative, so modify the condition of
rswitch_for_each_enabled_port_continue_reverse() macro, and then
use unsigned int instead.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 10 ++++++----
 drivers/net/ethernet/renesas/rswitch.h |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 112e605f104a..e5a41e7880d8 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1405,7 +1405,8 @@ static void rswitch_ether_port_deinit_one(struct rswitch_device *rdev)
 
 static int rswitch_ether_port_init_all(struct rswitch_private *priv)
 {
-	int i, err;
+	unsigned int i;
+	int err;
 
 	rswitch_for_each_enabled_port(priv, i) {
 		err = rswitch_ether_port_init_one(priv->rdev[i]);
@@ -1786,7 +1787,8 @@ static void rswitch_device_free(struct rswitch_private *priv, int index)
 
 static int rswitch_init(struct rswitch_private *priv)
 {
-	int i, err;
+	unsigned int i;
+	int err;
 
 	for (i = 0; i < RSWITCH_NUM_PORTS; i++)
 		rswitch_etha_init(priv, i);
@@ -1816,7 +1818,7 @@ static int rswitch_init(struct rswitch_private *priv)
 	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
 		err = rswitch_device_alloc(priv, i);
 		if (err < 0) {
-			for (i--; i >= 0; i--)
+			for (; i-- > 0; )
 				rswitch_device_free(priv, i);
 			goto err_device_alloc;
 		}
@@ -1959,7 +1961,7 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 
 static void rswitch_deinit(struct rswitch_private *priv)
 {
-	int i;
+	unsigned int i;
 
 	rswitch_gwca_hw_deinit(priv);
 	rcar_gen4_ptp_unregister(priv->ptp_priv);
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 04f49a7a5843..27c9d3872c0e 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -20,7 +20,7 @@
 		else
 
 #define rswitch_for_each_enabled_port_continue_reverse(priv, i)	\
-	for (i--; i >= 0; i--)					\
+	for (; i-- > 0; )					\
 		if (priv->rdev[i]->disabled)			\
 			continue;				\
 		else
-- 
2.25.1

