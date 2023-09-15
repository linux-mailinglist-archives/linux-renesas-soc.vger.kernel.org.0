Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 361CD7A1988
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Sep 2023 10:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233592AbjIOIzN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Sep 2023 04:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbjIOIyr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2023 04:54:47 -0400
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [IPv6:2a02:1800:120:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552ED271C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2023 01:54:20 -0700 (PDT)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by cantor.telenet-ops.be (Postfix) with ESMTPS id 4Rn7KN5db3z4xHdW
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2023 10:54:16 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7135:da8b:ba1d:1a7c])
        by albert.telenet-ops.be with bizsmtp
        id m8uF2A00d3q21w7068uFYo; Fri, 15 Sep 2023 10:54:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qh4aK-003lIS-8x;
        Fri, 15 Sep 2023 10:54:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qh4ad-00Gddk-9R;
        Fri, 15 Sep 2023 10:54:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 39/41] drm: renesas: shmobile: Remove internal CRTC state tracking
Date:   Fri, 15 Sep 2023 10:53:54 +0200
Message-Id: <905b9ca72f43d40438c8cb1199cde140eb123204.1694767209.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694767208.git.geert+renesas@glider.be>
References: <cover.1694767208.git.geert+renesas@glider.be>
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

Now the suspend/resume methods no longer need to look at internal driver
state, the dpms and started fields in the shmob_drm_crtc structure can
be removed, as well as the shmob_drm_crtc_dpms() wrapper.  After this,
shmob_drm_crtc_atomic_{en,dis}able() became just wrappers around
shmob_drm_crtc_st{art,op}(), so inline the latter.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v4:
  - No changes,

v3:
  - No changes,

v2:
  - Add Reviewed-by,
  - Inline shmob_drm_crtc_st{art,op}().
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 66 ++++---------------
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  3 -
 2 files changed, 11 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index a176cd3e494ed2fd..e4d176b1f47654a8 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -191,25 +191,21 @@ static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
 	}
 }
 
-/*
- * shmob_drm_crtc_start - Configure and start the LCDC
- * @scrtc: the SH Mobile CRTC
- *
- * Configure and start the LCDC device. External devices (clocks, MERAM, panels,
- * ...) are not touched by this function.
- */
-static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
+static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &scrtc->base;
+	return container_of(crtc, struct shmob_drm_crtc, base);
+}
+
+static void shmob_drm_crtc_atomic_enable(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state)
+{
+	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
 	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
 	struct device *dev = sdev->dev;
 	u32 value;
 	int ret;
 
-	if (scrtc->started)
-		return;
-
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return;
@@ -256,18 +252,14 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 
 	/* Turn vertical blank interrupt reporting back on. */
 	drm_crtc_vblank_on(crtc);
-
-	scrtc->started = true;
 }
 
-static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
+static void shmob_drm_crtc_atomic_disable(struct drm_crtc *crtc,
+					  struct drm_atomic_state *state)
 {
-	struct drm_crtc *crtc = &scrtc->base;
+	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
 	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 
-	if (!scrtc->started)
-		return;
-
 	/*
 	 * Disable vertical blank interrupt reporting.  We first need to wait
 	 * for page flip completion before stopping the CRTC as userspace
@@ -283,28 +275,6 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
 	lcdc_write(sdev, LDCNT1R, 0);
 
 	pm_runtime_put(sdev->dev);
-
-	scrtc->started = false;
-}
-
-static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
-{
-	return container_of(crtc, struct shmob_drm_crtc, base);
-}
-
-static void shmob_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
-{
-	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
-
-	if (scrtc->dpms == mode)
-		return;
-
-	if (mode == DRM_MODE_DPMS_ON)
-		shmob_drm_crtc_start(scrtc);
-	else
-		shmob_drm_crtc_stop(scrtc);
-
-	scrtc->dpms = mode;
 }
 
 static void shmob_drm_crtc_atomic_flush(struct drm_crtc *crtc,
@@ -323,18 +293,6 @@ static void shmob_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	}
 }
 
-static void shmob_drm_crtc_atomic_enable(struct drm_crtc *crtc,
-					 struct drm_atomic_state *state)
-{
-	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
-}
-
-static void shmob_drm_crtc_atomic_disable(struct drm_crtc *crtc,
-					  struct drm_atomic_state *state)
-{
-	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
-}
-
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
 	.atomic_flush = shmob_drm_crtc_atomic_flush,
 	.atomic_enable = shmob_drm_crtc_atomic_enable,
@@ -424,8 +382,6 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 
 	init_waitqueue_head(&sdev->crtc.flip_wait);
 
-	sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
-
 	primary = shmob_drm_plane_create(sdev, DRM_PLANE_TYPE_PRIMARY, 0);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
index 37380c815f1f5a08..89a0746f9a35807d 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
@@ -27,9 +27,6 @@ struct shmob_drm_crtc {
 
 	struct drm_pending_vblank_event *event;
 	wait_queue_head_t flip_wait;
-	int dpms;
-
-	bool started;
 };
 
 struct shmob_drm_connector {
-- 
2.34.1

