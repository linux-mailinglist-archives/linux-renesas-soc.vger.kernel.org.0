Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C967262430B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Nov 2022 14:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiKJNQk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 08:16:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbiKJNQk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 08:16:40 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5F5524B9BC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 05:16:39 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,153,1665414000"; 
   d="scan'208";a="139607093"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Nov 2022 22:16:37 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 16D824310C0A;
        Thu, 10 Nov 2022 22:16:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 3/3] arm64: configs: Enable Renesas R-Car S4-8 Spider Ethernet devices
Date:   Thu, 10 Nov 2022 22:16:30 +0900
Message-Id: <20221110131630.3814538-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110131630.3814538-1-yoshihiro.shimoda.uh@renesas.com>
References: <20221110131630.3814538-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable Renesas "Ethernet Switch", Ethernet SERDES and Marvell 10G PHY
drivers to be used by NFS root on the Renesas Spider board.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/configs/defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0b6af3348e79..311e0b134b27 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -357,6 +357,7 @@ CONFIG_RMNET=m
 CONFIG_R8169=m
 CONFIG_SH_ETH=y
 CONFIG_RAVB=y
+CONFIG_RENESAS_ETHER_SWITCH=y
 CONFIG_SMC91X=y
 CONFIG_SMSC911X=y
 CONFIG_SNI_AVE=y
@@ -369,7 +370,7 @@ CONFIG_MESON_GXL_PHY=m
 CONFIG_AQUANTIA_PHY=y
 CONFIG_BCM54140_PHY=m
 CONFIG_MARVELL_PHY=m
-CONFIG_MARVELL_10G_PHY=m
+CONFIG_MARVELL_10G_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_AT803X_PHY=y
@@ -1239,6 +1240,7 @@ CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m
 CONFIG_PHY_QCOM_USB_SS=m
+CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=m
-- 
2.25.1

