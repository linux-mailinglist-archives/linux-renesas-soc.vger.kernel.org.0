Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8439E2C4D7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 03:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732007AbgKZClA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 21:41:00 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8040 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbgKZClA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 21:41:00 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ChMSP53YhzhXqh;
        Thu, 26 Nov 2020 10:40:37 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Nov 2020
 10:40:47 +0800
From:   Wang Li <wangli74@huawei.com>
To:     <yoshihiro.shimoda.uh@renesas.com>, <kishon@ti.com>,
        <vkoul@kernel.org>, <biju.das@bp.renesas.com>
CC:     <linux-renesas-soc@vger.kernel.org>, <wangli74@huawei.com>
Subject: [PATCH v2] phy: renesas: rcar-gen3-usb2: disable runtime pm in case of failure
Date:   Thu, 26 Nov 2020 10:44:12 +0800
Message-ID: <20201126024412.4046845-1-wangli74@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

pm_runtime_enable() will decrease power disable depth. Thus a pairing
increment is needed on the error handling path to keep it balanced.

Fixes: 5d8042e95fd4 ("phy: rcar-gen3-usb2: Add support for r8a77470")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Li <wangli74@huawei.com>
---
Changelog:
v2
- Correct the commit message.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index e34e4475027c..2cb949f931b6 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -656,8 +656,10 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_enable(dev);
 	phy_usb2_ops = of_device_get_match_data(dev);
-	if (!phy_usb2_ops)
-		return -EINVAL;
+	if (!phy_usb2_ops) {
+		ret = -EINVAL;
+		goto error;
+	}
 
 	mutex_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
-- 
2.25.4

