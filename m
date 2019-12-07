Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB90115C84
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfLGOE2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:28 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46315 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfLGOE2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:28 -0500
Received: by mail-lf1-f66.google.com with SMTP id f15so6583391lfl.13;
        Sat, 07 Dec 2019 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gR58eaxcFb3u7zE/4U+FDGi+VP78py5ZvZcYPjpTaLg=;
        b=sllq2ePXGGvjQGN9sJ6Cexg0SaBMhcQyKWuGqbUKfu5i/AsW9wfqVSLH03+bAebhHA
         NGPvT4RTeDLTrm57YuqVu0LR4pz4GedOlER7XMq1kx/ag5KvZimKe/EuP+OSxsAICImH
         CiNp5PLXC3lCRPEe8QVI/hzLC3ik3IUhYuism86Iuv4eogkqHGZOFRQd5b0n5d+VPwLC
         Or2RM3/6xqC4DoWTpz7AaifnUNT8T0LVKWhydoH5tYv4IFQeULxB8gDH92a44WBzEIdF
         BlEDE6bCZuuqIUfVE3Jf3p2eBrafb+LGNp4jr3/6E398r87FMr1mlGO+dkkIxKdO7IsC
         2k6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=gR58eaxcFb3u7zE/4U+FDGi+VP78py5ZvZcYPjpTaLg=;
        b=chZBZdDfKBFvsK2jqXPtmS1ZSmCHKdqjyoU4/FnkBXmKpKgVmU7sIYeC6wCe4zqW3G
         40ERbz6hb2vnxQQ1GyDqGayzm9BytrpPk31FdBE0mQdet7PpXzqR112luIAj6Iyxzdju
         JyVQpAwPzYOPP855ZxHZE+jZdNpWk6PeTI5+ZmMeWaEUddOg3Cp53M6uirKjREsB+Z3T
         99Zx7Ka6VLXIGW6GITjOkzJigFq9MTFQYLLgSXsym+4QwRmeX/ItGZRwTwv2YEC7uNCj
         6IrgtAfoNKb01sfgU6kd0zCJHF5nFnyv4KgYawanLj3uhgLEyE0KU1l2z/XzwdS/a+Yr
         ywig==
X-Gm-Message-State: APjAAAVYh77OU3+EfJlL3fBjjHBjw/13ocbndkUkGYkdXiSNhZkJBL4K
        3a6A6I87cqHQZSbILB21inQ=
X-Google-Smtp-Source: APXvYqxZY73th5LcErkHNXbzH/+aHgH0/rMHu4A2zTaRLwpzTcNza+wlKndhP+9CbNuVwMShjcPeYQ==
X-Received: by 2002:a19:f00d:: with SMTP id p13mr11187974lfc.37.1575727462835;
        Sat, 07 Dec 2019 06:04:22 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:22 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Sean Paul <sean@poorly.run>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v2 07/25] drm/panel: drop drm_device from drm_panel
Date:   Sat,  7 Dec 2019 15:03:35 +0100
Message-Id: <20191207140353.23967-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The panel drivers used drm_panel.drm for two purposes:
1) Argument to drm_mode_duplicate()
2) drm->dev was used in error messages

The first usage is replaced with drm_connector.dev
- drm_connector is already connected to a drm_device
  and we have a valid connector

The second usage is replaced with drm_panel.dev
- this makes drivers more consistent in their dev argument
  used for dev_err() and friends

With these replacements there are no more uses of drm_panel.drm,
so it is removed from struct drm_panel.
With this change drm_panel_attach() and drm_panel_detach()
no longer have any use as they are empty functions.

v2:
  - editorial correction in changelog (Laurent)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Stefan Mavrodiev <stefan@olimex.com>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: "Guido Günther" <agx@sigxcpu.org>
