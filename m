Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9326D2C874
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 16:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfE1ON1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 10:13:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48962 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfE1ON1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 10:13:27 -0400
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi [85.76.65.42])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13FB9D85;
        Tue, 28 May 2019 16:13:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559052804;
        bh=raw1Oj6Ci2FQpYAOX+4ntr/0tEFBU9x0BV83lF7wU7w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XTSmazL6lYHNKbky2jAQhKAMXPV+hLDHvemObEeAx3qTOie1ZohB7d/FyHLDWdGMv
         KysHyjjkJOX/HdlRjpYl8UdESskZZsNNzFznKMZN4943VvmYpMJFScANov0I0Agg7z
         +5kAx/imxMkzkTm8JjkZeIGfTXPduXpZzjFtqkbo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 06/10] drm: rcar-du: lvds: Add support for dual-link mode
Date:   Tue, 28 May 2019 17:12:30 +0300
Message-Id: <20190528141234.15425-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In dual-link mode the LVDS0 encoder transmits even-numbered pixels, and
sends odd-numbered pixels to the LVDS1 encoder for transmission on a
separate link.

To implement support for this mode of operation, determine if the LVDS
connection operates in dual-link mode by querying the next device in the
pipeline, locate the companion encoder, and control it directly through
its bridge operations.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Changes since v2:

- Fail probe if the companion controller can't be found or is invalid
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 107 ++++++++++++++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_lvds.h |   5 ++
 2 files changed, 99 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index a331f0c32187..d090191e858e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -66,6 +66,9 @@ struct rcar_lvds {
 
 	struct drm_display_mode display_mode;
 	enum rcar_lvds_mode mode;
+
+	struct drm_bridge *companion;
+	bool dual_link;
 };
 
 #define bridge_to_rcar_lvds(bridge) \
@@ -400,11 +403,6 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 	const struct drm_display_mode *mode = &lvds->display_mode;
-	/*
-	 * FIXME: We should really retrieve the CRTC through the state, but how
-	 * do we get a state pointer?
-	 */
-	struct drm_crtc *crtc = lvds->bridge.encoder->crtc;
 	u32 lvdhcr;
 	u32 lvdcr0;
 	int ret;
@@ -413,6 +411,10 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	if (ret < 0)
 		return;
 
+	/* Enable the companion LVDS encoder in dual-link mode. */
+	if (lvds->dual_link && lvds->companion)
+		lvds->companion->funcs->enable(lvds->companion);
+
 	/*
 	 * Hardcode the channels and control signals routing for now.
 	 *
@@ -435,17 +437,33 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
 
 	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
-		/* Disable dual-link mode. */
-		rcar_lvds_write(lvds, LVDSTRIPE, 0);
+		/*
+		 * Configure vertical stripe based on the mode of operation of
+		 * the connected device.
+		 */
+		rcar_lvds_write(lvds, LVDSTRIPE,
+				lvds->dual_link ? LVDSTRIPE_ST_ON : 0);
 	}
 
-	/* PLL clock configuration. */
-	lvds->info->pll_setup(lvds, mode->clock * 1000);
+	/*
+	 * PLL clock configuration on all instances but the companion in
+	 * dual-link mode.
+	 */
+	if (!lvds->dual_link || lvds->companion)
+		lvds->info->pll_setup(lvds, mode->clock * 1000);
 
 	/* Set the LVDS mode and select the input. */
 	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
-	if (drm_crtc_index(crtc) == 2)
-		lvdcr0 |= LVDCR0_DUSEL;
+
+	if (lvds->bridge.encoder) {
+		/*
+		 * FIXME: We should really retrieve the CRTC through the state,
+		 * but how do we get a state pointer?
+		 */
+		if (drm_crtc_index(lvds->bridge.encoder->crtc) == 2)
+			lvdcr0 |= LVDCR0_DUSEL;
+	}
+
 	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
 
 	/* Turn all the channels on. */
@@ -512,6 +530,10 @@ static void rcar_lvds_disable(struct drm_bridge *bridge)
 	rcar_lvds_write(lvds, LVDCR1, 0);
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
+	/* Disable the companion LVDS encoder in dual-link mode. */
+	if (lvds->dual_link && lvds->companion)
+		lvds->companion->funcs->disable(lvds->companion);
+
 	clk_disable_unprepare(lvds->clocks.mod);
 }
 
@@ -628,10 +650,57 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
 	.mode_set = rcar_lvds_mode_set,
 };
 
+bool rcar_lvds_dual_link(struct drm_bridge *bridge)
+{
+	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
+
+	return lvds->dual_link;
+}
+EXPORT_SYMBOL_GPL(rcar_lvds_dual_link);
+
 /* -----------------------------------------------------------------------------
  * Probe & Remove
  */
 
+static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
+{
+	const struct of_device_id *match;
+	struct device_node *companion;
+	struct device *dev = lvds->dev;
+	int ret = 0;
+
+	/* Locate the companion LVDS encoder for dual-link operation, if any. */
+	companion = of_parse_phandle(dev->of_node, "renesas,companion", 0);
+	if (!companion) {
+		dev_err(dev, "Companion LVDS encoder not found\n");
+		return -ENXIO;
+	}
+
+	/*
+	 * Sanity check: the companion encoder must have the same compatible
+	 * string.
+	 */
+	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!of_device_is_compatible(companion, match->compatible)) {
+		dev_err(dev, "Companion LVDS encoder is invalid\n");
+		ret = -ENXIO;
+		goto done;
+	}
+
+	lvds->companion = of_drm_find_bridge(companion);
+	if (!lvds->companion) {
+		ret = -EPROBE_DEFER;
+		goto done;
+	}
+
+	dev_dbg(dev, "Found companion encoder %pOF\n", companion);
+
+done:
+	of_node_put(companion);
+
+	return ret;
+}
+
 static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 {
 	struct device_node *local_output = NULL;
@@ -682,14 +751,26 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 
 	if (is_bridge) {
 		lvds->next_bridge = of_drm_find_bridge(remote);
-		if (!lvds->next_bridge)
+		if (!lvds->next_bridge) {
 			ret = -EPROBE_DEFER;
+			goto done;
+		}
+
+		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
+			lvds->dual_link = lvds->next_bridge->timings
+					? lvds->next_bridge->timings->dual_link
+					: false;
 	} else {
 		lvds->panel = of_drm_find_panel(remote);
-		if (IS_ERR(lvds->panel))
+		if (IS_ERR(lvds->panel)) {
 			ret = PTR_ERR(lvds->panel);
+			goto done;
+		}
 	}
 
+	if (lvds->dual_link)
+		ret = rcar_lvds_parse_dt_companion(lvds);
+
 done:
 	of_node_put(local_output);
 	of_node_put(remote_input);
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.h b/drivers/gpu/drm/rcar-du/rcar_lvds.h
index a709cae1bc32..222ec0e60785 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.h
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.h
@@ -15,6 +15,7 @@ struct drm_bridge;
 #if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
 int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq);
 void rcar_lvds_clk_disable(struct drm_bridge *bridge);
+bool rcar_lvds_dual_link(struct drm_bridge *bridge);
 #else
 static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
 				       unsigned long freq)
@@ -22,6 +23,10 @@ static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
 	return -ENOSYS;
 }
 static inline void rcar_lvds_clk_disable(struct drm_bridge *bridge) { }
+static inline bool rcar_lvds_dual_link(struct drm_bridge *bridge)
+{
+	return false;
+}
 #endif /* CONFIG_DRM_RCAR_LVDS */
 
 #endif /* __RCAR_LVDS_H__ */
-- 
Regards,

Laurent Pinchart

