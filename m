Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3D0582A4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jul 2022 18:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234667AbiG0QIH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jul 2022 12:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234649AbiG0QIH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 12:08:07 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 87A814AD72
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jul 2022 09:08:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,195,1654527600"; 
   d="scan'208";a="129334710"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jul 2022 01:08:04 +0900
Received: from localhost.localdomain (unknown [10.226.92.195])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 920EB40183E9;
        Thu, 28 Jul 2022 01:08:01 +0900 (JST)
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
Subject: [PATCH v5 01/10] drm: rcar-du: Move rcar_du_vsp_plane_prepare_fb()
Date:   Wed, 27 Jul 2022 17:07:44 +0100
Message-Id: <20220727160753.1774761-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
References: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move rcar_du_vsp_plane_prepare_fb() to RCar DU vsp lib so that
both RCar and RZ/G2L DU vsp drivers can share this function.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 21 ---------------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h |  7 +++++++
 3 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index d192c31a5fe1..72128915a2ff 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -124,27 +124,6 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 			      plane->index, &cfg);
 }
 
-static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
-					struct drm_plane_state *state)
-{
-	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(state);
-	struct rcar_du_vsp *vsp = to_rcar_vsp_plane(plane)->vsp;
-	int ret;
-
-	/*
-	 * There's no need to prepare (and unprepare) the framebuffer when the
-	 * plane is not visible, as it will not be displayed.
-	 */
-	if (!state->visible)
-		return 0;
-
-	ret = rcar_du_vsp_map_fb(vsp, state->fb, rstate->sg_tables);
-	if (ret < 0)
-		return ret;
-
-	return drm_gem_plane_helper_prepare_fb(plane, state);
-}
-
 static void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 					 struct drm_plane_state *state)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index 80da12f1fe71..40d44bf521c0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -147,6 +147,27 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 	return ret;
 }
 
+int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
+				 struct drm_plane_state *state)
+{
+	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(state);
+	struct rcar_du_vsp *vsp = to_rcar_vsp_plane(plane)->vsp;
+	int ret;
+
+	/*
+	 * There's no need to prepare (and unprepare) the framebuffer when the
+	 * plane is not visible, as it will not be displayed.
+	 */
+	if (!state->visible)
+		return 0;
+
+	ret = rcar_du_vsp_map_fb(vsp, state->fb, rstate->sg_tables);
+	if (ret < 0)
+		return ret;
+
+	return drm_gem_plane_helper_prepare_fb(plane, state);
+}
+
 void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 			  struct sg_table sg_tables[3])
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index abfde19fd1a3..d79cdf7d7316 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -66,6 +66,8 @@ void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 int rcar_du_lib_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 			 unsigned int crtcs,
 			 const struct drm_plane_helper_funcs *rcar_du_vsp_plane_helper_funcs);
+int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
+				 struct drm_plane_state *state);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
@@ -88,6 +90,11 @@ rcar_du_lib_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 {
 	return -ENXIO;
 }
+static inline int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
+					       struct drm_plane_state *state)
+{
+	return -ENXIO;
+}
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

