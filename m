Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2645817B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jul 2022 18:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238740AbiGZQnA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jul 2022 12:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239129AbiGZQm6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 12:42:58 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C18A5102B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jul 2022 09:42:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,194,1654527600"; 
   d="scan'208";a="127419804"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Jul 2022 01:42:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.4])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CD8664004CE0;
        Wed, 27 Jul 2022 01:42:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 10/10] drm: rcar-du: Add rcar_du_lib_vsp_init()
Date:   Tue, 26 Jul 2022 17:42:08 +0100
Message-Id: <20220726164208.1048444-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726164208.1048444-1-biju.das.jz@bp.renesas.com>
References: <20220726164208.1048444-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L does not have plane registers as well as it uses different
CRTC. The below functions are SoC specific
 * rcar_du_crtc_finish_page_flip()
 * __rcar_du_plane_setup
 * __rcar_du_plane_atomic_check
All other function can be handled in common code. This patch introduces
rcar_du_lib_vsp_init() to share common_init, vsp_formats and vsp_plane_funcs().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 151 +--------------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 155 ++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h |  10 ++
 3 files changed, 167 insertions(+), 149 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 18e16097cf53..03f032ef48ad 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -89,34 +89,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
-static const u32 rcar_du_vsp_formats[] = {
-	DRM_FORMAT_RGB332,
-	DRM_FORMAT_ARGB4444,
-	DRM_FORMAT_XRGB4444,
-	DRM_FORMAT_ARGB1555,
-	DRM_FORMAT_XRGB1555,
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_BGR888,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_BGRA8888,
-	DRM_FORMAT_BGRX8888,
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_UYVY,
-	DRM_FORMAT_YUYV,
-	DRM_FORMAT_YVYU,
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_NV21,
-	DRM_FORMAT_NV16,
-	DRM_FORMAT_NV61,
-	DRM_FORMAT_YUV420,
-	DRM_FORMAT_YVU420,
-	DRM_FORMAT_YUV422,
-	DRM_FORMAT_YVU422,
-	DRM_FORMAT_YUV444,
-	DRM_FORMAT_YVU444,
-};
-
 static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 {
 	struct rcar_du_vsp_plane_state *state =
@@ -219,128 +191,9 @@ static const struct drm_plane_helper_funcs rcar_du_vsp_plane_helper_funcs = {
 	.atomic_update = rcar_du_vsp_plane_atomic_update,
 };
 
-static struct drm_plane_state *
-rcar_du_vsp_plane_atomic_duplicate_state(struct drm_plane *plane)
-{
-	struct rcar_du_vsp_plane_state *copy;
-
-	if (WARN_ON(!plane->state))
-		return NULL;
-
-	copy = kzalloc(sizeof(*copy), GFP_KERNEL);
-	if (copy == NULL)
-		return NULL;
-
-	__drm_atomic_helper_plane_duplicate_state(plane, &copy->state);
-
-	return &copy->state;
-}
-
-static void rcar_du_vsp_plane_atomic_destroy_state(struct drm_plane *plane,
-						   struct drm_plane_state *state)
-{
-	__drm_atomic_helper_plane_destroy_state(state);
-	kfree(to_rcar_vsp_plane_state(state));
-}
-
-static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
-{
-	struct rcar_du_vsp_plane_state *state;
-
-	if (plane->state) {
-		rcar_du_vsp_plane_atomic_destroy_state(plane, plane->state);
-		plane->state = NULL;
-	}
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (state == NULL)
-		return;
-
-	__drm_atomic_helper_plane_reset(plane, &state->state);
-}
-
-static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
-	.reset = rcar_du_vsp_plane_reset,
-	.destroy = drm_plane_cleanup,
-	.atomic_duplicate_state = rcar_du_vsp_plane_atomic_duplicate_state,
-	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
-};
-
-static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
-{
-	struct rcar_du_vsp *vsp = res;
-	unsigned int i;
-
-	for (i = 0; i < vsp->num_planes; ++i) {
-		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
-
-		drm_plane_cleanup(&plane->plane);
-	}
-
-	kfree(vsp->planes);
-
-	put_device(vsp->vsp);
-}
-
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs)
 {
-	struct rcar_du_device *rcdu = vsp->dev;
-	struct platform_device *pdev;
-	unsigned int num_crtcs = hweight32(crtcs);
-	unsigned int num_planes;
-	unsigned int i;
-	int ret;
-
-	/* Find the VSP device and initialize it. */
-	pdev = of_find_device_by_node(np);
-	if (!pdev)
-		return -ENXIO;
-
-	vsp->vsp = &pdev->dev;
-
-	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_vsp_cleanup, vsp);
-	if (ret < 0)
-		return ret;
-
-	ret = vsp1_du_init(vsp->vsp);
-	if (ret < 0)
-		return ret;
-
-	num_planes = rcdu->info->num_rpf;
-
-	vsp->planes = kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
-	if (!vsp->planes)
-		return -ENOMEM;
-
-	for (i = 0; i < num_planes; ++i) {
-		enum drm_plane_type type = i < num_crtcs
-					 ? DRM_PLANE_TYPE_PRIMARY
-					 : DRM_PLANE_TYPE_OVERLAY;
-		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
-
-		plane->vsp = vsp;
-		plane->index = i;
-
-		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
-					       crtcs, &rcar_du_vsp_plane_funcs,
-					       rcar_du_vsp_formats,
-					       ARRAY_SIZE(rcar_du_vsp_formats),
-					       NULL, type, NULL);
-		if (ret < 0)
-			return ret;
-
-		drm_plane_helper_add(&plane->plane,
-				     &rcar_du_vsp_plane_helper_funcs);
-
-		drm_plane_create_alpha_property(&plane->plane);
-		drm_plane_create_zpos_property(&plane->plane, i, 0,
-					       num_planes - 1);
-
-		vsp->num_planes++;
-	}
-
-	return 0;
+	return rcar_du_lib_vsp_init(vsp, np, crtcs,
+				    &rcar_du_vsp_plane_helper_funcs);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index 337b3913fe73..80da12f1fe71 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -57,6 +57,34 @@ void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc)
 	vsp1_du_atomic_flush(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
+static const u32 rcar_du_vsp_formats[] = {
+	DRM_FORMAT_RGB332,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YVU422,
+	DRM_FORMAT_YUV444,
+	DRM_FORMAT_YVU444,
+};
+
 int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		       struct sg_table sg_tables[3])
 {
@@ -131,3 +159,130 @@ void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		sg_free_table(sgt);
 	}
 }
