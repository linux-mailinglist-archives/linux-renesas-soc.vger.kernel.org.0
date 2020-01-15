Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2863B13C177
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 13:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbgAOMqB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jan 2020 07:46:01 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:54950 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729152AbgAOMqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 07:46:01 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id qclq2100M5USYZQ06clqYB; Wed, 15 Jan 2020 13:45:58 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iri3S-0003z9-68; Wed, 15 Jan 2020 13:45:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iri3S-00012k-4a; Wed, 15 Jan 2020 13:45:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        David Lechner <david@lechnology.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 5/5] drm: tiny: st7735r: Add support for Okaya RH128128T
Date:   Wed, 15 Jan 2020 13:45:48 +0100
Message-Id: <20200115124548.3951-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115124548.3951-1-geert+renesas@glider.be>
References: <20200115124548.3951-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Okaya RH128128T display to the st7735r driver on
DT-enabled systems.

The RH128128T is a 128x128 1.44" TFT display driven by a Sitronix
ST7715R TFT Controller/Driver.  The latter is very similar to the
ST7735R, and can be handled by the existing st7735r driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Split in two patches,
  - Update Kconfig help text,
  - Improve file comment header.
---
 drivers/gpu/drm/tiny/Kconfig   | 8 +++++---
 drivers/gpu/drm/tiny/st7735r.c | 9 ++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index a46ac284dd5e9211..a8664211123e7025 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -85,14 +85,16 @@ config TINYDRM_ST7586
 	  If M is selected the module will be called st7586.
 
 config TINYDRM_ST7735R
-	tristate "DRM support for Sitronix ST7735R display panels"
+	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
 	depends on DRM && SPI
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_MIPI_DBI
 	select BACKLIGHT_CLASS_DEVICE
 	help
-	  DRM driver Sitronix ST7735R with one of the following LCDs:
-	  * JD-T18003-T01 1.8" 128x160 TFT
+	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
+	  LCDs:
+	  * Jianda JD-T18003-T01 1.8" 128x160 TFT
+	  * Okaya RH128128T 1.44" 128x128 TFT
 
 	  If M is selected the module will be called st7735r.
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index a838f237c8d82e3d..32574f1b60716390 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * DRM driver for Sitronix ST7735R panels
+ * DRM driver for display panels connected to a Sitronix ST7715R or ST7735R
+ * display controller in SPI mode.
  *
  * Copyright 2017 David Lechner <david@lechnology.com>
  * Copyright (C) 2019 Glider bvba
@@ -144,6 +145,11 @@ static const struct st7735r_cfg jd_t18003_t01_cfg = {
 	.write_only	= true,
 };
 
+static const struct st7735r_cfg rh128128t_cfg = {
+	.mode		= { DRM_SIMPLE_MODE(128, 128, 25, 26) },
+	.left_offset	= 2,
+	.top_offset	= 3,
+	.rgb		= true,
 };
 
 DEFINE_DRM_GEM_CMA_FOPS(st7735r_fops);
@@ -163,6 +169,7 @@ static struct drm_driver st7735r_driver = {
 
 static const struct of_device_id st7735r_of_match[] = {
 	{ .compatible = "jianda,jd-t18003-t01", .data = &jd_t18003_t01_cfg },
+	{ .compatible = "okaya,rh128128t", .data = &rh128128t_cfg },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, st7735r_of_match);
-- 
2.17.1

