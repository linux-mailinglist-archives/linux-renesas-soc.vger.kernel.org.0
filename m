Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B059463BB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 17:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239198AbhK3Q2o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 11:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234056AbhK3Q2o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 11:28:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F769C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 08:25:24 -0800 (PST)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8715E1447;
        Tue, 30 Nov 2021 17:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638289521;
        bh=tPTO6x4/UmqDVDNMFfhIt7vn9FEScoUNFaizGSmWb3Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Erinv4cC7+StbzjmVPXo/DMz5PnMqVrzoPrrufyUAUIgrzoA8++rt0IjABmnDrfLy
         cExEBcOZaZQS19qta0Ul92ePEbrOa/e8qn5v9/j78LyP1oYCYD+2TkasI5YX+RC1Rx
         Sdwc+lMb95uI47b+CeEQWt5HJ3EgyrSTQFc1spE0=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 2/2] drm: rcar-du: mipi-dsi: Use devm_drm_of_get_bridge helper
Date:   Tue, 30 Nov 2021 16:25:13 +0000
Message-Id: <20211130162513.2898302-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Instead of open coding the calls for
  drm_of_find_panel_or_bridge()
  devm_drm_panel_bridge_add()

use the devm_drm_of_get_bridge() helper directly.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
v2:
 - New patch

 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 0a9f197ef62c..1dfe20d3d0f2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -637,7 +637,7 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 					struct mipi_dsi_device *device)
 {
 	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
-	struct drm_panel *panel;
+	struct device *dev = dsi->dev;
 	int ret;
 
 	if (device->lanes > dsi->num_data_lanes)
@@ -646,20 +646,9 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 
-	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
-					  &dsi->next_bridge);
-	if (ret) {
-		dev_err_probe(dsi->dev, ret, "could not find next bridge\n");
-		return ret;
-	}
-
-	if (!dsi->next_bridge) {
-		dsi->next_bridge = devm_drm_panel_bridge_add(dsi->dev, panel);
-		if (IS_ERR(dsi->next_bridge)) {
-			dev_err(dsi->dev, "failed to create panel bridge\n");
-			return PTR_ERR(dsi->next_bridge);
-		}
-	}
+	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(dsi->next_bridge))
+		return PTR_ERR(dsi->next_bridge);
 
 	/* Initialize the DRM bridge. */
 	dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
-- 
2.30.2

