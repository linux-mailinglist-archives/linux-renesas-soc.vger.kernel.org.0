Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D84A2DB801
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 01:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgLPAv4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 19:51:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgLPAvz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 19:51:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13BAC061793
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Dec 2020 16:51:15 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A088D95;
        Wed, 16 Dec 2020 01:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608079832;
        bh=lsoHVe4tePe5S30+UZ7AFMTvL8M0aFLZnLxaRmvrdWQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gw0JnK5iubpEt8Wlg+tdwK2B02eXU6hphJN0oF9M/2dqr/2YJOoGtPmOn7SWjzwyW
         Op0WRSNCEdhjAw1zuUHghvNf/KVppwz5MvE4NMrCkLMPkZYt5HiNUi71MPDrY69xRq
         51rYpTIur/qkBlTJB+txDTgCE9x3pdSF7KxNceUc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 4/4] drm: rcar-du: Use drm_bridge_connector_init() helper
Date:   Wed, 16 Dec 2020 02:50:21 +0200
Message-Id: <20201216005021.19518-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the drm_bridge_connector_init() helper to create a drm_connector for
each output, instead of relying on the bridge drivers doing so. Attach
the bridges with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to instruct
them not to create a connector.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 25 ++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index ba8c6038cd63..10a66091391a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
@@ -61,6 +62,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 struct device_node *enc_node)
 {
 	struct rcar_du_encoder *renc;
+	struct drm_connector *connector;
 	struct drm_bridge *bridge;
 	int ret;
 
@@ -122,9 +124,22 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	if (ret)
 		return ret;
 
-	/*
-	 * Attach the bridge to the encoder. The bridge will create the
-	 * connector.
-	 */
-	return drm_bridge_attach(&renc->base, bridge, NULL, 0);
+	/* Attach the bridge to the encoder. */
+	ret = drm_bridge_attach(&renc->base, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err(rcdu->dev, "failed to attach bridge for output %u\n",
+			output);
+		return ret;
+	}
+
+	/* Create the connector for the chain of bridges. */
+	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
+	if (IS_ERR(connector)) {
+		dev_err(rcdu->dev,
+			"failed to created connector for output %u\n", output);
+		return PTR_ERR(connector);
+	}
+
+	return drm_connector_attach_encoder(connector, &renc->base);
 }
-- 
Regards,

Laurent Pinchart

