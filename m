Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A81E1E18DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 03:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388233AbgEZBPy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 21:15:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54224 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388433AbgEZBPy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 21:15:54 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4B4711B7;
        Tue, 26 May 2020 03:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590455750;
        bh=g8/bRWdNqpK/smRa8wnMeUUVu+kPnhSkz07JMdGqvdc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aHWO3urs+w348hE5ULvERFibVfJyduayiAmNJ3QxYgboq04el66zBTnPA69eNPTRA
         663DpPbhvZYJG9XUOP3GOHrom8i8uKPJ8n1DqzbV+QThtxsV0a8J/9v5AQEKlWlaCT
         LJTJxcJEOSFmSA54rk3HC/vWlJLsBPnDVySEU+Y8=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 26/27] drm: rcar-du: Use drm_bridge_connector_init() helper
Date:   Tue, 26 May 2020 04:15:04 +0300
Message-Id: <20200526011505.31884-27-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the drm_bridge_connector_init() helper to create a drm_connector for
each output, instead of relying on the bridge drivers doing so. Attach
the bridges with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to instruct
them not to create a connector.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 72bf6e2c7933..f6981e6444bc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -10,6 +10,7 @@
 #include <linux/export.h>
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
@@ -49,6 +50,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 struct device_node *enc_node)
 {
 	struct rcar_du_encoder *renc;
+	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_bridge *bridge;
 	int ret;
@@ -109,17 +111,26 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	if (ret < 0)
 		goto done;
 
-	/*
-	 * Attach the bridge to the encoder. The bridge will create the
-	 * connector.
-	 */
-	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+	/* Attach the bridge to the encoder. */
+	ret = drm_bridge_attach(encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		dev_err(rcdu->dev, "failed to attach bridge for output %u\n",
 			output);
 		goto done;
 	}
 
+	/* Create the connector for the chain of bridges. */
+	connector = drm_bridge_connector_init(rcdu->ddev, encoder);
+	if (IS_ERR(connector)) {
+		dev_err(rcdu->dev,
+			"failed to created connector for output %u\n", output);
+		ret = PTR_ERR(connector);
+		goto done;
+	}
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+
 done:
 	if (ret < 0) {
 		if (encoder->name)
-- 
Regards,

Laurent Pinchart

