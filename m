Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01D1E77DF3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Aug 2023 12:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243974AbjHPKpG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Aug 2023 06:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244041AbjHPKpA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2023 06:45:00 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF042D53
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2023 03:44:42 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d0c:f209:12a7:4ce5])
        by xavier.telenet-ops.be with bizsmtp
        id aAkg2A00745ualL01AkgwQ; Wed, 16 Aug 2023 12:44:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWE0v-000orN-II;
        Wed, 16 Aug 2023 12:44:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWDAx-00676z-3f;
        Wed, 16 Aug 2023 11:50:51 +0200
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
Subject: [PATCH v3 36/41] drm: renesas: shmobile: Atomic conversion part 1
Date:   Wed, 16 Aug 2023 11:50:43 +0200
Message-Id: <fd7a6702490bd431f314d6591551bb39e77e3304.1692178020.git.geert+renesas@glider.be>
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

Implement atomic mode setting for both the primary and overlay planes.
This involves:
  - Moving the primary plane handling code from CRTC mode setting to
    plane handling shared by primary and overlay planes,
  - Adding basic CRTC and mode config atomic mode setting ops, which
    don't do much yet.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - No changes,

v2:
  - No changes.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 126 +++------
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |   3 -
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |   4 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_kms.c  |  13 +-
 .../drm/renesas/shmobile/shmob_drm_plane.c    | 253 ++++++++++++------
 .../drm/renesas/shmobile/shmob_drm_plane.h    |   1 -
 6 files changed, 217 insertions(+), 183 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 365eb3e154130d41..c277f93668825e1c 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -11,6 +11,9 @@
 #include <linux/media-bus-format.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_dma_helper.h>
@@ -199,20 +202,14 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 	struct drm_crtc *crtc = &scrtc->base;
 	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
-	const struct shmob_drm_format_info *format;
-	struct drm_device *dev = &sdev->ddev;
-	struct drm_plane *plane;
+	struct device *dev = sdev->dev;
 	u32 value;
 	int ret;
 
 	if (scrtc->started)
 		return;
 
-	format = shmob_drm_format_info(crtc->primary->fb->format->format);
-	if (WARN_ON(format == NULL))
-		return;
-
-	ret = pm_runtime_resume_and_get(sdev->dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return;
 
@@ -249,23 +246,8 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 	/* Setup geometry, format, frame buffer memory and operation mode. */
 	shmob_drm_crtc_setup_geometry(scrtc);
 
-	/* TODO: Handle YUV colorspaces. Hardcode REC709 for now. */
-	lcdc_write(sdev, LDDFR, format->lddfr | LDDFR_CF1);
-	lcdc_write(sdev, LDMLSR, scrtc->line_size);
-	lcdc_write(sdev, LDSA1R, scrtc->dma[0]);
-	if (shmob_drm_format_is_yuv(format))
-		lcdc_write(sdev, LDSA2R, scrtc->dma[1]);
 	lcdc_write(sdev, LDSM1R, 0);
 
-	/* Word and long word swap. */
-	lcdc_write(sdev, LDDDSR, format->ldddsr);
-
-	/* Setup planes. */
-	drm_for_each_legacy_plane(plane, dev) {
-		if (plane->crtc == crtc)
-			shmob_drm_plane_setup(plane);
-	}
-
 	/* Enable the display output. */
 	lcdc_write(sdev, LDCNT1R, LDCNT1R_DE);
 
@@ -317,42 +299,6 @@ void shmob_drm_crtc_resume(struct shmob_drm_crtc *scrtc)
 	shmob_drm_crtc_start(scrtc);
 }
 
