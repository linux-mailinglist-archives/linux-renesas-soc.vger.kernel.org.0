Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C513C11556D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 17:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbfLFQd2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 11:33:28 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:18450 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726258AbfLFQd2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 11:33:28 -0500
X-IronPort-AV: E=Sophos;i="5.69,285,1571670000"; 
   d="scan'208";a="33477370"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Dec 2019 01:33:26 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EAAEA400D4D7;
        Sat,  7 Dec 2019 01:33:20 +0900 (JST)
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
Subject: [PATCH v4 4/7] drm: rcar-du: lvds: Allow for even and odd pixels swap
Date:   Fri,  6 Dec 2019 16:32:51 +0000
Message-Id: <1575649974-31472-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DT properties dual-lvds-even-pixels and dual-lvds-odd-pixels
can be used to work out if the driver needs to swap even
and odd pixels around.

This patch makes use of the return value from function
drm_of_lvds_get_dual_link_pixel_order to determine if we
need to swap odd and even pixels around for things to work
properly.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v3->v4:
* New patch extracted from patch:
  "drm: rcar-du: lvds: Add dual-LVDS panels support"
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 46 +++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 6c1f171..cb2147c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -71,6 +71,7 @@ struct rcar_lvds {
 
 	struct drm_bridge *companion;
 	bool dual_link;
+	bool stripe_swap_data;
 };
 
 #define bridge_to_rcar_lvds(b) \
@@ -441,12 +442,20 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
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
@@ -702,17 +711,33 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 	dual_link = drm_of_lvds_get_dual_link_pixel_order(p0, p1);
 	of_node_put(p0);
 	of_node_put(p1);
-	if (dual_link >= DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
+
+	switch (dual_link) {
+	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
+		/*
+		 * By default we generate even pixels from this encoder and odd
+		 * pixels from the companion encoder, but since p0 is connected
+		 * to the port expecting ood pixels, and p1 is connected to the
+		 * port expecting even pixels, we need to swap even and odd
+		 * pixels around.
+		 */
+		lvds->stripe_swap_data = true;
+		lvds->dual_link = true;
+		break;
+	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
 		lvds->dual_link = true;
-	} else if (lvds->next_bridge && lvds->next_bridge->timings) {
+		break;
+	default:
 		/*
 		 * Early dual-link bridge specific implementations populate the
 		 * timings field of drm_bridge, read the dual_link flag off the
 		 * bridge directly for backward compatibility.
 		 */
-		lvds->dual_link = lvds->next_bridge->timings->dual_link;
+		if (lvds->next_bridge && lvds->next_bridge->timings)
+			lvds->dual_link = lvds->next_bridge->timings->dual_link;
 	}
 
+
 	if (!lvds->dual_link) {
 		dev_dbg(dev, "Single-link configuration detected\n");
 		goto done;
@@ -728,6 +753,9 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 		"Dual-link configuration detected (companion encoder %pOF)\n",
 		companion);
 
+	if (lvds->stripe_swap_data)
+		dev_dbg(dev, "Data swapping required\n");
+
 	companion_lvds = bridge_to_rcar_lvds(lvds->companion);
 
 	/*
-- 
2.7.4

