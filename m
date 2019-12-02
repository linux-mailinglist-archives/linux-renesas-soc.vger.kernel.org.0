Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3DE10F038
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbfLBTdd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:33 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46768 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbfLBTdc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:32 -0500
Received: by mail-lj1-f195.google.com with SMTP id z17so774337ljk.13;
        Mon, 02 Dec 2019 11:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R0f42CF+zwCz/GYqQyt+Coe4IA7I6q2AFYs8+413zO0=;
        b=lnMtfHUcqZMMTnJ9gMhihKsg3Z/0eU6Y56rSI1jYsRkXy2EkvUclqmRZIEdI6SSSls
         wPP140xvr7sa1QlrV1iWDGiJ2sjuOkm5L3jQ7FOprQIYggBuzus2yGc1yji7zTj2Nl/O
         cAGOkgbft8rYkYZO8jIVy0IlYiloAfroxD7cWixqmRgTvqmKArka4CvLU0mzj499zQx8
         FJXuUfypTKn7fF2KJwWXlBTvu/WBeYYZxkGmc2iVRMKkGl5lbRPz/4sYiwtyYzLrQxsq
         B9WctI7d/M9bU3H43w9MGzdywkaqP47fHiAPW0Iet8HaUHiDfVL5BPF4qETjJfe8WPzZ
         LLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=R0f42CF+zwCz/GYqQyt+Coe4IA7I6q2AFYs8+413zO0=;
        b=mnQk8PnUcPGEAQDS14M57LOlK9tTX8envHqAwzTiZjKmLxAiJNewPtBK6XZnCmJVrq
         cX0tN8jn24P+DIAtQcfCHMTiq0a4hElT5zFUMTw4uXq3HamViRE1rSHdT2W0Qk66IQkM
         WmOewiKrhn5szyvfu0bYhizuNm/UIxbhCO3u6oc79YHh/6+5LiRmjidF60G1fnS8WoDh
         kpChPROBTYggMojDiUpUCnCE2p6V2Djz7SAIHZH+Jst2QN2QXnyrdlpwwRuEn5pB01rx
         fsX0HURH1PV9zInwRWa0LiPTCfivkIfptRu6IiHB6gB20w24Rw/tQD6uyXI+59PakUoH
         BtUQ==
X-Gm-Message-State: APjAAAXVkIY9jdgf3FrKFle6l++4CQdX0oQCUWHWM1BB9ddNm1K0agsv
        1NGf8piNUtfVMmvGkSxYj3I=
X-Google-Smtp-Source: APXvYqwxAoUwLTLEkQUfJnM7DgssO8M84iKQHSB7L3N4qws7EummnIVscFtc8tlydjwAe0u9VpqMAA==
X-Received: by 2002:a2e:b61a:: with SMTP id r26mr271701ljn.72.1575315209849;
        Mon, 02 Dec 2019 11:33:29 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:29 -0800 (PST)
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
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 13/26] drm/panel: lvds: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:17 +0100
Message-Id: <20191202193230.21310-14-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the backlight support in drm_panel to simplify the driver

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-lvds.c | 40 ++++--------------------------
 1 file changed, 5 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 5e40b674bb15..5ce3f4a2b7a1 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -8,7 +8,6 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
-#include <linux/backlight.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -34,7 +33,6 @@ struct panel_lvds {
 	unsigned int bus_format;
 	bool data_mirror;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 
 	struct gpio_desc *enable_gpio;
@@ -46,19 +44,6 @@ static inline struct panel_lvds *to_panel_lvds(struct drm_panel *panel)
 	return container_of(panel, struct panel_lvds, panel);
 }
 
-static int panel_lvds_disable(struct drm_panel *panel)
-{
-	struct panel_lvds *lvds = to_panel_lvds(panel);
-
-	if (lvds->backlight) {
-		lvds->backlight->props.power = FB_BLANK_POWERDOWN;
-		lvds->backlight->props.state |= BL_CORE_FBBLANK;
-		backlight_update_status(lvds->backlight);
-	}
-
-	return 0;
-}
-
 static int panel_lvds_unprepare(struct drm_panel *panel)
 {
 	struct panel_lvds *lvds = to_panel_lvds(panel);
@@ -93,19 +78,6 @@ static int panel_lvds_prepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int panel_lvds_enable(struct drm_panel *panel)
-{
-	struct panel_lvds *lvds = to_panel_lvds(panel);
-
-	if (lvds->backlight) {
-		lvds->backlight->props.state &= ~BL_CORE_FBBLANK;
-		lvds->backlight->props.power = FB_BLANK_UNBLANK;
-		backlight_update_status(lvds->backlight);
-	}
-
-	return 0;
-}
-
 static int panel_lvds_get_modes(struct drm_panel *panel,
 				struct drm_connector *connector)
 {
@@ -132,10 +104,8 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs panel_lvds_funcs = {
-	.disable = panel_lvds_disable,
 	.unprepare = panel_lvds_unprepare,
 	.prepare = panel_lvds_prepare,
-	.enable = panel_lvds_enable,
 	.get_modes = panel_lvds_get_modes,
 };
 
@@ -242,10 +212,6 @@ static int panel_lvds_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	lvds->backlight = devm_of_find_backlight(lvds->dev);
-	if (IS_ERR(lvds->backlight))
-		return PTR_ERR(lvds->backlight);
-
 	/*
 	 * TODO: Handle all power supplies specified in the DT node in a generic
 	 * way for panels that don't care about power supply ordering. LVDS
@@ -257,6 +223,10 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	drm_panel_init(&lvds->panel, lvds->dev, &panel_lvds_funcs,
 		       DRM_MODE_CONNECTOR_LVDS);
 
+	ret = drm_panel_of_backlight(&lvds->panel);
+	if (ret)
+		return ret;
+
 	ret = drm_panel_add(&lvds->panel);
 	if (ret < 0)
 		return ret;
@@ -271,7 +241,7 @@ static int panel_lvds_remove(struct platform_device *pdev)
 
 	drm_panel_remove(&lvds->panel);
 
-	panel_lvds_disable(&lvds->panel);
+	drm_panel_disable(&lvds->panel);
 
 	return 0;
 }
-- 
2.20.1

