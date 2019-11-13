Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 900DAFB438
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 16:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfKMPwR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 10:52:17 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:29184 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728028AbfKMPwR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 10:52:17 -0500
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; 
   d="scan'208";a="31593928"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:16 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C040E400EE7D;
        Thu, 14 Nov 2019 00:52:11 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v4 07/13] drm/bridge: lvds-codec: Simplify panel DT node localisation
Date:   Wed, 13 Nov 2019 15:51:26 +0000
Message-Id: <1573660292-10629-8-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The probe function needs to get ahold of the panel device tree
node, and it achieves that by using a combination of
of_graph_get_port_by_id, of_get_child_by_name, and
of_graph_get_remote_port_parent. We can achieve the same goal
by replacing those calls with a call to of_graph_get_remote_node
these days.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v3->v4:
* New patch
---
 drivers/gpu/drm/bridge/lvds-codec.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index c32e125..784bbd3 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -57,8 +57,6 @@ static struct drm_bridge_funcs funcs = {
 static int lvds_codec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *port;
-	struct device_node *endpoint;
 	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
@@ -79,23 +77,9 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	}
 
 	/* Locate the panel DT node. */
-	port = of_graph_get_port_by_id(dev->of_node, 1);
-	if (!port) {
-		dev_dbg(dev, "port 1 not found\n");
-		return -ENXIO;
-	}
-
-	endpoint = of_get_child_by_name(port, "endpoint");
-	of_node_put(port);
-	if (!endpoint) {
-		dev_dbg(dev, "no endpoint for port 1\n");
-		return -ENXIO;
-	}
-
-	panel_node = of_graph_get_remote_port_parent(endpoint);
-	of_node_put(endpoint);
+	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);
 	if (!panel_node) {
-		dev_dbg(dev, "no remote endpoint for port 1\n");
+		dev_dbg(dev, "panel DT node not found\n");
 		return -ENXIO;
 	}
 
-- 
2.7.4