Cc: Purism Kernel Team <kernel@puri.sm>
---
 drivers/gpu/drm/drm_panel.c                       |  6 ------
 drivers/gpu/drm/panel/panel-arm-versatile.c       |  2 +-
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c |  2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c      | 15 ++++++++-------
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c     |  2 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c     |  6 +++---
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c    |  2 +-
 .../gpu/drm/panel/panel-kingdisplay-kd097d04.c    |  6 +++---
 drivers/gpu/drm/panel/panel-lg-lb035q02.c         |  2 +-
 drivers/gpu/drm/panel/panel-lg-lg4573.c           |  4 ++--
 drivers/gpu/drm/panel/panel-lvds.c                |  2 +-
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c      |  2 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c     |  2 +-
 .../gpu/drm/panel/panel-olimex-lcd-olinuxino.c    |  5 ++---
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c  |  2 +-
 .../gpu/drm/panel/panel-osd-osd101t2587-53ts.c    |  4 ++--
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c  |  4 ++--
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c |  5 ++---
 drivers/gpu/drm/panel/panel-raydium-rm67191.c     |  2 +-
 drivers/gpu/drm/panel/panel-raydium-rm68200.c     |  2 +-
 .../gpu/drm/panel/panel-rocktech-jh057n00900.c    |  2 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c      |  2 +-
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c     |  2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c     |  2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c  |  2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c     |  2 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c       |  9 ++++-----
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c   |  4 ++--
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c   |  2 +-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c   |  4 ++--
 drivers/gpu/drm/panel/panel-simple.c              | 15 ++++++---------
 drivers/gpu/drm/panel/panel-sitronix-st7701.c     |  2 +-
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c    |  4 ++--
 drivers/gpu/drm/panel/panel-sony-acx565akm.c      |  2 +-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c      |  2 +-
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c      |  2 +-
 drivers/gpu/drm/panel/panel-tpo-tpg110.c          |  2 +-
 include/drm/drm_panel.h                           |  7 -------
 38 files changed, 63 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 3daebf56dc44..993e40c0d582 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -114,11 +114,6 @@ EXPORT_SYMBOL(drm_panel_remove);
  */
 int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector)
 {
-	if (panel->drm)
-		return -EBUSY;
-
-	panel->drm = connector->dev;
-
 	return 0;
 }
 EXPORT_SYMBOL(drm_panel_attach);
@@ -135,7 +130,6 @@ EXPORT_SYMBOL(drm_panel_attach);
  */
 void drm_panel_detach(struct drm_panel *panel)
 {
-	panel->drm = NULL;
 }
 EXPORT_SYMBOL(drm_panel_detach);
 
diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gpu/drm/panel/panel-arm-versatile.c
index 41aa91f60979..41444a73c980 100644
--- a/drivers/gpu/drm/panel/panel-arm-versatile.c
+++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
@@ -270,7 +270,7 @@ static int versatile_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.height_mm = vpanel->panel_type->height_mm;
 	connector->display_info.bus_flags = vpanel->panel_type->bus_flags;
 
