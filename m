Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE22636711
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Nov 2022 18:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238965AbiKWR35 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Nov 2022 12:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239069AbiKWR3h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 12:29:37 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B91D58CB9C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Nov 2022 09:29:23 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; 
   d="scan'208";a="140988270"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Nov 2022 02:29:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6A2BB40ADCCF;
        Thu, 24 Nov 2022 02:29:20 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 03/19] drm: rcar-du: Add vsp lib support
Date:   Wed, 23 Nov 2022 17:28:50 +0000
Message-Id: <20221123172906.2919734-4-biju.das.jz@bp.renesas.com>
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

Add RCar DU vsp lib support by moving rcar_du_vsp_disable()
to the lib file so that same function can be used by both
RCar and RZ/G2L DU VSP drivers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * Rebased on drm-misc-next and DU-next.
v1->v2:
 * Rebased on drm-misc-next and DU-next.
---
 drivers/gpu/drm/rcar-du/Kconfig           |  5 +++++
 drivers/gpu/drm/rcar-du/Makefile          |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |  5 -----
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h     |  4 ++--
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 17 +++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h | 19 +++++++++++++++++++
 6 files changed, 44 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 94a7abd5d499..12fb2bb873dc 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -79,3 +79,8 @@ config DRM_RCAR_LIB
 	bool
 	default y
 	depends on DRM_RCAR_DU
+
+config DRM_RCAR_VSP_LIB
+	bool
+	default y
+	depends on DRM_RCAR_VSP
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 3ce410300334..8fc924cf37a7 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -10,6 +10,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LIB) += rcar_du_encoder_lib.o \
 				      rcar_du_kms_lib.o
 
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
+rcar-du-drm-$(CONFIG_DRM_RCAR_VSP_LIB)	+= rcar_du_vsp_lib.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
 
 obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index e465aef41585..bed3f2a3c4a5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -88,11 +88,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
-void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
-{
-	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
-}
-
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc)
 {
 	vsp1_du_atomic_begin(crtc->vsp->vsp, crtc->vsp_pipe);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index 67630f0b6599..8fbfa86c93e0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -12,6 +12,8 @@
 
 #include <drm/drm_plane.h>
 
+#include "rcar_du_vsp_lib.h"
+
 struct drm_framebuffer;
 struct rcar_du_format_info;
 struct rcar_du_vsp;
@@ -59,7 +61,6 @@ to_rcar_vsp_plane_state(struct drm_plane_state *state)
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs);
 void rcar_du_vsp_enable(struct rcar_du_crtc *crtc);
-void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
 int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
@@ -74,7 +75,6 @@ static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
 	return -ENXIO;
 }
 static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
-static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc) { };
 static inline int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
new file mode 100644
index 000000000000..e22d4e535268
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * R-Car Display Unit VSP-Based Compositor Lib
+ *
+ * Copyright (C) 2015-2022 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#include <media/vsp1.h>
+
+#include "rcar_du_drv.h"
+
+void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
+{
+	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
new file mode 100644
index 000000000000..d91c043bbced
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * R-Car Display Unit VSP-Based Compositor Lib
+ *
+ * Copyright (C) 2015-2022 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#ifndef __RCAR_DU_VSP_LIB_H__
+#define __RCAR_DU_VSP_LIB_H__
+
+#ifdef CONFIG_DRM_RCAR_VSP
+void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
+#else
+static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
+#endif
+
+#endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

