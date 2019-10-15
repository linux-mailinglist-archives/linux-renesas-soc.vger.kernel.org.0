Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C221CD846B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 01:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbfJOXZb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 19:25:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59486 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbfJOXZb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 19:25:31 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF4E6324;
        Wed, 16 Oct 2019 01:25:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571181927;
        bh=Pp6BCehGu2yEnryjtmK/jhCiWflRIvFBk0+8Z8nvvP8=;
        h=From:To:Cc:Subject:Date:From;
        b=XGqSAou/AaAxYEyBvMEFmWUfRzM3GbWm8X5KgzZH0Mu9QFIusSi/sCjAmBjpF0y2A
         AmsLprNX+aW6iIuQTeNrPljXnNJISyCRKxEql80jqeVeHg+NIJ7ovCgKwxfavFl3Nb
         f/68By9yZ6TbOtqCK8C2rL80V/ulNmGaMrlkVWn4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: lvds: Get mode from state
Date:   Wed, 16 Oct 2019 02:25:21 +0300
Message-Id: <20191015232521.9455-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car LVDS encoder driver implements the bridge .mode_set()
operation for the sole purpose of storing the mode in the LVDS private
data, to be used later when enabling the encoder.

Switch to the bridge .atomic_enable() and .atomic_disable() operations
in order to access the global atomic state, and get the mode from the
state instead. Remove both the unneeded .mode_set() operation and the
display_mode and mode fields storing state data from the rcar_lvds
private structure.

As a side effect we get the CRTC from the state, replace the CRTC
pointer retrieved through the bridge's encoder that shouldn't be used by
atomic drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 125 ++++++++++++++--------------
 1 file changed, 61 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 8c6c172bbf2e..8f355ea07cb5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -65,9 +65,6 @@ struct rcar_lvds {
 		struct clk *dotclkin[2];	/* External DU clocks */
 	} clocks;
 
-	struct drm_display_mode display_mode;
-	enum rcar_lvds_mode mode;
-
 	struct drm_bridge *companion;
 	bool dual_link;
 };
@@ -402,10 +399,51 @@ EXPORT_SYMBOL_GPL(rcar_lvds_clk_disable);
  * Bridge
  */
 
-static void rcar_lvds_enable(struct drm_bridge *bridge)
+static enum rcar_lvds_mode rcar_lvds_get_lvds_mode(struct rcar_lvds *lvds,
+					const struct drm_connector *connector)
+{
+	const struct drm_display_info *info;
+	enum rcar_lvds_mode mode;
+
+	/*
+	 * There is no API yet to retrieve LVDS mode from a bridge, only panels
+	 * are supported.
+	 */
+	if (!lvds->panel)
+		return RCAR_LVDS_MODE_JEIDA;
+
+	info = &connector->display_info;
+	if (!info->num_bus_formats || !info->bus_formats) {
+		dev_err(lvds->dev, "no LVDS bus format reported\n");
+		return RCAR_LVDS_MODE_JEIDA;
+	}
+
+	switch (info->bus_formats[0]) {
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		mode = RCAR_LVDS_MODE_JEIDA;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		mode = RCAR_LVDS_MODE_VESA;
+		break;
+	default:
+		dev_err(lvds->dev, "unsupported LVDS bus format 0x%04x\n",
+			info->bus_formats[0]);
+		return RCAR_LVDS_MODE_JEIDA;
+	}
+
+	if (info->bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
+		mode |= RCAR_LVDS_MODE_MIRROR;
+
+	return mode;
+}
+
+static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
-	const struct drm_display_mode *mode = &lvds->display_mode;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc;
 	u32 lvdhcr;
 	u32 lvdcr0;
 	int ret;
@@ -414,6 +452,11 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	if (ret < 0)
 		return;
 
+	/* Retrieve the connector and CRTC through the atomic state. */
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+
 	/* Enable the companion LVDS encoder in dual-link mode. */
 	if (lvds->dual_link && lvds->companion)
 		lvds->companion->funcs->enable(lvds->companion);
@@ -452,18 +495,20 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	 * PLL clock configuration on all instances but the companion in
 	 * dual-link mode.
 	 */
-	if (!lvds->dual_link || lvds->companion)
+	if (!lvds->dual_link || lvds->companion) {
+		const struct drm_crtc_state *crtc_state =
+			drm_atomic_get_new_crtc_state(state, crtc);
+		const struct drm_display_mode *mode =
+			&crtc_state->adjusted_mode;
+
 		lvds->info->pll_setup(lvds, mode->clock * 1000);
+	}
 
 	/* Set the LVDS mode and select the input. */
-	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
+	lvdcr0 = rcar_lvds_get_lvds_mode(lvds, connector) << LVDCR0_LVMD_SHIFT;
 
 	if (lvds->bridge.encoder) {
-		/*
-		 * FIXME: We should really retrieve the CRTC through the state,
-		 * but how do we get a state pointer?
-		 */
-		if (drm_crtc_index(lvds->bridge.encoder->crtc) == 2)
+		if (drm_crtc_index(crtc) == 2)
 			lvdcr0 |= LVDCR0_DUSEL;
 	}
 
@@ -520,7 +565,8 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	}
 }
 
-static void rcar_lvds_disable(struct drm_bridge *bridge)
+static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_state *state)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
@@ -558,54 +604,6 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
 	return true;
 }
 
-static void rcar_lvds_get_lvds_mode(struct rcar_lvds *lvds)
-{
-	struct drm_display_info *info = &lvds->connector.display_info;
-	enum rcar_lvds_mode mode;
-
-	/*
-	 * There is no API yet to retrieve LVDS mode from a bridge, only panels
-	 * are supported.
-	 */
-	if (!lvds->panel)
-		return;
-
-	if (!info->num_bus_formats || !info->bus_formats) {
-		dev_err(lvds->dev, "no LVDS bus format reported\n");
-		return;
-	}
-
-	switch (info->bus_formats[0]) {
-	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
-	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
-		mode = RCAR_LVDS_MODE_JEIDA;
-		break;
-	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
-		mode = RCAR_LVDS_MODE_VESA;
-		break;
-	default:
-		dev_err(lvds->dev, "unsupported LVDS bus format 0x%04x\n",
-			info->bus_formats[0]);
-		return;
-	}
-
-	if (info->bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
-		mode |= RCAR_LVDS_MODE_MIRROR;
-
-	lvds->mode = mode;
-}
-
-static void rcar_lvds_mode_set(struct drm_bridge *bridge,
-			       const struct drm_display_mode *mode,
-			       const struct drm_display_mode *adjusted_mode)
-{
-	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
-
-	lvds->display_mode = *adjusted_mode;
-
-	rcar_lvds_get_lvds_mode(lvds);
-}
-
 static int rcar_lvds_attach(struct drm_bridge *bridge)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
@@ -647,10 +645,9 @@ static void rcar_lvds_detach(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
 	.attach = rcar_lvds_attach,
 	.detach = rcar_lvds_detach,
-	.enable = rcar_lvds_enable,
-	.disable = rcar_lvds_disable,
+	.atomic_enable = rcar_lvds_atomic_enable,
+	.atomic_disable = rcar_lvds_atomic_disable,
 	.mode_fixup = rcar_lvds_mode_fixup,
-	.mode_set = rcar_lvds_mode_set,
 };
 
 bool rcar_lvds_dual_link(struct drm_bridge *bridge)
-- 
Regards,

Laurent Pinchart

