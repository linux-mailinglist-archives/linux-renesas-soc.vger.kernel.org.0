Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE4177177C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Aug 2023 02:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjHGAco (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 6 Aug 2023 20:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbjHGAcn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 Aug 2023 20:32:43 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 801781712;
        Sun,  6 Aug 2023 17:32:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,261,1684767600"; 
   d="scan'208";a="172107184"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Aug 2023 09:32:39 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8F93C40E3C98;
        Mon,  7 Aug 2023 09:32:39 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@kernel.org>
Subject: [PATCH v2 net-next 2/2] net: renesas: rswitch: Add .[gs]et_link_ksettings support
Date:   Mon,  7 Aug 2023 09:32:31 +0900
Message-Id: <20230807003231.1552062-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230807003231.1552062-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230807003231.1552062-1-yoshihiro.shimoda.uh@renesas.com>
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

Add .[gs]et_link_ksettings support by using
phy_ethtool_[gs]et_link_ksettings() functions.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/renesas/rswitch.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index fd3668b95834..6083b1c8e4fb 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1664,6 +1664,8 @@ static int rswitch_get_ts_info(struct net_device *ndev, struct ethtool_ts_info *
 
 static const struct ethtool_ops rswitch_ethtool_ops = {
 	.get_ts_info = rswitch_get_ts_info,
+	.get_link_ksettings = phy_ethtool_get_link_ksettings,
+	.set_link_ksettings = phy_ethtool_set_link_ksettings,
 };
 
 static const struct of_device_id renesas_eth_sw_of_table[] = {
-- 
2.25.1

