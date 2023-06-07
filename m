Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6171B725491
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jun 2023 08:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237311AbjFGGoJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Jun 2023 02:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjFGGoJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Jun 2023 02:44:09 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A8C4710C3;
        Tue,  6 Jun 2023 23:44:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,223,1681138800"; 
   d="scan'208";a="162521557"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Jun 2023 15:44:07 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id F04F74005E29;
        Wed,  7 Jun 2023 15:44:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: [PATCH net] net: renesas: rswitch: Fix timestamp feature after all descritors are used
Date:   Wed,  7 Jun 2023 15:44:02 +0900
Message-Id: <20230607064402.1795548-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The timestamp descriptors were intended to act cyclically. Descriptors
from index 0 through gq->ring_size - 1 contain actual information, and
the last index (gq->ring_size) should have LINKFIX to indicate
the first index 0 descriptor. However, thie LINKFIX value is missing,
causing the timestamp feature to stop after all descriptors are used.
To resolve this issue, set the LINKFIX to the timestamp descritors.

Reported-by: Phong Hoang <phong.hoang.wz@renesas.com>
Fixes: 33f5d733b589 ("net: renesas: rswitch: Improve TX timestamp accuracy")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Since I got this report locally, I didn't add Closes: tag.

 drivers/net/ethernet/renesas/rswitch.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index aace87139cea..049adbf5a642 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -420,7 +420,7 @@ static int rswitch_gwca_queue_format(struct net_device *ndev,
 }
 
 static void rswitch_gwca_ts_queue_fill(struct rswitch_private *priv,
-				       int start_index, int num)
+				       int start_index, int num, bool last)
 {
 	struct rswitch_gwca_queue *gq = &priv->gwca.ts_queue;
 	struct rswitch_ts_desc *desc;
@@ -431,6 +431,12 @@ static void rswitch_gwca_ts_queue_fill(struct rswitch_private *priv,
 		desc = &gq->ts_ring[index];
 		desc->desc.die_dt = DT_FEMPTY_ND | DIE;
 	}
+
+	if (last) {
+		desc = &gq->ts_ring[gq->ring_size];
+		rswitch_desc_set_dptr(&desc->desc, gq->ring_dma);
+		desc->desc.die_dt = DT_LINKFIX;
+	}
 }
 
 static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
@@ -941,7 +947,7 @@ static void rswitch_ts(struct rswitch_private *priv)
 	}
 
 	num = rswitch_get_num_cur_queues(gq);
-	rswitch_gwca_ts_queue_fill(priv, gq->dirty, num);
+	rswitch_gwca_ts_queue_fill(priv, gq->dirty, num, false);
 	gq->dirty = rswitch_next_queue_index(gq, false, num);
 }
 
@@ -1780,7 +1786,7 @@ static int rswitch_init(struct rswitch_private *priv)
 	if (err < 0)
 		goto err_ts_queue_alloc;
 
-	rswitch_gwca_ts_queue_fill(priv, 0, TS_RING_SIZE);
+	rswitch_gwca_ts_queue_fill(priv, 0, TS_RING_SIZE, true);
 	INIT_LIST_HEAD(&priv->gwca.ts_info_list);
 
 	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
-- 
2.25.1

