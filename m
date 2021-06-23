Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFC83B126B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbhFWDt7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhFWDt7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:49:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5D7C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 20:47:42 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BEAD5D9E;
        Wed, 23 Jun 2021 05:47:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420058;
        bh=Ps/pmAUMugY85DvMhR6C2O2JcR0XBuU6rrau1pVK1z0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AEFdHXlRcNtbogXO4080s+PDwjdMA7SGuYkT9KFOSMw9p/jx/6xSe/9JZQ5IyfkTT
         ba8JZM/gXiCAXx5boOz5pkp4MaCC7+pJ57XPCOCr5lwbGIQD4yTwz+RWR6+0wNjIu0
         aoPJDV1KlJeCZ9dzDsAEYA4nETtfOnQ70/3WHZXM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 09/15] drm: rcar-du: dsi: Simplify DT parsing
Date:   Wed, 23 Jun 2021 06:46:50 +0300
Message-Id: <20210623034656.10316-10-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 41 +++++++++----------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index a6bb7f25164b..d16bf50e8acb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -678,40 +678,27 @@ static const struct mipi_dsi_host_ops rcar_mipi_dsi_host_ops = {
 
 static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *dsi)
 {
-	struct device_node *local_output = NULL;
-	struct property *prop;
-	int ret = 0;
-	int len, num_lanes;
+	struct device_node *ep;
+	u32 data_lanes[4];
+	int ret;
 
-	local_output = of_graph_get_endpoint_by_regs(dsi->dev->of_node,
-						     1, 0);
-	if (!local_output) {
+	ep = of_graph_get_endpoint_by_regs(dsi->dev->of_node, 1, 0);
+	if (!ep) {
 		dev_dbg(dsi->dev, "unconnected port@1\n");
-		ret = -ENODEV;
-		goto done;
+		return -ENODEV;
 	}
 
-	/* Get lanes information */
-	prop = of_find_property(local_output, "data-lanes", &len);
-	if (!prop) {
-		dsi->num_data_lanes = 4;
-		dev_dbg(dsi->dev,
-			"failed to find data lane information, using default\n");
-		goto done;
-	}
-
-	num_lanes = len / sizeof(u32);
+	ret = of_property_read_variable_u32_array(ep, "data-lanes", data_lanes,
+						  1, 4);
+	of_node_put(ep);
 
-	if (num_lanes < 1 || num_lanes > 4) {
-		dev_err(dsi->dev, "data lanes definition is not correct\n");
-		return -EINVAL;
+	if (ret < 0) {
+		dev_err(dsi->dev, "missing or invalid data-lanes property\n");
+		return -ENODEV;
 	}
 
-	dsi->num_data_lanes = num_lanes;
-done:
-	of_node_put(local_output);
-
-	return ret;
+	dsi->num_data_lanes = ret;
+	return 0;
 }
 
 static struct clk *rcar_mipi_dsi_get_clock(struct rcar_mipi_dsi *dsi,
-- 
Regards,

Laurent Pinchart

