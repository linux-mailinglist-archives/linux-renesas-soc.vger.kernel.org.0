Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1FA15817AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jul 2022 18:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbiGZQmo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jul 2022 12:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiGZQmo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 12:42:44 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 028B41CB
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jul 2022 09:42:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,194,1654527600"; 
   d="scan'208";a="129198125"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Jul 2022 01:42:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.4])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0D3FD40083D5;
        Wed, 27 Jul 2022 01:42:38 +0900 (JST)
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
Subject: [PATCH 07/10] drm: rcar-du: Move vsp rcar_du_vsp_{map,unmap}_fb()
Date:   Tue, 26 Jul 2022 17:42:05 +0100
Message-Id: <20220726164208.1048444-8-biju.das.jz@bp.renesas.com>
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

Move vsp rcar_du_vsp_{map,unmap}_fb() to RCar DU VSP lib.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 75 -----------------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h     | 15 -----
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 75 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h | 15 +++++
 4 files changed, 90 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index becc587c5169..18e16097cf53 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -153,68 +153,6 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 			      plane->index, &cfg);
 }
 
-int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
-		       struct sg_table sg_tables[3])
-{
-	struct rcar_du_device *rcdu = vsp->dev;
-	unsigned int i, j;
-	int ret;
-
-	for (i = 0; i < fb->format->num_planes; ++i) {
-		struct drm_gem_cma_object *gem = drm_fb_cma_get_gem_obj(fb, i);
-		struct sg_table *sgt = &sg_tables[i];
-
-		if (gem->sgt) {
-			struct scatterlist *src;
-			struct scatterlist *dst;
-
-			/*
-			 * If the GEM buffer has a scatter gather table, it has
-			 * been imported from a dma-buf and has no physical
-			 * address as it might not be physically contiguous.
-			 * Copy the original scatter gather table to map it to
-			 * the VSP.
-			 */
-			ret = sg_alloc_table(sgt, gem->sgt->orig_nents,
-					     GFP_KERNEL);
-			if (ret)
-				goto fail;
-
-			src = gem->sgt->sgl;
-			dst = sgt->sgl;
-			for (j = 0; j < gem->sgt->orig_nents; ++j) {
-				sg_set_page(dst, sg_page(src), src->length,
-					    src->offset);
-				src = sg_next(src);
-				dst = sg_next(dst);
-			}
-		} else {
-			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
-					      gem->paddr, gem->base.size);
-			if (ret)
-				goto fail;
-		}
-
-		ret = vsp1_du_map_sg(vsp->vsp, sgt);
-		if (ret) {
-			sg_free_table(sgt);
-			goto fail;
-		}
-	}
-
-	return 0;
-
-fail:
-	while (i--) {
-		struct sg_table *sgt = &sg_tables[i];
-
-		vsp1_du_unmap_sg(vsp->vsp, sgt);
-		sg_free_table(sgt);
-	}
-
-	return ret;
-}
-
 static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
 					struct drm_plane_state *state)
 {
@@ -236,19 +174,6 @@ static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
 	return drm_gem_plane_helper_prepare_fb(plane, state);
 }
 
-void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
-			  struct sg_table sg_tables[3])
-{
-	unsigned int i;
-
-	for (i = 0; i < fb->format->num_planes; ++i) {
-		struct sg_table *sgt = &sg_tables[i];
-
-		vsp1_du_unmap_sg(vsp->vsp, sgt);
-		sg_free_table(sgt);
-	}
-}
-
 static void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 					 struct drm_plane_state *state)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index 5bc539562255..a6ddeb6d57ea 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -16,10 +16,6 @@
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs);
 void rcar_du_vsp_enable(struct rcar_du_crtc *crtc);
-int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
-		       struct sg_table sg_tables[3]);
-void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
-			  struct sg_table sg_tables[3]);
 #else
 static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
 				   struct device_node *np,
@@ -28,17 +24,6 @@ static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
 	return -ENXIO;
 }
 static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
-static inline int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp,
-				     struct drm_framebuffer *fb,
-				     struct sg_table sg_tables[3])
-{
-	return -ENXIO;
-}
-static inline void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp,
-					struct drm_framebuffer *fb,
-					struct sg_table sg_tables[3])
-{
-}
 #endif
 
 #endif /* __RCAR_DU_VSP_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index dc51368044c1..337b3913fe73 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -56,3 +56,78 @@ void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc)
 
 	vsp1_du_atomic_flush(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
+
+int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
+		       struct sg_table sg_tables[3])
+{
+	struct rcar_du_device *rcdu = vsp->dev;
+	unsigned int i, j;
+	int ret;
+
+	for (i = 0; i < fb->format->num_planes; ++i) {
+		struct drm_gem_cma_object *gem = drm_fb_cma_get_gem_obj(fb, i);
+		struct sg_table *sgt = &sg_tables[i];
+
+		if (gem->sgt) {
+			struct scatterlist *src;
+			struct scatterlist *dst;
+
+			/*
+			 * If the GEM buffer has a scatter gather table, it has
+			 * been imported from a dma-buf and has no physical
+			 * address as it might not be physically contiguous.
+			 * Copy the original scatter gather table to map it to
+			 * the VSP.
+			 */
+			ret = sg_alloc_table(sgt, gem->sgt->orig_nents,
+					     GFP_KERNEL);
+			if (ret)
+				goto fail;
+
+			src = gem->sgt->sgl;
+			dst = sgt->sgl;
+			for (j = 0; j < gem->sgt->orig_nents; ++j) {
+				sg_set_page(dst, sg_page(src), src->length,
+					    src->offset);
+				src = sg_next(src);
+				dst = sg_next(dst);
+			}
+		} else {
+			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
+					      gem->paddr, gem->base.size);
+			if (ret)
+				goto fail;
+		}
+
+		ret = vsp1_du_map_sg(vsp->vsp, sgt);
+		if (ret) {
+			sg_free_table(sgt);
+			goto fail;
+		}
+	}
+
+	return 0;
+
+fail:
+	while (i--) {
+		struct sg_table *sgt = &sg_tables[i];
+
+		vsp1_du_unmap_sg(vsp->vsp, sgt);
+		sg_free_table(sgt);
+	}
+
+	return ret;
+}
+
+void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
+			  struct sg_table sg_tables[3])
+{
+	unsigned int i;
+
+	for (i = 0; i < fb->format->num_planes; ++i) {
+		struct sg_table *sgt = &sg_tables[i];
+
+		vsp1_du_unmap_sg(vsp->vsp, sgt);
+		sg_free_table(sgt);
+	}
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index a2045c51c496..c045f8c38e4e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -59,10 +59,25 @@ to_rcar_vsp_plane_state(struct drm_plane_state *state)
 void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
+int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
+		       struct sg_table sg_tables[3]);
+void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
+			  struct sg_table sg_tables[3]);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc) { };
+static inline int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp,
+				     struct drm_framebuffer *fb,
+				     struct sg_table sg_tables[3])
+{
+	return -ENXIO;
+}
+static inline void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp,
+					struct drm_framebuffer *fb,
+					struct sg_table sg_tables[3])
+{
+}
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

