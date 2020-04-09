Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAEB11A2CE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 02:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgDIAgx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Apr 2020 20:36:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39508 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgDIAgx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 20:36:53 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B2B9B76;
        Thu,  9 Apr 2020 02:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586392611;
        bh=dIuh372jzYXzncChXgfk20Ez/UBFgtea7xive7cCeZI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MglICWq/haQu8Ta9lCuIU1Of7OvUHLp6hLUXBBVbk6kEGnhujMkn2xXtZJaZdXCLY
         dCkaENJO9ck85CfsLgKzBfdzOI3UiDQCumtUx1vu2MqakZ+jw1BhWTMhUtk+6/XaPH
         7G71cwM6NW4PjOqdSJI7MTjXnJ/+75GMZ4ENsZBE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/2] drm: bridge: simple-bridge: Make connector creation optional
Date:   Thu,  9 Apr 2020 03:36:36 +0300
Message-Id: <20200409003636.11792-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make the connector creation optional to enable usage of the
simple-bridge with the DRM bridge connector helper.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index bac223d0430d..bad638088029 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -101,16 +101,14 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
 	ret = drm_bridge_attach(bridge->encoder, sbridge->next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		return ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
 	if (!bridge->encoder) {
 		DRM_ERROR("Missing encoder\n");
 		return -ENODEV;
@@ -127,8 +125,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	drm_connector_attach_encoder(&sbridge->connector,
-					  bridge->encoder);
+	drm_connector_attach_encoder(&sbridge->connector, bridge->encoder);
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

