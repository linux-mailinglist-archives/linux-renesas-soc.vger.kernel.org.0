Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09D741A2D0B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 02:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgDIAq2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Apr 2020 20:46:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39638 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgDIAq1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 20:46:27 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7227B76;
        Thu,  9 Apr 2020 02:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586393186;
        bh=Smlod2oOlxbOd8qyYjcjCd9v4omFBlGV2clWBb5vDao=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uo7NKLCD1gL5Vrmt4X2dlzqSTNQBpwX7N4XixlHOUWEqgw5efxywGUV07RywZjDDe
         qCkjf56JCABYCdMIE85YHlvXSIZbSRT50ssWlqM2PNxmsF7Q16HXRsUEIsFZyPX+wB
         KJc/1/LcJPUSJsK4H7E980sw69uriaZy8nDX7SnY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 2/4] drm: bridge: adv7511: Split connector creation to a separate function
Date:   Thu,  9 Apr 2020 03:46:08 +0300
Message-Id: <20200409004610.12346-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To prepare for making the connector creation optional, move the related
code out of adv7511_bridge_attach() to a separate function.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 62 +++++++++++++-------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 58d02e92b6b9..e3b62ad95389 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -783,7 +783,10 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 	adv7511->f_tmds = mode->clock;
 }
 
-/* Connector funcs */
+/* -----------------------------------------------------------------------------
+ * DRM Connector Operations
+ */
+
 static struct adv7511 *connector_to_adv7511(struct drm_connector *connector)
 {
 	return container_of(connector, struct adv7511, connector);
@@ -827,7 +830,40 @@ static const struct drm_connector_funcs adv7511_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-/* Bridge funcs */
+static int adv7511_connector_init(struct adv7511 *adv)
+{
+	struct drm_bridge *bridge = &adv->bridge;
+	int ret;
+
+	if (!bridge->encoder) {
+		DRM_ERROR("Parent encoder object not found");
+		return -ENODEV;
+	}
+
+	if (adv->i2c_main->irq)
+		adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
+	else
+		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
+				DRM_CONNECTOR_POLL_DISCONNECT;
+
+	ret = drm_connector_init(bridge->dev, &adv->connector,
+				 &adv7511_connector_funcs,
+				 DRM_MODE_CONNECTOR_HDMIA);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector with drm\n");
+		return ret;
+	}
+	drm_connector_helper_add(&adv->connector,
+				 &adv7511_connector_helper_funcs);
+	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * DRM Bridge Operations
+ */
+
 static struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct adv7511, bridge);
@@ -867,27 +903,9 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!bridge->encoder) {
-		DRM_ERROR("Parent encoder object not found");
-		return -ENODEV;
-	}
-
-	if (adv->i2c_main->irq)
-		adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
-	else
-		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
-				DRM_CONNECTOR_POLL_DISCONNECT;
-
-	ret = drm_connector_init(bridge->dev, &adv->connector,
-				 &adv7511_connector_funcs,
-				 DRM_MODE_CONNECTOR_HDMIA);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
+	ret = adv7511_connector_init(adv);
+	if (ret < 0)
 		return ret;
-	}
-	drm_connector_helper_add(&adv->connector,
-				 &adv7511_connector_helper_funcs);
-	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
 
 	if (adv->type == ADV7533 || adv->type == ADV7535)
 		ret = adv7533_attach_dsi(adv);
-- 
Regards,

Laurent Pinchart

