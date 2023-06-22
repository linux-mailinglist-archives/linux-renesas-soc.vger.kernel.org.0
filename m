Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 812DE739D53
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jun 2023 11:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbjFVJdJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Jun 2023 05:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbjFVJbt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jun 2023 05:31:49 -0400
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FFC4EFB
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jun 2023 02:23:10 -0700 (PDT)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Qmvzw3JLdz4x1mK
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jun 2023 11:23:08 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
        by albert.telenet-ops.be with bizsmtp
        id C9P82A00Q1yfRTD069P8o6; Thu, 22 Jun 2023 11:23:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qCGWw-000ByQ-Ho;
        Thu, 22 Jun 2023 11:23:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qCGWy-003VzG-2q;
        Thu, 22 Jun 2023 11:23:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] staging: board: armadillo800eva: Add DRM support
Date:   Thu, 22 Jun 2023 11:23:02 +0200
Message-Id: <f7874a9da4bcb20fbc9cd133147b67862ebcf0b9.1687418281.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for using the SH-Mobile DRM driver instead of the SH-Mobile
LCDC framebuffer driver.

Based on old kzm9g conversion prototype code by Laurent Pinchart.

Note that the new timings are slightly different, as they are based on
the AMPIRE AM-800480L1TMQW-T00H-L datasheet.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/r/c03d4edbd650836bf6a96504df82338ec6d800ff.1680272980.git.geert+renesas@glider.be
---
Not intended for upstream merge.
The final solution will be DT-based, and will include removal of this
file.

For proper operation, this depends on patch series "[PATCH 00/39] drm:
renesas: shmobile: Atomic conversion + DT support"
https://lore.kernel.org/r/cover.1687423204.git.geert+renesas@glider.be

v2:
  - Use struct videomode in platform data,
  - Use media bus formats in platform data.
---
 drivers/staging/board/armadillo800eva.c | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/staging/board/armadillo800eva.c b/drivers/staging/board/armadillo800eva.c
index 0225234dd7aa6b1c..d1605ca73316b92c 100644
--- a/drivers/staging/board/armadillo800eva.c
+++ b/drivers/staging/board/armadillo800eva.c
@@ -12,6 +12,8 @@
 #include <linux/dma-mapping.h>
 #include <linux/fb.h>
 #include <linux/kernel.h>
+#include <linux/media-bus-format.h>
+#include <linux/platform_data/shmob_drm.h>
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
 
@@ -19,6 +21,37 @@
 
 #include "board.h"
 
+#ifdef CONFIG_DRM_SHMOBILE
+static struct shmob_drm_platform_data lcdc0_info = {
+	.clk_source = SHMOB_DRM_CLK_BUS,
+	.iface = {
+		.bus_fmt = MEDIA_BUS_FMT_RGB888_1X24,
+		.clk_div = 5,
+	},
+	.panel = {
+		.width_mm = 111,
+		.height_mm = 67,
+		.mode = {
+			// Timings based on AMPIRE AM-800480L1TMQW-T00H-L
+			// datasheet
+			.pixelclock = 33264000,
+			.hactive = 800,
+			.hfront_porch = 40,
+			.hback_porch = 88,
+			.hsync_len = 128,
+			.vactive = 480,
+			.vfront_porch = 35,
+			.vback_porch = 8,
+			.vsync_len = 2,
+			.flags = DISPLAY_FLAGS_HSYNC_LOW |
+				 DISPLAY_FLAGS_VSYNC_LOW |
+				 DISPLAY_FLAGS_DE_HIGH |
+				 DISPLAY_FLAGS_PIXDATA_POSEDGE |
+				 DISPLAY_FLAGS_SYNC_POSEDGE,
+		},
+	},
+};
+#else
 static struct fb_videomode lcdc0_mode = {
 	.name		= "AMPIER/AM-800480",
 	.xres		= 800,
@@ -48,6 +81,7 @@ static struct sh_mobile_lcdc_info lcdc0_info = {
 		},
 	},
 };
+#endif
 
 static struct resource lcdc0_resources[] = {
 	DEFINE_RES_MEM_NAMED(0xfe940000, 0x4000, "LCD0"),
@@ -55,7 +89,11 @@ static struct resource lcdc0_resources[] = {
 };
 
 static struct platform_device lcdc0_device = {
+#ifdef CONFIG_DRM_SHMOBILE
+	.name		= "shmob-drm",
+#else
 	.name		= "sh_mobile_lcdc_fb",
+#endif
 	.num_resources	= ARRAY_SIZE(lcdc0_resources),
 	.resource	= lcdc0_resources,
 	.id		= 0,
@@ -66,7 +104,11 @@ static struct platform_device lcdc0_device = {
 };
 
 static const struct board_staging_clk lcdc0_clocks[] __initconst = {
+#ifdef CONFIG_DRM_SHMOBILE
+	{ "lcdc0", NULL, "shmob-drm.0" },
+#else
 	{ "lcdc0", NULL, "sh_mobile_lcdc_fb.0" },
+#endif
 };
 
 static const struct board_staging_dev armadillo800eva_devices[] __initconst = {
-- 
2.34.1

