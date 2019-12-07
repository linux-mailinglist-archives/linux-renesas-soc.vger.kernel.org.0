Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 859B9115CAD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfLGOEo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:44 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46329 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfLGOEo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:44 -0500
Received: by mail-lf1-f66.google.com with SMTP id f15so6583740lfl.13;
        Sat, 07 Dec 2019 06:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VaBvhdhNtObbqsxPerTgXU57K3m4iUiAmX6XWjRdma8=;
        b=cZTvjGkjrfyjv3XvlFQLZd1fBYvUwA2F7rgXxqR3m5nmg4z4VuWhpUyxwuWV5mLHFW
         EdupZomTGwmdPvT58sN7eRALuAXX1G0Nf92Bt0sdGN7fHTxOx7iUT0HS0GMmbu4ySvtw
         z1MUgMzIaR7Bwp2VeOeHbW+y77pfYovpN7W+UV2JENCEMJ1WGIHs4myc1V5VnsO2AiKE
         2tga/sY6fV6bOSKUJ3nKwOYkXHC1SOsy0XuCyXv/SWN3wThH9FXB/1CboBK4SmOHKKmO
         SPscZrSICFYQIb1PpbDJJ10R9p2xTo/OvSCjOU7YcPTtvqZD2jvRDV1/q6CSOmLuOh1R
         ldUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=VaBvhdhNtObbqsxPerTgXU57K3m4iUiAmX6XWjRdma8=;
        b=B1jZV+vazPYSWJIN5ffARDENuMUG5980kt4KDNLqDqLmd5InEKOWAjg2UKG8GJCR+4
         BkNOeH0K811XIwSMUifrYoZDhWWo3FuJQjTmgAEb1W/Ow37lOc/11bLGvlNKWX05aLr5
         A+MBYiAsoYwanC0z5VrWWge2ZeLiznaaE7rbZlGkrIG0PD4oKTHOdn9q7ogGBP316kHv
         vwlR5njBrul5DjoX0u38IKiptcGcXIHshpABswCNtiGGZN65wxvtm+E8mpL1rcKJx3mR
         Xi6nVF8KJ0r/6QBuCLJmWndurDE7hzkJGw/s/ffNaRBXcCxOe8Cq3VyA3WVi+5DVKIzX
         Ccag==
X-Gm-Message-State: APjAAAVyCKUPD0bvCntK02d+QIkjJcuXENHkoQdd+U8/6Mgh/ciGa9I8
        gsS2sgDH6OWrWUNbvfUnLNWod1nWzOSgHg==
X-Google-Smtp-Source: APXvYqwM0erZxo6LOlySak2aMfBaSTmHMVITDmR/sT0HyMLyvaaqCnJATLGaFQPO9c/qhW5jo19sYg==
X-Received: by 2002:a19:ac08:: with SMTP id g8mr11551704lfc.112.1575727480871;
        Sat, 07 Dec 2019 06:04:40 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:40 -0800 (PST)
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
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v2 17/25] drm/panel: rocktech-jh057n00900: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:45 +0100
Message-Id: <20191207140353.23967-18-sam@ravnborg.org>
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

Use the backlight support in drm_panel to simplify the driver.
While touching the include files sort them
and divide them up in blocks.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Guido Günther" <agx@sigxcpu.org>
Cc: Purism Kernel Team <kernel@puri.sm>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../drm/panel/panel-rocktech-jh057n00900.c    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
index 3a4f1c0fce86..38ff742bc120 100644
--- a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
+++ b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
@@ -5,20 +5,22 @@
  * Copyright (C) Purism SPC 2019
  */
 
-#include <drm/drm_mipi_dsi.h>
-#include <drm/drm_modes.h>
-#include <drm/drm_panel.h>
-#include <drm/drm_print.h>
-#include <linux/backlight.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/media-bus-format.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
+
 #include <video/display_timing.h>
 #include <video/mipi_display.h>
 
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
 #define DRV_NAME "panel-rocktech-jh057n00900"
 
 /* Manufacturer specific Commands send via DSI */
@@ -47,7 +49,6 @@ struct jh057n {
 	struct device *dev;
 	struct drm_panel panel;
 	struct gpio_desc *reset_gpio;
-	struct backlight_device *backlight;
 	struct regulator *vcc;
 	struct regulator *iovcc;
 	bool prepared;
@@ -152,7 +153,7 @@ static int jh057n_enable(struct drm_panel *panel)
 		return ret;
 	}
 
-	return backlight_enable(ctx->backlight);
+	return 0;
 }
 
 static int jh057n_disable(struct drm_panel *panel)
@@ -160,7 +161,6 @@ static int jh057n_disable(struct drm_panel *panel)
 	struct jh057n *ctx = panel_to_jh057n(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 
-	backlight_disable(ctx->backlight);
 	return mipi_dsi_dcs_set_display_off(dsi);
 }
 
@@ -321,10 +321,6 @@ static int jh057n_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
 		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 
-	ctx->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(ctx->backlight))
-		return PTR_ERR(ctx->backlight);
-
 	ctx->vcc = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(ctx->vcc)) {
 		ret = PTR_ERR(ctx->vcc);
@@ -347,6 +343,10 @@ static int jh057n_probe(struct mipi_dsi_device *dsi)
 	drm_panel_init(&ctx->panel, dev, &jh057n_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
 	drm_panel_add(&ctx->panel);
 
 	ret = mipi_dsi_attach(dsi);
-- 
2.20.1

