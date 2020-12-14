Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711A62DA208
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 21:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgLNUxN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 15:53:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51944 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733110AbgLNUxC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 15:53:02 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D42072C2;
        Mon, 14 Dec 2020 21:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607979138;
        bh=UARpDkXF/Qf5TotV3LPNwK86lbTfZ1fCb5p92srvO8s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KjH2Hna3LI1LaUFRSOdDlsNgOlcvPsaIdA53jk98d8DblcJILZUDgTjiAo+ZNwvYr
         YbDWbdLhuRHy0dZ9I6toayao3xca9f50mvpdG8XcYGitbSp/mRScEdDlTt9VH3+lCS
         uoIoZhZTBKO6x3HmeScP2HI5clNXddf6XKGy0EbU=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 1/9] drm: rcar-du: Fix crash when using LVDS1 clock for CRTC
Date:   Mon, 14 Dec 2020 22:52:00 +0200
Message-Id: <20201214205208.10248-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On D3 and E3 platforms, the LVDS encoder includes a PLL that can
generate a clock for the corresponding CRTC, used even when the CRTC
output to a non-LVDS port. This mechanism is supported by the driver,
but the implementation is broken in dual-link LVDS mode. In that case,
the LVDS1 drm_encoder is skipped, which causes a crash when trying to
access its bridge later on.

Fix this by storing bridge pointers internally instead of retrieving
them from the encoder. The rcar_du_device encoders field isn't used
anymore and can be dropped.

Fixes: 8e8fddab0d0a ("drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes since v1:

- Drop rcar_du_device.encoders field
- Add Fixes: tag
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 10 ++--------
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  6 +++---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  5 ++++-
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index b5fb941e0f53..e23b9c7b4afe 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -730,13 +730,10 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	 */
 	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
 	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
-		struct rcar_du_encoder *encoder =
-			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0 + rcrtc->index];
+		struct drm_bridge *bridge = rcdu->lvds[rcrtc->index];
 		const struct drm_display_mode *mode =
 			&crtc->state->adjusted_mode;
-		struct drm_bridge *bridge;
 
-		bridge = drm_bridge_chain_get_first_bridge(&encoder->base);
 		rcar_lvds_clk_enable(bridge, mode->clock * 1000);
 	}
 
@@ -764,15 +761,12 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
 	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
-		struct rcar_du_encoder *encoder =
-			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0 + rcrtc->index];
-		struct drm_bridge *bridge;
+		struct drm_bridge *bridge = rcdu->lvds[rcrtc->index];
 
 		/*
 		 * Disable the LVDS clock output, see
 		 * rcar_du_crtc_atomic_enable().
 		 */
-		bridge = drm_bridge_chain_get_first_bridge(&encoder->base);
 		rcar_lvds_clk_disable(bridge);
 	}
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 61504c54e2ec..3597a179bfb7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -20,10 +20,10 @@
 
 struct clk;
 struct device;
+struct drm_bridge;
 struct drm_device;
 struct drm_property;
 struct rcar_du_device;
-struct rcar_du_encoder;
 
 #define RCAR_DU_FEATURE_CRTC_IRQ_CLOCK	BIT(0)	/* Per-CRTC IRQ and clock */
 #define RCAR_DU_FEATURE_VSP1_SOURCE	BIT(1)	/* Has inputs from VSP1 */
@@ -71,6 +71,7 @@ struct rcar_du_device_info {
 #define RCAR_DU_MAX_CRTCS		4
 #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
 #define RCAR_DU_MAX_VSPS		4
+#define RCAR_DU_MAX_LVDS		2
 
 struct rcar_du_device {
 	struct device *dev;
@@ -83,11 +84,10 @@ struct rcar_du_device {
 	struct rcar_du_crtc crtcs[RCAR_DU_MAX_CRTCS];
 	unsigned int num_crtcs;
 
-	struct rcar_du_encoder *encoders[RCAR_DU_OUTPUT_MAX];
-
 	struct rcar_du_group groups[RCAR_DU_MAX_GROUPS];
 	struct platform_device *cmms[RCAR_DU_MAX_CRTCS];
 	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
+	struct drm_bridge *lvds[RCAR_DU_MAX_LVDS];
 
 	struct {
 		struct drm_property *colorkey;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index b0335da0c161..50fc14534fa4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -57,7 +57,6 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	if (renc == NULL)
 		return -ENOMEM;
 
-	rcdu->encoders[output] = renc;
 	renc->output = output;
 	encoder = rcar_encoder_to_drm_encoder(renc);
 
@@ -91,6 +90,10 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			ret = -EPROBE_DEFER;
 			goto done;
 		}
+
+		if (output == RCAR_DU_OUTPUT_LVDS0 ||
+		    output == RCAR_DU_OUTPUT_LVDS1)
+			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = bridge;
 	}
 
 	/*
-- 
Regards,

Laurent Pinchart