-static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
-					int x, int y)
-{
-	struct drm_crtc *crtc = &scrtc->base;
-	struct drm_framebuffer *fb = crtc->primary->fb;
-	struct drm_gem_dma_object *gem;
-	unsigned int bpp;
-
-	bpp = shmob_drm_format_is_yuv(scrtc->format) ? 8 : scrtc->format->bpp;
-	gem = drm_fb_dma_get_gem_obj(fb, 0);
-	scrtc->dma[0] = gem->dma_addr + fb->offsets[0]
-		      + y * fb->pitches[0] + x * bpp / 8;
-
-	if (shmob_drm_format_is_yuv(scrtc->format)) {
-		bpp = scrtc->format->bpp - 8;
-		gem = drm_fb_dma_get_gem_obj(fb, 1);
-		scrtc->dma[1] = gem->dma_addr + fb->offsets[1]
-			      + y / (bpp == 4 ? 2 : 1) * fb->pitches[1]
-			      + x * (bpp == 16 ? 2 : 1);
-	}
-}
-
-static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
-{
-	struct drm_crtc *crtc = &scrtc->base;
-	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
-
-	shmob_drm_crtc_compute_base(scrtc, crtc->x, crtc->y);
-
-	lcdc_write_mirror(sdev, LDSA1R, scrtc->dma[0]);
-	if (shmob_drm_format_is_yuv(scrtc->format))
-		lcdc_write_mirror(sdev, LDSA2R, scrtc->dma[1]);
-
-	lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
-}
-
 static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
 {
 	return container_of(crtc, struct shmob_drm_crtc, base);
@@ -378,50 +324,45 @@ static void shmob_drm_crtc_mode_prepare(struct drm_crtc *crtc)
 	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
 }
 
-static int shmob_drm_crtc_mode_set(struct drm_crtc *crtc,
-				   struct drm_display_mode *mode,
-				   struct drm_display_mode *adjusted_mode,
-				   int x, int y,
-				   struct drm_framebuffer *old_fb)
+static void shmob_drm_crtc_mode_commit(struct drm_crtc *crtc)
 {
-	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
-	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
-	const struct shmob_drm_format_info *format;
-
-	format = shmob_drm_format_info(crtc->primary->fb->format->format);
-	if (format == NULL) {
-		dev_dbg(sdev->dev, "mode_set: unsupported format %p4cc\n",
-			&crtc->primary->fb->format->format);
-		return -EINVAL;
-	}
-
-	scrtc->format = format;
-	scrtc->line_size = crtc->primary->fb->pitches[0];
-
-	shmob_drm_crtc_compute_base(scrtc, x, y);
+	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
+}
 
+static int shmob_drm_crtc_atomic_check(struct drm_crtc *crtc,
+				       struct drm_atomic_state *state)
+{
 	return 0;
 }
 
-static void shmob_drm_crtc_mode_commit(struct drm_crtc *crtc)
+static void shmob_drm_crtc_atomic_begin(struct drm_crtc *crtc,
+					struct drm_atomic_state *state)
 {
-	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
 }
 
-static int shmob_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
-					struct drm_framebuffer *old_fb)
+static void shmob_drm_crtc_atomic_flush(struct drm_crtc *crtc,
+					struct drm_atomic_state *state)
 {
-	shmob_drm_crtc_update_base(to_shmob_crtc(crtc));
+	struct drm_pending_vblank_event *event;
+	struct drm_device *dev = crtc->dev;
+	unsigned long flags;
 
-	return 0;
+	if (crtc->state->event) {
+		spin_lock_irqsave(&dev->event_lock, flags);
+		event = crtc->state->event;
+		crtc->state->event = NULL;
+		drm_crtc_send_vblank_event(crtc, event);
+		spin_unlock_irqrestore(&dev->event_lock, flags);
+	}
 }
 
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
 	.dpms = shmob_drm_crtc_dpms,
 	.prepare = shmob_drm_crtc_mode_prepare,
 	.commit = shmob_drm_crtc_mode_commit,
-	.mode_set = shmob_drm_crtc_mode_set,
-	.mode_set_base = shmob_drm_crtc_mode_set_base,
+	.atomic_check = shmob_drm_crtc_atomic_check,
+	.atomic_begin = shmob_drm_crtc_atomic_begin,
+	.atomic_flush = shmob_drm_crtc_atomic_flush,
 };
 
 static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
@@ -441,8 +382,7 @@ static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
 	}
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 
-	crtc->primary->fb = fb;
-	shmob_drm_crtc_update_base(scrtc);
+	drm_atomic_set_fb_for_plane(crtc->primary->state, fb);
 
 	if (event) {
 		event->pipe = 0;
@@ -489,9 +429,12 @@ static void shmob_drm_disable_vblank(struct drm_crtc *crtc)
 }
 
 static const struct drm_crtc_funcs crtc_funcs = {
+	.reset = drm_atomic_helper_crtc_reset,
 	.destroy = drm_crtc_cleanup,
-	.set_config = drm_crtc_helper_set_config,
+	.set_config = drm_atomic_helper_set_config,
 	.page_flip = shmob_drm_crtc_page_flip,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 	.enable_vblank = shmob_drm_enable_vblank,
 	.disable_vblank = shmob_drm_disable_vblank,
 };
