Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2D37636713
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Nov 2022 18:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238995AbiKWR36 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Nov 2022 12:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238997AbiKWR3j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 12:29:39 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 14A808E295
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Nov 2022 09:29:26 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; 
   d="scan'208";a="143666640"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Nov 2022 02:29:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BD54F40ADCCF;
        Thu, 24 Nov 2022 02:29:23 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 04/19] drm: rcar-du: Move rcar_du_vsp_atomic_begin()
Date:   Wed, 23 Nov 2022 17:28:51 +0000
Message-Id: <20221123172906.2919734-5-biju.das.jz@bp.renesas.com>
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

Move rcar_du_vsp_atomic_begin() to RCar DU VSP lib.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * Rebased on drm-misc-next and DU-next.
v1->v2:
 * Rebased on drm-misc-next and DU-next.
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 5 -----
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h     | 2 --
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 5 +++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h | 2 ++
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index bed3f2a3c4a5..685e3e8f6ddb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -88,11 +88,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
-void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc)
-{
-	vsp1_du_atomic_begin(crtc->vsp->vsp, crtc->vsp_pipe);
-}
-
 void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc)
 {
 	struct vsp1_du_atomic_pipe_config cfg = { { 0, } };
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index 8fbfa86c93e0..83a2f3e85860 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -61,7 +61,6 @@ to_rcar_vsp_plane_state(struct drm_plane_state *state)
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs);
 void rcar_du_vsp_enable(struct rcar_du_crtc *crtc);
-void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
 int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		       struct sg_table sg_tables[3]);
@@ -75,7 +74,6 @@ static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
 	return -ENXIO;
 }
 static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
-static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc) { };
 static inline int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp,
 				     struct drm_framebuffer *fb,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index e22d4e535268..f6c0cae7c4af 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -15,3 +15,8 @@ void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
 {
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
 }
+
+void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc)
+{
+	vsp1_du_atomic_begin(crtc->vsp->vsp, crtc->vsp_pipe);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index d91c043bbced..8c22042d4a80 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -12,8 +12,10 @@
 
 #ifdef CONFIG_DRM_RCAR_VSP
 void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
+void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
+static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

