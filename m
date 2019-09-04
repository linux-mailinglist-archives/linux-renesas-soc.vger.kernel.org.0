Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13814A7DC4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 10:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729394AbfIDIYm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 04:24:42 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:52203 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725966AbfIDIYm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 04:24:42 -0400
X-IronPort-AV: E=Sophos;i="5.64,465,1559487600"; 
   d="scan'208";a="25494499"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 Sep 2019 17:24:39 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 390E44008C72;
        Wed,  4 Sep 2019 17:24:39 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/3] dmaengine: rcar-dmac: Use devm_platform_ioremap_resource()
Date:   Wed,  4 Sep 2019 17:24:37 +0900
Message-Id: <1567585478-23902-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567585478-23902-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1567585478-23902-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch uses devm_platform_ioremap_resource() instead of
using platform_get_resource() and devm_ioremap_resource() together
to simplify.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/dma/sh/rcar-dmac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 74996a0..542786d 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1824,7 +1824,6 @@ static int rcar_dmac_probe(struct platform_device *pdev)
 	struct dma_device *engine;
 	struct rcar_dmac *dmac;
 	const struct rcar_dmac_of_data *data;
-	struct resource *mem;
 	unsigned int i;
 	int ret;
 
@@ -1863,8 +1862,7 @@ static int rcar_dmac_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* Request resources. */
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dmac->iomem = devm_ioremap_resource(&pdev->dev, mem);
+	dmac->iomem = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dmac->iomem))
 		return PTR_ERR(dmac->iomem);
 
-- 
2.7.4

