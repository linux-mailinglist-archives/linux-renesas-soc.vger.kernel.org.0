Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59DC945EB31
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 11:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376635AbhKZKWj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 05:22:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49812 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376685AbhKZKUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 05:20:39 -0500
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B82CC148B;
        Fri, 26 Nov 2021 11:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637921723;
        bh=qI1H7VYrHIFCPRdhdtphotkQv5wrmJn/4zKU6uqux7g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=acG8Dl7SOTF8ovCfnjpR6GAduMiAiuVuyn60hNQI92KGsFvQ+nwBHpydm8ndVOSnO
         mSKqwNNZbxY3cCoJ7kKDDuki/Q6lqPS77F1y12/FwMsHCTepT2VxDXIQ5fF1QxxSR0
         JMcO1z0O+KczeKN39DcPZUKNyzboHfaL0eWKQRQY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 4/4] drm: rcar-du: mipi-dsi: Support bridge probe ordering
Date:   Fri, 26 Nov 2021 10:15:18 +0000
Message-Id: <20211126101518.938783-5-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
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
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 48 +++++++++++++------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 833f4480bdf3..f783bacee8da 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -639,6 +639,8 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 					struct mipi_dsi_device *device)
 {
 	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
+	struct drm_panel *panel;
+	int ret;
 
 	if (device->lanes > dsi->num_data_lanes)
 		return -EINVAL;
@@ -646,12 +648,36 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
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
 
@@ -766,21 +792,6 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
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
@@ -788,11 +799,6 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/* Initialize the DRM bridge. */
-	dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
-	dsi->bridge.of_node = dsi->dev->of_node;
-	drm_bridge_add(&dsi->bridge);
-
 	return 0;
 }
 
@@ -800,8 +806,6 @@ static int rcar_mipi_dsi_remove(struct platform_device *pdev)
 {
 	struct rcar_mipi_dsi *dsi = platform_get_drvdata(pdev);
 
-	drm_bridge_remove(&dsi->bridge);
-
 	mipi_dsi_host_unregister(&dsi->host);
 
 	return 0;
-- 
2.30.2

