Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E70C1656083
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Dec 2022 07:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbiLZGmZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 01:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiLZGmY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 01:42:24 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7C16BDCA
        for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Dec 2022 22:42:23 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,274,1665414000"; 
   d="scan'208";a="144512141"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Dec 2022 15:42:22 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 88E0041AADCA;
        Mon, 26 Dec 2022 15:42:22 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, kishon@kernel.org
Cc:     linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] phy: renesas: r8a779f0-eth-serdes: Fix register setting
Date:   Mon, 26 Dec 2022 15:42:16 +0900
Message-Id: <20221226064216.3895421-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix register setting which is typo in r8a779f0_eth_serdes_chan_setting().

Fixes: 742859441d44 ("phy: renesas: Add Renesas Ethernet SERDES driver for R-Car S4-8")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/r8a779f0-ether-serdes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index ec6594e6dc27..e7588a940d69 100644
--- a/drivers/phy/renesas/r8a779f0-ether-serdes.c
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -126,7 +126,7 @@ r8a779f0_eth_serdes_chan_setting(struct r8a779f0_eth_serdes_channel *channel)
 		r8a779f0_eth_serdes_write32(channel->addr, 0x0160, 0x180, 0x0007);
 		r8a779f0_eth_serdes_write32(channel->addr, 0x01ac, 0x180, 0x0000);
 		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x0310);
-		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x380, 0x0101);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x0101);
 		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x00c8, 0x0180, BIT(0), 0);
 		if (ret)
 			return ret;
-- 
2.25.1

