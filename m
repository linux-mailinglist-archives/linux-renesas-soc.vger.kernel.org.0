Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEDFE3B1268
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhFWDt6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbhFWDt5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:49:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83DAC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 20:47:40 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5632E29ED;
        Wed, 23 Jun 2021 05:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420057;
        bh=PrjrL555RIrrXSkN+fKj0Ugrae4jfbCqBqJiOl/WBQ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cPlaiwohZno8nC4FvG6U5PQbgsAwcFZdl4Gakf5TT2Au2WCyLX+vjwZiQHsyvXqe3
         0oahS6tb/l6QtGRSpuEWP/sRFyz/sqW9Vk/QpgLSVoPMK2NXAiS6rYEU+O5n2tZKqy
         KdpNao6m5UXs81xfZuh+TdHleXkJLWJm4bWo85Ss=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 07/15] drm: rcar-du: dsi: Use dsi->dev consistently in probe()
Date:   Wed, 23 Jun 2021 06:46:48 +0300
Message-Id: <20210623034656.10316-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index fbc8ba154e28..454c25591a14 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -804,7 +804,6 @@ static int rcar_mipi_dsi_get_clocks(struct rcar_mipi_dsi *dsi)
 
 static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
 	struct rcar_mipi_dsi *dsi;
 	struct resource *mem;
 	int ret;
@@ -815,7 +814,7 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dsi);
 
-	dsi->dev = dev;
+	dsi->dev = &pdev->dev;
 	dsi->info = of_device_get_match_data(&pdev->dev);
 
 	ret = rcar_mipi_dsi_parse_dt(dsi);
@@ -824,7 +823,7 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 
 	/* Acquire resources. */
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->mmio = devm_ioremap_resource(&pdev->dev, mem);
+	dsi->mmio = devm_ioremap_resource(dsi->dev, mem);
 	if (IS_ERR(dsi->mmio))
 		return PTR_ERR(dsi->mmio);
 
@@ -832,14 +831,14 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	dsi->rstc = devm_reset_control_get(&pdev->dev, NULL);
+	dsi->rstc = devm_reset_control_get(dsi->dev, NULL);
 	if (IS_ERR(dsi->rstc)) {
-		dev_err(&pdev->dev, "failed to get cpg reset\n");
+		dev_err(dsi->dev, "failed to get cpg reset\n");
 		return PTR_ERR(dsi->rstc);
 	}
 
 	/* Initialize the DSI host. */
-	dsi->host.dev = dev;
+	dsi->host.dev = dsi->dev;
 	dsi->host.ops = &rcar_mipi_dsi_host_ops;
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
@@ -847,7 +846,7 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 
 	/* Initialize the DRM bridge. */
 	dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
-	dsi->bridge.of_node = pdev->dev.of_node;
+	dsi->bridge.of_node = dsi->dev->of_node;
 	drm_bridge_add(&dsi->bridge);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

