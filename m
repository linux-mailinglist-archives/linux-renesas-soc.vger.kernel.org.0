Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD04C70F670
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 May 2023 14:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjEXMcW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 May 2023 08:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjEXMcV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 May 2023 08:32:21 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A05135
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 May 2023 05:32:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:59b9:3473:f0ae:e2b7])
        by laurent.telenet-ops.be with bizsmtp
        id 0cYD2A00W5NiV2701cYDeu; Wed, 24 May 2023 14:32:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q1neo-002xwz-FV;
        Wed, 24 May 2023 14:32:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q1nf3-00DPLB-G5;
        Wed, 24 May 2023 14:32:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] drm/panel: simple: Add Ampire AM-800480L1TMQW-T00H
Date:   Wed, 24 May 2023 14:32:11 +0200
Message-Id: <244d9471e0ed248ff2dea8ded3a5384a1c51904b.1684931026.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684931026.git.geert+renesas@glider.be>
References: <cover.1684931026.git.geert+renesas@glider.be>
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

Add support for the Ampire AM-800480L1TMQW-T00H 5" WVGA TFT LCD panel.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5778824dffd47a31..467117c0b2c9d463 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -778,6 +778,36 @@ static const struct drm_display_mode ampire_am800480r3tmqwa1h_mode = {
 	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
 };
 
+static const struct display_timing ampire_am_800480l1tmqw_t00h_timing = {
+	.pixelclock = { 29930000, 33260000, 36590000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 1, 40, 168 },
+	.hback_porch = { 88, 88, 88 },
+	.hsync_len = { 1, 128, 128 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 1, 35, 37 },
+	.vback_porch = { 8, 8, 8 },
+	.vsync_len = { 1, 2, 2 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
+		 DISPLAY_FLAGS_SYNC_POSEDGE,
+};
+
+static const struct panel_desc ampire_am_800480l1tmqw_t00h = {
+	.timings = &ampire_am_800480l1tmqw_t00h_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 111,
+		.height = 67,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct panel_desc ampire_am800480r3tmqwa1h = {
 	.modes = &ampire_am800480r3tmqwa1h_mode,
 	.num_modes = 1,
@@ -3993,6 +4023,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "ampire,am-480272h3tmqw-t01h",
 		.data = &ampire_am_480272h3tmqw_t01h,
+	}, {
+		.compatible = "ampire,am-800480l1tmqw-t00h",
+		.data = &ampire_am_800480l1tmqw_t00h,
 	}, {
 		.compatible = "ampire,am800480r3tmqwa1h",
 		.data = &ampire_am800480r3tmqwa1h,
-- 
2.34.1

