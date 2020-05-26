Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8EF1E18D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 03:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388417AbgEZBPw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 21:15:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54224 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388348AbgEZBPv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 21:15:51 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0DDA1C8F;
        Tue, 26 May 2020 03:15:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590455747;
        bh=Qz0YRalAoL2LBTowIhArSjJi1EAADzZ1NZrcN1kNams=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I7NJcxoF3y771kyQsCumeOtAjEYGLTLi1np7emkKTCZs3DoLd8FiFT356I4nq00n2
         hzc+E1BjOUjD64eKg+IVF9QZDq3PDPyOp/bGbnwYQ2h1jggg0MCUp4dMAq87H1hwpG
         lxj2E4WIR2UggFnwHdQ+1/iRuAr8uPYMwqSEoC00=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 22/27] drm: bridge: dw-hdmi: Make connector creation optional
Date:   Tue, 26 May 2020 04:15:00 +0300
Message-Id: <20200526011505.31884-23-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Implement the drm_bridge_funcs .detect() and .get_edid() operations, and
call drm_bridge_hpd_notify() notify to report HPD. This provides the
necessary API to support disabling connector creation, do so by
accepting DRM_BRIDGE_ATTACH_NO_CONNECTOR in dw_hdmi_bridge_attach().

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 104 +++++++++++++++-------
 1 file changed, 74 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index b69c14b9de62..6148a022569a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2323,15 +2323,8 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi *hdmi)
 					  hdmi->rxsense);
 }
 
-/* -----------------------------------------------------------------------------
- * DRM Connector Operations
- */
-
-static enum drm_connector_status
-dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
+static enum drm_connector_status dw_hdmi_detect(struct dw_hdmi *hdmi)
 {
-	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
-					     connector);
 	enum drm_connector_status result;
 
 	mutex_lock(&hdmi->mutex);
@@ -2354,31 +2347,57 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	return result;
 }
 
-static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
+static struct edid *dw_hdmi_get_edid(struct dw_hdmi *hdmi,
+				     struct drm_connector *connector)
 {
-	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
-					     connector);
 	struct edid *edid;
-	int ret = 0;
 
 	if (!hdmi->ddc)
-		return 0;
+		return NULL;
 
 	edid = drm_get_edid(connector, hdmi->ddc);
-	if (edid) {
-		dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
-			edid->width_cm, edid->height_cm);
-
-		hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
-		hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
-		drm_connector_update_edid_property(connector, edid);
-		cec_notifier_set_phys_addr_from_edid(hdmi->cec_notifier, edid);
-		ret = drm_add_edid_modes(connector, edid);
-		kfree(edid);
-	} else {
+	if (!edid) {
 		dev_dbg(hdmi->dev, "failed to get edid\n");
+		return NULL;
 	}
 
+	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
+		edid->width_cm, edid->height_cm);
+
+	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
+	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
+
+	return edid;
+}
+
+/* -----------------------------------------------------------------------------
+ * DRM Connector Operations
+ */
+
+static enum drm_connector_status
+dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
+					     connector);
+	return dw_hdmi_detect(hdmi);
+}
+
+static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
+{
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
+					     connector);
+	struct edid *edid;
+	int ret;
+
+	edid = dw_hdmi_get_edid(hdmi, connector);
+	if (!edid)
+		return 0;
+
+	drm_connector_update_edid_property(connector, edid);
+	cec_notifier_set_phys_addr_from_edid(hdmi->cec_notifier, edid);
+	ret = drm_add_edid_modes(connector, edid);
+	kfree(edid);
+
 	return ret;
 }
 
@@ -2777,10 +2796,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
 
 	return dw_hdmi_connector_create(hdmi);
 }
@@ -2860,6 +2877,21 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 	mutex_unlock(&hdmi->mutex);
 }
 
+static enum drm_connector_status dw_hdmi_bridge_detect(struct drm_bridge *bridge)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	return dw_hdmi_detect(hdmi);
+}
+
+static struct edid *dw_hdmi_bridge_get_edid(struct drm_bridge *bridge,
+					    struct drm_connector *connector)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	return dw_hdmi_get_edid(hdmi, connector);
+}
+
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -2873,6 +2905,8 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.atomic_disable = dw_hdmi_bridge_atomic_disable,
 	.mode_set = dw_hdmi_bridge_mode_set,
 	.mode_valid = dw_hdmi_bridge_mode_valid,
+	.detect = dw_hdmi_bridge_detect,
+	.get_edid = dw_hdmi_bridge_get_edid,
 };
 
 /* -----------------------------------------------------------------------------
@@ -2988,10 +3022,18 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	}
 
 	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
+		enum drm_connector_status status = phy_int_pol & HDMI_PHY_HPD
+						 ? connector_status_connected
+						 : connector_status_disconnected;
+
 		dev_dbg(hdmi->dev, "EVENT=%s\n",
-			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
-		if (hdmi->bridge.dev)
+			status == connector_status_connected ?
+			"plugin" : "plugout");
+
+		if (hdmi->bridge.dev) {
 			drm_helper_hpd_irq_event(hdmi->bridge.dev);
+			drm_bridge_hpd_notify(&hdmi->bridge, status);
+		}
 	}
 
 	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
@@ -3337,6 +3379,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 	hdmi->bridge.driver_private = hdmi;
 	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
+	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
+			 | DRM_BRIDGE_OP_HPD;
 #ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
-- 
Regards,

Laurent Pinchart

