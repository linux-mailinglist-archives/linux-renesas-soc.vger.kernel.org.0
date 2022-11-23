Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8331763671E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Nov 2022 18:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238930AbiKWRaS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Nov 2022 12:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238943AbiKWR3z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 12:29:55 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F19DD5EF88
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Nov 2022 09:29:53 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; 
   d="scan'208";a="143666657"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Nov 2022 02:29:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0201140ADCC6;
        Thu, 24 Nov 2022 02:29:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 12/19] drm: rcar-du: Move rcar_du_vsp_plane_atomic_update()
Date:   Wed, 23 Nov 2022 17:28:59 +0000
Message-Id: <20221123172906.2919734-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
References: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,PDS_OTHER_BAD_TLD,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move rcar_du_vsp_plane_atomic_update() to RCar DU vsp lib so that
both RCar and RZ/G2L DU vsp drivers can share this function.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Updated rcar_du_vsp_plane_setup()
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 70 ----------------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 71 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h |  7 +++
 3 files changed, 78 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 77a15450fca9..8d6ab048f5a5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -84,61 +84,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
-static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
-{
-	struct rcar_du_vsp_plane_state *state =
-		to_rcar_vsp_plane_state(plane->plane.state);
-	struct rcar_du_crtc *crtc = to_rcar_crtc(state->state.crtc);
-	struct drm_framebuffer *fb = plane->plane.state->fb;
-	const struct rcar_du_format_info *format;
-	struct vsp1_du_atomic_config cfg = {
-		.pixelformat = 0,
-		.pitch = fb->pitches[0],
-		.alpha = state->state.alpha >> 8,
-		.zpos = state->state.zpos,
-	};
-	u32 fourcc = state->format->fourcc;
-	unsigned int i;
-
-	cfg.src.left = state->state.src.x1 >> 16;
-	cfg.src.top = state->state.src.y1 >> 16;
-	cfg.src.width = drm_rect_width(&state->state.src) >> 16;
-	cfg.src.height = drm_rect_height(&state->state.src) >> 16;
-
-	cfg.dst.left = state->state.dst.x1;
-	cfg.dst.top = state->state.dst.y1;
-	cfg.dst.width = drm_rect_width(&state->state.dst);
-	cfg.dst.height = drm_rect_height(&state->state.dst);
-
-	for (i = 0; i < state->format->planes; ++i)
-		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
-			   + fb->offsets[i];
-
-	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
-		switch (fourcc) {
-		case DRM_FORMAT_ARGB1555:
-			fourcc = DRM_FORMAT_XRGB1555;
-			break;
-
-		case DRM_FORMAT_ARGB4444:
-			fourcc = DRM_FORMAT_XRGB4444;
-			break;
-
-		case DRM_FORMAT_ARGB8888:
-			fourcc = DRM_FORMAT_XRGB8888;
-			break;
-		}
-	}
-
-	format = rcar_du_format_info(fourcc);
-	cfg.pixelformat = format->v4l2;
-
-	cfg.premult = state->state.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI;
-
-	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
-			      plane->index, &cfg);
-}
-
 static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
@@ -150,21 +95,6 @@ static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 					    &rstate->format);
 }
 
-static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
-					struct drm_atomic_state *state)
-{
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
-	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
-	struct rcar_du_vsp_plane *rplane = to_rcar_vsp_plane(plane);
-	struct rcar_du_crtc *crtc = to_rcar_crtc(old_state->crtc);
-
-	if (new_state->visible)
-		rcar_du_vsp_plane_setup(rplane);
-	else if (old_state->crtc)
-		vsp1_du_atomic_update(rplane->vsp->vsp, crtc->vsp_pipe,
-				      rplane->index, NULL);
-}
-
 static const struct drm_plane_helper_funcs rcar_du_vsp_plane_helper_funcs = {
 	.prepare_fb = rcar_du_vsp_plane_prepare_fb,
 	.cleanup_fb = rcar_du_vsp_plane_cleanup_fb,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index 56ed232326f7..2573d293da18 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -25,6 +25,7 @@
 #include <media/vsp1.h>
 
 #include "rcar_du_drv.h"
+#include "rcar_du_kms.h"
 #include "rcar_du_writeback.h"
 
 void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
@@ -78,6 +79,61 @@ static const u32 rcar_du_vsp_formats[] = {
 	DRM_FORMAT_YVU444,
 };
 
+static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
+{
+	struct rcar_du_vsp_plane_state *state =
+		to_rcar_vsp_plane_state(plane->plane.state);
+	struct rcar_du_crtc *crtc = to_rcar_crtc(state->state.crtc);
+	struct drm_framebuffer *fb = plane->plane.state->fb;
+	const struct rcar_du_format_info *format;
+	struct vsp1_du_atomic_config cfg = {
+		.pixelformat = 0,
+		.pitch = fb->pitches[0],
+		.alpha = state->state.alpha >> 8,
+		.zpos = state->state.zpos,
+	};
+	u32 fourcc = state->format->fourcc;
+	unsigned int i;
+
+	cfg.src.left = state->state.src.x1 >> 16;
+	cfg.src.top = state->state.src.y1 >> 16;
+	cfg.src.width = drm_rect_width(&state->state.src) >> 16;
+	cfg.src.height = drm_rect_height(&state->state.src) >> 16;
+
+	cfg.dst.left = state->state.dst.x1;
+	cfg.dst.top = state->state.dst.y1;
+	cfg.dst.width = drm_rect_width(&state->state.dst);
+	cfg.dst.height = drm_rect_height(&state->state.dst);
+
+	for (i = 0; i < state->format->planes; ++i)
+		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
+			   + fb->offsets[i];
+
+	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
+		switch (fourcc) {
+		case DRM_FORMAT_ARGB1555:
+			fourcc = DRM_FORMAT_XRGB1555;
+			break;
+
+		case DRM_FORMAT_ARGB4444:
+			fourcc = DRM_FORMAT_XRGB4444;
+			break;
+
+		case DRM_FORMAT_ARGB8888:
+			fourcc = DRM_FORMAT_XRGB8888;
+			break;
+		}
+	}
+
+	format = rcar_du_format_info(fourcc);
+	cfg.pixelformat = format->v4l2;
+
+	cfg.premult = state->state.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI;
+
+	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
+			      plane->index, &cfg);
+}
+
 int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		       struct sg_table sg_tables[3])
 {
@@ -186,6 +242,21 @@ void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 	rcar_du_vsp_unmap_fb(vsp, state->fb, rstate->sg_tables);
 }
 
+void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
+				     struct drm_atomic_state *state)
+{
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct rcar_du_vsp_plane *rplane = to_rcar_vsp_plane(plane);
+	struct rcar_du_crtc *crtc = to_rcar_crtc(old_state->crtc);
+
+	if (new_state->visible)
+		rcar_du_vsp_plane_setup(rplane);
+	else if (old_state->crtc)
+		vsp1_du_atomic_update(rplane->vsp->vsp, crtc->vsp_pipe,
+				      rplane->index, NULL);
+}
+
 static struct drm_plane_state *
 rcar_du_vsp_plane_atomic_duplicate_state(struct drm_plane *plane)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index c14cd2f545d9..0e1bf59d5133 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -29,6 +29,8 @@ int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *state);
 void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 				  struct drm_plane_state *state);
+void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
+				     struct drm_atomic_state *state);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
@@ -64,6 +66,11 @@ static inline void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 						struct drm_plane_state *state)
 {
 }
+
+static inline void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
+						   struct drm_atomic_state *state)
+{
+}
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

