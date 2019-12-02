Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F95610F044
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbfLBTdi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:38 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44163 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbfLBTdi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:38 -0500
Received: by mail-lj1-f195.google.com with SMTP id c19so784860lji.11;
        Mon, 02 Dec 2019 11:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1cwcVlQTSPEpvvTt7npXTAeRNecjJ4sL2WdE6IowvJo=;
        b=imCcVCQmdfVtejivHQ8KZ3aZd/wGiv7mSMxF8P61gBPk8JEEOnM5aBUs/RUQ/BM+Zs
         TZU5zBsnpML9NGpyS7AV6m4mryUxW3RdK/e9BhFtQolln8KI2MFdjwbNCEHgFDffbSEQ
         UjyRVShfamjiTe1VMJKsraIoBmzT5zYXchzx/cMKm+RKSDDy/7yuBZZmlKPnr9kFFV1s
         uhFD7Vjj5Rl80xoiyiU2KTIZs2jPm1h+3WusBF3g6jrXO/BIEGD2xe79Kr21fOZ0Hk+N
         4cjdXLPmyBe9NWlJkOp0RvKlxnnEK+fOQ4pI38kQ0QEBBpF8I+Y4f2FVFn3Euq+UYigc
         0brA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=1cwcVlQTSPEpvvTt7npXTAeRNecjJ4sL2WdE6IowvJo=;
        b=qtCm9ITbJrISdpxePptng702N9FLMbQE2q57asKKRBeCvcqnMEfXpW11+fFSTOofzK
         ktFwirpl0WjMW/05FqZAjpsshMz6AJHf7B6Wt2n3yhK1wVzWiOWKCQrM+ugXEGRkKqGr
         arMCyplelJIVXcU3QBTBe48TzXoqOEmY/f6qi30h1n5OYbrG84KWt0Rev0an1dTk8SHu
         /XWBYfSTW2Eq9Nx7KqixxK5PvmzOdTpO60ceJc3wTp8V218dxPY19F6C9RUy32+Z/aXb
         +Pb3Mg1pLdSoLxkVTuZLyywJZSxuYZVJYvKb/oHnPK9coMFArP++Fp3x6tSJIDt3RnTr
         ZLGg==
X-Gm-Message-State: APjAAAWEDyYVt0Y2i14NNyn8jFXePVcLemZbK+JYeIY0X80w7ZdCciWu
        ojzATypY9/YPpjTDSkQ+O4o=
X-Google-Smtp-Source: APXvYqxuD4DYzYut6ry4UElFe4ZjLh8rR23KZMh/GwY0agg4mlfI8UchY6oM0rWOK2lXFt8pu36fCg==
X-Received: by 2002:a2e:999a:: with SMTP id w26mr287454lji.142.1575315215038;
        Mon, 02 Dec 2019 11:33:35 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:34 -0800 (PST)
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
Subject: [PATCH v1 16/26] drm/panel: panasonic-vvx10f034n00: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:20 +0100
Message-Id: <20191202193230.21310-17-sam@ravnborg.org>
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
 .../drm/panel/panel-panasonic-vvx10f034n00.c  | 45 +++----------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 579ac0d86ea4..4e15bff5a1b5 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -7,7 +7,6 @@
  * Based on AUO panel driver by Rob Clark <robdclark@gmail.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -31,7 +30,6 @@ struct wuxga_nt_panel {
 	struct drm_panel base;
 	struct mipi_dsi_device *dsi;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 
 	bool prepared;
@@ -62,12 +60,6 @@ static int wuxga_nt_panel_disable(struct drm_panel *panel)
 
 	mipi_ret = mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
 
-	if (wuxga_nt->backlight) {
-		wuxga_nt->backlight->props.power = FB_BLANK_POWERDOWN;
-		wuxga_nt->backlight->props.state |= BL_CORE_FBBLANK;
-		bl_ret = backlight_update_status(wuxga_nt->backlight);
-	}
-
 	wuxga_nt->enabled = false;
 
 	return mipi_ret ? mipi_ret : bl_ret;
@@ -142,12 +134,6 @@ static int wuxga_nt_panel_enable(struct drm_panel *panel)
 	if (wuxga_nt->enabled)
 		return 0;
 
-	if (wuxga_nt->backlight) {
-		wuxga_nt->backlight->props.power = FB_BLANK_UNBLANK;
-		wuxga_nt->backlight->props.state &= ~BL_CORE_FBBLANK;
-		backlight_update_status(wuxga_nt->backlight);
-	}
-
 	wuxga_nt->enabled = true;
 
 	return 0;
@@ -206,7 +192,6 @@ MODULE_DEVICE_TABLE(of, wuxga_nt_of_match);
 static int wuxga_nt_panel_add(struct wuxga_nt_panel *wuxga_nt)
 {
 	struct device *dev = &wuxga_nt->dsi->dev;
-	struct device_node *np;
 	int ret;
 
 	wuxga_nt->mode = &default_mode;
@@ -215,38 +200,20 @@ static int wuxga_nt_panel_add(struct wuxga_nt_panel *wuxga_nt)
 	if (IS_ERR(wuxga_nt->supply))
 		return PTR_ERR(wuxga_nt->supply);
 
-	np = of_parse_phandle(dev->of_node, "backlight", 0);
-	if (np) {
-		wuxga_nt->backlight = of_find_backlight_by_node(np);
-		of_node_put(np);
-
-		if (!wuxga_nt->backlight)
-			return -EPROBE_DEFER;
-	}
-
 	drm_panel_init(&wuxga_nt->base, &wuxga_nt->dsi->dev,
 		       &wuxga_nt_panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
-	ret = drm_panel_add(&wuxga_nt->base);
-	if (ret < 0)
-		goto put_backlight;
-
-	return 0;
-
-put_backlight:
-	if (wuxga_nt->backlight)
-		put_device(&wuxga_nt->backlight->dev);
+	ret = drm_panel_of_backlight(&wuxga_nt->base);
+	if (ret)
+		return ret;
 
-	return ret;
+	return drm_panel_add(&wuxga_nt->base);
 }
 
 static void wuxga_nt_panel_del(struct wuxga_nt_panel *wuxga_nt)
 {
 	if (wuxga_nt->base.dev)
 		drm_panel_remove(&wuxga_nt->base);
-
-	if (wuxga_nt->backlight)
-		put_device(&wuxga_nt->backlight->dev);
 }
 
 static int wuxga_nt_panel_probe(struct mipi_dsi_device *dsi)
@@ -281,7 +248,7 @@ static int wuxga_nt_panel_remove(struct mipi_dsi_device *dsi)
 	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = wuxga_nt_panel_disable(&wuxga_nt->base);
+	ret = drm_panel_disable(&wuxga_nt->base);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
 
@@ -298,7 +265,7 @@ static void wuxga_nt_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
 
-	wuxga_nt_panel_disable(&wuxga_nt->base);
+	drm_panel_disable(&wuxga_nt->base);
 }
 
 static struct mipi_dsi_driver wuxga_nt_panel_driver = {
-- 
2.20.1