-	mode = drm_mode_duplicate(panel->drm, &vpanel->panel_type->mode);
+	mode = drm_mode_duplicate(connector->dev, &vpanel->panel_type->mode);
 	drm_mode_set_name(mode);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index 37d6b7390954..0157d1844e3e 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -168,7 +168,7 @@ static int feiyang_get_modes(struct drm_panel *panel,
 	struct feiyang *ctx = panel_to_feiyang(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &feiyang_default_mode);
+	mode = drm_mode_duplicate(connector->dev, &feiyang_default_mode);
 	if (!mode) {
 		DRM_DEV_ERROR(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
 			      feiyang_default_mode.hdisplay,
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
index 7e5062b07ac8..f394d53a7da4 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
@@ -645,6 +645,7 @@ static int ili9322_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
 	struct ili9322 *ili = panel_to_ili9322(panel);
+	struct drm_device *drm = connector->dev;
 	struct drm_display_mode *mode;
 	struct drm_display_info *info;
 
@@ -663,26 +664,26 @@ static int ili9322_get_modes(struct drm_panel *panel,
 
 	switch (ili->input) {
 	case ILI9322_INPUT_SRGB_DUMMY_320X240:
-		mode = drm_mode_duplicate(panel->drm, &srgb_320x240_mode);
+		mode = drm_mode_duplicate(drm, &srgb_320x240_mode);
 		break;
 	case ILI9322_INPUT_SRGB_DUMMY_360X240:
-		mode = drm_mode_duplicate(panel->drm, &srgb_360x240_mode);
+		mode = drm_mode_duplicate(drm, &srgb_360x240_mode);
 		break;
 	case ILI9322_INPUT_PRGB_THROUGH:
 	case ILI9322_INPUT_PRGB_ALIGNED:
-		mode = drm_mode_duplicate(panel->drm, &prgb_320x240_mode);
+		mode = drm_mode_duplicate(drm, &prgb_320x240_mode);
 		break;
 	case ILI9322_INPUT_YUV_640X320_YCBCR:
-		mode = drm_mode_duplicate(panel->drm, &yuv_640x320_mode);
+		mode = drm_mode_duplicate(drm, &yuv_640x320_mode);
 		break;
 	case ILI9322_INPUT_YUV_720X360_YCBCR:
-		mode = drm_mode_duplicate(panel->drm, &yuv_720x360_mode);
+		mode = drm_mode_duplicate(drm, &yuv_720x360_mode);
 		break;
 	case ILI9322_INPUT_ITU_R_BT656_720X360_YCBCR:
-		mode = drm_mode_duplicate(panel->drm, &itu_r_bt_656_720_mode);
+		mode = drm_mode_duplicate(drm, &itu_r_bt_656_720_mode);
 		break;
 	case ILI9322_INPUT_ITU_R_BT656_640X320_YCBCR:
-		mode = drm_mode_duplicate(panel->drm, &itu_r_bt_656_640_mode);
+		mode = drm_mode_duplicate(drm, &itu_r_bt_656_640_mode);
 		break;
 	default:
 		mode = NULL;
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 1c67a668d6bf..31e5a4e67750 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -393,7 +393,7 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	struct ili9881c *ctx = panel_to_ili9881c(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &bananapi_default_mode);
+	mode = drm_mode_duplicate(connector->dev, &bananapi_default_mode);
 	if (!mode) {
 		dev_err(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
 			bananapi_default_mode.hdisplay,
diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index facf1bab2532..b9de37a8a0c5 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -211,7 +211,7 @@ static int innolux_panel_enable(struct drm_panel *panel)
 
 	ret = backlight_enable(innolux->backlight);
 	if (ret) {
-		DRM_DEV_ERROR(panel->drm->dev,
+		DRM_DEV_ERROR(panel->dev,
 			      "Failed to enable backlight %d\n", ret);
 		return ret;
 	}
@@ -410,9 +410,9 @@ static int innolux_panel_get_modes(struct drm_panel *panel,
 	const struct drm_display_mode *m = innolux->desc->mode;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, m);
+	mode = drm_mode_duplicate(connector->dev, m);
 	if (!mode) {
-		DRM_DEV_ERROR(panel->drm->dev, "failed to add mode %ux%ux@%u\n",
+		DRM_DEV_ERROR(panel->dev, "failed to add mode %ux%ux@%u\n",
 			      m->hdisplay, m->vdisplay, m->vrefresh);
 		return -ENOMEM;
 	}
diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index e6b650a64fdb..4bfd8c877c8e 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -307,7 +307,7 @@ static int jdi_panel_get_modes(struct drm_panel *panel,
 	struct jdi_panel *jdi = to_jdi_panel(panel);
 	struct device *dev = &jdi->dsi->dev;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
 		dev_err(dev, "failed to add mode %ux%ux@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index e6f53d56daf9..353ee6caa01c 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -310,7 +310,7 @@ static int kingdisplay_panel_enable(struct drm_panel *panel)
 
 	ret = backlight_enable(kingdisplay->backlight);
 	if (ret) {
-		DRM_DEV_ERROR(panel->drm->dev,
+		DRM_DEV_ERROR(panel->dev,
 			      "Failed to enable backlight %d\n", ret);
 		return ret;
 	}
@@ -338,9 +338,9 @@ static int kingdisplay_panel_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
-		DRM_DEV_ERROR(panel->drm->dev, "failed to add mode %ux%ux@%u\n",
+		DRM_DEV_ERROR(panel->dev, "failed to add mode %ux%ux@%u\n",
 			      default_mode.hdisplay, default_mode.vdisplay,
 			      default_mode.vrefresh);
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-lg-lb035q02.c b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
index 7a3bd4d80c79..e90efeaba4ad 100644
--- a/drivers/gpu/drm/panel/panel-lg-lb035q02.c
+++ b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
@@ -146,7 +146,7 @@ static int lb035q02_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &lb035q02_mode);
+	mode = drm_mode_duplicate(connector->dev, &lb035q02_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-lg-lg4573.c b/drivers/gpu/drm/panel/panel-lg-lg4573.c
index fc6572b4e2f9..20235ff0bbc4 100644
--- a/drivers/gpu/drm/panel/panel-lg-lg4573.c
+++ b/drivers/gpu/drm/panel/panel-lg-lg4573.c
@@ -214,9 +214,9 @@ static int lg4573_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
-		dev_err(panel->drm->dev, "failed to add mode %ux%ux@%u\n",
+		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
 			default_mode.vrefresh);
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index f6d58a60e514..5e40b674bb15 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -112,7 +112,7 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	struct panel_lvds *lvds = to_panel_lvds(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_create(lvds->panel.drm);
+	mode = drm_mode_create(connector->dev);
 	if (!mode)
 		return 0;
 
diff --git a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
index a6ccdb09aace..c4f83f6384e1 100644
--- a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
+++ b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
@@ -128,7 +128,7 @@ static int nl8048_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &nl8048_mode);
+	mode = drm_mode_duplicate(connector->dev, &nl8048_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index 91ea49c05611..a470810f7dbe 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -213,7 +213,7 @@ static int nt39016_get_modes(struct drm_panel *drm_panel,
 	const struct nt39016_panel_info *panel_info = panel->panel_info;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(drm_panel->drm, &panel_info->display_mode);
+	mode = drm_mode_duplicate(connector->dev, &panel_info->display_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 2b7e0dfebc5e..e553e584399b 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -146,7 +146,6 @@ static int lcd_olinuxino_get_modes(struct drm_panel *panel,
 {
 	struct lcd_olinuxino *lcd = to_lcd_olinuxino(panel);
 	struct lcd_olinuxino_info *lcd_info = &lcd->eeprom.info;
-	struct drm_device *drm = lcd->panel.drm;
 	struct lcd_olinuxino_mode *lcd_mode;
 	struct drm_display_mode *mode;
 	u32 i, num = 0;
@@ -155,9 +154,9 @@ static int lcd_olinuxino_get_modes(struct drm_panel *panel,
 		lcd_mode = (struct lcd_olinuxino_mode *)
 			   &lcd->eeprom.reserved[i * sizeof(*lcd_mode)];
 
-		mode = drm_mode_create(drm);
+		mode = drm_mode_create(connector->dev);
 		if (!mode) {
-			dev_err(drm->dev, "failed to add mode %ux%u@%u\n",
+			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 				lcd_mode->hactive,
 				lcd_mode->vactive,
 				lcd_mode->refresh);
diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index 4e1606c79072..bb0c992171e8 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -354,7 +354,7 @@ static int otm8009a_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
 		DRM_ERROR("failed to add mode %ux%ux@%u\n",
 			  default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index b3e010288c10..2734b4835dfa 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -118,9 +118,9 @@ static int osd101t2587_panel_get_modes(struct drm_panel *panel,
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, osd101t2587->default_mode);
+	mode = drm_mode_duplicate(connector->dev, osd101t2587->default_mode);
 	if (!mode) {
-		dev_err(panel->drm->dev, "failed to add mode %ux%ux@%u\n",
+		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
 			osd101t2587->default_mode->hdisplay,
 			osd101t2587->default_mode->vdisplay,
 			osd101t2587->default_mode->vrefresh);
diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 19a6eb4637c8..579ac0d86ea4 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -171,9 +171,9 @@ static int wuxga_nt_panel_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
-		dev_err(panel->drm->dev, "failed to add mode %ux%ux@%u\n",
+		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
 				default_mode.hdisplay, default_mode.vdisplay,
 				default_mode.vrefresh);
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 0b8cc199c8d2..8f078b7dd89e 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -312,7 +312,6 @@ static int rpi_touchscreen_enable(struct drm_panel *panel)
 static int rpi_touchscreen_get_modes(struct drm_panel *panel,
 				     struct drm_connector *connector)
 {
-	struct drm_device *drm = panel->drm;
 	unsigned int i, num = 0;
 	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
@@ -320,9 +319,9 @@ static int rpi_touchscreen_get_modes(struct drm_panel *panel,
 		const struct drm_display_mode *m = &rpi_touchscreen_modes[i];
 		struct drm_display_mode *mode;
 
-		mode = drm_mode_duplicate(drm, m);
+		mode = drm_mode_duplicate(connector->dev, m);
 		if (!mode) {
-			dev_err(drm->dev, "failed to add mode %ux%u@%u\n",
+			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 				m->hdisplay, m->vdisplay, m->vrefresh);
 			continue;
 		}
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index 123bb68cfcb7..313637d53d28 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -441,7 +441,7 @@ static int rad_panel_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
 		DRM_DEV_ERROR(panel->dev, "failed to add mode %ux%ux@%u\n",
 			      default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
index 66fa975308ec..d6a03328e594 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
@@ -340,7 +340,7 @@ static int rm68200_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
 		DRM_ERROR("failed to add mode %ux%ux@%u\n",
 			  default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
index b2d61cab3cad..3a4f1c0fce86 100644
--- a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
+++ b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
@@ -236,7 +236,7 @@ static int jh057n_get_modes(struct drm_panel *panel,
 	struct jh057n *ctx = panel_to_jh057n(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
 		DRM_DEV_ERROR(ctx->dev, "Failed to add mode %ux%u@%u\n",
 			      default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index 57a462ce221e..746a3a221100 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -127,7 +127,7 @@ static int rb070d30_panel_get_modes(struct drm_panel *panel,
 	struct drm_display_mode *mode;
 	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
 		DRM_DEV_ERROR(&ctx->dsi->dev,
 			      "Failed to add mode " DRM_MODE_FMT "\n",
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
index 71939ab757b1..2150043dcf6b 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
@@ -148,7 +148,7 @@ static int s6d16d0_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &samsung_s6d16d0_mode);
+	mode = drm_mode_duplicate(connector->dev, &samsung_s6d16d0_mode);
 	if (!mode) {
 		DRM_ERROR("bad mode or failed to add mode\n");
 		return -EINVAL;
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
index 8e0236ba6145..36ebd5a4ac7b 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
@@ -651,7 +651,7 @@ static int s6e3ha2_get_modes(struct drm_panel *panel,
 	struct s6e3ha2 *ctx = container_of(panel, struct s6e3ha2, panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, ctx->desc->mode);
+	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
 	if (!mode) {
 		DRM_ERROR("failed to add mode %ux%ux@%u\n",
 			ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index c939d5bde4f0..a3570e0a90a8 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -405,7 +405,7 @@ static int s6e63j0x03_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
 		DRM_ERROR("failed to add mode %ux%ux@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index 1d099092e754..a5f76eb4fa25 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -367,7 +367,7 @@ static int s6e63m0_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
 		DRM_ERROR("failed to add mode %ux%ux@%u\n",
 			  default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index b878930b17e4..18e745104aaf 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -59,7 +59,6 @@ static inline struct seiko_panel *to_seiko_panel(struct drm_panel *panel)
 static int seiko_panel_get_fixed_modes(struct seiko_panel *panel,
 				       struct drm_connector *connector)
 {
-	struct drm_device *drm = panel->base.drm;
 	struct drm_display_mode *mode;
 	unsigned int i, num = 0;
 
@@ -71,9 +70,9 @@ static int seiko_panel_get_fixed_modes(struct seiko_panel *panel,
 		struct videomode vm;
 
 		videomode_from_timing(dt, &vm);
-		mode = drm_mode_create(drm);
+		mode = drm_mode_create(connector->dev);
 		if (!mode) {
-			dev_err(drm->dev, "failed to add mode %ux%u\n",
+			dev_err(panel->base.dev, "failed to add mode %ux%u\n",
 				dt->hactive.typ, dt->vactive.typ);
 			continue;
 		}
@@ -92,9 +91,9 @@ static int seiko_panel_get_fixed_modes(struct seiko_panel *panel,
 	for (i = 0; i < panel->desc->num_modes; i++) {
 		const struct drm_display_mode *m = &panel->desc->modes[i];
 
-		mode = drm_mode_duplicate(drm, m);
+		mode = drm_mode_duplicate(connector->dev, m);
 		if (!mode) {
-			dev_err(drm->dev, "failed to add mode %ux%u@%u\n",
+			dev_err(panel->base.dev, "failed to add mode %ux%u@%u\n",
 				m->hdisplay, m->vdisplay, m->vrefresh);
 			continue;
 		}
diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index e797b700661a..17d406f49c3d 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -283,9 +283,9 @@ static int sharp_panel_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
-		dev_err(panel->drm->dev, "failed to add mode %ux%ux@%u\n",
+		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
 			default_mode.vrefresh);
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
index 7103a945f0e8..1cf3f02435c1 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
@@ -105,7 +105,7 @@ static int ls037v7dw01_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &ls037v7dw01_mode);
+	mode = drm_mode_duplicate(connector->dev, &ls037v7dw01_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index 85ae6cffdbfb..7995cf5a9fc4 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -215,9 +215,9 @@ static int sharp_nt_panel_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
-		dev_err(panel->drm->dev, "failed to add mode %ux%ux@%u\n",
+		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
 				default_mode.hdisplay, default_mode.vdisplay,
 				default_mode.vrefresh);
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d6299fe6d276..ec449c18beba 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -120,7 +120,6 @@ static inline struct panel_simple *to_panel_simple(struct drm_panel *panel)
 static unsigned int panel_simple_get_timings_modes(struct panel_simple *panel,
 						   struct drm_connector *connector)
 {
-	struct drm_device *drm = panel->base.drm;
 	struct drm_display_mode *mode;
 	unsigned int i, num = 0;
 
@@ -129,9 +128,9 @@ static unsigned int panel_simple_get_timings_modes(struct panel_simple *panel,
 		struct videomode vm;
 
 		videomode_from_timing(dt, &vm);
-		mode = drm_mode_create(drm);
+		mode = drm_mode_create(connector->dev);
 		if (!mode) {
-			dev_err(drm->dev, "failed to add mode %ux%u\n",
+			dev_err(panel->base.dev, "failed to add mode %ux%u\n",
 				dt->hactive.typ, dt->vactive.typ);
 			continue;
 		}
@@ -153,16 +152,15 @@ static unsigned int panel_simple_get_timings_modes(struct panel_simple *panel,
 static unsigned int panel_simple_get_display_modes(struct panel_simple *panel,
 						   struct drm_connector *connector)
 {
-	struct drm_device *drm = panel->base.drm;
 	struct drm_display_mode *mode;
 	unsigned int i, num = 0;
 
 	for (i = 0; i < panel->desc->num_modes; i++) {
 		const struct drm_display_mode *m = &panel->desc->modes[i];
 
-		mode = drm_mode_duplicate(drm, m);
+		mode = drm_mode_duplicate(connector->dev, m);
 		if (!mode) {
-			dev_err(drm->dev, "failed to add mode %ux%u@%u\n",
+			dev_err(panel->base.dev, "failed to add mode %ux%u@%u\n",
 				m->hdisplay, m->vdisplay, m->vrefresh);
 			continue;
 		}
@@ -184,7 +182,6 @@ static unsigned int panel_simple_get_display_modes(struct panel_simple *panel,
 static int panel_simple_get_non_edid_modes(struct panel_simple *panel,
 					   struct drm_connector *connector)
 {
-	struct drm_device *drm = panel->base.drm;
 	struct drm_display_mode *mode;
 	bool has_override = panel->override_mode.type;
 	unsigned int num = 0;
@@ -193,12 +190,12 @@ static int panel_simple_get_non_edid_modes(struct panel_simple *panel,
 		return 0;
 
 	if (has_override) {
-		mode = drm_mode_duplicate(drm, &panel->override_mode);
+		mode = drm_mode_duplicate(connector->dev, &panel->override_mode);
 		if (mode) {
 			drm_mode_probed_add(connector, mode);
 			num = 1;
 		} else {
-			dev_err(drm->dev, "failed to add override mode\n");
+			dev_err(panel->base.dev, "failed to add override mode\n");
 		}
 	}
 
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 3ed3b1d6d82d..c08a865a2a93 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -271,7 +271,7 @@ static int st7701_get_modes(struct drm_panel *panel,
 	const struct drm_display_mode *desc_mode = st7701->desc->mode;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, desc_mode);
+	mode = drm_mode_duplicate(connector->dev, desc_mode);
 	if (!mode) {
 		DRM_DEV_ERROR(&st7701->dsi->dev,
 			      "failed to add mode %ux%ux@%u\n",
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 836b01331505..ebefe2f4c26b 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -175,9 +175,9 @@ static int st7789v_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
-		dev_err(panel->drm->dev, "failed to add mode %ux%ux@%u\n",
+		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
 			default_mode.vrefresh);
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index 841dc73c443d..5c4b6f6e5c2d 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -526,7 +526,7 @@ static int acx565akm_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &acx565akm_mode);
+	mode = drm_mode_duplicate(connector->dev, &acx565akm_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
index 5230176bd8e6..37252590b541 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
@@ -292,7 +292,7 @@ static int td028ttec1_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &td028ttec1_mode);
+	mode = drm_mode_duplicate(connector->dev, &td028ttec1_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
index 716f8ed1cc45..75f1f1f1b6de 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
@@ -351,7 +351,7 @@ static int td043mtea1_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, &td043mtea1_mode);
+	mode = drm_mode_duplicate(connector->dev, &td043mtea1_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
index e74cd9d418cf..bee213ea1a42 100644
--- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
+++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
@@ -394,7 +394,7 @@ static int tpg110_get_modes(struct drm_panel *panel,
 	connector->display_info.height_mm = tpg->height;
 	connector->display_info.bus_flags = tpg->panel_mode->bus_flags;
 
-	mode = drm_mode_duplicate(panel->drm, &tpg->panel_mode->mode);
+	mode = drm_mode_duplicate(connector->dev, &tpg->panel_mode->mode);
 	drm_mode_set_name(mode);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 5c62dfe73c68..d2142e4170c8 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -132,13 +132,6 @@ struct drm_panel_funcs {
  * struct drm_panel - DRM panel object
  */
 struct drm_panel {
-	/**
-	 * @drm:
-	 *
-	 * DRM device owning the panel.
-	 */
-	struct drm_device *drm;
-
 	/**
 	 * @dev:
 	 *
-- 
2.20.1

