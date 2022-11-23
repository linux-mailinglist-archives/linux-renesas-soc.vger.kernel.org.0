Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D941E636719
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Nov 2022 18:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238688AbiKWRaK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Nov 2022 12:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239114AbiKWR3o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 12:29:44 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3963C8CF2D
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Nov 2022 09:29:37 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; 
   d="scan'208";a="143666646"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Nov 2022 02:29:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D699640ADCCF;
        Thu, 24 Nov 2022 02:29:33 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 07/19] drm: rcar-du: Move rcar_du_dumb_create()
Date:   Wed, 23 Nov 2022 17:28:54 +0000
Message-Id: <20221123172906.2919734-8-biju.das.jz@bp.renesas.com>
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

Move rcar_du_dumb_create() to RCar DU KMS lib.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * Rebased on drm-misc-next and DU-next.
v1->v2:
 * Rebased on drm-misc-next and DU-next.
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 21 -----------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.h     |  5 ----
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 28 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  7 ++++++
 4 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 3141d447e979..4b5511a20313 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -81,27 +81,6 @@ struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
 	return gem_obj;
 }
 
-int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
-			struct drm_mode_create_dumb *args)
-{
-	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
-	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	unsigned int align;
-
-	/*
-	 * The R8A7779 DU requires a 16 pixels pitch alignment as documented,
-	 * but the R8A7790 DU seems to require a 128 bytes pitch alignment.
-	 */
-	if (rcar_du_needs(rcdu, RCAR_DU_QUIRK_ALIGN_128B))
-		align = 128;
-	else
-		align = 16 * args->bpp / 8;
-
-	args->pitch = roundup(min_pitch, align);
-
-	return drm_gem_dma_dumb_create_internal(file, dev, args);
-}
-
 static struct drm_framebuffer *
 rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		  const struct drm_mode_fb_cmd2 *mode_cmd)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
index 2d4b8e608989..821eac74077f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
@@ -13,18 +13,13 @@
 #include "rcar_du_kms_lib.h"
 
 struct dma_buf_attachment;
-struct drm_file;
 struct drm_device;
 struct drm_gem_object;
-struct drm_mode_create_dumb;
 struct rcar_du_device;
 struct sg_table;
 
 int rcar_du_modeset_init(struct rcar_du_device *rcdu);
 
-int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
-			struct drm_mode_create_dumb *args);
-
 struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
 				struct dma_buf_attachment *attach,
 				struct sg_table *sgt);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index 97c526dae521..0a2b1c6c1ea6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -7,10 +7,13 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <drm/drm_device.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_dma_helper.h>
 
 #include <linux/videodev2.h>
 
+#include "rcar_du_drv.h"
 #include "rcar_du_kms.h"
 #include "rcar_du_regs.h"
 
@@ -303,3 +306,28 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
 
 	return NULL;
 }
+
+/* -----------------------------------------------------------------------------
+ * Frame buffer
+ */
+
+int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
+			struct drm_mode_create_dumb *args)
+{
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
+	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	unsigned int align;
+
+	/*
+	 * The R8A7779 DU requires a 16 pixels pitch alignment as documented,
+	 * but the R8A7790 DU seems to require a 128 bytes pitch alignment.
+	 */
+	if (rcar_du_needs(rcdu, RCAR_DU_QUIRK_ALIGN_128B))
+		align = 128;
+	else
+		align = 16 * args->bpp / 8;
+
+	args->pitch = roundup(min_pitch, align);
+
+	return drm_gem_dma_dumb_create_internal(file, dev, args);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index 674a38d24917..33f96e96f6a2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -12,6 +12,10 @@
 
 #include <linux/types.h>
 
+struct drm_device;
+struct drm_file;
+struct drm_mode_create_dumb;
+
 struct rcar_du_format_info {
 	u32 fourcc;
 	u32 v4l2;
@@ -24,4 +28,7 @@ struct rcar_du_format_info {
 
 const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc);
 
+int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
+			struct drm_mode_create_dumb *args);
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

