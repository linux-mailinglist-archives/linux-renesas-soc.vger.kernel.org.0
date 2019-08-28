Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 800D0A09AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 20:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbfH1ShR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 14:37:17 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:43079 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727069AbfH1ShQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 14:37:16 -0400
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; 
   d="scan'208";a="24947702"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 Aug 2019 03:37:13 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4895B4004953;
        Thu, 29 Aug 2019 03:37:09 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, sam@ravnborg.org
Subject: [PATCH v3 5/8] drm: bridge: thc63: Do not report input bus mode through bridge timings
Date:   Wed, 28 Aug 2019 19:36:39 +0100
Message-Id: <1567017402-5895-6-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

No need to report the input bus mode through bridge timings
anymore, that's now done through the DT, as specified by the
dt-bindings.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v2->v3:
* new patch
---
 drivers/gpu/drm/bridge/thc63lvd1024.c | 9 ++++-----
 include/drm/drm_bridge.h              | 8 --------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index 3d74129b..730f682 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -34,7 +34,7 @@ struct thc63_dev {
 	struct drm_bridge bridge;
 	struct drm_bridge *next;
 
-	struct drm_bridge_timings timings;
+	bool dual_link;
 };
 
 static inline struct thc63_dev *to_thc63(struct drm_bridge *bridge)
@@ -62,7 +62,7 @@ static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
 	 * isn't supported by the driver yet, simply derive the limits from the
 	 * input mode.
 	 */
-	if (thc63->timings.dual_link) {
+	if (thc63->dual_link) {
 		min_freq = 40000;
 		max_freq = 150000;
 	} else {
@@ -157,13 +157,13 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
 
 		if (remote) {
 			if (of_device_is_available(remote))
-				thc63->timings.dual_link = true;
+				thc63->dual_link = true;
 			of_node_put(remote);
 		}
 	}
 
 	dev_dbg(thc63->dev, "operating in %s-link mode\n",
-		thc63->timings.dual_link ? "dual" : "single");
+		thc63->dual_link ? "dual" : "single");
 
 	return 0;
 }
@@ -221,7 +221,6 @@ static int thc63_probe(struct platform_device *pdev)
 	thc63->bridge.driver_private = thc63;
 	thc63->bridge.of_node = pdev->dev.of_node;
 	thc63->bridge.funcs = &thc63_bridge_func;
-	thc63->bridge.timings = &thc63->timings;
 
 	drm_bridge_add(&thc63->bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 7616f65..3228018 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -362,14 +362,6 @@ struct drm_bridge_timings {
 	 * input signal after the clock edge.
 	 */
 	u32 hold_time_ps;
-	/**
-	 * @dual_link:
-	 *
-	 * True if the bus operates in dual-link mode. The exact meaning is
-	 * dependent on the bus type. For LVDS buses, this indicates that even-
-	 * and odd-numbered pixels are received on separate links.
-	 */
-	bool dual_link;
 };
 
 /**
-- 
2.7.4

