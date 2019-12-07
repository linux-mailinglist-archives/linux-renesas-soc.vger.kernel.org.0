Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDC80115C8B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbfLGOEb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:31 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36177 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfLGOEb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:31 -0500
Received: by mail-lj1-f193.google.com with SMTP id r19so10734004ljg.3;
        Sat, 07 Dec 2019 06:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PEkkKHiq+AcHePdv87qZ46O+yNk0TpaePUBzT0oWsAc=;
        b=ZfHiRiueSHRoMm/wWPg2IEAFbC+nin4k5/h6+jqp6YAW6dtNdKpHxhLUqyQBrdiW5X
         IS69T1/XMFvXqXGcc956VzDbI9EAU0LALkPtX5E1ULJfoYNnPXw878/lGy/5UDWRyoZn
         lOJzZCmr3W4w+L4mhA22VZAR5ei76vWyygf4hVaS3BMOuchXlSmvt1qbmiOnS6ogFTSO
         AFppLqocMVslabJ7DToSGuHPtYw6gN3Q4temBKQ8tfmnNP9Mpz7mwHqyqb78C40OcI3S
         W84v8/HgfHEL4T9hbGi/iSwgNqm/ytbENpyqiJ1UF+/MPBXwVyJpguDgnGdveWD5YDi/
         QtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=PEkkKHiq+AcHePdv87qZ46O+yNk0TpaePUBzT0oWsAc=;
        b=pxAVgcnvX99aksBXP559DDFXnApmvGHUnpAEkDXiiP6TOa9Qk+e0GyYaYXsH6mkeaw
         n7TIcrCcWeTmN8/Fq/5EaFXRj3uuaSQVIev7b0iiu2qQVh0RAaV7cFXajE3+CZjKktZ0
         NGwIbmBdAoNZ+QPjzrU3xqCwjIArRo7un4vYZojlp/jcbTey3Zyaz+d/KHHrbpOxFmA1
         F1HMFUHUUQsuSiBaTa5vdNE77JpR4mZ1ILzY8w1arr1Dn8488BpTkC+TXo+NimsvlI+6
         kRg2FOy3OYu/W1TTtbw77CuOwMytpeDTz6MIMuGpk13AF6CxsENNfGP2HaCb7ffWfk3T
         d60w==
X-Gm-Message-State: APjAAAVi3vZRNQE0Z+yTGyKN48rzwA5auEfc0Mk3vdCURYz3cFLEFu1P
        HQxbX6HVdnReMiqRmd9YO6c=
X-Google-Smtp-Source: APXvYqyvSwIE32v2Kp9t6aC1p3mZ5oj9u6z9msGZC5D9TpRLAqQ5hY1QRbeh6HQns7Z439S/CNir0g==
X-Received: by 2002:a2e:978d:: with SMTP id y13mr11771522lji.103.1575727468217;
        Sat, 07 Dec 2019 06:04:28 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:27 -0800 (PST)
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
Subject: [PATCH v2 10/25] drm/panel: innolux-p079zca: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:38 +0100
Message-Id: <20191207140353.23967-11-sam@ravnborg.org>
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
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 28 ++++++-------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index b9de37a8a0c5..7419f1f0acee 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2017, Fuzhou Rockchip Electronics Co., Ltd
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -52,7 +51,6 @@ struct innolux_panel {
 	struct mipi_dsi_device *link;
 	const struct panel_desc *desc;
 
-	struct backlight_device *backlight;
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *enable_gpio;
 
@@ -72,8 +70,6 @@ static int innolux_panel_disable(struct drm_panel *panel)
 	if (!innolux->enabled)
 		return 0;
 
-	backlight_disable(innolux->backlight);
-
 	innolux->enabled = false;
 
 	return 0;
@@ -204,18 +200,10 @@ static int innolux_panel_prepare(struct drm_panel *panel)
 static int innolux_panel_enable(struct drm_panel *panel)
 {
 	struct innolux_panel *innolux = to_innolux_panel(panel);
-	int ret;
 
 	if (innolux->enabled)
 		return 0;
 
-	ret = backlight_enable(innolux->backlight);
-	if (ret) {
-		DRM_DEV_ERROR(panel->dev,
-			      "Failed to enable backlight %d\n", ret);
-		return ret;
-	}
-
 	innolux->enabled = true;
 
 	return 0;
@@ -482,13 +470,13 @@ static int innolux_panel_add(struct mipi_dsi_device *dsi,
 		innolux->enable_gpio = NULL;
 	}
 
-	innolux->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(innolux->backlight))
-		return PTR_ERR(innolux->backlight);
-
 	drm_panel_init(&innolux->base, dev, &innolux_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	err = drm_panel_of_backlight(&innolux->base);
+	if (err)
+		return err;
+
 	err = drm_panel_add(&innolux->base);
 	if (err < 0)
 		return err;
@@ -526,12 +514,12 @@ static int innolux_panel_remove(struct mipi_dsi_device *dsi)
 	struct innolux_panel *innolux = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = innolux_panel_unprepare(&innolux->base);
+	err = drm_panel_unprepare(&innolux->base);
 	if (err < 0)
 		DRM_DEV_ERROR(&dsi->dev, "failed to unprepare panel: %d\n",
 			      err);
 
-	err = innolux_panel_disable(&innolux->base);
+	err = drm_panel_disable(&innolux->base);
 	if (err < 0)
 		DRM_DEV_ERROR(&dsi->dev, "failed to disable panel: %d\n", err);
 
@@ -549,8 +537,8 @@ static void innolux_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct innolux_panel *innolux = mipi_dsi_get_drvdata(dsi);
 
-	innolux_panel_unprepare(&innolux->base);
-	innolux_panel_disable(&innolux->base);
+	drm_panel_unprepare(&innolux->base);
+	drm_panel_disable(&innolux->base);
 }
 
 static struct mipi_dsi_driver innolux_panel_driver = {
-- 
2.20.1

