Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25D4D12E716
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2020 15:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgABOMx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Jan 2020 09:12:53 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:56330 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728448AbgABOMx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jan 2020 09:12:53 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id lSCn210095USYZQ01SCnwR; Thu, 02 Jan 2020 15:12:51 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1in1DT-0006OW-CY; Thu, 02 Jan 2020 15:12:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1in1DT-00006w-BD; Thu, 02 Jan 2020 15:12:47 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        David Lechner <david@lechnology.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] drm/mipi_dbi: Add support for display offsets
Date:   Thu,  2 Jan 2020 15:12:45 +0100
Message-Id: <20200102141246.370-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102141246.370-1-geert+renesas@glider.be>
References: <20200102141246.370-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If the resolution of the TFT display is smaller than the maximum
resolution supported by the display controller, the display may be
connected to the driver output arrays with a horizontal and/or vertical
offset, leading to a shifted image.

Add support for specifying these offsets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 30 ++++++++++++++++++++----------
 include/drm/drm_mipi_dbi.h     | 12 ++++++++++++
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 16bff1be4b8ac622..27fe81a53c88e338 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -238,6 +238,23 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL(mipi_dbi_buf_copy);
 
+static void mipi_dbi_set_window_address(struct mipi_dbi_dev *dbidev,
+					unsigned int xs, unsigned int xe,
+					unsigned int ys, unsigned int ye)
+{
+	struct mipi_dbi *dbi = &dbidev->dbi;
+
+	xs += dbidev->left_offset;
+	xe += dbidev->left_offset;
+	ys += dbidev->top_offset;
+	ye += dbidev->top_offset;
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_COLUMN_ADDRESS, (xs >> 8) & 0xff,
+			 xs & 0xff, (xe >> 8) & 0xff, xe & 0xff);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_PAGE_ADDRESS, (ys >> 8) & 0xff,
+			 ys & 0xff, (ye >> 8) & 0xff, ye & 0xff);
+}
+
 static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 {
 	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
@@ -271,12 +288,8 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 		tr = cma_obj->vaddr;
 	}
 
-	mipi_dbi_command(dbi, MIPI_DCS_SET_COLUMN_ADDRESS,
-			 (rect->x1 >> 8) & 0xff, rect->x1 & 0xff,
-			 ((rect->x2 - 1) >> 8) & 0xff, (rect->x2 - 1) & 0xff);
-	mipi_dbi_command(dbi, MIPI_DCS_SET_PAGE_ADDRESS,
-			 (rect->y1 >> 8) & 0xff, rect->y1 & 0xff,
-			 ((rect->y2 - 1) >> 8) & 0xff, (rect->y2 - 1) & 0xff);
+	mipi_dbi_set_window_address(dbidev, rect->x1, rect->x2 - 1, rect->y1,
+				    rect->y2 - 1);
 
 	ret = mipi_dbi_command_buf(dbi, MIPI_DCS_WRITE_MEMORY_START, tr,
 				   width * height * 2);
@@ -366,10 +379,7 @@ static void mipi_dbi_blank(struct mipi_dbi_dev *dbidev)
 
 	memset(dbidev->tx_buf, 0, len);
 
-	mipi_dbi_command(dbi, MIPI_DCS_SET_COLUMN_ADDRESS, 0, 0,
-			 ((width - 1) >> 8) & 0xFF, (width - 1) & 0xFF);
-	mipi_dbi_command(dbi, MIPI_DCS_SET_PAGE_ADDRESS, 0, 0,
-			 ((height - 1) >> 8) & 0xFF, (height - 1) & 0xFF);
+	mipi_dbi_set_window_address(dbidev, 0, width - 1, 0, height - 1);
 	mipi_dbi_command_buf(dbi, MIPI_DCS_WRITE_MEMORY_START,
 			     (u8 *)dbidev->tx_buf, len);
 
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 67c66f5ee591e80f..33f325f5af2b921f 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -109,6 +109,18 @@ struct mipi_dbi_dev {
 	 */
 	unsigned int rotation;
 
+	/**
+	 * @left_offset: Horizontal offset of the display relative to the
+	 *               controller's driver array
+	 */
+	unsigned int left_offset;
+
+	/**
+	 * @top_offset: Vertical offset of the display relative to the
+	 *              controller's driver array
+	 */
+	unsigned int top_offset;
+
 	/**
 	 * @backlight: backlight device (optional)
 	 */
-- 
2.17.1

