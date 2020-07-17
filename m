Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A207223ABF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 13:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgGQLpE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 07:45:04 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:38979 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726446AbgGQLpD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 07:45:03 -0400
X-IronPort-AV: E=Sophos;i="5.75,362,1589209200"; 
   d="scan'208";a="52406122"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jul 2020 20:45:01 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 466964267DBC;
        Fri, 17 Jul 2020 20:45:01 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     kishon@ti.com, vkoul@kernel.org
Cc:     wsa+renesas@sang-engineering.com, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/2] phy: renesas: rcar-gen3-usb2: exit if request_irq() failed
Date:   Fri, 17 Jul 2020 20:44:57 +0900
Message-Id: <1594986297-12434-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594986297-12434-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1594986297-12434-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To avoid unexpected behaviors, it's better to exit if request_irq()
failed.

Suggested-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 5087b7c..e34e447 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -419,8 +419,10 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
 		ret = request_irq(channel->irq, rcar_gen3_phy_usb2_irq,
 				  IRQF_SHARED, dev_name(channel->dev), channel);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(channel->dev, "No irq handler (%d)\n", channel->irq);
+			return ret;
+		}
 	}
 
 	/* Initialize USB2 part */
-- 
2.7.4

