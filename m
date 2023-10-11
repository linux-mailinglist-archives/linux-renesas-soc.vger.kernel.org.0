Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35EBE7C4CEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Oct 2023 10:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjJKIS1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Oct 2023 04:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbjJKIS1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 04:18:27 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B6C59D
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2023 01:18:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,214,1694703600"; 
   d="scan'208";a="178887281"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Oct 2023 17:18:24 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9EFFB400C9ED;
        Wed, 11 Oct 2023 17:18:24 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, kishon@kernel.org
Cc:     linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] phy: renesas: r8a779f0-ether-serdes: Reset in .init()
Date:   Wed, 11 Oct 2023 17:18:16 +0900
Message-Id: <20231011081817.257113-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231011081817.257113-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231011081817.257113-1-yoshihiro.shimoda.uh@renesas.com>
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

Reset this PHY in .init() instead of probe() for re-initializing
this PHY after probed correctly.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/r8a779f0-ether-serdes.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index 683b19bc411a..ba1109d6bdd9 100644
--- a/drivers/phy/renesas/r8a779f0-ether-serdes.c
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -214,6 +214,10 @@ static int r8a779f0_eth_serdes_hw_init(struct r8a779f0_eth_serdes_channel *chann
 	if (dd->initialized)
 		return 0;
 
+	reset_control_reset(dd->reset);
+
+	usleep_range(1000, 2000);
+
 	ret = r8a779f0_eth_serdes_common_init_ram(dd);
 	if (ret)
 		return ret;
@@ -356,8 +360,6 @@ static int r8a779f0_eth_serdes_probe(struct platform_device *pdev)
 	if (IS_ERR(dd->reset))
 		return PTR_ERR(dd->reset);
 
-	reset_control_reset(dd->reset);
-
 	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
 		struct r8a779f0_eth_serdes_channel *channel = &dd->channel[i];
 
-- 
2.25.1

