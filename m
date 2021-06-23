Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4753B1266
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhFWDt4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhFWDt4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:49:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DFFC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 20:47:39 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CFBB1222;
        Wed, 23 Jun 2021 05:47:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420056;
        bh=z2J7l+T67VaPZduWMy6RTUspJQ35YhIh7hVFZeIiBXk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=urD8tB4D/5eUNQ8m9nV97WLTQHBQiDQmGfSiaPThicuRLukTiXWxyMbvhTgd6H6ZO
         myu7VzwnQPnmI6zLKx6egZykYSxlTlvRPMeC4BOiEdfZwZtUY6b+SlNAhKffzcHYJT
         oTdxJEdgxKb9m8IZPtlYRUpOqZs1KQBZQOmUdMt0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 04/15] drm: rcar-du: dsi: Reorganize probe function
Date:   Wed, 23 Jun 2021 06:46:45 +0300
Message-Id: <20210623034656.10316-5-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 0c9887557761..92cd431631bf 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -832,10 +832,7 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/* Initialize the DRM bridge. */
-	mipi_dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
-	mipi_dsi->bridge.of_node = pdev->dev.of_node;
-
+	/* Acquire resources. */
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mipi_dsi->mmio = devm_ioremap_resource(&pdev->dev, mem);
 	if (IS_ERR(mipi_dsi->mmio))
@@ -851,13 +848,16 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 		return PTR_ERR(mipi_dsi->rstc);
 	}
 
-	/* Initialize the DST host. */
+	/* Initialize the DSI host. */
 	mipi_dsi->host.dev = dev;
 	mipi_dsi->host.ops = &rcar_mipi_dsi_host_ops;
 	ret = mipi_dsi_host_register(&mipi_dsi->host);
 	if (ret < 0)
 		return ret;
 
+	/* Initialize the DRM bridge. */
+	mipi_dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
+	mipi_dsi->bridge.of_node = pdev->dev.of_node;
 	drm_bridge_add(&mipi_dsi->bridge);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

