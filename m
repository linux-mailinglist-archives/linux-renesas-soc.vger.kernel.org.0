Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71563DAD0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2019 14:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502783AbfJQMtG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Oct 2019 08:49:06 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4243 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2502502AbfJQMtG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Oct 2019 08:49:06 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id ED721B2A794F31B0C039;
        Thu, 17 Oct 2019 20:48:41 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Thu, 17 Oct 2019
 20:48:34 +0800
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
Subject: [PATCH -next 13/30] pinctrl: zte: use devm_platform_ioremap_resource() to simplify code
Date:   Thu, 17 Oct 2019 20:26:23 +0800
Message-ID: <20191017122640.22976-14-yuehaibing@huawei.com>
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
 drivers/pinctrl/zte/pinctrl-zx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/zte/pinctrl-zx.c b/drivers/pinctrl/zte/pinctrl-zx.c
index 9512045..786bf89 100644
--- a/drivers/pinctrl/zte/pinctrl-zx.c
+++ b/drivers/pinctrl/zte/pinctrl-zx.c
@@ -387,7 +387,6 @@ int zx_pinctrl_init(struct platform_device *pdev,
 	struct pinctrl_desc *pctldesc;
 	struct zx_pinctrl *zpctl;
 	struct device_node *np;
-	struct resource *res;
 	int ret;
 
 	zpctl = devm_kzalloc(&pdev->dev, sizeof(*zpctl), GFP_KERNEL);
@@ -396,8 +395,7 @@ int zx_pinctrl_init(struct platform_device *pdev,
 
 	spin_lock_init(&zpctl->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	zpctl->base = devm_ioremap_resource(&pdev->dev, res);
+	zpctl->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(zpctl->base))
 		return PTR_ERR(zpctl->base);
 
-- 
2.7.4


