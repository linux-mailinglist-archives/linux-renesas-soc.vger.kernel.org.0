Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA7B65608E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Dec 2022 07:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiLZGx3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 01:53:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbiLZGx0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 01:53:26 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B86A025CA
        for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Dec 2022 22:53:25 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,274,1665414000"; 
   d="scan'208";a="147422895"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Dec 2022 15:53:24 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 464A541B3551;
        Mon, 26 Dec 2022 15:53:24 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, kishon@kernel.org
Cc:     linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] phy: renesas: r8a779f0-eth-serdes: Remove retry code in .init()
Date:   Mon, 26 Dec 2022 15:53:16 +0900
Message-Id: <20221226065316.3895480-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221226065316.3895480-1-yoshihiro.shimoda.uh@renesas.com>
References: <20221226065316.3895480-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Remove retry code in r8a779f0_eth_serdes_init() because
r8a779f0_eth_serdes_chan_setting() was fixed so that no timeout
happened in the initializing procedure.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/r8a779f0-ether-serdes.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index 9f55a08e6da1..c5206ef9195b 100644
--- a/drivers/phy/renesas/r8a779f0-ether-serdes.c
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -18,7 +18,6 @@
 #define R8A779F0_ETH_SERDES_BANK_SELECT		0x03fc
 #define R8A779F0_ETH_SERDES_TIMEOUT_US		100000
 #define R8A779F0_ETH_SERDES_NUM_RETRY_LINKUP	3
-#define R8A779F0_ETH_SERDES_NUM_RETRY_INIT	3
 
 struct r8a779f0_eth_serdes_drv_data;
 struct r8a779f0_eth_serdes_channel {
@@ -248,16 +247,11 @@ static int r8a779f0_eth_serdes_hw_init(struct r8a779f0_eth_serdes_channel *chann
 static int r8a779f0_eth_serdes_init(struct phy *p)
 {
 	struct r8a779f0_eth_serdes_channel *channel = phy_get_drvdata(p);
-	int i, ret;
+	int ret;
 
-	for (i = 0; i < R8A779F0_ETH_SERDES_NUM_RETRY_INIT; i++) {
-		ret = r8a779f0_eth_serdes_hw_init(channel);
-		if (!ret) {
-			channel->dd->initialized = true;
-			break;
-		}
-		usleep_range(1000, 2000);
-	}
+	ret = r8a779f0_eth_serdes_hw_init(channel);
+	if (!ret)
+		channel->dd->initialized = true;
 
 	return ret;
 }
-- 
2.25.1

