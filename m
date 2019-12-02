Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E46A10F01C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbfLBTdT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:19 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33317 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbfLBTdT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:19 -0500
Received: by mail-lf1-f68.google.com with SMTP id n25so820868lfl.0;
        Mon, 02 Dec 2019 11:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IGvO+0xUXURYlKsBh3J5hHpZK9r2fHSXOrcSPvha2C8=;
        b=TO/IXOjYwQKoCBMO3dJFcbPjRiNPctl7a7IYgNjrIkhuV0VSV+C5S7enpnOYTnAHI0
         JI7sLNslAiB+7xJ/t625LnyF+ZOPz8FyvjTgVsT31DrGFHzxN2y/MGxb4ClZ+DSFY7jW
         Mc1kgMv3FH/LSEjCTjwCYwa/HVAvZpCFWsjyug7t8GPV4spY4whe6+fLTYFTvsyaDSF8
         2aOeWjfPH+FLe5w6F3IdD4e4u68mrERFtFfPJXVHzDDecZg+acLEjGMdYuWGbbk4u9+9
         iPt8452h8L024dLJl/cDNzof82VqBn+S5Oloh1izEorSiwt6IKWiQkXhYRaEH8vggWO/
         gD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=IGvO+0xUXURYlKsBh3J5hHpZK9r2fHSXOrcSPvha2C8=;
        b=PYTDjuOlPiiCHymbxhHkLinloZP7xqtW6QKxU3mEA4VXK4g/tBmG5QOAq2HIg4D/5V
         0gN5E6zkrHKqIYrJ08m4YDQ/wEwoB3jZYmxaK+jqvr6nrMq61c3u4dUn0PRqlQojhTsW
         PYHTvDUSPLMUx4qqfYIQyDKyu+/q/9+cJ2ailJr0knQ/+UxXBiYXeHsyHRBUL/eT6Q0c
         LZS4R9EzUX3FRpJgtrsfwZA2McZixv0UHG0x7vgdWyqKC5nj4AvKSWtcAvBuJFqput3q
         HYdHKmRZLIlq0EZBBlCVnXKdWgksnkprs0ZmOORj16S5o0mlyoO97WIGaUQjShs/10ui
         nERw==
X-Gm-Message-State: APjAAAXBn/lHb3uZ40WLp96cgz35Fe0bpwIOMLDHZovs3j0+sCuwrZI2
        h2HLLzVo39DP7VcPOfZzCLA=
X-Google-Smtp-Source: APXvYqwiyN3Ni8kOwAwaSHEtmfm8NSqTfI1JTrh4rqOYqDc6DJG7i0EoIz6D11uM67yv7f3L1uwJnQ==
X-Received: by 2002:a19:74a:: with SMTP id 71mr400767lfh.127.1575315193565;
        Mon, 02 Dec 2019 11:33:13 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:12 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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
        Sam Ravnborg <sam@ravnborg.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v1 05/26] drm/panel: add drm_connector argument to get_modes()
