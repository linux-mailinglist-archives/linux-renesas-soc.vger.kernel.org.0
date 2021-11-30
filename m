Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C1E463BAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 17:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238472AbhK3Q2n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 11:28:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234056AbhK3Q2m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 11:28:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D149EC061746
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 08:25:22 -0800 (PST)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E7BC11C5;
        Tue, 30 Nov 2021 17:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638289521;
        bh=z/LBr2BtXn+wKIMNsARVAwt9NM7TA7F6YebNvTByVhc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EtU0OhMtG79g7buoYwGRwDzZv146QljlzlVTwBwFTgAK/eEVKcJaWQvEhCMvvO4y2
         I06YUONxUx+Gbe7HtPdyjruI2sp0TWttdChaE+WJELWVEtGlzZvnay/GAAaX2XZIjt
         1N4QxB3Zb4PkPvukiUN68tzJ9Ew4LvY9hQsFXzdY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 1/2] drm: rcar-du: mipi-dsi: Support bridge probe ordering
Date:   Tue, 30 Nov 2021 16:25:12 +0000
Message-Id: <20211130162513.2898302-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The bridge probe ordering for DSI devices has been clarified and further
documented in

To support connecting with the SN65DSI86 device after commit c3b75d4734cb
("drm/bridge: sn65dsi86: Register and attach our DSI device at probe"),
update to the new probe ordering to remove a perpetual -EPROBE_DEFER
loop between the two devices.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v2
- Remove now unused panel variable from rcar_mipi_dsi_probe()

 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 49 +++++++++++++------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 50e922328fed..0a9f197ef62c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -637,6 +637,8 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 					struct mipi_dsi_device *device)
 {
 	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
+	struct drm_panel *panel;
+	int ret;
 
 	if (device->lanes > dsi->num_data_lanes)
 		return -EINVAL;
@@ -644,12 +646,36 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 
+	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
+					  &dsi->next_bridge);
+	if (ret) {
+		dev_err_probe(dsi->dev, ret, "could not find next bridge\n");
+		return ret;
+	}
+
+	if (!dsi->next_bridge) {
+		dsi->next_bridge = devm_drm_panel_bridge_add(dsi->dev, panel);
+		if (IS_ERR(dsi->next_bridge)) {
+			dev_err(dsi->dev, "failed to create panel bridge\n");
+			return PTR_ERR(dsi->next_bridge);
+		}
+	}
+
+	/* Initialize the DRM bridge. */
+	dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
+	dsi->bridge.of_node = dsi->dev->of_node;
+	drm_bridge_add(&dsi->bridge);
+
 	return 0;
 }
 
 static int rcar_mipi_dsi_host_detach(struct mipi_dsi_host *host,
 					struct mipi_dsi_device *device)
 {
+	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
+
+	drm_bridge_remove(&dsi->bridge);
+
 	return 0;
 }
 
@@ -731,7 +757,6 @@ static int rcar_mipi_dsi_get_clocks(struct rcar_mipi_dsi *dsi)
 static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 {
 	struct rcar_mipi_dsi *dsi;
-	struct drm_panel *panel;
 	struct resource *mem;
 	int ret;
 
@@ -764,21 +789,6 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 		return PTR_ERR(dsi->rstc);
 	}
 
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
-
 	/* Initialize the DSI host. */
 	dsi->host.dev = dsi->dev;
 	dsi->host.ops = &rcar_mipi_dsi_host_ops;
@@ -786,11 +796,6 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/* Initialize the DRM bridge. */
-	dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
-	dsi->bridge.of_node = dsi->dev->of_node;
-	drm_bridge_add(&dsi->bridge);
-
 	return 0;
 }
 
@@ -798,8 +803,6 @@ static int rcar_mipi_dsi_remove(struct platform_device *pdev)
 {
 	struct rcar_mipi_dsi *dsi = platform_get_drvdata(pdev);
 
-	drm_bridge_remove(&dsi->bridge);
-
 	mipi_dsi_host_unregister(&dsi->host);
 
 	return 0;
-- 
2.30.2