@@ -627,8 +570,11 @@ static void shmob_drm_connector_destroy(struct drm_connector *connector)
 
 static const struct drm_connector_funcs connector_funcs = {
 	.dpms = drm_helper_connector_dpms,
+	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = shmob_drm_connector_destroy,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static struct drm_connector *
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
index b9863e026e8a9b83..fe41e42d6cc55275 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
@@ -29,9 +29,6 @@ struct shmob_drm_crtc {
 	wait_queue_head_t flip_wait;
 	int dpms;
 
-	const struct shmob_drm_format_info *format;
-	unsigned long dma[2];
-	unsigned int line_size;
 	bool started;
 };
 
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 51a9a6955d1fb0fb..e4e88e66de5c3d3b 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -16,7 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
-#include <drm/drm_crtc_helper.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -173,7 +173,7 @@ static int shmob_drm_remove(struct platform_device *pdev)
 	struct drm_device *ddev = &sdev->ddev;
 
 	drm_dev_unregister(ddev);
-	drm_helper_force_disable_all(ddev);
+	drm_atomic_helper_shutdown(ddev);
 	drm_kms_helper_poll_fini(ddev);
 	return 0;
 }
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
index 20316907030b2789..4202ab00fb0cf487 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
@@ -7,6 +7,7 @@
  * Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
@@ -17,6 +18,7 @@
 #include "shmob_drm_crtc.h"
 #include "shmob_drm_drv.h"
 #include "shmob_drm_kms.h"
