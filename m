Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEF5A1F5F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 15:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfEONua (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 09:50:30 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:59065 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726638AbfEONu3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 09:50:29 -0400
X-IronPort-AV: E=Sophos;i="5.60,472,1549897200"; 
   d="scan'208";a="15820271"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2019 22:50:27 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8CB23426FF82;
        Wed, 15 May 2019 22:50:24 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] phy: renesas: phy-rcar-gen2: Fix the array off by one warning
Date:   Wed, 15 May 2019 14:43:06 +0100
Message-Id: <1557927786-29557-1-git-send-email-biju.das@bp.renesas.com>
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
---
 * Ref [1]
  [1]:https://www.spinics.net/lists/linux-kernel-janitors/msg46715.html
---
 drivers/phy/renesas/phy-rcar-gen2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 8dc5710..ecb42ad 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -71,6 +71,7 @@ struct rcar_gen2_phy_driver {
 struct rcar_gen2_phy_data {
 	const struct phy_ops *gen2_phy_ops;
 	const u32 (*select_value)[PHYS_PER_CHANNEL];
+	const u32 last_channel;
 };
 
 static int rcar_gen2_phy_init(struct phy *p)
@@ -271,11 +272,13 @@ static const u32 usb20_select_value[][PHYS_PER_CHANNEL] = {
 static const struct rcar_gen2_phy_data rcar_gen2_usb_phy_data = {
 	.gen2_phy_ops = &rcar_gen2_phy_ops,
 	.select_value = pci_select_value,
+	.last_channel = 2,
 };
 
 static const struct rcar_gen2_phy_data rz_g1c_usb_phy_data = {
 	.gen2_phy_ops = &rz_g1c_phy_ops,
 	.select_value = usb20_select_value,
+	.last_channel = 0,
 };
 
 static const struct of_device_id rcar_gen2_phy_match_table[] = {
@@ -389,7 +392,7 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 		channel->selected_phy = -1;
 
 		error = of_property_read_u32(np, "reg", &channel_num);
-		if (error || channel_num > 2) {
+		if (error || channel_num > data->last_channel) {
 			dev_err(dev, "Invalid \"reg\" property\n");
 			return error;
 		}
-- 
2.7.4

