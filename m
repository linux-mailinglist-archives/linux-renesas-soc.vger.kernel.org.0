Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B94D565608D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Dec 2022 07:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbiLZGx2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 01:53:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbiLZGx0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 01:53:26 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D6F8521AC
        for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Dec 2022 22:53:24 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,274,1665414000"; 
   d="scan'208";a="144513422"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Dec 2022 15:53:24 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 35F3441B3551;
        Mon, 26 Dec 2022 15:53:24 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, kishon@kernel.org
Cc:     linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] phy: renesas: r8a779f0-eth-serdes: Add .power_on() into phy_ops
Date:   Mon, 26 Dec 2022 15:53:15 +0900
Message-Id: <20221226065316.3895480-2-yoshihiro.shimoda.uh@renesas.com>
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

Add r8a779f0_eth_serdes_power_on() to initialize the hardware for
each channel from the step 9 or later on the datasheet. In other words,
the procedure from the step 1 to 8 is for all channel and it is needed
once only. So, the .init() in any channel instance is called, this
driver initializes the hardware from step 1 to 8. And then, .power_on()
is called, this driver initializes the hardware from step 9 or later.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/r8a779f0-ether-serdes.c | 57 +++++++++++----------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index e7588a940d69..9f55a08e6da1 100644
--- a/drivers/phy/renesas/r8a779f0-ether-serdes.c
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -242,34 +242,7 @@ static int r8a779f0_eth_serdes_hw_init(struct r8a779f0_eth_serdes_channel *chann
 	if (ret)
 		return ret;
 
-	ret = r8a779f0_eth_serdes_reg_wait(&dd->channel[0], 0x0000, 0x380, BIT(15), 0);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
-		ret = r8a779f0_eth_serdes_chan_setting(&dd->channel[i]);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
-		ret = r8a779f0_eth_serdes_chan_speed(&dd->channel[i]);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++)
-		r8a779f0_eth_serdes_write32(dd->channel[i].addr, 0x03c0, 0x380, 0x0000);
-	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++)
-		r8a779f0_eth_serdes_write32(dd->channel[i].addr, 0x03d0, 0x380, 0x0000);
-
-	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
-		ret = r8a779f0_eth_serdes_monitor_linkup(&dd->channel[i]);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
+	return r8a779f0_eth_serdes_reg_wait(&dd->channel[0], 0x0000, 0x380, BIT(15), 0);
 }
 
 static int r8a779f0_eth_serdes_init(struct phy *p)
@@ -289,6 +262,33 @@ static int r8a779f0_eth_serdes_init(struct phy *p)
 	return ret;
 }
 
+static int r8a779f0_eth_serdes_hw_init_late(struct r8a779f0_eth_serdes_channel
+*channel)
+{
+	int ret;
+
+	ret = r8a779f0_eth_serdes_chan_setting(channel);
+	if (ret)
+		return ret;
+
+	ret = r8a779f0_eth_serdes_chan_speed(channel);
+	if (ret)
+		return ret;
+
+	r8a779f0_eth_serdes_write32(channel->addr, 0x03c0, 0x380, 0x0000);
+
+	r8a779f0_eth_serdes_write32(channel->addr, 0x03d0, 0x380, 0x0000);
+
+	return r8a779f0_eth_serdes_monitor_linkup(channel);
+}
+
+static int r8a779f0_eth_serdes_power_on(struct phy *p)
+{
+	struct r8a779f0_eth_serdes_channel *channel = phy_get_drvdata(p);
+
+	return r8a779f0_eth_serdes_hw_init_late(channel);
+}
+
 static int r8a779f0_eth_serdes_set_mode(struct phy *p, enum phy_mode mode,
 					int submode)
 {
@@ -319,6 +319,7 @@ static int r8a779f0_eth_serdes_set_speed(struct phy *p, int speed)
 
 static const struct phy_ops r8a779f0_eth_serdes_ops = {
 	.init		= r8a779f0_eth_serdes_init,
+	.power_on	= r8a779f0_eth_serdes_power_on,
 	.set_mode	= r8a779f0_eth_serdes_set_mode,
 	.set_speed	= r8a779f0_eth_serdes_set_speed,
 };
-- 
2.25.1