Date:   Mon,  2 Dec 2019 20:32:09 +0100
Message-Id: <20191202193230.21310-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Today the bridge creates the drm_connector, but that is planned
to be moved to the display drivers.
To facilitate this, update drm_panel_funcs.get_modes() to
take drm_connector as an argument.
All panel drivers implementing get_modes() are updated.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 drivers/gpu/drm/drm_panel.c                   |  2 +-
 drivers/gpu/drm/panel/panel-arm-versatile.c   |  4 +--
 .../drm/panel/panel-feiyang-fy07024di26a30d.c |  4 +--
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c  |  5 ++--
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c |  8 +++---
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 13 +++++----
 .../gpu/drm/panel/panel-jdi-lt070me05000.c    |  9 ++++---
 .../drm/panel/panel-kingdisplay-kd097d04.c    | 11 ++++----
 drivers/gpu/drm/panel/panel-lg-lb035q02.c     |  4 +--
 drivers/gpu/drm/panel/panel-lg-lg4573.c       |  8 +++---
 drivers/gpu/drm/panel/panel-lvds.c            |  4 +--
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c  |  4 +--
 drivers/gpu/drm/panel/panel-novatek-nt39016.c |  4 +--
 .../drm/panel/panel-olimex-lcd-olinuxino.c    |  4 +--
 .../gpu/drm/panel/panel-orisetech-otm8009a.c  |  9 ++++---
 .../drm/panel/panel-osd-osd101t2587-53ts.c    |  9 ++++---
 .../drm/panel/panel-panasonic-vvx10f034n00.c  |  9 ++++---
 .../drm/panel/panel-raspberrypi-touchscreen.c |  4 +--
 drivers/gpu/drm/panel/panel-raydium-rm67191.c |  6 ++---
 drivers/gpu/drm/panel/panel-raydium-rm68200.c |  9 ++++---
 .../drm/panel/panel-rocktech-jh057n00900.c    |  9 ++++---
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c  | 10 +++----
 drivers/gpu/drm/panel/panel-samsung-ld9040.c  |  4 +--
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c |  4 +--
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c |  4 +--
 .../gpu/drm/panel/panel-samsung-s6e63j0x03.c  |  4 +--
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c |  4 +--
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c |  4 +--
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c   |  9 ++++---
 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   |  9 ++++---
 .../gpu/drm/panel/panel-sharp-ls037v7dw01.c   |  4 +--
 .../gpu/drm/panel/panel-sharp-ls043t1le01.c   |  9 ++++---
 drivers/gpu/drm/panel/panel-simple.c          | 27 ++++++++++---------
 drivers/gpu/drm/panel/panel-sitronix-st7701.c |  9 ++++---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    |  8 +++---
 drivers/gpu/drm/panel/panel-sony-acx565akm.c  |  4 +--
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c  |  4 +--
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c  |  4 +--
 drivers/gpu/drm/panel/panel-tpo-tpg110.c      |  4 +--
 drivers/gpu/drm/panel/panel-truly-nt35597.c   |  4 +--
 include/drm/drm_panel.h                       |  3 ++-
 41 files changed, 141 insertions(+), 130 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 35609c90e467..9927e28d93e6 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -252,7 +252,7 @@ int drm_panel_get_modes(struct drm_panel *panel)
 		return -EINVAL;
 
 	if (panel->funcs && panel->funcs->get_modes)
