Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 802BF2BE7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 07:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfE1FIx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 01:08:53 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8150 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725927AbfE1FIx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 01:08:53 -0400
X-IronPort-AV: E=Sophos;i="5.60,520,1549897200"; 
   d="scan'208";a="16943942"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 May 2019 14:08:51 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E0B2841DEF01;
        Tue, 28 May 2019 14:08:51 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     kishon@ti.com
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] phy: renesas: rcar-gen2: Fix memory leak at error paths
Date:   Tue, 28 May 2019 14:04:02 +0900
Message-Id: <1559019842-8874-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch fixes memory leak at error paths of the probe function.
In for_each_child_of_node, if the loop returns, the driver should
call of_put_node() before returns.

Reported-by: Julia Lawall <julia.lawall@lip6.fr>
Fixes: 1233f59f745 ("phy: Renesas R-Car Gen2 PHY driver")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Changes from v1 (https://patchwork.kernel.org/patch/10831295/):
 - Rebase on renesas-drivers.git / renesas-drivers-2019-05-21-v5.2-rc1 tag.
 - Add Geert-san's Reviewed-by tag.

 drivers/phy/renesas/phy-rcar-gen2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 8dc5710..2926e49 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -391,6 +391,7 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 		error = of_property_read_u32(np, "reg", &channel_num);
 		if (error || channel_num > 2) {
 			dev_err(dev, "Invalid \"reg\" property\n");
+			of_node_put(np);
 			return error;
 		}
 		channel->select_mask = select_mask[channel_num];
@@ -406,6 +407,7 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 						   data->gen2_phy_ops);
 			if (IS_ERR(phy->phy)) {
 				dev_err(dev, "Failed to create PHY\n");
+				of_node_put(np);
 				return PTR_ERR(phy->phy);
 			}
 			phy_set_drvdata(phy->phy, phy);
-- 
2.7.4

