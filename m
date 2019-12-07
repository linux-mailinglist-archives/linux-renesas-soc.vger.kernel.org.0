Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4216B115C73
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbfLGOEQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:16 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44926 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfLGOEQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:16 -0500
Received: by mail-lj1-f193.google.com with SMTP id c19so10647372lji.11;
        Sat, 07 Dec 2019 06:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5vCTCmVJSztZsLx2nB6Og8LCjqNM0f0O19o9JcKr1ls=;
        b=ONroKxMumL+T3hvdkZI9e/yngpNuwwNxZSNxYiSryJEsMLtAe08ansnBJYorWhKfZO
         hVxGTK2d5XzQTs8G3iaYWtW4eIP7t++joPvMvZ9rSfhLyN+JT1RLt4tHwxWfEyZyoH9j
         QXs8wv0edFhdDrvcFEx22LoEeo6VKaIKfwlNsuEuFVMvRLRADKza27bYBGswsFjyb1z2
         OlztirgxOS/7wTCauSPPhVgG9IzKDrijbHgtAk3sZzkcM0BKmxNUnTec0/Tntd9plCv7
         1r6rCHD4mCSj8KACmxzLunlleNO7X71r0qZBSW7VPzO+aElZICNRbynzkYzyzCsNrMO+
         EXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=5vCTCmVJSztZsLx2nB6Og8LCjqNM0f0O19o9JcKr1ls=;
        b=WajBP6Zj+2Fj+UygvUzDq8xaVabPAh8Qx2+xbVoJb90JYzlBwwBNhOVJvRyzk7WtfJ
         PKW1EnsXfhG22OzSz+yRGzWwRk7/geg/M8twoHEMejy5p/UpHDp1xeDTY9R8f3hb3Xfh
         45XWxxgQ4AI0pmAkyISb1dOpSge9OyliQui+CjR9RFI3GyXVN2rSS3g6WKGorqrb33BL
         QUPwBiEAi1LqcWeakU00vwDPTztaJPqikwgo2T2ro0PaCcFYU0XlRQooH12CL0hAeLWM
         wa3AWCm8OawiFXpRcImkhx/nqVrXa9YqNQf0EBquRmfBRjb6cmOat2B9SXiPB9oz/IWi
         xaLQ==
X-Gm-Message-State: APjAAAVsAuIgtkqUaoPByEkfglXmxgs2c5shcmbW8rxXMiEbILpT5RIt
        UNYlJSFEzU11IPNzVuVFB3M=
X-Google-Smtp-Source: APXvYqw1rMaDJY7zRGC5Q0+tQaHvY5zBV064KItUGg2cwityxaKTBr2l0hHLdZAMNVa/CibXuS1pdw==
X-Received: by 2002:a2e:9899:: with SMTP id b25mr11320230ljj.70.1575727453898;
        Sat, 07 Dec 2019 06:04:13 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:13 -0800 (PST)
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
Subject: [PATCH v2 03/25] drm/panel: simple: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:31 +0100
Message-Id: <20191207140353.23967-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use drm_panel infrastructure for backlight.
Replace direct calls with drm_panel_*() calls
to utilize the drm_panel support.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 50 ++++++----------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 72f69709f349..a5df6d6dd455 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -21,7 +21,6 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -105,7 +104,6 @@ struct panel_simple {
 
 	const struct panel_desc *desc;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 	struct i2c_adapter *ddc;
 
@@ -236,12 +234,6 @@ static int panel_simple_disable(struct drm_panel *panel)
 	if (!p->enabled)
 		return 0;
 
-	if (p->backlight) {
-		p->backlight->props.power = FB_BLANK_POWERDOWN;
-		p->backlight->props.state |= BL_CORE_FBBLANK;
-		backlight_update_status(p->backlight);
-	}
-
 	if (p->desc->delay.disable)
 		msleep(p->desc->delay.disable);
 
@@ -307,12 +299,6 @@ static int panel_simple_enable(struct drm_panel *panel)
 	if (p->desc->delay.enable)
 		msleep(p->desc->delay.enable);
 
-	if (p->backlight) {
-		p->backlight->props.state &= ~BL_CORE_FBBLANK;
-		p->backlight->props.power = FB_BLANK_UNBLANK;
-		backlight_update_status(p->backlight);
-	}
-
 	p->enabled = true;
 
 	return 0;
@@ -414,9 +400,9 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
 
 static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 {
-	struct device_node *backlight, *ddc;
 	struct panel_simple *panel;
 	struct display_timing dt;
+	struct device_node *ddc;
 	int err;
 
 	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
@@ -442,24 +428,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		return err;
 	}
 
-	backlight = of_parse_phandle(dev->of_node, "backlight", 0);
-	if (backlight) {
-		panel->backlight = of_find_backlight_by_node(backlight);
-		of_node_put(backlight);
-
-		if (!panel->backlight)
-			return -EPROBE_DEFER;
-	}
-
 	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
 	if (ddc) {
 		panel->ddc = of_find_i2c_adapter_by_node(ddc);
 		of_node_put(ddc);
 
-		if (!panel->ddc) {
-			err = -EPROBE_DEFER;
-			goto free_backlight;
-		}
+		if (!panel->ddc)
+			return -EPROBE_DEFER;
 	}
 
 	if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
@@ -468,6 +443,10 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
 		       desc->connector_type);
 
+	err = drm_panel_of_backlight(&panel->base);
+	if (err)
+		goto free_ddc;
+
 	err = drm_panel_add(&panel->base);
 	if (err < 0)
 		goto free_ddc;
@@ -479,9 +458,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 free_ddc:
 	if (panel->ddc)
 		put_device(&panel->ddc->dev);
-free_backlight:
-	if (panel->backlight)
-		put_device(&panel->backlight->dev);
 
 	return err;
 }
@@ -491,16 +467,12 @@ static int panel_simple_remove(struct device *dev)
 	struct panel_simple *panel = dev_get_drvdata(dev);
 
 	drm_panel_remove(&panel->base);
-
-	panel_simple_disable(&panel->base);
-	panel_simple_unprepare(&panel->base);
+	drm_panel_disable(&panel->base);
+	drm_panel_unprepare(&panel->base);
 
 	if (panel->ddc)
 		put_device(&panel->ddc->dev);
 
-	if (panel->backlight)
-		put_device(&panel->backlight->dev);
-
 	return 0;
 }
 
@@ -508,8 +480,8 @@ static void panel_simple_shutdown(struct device *dev)
 {
 	struct panel_simple *panel = dev_get_drvdata(dev);
 
-	panel_simple_disable(&panel->base);
-	panel_simple_unprepare(&panel->base);
+	drm_panel_disable(&panel->base);
+	drm_panel_unprepare(&panel->base);
 }
 
 static const struct drm_display_mode ampire_am_480272h3tmqw_t01h_mode = {
-- 
2.20.1

