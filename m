Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62E61E18D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 03:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388363AbgEZBPt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 21:15:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54362 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388416AbgEZBPs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 21:15:48 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C39791C7D;
        Tue, 26 May 2020 03:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590455745;
        bh=iot3XYellZQZgy4pl1BFGh7O2oiB+wTajUb+mfURyVE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I7Xa925HP9CAxDdZg8eqYUzOa+UjoNoohtrDm5lQ/wTRxvRsDAIE5oJOjAFyJJOKh
         wxpUvGzOHito51bffo/QrJzoA0mqwC028gUwM+7F8uJQW/4cNURZg3Yt9SDP2xHFRu
         nsz8sZr71CZnLCOANZ5B5aWJBP255VqB7aFnOGSU=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 19/27] drm: bridge: dw-hdmi: Split connector creation to a separate function
Date:   Tue, 26 May 2020 04:14:57 +0300
Message-Id: <20200526011505.31884-20-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Isolate all the code related to connector creation to a new
dw_hdmi_connector_create() function, to prepare for making connector
creation optional.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 107 +++++++++++++---------
 1 file changed, 62 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index a18794cce0d8..35d38b644912 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2317,6 +2317,10 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi *hdmi)
 					  hdmi->rxsense);
 }
 
+/* -----------------------------------------------------------------------------
+ * DRM Connector Operations
+ */
+
 static enum drm_connector_status
 dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -2438,6 +2442,59 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
 	.atomic_check = dw_hdmi_connector_atomic_check,
 };
 
+static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
+{
+	struct drm_connector *connector = &hdmi->connector;
+	struct cec_connector_info conn_info;
+	struct cec_notifier *notifier;
+
+	if (hdmi->version >= 0x200a)
+		connector->ycbcr_420_allowed =
+			hdmi->plat_data->ycbcr_420_allowed;
+	else
+		connector->ycbcr_420_allowed = false;
+
+	connector->interlace_allowed = 1;
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
+
+	drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
+				    &dw_hdmi_connector_funcs,
+				    DRM_MODE_CONNECTOR_HDMIA,
+				    hdmi->ddc);
+
+	/*
+	 * drm_connector_attach_max_bpc_property() requires the
+	 * connector to have a state.
+	 */
+	drm_atomic_helper_connector_reset(connector);
+
+	drm_connector_attach_max_bpc_property(connector, 8, 16);
+
+	if (hdmi->version >= 0x200a && hdmi->plat_data->use_drm_infoframe)
+		drm_object_attach_property(&connector->base,
+			connector->dev->mode_config.hdr_output_metadata_property, 0);
+
+	drm_connector_attach_encoder(connector, hdmi->bridge.encoder);
+
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
+	if (!notifier)
+		return -ENOMEM;
+
+	mutex_lock(&hdmi->cec_notifier_mutex);
+	hdmi->cec_notifier = notifier;
+	mutex_unlock(&hdmi->cec_notifier_mutex);
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * DRM Bridge Operations
+ */
+
 /*
  * Possible output formats :
  * - MEDIA_BUS_FMT_UYYVYY16_0_5X48,
@@ -2713,51 +2770,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
-	struct drm_encoder *encoder = bridge->encoder;
-	struct drm_connector *connector = &hdmi->connector;
-	struct cec_connector_info conn_info;
-	struct cec_notifier *notifier;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
 		DRM_ERROR("Fix bridge driver to make connector optional!");
 		return -EINVAL;
 	}
 
-	connector->interlace_allowed = 1;
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
-
-	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
-
-	drm_connector_init_with_ddc(bridge->dev, connector,
-				    &dw_hdmi_connector_funcs,
-				    DRM_MODE_CONNECTOR_HDMIA,
-				    hdmi->ddc);
-
-	/*
-	 * drm_connector_attach_max_bpc_property() requires the
-	 * connector to have a state.
-	 */
-	drm_atomic_helper_connector_reset(connector);
-
-	drm_connector_attach_max_bpc_property(connector, 8, 16);
-
-	if (hdmi->version >= 0x200a && hdmi->plat_data->use_drm_infoframe)
-		drm_object_attach_property(&connector->base,
-			connector->dev->mode_config.hdr_output_metadata_property, 0);
-
-	drm_connector_attach_encoder(connector, encoder);
-
-	cec_fill_conn_info_from_drm(&conn_info, connector);
-
-	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
-	if (!notifier)
-		return -ENOMEM;
-
-	mutex_lock(&hdmi->cec_notifier_mutex);
-	hdmi->cec_notifier = notifier;
-	mutex_unlock(&hdmi->cec_notifier_mutex);
-
-	return 0;
+	return dw_hdmi_connector_create(hdmi);
 }
 
 static void dw_hdmi_bridge_detach(struct drm_bridge *bridge)
@@ -2841,6 +2860,10 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.mode_valid = dw_hdmi_bridge_mode_valid,
 };
 
+/* -----------------------------------------------------------------------------
+ * IRQ Handling
+ */
+
 static irqreturn_t dw_hdmi_i2c_irq(struct dw_hdmi *hdmi)
 {
 	struct dw_hdmi_i2c *i2c = hdmi->i2c;
@@ -3303,12 +3326,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
 
-	if (hdmi->version >= 0x200a)
-		hdmi->connector.ycbcr_420_allowed =
-			hdmi->plat_data->ycbcr_420_allowed;
-	else
-		hdmi->connector.ycbcr_420_allowed = false;
-
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;
 	pdevinfo.id = PLATFORM_DEVID_AUTO;
-- 
Regards,

Laurent Pinchart

