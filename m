Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1AE8E98D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 13:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbfHOLFZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 07:05:25 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:24976 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726008AbfHOLFY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 07:05:24 -0400
X-IronPort-AV: E=Sophos;i="5.64,388,1559487600"; 
   d="scan'208";a="24088321"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2019 20:05:23 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D83E1417763E;
        Thu, 15 Aug 2019 20:05:19 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 7/9] drm: rcar-du: lvds: Add dual-LVDS panels support
Date:   Thu, 15 Aug 2019 12:04:31 +0100
Message-Id: <1565867073-24746-8-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for dual-LVDS panels.

It's very important that we coordinate the efforts of both the
primary encoder and the companion encoder to get the right
picture on the panel, therefore this patch adds some code
to work out if even and odd pixels need swapping.
When the encoders are connected to a LVDS panel, the assumption
is that by default the panel expects even pixels (0, 2, 4, etc.)
on the first input port, and odd pixels (1, 3, 5, etc.) on the
seconds port. When DRM_LINK_DUAL_LVDS_ODD_EVEN is found among the
link flags, the display expects odd pixels on the first input
port, and even pixels on the second port. As a result, the way
the encoders are connected to the panel may trigger pixel (data)
swapping.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v1->v2:
* new patch, resulting from Laurent's feedback

 drivers/gpu/drm/rcar-du/rcar_lvds.c | 121 ++++++++++++++++++++++++------------
 1 file changed, 81 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 41d28f4..5c24884 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -22,6 +22,8 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_timings.h>
+#include <drm/drm_of.h>
 
 #include "rcar_lvds.h"
 #include "rcar_lvds_regs.h"
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
@@ -706,13 +717,31 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 	return ret;
 }
 
+static int rcar_lvds_get_remote_port_reg(struct device_node *np)
+{
+	struct device_node *endpoint_node, *remote_endpoint;
+	struct of_endpoint endpoint;
+
+	endpoint_node = of_graph_get_endpoint_by_regs(np, 1, 0);
+	if (!endpoint_node)
+		return -ENODEV;
+	remote_endpoint = of_graph_get_remote_endpoint(endpoint_node);
+	if (!remote_endpoint) {
+		of_node_put(endpoint_node);
+		return -ENODEV;
+	}
+	of_graph_parse_endpoint(remote_endpoint, &endpoint);
+	of_node_put(endpoint_node);
+	of_node_put(remote_endpoint);
+
+	return endpoint.port;
+}
+
 static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 {
 	struct device_node *local_output = NULL;
-	struct device_node *remote_input = NULL;
 	struct device_node *remote = NULL;
-	struct device_node *node;
-	bool is_bridge = false;
+	const struct drm_timings *timings = NULL;
 	int ret = 0;
 
 	local_output = of_graph_get_endpoint_by_regs(lvds->dev->of_node, 1, 0);
@@ -740,45 +769,57 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 		goto done;
 	}
 
-	remote_input = of_graph_get_remote_endpoint(local_output);
+	ret = drm_of_find_panel_or_bridge(lvds->dev->of_node, 1, 0,
+					  &lvds->panel, &lvds->next_bridge);
+	if (ret) {
+		ret = -EPROBE_DEFER;
+		goto done;
+	}
+	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
+		if (lvds->next_bridge)
+			timings = lvds->next_bridge->timings;
+		else
+			timings = lvds->panel->timings;
+		if (timings)
+			lvds->dual_link = timings->dual_link;
+	}
 
-	for_each_endpoint_of_node(remote, node) {
-		if (node != remote_input) {
+	if (lvds->dual_link) {
+		ret = rcar_lvds_parse_dt_companion(lvds);
+		if (lvds->companion && timings) {
+			int our_port, comp_port;
+			bool odd_even_flag = timings->link_flags &
+						DRM_LINK_DUAL_LVDS_ODD_EVEN;
+			our_port = rcar_lvds_get_remote_port_reg(
+						lvds->dev->of_node);
+			if (our_port < 0) {
+				ret = our_port;
+				goto done;
+			}
+			comp_port = rcar_lvds_get_remote_port_reg(
+						lvds->companion->of_node);
+			if (comp_port < 0) {
+				ret = comp_port;
+				goto done;
+			}
 			/*
-			 * We've found one endpoint other than the input, this
-			 * must be a bridge.
+			 * We need to match the port where we generate even
+			 * pixels (0, 2, 4, etc.) to the port where the sink
+			 * expects to receive even pixels, same thing for the
+			 * odd pixels. Swap the generation of even and odd
+			 * pixels if the connection requires it.
+			 * By default (when DRM_LINK_DUAL_LVDS_ODD_EVEN is not
+			 * specified) the sink expects even pixels on the
+			 * first input port, and odd pixels on the second port.
 			 */
-			is_bridge = true;
-			of_node_put(node);
-			break;
+			if (((comp_port - our_port > 0) &&  odd_even_flag) ||
+			    ((comp_port - our_port < 0) && !odd_even_flag))
+				lvds->stripe_swap_data = true;
 		}
 	}
 
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
-	}
-
-	if (lvds->dual_link)
-		ret = rcar_lvds_parse_dt_companion(lvds);
-
 done:
 	of_node_put(local_output);
-	of_node_put(remote_input);
 	of_node_put(remote);
 
 	/*
-- 
2.7.4

