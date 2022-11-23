Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9649463672D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Nov 2022 18:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239069AbiKWRa1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Nov 2022 12:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238611AbiKWRaB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 12:30:01 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A65478D498
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Nov 2022 09:30:00 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; 
   d="scan'208";a="140988297"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Nov 2022 02:30:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A76F040ADCC6;
        Thu, 24 Nov 2022 02:29:57 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 14/19] drm: rcar-du: Add rcar_du_lib_mode_cfg_helper_get()
Date:   Wed, 23 Nov 2022 17:29:01 +0000
Message-Id: <20221123172906.2919734-15-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
References: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add rcar_du_lib_mode_cfg_helper_get() in RCar DU kms lib to get the
pointer to rcar_du_mode_config_helper, so that both rcar_du_atomic_
commit_tail() and rcar_du_mode_config_helper can be reused by
rcar_du_modeset_init() and rzg2l_du_modeset_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Updated header files
 * Renamed rcar_du_lib_mode_cfg_helper_fns()->rcar_du_lib_mode_cfg_helper_get()
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 46 +-----------------
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 59 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  3 ++
 3 files changed, 63 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 74845d8bad9d..b0b40b1cc37d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -7,9 +7,7 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
-#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
@@ -61,52 +59,10 @@ static int rcar_du_atomic_check(struct drm_device *dev,
 	return rcar_du_atomic_check_planes(dev, state);
 }
 
-static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
-{
-	struct drm_device *dev = old_state->dev;
-	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
-	struct drm_crtc_state *crtc_state;
-	struct drm_crtc *crtc;
-	unsigned int i;
-
-	/*
-	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
-	 * when starting the CRTCs.
-	 */
-	rcdu->dpad1_source = -1;
-
-	for_each_new_crtc_in_state(old_state, crtc, crtc_state, i) {
-		struct rcar_du_crtc_state *rcrtc_state =
-			to_rcar_crtc_state(crtc_state);
-		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
-
-		if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD0))
-			rcdu->dpad0_source = rcrtc->index;
-
-		if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD1))
-			rcdu->dpad1_source = rcrtc->index;
-	}
-
-	/* Apply the atomic update. */
-	drm_atomic_helper_commit_modeset_disables(dev, old_state);
-	drm_atomic_helper_commit_planes(dev, old_state,
-					DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
-
-	drm_atomic_helper_commit_hw_done(old_state);
-	drm_atomic_helper_wait_for_flip_done(dev, old_state);
-
-	drm_atomic_helper_cleanup_planes(dev, old_state);
-}
-
 /* -----------------------------------------------------------------------------
  * Initialization
  */
 
-static const struct drm_mode_config_helper_funcs rcar_du_mode_config_helper = {
-	.atomic_commit_tail = rcar_du_atomic_commit_tail,
-};
-
 static const struct drm_mode_config_funcs rcar_du_mode_config_funcs = {
 	.fb_create = rcar_du_fb_create,
 	.atomic_check = rcar_du_atomic_check,
@@ -412,7 +368,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	dev->mode_config.min_height = 0;
 	dev->mode_config.normalize_zpos = true;
 	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
-	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
+	dev->mode_config.helper_private = rcar_du_lib_mode_cfg_helper_get();
 
 	if (rcdu->info->gen < 3) {
 		dev->mode_config.max_width = 4095;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index 25548e727db9..a2d56ca56fc3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -7,6 +7,9 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -447,3 +450,59 @@ rcar_du_lib_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 
 	return drm_gem_fb_create(dev, file_priv, mode_cmd);
 }
+
+/* -----------------------------------------------------------------------------
+ * Atomic Check and Update
+ */
+
+static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
+{
+	struct drm_device *dev = old_state->dev;
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	/*
+	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
+	 * when starting the CRTCs.
+	 */
+	rcdu->dpad1_source = -1;
+
+	for_each_new_crtc_in_state(old_state, crtc, crtc_state, i) {
+		struct rcar_du_crtc_state *rcrtc_state =
+			to_rcar_crtc_state(crtc_state);
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+		if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD0))
+			rcdu->dpad0_source = rcrtc->index;
+
+		if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD1))
+			rcdu->dpad1_source = rcrtc->index;
+	}
+
+	/* Apply the atomic update. */
+	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	drm_atomic_helper_commit_planes(dev, old_state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+
+	drm_atomic_helper_commit_hw_done(old_state);
+	drm_atomic_helper_wait_for_flip_done(dev, old_state);
+
+	drm_atomic_helper_cleanup_planes(dev, old_state);
+}
+
+/* -----------------------------------------------------------------------------
+ * Initialization
+ */
+
+static const struct drm_mode_config_helper_funcs rcar_du_mode_config_helper = {
+	.atomic_commit_tail = rcar_du_atomic_commit_tail,
+};
+
+const struct drm_mode_config_helper_funcs *
+rcar_du_lib_mode_cfg_helper_get(void)
+{
+	return &rcar_du_mode_config_helper;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index b621a7e2e439..bba68592e73d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -43,4 +43,7 @@ struct drm_framebuffer *
 rcar_du_lib_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		      const struct drm_mode_fb_cmd2 *mode_cmd);
 
+const struct drm_mode_config_helper_funcs *
+rcar_du_lib_mode_cfg_helper_get(void);
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

