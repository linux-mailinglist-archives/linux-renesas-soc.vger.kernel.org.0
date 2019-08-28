Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0EEA09AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 20:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfH1ShK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 14:37:10 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:45272 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727069AbfH1ShK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 14:37:10 -0400
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; 
   d="scan'208";a="25166341"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 03:37:08 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AFEA04004953;
        Thu, 29 Aug 2019 03:37:05 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, sam@ravnborg.org
Subject: [PATCH v3 4/8] drm: rcar-du: lvds: Add dual-LVDS panels support
Date:   Wed, 28 Aug 2019 19:36:38 +0100
Message-Id: <1567017402-5895-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The driver doesn't support dual-link LVDS displays, and the way
it identifies bridges won't allow for dual-LVDS displays to be
connected. Also, it's not possible to swap even and odd pixels
around in case the wiring isn't taking advantage of the default
hardware configuration. Further more, the "mode" of the companion
encoder should be same as the mode of the primary encoder.

Rework the driver to improve all of the above, so that it can
support dual-LVDS displays.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v2->v3:
* reworked to take advantange of the new dt-bindings
* squashed in the patche for fixing the companion's mode

Laurent,

unfortunately the best way to get the companion encoder to use
the same mode as the primary encoder is setting the mode directly
without calling into rcar_lvds_mode_set for the companion encoder,
as the below test fails for the companion encoder in
rcar_lvds_get_lvds_mode:
if (!info->num_bus_formats || !info->bus_formats)

Anyhow, setting the mode for the companion encoder doesn't seem
to be mandary according to the experiments I have been running,
but the HW User's Manual doesn't really say much about this,
therefore I think the safest option is still to set the mode for
the companion encoder.

Thanks,
Fab
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 110 +++++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 3fe0b86..dfec5e7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -20,6 +20,8 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bus_timings.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
@@ -69,6 +71,7 @@ struct rcar_lvds {
 
 	struct drm_bridge *companion;
 	bool dual_link;
+	bool stripe_swap_data;
 };
 
 #define bridge_to_rcar_lvds(b) \
@@ -439,12 +442,20 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
 
 	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
-		/*
-		 * Configure vertical stripe based on the mode of operation of
-		 * the connected device.
-		 */
-		rcar_lvds_write(lvds, LVDSTRIPE,
-				lvds->dual_link ? LVDSTRIPE_ST_ON : 0);
+		u32 lvdstripe = 0;
+
+		if (lvds->dual_link)
+			/*
+			 * Configure vertical stripe based on the mode of
+			 * operation of the connected device.
+			 *
+			 * ST_SWAP from LVD1STRIPE is reserved, do not set
+			 * in the companion LVDS
+			 */
+			lvdstripe = LVDSTRIPE_ST_ON |
+				(lvds->companion && lvds->stripe_swap_data ?
+				 LVDSTRIPE_ST_SWAP : 0);
+		rcar_lvds_write(lvds, LVDSTRIPE, lvdstripe);
 	}
 
 	/*
@@ -603,6 +614,11 @@ static void rcar_lvds_mode_set(struct drm_bridge *bridge,
 	lvds->display_mode = *adjusted_mode;
 
 	rcar_lvds_get_lvds_mode(lvds);
+	if (lvds->companion) {
+		struct rcar_lvds *companion_lvds = bridge_to_rcar_lvds(
+							lvds->companion);
+		companion_lvds->mode = lvds->mode;
+	}
 }
 
 static int rcar_lvds_attach(struct drm_bridge *bridge)
@@ -667,9 +683,10 @@ EXPORT_SYMBOL_GPL(rcar_lvds_dual_link);
 static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 {
 	const struct of_device_id *match;
-	struct device_node *companion;
+	struct device_node *companion, *p0 = NULL, *p1 = NULL;
 	struct device *dev = lvds->dev;
-	int ret = 0;
+	struct rcar_lvds *companion_lvds;
+	int ret = 0, dual_link;
 
 	/* Locate the companion LVDS encoder for dual-link operation, if any. */
 	companion = of_parse_phandle(dev->of_node, "renesas,companion", 0);
