Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F37AB10F042
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbfLBTdg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:36 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37534 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbfLBTdg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:36 -0500
Received: by mail-lf1-f66.google.com with SMTP id b15so791330lfc.4;
        Mon, 02 Dec 2019 11:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mwTbXFs73rhfB3XHykRb+0twTubxbVTCKbes8vP1eoM=;
        b=fWsZc6pxE2cR74tH1x5bcK85tMs5P3XVQy6wY8Dzsei7SXL9iuN8fSp5lSWf7pMIdC
         xa4gKaBfW9GQl0tsJcMEulN2LTZ1dFp27MuO1x3ucEfaXHh9k03NMnT8pnU6IY5gCxpY
         8kA6ToWIuyco+mlNtxdfOniENQxwNYP7VK8XAJSeokDRcbVtY0rN/Vsyg4bJBVWLT3gI
         W4lYkw+KLbAeuKXj6iVyrITCefWtK7oUSk1KodcyX+U7pkfYxsD190Gy9r+bVtOrtIq+
         AHb1cVc40/4a1zUiR1PFruWHBNmyVb28/b76FXir/cJ/Zsd30ak1i5gzL2R8sNvMdh7l
         S3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=mwTbXFs73rhfB3XHykRb+0twTubxbVTCKbes8vP1eoM=;
        b=hSm8O4UhIQ6EFLSjXT13EZBgj1WNjZdtRsWA5g49xK6gI3BN2jIhti40Og03j2Ctcg
         aYkFKcz2UY2W/czChQ/F1aPvYfKEsMjlB9v6Ltq+vEcw9iKeQf16XwVJW1iGbcBwELtA
         fOPR3TjYw+P/e/ZN0fRNE0MkWLZTEcFN9/HpUjw5IpBcPYYKnNaq4sWjw194vVUt+Z9A
         qERrlS90BFm/UGCvX0kqH+U4vWQE1jDmHIJwr6gYNfpcItVEdkhuTiffiunVy4c79loQ
         YX4s5RbZ4RbjoDNdc/7kA0RDm8LLis0OSpGIDT3/pmAG8QULdcj5k1FK9uLdWFGkeZTo
         iaIw==
X-Gm-Message-State: APjAAAVjnh2H1NYNhZVl5ycWxj7Mg4R0c/4kWmp1T6eSmAL0XIHvJoMe
        DZJIPBeoVZN+Hmoi4OsbWIA=
X-Google-Smtp-Source: APXvYqxzH31f+2bGhDcEEDLD8E4lagqqgmHLv3NkKQxX8k5tVEOx+63XjFDyGaJYh0xM4o22P4hcLw==
X-Received: by 2002:ac2:5a1a:: with SMTP id q26mr431452lfn.33.1575315213309;
        Mon, 02 Dec 2019 11:33:33 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:32 -0800 (PST)
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
Subject: [PATCH v1 15/26] drm/panel: osd-osd101t2587-53ts: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:19 +0100
Message-Id: <20191202193230.21310-16-sam@ravnborg.org>
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

