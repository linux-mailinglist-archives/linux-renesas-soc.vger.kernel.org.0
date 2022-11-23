Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37444636717
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Nov 2022 18:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238645AbiKWRaD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Nov 2022 12:30:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238833AbiKWR3n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 12:29:43 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A98BF5DB94
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Nov 2022 09:29:33 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; 
   d="scan'208";a="140988276"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Nov 2022 02:29:33 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 81DBA40ADCC6;
        Thu, 24 Nov 2022 02:29:30 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 06/19] drm: rcar-du: Move vsp rcar_du_vsp_{map,unmap}_fb()
Date:   Wed, 23 Nov 2022 17:28:53 +0000
Message-Id: <20221123172906.2919734-7-biju.das.jz@bp.renesas.com>
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

Move vsp rcar_du_vsp_{map,unmap}_fb() to RCar DU VSP lib.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * Fixed check patch warning in header file.
v1->v2:
 * Rebased on drm-misc-next and DU-next.
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 78 ---------------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h     | 18 -----
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 84 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h | 20 ++++++
 4 files changed, 104 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 870b72eda4da..fabb616d8853 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -11,11 +11,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_dma_helper.h>
-#include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
-#include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_vblank.h>
 
@@ -171,68 +168,6 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
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
-		struct drm_gem_dma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
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
-					      gem->dma_addr, gem->base.size);
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
@@ -254,19 +189,6 @@ static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
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
index b610e6b40304..4022ed014353 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -14,10 +14,7 @@
 
 #include "rcar_du_vsp_lib.h"
 
-struct drm_framebuffer;
 struct rcar_du_format_info;
-struct rcar_du_vsp;
-struct sg_table;
 
 struct rcar_du_vsp_plane {
 	struct drm_plane plane;
@@ -61,10 +58,6 @@ to_rcar_vsp_plane_state(struct drm_plane_state *state)
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
@@ -73,17 +66,6 @@ static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
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
index 89169dc7594a..d59dc250bbb3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -7,6 +7,15 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_dma_helper.h>
+
+#include <linux/dma-mapping.h>
+#include <linux/scatterlist.h>
+
 #include <media/vsp1.h>
 
 #include "rcar_du_drv.h"
@@ -34,3 +43,78 @@ void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc)
 
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
+		struct drm_gem_dma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
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
+					      gem->dma_addr, gem->base.size);
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
index e8f16236be0a..bf13748c3ea8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -10,14 +10,34 @@
 #ifndef __RCAR_DU_VSP_LIB_H__
 #define __RCAR_DU_VSP_LIB_H__
 
+struct drm_framebuffer;
+struct rcar_du_vsp;
+struct sg_table;
+
 #ifdef CONFIG_DRM_RCAR_VSP
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
+
+static inline void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp,
+					struct drm_framebuffer *fb,
+					struct sg_table sg_tables[3])
+{
+}
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

