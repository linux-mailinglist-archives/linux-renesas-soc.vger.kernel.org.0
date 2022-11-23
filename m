Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0245363671A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Nov 2022 18:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238867AbiKWRaK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Nov 2022 12:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238510AbiKWR3q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 12:29:46 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DDBBF92091
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Nov 2022 09:29:43 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; 
   d="scan'208";a="140988284"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Nov 2022 02:29:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 88C4540ADCD3;
        Thu, 24 Nov 2022 02:29:40 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 09/19] drm: rcar-du: Add rcar_du_lib_vsp_init()
Date:   Wed, 23 Nov 2022 17:28:56 +0000
Message-Id: <20221123172906.2919734-10-biju.das.jz@bp.renesas.com>
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

RZ/G2L does not have plane registers as well as it uses different
CRTC. The below functions are SoC specific
 * rcar_du_crtc_finish_page_flip()
 * __rcar_du_plane_setup
 * __rcar_du_plane_atomic_check
All other function can be handled in common code. This patch introduces
rcar_du_lib_vsp_init() to share common_init, vsp_formats and vsp_plane_funcs().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * Updated rcar_du_vsp_init() for blend config.
v1->v2:
 * Rebased on drm-misc-next and DU-next.
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 157 +-------------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 166 ++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h |  11 ++
 3 files changed, 179 insertions(+), 155 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index fabb616d8853..d798d97b0dd4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -13,7 +13,6 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
-#include <drm/drm_managed.h>
 #include <drm/drm_vblank.h>
 
 #include <linux/bitops.h>
@@ -85,34 +84,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
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
@@ -234,133 +205,9 @@ static const struct drm_plane_helper_funcs rcar_du_vsp_plane_helper_funcs = {
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
-		drm_plane_create_blend_mode_property(&plane->plane,
-					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
-					BIT(DRM_MODE_BLEND_PREMULTI) |
-					BIT(DRM_MODE_BLEND_COVERAGE));
-
-		vsp->num_planes++;
-	}
-
-	return 0;
+	return rcar_du_lib_vsp_init(vsp, np, crtcs,
+				    &rcar_du_vsp_plane_helper_funcs);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index d59dc250bbb3..7f8742005df1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -7,13 +7,19 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_managed.h>
 
 #include <linux/dma-mapping.h>
+#include <linux/of_platform.h>
 #include <linux/scatterlist.h>
 
 #include <media/vsp1.h>
@@ -44,6 +50,34 @@ void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc)
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
@@ -118,3 +152,135 @@ void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
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
+		drm_plane_create_blend_mode_property(&plane->plane,
+					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					BIT(DRM_MODE_BLEND_PREMULTI) |
+					BIT(DRM_MODE_BLEND_COVERAGE));
+
+		vsp->num_planes++;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index bf13748c3ea8..2a346c0d5a76 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -22,6 +22,9 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		       struct sg_table sg_tables[3]);
 void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 			  struct sg_table sg_tables[3]);
+int rcar_du_lib_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
+			 unsigned int crtcs,
+			 const struct drm_plane_helper_funcs *rcar_du_vsp_plane_helper_funcs);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
@@ -38,6 +41,14 @@ static inline void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp,
 					struct sg_table sg_tables[3])
 {
 }
+
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

