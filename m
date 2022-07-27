Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDE8582A50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jul 2022 18:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234666AbiG0QIO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jul 2022 12:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234649AbiG0QIO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 12:08:14 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F9924AD77
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jul 2022 09:08:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,195,1654527600"; 
   d="scan'208";a="129334729"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jul 2022 01:08:12 +0900
Received: from localhost.localdomain (unknown [10.226.92.195])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7A6674018A35;
        Thu, 28 Jul 2022 01:08:09 +0900 (JST)
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
Subject: [PATCH v5 03/10] drm: rcar-du: Move rcar_du_vsp_plane_atomic_update()
Date:   Wed, 27 Jul 2022 17:07:46 +0100
Message-Id: <20220727160753.1774761-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
References: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
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
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 51 -----------------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 51 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h |  6 +++
 3 files changed, 57 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index c9090e581b12..aa63e2d19649 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -88,42 +88,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
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
-	format = rcar_du_format_info(state->format->fourcc);
-	cfg.pixelformat = format->v4l2;
-
-	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
-			      plane->index, &cfg);
-}
-
 static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
@@ -135,21 +99,6 @@ static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
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
index 9062837e68da..97f8ac22b582 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -85,6 +85,42 @@ static const u32 rcar_du_vsp_formats[] = {
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
+	format = rcar_du_format_info(state->format->fourcc);
+	cfg.pixelformat = format->v4l2;
+
+	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
+			      plane->index, &cfg);
+}
+
 int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		       struct sg_table sg_tables[3])
 {
@@ -193,6 +229,21 @@ void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
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
index 094ada022fe5..0686894e659c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -70,6 +70,8 @@ int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *state);
 void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 				  struct drm_plane_state *state);
+void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
+				     struct drm_atomic_state *state);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
@@ -101,6 +103,10 @@ static inline void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 						struct drm_plane_state *state)
 {
 }
+static inline void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
+						   struct drm_atomic_state *state)
+{
+}
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

