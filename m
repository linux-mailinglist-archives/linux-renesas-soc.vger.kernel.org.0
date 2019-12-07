Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02754115C9C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfLGOEi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:38 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35273 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfLGOEi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:38 -0500
Received: by mail-lj1-f193.google.com with SMTP id j6so10737423lja.2;
        Sat, 07 Dec 2019 06:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QgFTzPZd3zR98m50NY0shuKpKVuv4VS4hyjW7Qv2Omk=;
        b=jrIBA/vqZodxViATSQARFkZD7wiEmAHsUlNjZymh8plju65SezxDVb232LWzAO7ZIW
         kFmv4T1O4tF5vglDYs7mo4WPhnmXCBga6BPzrqpFEBPGLxUnHCEBoSwvhJwtj7oRuhlS
         6rwymBSXbUJPHSE7F/TU8cIy0yfuhOGxq2EqTEjr+GR83yUN1lmmKWt05j/V1aizGnHO
         wgK6mWeVCzmN88mPT83aIwPcsTK3vHQyFbEpBjVUFt4zCSV0mYD0xYZ3Pshw39dUtj4c
         43kY3UcyVgHIbBrvs4Oc2i2daiu7MlFv1k5I9puW67OdIwCy5GI7bOhctWxExoJ6EIrm
         kodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=QgFTzPZd3zR98m50NY0shuKpKVuv4VS4hyjW7Qv2Omk=;
        b=Eh/BG4TXa8OMaKHFAuJedlIuPxEHUUtnEiFPpOXQ3J0qFZWtKiwNDvNQU+MA5mg/3f
         W2/Sz9FybzBuIBpk/hBuLeVHnm0bpULdA5I5aSTGKC/wkCD8i3N0BHP3ZtX9ItgUjESq
         8melf2ak4HI6+vOSrMncDYSZYvKOXv7WqfXzzFuPw90+EDigubLe2GUxhk940MMpRkam
         A55i+O/uXaHRYYnis/isSPZB5bZ6osuUQSjEeF+JHMBM9Y07W8C9cXcr37vRx4OdN/UN
         VEPJ3t+mmJZYVU+rL2mhexx7kZPcEBPF8po+ZjY2SkM7KygbnBM0nY6G0quu5U+3z/Q+
         8nrQ==
X-Gm-Message-State: APjAAAVZi/FMQB+eq+QQQleePrxC7S5+apRFaP+sMhUWuNvJebem+4av
        cj7v31P/oVUv2YemfJ3bZM0=
X-Google-Smtp-Source: APXvYqwqO/B3zDP/lU5w3BMKEFkPcSjN9evJVHeZCNcA2LQ9S+SRHMryllzKBI+PlPdvQ9Zo/y8d+Q==
X-Received: by 2002:a2e:9b58:: with SMTP id o24mr11509631ljj.197.1575727475273;
        Sat, 07 Dec 2019 06:04:35 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:34 -0800 (PST)
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
Subject: [PATCH v2 14/25] drm/panel: osd-osd101t2587-53ts: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:42 +0100
Message-Id: <20191207140353.23967-15-sam@ravnborg.org>
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
 .../drm/panel/panel-osd-osd101t2587-53ts.c    | 24 +++++++------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 2734b4835dfa..3a0229d60095 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -4,7 +4,6 @@
  *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
@@ -20,7 +19,6 @@ struct osd101t2587_panel {
 	struct drm_panel base;
 	struct mipi_dsi_device *dsi;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 
 	bool prepared;
@@ -42,8 +40,6 @@ static int osd101t2587_panel_disable(struct drm_panel *panel)
 	if (!osd101t2587->enabled)
 		return 0;
 
-	backlight_disable(osd101t2587->backlight);
-
 	ret = mipi_dsi_shutdown_peripheral(osd101t2587->dsi);
 
 	osd101t2587->enabled = false;
@@ -91,8 +87,6 @@ static int osd101t2587_panel_enable(struct drm_panel *panel)
 	if (ret)
 		return ret;
 
-	backlight_enable(osd101t2587->backlight);
-
 	osd101t2587->enabled = true;
 
 	return ret;
@@ -158,18 +152,19 @@ MODULE_DEVICE_TABLE(of, osd101t2587_of_match);
 static int osd101t2587_panel_add(struct osd101t2587_panel *osd101t2587)
 {
 	struct device *dev = &osd101t2587->dsi->dev;
+	int ret;
 
 	osd101t2587->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(osd101t2587->supply))
 		return PTR_ERR(osd101t2587->supply);
 
-	osd101t2587->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(osd101t2587->backlight))
-		return PTR_ERR(osd101t2587->backlight);
-
 	drm_panel_init(&osd101t2587->base, &osd101t2587->dsi->dev,
 		       &osd101t2587_panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
+	ret = drm_panel_of_backlight(&osd101t2587->base);
+	if (ret)
+		return ret;
+
 	return drm_panel_add(&osd101t2587->base);
 }
 
@@ -215,12 +210,11 @@ static int osd101t2587_panel_remove(struct mipi_dsi_device *dsi)
 	struct osd101t2587_panel *osd101t2587 = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = osd101t2587_panel_disable(&osd101t2587->base);
+	ret = drm_panel_disable(&osd101t2587->base);
 	if (ret < 0)
 		dev_warn(&dsi->dev, "failed to disable panel: %d\n", ret);
 
-	osd101t2587_panel_unprepare(&osd101t2587->base);
-
+	drm_panel_unprepare(&osd101t2587->base);
 	drm_panel_remove(&osd101t2587->base);
 
 	ret = mipi_dsi_detach(dsi);
@@ -234,8 +228,8 @@ static void osd101t2587_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct osd101t2587_panel *osd101t2587 = mipi_dsi_get_drvdata(dsi);
 
-	osd101t2587_panel_disable(&osd101t2587->base);
-	osd101t2587_panel_unprepare(&osd101t2587->base);
+	drm_panel_disable(&osd101t2587->base);
+	drm_panel_unprepare(&osd101t2587->base);
 }
 
 static struct mipi_dsi_driver osd101t2587_panel_driver = {
-- 
2.20.1

