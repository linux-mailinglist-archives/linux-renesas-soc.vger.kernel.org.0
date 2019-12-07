Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98601115C8A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfLGOE3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:29 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39515 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfLGOE2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:28 -0500
Received: by mail-lj1-f196.google.com with SMTP id e10so10696953ljj.6;
        Sat, 07 Dec 2019 06:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=63FAYeXHOLWZvE39+BvFTQvx8rk1mNWwTMgVp4w9KIs=;
        b=HqZQqzcXLz6qqDnZBbtAncz09h4HHdF2Rkf9L00gHYZQMGeLF4pATtZsOyBRySDv3s
         Bl3agh2QBKbOWCqCed3xKaiQ1hIYC4wfRE3lkCWQUbcCp2hc82VNbjrgwBfWtPlyOUUj
         TJPJwwUs5scJ4AZ3yh3dgLIhOcFzhQCvGwbnLzxnHt909E9Zlma812SMN43OXAbuKxhA
         TH6UiuR0tJW2YyO2/ggmZGxM7VQ+KvuhI20nEw/+PuNfy6SuD4QeOEzWmGd6pbg/zb+1
         IKovefo+w7fUJoUZPp71KIiPRelS6vNLmT9JDbi+oRq5TSvBn3wWF86rEoCCs2oWMu1x
         V6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=63FAYeXHOLWZvE39+BvFTQvx8rk1mNWwTMgVp4w9KIs=;
        b=JvJRMPjWK2HmoI98XNDr47hctZ8Z3llxdMDZ+SHlUqZpqKGPndb6j5FImOntS4cFV9
         3GCxwn3OTLnTZKkat/elRfK3ERSitCW47k+eeXilslZOEaKcLLmsijXJ2aEaxKf30u6H
         rMoCzx2l6niGP1GtbOqmkVh9PVProjT5S+8jZEVDffaL+AcnV1aJS08yYgwqHXbgmfV4
         UFaYSF3L1q4MatwhnwkPbGfy4bNygQ5fVglViZRGGHtS0HOCTxZV9dhQ214ZPaUrrqWh
         w5IT/XuI2IM4ZaZICwGPD1xktc2FnUtG2vQ0FGBZy7asssJhvC7yFbh/T1BAtobX1Yfn
         TdeQ==
X-Gm-Message-State: APjAAAXl6aSoNd87hhvR5dwqO7rqHI+s7EQZS/WSLzU8Bv8EoZuy0IOI
        1Jv9XFT4KAqlE4G6JKGCVMg=
X-Google-Smtp-Source: APXvYqwCXvyDmoKVIc4zlBB2XBU0M9Y6CN9iEAOB/MhVUE9gB+QmdDrvfL6CdFab3+wa1LcGnDUevg==
X-Received: by 2002:a2e:548:: with SMTP id 69mr11532790ljf.67.1575727466338;
        Sat, 07 Dec 2019 06:04:26 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:25 -0800 (PST)
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
Subject: [PATCH v2 09/25] drm/panel: ilitek-ili9881c: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:37 +0100
Message-Id: <20191207140353.23967-10-sam@ravnborg.org>
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
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 31e5a4e67750..f54077c216a3 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2017-2018, Bootlin
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -25,7 +24,6 @@ struct ili9881c {
 	struct drm_panel	panel;
 	struct mipi_dsi_device	*dsi;
 
-	struct backlight_device *backlight;
 	struct regulator	*power;
 	struct gpio_desc	*reset;
 };
@@ -348,7 +346,6 @@ static int ili9881c_enable(struct drm_panel *panel)
 	msleep(120);
 
 	mipi_dsi_dcs_set_display_on(ctx->dsi);
-	backlight_enable(ctx->backlight);
 
 	return 0;
 }
@@ -357,7 +354,6 @@ static int ili9881c_disable(struct drm_panel *panel)
 {
 	struct ili9881c *ctx = panel_to_ili9881c(panel);
 
-	backlight_disable(ctx->backlight);
 	return mipi_dsi_dcs_set_display_off(ctx->dsi);
 }
 
@@ -423,7 +419,6 @@ static const struct drm_panel_funcs ili9881c_funcs = {
 
 static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 {
-	struct device_node *np;
 	struct ili9881c *ctx;
 	int ret;
 
@@ -448,14 +443,9 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(ctx->reset);
 	}
 
-	np = of_parse_phandle(dsi->dev.of_node, "backlight", 0);
-	if (np) {
-		ctx->backlight = of_find_backlight_by_node(np);
-		of_node_put(np);
-
-		if (!ctx->backlight)
-			return -EPROBE_DEFER;
-	}
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
 
 	ret = drm_panel_add(&ctx->panel);
 	if (ret < 0)
@@ -475,9 +465,6 @@ static int ili9881c_dsi_remove(struct mipi_dsi_device *dsi)
 	mipi_dsi_detach(dsi);
 	drm_panel_remove(&ctx->panel);
 
-	if (ctx->backlight)
-		put_device(&ctx->backlight->dev);
-
 	return 0;
 }
 
-- 
2.20.1

