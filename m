Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09D82DA216
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 21:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503440AbgLNUyc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 15:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503439AbgLNUyc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 15:54:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A13C0617A6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Dec 2020 12:53:09 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BEF614C1;
        Mon, 14 Dec 2020 21:52:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607979141;
        bh=8mrDJRgQ9P1MMDHh1ZFHaSmyf9vWkuxPhEyk9A4BI/I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=elwzjRT3plEKLMVQXcoPIn5/M9A3kYnTeSOtF0gIA8I2yFQzmPdttoGr8bA9EbhhQ
         lJW0Uh462zNkcmLze5IlUv/ZdU8IjyiBTS2IY8MBB8+NsCcwDH28bDm4yXQ5kz8+FW
         Xt4dlO9IlLiiPJxfH2RRj2GVghRxu69WHZJeZxaE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 8/9] drm: rcar-du: Skip encoder allocation for LVDS1 in dual-link mode
Date:   Mon, 14 Dec 2020 22:52:07 +0200
Message-Id: <20201214205208.10248-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The rcar-du driver skips registration of the encoder for the LVDS1
output when LVDS is used in dual-link mode, as the LVDS0 and LVDS1 links
are bundled and handled through the LVDS0 output. It however still
allocates the encoder and immediately destroys it, which is pointless.
Skip allocation of the encoder altogether in that case.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes since v1:

- Drop error label
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 59 ++++++++++-------------
 1 file changed, 25 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 3afaf106d750..0d873f4b42dc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -65,16 +65,6 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	struct drm_bridge *bridge;
 	int ret;
 
-	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
-	if (renc == NULL)
-		return -ENOMEM;
-
-	renc->output = output;
-	encoder = rcar_encoder_to_drm_encoder(renc);
-
-	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
-		enc_node, output);
-
 	/*
 	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
 	 * DT node has a single port, assume that it describes a panel and
@@ -85,23 +75,17 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	    rcar_du_encoder_count_ports(enc_node) == 1) {
 		struct drm_panel *panel = of_drm_find_panel(enc_node);
 
-		if (IS_ERR(panel)) {
-			ret = PTR_ERR(panel);
-			goto error;
-		}
+		if (IS_ERR(panel))
+			return PTR_ERR(panel);
 
 		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
-		if (IS_ERR(bridge)) {
-			ret = PTR_ERR(bridge);
-			goto error;
-		}
+		if (IS_ERR(bridge))
+			return PTR_ERR(bridge);
 	} else {
 		bridge = of_drm_find_bridge(enc_node);
-		if (!bridge) {
-			ret = -EPROBE_DEFER;
-			goto error;
-		}
+		if (!bridge)
+			return -EPROBE_DEFER;
 
 		if (output == RCAR_DU_OUTPUT_LVDS0 ||
 		    output == RCAR_DU_OUTPUT_LVDS1)
@@ -109,20 +93,31 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	}
 
 	/*
-	 * On Gen3 skip the LVDS1 output if the LVDS1 encoder is used as a
-	 * companion for LVDS0 in dual-link mode.
+	 * Create and initialize the encoder. On Gen3 skip the LVDS1 output if
+	 * the LVDS1 encoder is used as a companion for LVDS0 in dual-link
+	 * mode.
 	 */
 	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
-		if (rcar_lvds_dual_link(bridge)) {
-			ret = -ENOLINK;
-			goto error;
-		}
+		if (rcar_lvds_dual_link(bridge))
+			return -ENOLINK;
 	}
 
+	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
+	if (renc == NULL)
+		return -ENOMEM;
+
+	renc->output = output;
+	encoder = rcar_encoder_to_drm_encoder(renc);
+
+	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
+		enc_node, output);
+
 	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_encoder_funcs,
 			       DRM_MODE_ENCODER_NONE, NULL);
-	if (ret < 0)
-		goto error;
+	if (ret < 0) {
+		kfree(renc);
+		return ret;
+	}
 
 	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_encoder_release,
 				       renc);
@@ -134,8 +129,4 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	 * connector.
 	 */
 	return drm_bridge_attach(encoder, bridge, NULL, 0);
-
-error:
-	kfree(renc);
-	return ret;
 }
-- 
Regards,

Laurent Pinchart

