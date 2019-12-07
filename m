Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 479F8115C93
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfLGOEf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:35 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36293 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfLGOEe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:34 -0500
Received: by mail-lf1-f66.google.com with SMTP id n12so7424089lfe.3;
        Sat, 07 Dec 2019 06:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MSWnR6VdohNUNOoFOCWn8BMjZQT0wFgumDrz53vPK98=;
        b=jJMVa7cVhgExq5uNImKtY6/kAmaigjLdQdldbzHZ8hHjFeI1pllqcDO4VPkreZkZUe
         gInPMWKqkwzqBMn59QbKd6B4gjT7NocpAfheSUD7gPQrHOPNEVCqbh38OtEbOEm0XJng
         FNCtKiR4ukXNMybUrn3xS9B9vJtxzZJpUHaSYVbSwXYai/MhVi6loFQFyYJ/WNXSqhvm
         4g79W0XLNcpsuHCRaif2tYztXzPefA4N5hLfLFp/G5J/Qivb0VZauDHAmJFEcWWu4OyZ
         bR//VvZOUNtfe1bu6uWhvILlq1BXI5fPkjY+cevovvV57fcE3l2izpgpliMgAcGWx2S9
         4J/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=MSWnR6VdohNUNOoFOCWn8BMjZQT0wFgumDrz53vPK98=;
        b=nSkxnOVM1eTX8SmsusS3TVUks2e/e860BQ0GnGi6lld+wYCTZ+2SSJy7qySsvweVOP
         5N2dqxEdmEO3BW8A3p3pY3cdNE5uEGoKONhzWrgPriGz7joOtoDHC8UUbFs7KDk2aCL/
         IAbUZYRJQS3anVG1pQ7ZM+bf/TVkwq4AMYKPW7FlSaEqMZqGtFfPh1zg629Jku97nutC
         /dGOv2IVEv2qa/h+90Sq8RRF+0zlpjGnehbEgcO6XlSEnqHnfA5zguhL34ieWlLn0BMc
         mQ1J3itN2IO/gis7u6/QB99LycycIxEhgL9khuDbD1ia/QCu8VdDmsja7pa3AIPZc6zC
         Nekw==
X-Gm-Message-State: APjAAAUFSs6G3PxLnXKHS0soQ9M4Ko6ioCaJ5HNR89QCtYyoSw7NC1XR
        XM/KL8BQheo+9d/51gEjEvM=
X-Google-Smtp-Source: APXvYqyNmfcdDlQvYICW2Ts4KjEsPdwDqWLhVGnv7aiHkVxrXOcZ/rYb2aF+AgT/0jQiarjudoHLkg==
X-Received: by 2002:a19:6a06:: with SMTP id u6mr6860850lfu.187.1575727471568;
        Sat, 07 Dec 2019 06:04:31 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:31 -0800 (PST)
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
Subject: [PATCH v2 12/25] drm/panel: lvds: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:40 +0100
Message-Id: <20191207140353.23967-13-sam@ravnborg.org>
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

