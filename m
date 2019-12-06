Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F069B115568
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 17:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfLFQdV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 11:33:21 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:55948 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726258AbfLFQdV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 11:33:21 -0500
X-IronPort-AV: E=Sophos;i="5.69,285,1571670000"; 
   d="scan'208";a="33693117"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Dec 2019 01:33:20 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2DA3B400D0EC;
        Sat,  7 Dec 2019 01:33:14 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ebiharaml@si-linux.co.jp
Subject: [PATCH v4 3/7] drm: rcar-du: lvds: Get dual link configuration from DT
Date:   Fri,  6 Dec 2019 16:32:50 +0000
Message-Id: <1575649974-31472-4-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For dual-LVDS configurations, it is now possible to mark the
DT port nodes for the sink with boolean properties (like
dual-lvds-even-pixels and dual-lvds-odd-pixels) to let drivers
know the encoders need to be configured in dual-LVDS mode.

Rework the implementation of rcar_lvds_parse_dt_companion
to make use of the DT markers while keeping backward
compatibility.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v3->v4:
* New patch extracted from patch:
  "drm: rcar-du: lvds: Add dual-LVDS panels support"
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 56 +++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 3cb0a83..6c1f171 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -669,8 +669,10 @@ EXPORT_SYMBOL_GPL(rcar_lvds_dual_link);
 static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 {
 	const struct of_device_id *match;
-	struct device_node *companion;
+	struct device_node *companion, *p0, *p1;
+	struct rcar_lvds *companion_lvds;
 	struct device *dev = lvds->dev;
+	int dual_link;
 	int ret = 0;
 
 	/* Locate the companion LVDS encoder for dual-link operation, if any. */
@@ -689,13 +691,55 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 		goto done;
 	}
 
+	/*
+	 * We need to work out if the sink is expecting us to function in
+	 * dual-link mode. We do this by looking at the DT port nodes we are
+	 * connected to, if they are marked as expecting even pixels and
+	 * odd pixels than we need to enable vertical stripe output.
+	 */
+	p0 = of_graph_get_port_by_id(dev->of_node, 1);
+	p1 = of_graph_get_port_by_id(companion, 1);
+	dual_link = drm_of_lvds_get_dual_link_pixel_order(p0, p1);
+	of_node_put(p0);
+	of_node_put(p1);
+	if (dual_link >= DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
+		lvds->dual_link = true;
+	} else if (lvds->next_bridge && lvds->next_bridge->timings) {
+		/*
+		 * Early dual-link bridge specific implementations populate the
+		 * timings field of drm_bridge, read the dual_link flag off the
+		 * bridge directly for backward compatibility.
+		 */
+		lvds->dual_link = lvds->next_bridge->timings->dual_link;
+	}
+
+	if (!lvds->dual_link) {
+		dev_dbg(dev, "Single-link configuration detected\n");
+		goto done;
+	}
+
 	lvds->companion = of_drm_find_bridge(companion);
 	if (!lvds->companion) {
 		ret = -EPROBE_DEFER;
 		goto done;
 	}
 
-	dev_dbg(dev, "Found companion encoder %pOF\n", companion);
+	dev_dbg(dev,
+		"Dual-link configuration detected (companion encoder %pOF)\n",
+		companion);
+
+	companion_lvds = bridge_to_rcar_lvds(lvds->companion);
+
+	/*
+	 * FIXME: We should not be messing with the companion encoder private
+	 * data from the primary encoder, we should rather let the companion
+	 * encoder work things out on its own. However, the companion encoder
+	 * doesn't hold a reference to the primary encoder, and
+	 * drm_of_lvds_get_dual_link_pixel_order needs to be given references
+	 * to the output ports of both encoders, therefore leave it like this
+	 * for the time being.
+	 */
+	companion_lvds->dual_link = true;
 
 done:
 	of_node_put(companion);
@@ -739,13 +783,7 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 	if (ret)
 		goto done;
 
-	if ((lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) &&
-	    lvds->next_bridge)
-		lvds->dual_link = lvds->next_bridge->timings
-				? lvds->next_bridge->timings->dual_link
-				: false;
-
-	if (lvds->dual_link)
+	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
 		ret = rcar_lvds_parse_dt_companion(lvds);
 
 done:
-- 
2.7.4