+#include "shmob_drm_plane.h"
 #include "shmob_drm_regs.h"
 
 /* -----------------------------------------------------------------------------
@@ -147,13 +149,16 @@ shmob_drm_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 
 static const struct drm_mode_config_funcs shmob_drm_mode_config_funcs = {
 	.fb_create = shmob_drm_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
 };
 
 int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
 {
+	struct drm_device *dev = &sdev->ddev;
 	int ret;
 
-	ret = drmm_mode_config_init(&sdev->ddev);
+	ret = drmm_mode_config_init(dev);
 	if (ret)
 		return ret;
 
@@ -169,7 +174,9 @@ int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
 	if (ret < 0)
 		return ret;
 
-	drm_kms_helper_poll_init(&sdev->ddev);
+	drm_mode_config_reset(dev);
+
+	drm_kms_helper_poll_init(dev);
 
 	sdev->ddev.mode_config.min_width = 0;
 	sdev->ddev.mode_config.min_height = 0;
@@ -177,7 +184,5 @@ int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
 	sdev->ddev.mode_config.max_height = 4095;
 	sdev->ddev.mode_config.funcs = &shmob_drm_mode_config_funcs;
 
-	drm_helper_disable_unused_functions(&sdev->ddev);
-
 	return 0;
 }
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index d0a9299784d4a7cc..8f9a728affde8375 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -7,6 +7,8 @@
  * Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -22,17 +24,13 @@
 struct shmob_drm_plane {
 	struct drm_plane base;
 	unsigned int index;
-	unsigned int alpha;
+};
+
+struct shmob_drm_plane_state {
+	struct drm_plane_state base;
 
 	const struct shmob_drm_format_info *format;
-	unsigned long dma[2];
-
-	unsigned int src_x;
-	unsigned int src_y;
-	unsigned int crtc_x;
-	unsigned int crtc_y;
-	unsigned int crtc_w;
-	unsigned int crtc_h;
+	u32 dma[2];
 };
 
 static inline struct shmob_drm_plane *to_shmob_plane(struct drm_plane *plane)
@@ -40,36 +38,65 @@ static inline struct shmob_drm_plane *to_shmob_plane(struct drm_plane *plane)
 	return container_of(plane, struct shmob_drm_plane, base);
 }
 
-static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
-					 struct drm_framebuffer *fb,
-					 int x, int y)
+static inline struct shmob_drm_plane_state *to_shmob_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct shmob_drm_plane_state, base);
+}
+
+static void shmob_drm_plane_compute_base(struct shmob_drm_plane_state *sstate)
 {
+	struct drm_framebuffer *fb = sstate->base.fb;
+	unsigned int x = sstate->base.src_x >> 16;
+	unsigned int y = sstate->base.src_y >> 16;
 	struct drm_gem_dma_object *gem;
 	unsigned int bpp;
 
-	bpp = shmob_drm_format_is_yuv(splane->format) ? 8 : splane->format->bpp;
+	bpp = shmob_drm_format_is_yuv(sstate->format) ? 8 : sstate->format->bpp;
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
-	splane->dma[0] = gem->dma_addr + fb->offsets[0]
+	sstate->dma[0] = gem->dma_addr + fb->offsets[0]
 		       + y * fb->pitches[0] + x * bpp / 8;
 
-	if (shmob_drm_format_is_yuv(splane->format)) {
-		bpp = splane->format->bpp - 8;
+	if (shmob_drm_format_is_yuv(sstate->format)) {
+		bpp = sstate->format->bpp - 8;
 		gem = drm_fb_dma_get_gem_obj(fb, 1);
-		splane->dma[1] = gem->dma_addr + fb->offsets[1]
+		sstate->dma[1] = gem->dma_addr + fb->offsets[1]
 			       + y / (bpp == 4 ? 2 : 1) * fb->pitches[1]
 			       + x * (bpp == 16 ? 2 : 1);
 	}
 }
 
-static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
-				    struct drm_framebuffer *fb)
+static void shmob_drm_primary_plane_setup(struct shmob_drm_plane *splane,
+					  struct drm_plane_state *state)
 {
+	struct shmob_drm_plane_state *sstate = to_shmob_plane_state(state);
 	struct shmob_drm_device *sdev = to_shmob_device(splane->base.dev);
+	struct drm_framebuffer *fb = state->fb;
+
+	/* TODO: Handle YUV colorspaces. Hardcode REC709 for now. */
+	lcdc_write(sdev, LDDFR, sstate->format->lddfr | LDDFR_CF1);
+	lcdc_write(sdev, LDMLSR, fb->pitches[0]);
+
+	/* Word and long word swap. */
+	lcdc_write(sdev, LDDDSR, sstate->format->ldddsr);
+
+	lcdc_write_mirror(sdev, LDSA1R, sstate->dma[0]);
+	if (shmob_drm_format_is_yuv(sstate->format))
+		lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
+
+	lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
+}
+
+static void shmob_drm_overlay_plane_setup(struct shmob_drm_plane *splane,
+					  struct drm_plane_state *state)
+{
+	struct shmob_drm_plane_state *sstate = to_shmob_plane_state(state);
+	struct shmob_drm_device *sdev = to_shmob_device(splane->base.dev);
+	struct drm_framebuffer *fb = state->fb;
 	u32 format;
 
 	/* TODO: Support ROP3 mode */
-	format = LDBBSIFR_EN | (splane->alpha << LDBBSIFR_LAY_SHIFT) |
-		 splane->format->ldbbsifr;
+	format = LDBBSIFR_EN | ((state->alpha >> 8) << LDBBSIFR_LAY_SHIFT) |
+		 sstate->format->ldbbsifr;
 
 #define plane_reg_dump(sdev, splane, reg) \
 	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x 0x%08x\n", __func__, \
@@ -91,19 +118,17 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 	lcdc_write(sdev, LDBnBSIFR(splane->index), format);
 
 	lcdc_write(sdev, LDBnBSSZR(splane->index),
-		   (splane->crtc_h << LDBBSSZR_BVSS_SHIFT) |
-		   (splane->crtc_w << LDBBSSZR_BHSS_SHIFT));
+		   (state->crtc_h << LDBBSSZR_BVSS_SHIFT) |
+		   (state->crtc_w << LDBBSSZR_BHSS_SHIFT));
 	lcdc_write(sdev, LDBnBLOCR(splane->index),
-		   (splane->crtc_y << LDBBLOCR_CVLC_SHIFT) |
-		   (splane->crtc_x << LDBBLOCR_CHLC_SHIFT));
+		   (state->crtc_y << LDBBLOCR_CVLC_SHIFT) |
+		   (state->crtc_x << LDBBLOCR_CHLC_SHIFT));
 	lcdc_write(sdev, LDBnBSMWR(splane->index),
 		   fb->pitches[0] << LDBBSMWR_BSMW_SHIFT);
 