+
+static struct drm_plane_state *
+rcar_du_vsp_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct rcar_du_vsp_plane_state *copy;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	copy = kzalloc(sizeof(*copy), GFP_KERNEL);
+	if (copy == NULL)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &copy->state);
+
+	return &copy->state;
+}
+
+static void rcar_du_vsp_plane_atomic_destroy_state(struct drm_plane *plane,
+						   struct drm_plane_state *state)
+{
+	__drm_atomic_helper_plane_destroy_state(state);
+	kfree(to_rcar_vsp_plane_state(state));
+}
+
+static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
+{
+	struct rcar_du_vsp_plane_state *state;
+
+	if (plane->state) {
+		rcar_du_vsp_plane_atomic_destroy_state(plane, plane->state);
+		plane->state = NULL;
+	}
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (state == NULL)
+		return;
+
+	__drm_atomic_helper_plane_reset(plane, &state->state);
+}
+
+static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.reset = rcar_du_vsp_plane_reset,
+	.destroy = drm_plane_cleanup,
+	.atomic_duplicate_state = rcar_du_vsp_plane_atomic_duplicate_state,
+	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
+};
+
+static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
+{
+	struct rcar_du_vsp *vsp = res;
+	unsigned int i;
+
+	for (i = 0; i < vsp->num_planes; ++i) {
+		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
+
+		drm_plane_cleanup(&plane->plane);
+	}
+
+	kfree(vsp->planes);
+
+	put_device(vsp->vsp);
+}
+
+int rcar_du_lib_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
+			 unsigned int crtcs,
+			 const struct drm_plane_helper_funcs *rcar_du_vsp_plane_helper_funcs)
+{
+	struct rcar_du_device *rcdu = vsp->dev;
+	struct platform_device *pdev;
+	unsigned int num_crtcs = hweight32(crtcs);
+	unsigned int num_planes;
+	unsigned int i;
+	int ret;
+
+	/* Find the VSP device and initialize it. */
+	pdev = of_find_device_by_node(np);
+	if (!pdev)
+		return -ENXIO;
+
+	vsp->vsp = &pdev->dev;
+
+	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_vsp_cleanup, vsp);
+	if (ret < 0)
+		return ret;
+
+	ret = vsp1_du_init(vsp->vsp);
+	if (ret < 0)
+		return ret;
+
+	num_planes = rcdu->info->num_rpf;
+
+	vsp->planes = kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
+	if (!vsp->planes)
+		return -ENOMEM;
+
+	for (i = 0; i < num_planes; ++i) {
+		enum drm_plane_type type = i < num_crtcs
+					 ? DRM_PLANE_TYPE_PRIMARY
+					 : DRM_PLANE_TYPE_OVERLAY;
+		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
+
+		plane->vsp = vsp;
+		plane->index = i;
+
+		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
+					       crtcs, &rcar_du_vsp_plane_funcs,
+					       rcar_du_vsp_formats,
+					       ARRAY_SIZE(rcar_du_vsp_formats),
+					       NULL, type, NULL);
+		if (ret < 0)
+			return ret;
+
+		drm_plane_helper_add(&plane->plane,
+				     rcar_du_vsp_plane_helper_funcs);
+
+		drm_plane_create_alpha_property(&plane->plane);
+		drm_plane_create_zpos_property(&plane->plane, i, 0,
+					       num_planes - 1);
+
+		vsp->num_planes++;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index c045f8c38e4e..abfde19fd1a3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -63,6 +63,9 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		       struct sg_table sg_tables[3]);
 void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 			  struct sg_table sg_tables[3]);
+int rcar_du_lib_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
+			 unsigned int crtcs,
+			 const struct drm_plane_helper_funcs *rcar_du_vsp_plane_helper_funcs);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
@@ -78,6 +81,13 @@ static inline void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp,
 					struct sg_table sg_tables[3])
 {
 }
+static inline int
+rcar_du_lib_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
+		     unsigned int crtcs,
+		     const struct drm_plane_helper_funcs *rcar_du_vsp_plane_helper_funcs)
+{
+	return -ENXIO;
+}
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

