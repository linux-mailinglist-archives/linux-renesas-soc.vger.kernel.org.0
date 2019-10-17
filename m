Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4300EDAD49
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2019 14:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502611AbfJQMs2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Oct 2019 08:48:28 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:59558 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2502556AbfJQMs0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Oct 2019 08:48:26 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id B8427EC39B2F6B85D09E;
        Thu, 17 Oct 2019 20:48:16 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Thu, 17 Oct 2019
 20:48:06 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <linus.walleij@linaro.org>, <manivannan.sadhasivam@linaro.org>,
        <afaerber@suse.de>, <f.fainelli@gmail.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <jesper.nilsson@axis.com>, <lars.persson@axis.com>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <baruch@tkos.co.il>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@axis.com>, <linux-oxnas@groups.io>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <vz@mleia.com>, <narmstrong@baylibre.com>,
        <geert+renesas@glider.be>, <daniel@zonque.org>,
        <haojian.zhuang@gmail.com>, <wens@csie.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <agross@kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 02/30] pinctrl: pxa27x: use devm_platform_ioremap_resource() to simplify code
Date:   Thu, 17 Oct 2019 20:26:12 +0800
Message-ID: <20191017122640.22976-3-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20191017122640.22976-1-yuehaibing@huawei.com>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/pxa/pinctrl-pxa27x.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pxa/pinctrl-pxa27x.c b/drivers/pinctrl/pxa/pinctrl-pxa27x.c
index 64943e8..48ccfb5 100644
--- a/drivers/pinctrl/pxa/pinctrl-pxa27x.c
+++ b/drivers/pinctrl/pxa/pinctrl-pxa27x.c
@@ -508,25 +508,20 @@ static int pxa27x_pinctrl_probe(struct platform_device *pdev)
 	void __iomem *base_af[8];
 	void __iomem *base_dir[4];
 	void __iomem *base_sleep[4];
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base_af[0] = devm_ioremap_resource(&pdev->dev, res);
+	base_af[0] = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base_af[0]))
 		return PTR_ERR(base_af[0]);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	base_dir[0] = devm_ioremap_resource(&pdev->dev, res);
+	base_dir[0] = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(base_dir[0]))
 		return PTR_ERR(base_dir[0]);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	base_dir[3] = devm_ioremap_resource(&pdev->dev, res);
+	base_dir[3] = devm_platform_ioremap_resource(pdev, 2);
 	if (IS_ERR(base_dir[3]))
 		return PTR_ERR(base_dir[3]);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 3);
-	base_sleep[0] = devm_ioremap_resource(&pdev->dev, res);
+	base_sleep[0] = devm_platform_ioremap_resource(pdev, 3);
 	if (IS_ERR(base_sleep[0]))
 		return PTR_ERR(base_sleep[0]);
 
-- 
2.7.4


