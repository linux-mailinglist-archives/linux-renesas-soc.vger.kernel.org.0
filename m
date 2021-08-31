Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 642C83FC91E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Aug 2021 15:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbhHaN6o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Aug 2021 09:58:44 -0400
Received: from mx21.baidu.com ([220.181.3.85]:32770 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234396AbhHaN6e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Aug 2021 09:58:34 -0400
Received: from BC-Mail-Ex09.internal.baidu.com (unknown [172.31.51.49])
        by Forcepoint Email with ESMTPS id 6A5976CFA6B85D68BC6B;
        Tue, 31 Aug 2021 21:57:37 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex09.internal.baidu.com (172.31.51.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 31 Aug 2021 21:57:37 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 21:57:36 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/shmobile: Make use of the helper function devm_platform_ioremap_resource()
Date:   Tue, 31 Aug 2021 21:57:30 +0800
Message-ID: <20210831135731.4776-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex30.internal.baidu.com (172.31.51.24) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 7db01904d18d..80078a9fd7f6 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -192,7 +192,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
 	struct shmob_drm_device *sdev;
 	struct drm_device *ddev;
-	struct resource *res;
 	unsigned int i;
 	int ret;
 
@@ -215,8 +214,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sdev);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	sdev->mmio = devm_ioremap_resource(&pdev->dev, res);
+	sdev->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sdev->mmio))
 		return PTR_ERR(sdev->mmio);
 
-- 
2.25.1

