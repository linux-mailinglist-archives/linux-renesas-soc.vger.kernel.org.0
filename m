Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7996DD9C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Apr 2023 13:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbjDKLnh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Apr 2023 07:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjDKLnZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Apr 2023 07:43:25 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D0B2240CD;
        Tue, 11 Apr 2023 04:43:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,336,1673881200"; 
   d="scan'208";a="159045191"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Apr 2023 20:43:07 +0900
Received: from localhost.localdomain (unknown [10.226.93.123])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 70FA94008C6C;
        Tue, 11 Apr 2023 20:43:03 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 05/17] drm: rcar-du: Move rcar_du_vsp_atomic_flush()
Date:   Tue, 11 Apr 2023 12:42:23 +0100
Message-Id: <20230411114235.366042-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411114235.366042-1-biju.das.jz@bp.renesas.com>
References: <20230411114235.366042-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
        T_FILL_THIS_FORM_SHORT autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move rcar_du_vsp_atomic_flush() to RCar DU vsp lib.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Rebased to drm-tip.
v1->v6:
 * Rebased on drm-misc-next and DU-next.
v1:
 * Created the lib suggested by Laurent.

Ref:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220316131100.30685-6-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 13 -------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h     |  2 --
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 14 ++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h |  2 ++
 4 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 66ada10fccd4..55557d9a3bc8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -88,19 +88,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
-void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc)
-{
-	struct vsp1_du_atomic_pipe_config cfg = { { 0, } };
-	struct rcar_du_crtc_state *state;
-
-	state = to_rcar_crtc_state(crtc->crtc.state);
-	cfg.crc = state->crc;
-
-	rcar_du_writeback_setup(crtc, &cfg.writeback);
-
-	vsp1_du_atomic_flush(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
-}
-
 static const u32 rcar_du_vsp_formats[] = {
 	DRM_FORMAT_RGB332,
 	DRM_FORMAT_ARGB4444,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index 83a2f3e85860..b610e6b40304 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -61,7 +61,6 @@ to_rcar_vsp_plane_state(struct drm_plane_state *state)
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs);
 void rcar_du_vsp_enable(struct rcar_du_crtc *crtc);
-void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
 int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		       struct sg_table sg_tables[3]);
 void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
@@ -74,7 +73,6 @@ static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
 	return -ENXIO;
 }
 static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
-static inline void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc) { };
 static inline int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp,
 				     struct drm_framebuffer *fb,
 				     struct sg_table sg_tables[3])
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index a69e0842c98c..ecf0801202b7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -10,6 +10,7 @@
 #include <media/vsp1.h>
 
 #include "rcar_du_drv.h"
+#include "rcar_du_writeback.h"
 
 void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
 {
@@ -20,3 +21,16 @@ void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc)
 {
 	vsp1_du_atomic_begin(crtc->vsp->vsp, crtc->vsp_pipe);
 }
+
+void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc)
+{
+	struct vsp1_du_atomic_pipe_config cfg = { { 0, } };
+	struct rcar_du_crtc_state *state;
+
+	state = to_rcar_crtc_state(crtc->crtc.state);
+	cfg.crc = state->crc;
+
+	rcar_du_writeback_setup(crtc, &cfg.writeback);
+
+	vsp1_du_atomic_flush(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index e0077e832d01..1506e739f714 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -13,9 +13,11 @@
 #ifdef CONFIG_DRM_RCAR_VSP
 void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
+void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
+static inline void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc) { };
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

