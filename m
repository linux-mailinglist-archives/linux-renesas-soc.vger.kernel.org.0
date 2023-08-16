Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCF077DF60
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Aug 2023 12:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243947AbjHPKpg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Aug 2023 06:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243961AbjHPKpE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2023 06:45:04 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DF72738
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2023 03:44:44 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by laurent.telenet-ops.be with bizsmtp
        id aAki2A0081C8whw01AkiVV; Wed, 16 Aug 2023 12:44:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWE0x-000ot2-KF;
        Wed, 16 Aug 2023 12:44:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWDAw-00674e-Fq;
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
Subject: [PATCH v3 07/41] drm: renesas: shmobile: Add support for Runtime PM
Date:   Wed, 16 Aug 2023 11:50:14 +0200
Message-Id: <c5b83030702a08ba94082f17e5390da84737aa92.1692178020.git.geert+renesas@glider.be>
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

The SH-Mobile LCD Controller is part of a PM Domain on all relevant SoCs
(clock domain on all, power domain on some).  Hence it may not be
sufficient to manage the LCDC module clock explicitly (e.g. if the
selected clock source differs from SHMOB_DRM_CLK_BUS).

Fix this by using Runtime PM for all clock handling.  Add an explicit
dependency on CONFIG_PM, which should already be met on all affected
platforms.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - No changes,

v2:
  - Move explicit clock handling to Runtime PM callbacks,
  - Move devm_pm_runtime_enable() after shmob_drm_setup_clocks(),
  - Depend on PM.
---
 drivers/gpu/drm/renesas/shmobile/Kconfig      |  2 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 32 ++--------------
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 38 +++++++++++++++++--
 3 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/Kconfig b/drivers/gpu/drm/renesas/shmobile/Kconfig
index ad14112999ad8aba..ba941587ca70e08c 100644
--- a/drivers/gpu/drm/renesas/shmobile/Kconfig
+++ b/drivers/gpu/drm/renesas/shmobile/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config DRM_SHMOBILE
 	tristate "DRM Support for SH Mobile"
-	depends on DRM
+	depends on DRM && PM
 	depends on ARCH_RENESAS || ARCH_SHMOBILE || COMPILE_TEST
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index fbfd906844da490c..2d9ae0c6ab7b18a8 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -9,6 +9,7 @@
 
 #include <linux/backlight.h>
 #include <linux/clk.h>
+#include <linux/pm_runtime.h>
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
@@ -34,29 +35,6 @@
  * TODO: panel support
  */
 
-/* -----------------------------------------------------------------------------
- * Clock management
- */
-
-static int shmob_drm_clk_on(struct shmob_drm_device *sdev)
-{
-	int ret;
-
-	if (sdev->clock) {
-		ret = clk_prepare_enable(sdev->clock);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
-static void shmob_drm_clk_off(struct shmob_drm_device *sdev)
-{
-	if (sdev->clock)
-		clk_disable_unprepare(sdev->clock);
-}
-
 /* -----------------------------------------------------------------------------
  * CRTC
  */
@@ -170,9 +148,8 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 	if (WARN_ON(format == NULL))
 		return;
 
-	/* Enable clocks before accessing the hardware. */
-	ret = shmob_drm_clk_on(sdev);
-	if (ret < 0)
+	ret = pm_runtime_resume_and_get(sdev->dev);
+	if (ret)
 		return;
 
 	/* Reset and enable the LCDC. */
@@ -268,8 +245,7 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
 	/* Disable the display output. */
 	lcdc_write(sdev, LDCNT1R, 0);
 
-	/* Stop clocks. */
-	shmob_drm_clk_off(sdev);
+	pm_runtime_put(sdev->dev);
 
 	scrtc->started = false;
 }
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 30493ce874192e3e..3fc7d820abdc61d4 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include <drm/drm_drv.h>
@@ -165,8 +166,35 @@ static int shmob_drm_pm_resume(struct device *dev)
 	return 0;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(shmob_drm_pm_ops,
-				shmob_drm_pm_suspend, shmob_drm_pm_resume);
+static int shmob_drm_pm_runtime_suspend(struct device *dev)
+{
+	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
+
+	if (sdev->clock)
+		clk_disable_unprepare(sdev->clock);
+
+	return 0;
+}
+
+static int shmob_drm_pm_runtime_resume(struct device *dev)
+{
+	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
+	int ret;
+
+	if (sdev->clock) {
+		ret = clk_prepare_enable(sdev->clock);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops shmob_drm_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(shmob_drm_pm_suspend, shmob_drm_pm_resume)
+	RUNTIME_PM_OPS(shmob_drm_pm_runtime_suspend,
+		       shmob_drm_pm_runtime_resume, NULL)
+};
 
 /* -----------------------------------------------------------------------------
  * Platform driver
@@ -220,6 +248,10 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
 	ret = shmob_drm_init_interface(sdev);
 	if (ret < 0)
 		return ret;
@@ -291,7 +323,7 @@ static struct platform_driver shmob_drm_platform_driver = {
 	.remove		= shmob_drm_remove,
 	.driver		= {
 		.name	= "shmob-drm",
-		.pm	= pm_sleep_ptr(&shmob_drm_pm_ops),
+		.pm	= &shmob_drm_pm_ops,
 	},
 };
 
-- 
2.34.1

