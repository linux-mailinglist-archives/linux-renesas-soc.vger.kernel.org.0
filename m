Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 930CD10F058
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728174AbfLBTdp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:45 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46761 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728154AbfLBTdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:45 -0500
Received: by mail-lf1-f65.google.com with SMTP id a17so739829lfi.13;
        Mon, 02 Dec 2019 11:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+FHuLNwTdHR6blgVNr/owkQfKdgYFCUT0XTY+HsYKBg=;
        b=jAXzCXL9OdEFsuNU1Rs/H2FYtD6pIirQWfm5U6evmlkFIskQuthJt9AUIdScaihjmF
         52FsG/8XdjrE41j+He/A6yyC4jP5mmYdG1kZ3G0ZpJVzEHwZBztYfRt+kcQL2kUFvh/L
         yW9AezRVYJMkZnaGMdTL3Q+YhbEZoA/RoEjQTerZESKzRJxS03HIJ86GOmWGZdCBzUSS
         HnP3Mu25UOP/ytQcsx+HDzNsMONGSLUwbpSZNLe1q8ni4NI8jZwpxIZdbWOnX8+nOUiY
         2wlEgN8ddWA+US468fwzh7tyFb1t3BA0PgXvb1U/3gWy/qnyLg82pgFzUE6eqnZk0Tcq
         RD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=+FHuLNwTdHR6blgVNr/owkQfKdgYFCUT0XTY+HsYKBg=;
        b=MFOSGYxq/EAtBRuzg6cYcEnUElck2Y8pumRydPQ3QLgE04Pln0gmsthgW5RKDM79tp
         bElxoF22v4ZNMMlqmVkwdGmZ0XxIZr81g+77T7lKVH8G8JzeES2ac2CDPHUXTjvqQQKh
         F9EFawOFstT4HL24dizDNRQprUUjKXGXA73a9G5qrE3OdAu2Nx6FRooTZFQXzQymszHl
         WiCIO+SEvWVTiKvFY9jloDXG7dnPMiSsFc1DuxBaXjJoBSOJCOXA+XNC6kjFeiFo0uwm
         05KuM9ONE8uhh3/uV6nINp0HABQKORtgocHMLo7hvOGeXsU+jK0bGzL13SROAXciOZoa
         Eoeg==
X-Gm-Message-State: APjAAAU4SunCJTV1BZCcjkji0ajJerYPHzLDIHRzb+VJc1vUrSiYtYsc
        K6UWyOpLfRgPFhFPt3syY1Q=
X-Google-Smtp-Source: APXvYqzGlpVDHTn2zIkxekoAh78y1wVNAMIONaXD45gxrFXPhUl9H7ermaRGNE/MDT+fhbkWwEN1Ww==
X-Received: by 2002:a19:2213:: with SMTP id i19mr408485lfi.83.1575315222087;
        Mon, 02 Dec 2019 11:33:42 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:41 -0800 (PST)
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
Subject: [PATCH v1 20/26] drm/panel: seiko-43wvf1g: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:24 +0100
Message-Id: <20191202193230.21310-21-sam@ravnborg.org>
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
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 36 ++++-----------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 4b345a242b3f..e7e00b23c975 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -6,7 +6,6 @@
  * Based on Panel Simple driver by Thierry Reding <treding@nvidia.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -46,7 +45,6 @@ struct seiko_panel {
 	bool prepared;
 	bool enabled;
 	const struct seiko_panel_desc *desc;
-	struct backlight_device *backlight;
 	struct regulator *dvdd;
 	struct regulator *avdd;
 };
@@ -127,12 +125,6 @@ static int seiko_panel_disable(struct drm_panel *panel)
 	if (!p->enabled)
 		return 0;
 
-	if (p->backlight) {
-		p->backlight->props.power = FB_BLANK_POWERDOWN;
-		p->backlight->props.state |= BL_CORE_FBBLANK;
-		backlight_update_status(p->backlight);
-	}
-
 	p->enabled = false;
 
 	return 0;
@@ -196,12 +188,6 @@ static int seiko_panel_enable(struct drm_panel *panel)
 	if (p->enabled)
 		return 0;
 
-	if (p->backlight) {
-		p->backlight->props.state &= ~BL_CORE_FBBLANK;
-		p->backlight->props.power = FB_BLANK_UNBLANK;
-		backlight_update_status(p->backlight);
-	}
-
 	p->enabled = true;
 
 	return 0;
@@ -227,7 +213,6 @@ static const struct drm_panel_funcs seiko_panel_funcs = {
 static int seiko_panel_probe(struct device *dev,
 					const struct seiko_panel_desc *desc)
 {
-	struct device_node *backlight;
 	struct seiko_panel *panel;
 	int err;
 
@@ -247,18 +232,13 @@ static int seiko_panel_probe(struct device *dev,
 	if (IS_ERR(panel->avdd))
 		return PTR_ERR(panel->avdd);
 
-	backlight = of_parse_phandle(dev->of_node, "backlight", 0);
-	if (backlight) {
-		panel->backlight = of_find_backlight_by_node(backlight);
-		of_node_put(backlight);
-
-		if (!panel->backlight)
-			return -EPROBE_DEFER;
-	}
-
 	drm_panel_init(&panel->base, dev, &seiko_panel_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
 
+	err = drm_panel_of_backlight(&panel->base);
+	if (err)
+		return err;
+
 	err = drm_panel_add(&panel->base);
 	if (err < 0)
 		return err;
@@ -273,11 +253,7 @@ static int seiko_panel_remove(struct platform_device *pdev)
 	struct seiko_panel *panel = dev_get_drvdata(&pdev->dev);
 
 	drm_panel_remove(&panel->base);
-
-	seiko_panel_disable(&panel->base);
-
-	if (panel->backlight)
-		put_device(&panel->backlight->dev);
+	drm_panel_disable(&panel->base);
 
 	return 0;
 }
@@ -286,7 +262,7 @@ static void seiko_panel_shutdown(struct platform_device *pdev)
 {
 	struct seiko_panel *panel = dev_get_drvdata(&pdev->dev);
 
-	seiko_panel_disable(&panel->base);
+	drm_panel_disable(&panel->base);
 }
 
 static const struct display_timing seiko_43wvf1g_timing = {
-- 
2.20.1

