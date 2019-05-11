Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 779F51A97F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 23:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfEKVHh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 17:07:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfEKVHg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 17:07:36 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9799E566;
        Sat, 11 May 2019 23:07:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557608852;
        bh=k81gJ3JX8bwz5zTp2hTgPa7GB6NcxEhphY8+UZhShwc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S9c8zcSqPbxaDg0WRrCaDSNZZX3NeX0Dt+21aI13bvVqk5XOTTeWlSFIgPi/4GQpR
         x+B55oLIYYqzA3KaAY8Nrn95BqSro7Cc5azAUnDhWSJynOcIvYO71mf7kJWwDsAflZ
         cEUUsT2KB4IXLjqQCI0JOCLwcgOeVFsJBAJ2qzQA=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 03/10] drm: bridge: thc63: Report input bus mode through bridge timings
Date:   Sun, 12 May 2019 00:06:55 +0300
Message-Id: <20190511210702.18394-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Set a drm_bridge_timings in the drm_bridge, and use it to report the
input bus mode (single-link or dual-link). The other fields of the
timings structure are kept to 0 as they do not apply to LVDS buses.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Ignore disabled remote device
---
 drivers/gpu/drm/bridge/thc63lvd1024.c | 54 +++++++++++++++++++++------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index b083a740565c..709dd28b43d6 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -31,6 +31,8 @@ struct thc63_dev {
 
 	struct drm_bridge bridge;
 	struct drm_bridge *next;
+
+	struct drm_bridge_timings timings;
 };
 
 static inline struct thc63_dev *to_thc63(struct drm_bridge *bridge)
@@ -48,15 +50,28 @@ static int thc63_attach(struct drm_bridge *bridge)
 static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
 					const struct drm_display_mode *mode)
 {
+	struct thc63_dev *thc63 = to_thc63(bridge);
+	unsigned int min_freq;
+	unsigned int max_freq;
+
 	/*
-	 * The THC63LVD1024 clock frequency range is 8 to 135 MHz in single-in
-	 * mode. Note that the limits are different in dual-in, single-out mode,
-	 * and will need to be adjusted accordingly.
+	 * The THC63LVD1024 pixel rate range is 8 to 135 MHz in all modes but
+	 * dual-in, single-out where it is 40 to 150 MHz. As dual-in, dual-out
+	 * isn't supported by the driver yet, simply derive the limits from the
+	 * input mode.
 	 */
-	if (mode->clock < 8000)
+	if (thc63->timings.dual_link) {
+		min_freq = 40000;
+		max_freq = 150000;
+	} else {
+		min_freq = 8000;
+		max_freq = 135000;
+	}
+
+	if (mode->clock < min_freq)
 		return MODE_CLOCK_LOW;
 
-	if (mode->clock > 135000)
+	if (mode->clock > max_freq)
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
@@ -101,19 +116,19 @@ static const struct drm_bridge_funcs thc63_bridge_func = {
 
 static int thc63_parse_dt(struct thc63_dev *thc63)
 {
-	struct device_node *thc63_out;
+	struct device_node *endpoint;
 	struct device_node *remote;
 
-	thc63_out = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
-						  THC63_RGB_OUT0, -1);
-	if (!thc63_out) {
+	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
+						 THC63_RGB_OUT0, -1);
+	if (!endpoint) {
 		dev_err(thc63->dev, "Missing endpoint in port@%u\n",
 			THC63_RGB_OUT0);
 		return -ENODEV;
 	}
 
-	remote = of_graph_get_remote_port_parent(thc63_out);
-	of_node_put(thc63_out);
+	remote = of_graph_get_remote_port_parent(endpoint);
+	of_node_put(endpoint);
 	if (!remote) {
 		dev_err(thc63->dev, "Endpoint in port@%u unconnected\n",
 			THC63_RGB_OUT0);
@@ -132,6 +147,22 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
 	if (!thc63->next)
 		return -EPROBE_DEFER;
 
+	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
+						 THC63_LVDS_IN1, -1);
+	if (endpoint) {
+		remote = of_graph_get_remote_port_parent(endpoint);
+		of_node_put(endpoint);
+
+		if (remote) {
+			if (of_device_is_available(remote))
+				thc63->timings.dual_link = true;
+			of_node_put(remote);
+		}
+	}
+
+	dev_dbg(thc63->dev, "operating in %s-link mode\n",
+		thc63->timings.dual_link ? "dual" : "single");
+
 	return 0;
 }
 
@@ -188,6 +219,7 @@ static int thc63_probe(struct platform_device *pdev)
 	thc63->bridge.driver_private = thc63;
 	thc63->bridge.of_node = pdev->dev.of_node;
 	thc63->bridge.funcs = &thc63_bridge_func;
+	thc63->bridge.timings = &thc63->timings;
 
 	drm_bridge_add(&thc63->bridge);
 
-- 
Regards,

Laurent Pinchart