-	shmob_drm_plane_compute_base(splane, fb, splane->src_x, splane->src_y);
-
-	lcdc_write(sdev, LDBnBSAYR(splane->index), splane->dma[0]);
-	if (shmob_drm_format_is_yuv(splane->format))
-		lcdc_write(sdev, LDBnBSACR(splane->index), splane->dma[1]);
+	lcdc_write(sdev, LDBnBSAYR(splane->index), sstate->dma[0]);
+	if (shmob_drm_format_is_yuv(sstate->format))
+		lcdc_write(sdev, LDBnBSACR(splane->index), sstate->dma[1]);
 
 	lcdc_write(sdev, LDBCR,
 		   LDBCR_UPF(splane->index) | LDBCR_UPD(splane->index));
@@ -118,76 +143,143 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 	plane_reg_dump(sdev, splane, LDBnBSACR);
 }
 
-void shmob_drm_plane_setup(struct drm_plane *plane)
+static int shmob_drm_plane_atomic_check(struct drm_plane *plane,
+					struct drm_atomic_state *state)
 {
-	struct shmob_drm_plane *splane = to_shmob_plane(plane);
-
-	if (plane->fb == NULL)
-		return;
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct shmob_drm_plane_state *sstate = to_shmob_plane_state(new_plane_state);
+	struct drm_crtc_state *crtc_state;
+	bool is_primary = plane->type == DRM_PLANE_TYPE_PRIMARY;
+	int ret;
+
+	if (!new_plane_state->crtc) {
+		/*
+		 * The visible field is not reset by the DRM core but only
+		 * updated by drm_atomic_helper_check_plane_state(), set it
+		 * manually.
+		 */
+		new_plane_state->visible = false;
+		sstate->format = NULL;
+		return 0;
+	}
 
-	__shmob_drm_plane_setup(splane, plane->fb);
-}
+	crtc_state = drm_atomic_get_crtc_state(state, new_plane_state->crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
 
-static int
-shmob_drm_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
-		       struct drm_framebuffer *fb, int crtc_x, int crtc_y,
-		       unsigned int crtc_w, unsigned int crtc_h,
-		       uint32_t src_x, uint32_t src_y,
-		       uint32_t src_w, uint32_t src_h,
-		       struct drm_modeset_acquire_ctx *ctx)
-{
-	struct shmob_drm_device *sdev = to_shmob_device(plane->dev);
-	struct shmob_drm_plane *splane = to_shmob_plane(plane);
-	const struct shmob_drm_format_info *format;
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  !is_primary, true);
+	if (ret < 0)
+		return ret;
 
-	format = shmob_drm_format_info(fb->format->format);
-	if (format == NULL) {
-		dev_dbg(sdev->dev, "update_plane: unsupported format %p4cc\n",
-			&fb->format->format);
-		return -EINVAL;
+	if (!new_plane_state->visible) {
+		sstate->format = NULL;
+		return 0;
 	}
 
-	if (src_w >> 16 != crtc_w || src_h >> 16 != crtc_h) {
-		dev_dbg(sdev->dev, "%s: scaling not supported\n", __func__);
+	sstate->format = shmob_drm_format_info(new_plane_state->fb->format->format);
+	if (!sstate->format) {
+		dev_dbg(plane->dev->dev,
+			"plane_atomic_check: unsupported format %p4cc\n",
+			&new_plane_state->fb->format->format);
 		return -EINVAL;
 	}
 
-	splane->format = format;
-
-	splane->src_x = src_x >> 16;
-	splane->src_y = src_y >> 16;
-	splane->crtc_x = crtc_x;
-	splane->crtc_y = crtc_y;
-	splane->crtc_w = crtc_w;
-	splane->crtc_h = crtc_h;
+	shmob_drm_plane_compute_base(sstate);
 
-	__shmob_drm_plane_setup(splane, fb);
 	return 0;
 }
 
-static int shmob_drm_plane_disable(struct drm_plane *plane,
-				   struct drm_modeset_acquire_ctx *ctx)
+static void shmob_drm_plane_atomic_update(struct drm_plane *plane,
+					  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct shmob_drm_plane *splane = to_shmob_plane(plane);
+
+	if (!new_plane_state->visible)
+		return;
+
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+		shmob_drm_primary_plane_setup(splane, new_plane_state);
+	else
+		shmob_drm_overlay_plane_setup(splane, new_plane_state);
+}
+
+static void shmob_drm_plane_atomic_disable(struct drm_plane *plane,
+					   struct drm_atomic_state *state)
+{
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
 	struct shmob_drm_device *sdev = to_shmob_device(plane->dev);
 	struct shmob_drm_plane *splane = to_shmob_plane(plane);
 
-	splane->format = NULL;
+	if (!old_state->crtc)
+		return;
+
+	if (plane->type != DRM_PLANE_TYPE_OVERLAY)
+		return;
 
 	lcdc_write(sdev, LDBCR, LDBCR_UPC(splane->index));
 	lcdc_write(sdev, LDBnBSIFR(splane->index), 0);
 	lcdc_write(sdev, LDBCR,
-		   LDBCR_UPF(splane->index) | LDBCR_UPD(splane->index));
-	return 0;
+			 LDBCR_UPF(splane->index) | LDBCR_UPD(splane->index));
+}
+
+static struct drm_plane_state *
+shmob_drm_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct shmob_drm_plane_state *state;
+	struct shmob_drm_plane_state *copy;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	state = to_shmob_plane_state(plane->state);
+	copy = kmemdup(state, sizeof(*state), GFP_KERNEL);
+	if (copy == NULL)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
+
+	return &copy->base;
 }
 
