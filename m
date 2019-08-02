Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 405FB7ED8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 09:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389860AbfHBHfA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 03:35:00 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:17475 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389759AbfHBHe7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 03:34:59 -0400
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; 
   d="scan'208";a="23151164"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2019 16:34:58 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 72C0840078B4;
        Fri,  2 Aug 2019 16:34:55 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH/RFC 05/12] drm: rcar-du: lvds: Add data swap support
Date:   Fri,  2 Aug 2019 08:34:02 +0100
Message-Id: <1564731249-22671-6-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When in vertical stripe mode of operation, there is the option
of swapping even data and odd data on the two LVDS interfaces
used to drive the video output.
Add data swap support by exposing a new DT property named
"renesas,swap-data".

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 3aeaf9e..c306fab 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -69,6 +69,7 @@ struct rcar_lvds {
 
 	struct drm_bridge *companion;
 	bool dual_link;
+	bool stripe_swap_data;
 };
 
 #define bridge_to_rcar_lvds(bridge) \
@@ -439,12 +440,16 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
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
+			 */
+			lvdstripe = LVDSTRIPE_ST_ON | (lvds->stripe_swap_data ?
+						       LVDSTRIPE_ST_SWAP : 0);
+		rcar_lvds_write(lvds, LVDSTRIPE, lvdstripe);
 	}
 
 	/*
@@ -770,8 +775,12 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 		}
 	}
 
-	if (lvds->dual_link)
+	if (lvds->dual_link) {
+		lvds->stripe_swap_data = of_property_read_bool(
+						lvds->dev->of_node,
+						"renesas,swap-data");
 		ret = rcar_lvds_parse_dt_companion(lvds);
+	}
 
 done:
 	of_node_put(local_output);
-- 
2.7.4

