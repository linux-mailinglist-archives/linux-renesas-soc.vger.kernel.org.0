Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D0F2C36CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 03:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgKYC2f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 21:28:35 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8030 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgKYC2e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 21:28:34 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CglDW3q8lzhgmD;
        Wed, 25 Nov 2020 10:28:11 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Nov 2020
 10:28:22 +0800
From:   Wang Li <wangli74@huawei.com>
To:     <yoshihiro.shimoda.uh@renesas.com>, <kishon@ti.com>,
        <vkoul@kernel.org>, <biju.das@bp.renesas.com>
CC:     <linux-renesas-soc@vger.kernel.org>, <wangli74@huawei.com>
Subject: [PATCH] phy: renesas: rcar-gen3-usb2: disable pm_runtime in case of failure
Date:   Wed, 25 Nov 2020 10:31:47 +0800
Message-ID: <20201125023147.2819115-1-wangli74@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

pm_runtime_enable will increase power disable depth. Thus a pairing
decrement is needed on the error handling path to keep it balanced.

Fixes: 5d8042e95fd4 ("phy: rcar-gen3-usb2: Add support for r8a77470")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Li <wangli74@huawei.com>
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

