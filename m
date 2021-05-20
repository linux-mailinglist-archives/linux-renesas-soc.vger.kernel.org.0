Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA56D389E43
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 May 2021 08:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbhETGwR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 May 2021 02:52:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35674 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhETGwR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 May 2021 02:52:17 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA75BE0C;
        Thu, 20 May 2021 08:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621493455;
        bh=EGZEdkoUZi5SbGzCp812RFJqbdXrCIa1P1uZ3KuRAHc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YemBHZyOCsZTYmTEv5pX/iqpmfO2XDtF19E5fxO4XHz014UQMTqzssuUw3gkG1nkR
         0Zz35xDp8bhXiO5NvVpDMacz4R5z9oIInFUlpf4BXRXEljwTo97qNDYxjmRfUXfETB
         o2Xf8qoX8KQnqR17meeFV9qt3hVF/xv9kSGJ14g0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 4/4] drm: rcar-du: Use drm_bridge_connector_init() helper
Date:   Thu, 20 May 2021 09:50:46 +0300
Message-Id: <20210520065046.28978-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
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
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Changes since v2:

- Declare ret variable
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 26 ++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index ca3761772211..0daa8bba50f5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
@@ -53,7 +54,9 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 struct device_node *enc_node)
 {
 	struct rcar_du_encoder *renc;
+	struct drm_connector *connector;
 	struct drm_bridge *bridge;
+	int ret;
 
 	/*
 	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
@@ -103,9 +106,22 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 
 	renc->output = output;
 
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

