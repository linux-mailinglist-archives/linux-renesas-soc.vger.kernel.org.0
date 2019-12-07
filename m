Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B993115C8F
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfLGOEd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:33 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44431 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfLGOEd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:33 -0500
Received: by mail-lf1-f65.google.com with SMTP id v201so7374846lfa.11;
        Sat, 07 Dec 2019 06:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uCcsUdwReshm9HwMNcrU5BxdMhIAKJ/ocTck1sZP+Fo=;
        b=s22pFD4YrEM3PFFzKv+ZLsVIXm+HdH/EaDdcclRIe89iftvcVnXlN37VAJLTLRpKCI
         Joj9aeFpY8riXENAwhHWUGERnh/I5RyC2zHkzJ4cvd/ly3H5g+HjF7GEvZPbNkirgs3P
         ZVynpmSQopiLvYNmQKwKGrQsFS4gud4WijDs1HgxL2uNpFOb7fIg/6ULqcKqAMszS3Rj
         3KtWDPxC+GD7oLwj9GPbI4DrWrOgAo6SdNIDXyYnDcF7eOmSvKVExMRWyVzwV/tSHyMC
         E76/PwPIZVH4HkQC9Me7Eg88eefxTIt8g9IHrCvjj+IcTjeu1oIAncoo/mzoGU9hxyPr
         B8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=uCcsUdwReshm9HwMNcrU5BxdMhIAKJ/ocTck1sZP+Fo=;
        b=V+LS7Qdj1lJp6+XFRywvT1uvZXocolGRRqkzX4o/FJDtGHDpr6oTYuEmXFw1GrU0CJ
         buwaOl/oiuEVSamgpN3ro73eyPRX+XneujHiy0rkupgYkPH39DF9xCyZSNaFoD+IhP1A
         70HrIczdy1/Hq7GdtY+4sx4fxP1WK7j0j+qPtitd8LU42eXx1tUID/D0JR2qStbKkN64
         xdyHQAdAv69QiPT6y9KUBVdLGUUuyfsdFG9iaitxCWzoUerP4Wkhv5Ajo9PcXFQAWaQ9
         tzAJll1tgPmD6KshU4gCSpijiyUx7rNJXja1bnXAJpOPZbEA4M7HTjz8ljcnLw0ZVLVg
         9yvA==
X-Gm-Message-State: APjAAAWhHlNcPKfFxnlVXoaJfdxx4q6fKtA+dR3r8mSR0yYI64YlTikD
        fyM9W05XzL2I88hieO13Ka8=
X-Google-Smtp-Source: APXvYqwODyhNxo//UXLNaOKxcezmY/8FXmz3+HXMvPwIlwOjWb5g2QkT3BMHdTPdMLzXRsxZlWwl5w==
X-Received: by 2002:ac2:5635:: with SMTP id b21mr814144lff.127.1575727469887;
        Sat, 07 Dec 2019 06:04:29 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:29 -0800 (PST)
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
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 11/25] drm/panel: kingdisplay-kd097d04: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:39 +0100
Message-Id: <20191207140353.23967-12-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the backlight support in drm_panel to simplify the driver

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../drm/panel/panel-kingdisplay-kd097d04.c    | 28 ++++++-------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 353ee6caa01c..bac1a2a06c92 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2017, Fuzhou Rockchip Electronics Co., Ltd
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -23,7 +22,6 @@ struct kingdisplay_panel {
 	struct drm_panel base;
 	struct mipi_dsi_device *link;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 	struct gpio_desc *enable_gpio;
 
@@ -191,8 +189,6 @@ static int kingdisplay_panel_disable(struct drm_panel *panel)
 	if (!kingdisplay->enabled)
 		return 0;
 
-	backlight_disable(kingdisplay->backlight);
-
 	err = mipi_dsi_dcs_set_display_off(kingdisplay->link);
 	if (err < 0)
 		DRM_DEV_ERROR(panel->dev, "failed to set display off: %d\n",
@@ -303,18 +299,10 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 static int kingdisplay_panel_enable(struct drm_panel *panel)
 {
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
-	int ret;
 
 	if (kingdisplay->enabled)
 		return 0;
 
-	ret = backlight_enable(kingdisplay->backlight);
-	if (ret) {
-		DRM_DEV_ERROR(panel->dev,
-			      "Failed to enable backlight %d\n", ret);
-		return ret;
-	}
-
 	kingdisplay->enabled = true;
 
 	return 0;
@@ -388,13 +376,13 @@ static int kingdisplay_panel_add(struct kingdisplay_panel *kingdisplay)
 		kingdisplay->enable_gpio = NULL;
 	}
 
-	kingdisplay->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(kingdisplay->backlight))
-		return PTR_ERR(kingdisplay->backlight);
-
 	drm_panel_init(&kingdisplay->base, &kingdisplay->link->dev,
 		       &kingdisplay_panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
+	err = drm_panel_of_backlight(&kingdisplay->base);
+	if (err)
+		return err;
+
 	return drm_panel_add(&kingdisplay->base);
 }
 
@@ -432,12 +420,12 @@ static int kingdisplay_panel_remove(struct mipi_dsi_device *dsi)
 	struct kingdisplay_panel *kingdisplay = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = kingdisplay_panel_unprepare(&kingdisplay->base);
+	err = drm_panel_unprepare(&kingdisplay->base);
 	if (err < 0)
 		DRM_DEV_ERROR(&dsi->dev, "failed to unprepare panel: %d\n",
 			      err);
 
-	err = kingdisplay_panel_disable(&kingdisplay->base);
+	err = drm_panel_disable(&kingdisplay->base);
 	if (err < 0)
 		DRM_DEV_ERROR(&dsi->dev, "failed to disable panel: %d\n", err);
 
@@ -455,8 +443,8 @@ static void kingdisplay_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct kingdisplay_panel *kingdisplay = mipi_dsi_get_drvdata(dsi);
 
-	kingdisplay_panel_unprepare(&kingdisplay->base);
-	kingdisplay_panel_disable(&kingdisplay->base);
+	drm_panel_unprepare(&kingdisplay->base);
+	drm_panel_disable(&kingdisplay->base);
 }
 
 static struct mipi_dsi_driver kingdisplay_panel_driver = {
-- 
2.20.1

