Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7E92DA214
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 21:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503450AbgLNUyb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 15:54:31 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52032 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503440AbgLNUxx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 15:53:53 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6F2C2CF;
        Mon, 14 Dec 2020 21:52:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607979142;
        bh=ynxd65l5Ztko8Y76wzHY2DHS3BX+EbY9UUe3TR/7HLU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DYWOm+Pkw+1A+yK4QeK/3Yft4Pq6vjX9maEGhGZKH6TvGpu072ojwqrMQTV652AUf
         LDgwngQWRubGSPu2g1Zsx4DQ+E8YhQ7yaqTTbefwktAFukJPv2IJ9PlSWZSXsw6/Pg
         8Q/c2Bt0KTeKDnU5F9ucdpS/juRFc4WJRJyGQoKE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 9/9] drm: rcar-du: Drop local encoder variable
Date:   Mon, 14 Dec 2020 22:52:08 +0200
Message-Id: <20201214205208.10248-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The local encoder variable is an alias for &renc->base, and is only use
twice. It doesn't help much, drop it, along with the
rcar_encoder_to_drm_encoder() macro that is then unused.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 6 ++----
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h | 2 --
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 0d873f4b42dc..ba8c6038cd63 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -61,7 +61,6 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 struct device_node *enc_node)
 {
 	struct rcar_du_encoder *renc;
-	struct drm_encoder *encoder;
 	struct drm_bridge *bridge;
 	int ret;
 
@@ -107,12 +106,11 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		return -ENOMEM;
 
 	renc->output = output;
-	encoder = rcar_encoder_to_drm_encoder(renc);
 
 	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
 		enc_node, output);
 
-	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_encoder_funcs,
+	ret = drm_encoder_init(&rcdu->ddev, &renc->base, &rcar_du_encoder_funcs,
 			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0) {
 		kfree(renc);
@@ -128,5 +126,5 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	 * Attach the bridge to the encoder. The bridge will create the
 	 * connector.
 	 */
-	return drm_bridge_attach(encoder, bridge, NULL, 0);
+	return drm_bridge_attach(&renc->base, bridge, NULL, 0);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index df9be4524301..73560563fb31 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -22,8 +22,6 @@ struct rcar_du_encoder {
 #define to_rcar_encoder(e) \
 	container_of(e, struct rcar_du_encoder, base)
 
-#define rcar_encoder_to_drm_encoder(e)	(&(e)->base)
-
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node);
-- 
Regards,

Laurent Pinchart

