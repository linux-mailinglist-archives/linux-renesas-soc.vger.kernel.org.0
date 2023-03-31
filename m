Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5F56D2329
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Mar 2023 16:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232944AbjCaOyf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 Mar 2023 10:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232971AbjCaOy1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Mar 2023 10:54:27 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B06C20C0B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Mar 2023 07:53:59 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by laurent.telenet-ops.be with bizsmtp
        id f2tq2900A1C8whw012tqhi; Fri, 31 Mar 2023 16:53:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1piG3X-00FUhG-LH;
        Fri, 31 Mar 2023 16:49:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1piG4H-008fKN-2A;
        Fri, 31 Mar 2023 16:49:29 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] staging: board: armadillo800eva: Add DRM support
Date:   Fri, 31 Mar 2023 16:49:25 +0200
Message-Id: <c03d4edbd650836bf6a96504df82338ec6d800ff.1680272980.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
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
---
Not intended for upstream merge.
The final solution should be DT-based, and include removal of this file.

proper operation, this depends on "[PATCH 0/5] drm: shmobile: Fixes and
enhancements"
https://lore.kernel.org/r/cover.1680273039.git.geert+renesas@glider.be
---
 drivers/staging/board/armadillo800eva.c | 37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/staging/board/armadillo800eva.c b/drivers/staging/board/armadillo800eva.c
index 0225234dd7aa6b1c..e5ce61b54b1ca3fb 100644
--- a/drivers/staging/board/armadillo800eva.c
+++ b/drivers/staging/board/armadillo800eva.c
@@ -12,6 +12,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/fb.h>
 #include <linux/kernel.h>
+#include <linux/platform_data/shmob_drm.h>
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
 
@@ -19,6 +20,33 @@
 
 #include "board.h"
 
+#ifdef CONFIG_DRM_SHMOBILE
+static struct shmob_drm_platform_data lcdc0_info = {
+	.clk_source = SHMOB_DRM_CLK_BUS,
+	.iface = {
+		.interface = SHMOB_DRM_IFACE_RGB24,
+		.clk_div = 5,
+	},
+	.panel = {
+		.width_mm = 111,
+		.height_mm = 68,
+		.mode = {
+			// Timings based on AMPIRE AM-800480L1TMQW-T00H-L
+			// datasheet
+			.name		= "AMPIRE/AM-800480",
+			.clock		= 33264,
+			.hdisplay	= 800,
+			.hsync_start	= 840,
+			.hsync_end	= 968,
+			.htotal		= 1056,
+			.vdisplay	= 480,
+			.vsync_start	= 515,
+			.vsync_end	= 517,
+			.vtotal		= 525,
+		},
+	},
+};
+#else
 static struct fb_videomode lcdc0_mode = {
 	.name		= "AMPIER/AM-800480",
 	.xres		= 800,
@@ -48,6 +76,7 @@ static struct sh_mobile_lcdc_info lcdc0_info = {
 		},
 	},
 };
+#endif
 
 static struct resource lcdc0_resources[] = {
 	DEFINE_RES_MEM_NAMED(0xfe940000, 0x4000, "LCD0"),
@@ -55,7 +84,11 @@ static struct resource lcdc0_resources[] = {
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
@@ -66,7 +99,11 @@ static struct platform_device lcdc0_device = {
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

