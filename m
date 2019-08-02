Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 480F37ED8E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 09:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732639AbfHBHfF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 03:35:05 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12517 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389759AbfHBHfF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 03:35:05 -0400
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; 
   d="scan'208";a="22931978"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Aug 2019 16:35:03 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 308E94007528;
        Fri,  2 Aug 2019 16:34:59 +0900 (JST)
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
Subject: [PATCH/RFC 06/12] drm: rcar-du: lvds: Do not look at ports for identifying bridges
Date:   Fri,  2 Aug 2019 08:34:03 +0100
Message-Id: <1564731249-22671-7-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We may be connected to a dual LVDS display, therefore checking
if node != remote_input for identifying bridges is not going to
work anymore.
We could try to match the ports on the remote end to the LVDS
encoders, however the companion LVDS encoder instance doesn't
hold a reference to the primary LVDS encoder instance.
We know we could be connected to either a bridge, or a panel,
therefore look through the registered bridges and panels, until
we have a match.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 29 +++--------------------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index c306fab..2d54ae5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -711,10 +711,7 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 {
 	struct device_node *local_output = NULL;
-	struct device_node *remote_input = NULL;
 	struct device_node *remote = NULL;
-	struct device_node *node;
-	bool is_bridge = false;
 	int ret = 0;
 
 	local_output = of_graph_get_endpoint_by_regs(lvds->dev->of_node, 1, 0);
@@ -742,27 +739,8 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
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
+	lvds->next_bridge = of_drm_find_bridge(remote);
+	if (lvds->next_bridge) {
 		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
 			lvds->dual_link = lvds->next_bridge->timings
 					? lvds->next_bridge->timings->dual_link
@@ -770,7 +748,7 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 	} else {
 		lvds->panel = of_drm_find_panel(remote);
 		if (IS_ERR(lvds->panel)) {
-			ret = PTR_ERR(lvds->panel);
+			ret = -EPROBE_DEFER;
 			goto done;
 		}
 	}
@@ -784,7 +762,6 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 
 done:
 	of_node_put(local_output);
-	of_node_put(remote_input);
 	of_node_put(remote);
 
 	switch (ret) {
-- 
2.7.4

