Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8017B7B6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Oct 2023 11:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbjJDJNL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Oct 2023 05:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241893AbjJDJNK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2023 05:13:10 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D610CA7;
        Wed,  4 Oct 2023 02:13:06 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,199,1694703600"; 
   d="scan'208";a="178147041"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Oct 2023 18:13:06 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id ECDEB41BB248;
        Wed,  4 Oct 2023 18:13:05 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Zheng Wang <zyytlz.wz@163.com>
Subject: [PATCH net 2/2] ravb: Fix use-after-free issue in ravb_remove and ravb_tx_timeout_work
Date:   Wed,  4 Oct 2023 18:12:53 +0900
Message-Id: <20231004091253.4194205-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231004091253.4194205-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231004091253.4194205-1-yoshihiro.shimoda.uh@renesas.com>
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

The ravb_stop() should call cancel_work_sync(). Otherwise,
ravb_tx_timeout_work() is possible to use the freed priv after
ravb_remove() was called like below:

CPU0			CPU1
			ravb_tx_timeout()
ravb_remove()
unregister_netdev()
free_netdev(ndev)
// free priv
			ravb_tx_timeout_work()
			// use priv

unregister_netdev() will call .ndo_stop() so that ravb_stop() is
called. And, after phy_stop() was called, netif_carrier_off()
is also called. So that .ndo_tx_timeout() will be not called
after phy_stop().

Link: https://lore.kernel.org/netdev/872cf8d7-3bd6-b11a-82ac-a9f4c82d0a02@omp.ru/
Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Reported-by: Zheng Wang <zyytlz.wz@163.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 9e2e801049cc..0ef0b88b7145 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2167,6 +2167,8 @@ static int ravb_close(struct net_device *ndev)
 			of_phy_deregister_fixed_link(np);
 	}
 
+	cancel_work_sync(&priv->work);
+
 	if (info->multi_irqs) {
 		free_irq(priv->tx_irqs[RAVB_NC], ndev);
 		free_irq(priv->rx_irqs[RAVB_NC], ndev);
-- 
2.25.1

