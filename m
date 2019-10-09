Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFE4DD13C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 18:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731375AbfJIQN1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 12:13:27 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:49141 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731426AbfJIQN1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 12:13:27 -0400
X-IronPort-AV: E=Sophos;i="5.67,276,1566831600"; 
   d="scan'208";a="28696663"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Oct 2019 01:13:24 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 97C8A4015EDD;
        Thu, 10 Oct 2019 01:13:22 +0900 (JST)
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
Subject: [PATCH v2 RESEND] phy: renesas: phy-rcar-gen2: Fix the array off by one warning
Date:   Wed,  9 Oct 2019 17:12:49 +0100
Message-Id: <1570637569-41057-1-git-send-email-biju.das@bp.renesas.com>
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
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
V1-->V2 
  * Incorporated Geert's review comments.
    (https://patchwork.kernel.org/patch/10944837/)
V2-->V2 Resend
  * Rebased to phy next.
---
 drivers/phy/renesas/phy-rcar-gen2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 2926e49..2e279ac 100644
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
 			of_node_put(np);
 			return error;
-- 
2.7.4