-static const struct drm_plane_funcs shmob_drm_primary_plane_funcs = {
-	.update_plane = drm_plane_helper_update_primary,
-	.disable_plane = drm_plane_helper_disable_primary,
+static void shmob_drm_plane_atomic_destroy_state(struct drm_plane *plane,
+						 struct drm_plane_state *state)
+{
+	__drm_atomic_helper_plane_destroy_state(state);
+	kfree(to_shmob_plane_state(state));
+}
+
+static void shmob_drm_plane_reset(struct drm_plane *plane)
+{
+	struct shmob_drm_plane_state *state;
+
+	if (plane->state) {
+		shmob_drm_plane_atomic_destroy_state(plane, plane->state);
+		plane->state = NULL;
+	}
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (state == NULL)
+		return;
+
+	__drm_atomic_helper_plane_reset(plane, &state->base);
+}
+
+static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
+	.atomic_check = shmob_drm_plane_atomic_check,
+	.atomic_update = shmob_drm_plane_atomic_update,
+	.atomic_disable = shmob_drm_plane_atomic_disable,
 };
 
-static const struct drm_plane_funcs shmob_drm_overlay_plane_funcs = {
-	.update_plane = shmob_drm_plane_update,
-	.disable_plane = shmob_drm_plane_disable,
+static const struct drm_plane_funcs shmob_drm_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.reset = shmob_drm_plane_reset,
+	.atomic_duplicate_state = shmob_drm_plane_atomic_duplicate_state,
+	.atomic_destroy_state = shmob_drm_plane_atomic_destroy_state,
 };
 
 static const uint32_t formats[] = {
@@ -207,24 +299,19 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
 					 enum drm_plane_type type,
 					 unsigned int index)
 {
-	const struct drm_plane_funcs *funcs;
 	struct shmob_drm_plane *splane;
 
-	if (type == DRM_PLANE_TYPE_PRIMARY)
-		funcs = &shmob_drm_primary_plane_funcs;
-	else
-		funcs = &shmob_drm_overlay_plane_funcs;
-
 	splane = drmm_universal_plane_alloc(&sdev->ddev,
 					    struct shmob_drm_plane, base, 1,
-					    funcs, formats,
+					    &shmob_drm_plane_funcs, formats,
 					    ARRAY_SIZE(formats),  NULL, type,
 					    NULL);
 	if (IS_ERR(splane))
 		return ERR_CAST(splane);
 
 	splane->index = index;
-	splane->alpha = 255;
+
+	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
 
 	return &splane->base;
 }
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
index 8ad12129014016fa..dcfddd605899b05d 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.h
@@ -16,6 +16,5 @@ struct shmob_drm_device;
 struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
 					 enum drm_plane_type type,
 					 unsigned int index);
-void shmob_drm_plane_setup(struct drm_plane *plane);
 
 #endif /* __SHMOB_DRM_PLANE_H__ */
-- 
2.34.1

