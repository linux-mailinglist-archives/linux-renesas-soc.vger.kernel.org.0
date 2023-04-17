Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9EB6E4A3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Apr 2023 15:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjDQNoz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Apr 2023 09:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbjDQNoy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Apr 2023 09:44:54 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33126172C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 06:44:51 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by andre.telenet-ops.be with bizsmtp
        id lpko2900Q1C8whw01pkoLF; Mon, 17 Apr 2023 15:44:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1poP4u-00H0W2-0v;
        Mon, 17 Apr 2023 15:40:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1poP5n-007zAR-MN;
        Mon, 17 Apr 2023 15:40:27 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/5] drm: shmobile: Switch to drm_crtc_init_with_planes()
Date:   Mon, 17 Apr 2023 15:40:23 +0200
Message-Id: <dd2e06b6556bac9443b2f23c950f747342cc1032.1681734821.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681734821.git.geert+renesas@glider.be>
References: <cover.1681734821.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SH-Mobile DRM driver uses the legacy drm_crtc_init(), which
advertizes only the formats in safe_modeset_formats[] (XR24 and AR24) as
being supported.

Switch to drm_crtc_init_with_planes(), and advertize all supported
(A)RGB modes, so we can use RGB565 as the default mode for the console.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c | 30 +++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index 08dc1428aa16caf0..11dd2bc803e7cb62 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -18,6 +18,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
@@ -478,16 +479,41 @@ static const struct drm_crtc_funcs crtc_funcs = {
 	.disable_vblank = shmob_drm_disable_vblank,
 };
 
+static const uint32_t modeset_formats[] = {
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888,
+};
+
+static const struct drm_plane_funcs primary_plane_funcs = {
+	DRM_PLANE_NON_ATOMIC_FUNCS,
+};
+
 int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 {
 	struct drm_crtc *crtc = &sdev->crtc.crtc;
+	struct drm_plane *primary;
 	int ret;
 
 	sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
 
-	ret = drm_crtc_init(sdev->ddev, crtc, &crtc_funcs);
-	if (ret < 0)
+	primary = __drm_universal_plane_alloc(sdev->ddev, sizeof(*primary), 0,
+					      0, &primary_plane_funcs,
+					      modeset_formats,
+					      ARRAY_SIZE(modeset_formats),
+					      NULL, DRM_PLANE_TYPE_PRIMARY,
+					      NULL);
+	if (IS_ERR(primary))
+		return PTR_ERR(primary);
+
+	ret = drm_crtc_init_with_planes(sdev->ddev, crtc, primary, NULL,
+					&crtc_funcs, NULL);
+	if (ret < 0) {
+		drm_plane_cleanup(primary);
+		kfree(primary);
 		return ret;
+	}
 
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
 
-- 
2.34.1

