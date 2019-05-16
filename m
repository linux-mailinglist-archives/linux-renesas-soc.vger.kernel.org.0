Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0FC02082D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 15:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfEPN32 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 09:29:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:18539 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726528AbfEPN31 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 09:29:27 -0400
X-IronPort-AV: E=Sophos;i="5.60,476,1549897200"; 
   d="scan'208";a="16141177"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 May 2019 22:29:25 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E1C6B4014F48;
        Thu, 16 May 2019 22:29:22 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] phy: renesas: phy-rcar-gen2: Fix the array off by one warning
Date:   Thu, 16 May 2019 14:22:03 +0100
Message-Id: <1558012923-29081-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix the below smatch warning by adding variable check rather than the
hardcoded value.
warn: array off by one? 'data->select_value[channel_num]'

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2 
  * Incorporated Geert's review comments.
    (https://patchwork.kernel.org/patch/10944837/)
---
 drivers/phy/renesas/phy-rcar-gen2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 8dc5710..8dbdc5b 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -71,6 +71,7 @@ struct rcar_gen2_phy_driver {
 struct rcar_gen2_phy_data {
 	const struct phy_ops *gen2_phy_ops;
 	const u32 (*select_value)[PHYS_PER_CHANNEL];
+	const u32 num_channels;
 };
 
 static int rcar_gen2_phy_init(struct phy *p)
@@ -271,11 +272,13 @@ static const u32 usb20_select_value[][PHYS_PER_CHANNEL] = {
 static const struct rcar_gen2_phy_data rcar_gen2_usb_phy_data = {
 	.gen2_phy_ops = &rcar_gen2_phy_ops,
 	.select_value = pci_select_value,
+	.num_channels = ARRAY_SIZE(pci_select_value),
 };
 
 static const struct rcar_gen2_phy_data rz_g1c_usb_phy_data = {
 	.gen2_phy_ops = &rz_g1c_phy_ops,
 	.select_value = usb20_select_value,
+	.num_channels = ARRAY_SIZE(usb20_select_value),
 };
 
 static const struct of_device_id rcar_gen2_phy_match_table[] = {
@@ -389,7 +392,7 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 		channel->selected_phy = -1;
 
 		error = of_property_read_u32(np, "reg", &channel_num);
-		if (error || channel_num > 2) {
+		if (error || channel_num >= data->num_channels) {
 			dev_err(dev, "Invalid \"reg\" property\n");
 			return error;
 		}
-- 
2.7.4

