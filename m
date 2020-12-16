Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E052DB7FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 01:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgLPAvU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 19:51:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37146 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgLPAvQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 19:51:16 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7261FB2A;
        Wed, 16 Dec 2020 01:50:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608079831;
        bh=1+A9hKXy4R5mBtLMa0zXetR+bOESksULVX5Qt05pqq0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vJOmOgGVziHIqQnulFMR2NRxoEh6Yr0/k6vmOt0g5rIefiaeYykiIFbd+J/TChYyZ
         2wN19oOtrbJm+JkofZw812zwY+2pmJcRaUe2ucjvy57hZCnHAcx7/2nqfUfb6hwH0W
         4E8aPx853oxKjwf4kM9vKHUoaD+He/SFmiY5GdKI=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 2/4] drm: bridge: dw-hdmi: Attach to next bridge if available
Date:   Wed, 16 Dec 2020 02:50:19 +0200
Message-Id: <20201216005021.19518-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On all platforms except i.MX and Rockchip, the dw-hdmi DT bindings
require a video output port connected to an HDMI sink (most likely an
HDMI connector, in rare cases another bridges converting HDMI to another
protocol). For those platforms, retrieve the next bridge and attach it
from the dw-hdmi bridge attach handler.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes since v1:

- Make missing endpoint a fatal error
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 54 ++++++++++++++++++++++-
 include/drm/bridge/dw_hdmi.h              |  2 +
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0c79a9ba48bb..a8393ecd3d19 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -143,6 +143,7 @@ struct dw_hdmi_phy_data {
 struct dw_hdmi {
 	struct drm_connector connector;
 	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
 
 	unsigned int version;
 
@@ -2791,7 +2792,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return 0;
+		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
+					 bridge, flags);
 
 	return dw_hdmi_connector_create(hdmi);
 }
@@ -3176,6 +3178,52 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
 /* -----------------------------------------------------------------------------
  * Probe/remove API, used from platforms based on the DRM bridge API.
  */
+
+static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
+{
+	struct device_node *endpoint;
+	struct device_node *remote;
+
+	if (!hdmi->plat_data->output_port)
+		return 0;
+
+	endpoint = of_graph_get_endpoint_by_regs(hdmi->dev->of_node,
+						 hdmi->plat_data->output_port,
+						 -1);
+	if (!endpoint) {
+		/*
+		 * On platforms whose bindings don't make the output port
+		 * mandatory (such as Rockchip) the plat_data->output_port
+		 * field isn't set, so it's safe to make this a fatal error.
+		 */
+		dev_err(hdmi->dev, "Missing endpoint in port@%u\n",
+			hdmi->plat_data->output_port);
+		return -ENODEV;
+	}
+
+	remote = of_graph_get_remote_port_parent(endpoint);
+	of_node_put(endpoint);
+	if (!remote) {
+		dev_err(hdmi->dev, "Endpoint in port@%u unconnected\n",
+			hdmi->plat_data->output_port);
+		return -ENODEV;
+	}
+
+	if (!of_device_is_available(remote)) {
+		dev_err(hdmi->dev, "port@%u remote device is disabled\n",
+			hdmi->plat_data->output_port);
+		of_node_put(remote);
+		return -ENODEV;
+	}
+
+	hdmi->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
+	if (!hdmi->next_bridge)
+		return -EPROBE_DEFER;
+
+	return 0;
+}
+
 struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 			      const struct dw_hdmi_plat_data *plat_data)
 {
@@ -3212,6 +3260,10 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	mutex_init(&hdmi->cec_notifier_mutex);
 	spin_lock_init(&hdmi->audio_lock);
 
+	ret = dw_hdmi_parse_dt(hdmi);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
 	if (ddc_node) {
 		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index ea34ca146b82..8ebeb65d6371 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -126,6 +126,8 @@ struct dw_hdmi_phy_ops {
 struct dw_hdmi_plat_data {
 	struct regmap *regm;
 
+	unsigned int output_port;
+
 	unsigned long input_bus_encoding;
 	bool use_drm_infoframe;
 	bool ycbcr_420_allowed;
-- 
Regards,

Laurent Pinchart