-		return panel->funcs->get_modes(panel);
+		return panel->funcs->get_modes(panel, panel->connector);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gpu/drm/panel/panel-arm-versatile.c
index a0574dc03e16..41aa91f60979 100644
--- a/drivers/gpu/drm/panel/panel-arm-versatile.c
+++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
@@ -260,9 +260,9 @@ static int versatile_panel_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int versatile_panel_get_modes(struct drm_panel *panel)
+static int versatile_panel_get_modes(struct drm_panel *panel,
+				     struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct versatile_panel *vpanel = to_versatile_panel(panel);
 	struct drm_display_mode *mode;
 
diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index 98f184b81187..37d6b7390954 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -162,9 +162,9 @@ static const struct drm_display_mode feiyang_default_mode = {
 	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
-static int feiyang_get_modes(struct drm_panel *panel)
+static int feiyang_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct feiyang *ctx = panel_to_feiyang(panel);
 	struct drm_display_mode *mode;
 
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
index 24955bec1958..8fd4c0521841 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
@@ -641,9 +641,9 @@ static const struct drm_display_mode itu_r_bt_656_720_mode = {
 	.flags = 0,
 };
 
-static int ili9322_get_modes(struct drm_panel *panel)
+static int ili9322_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct ili9322 *ili = panel_to_ili9322(panel);
 	struct drm_display_mode *mode;
 	struct drm_display_info *info;
@@ -655,7 +655,6 @@ static int ili9322_get_modes(struct drm_panel *panel)
 		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
 	else
 		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
-
 	if (ili->conf->de_active_high)
 		info->bus_flags |= DRM_BUS_FLAG_DE_HIGH;
 	else
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index e8789e460a16..1c67a668d6bf 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -387,9 +387,9 @@ static const struct drm_display_mode bananapi_default_mode = {
 	.vtotal		= 1280 + 10 + 10 + 20,
 };
 
-static int ili9881c_get_modes(struct drm_panel *panel)
+static int ili9881c_get_modes(struct drm_panel *panel,
+			      struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct ili9881c *ctx = panel_to_ili9881c(panel);
 	struct drm_display_mode *mode;
 
@@ -407,8 +407,8 @@ static int ili9881c_get_modes(struct drm_panel *panel)
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = 62;
-	panel->connector->display_info.height_mm = 110;
+	connector->display_info.width_mm = 62;
+	connector->display_info.height_mm = 110;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index 83df1ac4211f..facf1bab2532 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -403,7 +403,8 @@ static const struct panel_desc innolux_p097pfg_panel_desc = {
 	.sleep_mode_delay = 100, /* T15 */
 };
 
-static int innolux_panel_get_modes(struct drm_panel *panel)
+static int innolux_panel_get_modes(struct drm_panel *panel,
+				   struct drm_connector *connector)
 {
 	struct innolux_panel *innolux = to_innolux_panel(panel);
 	const struct drm_display_mode *m = innolux->desc->mode;
@@ -418,13 +419,11 @@ static int innolux_panel_get_modes(struct drm_panel *panel)
 
 	drm_mode_set_name(mode);
 
-	drm_mode_probed_add(panel->connector, mode);
+	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm =
-			innolux->desc->size.width;
-	panel->connector->display_info.height_mm =
-			innolux->desc->size.height;
-	panel->connector->display_info.bpc = innolux->desc->bpc;
+	connector->display_info.width_mm = innolux->desc->size.width;
+	connector->display_info.height_mm = innolux->desc->size.height;
+	connector->display_info.bpc = innolux->desc->bpc;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 56364a93f0b8..e6b650a64fdb 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -300,7 +300,8 @@ static const struct drm_display_mode default_mode = {
 		.flags = 0,
 };
 
-static int jdi_panel_get_modes(struct drm_panel *panel)
+static int jdi_panel_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
 {
 	struct drm_display_mode *mode;
 	struct jdi_panel *jdi = to_jdi_panel(panel);
@@ -316,10 +317,10 @@ static int jdi_panel_get_modes(struct drm_panel *panel)
 
 	drm_mode_set_name(mode);
 
-	drm_mode_probed_add(panel->connector, mode);
+	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = 95;
-	panel->connector->display_info.height_mm = 151;
+	connector->display_info.width_mm = 95;
+	connector->display_info.height_mm = 151;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 45f96556ec8c..e6f53d56daf9 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -333,7 +333,8 @@ static const struct drm_display_mode default_mode = {
 	.vrefresh = 60,
 };
 
-static int kingdisplay_panel_get_modes(struct drm_panel *panel)
+static int kingdisplay_panel_get_modes(struct drm_panel *panel,
+				       struct drm_connector *connector)
 {
 	struct drm_display_mode *mode;
 
@@ -347,11 +348,11 @@ static int kingdisplay_panel_get_modes(struct drm_panel *panel)
 
 	drm_mode_set_name(mode);
 
-	drm_mode_probed_add(panel->connector, mode);
+	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = 147;
-	panel->connector->display_info.height_mm = 196;
-	panel->connector->display_info.bpc = 8;
+	connector->display_info.width_mm = 147;
+	connector->display_info.height_mm = 196;
+	connector->display_info.bpc = 8;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-lg-lb035q02.c b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
index 7a1385e834f0..7a3bd4d80c79 100644
--- a/drivers/gpu/drm/panel/panel-lg-lb035q02.c
+++ b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
@@ -141,9 +141,9 @@ static const struct drm_display_mode lb035q02_mode = {
 	.height_mm = 53,
 };
 
-static int lb035q02_get_modes(struct drm_panel *panel)
+static int lb035q02_get_modes(struct drm_panel *panel,
+			      struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(panel->drm, &lb035q02_mode);
diff --git a/drivers/gpu/drm/panel/panel-lg-lg4573.c b/drivers/gpu/drm/panel/panel-lg-lg4573.c
index db4865a4c2b9..fc6572b4e2f9 100644
--- a/drivers/gpu/drm/panel/panel-lg-lg4573.c
+++ b/drivers/gpu/drm/panel/panel-lg-lg4573.c
@@ -209,9 +209,9 @@ static const struct drm_display_mode default_mode = {
 	.vrefresh = 60,
 };
 
-static int lg4573_get_modes(struct drm_panel *panel)
+static int lg4573_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(panel->drm, &default_mode);
@@ -227,8 +227,8 @@ static int lg4573_get_modes(struct drm_panel *panel)
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = 61;
-	panel->connector->display_info.height_mm = 103;
+	connector->display_info.width_mm = 61;
+	connector->display_info.height_mm = 103;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 2405f26e5d31..f6d58a60e514 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -106,10 +106,10 @@ static int panel_lvds_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int panel_lvds_get_modes(struct drm_panel *panel)
+static int panel_lvds_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
 {
 	struct panel_lvds *lvds = to_panel_lvds(panel);
-	struct drm_connector *connector = lvds->panel.connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_create(lvds->panel.drm);
diff --git a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
index fd593532ab23..a6ccdb09aace 100644
--- a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
+++ b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
@@ -123,9 +123,9 @@ static const struct drm_display_mode nl8048_mode = {
 	.height_mm = 53,
 };
 
-static int nl8048_get_modes(struct drm_panel *panel)
+static int nl8048_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(panel->drm, &nl8048_mode);
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index 60ccedce530c..91ea49c05611 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -206,11 +206,11 @@ static int nt39016_disable(struct drm_panel *drm_panel)
 	return 0;
 }
 
-static int nt39016_get_modes(struct drm_panel *drm_panel)
+static int nt39016_get_modes(struct drm_panel *drm_panel,
+			     struct drm_connector *connector)
 {
 	struct nt39016 *panel = to_nt39016(drm_panel);
 	const struct nt39016_panel_info *panel_info = panel->panel_info;
-	struct drm_connector *connector = drm_panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(drm_panel->drm, &panel_info->display_mode);
diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 8738ef1b66dc..2b7e0dfebc5e 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -141,10 +141,10 @@ static int lcd_olinuxino_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int lcd_olinuxino_get_modes(struct drm_panel *panel)
+static int lcd_olinuxino_get_modes(struct drm_panel *panel,
+				   struct drm_connector *connector)
 {
 	struct lcd_olinuxino *lcd = to_lcd_olinuxino(panel);
-	struct drm_connector *connector = lcd->panel.connector;
 	struct lcd_olinuxino_info *lcd_info = &lcd->eeprom.info;
 	struct drm_device *drm = lcd->panel.drm;
 	struct lcd_olinuxino_mode *lcd_mode;
diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index bf1f928b215f..4e1606c79072 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -349,7 +349,8 @@ static int otm8009a_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int otm8009a_get_modes(struct drm_panel *panel)
+static int otm8009a_get_modes(struct drm_panel *panel,
+			      struct drm_connector *connector)
 {
 	struct drm_display_mode *mode;
 
@@ -364,10 +365,10 @@ static int otm8009a_get_modes(struct drm_panel *panel)
 	drm_mode_set_name(mode);
 
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	drm_mode_probed_add(panel->connector, mode);
+	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = mode->width_mm;
-	panel->connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 2b40913899d8..b3e010288c10 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -112,7 +112,8 @@ static const struct drm_display_mode default_mode_osd101t2587 = {
 	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 
-static int osd101t2587_panel_get_modes(struct drm_panel *panel)
+static int osd101t2587_panel_get_modes(struct drm_panel *panel,
+				       struct drm_connector *connector)
 {
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 	struct drm_display_mode *mode;
@@ -128,10 +129,10 @@ static int osd101t2587_panel_get_modes(struct drm_panel *panel)
 
 	drm_mode_set_name(mode);
 
-	drm_mode_probed_add(panel->connector, mode);
+	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = 217;
-	panel->connector->display_info.height_mm = 136;
+	connector->display_info.width_mm = 217;
+	connector->display_info.height_mm = 136;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 664605071d34..19a6eb4637c8 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -166,7 +166,8 @@ static const struct drm_display_mode default_mode = {
 	.vrefresh = 60,
 };
 
-static int wuxga_nt_panel_get_modes(struct drm_panel *panel)
+static int wuxga_nt_panel_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
 {
 	struct drm_display_mode *mode;
 
@@ -180,10 +181,10 @@ static int wuxga_nt_panel_get_modes(struct drm_panel *panel)
 
 	drm_mode_set_name(mode);
 
-	drm_mode_probed_add(panel->connector, mode);
+	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = 217;
-	panel->connector->display_info.height_mm = 136;
+	connector->display_info.width_mm = 217;
+	connector->display_info.height_mm = 136;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 09824e92fc78..732b7111395e 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -311,9 +311,9 @@ static int rpi_touchscreen_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int rpi_touchscreen_get_modes(struct drm_panel *panel)
+static int rpi_touchscreen_get_modes(struct drm_panel *panel,
+				     struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_device *drm = panel->drm;
 	unsigned int i, num = 0;
 	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index fd67fc6185c4..123bb68cfcb7 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -436,9 +436,9 @@ static int rad_panel_disable(struct drm_panel *panel)
 	return 0;
 }
 
-static int rad_panel_get_modes(struct drm_panel *panel)
+static int rad_panel_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(panel->drm, &default_mode);
@@ -451,7 +451,7 @@ static int rad_panel_get_modes(struct drm_panel *panel)
 
 	drm_mode_set_name(mode);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	drm_mode_probed_add(panel->connector, mode);
+	drm_mode_probed_add(connector, mode);
 
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
index 994e855721f4..66fa975308ec 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
@@ -335,7 +335,8 @@ static int rm68200_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int rm68200_get_modes(struct drm_panel *panel)
+static int rm68200_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
 {
 	struct drm_display_mode *mode;
 
@@ -350,10 +351,10 @@ static int rm68200_get_modes(struct drm_panel *panel)
 	drm_mode_set_name(mode);
 
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	drm_mode_probed_add(panel->connector, mode);
+	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = mode->width_mm;
-	panel->connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
index 31234b79d3b1..b2d61cab3cad 100644
--- a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
+++ b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
@@ -230,7 +230,8 @@ static const struct drm_display_mode default_mode = {
 	.height_mm   = 130,
 };
 
-static int jh057n_get_modes(struct drm_panel *panel)
+static int jh057n_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
 {
 	struct jh057n *ctx = panel_to_jh057n(panel);
 	struct drm_display_mode *mode;
@@ -246,9 +247,9 @@ static int jh057n_get_modes(struct drm_panel *panel)
 	drm_mode_set_name(mode);
 
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	panel->connector->display_info.width_mm = mode->width_mm;
-	panel->connector->display_info.height_mm = mode->height_mm;
-	drm_mode_probed_add(panel->connector, mode);
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	drm_mode_probed_add(connector, mode);
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index 170a5cda21b9..57a462ce221e 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -120,9 +120,9 @@ static const struct drm_display_mode default_mode = {
 	.height_mm	= 85,
 };
 
-static int rb070d30_panel_get_modes(struct drm_panel *panel)
+static int rb070d30_panel_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
 	struct drm_display_mode *mode;
 	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
@@ -140,9 +140,9 @@ static int rb070d30_panel_get_modes(struct drm_panel *panel)
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.bpc = 8;
-	panel->connector->display_info.width_mm = mode->width_mm;
-	panel->connector->display_info.height_mm = mode->height_mm;
+	connector->display_info.bpc = 8;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &bus_format, 1);
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
index 250809ba37c7..3c52f15f7a1c 100644
--- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
+++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
@@ -261,9 +261,9 @@ static int ld9040_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int ld9040_get_modes(struct drm_panel *panel)
+static int ld9040_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct ld9040 *ctx = panel_to_ld9040(panel);
 	struct drm_display_mode *mode;
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
index e3a0397e953e..71939ab757b1 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
@@ -143,9 +143,9 @@ static int s6d16d0_disable(struct drm_panel *panel)
 	return 0;
 }
 
-static int s6d16d0_get_modes(struct drm_panel *panel)
+static int s6d16d0_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(panel->drm, &samsung_s6d16d0_mode);
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
index 938ab72c5540..8e0236ba6145 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
@@ -645,9 +645,9 @@ static const struct s6e3ha2_panel_desc samsung_s6e3hf2 = {
 	.type = HF2_TYPE,
 };
 
-static int s6e3ha2_get_modes(struct drm_panel *panel)
+static int s6e3ha2_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct s6e3ha2 *ctx = container_of(panel, struct s6e3ha2, panel);
 	struct drm_display_mode *mode;
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index a60635e9226d..c939d5bde4f0 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -400,9 +400,9 @@ static int s6e63j0x03_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int s6e63j0x03_get_modes(struct drm_panel *panel)
+static int s6e63j0x03_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(panel->drm, &default_mode);
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index ba01af0b14fd..1d099092e754 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -362,9 +362,9 @@ static int s6e63m0_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int s6e63m0_get_modes(struct drm_panel *panel)
+static int s6e63m0_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(panel->drm, &default_mode);
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
index dbced6501204..8a028d2bd0d6 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
@@ -920,9 +920,9 @@ static int s6e8aa0_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int s6e8aa0_get_modes(struct drm_panel *panel)
+static int s6e8aa0_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct s6e8aa0 *ctx = panel_to_s6e8aa0(panel);
 	struct drm_display_mode *mode;
 
diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index b3619ba443bd..b878930b17e4 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -56,9 +56,9 @@ static inline struct seiko_panel *to_seiko_panel(struct drm_panel *panel)
 	return container_of(panel, struct seiko_panel, base);
 }
 
-static int seiko_panel_get_fixed_modes(struct seiko_panel *panel)
+static int seiko_panel_get_fixed_modes(struct seiko_panel *panel,
+				       struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->base.connector;
 	struct drm_device *drm = panel->base.drm;
 	struct drm_display_mode *mode;
 	unsigned int i, num = 0;
@@ -208,12 +208,13 @@ static int seiko_panel_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int seiko_panel_get_modes(struct drm_panel *panel)
+static int seiko_panel_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
 {
 	struct seiko_panel *p = to_seiko_panel(panel);
 
 	/* add hard-coded panel modes */
-	return seiko_panel_get_fixed_modes(p);
+	return seiko_panel_get_fixed_modes(p, connector);
 }
 
 static int seiko_panel_get_timings(struct drm_panel *panel,
diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 5e136c3ba185..e797b700661a 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -278,7 +278,8 @@ static const struct drm_display_mode default_mode = {
 	.vrefresh = 60,
 };
 
-static int sharp_panel_get_modes(struct drm_panel *panel)
+static int sharp_panel_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
 {
 	struct drm_display_mode *mode;
 
@@ -292,10 +293,10 @@ static int sharp_panel_get_modes(struct drm_panel *panel)
 
 	drm_mode_set_name(mode);
 
-	drm_mode_probed_add(panel->connector, mode);
+	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = 217;
-	panel->connector->display_info.height_mm = 136;
+	connector->display_info.width_mm = 217;
+	connector->display_info.height_mm = 136;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
index eeab7998c7de..7103a945f0e8 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
@@ -100,9 +100,9 @@ static const struct drm_display_mode ls037v7dw01_mode = {
 	.height_mm = 75,
 };
 
-static int ls037v7dw01_get_modes(struct drm_panel *panel)
+static int ls037v7dw01_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(panel->drm, &ls037v7dw01_mode);
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index b963ba4ab589..85ae6cffdbfb 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -210,7 +210,8 @@ static const struct drm_display_mode default_mode = {
 	.vrefresh = 60,
 };
 
-static int sharp_nt_panel_get_modes(struct drm_panel *panel)
+static int sharp_nt_panel_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
 {
 	struct drm_display_mode *mode;
 
@@ -224,10 +225,10 @@ static int sharp_nt_panel_get_modes(struct drm_panel *panel)
 
 	drm_mode_set_name(mode);
 
-	drm_mode_probed_add(panel->connector, mode);
+	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = 54;
-	panel->connector->display_info.height_mm = 95;
+	connector->display_info.width_mm = 54;
+	connector->display_info.height_mm = 95;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a5df6d6dd455..d6299fe6d276 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -117,9 +117,9 @@ static inline struct panel_simple *to_panel_simple(struct drm_panel *panel)
 	return container_of(panel, struct panel_simple, base);
 }
 
-static unsigned int panel_simple_get_timings_modes(struct panel_simple *panel)
+static unsigned int panel_simple_get_timings_modes(struct panel_simple *panel,
+						   struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->base.connector;
 	struct drm_device *drm = panel->base.drm;
 	struct drm_display_mode *mode;
 	unsigned int i, num = 0;
@@ -150,9 +150,9 @@ static unsigned int panel_simple_get_timings_modes(struct panel_simple *panel)
 	return num;
 }
 
-static unsigned int panel_simple_get_display_modes(struct panel_simple *panel)
+static unsigned int panel_simple_get_display_modes(struct panel_simple *panel,
+						   struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->base.connector;
 	struct drm_device *drm = panel->base.drm;
 	struct drm_display_mode *mode;
 	unsigned int i, num = 0;
@@ -181,9 +181,9 @@ static unsigned int panel_simple_get_display_modes(struct panel_simple *panel)
 	return num;
 }
 
-static int panel_simple_get_non_edid_modes(struct panel_simple *panel)
+static int panel_simple_get_non_edid_modes(struct panel_simple *panel,
+					   struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->base.connector;
 	struct drm_device *drm = panel->base.drm;
 	struct drm_display_mode *mode;
 	bool has_override = panel->override_mode.type;
@@ -204,7 +204,7 @@ static int panel_simple_get_non_edid_modes(struct panel_simple *panel)
 
 	/* Only add timings if override was not there or failed to validate */
 	if (num == 0 && panel->desc->num_timings)
-		num = panel_simple_get_timings_modes(panel);
+		num = panel_simple_get_timings_modes(panel, connector);
 
 	/*
 	 * Only add fixed modes if timings/override added no mode.
@@ -214,7 +214,7 @@ static int panel_simple_get_non_edid_modes(struct panel_simple *panel)
 	 */
 	WARN_ON(panel->desc->num_timings && panel->desc->num_modes);
 	if (num == 0)
-		num = panel_simple_get_display_modes(panel);
+		num = panel_simple_get_display_modes(panel, connector);
 
 	connector->display_info.bpc = panel->desc->bpc;
 	connector->display_info.width_mm = panel->desc->size.width;
@@ -304,23 +304,24 @@ static int panel_simple_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int panel_simple_get_modes(struct drm_panel *panel)
+static int panel_simple_get_modes(struct drm_panel *panel,
+				  struct drm_connector *connector)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 	int num = 0;
 
 	/* probe EDID if a DDC bus is available */
 	if (p->ddc) {
-		struct edid *edid = drm_get_edid(panel->connector, p->ddc);
-		drm_connector_update_edid_property(panel->connector, edid);
+		struct edid *edid = drm_get_edid(connector, p->ddc);
+		drm_connector_update_edid_property(connector, edid);
 		if (edid) {
-			num += drm_add_edid_modes(panel->connector, edid);
+			num += drm_add_edid_modes(connector, edid);
 			kfree(edid);
 		}
 	}
 
 	/* add hard-coded panel modes */
-	num += panel_simple_get_non_edid_modes(p);
+	num += panel_simple_get_non_edid_modes(p, connector);
 
 	return num;
 }
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index ee3f23f45755..3ed3b1d6d82d 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -264,7 +264,8 @@ static int st7701_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int st7701_get_modes(struct drm_panel *panel)
+static int st7701_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
 {
 	struct st7701 *st7701 = panel_to_st7701(panel);
 	const struct drm_display_mode *desc_mode = st7701->desc->mode;
@@ -280,10 +281,10 @@ static int st7701_get_modes(struct drm_panel *panel)
 	}
 
 	drm_mode_set_name(mode);
-	drm_mode_probed_add(panel->connector, mode);
+	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = desc_mode->width_mm;
-	panel->connector->display_info.height_mm = desc_mode->height_mm;
+	connector->display_info.width_mm = desc_mode->width_mm;
+	connector->display_info.height_mm = desc_mode->height_mm;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 108a85bb6667..836b01331505 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -170,9 +170,9 @@ static const struct drm_display_mode default_mode = {
 	.vrefresh = 60,
 };
 
-static int st7789v_get_modes(struct drm_panel *panel)
+static int st7789v_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(panel->drm, &default_mode);
@@ -188,8 +188,8 @@ static int st7789v_get_modes(struct drm_panel *panel)
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = 61;
-	panel->connector->display_info.height_mm = 103;
+	connector->display_info.width_mm = 61;
+	connector->display_info.height_mm = 103;
 
 	return 1;
 }
diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index d6387d8f88a3..841dc73c443d 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -521,9 +521,9 @@ static const struct drm_display_mode acx565akm_mode = {
 	.height_mm = 46,
 };
 
-static int acx565akm_get_modes(struct drm_panel *panel)
+static int acx565akm_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(panel->drm, &acx565akm_mode);
diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
index c44d6a65c0aa..5230176bd8e6 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
@@ -287,9 +287,9 @@ static const struct drm_display_mode td028ttec1_mode = {
 	.height_mm = 58,
 };
 
-static int td028ttec1_get_modes(struct drm_panel *panel)
+static int td028ttec1_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(panel->drm, &td028ttec1_mode);
diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
index 621b65feec07..716f8ed1cc45 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
@@ -346,9 +346,9 @@ static const struct drm_display_mode td043mtea1_mode = {
 	.height_mm = 56,
 };
 
-static int td043mtea1_get_modes(struct drm_panel *panel)
+static int td043mtea1_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(panel->drm, &td043mtea1_mode);
diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
index 1a5418ae2ccf..e74cd9d418cf 100644
--- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
+++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
@@ -384,9 +384,9 @@ static int tpg110_enable(struct drm_panel *panel)
  * presents the mode that is configured for the system under use,
  * and which is detected by reading the registers of the display.
  */
-static int tpg110_get_modes(struct drm_panel *panel)
+static int tpg110_get_modes(struct drm_panel *panel,
+			    struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct tpg110 *tpg = to_tpg110(panel);
 	struct drm_display_mode *mode;
 
diff --git a/drivers/gpu/drm/panel/panel-truly-nt35597.c b/drivers/gpu/drm/panel/panel-truly-nt35597.c
index 0feea2456e14..012ca62bf30e 100644
--- a/drivers/gpu/drm/panel/panel-truly-nt35597.c
+++ b/drivers/gpu/drm/panel/panel-truly-nt35597.c
@@ -454,9 +454,9 @@ static int truly_nt35597_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int truly_nt35597_get_modes(struct drm_panel *panel)
+static int truly_nt35597_get_modes(struct drm_panel *panel,
+				   struct drm_connector *connector)
 {
-	struct drm_connector *connector = panel->connector;
 	struct truly_nt35597 *ctx = panel_to_ctx(panel);
 	struct drm_display_mode *mode;
 	const struct nt35597_config *config;
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index d30c98567384..a5f7199807f2 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -100,7 +100,8 @@ struct drm_panel_funcs {
 	 * Add modes to the connector that the panel is attached to and
 	 * return the number of modes added.
 	 */
-	int (*get_modes)(struct drm_panel *panel);
+	int (*get_modes)(struct drm_panel *panel,
+			 struct drm_connector *connector);
 
 	/**
 	 * @get_timings:
-- 
2.20.1

