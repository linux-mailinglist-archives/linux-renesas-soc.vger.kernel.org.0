Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE6C66DF7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jan 2023 14:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjAQNxv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Jan 2023 08:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbjAQNxH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2023 08:53:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC30367C9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2023 05:52:18 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D94ED9B4;
        Tue, 17 Jan 2023 14:52:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673963535;
        bh=nwNb+R2m8O+B0Ore4iFPAO4AUuomuoYhlVe81JT742c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CXYTgyRQphLWuchct4JoHz6i3rcKVkh0b8fOARBqptxIa/sYLEWfmT7hm12p/k0l8
         jYqqisgjPzquXR1STKGkB/jTNLwWiDqMAg6LUEIOHuYQanf7eZPtjlkpLzfOzqd8kD
         XoenqrPSPUojfeZh+e2pU9GAj1/wHiWsVIlPl800=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 4/6] drm: rcar-du: Add quirk for H3 ES1 pclk WA
Date:   Tue, 17 Jan 2023 15:51:52 +0200
Message-Id: <20230117135154.387208-5-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

rcar_du_crtc.c does a soc_device_match() in
rcar_du_crtc_set_display_timing() to find out if the SoC is H3 ES1, and
if so, apply a WA.

We will need another H3 ES1 check in the following patch, so rather than
adding more soc_device_match() calls, let's add a rcar_du_device_info
entry for the ES1, and a quirk flag,
RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY, for the WA.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  8 +---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 51 +++++++++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
 3 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 3619e1ddeb62..f2d3266509cc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -10,7 +10,6 @@
 #include <linux/clk.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/sys_soc.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -204,11 +203,6 @@ static void rcar_du_escr_divider(struct clk *clk, unsigned long target,
 	}
 }
 
-static const struct soc_device_attribute rcar_du_r8a7795_es1[] = {
-	{ .soc_id = "r8a7795", .revision = "ES1.*" },
-	{ /* sentinel */ }
-};
-
 static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 {
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
@@ -238,7 +232,7 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		 * no post-divider when a display PLL is present (as shown by
 		 * the workaround breaking HDMI output on M3-W during testing).
 		 */
-		if (soc_device_match(rcar_du_r8a7795_es1)) {
+		if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY) {
 			target *= 2;
 			div = 1;
 		}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index c7c5217cfc1a..ba2e069fc0f7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 #include <linux/wait.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -386,6 +387,42 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	.dpll_mask =  BIT(2) | BIT(1),
 };
 
+static const struct rcar_du_device_info rcar_du_r8a7795_es1_info = {
+	.gen = 3,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_INTERLACED
+		  | RCAR_DU_FEATURE_TVM_SYNC,
+	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY,
+	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
+	.routes = {
+		/*
+		 * R8A7795 has one RGB output, two HDMI outputs and one
+		 * LVDS output.
+		 */
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(3),
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_HDMI0] = {
+			.possible_crtcs = BIT(1),
+			.port = 1,
+		},
+		[RCAR_DU_OUTPUT_HDMI1] = {
+			.possible_crtcs = BIT(2),
+			.port = 2,
+		},
+		[RCAR_DU_OUTPUT_LVDS0] = {
+			.possible_crtcs = BIT(0),
+			.port = 3,
+		},
+	},
+	.num_lvds = 1,
+	.num_rpf = 5,
+	.dpll_mask =  BIT(2) | BIT(1),
+};
+
 static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	.gen = 3,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
@@ -576,6 +613,11 @@ static const struct of_device_id rcar_du_of_table[] = {
 
 MODULE_DEVICE_TABLE(of, rcar_du_of_table);
 
+static const struct soc_device_attribute rcar_du_soc_table[] = {
+	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &rcar_du_r8a7795_es1_info },
+	{ /* sentinel */ }
+};
+
 const char *rcar_du_output_name(enum rcar_du_output output)
 {
 	static const char * const names[] = {
@@ -670,6 +712,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 	struct rcar_du_device *rcdu;
 	unsigned int mask;
 	int ret;
+	const struct soc_device_attribute *soc_attr;
 
 	if (drm_firmware_drivers_only())
 		return -ENODEV;
@@ -681,7 +724,13 @@ static int rcar_du_probe(struct platform_device *pdev)
 		return PTR_ERR(rcdu);
 
 	rcdu->dev = &pdev->dev;
-	rcdu->info = of_device_get_match_data(rcdu->dev);
+
+	soc_attr = soc_device_match(rcar_du_soc_table);
+	if (soc_attr)
+		rcdu->info = soc_attr->data;
+
+	if (!rcdu->info)
+		rcdu->info = of_device_get_match_data(rcdu->dev);
 
 	platform_set_drvdata(pdev, rcdu);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 5cfa2bb7ad93..df87ccab146f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -34,6 +34,7 @@ struct rcar_du_device;
 #define RCAR_DU_FEATURE_NO_BLENDING	BIT(5)	/* PnMR.SPIM does not have ALP nor EOR bits */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
+#define RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY BIT(1)	/* H3 ES1 has pclk stability issue */
 
 enum rcar_du_output {
 	RCAR_DU_OUTPUT_DPAD0,
-- 
2.34.1

