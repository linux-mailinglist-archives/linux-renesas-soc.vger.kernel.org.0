Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A403F3CDA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Aug 2021 02:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbhHVAhA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 Aug 2021 20:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhHVAg7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Aug 2021 20:36:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE49C061575
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Aug 2021 17:36:19 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8F088F;
        Sun, 22 Aug 2021 02:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629592578;
        bh=ygaHWHKrG4Pco/TolEST8132jkXN/AEbliV/56le6gI=;
        h=From:To:Cc:Subject:Date:From;
        b=GjiTaelfaUNz9UryqkIvA2VGTg4gN7hf+VX/YxYRONp4UofS03nx/kPxbw9NiThXq
         /jYYCbN3tatO9x4fGJEZUgIxiwc49ABGyUnoY2pKK3O2oDz6Q/QhCnw1d+noo7ugmU
         uvvFdSHyhFFWOCEnmSmfdAOF3ZBW1nubir0fAWmk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] drm: rcar-du: Don't create encoder for unconnected LVDS outputs
Date:   Sun, 22 Aug 2021 03:36:04 +0300
Message-Id: <20210822003604.6235-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On R-Car D3 and E3, the LVDS encoders provide the pixel clock to the DU,
even when LVDS outputs are not used. For this reason, the rcar-lvds
driver probes successfully on those platforms even if no further bridge
or panel is connected to the LVDS output, in order to provide the
rcar_lvds_clk_enable() and rcar_lvds_clk_disable() functions to the DU
driver.

If an LVDS output isn't connected, trying to create a DRM connector for
the output will fail. Fix this by skipping connector creation in that
case, and also skip creation of the DRM encoder as there's no point in
an encoder without a connector.

Fixes: e9e056949c92 ("drm: rcar-du: lvds: Convert to DRM panel bridge helper")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 16 ++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_lvds.c       | 11 +++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.h       |  5 +++++
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 0daa8bba50f5..4bf4e25d7f01 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -86,12 +86,20 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	}
 
 	/*
-	 * Create and initialize the encoder. On Gen3 skip the LVDS1 output if
+	 * Create and initialize the encoder. On Gen3, skip the LVDS1 output if
 	 * the LVDS1 encoder is used as a companion for LVDS0 in dual-link
-	 * mode.
+	 * mode, or any LVDS output if it isn't connected. The latter may happen
+	 * on D3 or E3 as the LVDS encoders are needed to provide the pixel
+	 * clock to the DU, even when the LVDS outputs are not used.
 	 */
-	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
-		if (rcar_lvds_dual_link(bridge))
+	if (rcdu->info->gen >= 3) {
+		if (output == RCAR_DU_OUTPUT_LVDS1 &&
+		    rcar_lvds_dual_link(bridge))
+			return -ENOLINK;
+
+		if ((output == RCAR_DU_OUTPUT_LVDS0 ||
+		     output == RCAR_DU_OUTPUT_LVDS1) &&
+		    !rcar_lvds_is_connected(bridge))
 			return -ENOLINK;
 	}
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index d061b8de748f..b672c5bd72ee 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -576,6 +576,9 @@ static int rcar_lvds_attach(struct drm_bridge *bridge,
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
+	if (!lvds->next_bridge)
+		return 0;
+
 	return drm_bridge_attach(bridge->encoder, lvds->next_bridge, bridge,
 				 flags);
 }
@@ -598,6 +601,14 @@ bool rcar_lvds_dual_link(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL_GPL(rcar_lvds_dual_link);
 
+bool rcar_lvds_is_connected(struct drm_bridge *bridge)
+{
+	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
+
+	return lvds->next_bridge != NULL;
+}
+EXPORT_SYMBOL_GPL(rcar_lvds_is_connected);
+
 /* -----------------------------------------------------------------------------
  * Probe & Remove
  */
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.h b/drivers/gpu/drm/rcar-du/rcar_lvds.h
index 222ec0e60785..eb7c6ef03b00 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.h
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.h
@@ -16,6 +16,7 @@ struct drm_bridge;
 int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq);
 void rcar_lvds_clk_disable(struct drm_bridge *bridge);
 bool rcar_lvds_dual_link(struct drm_bridge *bridge);
+bool rcar_lvds_is_connected(struct drm_bridge *bridge);
 #else
 static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
 				       unsigned long freq)
@@ -27,6 +28,10 @@ static inline bool rcar_lvds_dual_link(struct drm_bridge *bridge)
 {
 	return false;
 }
+static inline bool rcar_lvds_is_connected(struct drm_bridge *bridge)
+{
+	return false;
+}
 #endif /* CONFIG_DRM_RCAR_LVDS */
 
 #endif /* __RCAR_LVDS_H__ */
-- 
Regards,

Laurent Pinchart

