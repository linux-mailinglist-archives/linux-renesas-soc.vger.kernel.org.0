Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A06A343710
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 04:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhCVDC4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 23:02:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35480 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhCVDC3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 23:02:29 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47B6A1253;
        Mon, 22 Mar 2021 04:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616382142;
        bh=RExfEQ5yLrRqnu+WT0+5E2o72Hccdb2njeYZMbxqTbo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r2ZUC/LKQyeME/l14MCEzasQLzjLYm/jjx5pxQs69kpokS4Ons2o9eUHSwv1CM9oS
         qf+vOACFLJNQU8nuJkvGw+Pre4eAZUjhWHsqGLQw2Sms1o+2ga0YskYCFRlACsk+Kk
         wmJ0cxF8ufgb36DveGc4ScM8iB0W+LkSbli+ymdU=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH 08/11] drm/bridge: ti-sn65dsi86: Implement bridge connector operations
Date:   Mon, 22 Mar 2021 05:01:25 +0200
Message-Id: <20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Implement the bridge connector-related .get_edid() operation, and report
the related bridge capabilities and type. The .get_edid() operation is
implemented with the same backend as the EDID retrieval from the
connector .get_modes() operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 30 ++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index dc300fab4319..6f6e075544e8 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -261,6 +261,18 @@ static void ti_sn_debugfs_remove(struct ti_sn_bridge *pdata)
 	pdata->debugfs = NULL;
 }
 
+static struct edid *__ti_sn_bridge_get_edid(struct ti_sn_bridge *pdata,
+					    struct drm_connector *connector)
+{
+	struct edid *edid;
+
+	pm_runtime_get_sync(pdata->dev);
+	edid = drm_get_edid(connector, &pdata->aux.ddc);
+	pm_runtime_put(pdata->dev);
+
+	return edid;
+}
+
 /* -----------------------------------------------------------------------------
  * DRM Connector Operations
  */
@@ -277,11 +289,8 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 	struct edid *edid = pdata->edid;
 	int num, ret;
 
-	if (!edid) {
-		pm_runtime_get_sync(pdata->dev);
-		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
-		pm_runtime_put(pdata->dev);
-	}
+	if (!edid)
+		edid = pdata->edid = __ti_sn_bridge_get_edid(pdata, connector);
 
 	if (edid && drm_edid_is_valid(edid)) {
 		ret = drm_connector_update_edid_property(connector, edid);
@@ -871,12 +880,21 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 	pm_runtime_put_sync(pdata->dev);
 }
 
+static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
+					  struct drm_connector *connector)
+{
+	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+
+	return __ti_sn_bridge_get_edid(pdata, connector);
+}
+
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.pre_enable = ti_sn_bridge_pre_enable,
 	.enable = ti_sn_bridge_enable,
 	.disable = ti_sn_bridge_disable,
 	.post_disable = ti_sn_bridge_post_disable,
+	.get_edid = ti_sn_bridge_get_edid,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1335,6 +1353,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = client->dev.of_node;
+	pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
+	pdata->bridge.type = DRM_MODE_CONNECTOR_eDP;
 
 	drm_bridge_add(&pdata->bridge);
 
-- 
Regards,

Laurent Pinchart

