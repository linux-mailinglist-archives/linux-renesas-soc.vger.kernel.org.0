Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7F177DF3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Aug 2023 12:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243953AbjHPKpE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Aug 2023 06:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244034AbjHPKo6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2023 06:44:58 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D2E2D58
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2023 03:44:42 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d0c:f209:12a7:4ce5])
        by albert.telenet-ops.be with bizsmtp
        id aAkg2A00h45ualL06AkgQX; Wed, 16 Aug 2023 12:44:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWE0w-000oru-9j;
        Wed, 16 Aug 2023 12:44:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWDAw-00676B-Sp;
        Wed, 16 Aug 2023 11:50:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 26/41] drm: renesas: shmobile: Unify plane allocation
Date:   Wed, 16 Aug 2023 11:50:33 +0200
Message-Id: <d0176fcf03d08a1f0b89b320612c4cc35ef6191c.1692178020.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692178020.git.geert+renesas@glider.be>
References: <cover.1692178020.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Unify primary and overlay plane allocation:
  - Enhance shmob_drm_plane_create() so it can be used to create the
    primary plane, too,
  - Move overlay plane creation next to primary plane creation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - No changes,

v2:
  - Pass plane type to shmob_drm_plane_create() to avoid having to shift
    all overlay plane indices by one,
  - Rename primary_plane_funcs to shmob_drm_primary_plane_funcs,
  - Rename shmob_drm_plane_funcs to shmob_drm_overlay_plane_funcs.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 39 +++++--------------
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  9 -----
 .../drm/renesas/shmobile/shmob_drm_plane.c    | 31 +++++++++++----
 .../drm/renesas/shmobile/shmob_drm_plane.h    |  4 +-
 4 files changed, 36 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index caafd04acd3d46d0..564051b505ed4ac5 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -19,7 +19,6 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
@@ -453,47 +452,29 @@ static const struct drm_crtc_funcs crtc_funcs = {
 	.disable_vblank = shmob_drm_disable_vblank,
 };
 
-static const uint32_t modeset_formats[] = {
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_NV21,
-	DRM_FORMAT_NV16,
-	DRM_FORMAT_NV61,
-	DRM_FORMAT_NV24,
-	DRM_FORMAT_NV42,
-};
-
-static const struct drm_plane_funcs primary_plane_funcs = {
-	DRM_PLANE_NON_ATOMIC_FUNCS,
-};
-
 int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 {
 	struct drm_crtc *crtc = &sdev->crtc.crtc;
-	struct drm_plane *primary;
+	struct drm_plane *primary, *plane;
+	unsigned int i;
 	int ret;
 
 	sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
 
-	primary = __drm_universal_plane_alloc(&sdev->ddev, sizeof(*primary), 0,
-					      0, &primary_plane_funcs,
-					      modeset_formats,
-					      ARRAY_SIZE(modeset_formats),
-					      NULL, DRM_PLANE_TYPE_PRIMARY,
-					      NULL);
+	primary = shmob_drm_plane_create(sdev, DRM_PLANE_TYPE_PRIMARY, 0);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
+	for (i = 1; i < 5; ++i) {
+		plane = shmob_drm_plane_create(sdev, DRM_PLANE_TYPE_OVERLAY, i);
+		if (IS_ERR(plane))
+			return PTR_ERR(plane);
+	}
+
 	ret = drm_crtc_init_with_planes(&sdev->ddev, crtc, primary, NULL,
 					&crtc_funcs, NULL);
-	if (ret < 0) {
-		drm_plane_cleanup(primary);
-		kfree(primary);
+	if (ret < 0)
 		return ret;
-	}
 
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
 
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 8da3054f26b2d235..6bc05a9e9661915e 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -181,7 +181,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
 	struct shmob_drm_device *sdev;
 	struct drm_device *ddev;
-	unsigned int i;
 	int ret;
 
 	if (pdata == NULL) {
@@ -222,14 +221,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "failed to initialize mode setting\n");
 
-	for (i = 0; i < 4; ++i) {
-		ret = shmob_drm_plane_create(sdev, i);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to create plane %u\n", i);
-			goto err_modeset_cleanup;
-		}
-	}
-
 	ret = drm_vblank_init(ddev, 1);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to initialize vblank\n");
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index c58b9dca34736342..3518f8900c0d1f9e 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -12,6 +12,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_plane_helper.h>
 
 #include "shmob_drm_drv.h"
 #include "shmob_drm_kms.h"
@@ -179,7 +180,12 @@ static int shmob_drm_plane_disable(struct drm_plane *plane,
 	return 0;
 }
 
-static const struct drm_plane_funcs shmob_drm_plane_funcs = {
+static const struct drm_plane_funcs shmob_drm_primary_plane_funcs = {
+	.update_plane = drm_plane_helper_update_primary,
+	.disable_plane = drm_plane_helper_disable_primary,
+};
+
+static const struct drm_plane_funcs shmob_drm_overlay_plane_funcs = {
 	.update_plane = shmob_drm_plane_update,
 	.disable_plane = shmob_drm_plane_disable,
 };
@@ -197,19 +203,28 @@ static const uint32_t formats[] = {
 	DRM_FORMAT_NV42,
 };
 
-int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index)
+struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
+					 enum drm_plane_type type,
+					 unsigned int index)
 {
+	const struct drm_plane_funcs *funcs;
 	struct shmob_drm_plane *splane;
 
-	splane = drmm_universal_plane_alloc(&sdev->ddev, struct shmob_drm_plane,
-					    plane, 1, &shmob_drm_plane_funcs,
-					    formats, ARRAY_SIZE(formats), NULL,
-					    DRM_PLANE_TYPE_OVERLAY, NULL);
+	if (type == DRM_PLANE_TYPE_PRIMARY)
+		funcs = &shmob_drm_primary_plane_funcs;
+	else
+		funcs = &shmob_drm_overlay_plane_funcs;
+
+	splane = drmm_universal_plane_alloc(&sdev->ddev,
+					    struct shmob_drm_plane, plane, 1,
+					    funcs, formats,
+					    ARRAY_SIZE(formats),  NULL, type,
+					    NULL);
 	if (IS_ERR(splane))
-		return PTR_ERR(splane);
+		return ERR_CAST(splane);
 
 	splane->index = index;
 	splane->alpha = 255;
 
-	return 0;
+	return &splane->plane;
 }
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
index e72b21a4288fc23f..8ad12129014016fa 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
@@ -13,7 +13,9 @@
 struct drm_plane;
 struct shmob_drm_device;
 
-int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index);
+struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
+					 enum drm_plane_type type,
+					 unsigned int index);
 void shmob_drm_plane_setup(struct drm_plane *plane);
 
 #endif /* __SHMOB_DRM_PLANE_H__ */
-- 
2.34.1

