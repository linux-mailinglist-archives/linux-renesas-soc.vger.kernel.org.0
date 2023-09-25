Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA227ACD1E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 02:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjIYAef (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Sep 2023 20:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjIYAee (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Sep 2023 20:34:34 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3F61E8;
        Sun, 24 Sep 2023 17:34:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,174,1694703600"; 
   d="scan'208";a="180806746"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Sep 2023 09:34:27 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EFC4D4006DE3;
        Mon, 25 Sep 2023 09:34:26 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH net] net: ethernet: renesas: rswitch Fix PHY station management clock setting
Date:   Mon, 25 Sep 2023 09:34:16 +0900
Message-Id: <20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Tam Nguyen <tam.nguyen.xa@renesas.com>

Fix the MPIC.PSMCS value following the programming example in the
section 6.4.2 Management Data Clock (MDC) Setting, Ethernet MAC IP,
S4 Hardware User Manual Rev.1.00.

The value is calculated by
    MPIC.PSMCS = clk[MHz] / ((MDC frequency[MHz] + 1) * 2)
with the input clock frequency of 320MHz and MDC frequency of 2.5MHz.
Otherwise, this driver cannot communicate PHYs on the R-Car S4 Starter
Kit board.

Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
Signed-off-by: Tam Nguyen <tam.nguyen.xa@renesas.com>
Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
[shimoda: Revise subject/commit description and add Fixes tag]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index ea9186178091..8b5e2380f114 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1049,7 +1049,7 @@ static void rswitch_rmac_setting(struct rswitch_etha *etha, const u8 *mac)
 static void rswitch_etha_enable_mii(struct rswitch_etha *etha)
 {
 	rswitch_modify(etha->addr, MPIC, MPIC_PSMCS_MASK | MPIC_PSMHT_MASK,
-		       MPIC_PSMCS(0x05) | MPIC_PSMHT(0x06));
+		       MPIC_PSMCS(0x3f) | MPIC_PSMHT(0x06));
 	rswitch_modify(etha->addr, MPSM, 0, MPSM_MFF_C45);
 }
 
-- 
2.25.1

