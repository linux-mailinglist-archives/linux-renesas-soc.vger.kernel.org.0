Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430693B1269
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhFWDt6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:49:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhFWDt5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:49:57 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C588A29EF;
        Wed, 23 Jun 2021 05:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420058;
        bh=WGIyTzG1o4akPIq/jjWnC8Frw/W5GyIvRVUsV3GD44M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cDGciF6jIQxF15/V2SYM75lmB+bqGNQFxFtOF9SgrDF8RuNuIRxyLsY7BvPTHm8dT
         rephbQ93PwyhaKH0bE0dAbvEg0N+J48i42NmSxupN/OaUnC6ijSDC5bAlN9L/H6c/R
         b5gUtvth6sNQJN5b3i8rSqlWX8TZLaEIt0F84Exo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 08/15] drm: rcar-du: dsi: Get next bridge in probe()
Date:   Wed, 23 Jun 2021 06:46:49 +0300
Message-Id: <20210623034656.10316-9-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 65 +++++++------------------
 1 file changed, 17 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 454c25591a14..a6bb7f25164b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -20,6 +20,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
@@ -678,11 +679,7 @@ static const struct mipi_dsi_host_ops rcar_mipi_dsi_host_ops = {
 static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *dsi)
 {
 	struct device_node *local_output = NULL;
-	struct device_node *remote_input = NULL;
-	struct device_node *remote = NULL;
-	struct device_node *node;
 	struct property *prop;
-	bool is_bridge = false;
 	int ret = 0;
 	int len, num_lanes;
 
@@ -694,48 +691,6 @@ static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *dsi)
 		goto done;
 	}
 
-	/*
-	 * Locate the connected entity and
-	 * infer its type from the number of endpoints.
-	 */
-	remote = of_graph_get_remote_port_parent(local_output);
-	if (!remote) {
-		dev_dbg(dsi->dev, "unconnected endpoint %pOF\n", local_output);
-		ret = -ENODEV;
-		goto done;
-	}
-
-	if (!of_device_is_available(remote)) {
-		dev_dbg(dsi->dev, "connected entity %pOF is disabled\n",
-			remote);
-		ret = -ENODEV;
-		goto done;
-	}
-
-	remote_input = of_graph_get_remote_endpoint(local_output);
-
-	for_each_endpoint_of_node(remote, node) {
-		if (node != remote_input) {
-			/*
-			 * The endpoint which is not input node must be bridge
-			 */
-			is_bridge = true;
-			of_node_put(node);
-			break;
-		}
-	}
-
-	if (!is_bridge) {
-		ret = -ENODEV;
-		goto done;
-	}
-
-	dsi->next_bridge = of_drm_find_bridge(remote);
-	if (!dsi->next_bridge) {
-		ret = -EPROBE_DEFER;
-		goto done;
-	}
-
 	/* Get lanes information */
 	prop = of_find_property(local_output, "data-lanes", &len);
 	if (!prop) {
@@ -755,8 +710,6 @@ static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *dsi)
 	dsi->num_data_lanes = num_lanes;
 done:
 	of_node_put(local_output);
-	of_node_put(remote_input);
-	of_node_put(remote);
 
 	return ret;
 }
@@ -805,6 +758,7 @@ static int rcar_mipi_dsi_get_clocks(struct rcar_mipi_dsi *dsi)
 static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 {
 	struct rcar_mipi_dsi *dsi;
+	struct drm_panel *panel;
 	struct resource *mem;
 	int ret;
 
@@ -837,6 +791,21 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 		return PTR_ERR(dsi->rstc);
 	}
 
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
 	/* Initialize the DSI host. */
 	dsi->host.dev = dsi->dev;
 	dsi->host.ops = &rcar_mipi_dsi_host_ops;
-- 
Regards,

Laurent Pinchart

