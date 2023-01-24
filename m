Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE03678C6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 01:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbjAXACR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 19:02:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjAXACP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 19:02:15 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A72D5244A0;
        Mon, 23 Jan 2023 16:02:14 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,240,1669042800"; 
   d="scan'208";a="150346446"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jan 2023 09:02:14 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 000C240083E6;
        Tue, 24 Jan 2023 09:02:13 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net v3 1/2] net: ravb: Fix lack of register setting after system resumed for Gen3
Date:   Tue, 24 Jan 2023 09:02:10 +0900
Message-Id: <20230124000211.1426624-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230124000211.1426624-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230124000211.1426624-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After system entered Suspend to RAM, registers setting of this
hardware is reset because the SoC will be turned off. On R-Car Gen3
(info->ccc_gac), ravb_ptp_init() is called in ravb_probe() only. So,
after system resumed, it lacks of the initial settings for ptp. So,
add ravb_ptp_{init,stop}() into ravb_{resume,suspend}().

Fixes: f5d7837f96e5 ("ravb: ptp: Add CONFIG mode support")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/net/ethernet/renesas/ravb_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index b4e0fc7f65bd..3f61100c02f4 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2973,6 +2973,9 @@ static int __maybe_unused ravb_suspend(struct device *dev)
 	else
 		ret = ravb_close(ndev);
 
+	if (priv->info->ccc_gac)
+		ravb_ptp_stop(ndev);
+
 	return ret;
 }
 
@@ -3011,6 +3014,9 @@ static int __maybe_unused ravb_resume(struct device *dev)
 	/* Restore descriptor base address table */
 	ravb_write(ndev, priv->desc_bat_dma, DBAT);
 
+	if (priv->info->ccc_gac)
+		ravb_ptp_init(ndev, priv->pdev);
+
 	if (netif_running(ndev)) {
 		if (priv->wol_enabled) {
 			ret = ravb_wol_restore(ndev);
-- 
2.25.1