@@ -687,16 +704,50 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 		goto done;
 	}
 
+	/*
+	 * We need to work out if the sink is expecting us to function in
+	 * dual-link mode. We do this by looking at the DT port nodes we are
+	 * connected to, if they are marked as expecting even pixels and
+	 * odd pixels than we need to enable vertical stripe output
+	 */
+	p0 = of_graph_get_port_by_id(dev->of_node, 1);
+	p1 = of_graph_get_port_by_id(companion, 1);
+	dual_link = drm_of_lvds_get_dual_link_configuration(p0, p1);
+	if (dual_link >= DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
+		dev_dbg(dev, "Dual-link configuration detected\n");
+		lvds->dual_link = true;
+	} else {
+		/* dual-link mode is not required */
+		dev_dbg(dev, "Single-link configuration detected\n");
+		goto done;
+	}
+	/*
+	 * We may need to swap even and odd pixels around in case the wiring
+	 * doesn't match the default configuration.
+	 * By default we generate even pixels from this encoder and odd pixels
+	 * from the companion encoder, but if p0 is connected to the port
+	 * expecting ood pixels, and p1 is connected to the port expecting even
+	 * pixels, then we need to swap even and odd pixels around
+	 */
+	if (dual_link == DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS) {
+		dev_dbg(dev, "Data swapping required\n");
+		lvds->stripe_swap_data = true;
+	}
+
 	lvds->companion = of_drm_find_bridge(companion);
 	if (!lvds->companion) {
 		ret = -EPROBE_DEFER;
 		goto done;
 	}
+	companion_lvds = bridge_to_rcar_lvds(lvds->companion);
+	companion_lvds->dual_link = lvds->dual_link;
 
 	dev_dbg(dev, "Found companion encoder %pOF\n", companion);
 
 done:
 	of_node_put(companion);
+	of_node_put(p0);
+	of_node_put(p1);
 
 	return ret;
 }
@@ -704,10 +755,7 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 {
 	struct device_node *local_output = NULL;
-	struct device_node *remote_input = NULL;
 	struct device_node *remote = NULL;
-	struct device_node *node;
-	bool is_bridge = false;
 	int ret = 0;
 
 	local_output = of_graph_get_endpoint_by_regs(lvds->dev->of_node, 1, 0);
@@ -735,45 +783,17 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 		goto done;
 	}
 
-	remote_input = of_graph_get_remote_endpoint(local_output);
-
-	for_each_endpoint_of_node(remote, node) {
-		if (node != remote_input) {
-			/*
-			 * We've found one endpoint other than the input, this
-			 * must be a bridge.
-			 */
-			is_bridge = true;
-			of_node_put(node);
-			break;
-		}
-	}
-
-	if (is_bridge) {
-		lvds->next_bridge = of_drm_find_bridge(remote);
-		if (!lvds->next_bridge) {
-			ret = -EPROBE_DEFER;
-			goto done;
-		}
-
-		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
-			lvds->dual_link = lvds->next_bridge->timings
-					? lvds->next_bridge->timings->dual_link
-					: false;
-	} else {
-		lvds->panel = of_drm_find_panel(remote);
-		if (IS_ERR(lvds->panel)) {
-			ret = PTR_ERR(lvds->panel);
-			goto done;
-		}
+	ret = drm_of_find_panel_or_bridge(lvds->dev->of_node, 1, 0,
+					  &lvds->panel, &lvds->next_bridge);
+	if (ret) {
+		ret = -EPROBE_DEFER;
+		goto done;
 	}
-
-	if (lvds->dual_link)
+	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
 		ret = rcar_lvds_parse_dt_companion(lvds);
 
 done:
 	of_node_put(local_output);
-	of_node_put(remote_input);
 	of_node_put(remote);
 
 	/*
-- 
2.7.4

