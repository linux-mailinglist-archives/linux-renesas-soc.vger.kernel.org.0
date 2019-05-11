Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA3A1A984
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 23:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfEKVHj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 17:07:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58288 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfEKVHi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 17:07:38 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06CB79BF;
        Sat, 11 May 2019 23:07:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557608854;
        bh=C78Bb1zNU6+HwoP7PSAUVT31AVeiFV9P9UlG6yW6W7A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D2TmNV6FuwClD6IomlPVfDRVjm57DbfMaupyf7EppXfFjOPKdDXypE0SGWXJpiMT7
         LUT6Zei3ktKlFpof8yMo2Dug6xFT3Nykqzcrhn9IOidzWQbc/o5B0Ecy2WA1NJyhKV
         0KFCKTwdxWCSweWzJXeNBJXR55LWHE8ATiUm+OI0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 06/10] drm: rcar-du: lvds: Add support for dual-link mode
Date:   Sun, 12 May 2019 00:06:58 +0300
Message-Id: <20190511210702.18394-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
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
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 104 ++++++++++++++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_lvds.h |   5 ++
 2 files changed, 96 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index a331f0c32187..f7e4710fe33f 100644
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
 
@@ -628,10 +650,54 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
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
+	if (!companion)
+		return -ENODEV;
+
+	/*
+	 * Sanity check: the companion encoder must have the same compatible
+	 * string.
+	 */
+	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!of_device_is_compatible(companion, match->compatible)) {
+		ret = -ENODEV;
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
@@ -682,14 +748,26 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 
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

