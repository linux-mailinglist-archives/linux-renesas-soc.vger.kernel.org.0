Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10D037A197F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Sep 2023 10:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbjIOIzF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Sep 2023 04:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233283AbjIOIyi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2023 04:54:38 -0400
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [IPv6:2a02:1800:110:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B44C2D5E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2023 01:54:19 -0700 (PDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by riemann.telenet-ops.be (Postfix) with ESMTPS id 4Rn7KN2hzwz4x1hm
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2023 10:54:16 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7135:da8b:ba1d:1a7c])
        by xavier.telenet-ops.be with bizsmtp
        id m8uE2A00j3q21w7018uElg; Fri, 15 Sep 2023 10:54:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qh4aJ-003lH9-Lp;
        Fri, 15 Sep 2023 10:54:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qh4ac-00GdcD-MY;
        Fri, 15 Sep 2023 10:54:14 +0200
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
Subject: [PATCH v4 20/41] drm: renesas: shmobile: Embed drm_device in shmob_drm_device
Date:   Fri, 15 Sep 2023 10:53:35 +0200
Message-Id: <abbf95021191824f44cc8c52e4afbde93d44363a.1694767209.git.geert+renesas@glider.be>
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

Embedding drm_device in shmob_drm_device allows us to use the DRM
managed API to allocate both structures in one go, simplifying error
handling.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v4:
  - Rebase on top of commit 775b0669e19f2e4a ("drm/shmobile: Convert to
    platform remove callback returning void") in
    drm-misc/for-linux-next,

v3:
  - No changes,

v2:
  - Add Reviewed-by.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 12 +++---
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 40 +++++++------------
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.h  |  2 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_kms.c  | 16 ++++----
 .../drm/renesas/shmobile/shmob_drm_plane.c    |  8 ++--
 5 files changed, 34 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 015263ac2100c11e..9c66e00ed70ea582 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -116,7 +116,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 	struct shmob_drm_device *sdev = crtc->dev->dev_private;
 	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
 	const struct shmob_drm_format_info *format;
-	struct drm_device *dev = sdev->ddev;
+	struct drm_device *dev = &sdev->ddev;
 	struct drm_plane *plane;
 	u32 value;
 	int ret;
@@ -439,7 +439,7 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 
 	sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
 
-	primary = __drm_universal_plane_alloc(sdev->ddev, sizeof(*primary), 0,
+	primary = __drm_universal_plane_alloc(&sdev->ddev, sizeof(*primary), 0,
 					      0, &primary_plane_funcs,
 					      modeset_formats,
 					      ARRAY_SIZE(modeset_formats),
@@ -448,7 +448,7 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
-	ret = drm_crtc_init_with_planes(sdev->ddev, crtc, primary, NULL,
+	ret = drm_crtc_init_with_planes(&sdev->ddev, crtc, primary, NULL,
 					&crtc_funcs, NULL);
 	if (ret < 0) {
 		drm_plane_cleanup(primary);
@@ -524,7 +524,7 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 
 	encoder->possible_crtcs = 1;
 
-	ret = drm_simple_encoder_init(sdev->ddev, encoder,
+	ret = drm_simple_encoder_init(&sdev->ddev, encoder,
 				      DRM_MODE_ENCODER_DPI);
 	if (ret < 0)
 		return ret;
@@ -604,7 +604,7 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
 	connector->display_info.width_mm = sdev->pdata->panel.width_mm;
 	connector->display_info.height_mm = sdev->pdata->panel.height_mm;
 
-	ret = drm_connector_init(sdev->ddev, connector, &connector_funcs,
+	ret = drm_connector_init(&sdev->ddev, connector, &connector_funcs,
 				 DRM_MODE_CONNECTOR_DPI);
 	if (ret < 0)
 		return ret;
@@ -617,7 +617,7 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
 
 	drm_helper_connector_dpms(connector, DRM_MODE_DPMS_OFF);
 	drm_object_property_set_value(&connector->base,
-		sdev->ddev->mode_config.dpms_property, DRM_MODE_DPMS_OFF);
+		sdev->ddev.mode_config.dpms_property, DRM_MODE_DPMS_OFF);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index bf3a9c1db177095e..56e2f407ab53a476 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -137,7 +137,7 @@ static int shmob_drm_pm_suspend(struct device *dev)
 {
 	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
 
-	drm_kms_helper_poll_disable(sdev->ddev);
+	drm_kms_helper_poll_disable(&sdev->ddev);
 	shmob_drm_crtc_suspend(&sdev->crtc);
 
 	return 0;
@@ -147,11 +147,11 @@ static int shmob_drm_pm_resume(struct device *dev)
 {
 	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
 
-	drm_modeset_lock_all(sdev->ddev);
+	drm_modeset_lock_all(&sdev->ddev);
 	shmob_drm_crtc_resume(&sdev->crtc);
-	drm_modeset_unlock_all(sdev->ddev);
+	drm_modeset_unlock_all(&sdev->ddev);
 
-	drm_kms_helper_poll_enable(sdev->ddev);
+	drm_kms_helper_poll_enable(&sdev->ddev);
 	return 0;
 }
 
@@ -192,11 +192,10 @@ static const struct dev_pm_ops shmob_drm_pm_ops = {
 static void shmob_drm_remove(struct platform_device *pdev)
 {
 	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
-	struct drm_device *ddev = sdev->ddev;
+	struct drm_device *ddev = &sdev->ddev;
 
 	drm_dev_unregister(ddev);
 	drm_kms_helper_poll_fini(ddev);
-	drm_dev_put(ddev);
 }
 
 static int shmob_drm_probe(struct platform_device *pdev)
@@ -213,13 +212,15 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * Allocate and initialize the driver private data, I/O resources and
-	 * clocks.
+	 * Allocate and initialize the DRM device, driver private data, I/O
+	 * resources and clocks.
 	 */
-	sdev = devm_kzalloc(&pdev->dev, sizeof(*sdev), GFP_KERNEL);
-	if (sdev == NULL)
-		return -ENOMEM;
+	sdev = devm_drm_dev_alloc(&pdev->dev, &shmob_drm_driver,
+				  struct shmob_drm_device, ddev);
+	if (IS_ERR(sdev))
+		return PTR_ERR(sdev);
 
+	ddev = &sdev->ddev;
 	sdev->dev = &pdev->dev;
 	sdev->pdata = pdata;
 	spin_lock_init(&sdev->irq_lock);
@@ -242,20 +243,12 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/* Allocate and initialize the DRM device. */
-	ddev = drm_dev_alloc(&shmob_drm_driver, &pdev->dev);
-	if (IS_ERR(ddev))
-		return PTR_ERR(ddev);
-
-	sdev->ddev = ddev;
 	ddev->dev_private = sdev;
 
 	ret = shmob_drm_modeset_init(sdev);
-	if (ret < 0) {
-		dev_err_probe(&pdev->dev, ret,
-			      "failed to initialize mode setting\n");
-		goto err_free_drm_dev;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to initialize mode setting\n");
 
 	for (i = 0; i < 4; ++i) {
 		ret = shmob_drm_plane_create(sdev, i);
@@ -297,9 +290,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
 
 err_modeset_cleanup:
 	drm_kms_helper_poll_fini(ddev);
-err_free_drm_dev:
-	drm_dev_put(ddev);
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
index 16d830168b2ada21..77bb0da48f37ace8 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
@@ -32,7 +32,7 @@ struct shmob_drm_device {
 	unsigned int irq;
 	spinlock_t irq_lock;		/* Protects hardware LDINTR register */
 
-	struct drm_device *ddev;
+	struct drm_device ddev;
 
 	struct shmob_drm_crtc crtc;
 	struct drm_encoder encoder;
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
index 1a62e7f8a8a9e6df..20316907030b2789 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
@@ -153,7 +153,7 @@ int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
 {
 	int ret;
 
-	ret = drmm_mode_config_init(sdev->ddev);
+	ret = drmm_mode_config_init(&sdev->ddev);
 	if (ret)
 		return ret;
 
@@ -169,15 +169,15 @@ int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
 	if (ret < 0)
 		return ret;
 
-	drm_kms_helper_poll_init(sdev->ddev);
+	drm_kms_helper_poll_init(&sdev->ddev);
 
-	sdev->ddev->mode_config.min_width = 0;
-	sdev->ddev->mode_config.min_height = 0;
-	sdev->ddev->mode_config.max_width = 4095;
-	sdev->ddev->mode_config.max_height = 4095;
-	sdev->ddev->mode_config.funcs = &shmob_drm_mode_config_funcs;
+	sdev->ddev.mode_config.min_width = 0;
+	sdev->ddev.mode_config.min_height = 0;
+	sdev->ddev.mode_config.max_width = 4095;
+	sdev->ddev.mode_config.max_height = 4095;
+	sdev->ddev.mode_config.funcs = &shmob_drm_mode_config_funcs;
 
-	drm_helper_disable_unused_functions(sdev->ddev);
+	drm_helper_disable_unused_functions(&sdev->ddev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 1fb68b5fe915b8dc..17e66a018689f648 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -68,7 +68,7 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 		 splane->format->ldbbsifr;
 
 #define plane_reg_dump(sdev, splane, reg) \
-	dev_dbg(sdev->ddev->dev, "%s(%u): %s 0x%08x 0x%08x\n", __func__, \
+	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x 0x%08x\n", __func__, \
 		splane->index, #reg, \
 		lcdc_read(sdev, reg(splane->index)), \
 		lcdc_read(sdev, reg(splane->index) + LCDC_SIDE_B_OFFSET))
@@ -81,7 +81,7 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 	plane_reg_dump(sdev, splane, LDBnBSACR);
 
 	lcdc_write(sdev, LDBCR, LDBCR_UPC(splane->index));
-	dev_dbg(sdev->ddev->dev, "%s(%u): %s 0x%08x\n", __func__, splane->index,
+	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x\n", __func__, splane->index,
 		"LDBCR", lcdc_read(sdev, LDBCR));
 
 	lcdc_write(sdev, LDBnBSIFR(splane->index), format);
@@ -103,7 +103,7 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 
 	lcdc_write(sdev, LDBCR,
 		   LDBCR_UPF(splane->index) | LDBCR_UPD(splane->index));
-	dev_dbg(sdev->ddev->dev, "%s(%u): %s 0x%08x\n", __func__, splane->index,
+	dev_dbg(sdev->ddev.dev, "%s(%u): %s 0x%08x\n", __func__, splane->index,
 		"LDBCR", lcdc_read(sdev, LDBCR));
 
 	plane_reg_dump(sdev, splane, LDBnBSIFR);
@@ -198,7 +198,7 @@ int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index)
 {
 	struct shmob_drm_plane *splane;
 
-	splane = drmm_universal_plane_alloc(sdev->ddev, struct shmob_drm_plane,
+	splane = drmm_universal_plane_alloc(&sdev->ddev, struct shmob_drm_plane,
 					    plane, 1, &shmob_drm_plane_funcs,
 					    formats, ARRAY_SIZE(formats), NULL,
 					    DRM_PLANE_TYPE_OVERLAY, NULL);
-- 
2.34.1

