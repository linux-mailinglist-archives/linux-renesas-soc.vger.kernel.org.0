Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7102B7C4CED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Oct 2023 10:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbjJKIS3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Oct 2023 04:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjJKIS2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 04:18:28 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 634A393
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2023 01:18:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,214,1694703600"; 
   d="scan'208";a="182677694"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Oct 2023 17:18:24 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B8BE9400F79B;
        Wed, 11 Oct 2023 17:18:24 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, kishon@kernel.org
Cc:     linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] phy: renesas: r8a779f0-ether-serdes: Add .exit() ops
Date:   Wed, 11 Oct 2023 17:18:17 +0900
Message-Id: <20231011081817.257113-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231011081817.257113-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231011081817.257113-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add r8a779f0_eth_serdes_exit() to clear the initialized flag
for re-initializing this PHY if needed.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/r8a779f0-ether-serdes.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index ba1109d6bdd9..fc6e398fa3bf 100644
--- a/drivers/phy/renesas/r8a779f0-ether-serdes.c
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -261,6 +261,15 @@ static int r8a779f0_eth_serdes_init(struct phy *p)
 	return ret;
 }
 
+static int r8a779f0_eth_serdes_exit(struct phy *p)
+{
+	struct r8a779f0_eth_serdes_channel *channel = phy_get_drvdata(p);
+
+	channel->dd->initialized = false;
+
+	return 0;
+}
+
 static int r8a779f0_eth_serdes_hw_init_late(struct r8a779f0_eth_serdes_channel
 *channel)
 {
@@ -318,6 +327,7 @@ static int r8a779f0_eth_serdes_set_speed(struct phy *p, int speed)
 
 static const struct phy_ops r8a779f0_eth_serdes_ops = {
 	.init		= r8a779f0_eth_serdes_init,
+	.exit		= r8a779f0_eth_serdes_exit,
 	.power_on	= r8a779f0_eth_serdes_power_on,
 	.set_mode	= r8a779f0_eth_serdes_set_mode,
 	.set_speed	= r8a779f0_eth_serdes_set_speed,
-- 
2.25.1

