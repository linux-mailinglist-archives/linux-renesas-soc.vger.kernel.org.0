Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56DE910F088
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbfLBTdr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:47 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46799 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728168AbfLBTdq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:46 -0500
Received: by mail-lj1-f193.google.com with SMTP id z17so775264ljk.13;
        Mon, 02 Dec 2019 11:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M6n2l/EBcueNmX8f7XdGTcQ8vUUpCGLFuWYhReTcoKE=;
        b=IoKSmzU7gpDxUkxl0EdaC0gWScyLrTcPd3YGGa7b4HdIqDI8G1e8FafzmGs6jogxMu
         4PaXLxX2BIT63x1BMLWqC0EPxIfNV0uUXhjGCBjRnJ95PdBZFSepRhXi48HzJsmPgR6p
         nThEDz1xjPUYPgGBuMacP2vLvP9wWncj/fCylCldeMQpyFCLJm5HWIrbkmRKu/suIXcT
         vIYjVTMiZs6FqypDWxZOFvWoZcnXdjd+tuFuhS6aQUTO3t/0WeH9ez7RD5TQj5BoePw9
         HzDH58XmVFP8bucXCVQ2dtV46btVIkJ2YXGk7aWvtGn8MUVFB/j0ggZVaoWoBhBKZ+LB
         gSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=M6n2l/EBcueNmX8f7XdGTcQ8vUUpCGLFuWYhReTcoKE=;
        b=ORvUTb0iT8dSn2XumLtCYiqz9sTCOiT5alyq/BLoMRG5kpy70SwqYJZKU22WpVaMNH
         bYiMbxumjErRJm4irWdtV04CYOHsjQgOsA/jkFfJHYXMtRM3N0d4HamYM0AfvNzQ5Ar7
         Is8+AMY4Z80XAZY8cz13j+nHSNi/S+feJSubp7PA7PZ1ylUENpEr6y+t84FG5dBfFFcn
         JxJdZRzaqIcRwfScFvWrnJSsg8kjPSgLX5DK7S+4r1EsobjoAXUgUJv5RizNdrzxQy78
         gafZ8REI7yoV6bsa9Ij2EaCN0u5rDSqmDEOXxfwQYGP313xMXiFVInIR6ZPifptMK4nv
         E05w==
X-Gm-Message-State: APjAAAWd5D9Z6XJQAyZfrH4y0ghYje/bcHfupD8LhXs0lLHWO3OjV5sI
        5gsozUPvx30uohQMXnW2LCs=
X-Google-Smtp-Source: APXvYqyrVRyyR4w53XWdXd/Ds8WXmJXF4JV6lta6C9GpnzvDF7NujpVpoOacgf9V4KFroqTFA7Q4PA==
X-Received: by 2002:a2e:8804:: with SMTP id x4mr277866ljh.2.1575315224026;
        Mon, 02 Dec 2019 11:33:44 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:43 -0800 (PST)
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
Subject: [PATCH v1 21/26] drm/panel: sharp-lq101r1sx01: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:25 +0100
Message-Id: <20191202193230.21310-22-sam@ravnborg.org>
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
 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   | 21 +++++++------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 17d406f49c3d..b5d1977221a7 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2014 NVIDIA Corporation
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -23,7 +22,6 @@ struct sharp_panel {
 	struct mipi_dsi_device *link1;
 	struct mipi_dsi_device *link2;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 
 	bool prepared;
@@ -94,8 +92,6 @@ static int sharp_panel_disable(struct drm_panel *panel)
 	if (!sharp->enabled)
 		return 0;
 
-	backlight_disable(sharp->backlight);
-
 	sharp->enabled = false;
 
 	return 0;
@@ -258,8 +254,6 @@ static int sharp_panel_enable(struct drm_panel *panel)
 	if (sharp->enabled)
 		return 0;
 
-	backlight_enable(sharp->backlight);
-
 	sharp->enabled = true;
 
 	return 0;
@@ -317,7 +311,7 @@ MODULE_DEVICE_TABLE(of, sharp_of_match);
 
 static int sharp_panel_add(struct sharp_panel *sharp)
 {
-	struct device *dev = &sharp->link1->dev;
+	int ret;
 
 	sharp->mode = &default_mode;
 
@@ -325,14 +319,13 @@ static int sharp_panel_add(struct sharp_panel *sharp)
 	if (IS_ERR(sharp->supply))
 		return PTR_ERR(sharp->supply);
 
-	sharp->backlight = devm_of_find_backlight(dev);
-
-	if (IS_ERR(sharp->backlight))
-		return PTR_ERR(sharp->backlight);
-
 	drm_panel_init(&sharp->base, &sharp->link1->dev, &sharp_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	ret = drm_panel_of_backlight(&sharp->base);
+	if (ret)
+		return ret;
+
 	return drm_panel_add(&sharp->base);
 }
 
@@ -408,7 +401,7 @@ static int sharp_panel_remove(struct mipi_dsi_device *dsi)
 		return 0;
 	}
 
-	err = sharp_panel_disable(&sharp->base);
+	err = drm_panel_disable(&sharp->base);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
 
@@ -429,7 +422,7 @@ static void sharp_panel_shutdown(struct mipi_dsi_device *dsi)
 	if (!sharp)
 		return;
 
-	sharp_panel_disable(&sharp->base);
+	drm_panel_disable(&sharp->base);
 }
 
 static struct mipi_dsi_driver sharp_panel_driver = {
-- 
2.20.1

