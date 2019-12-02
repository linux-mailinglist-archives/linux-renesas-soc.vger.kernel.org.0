Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE25F10F051
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbfLBTdm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:42 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38318 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbfLBTdm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:42 -0500
Received: by mail-lf1-f66.google.com with SMTP id r14so787188lfm.5;
        Mon, 02 Dec 2019 11:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RAsbC5cqN6MKFPQ6PG5e5K6xQzBWVJ78zoRaemBgaGg=;
        b=TXUTqMevG+NnSg2VBH8v+6DuQCnq6JRVAalnYOEupDPG7sgQ4MOBs0GxgbTost/kN2
         5W4yzzNwg+Y3BitXq2T9jpEpfJHIptbCJeIjvnco+zlT2eefFw4RBaEB+ibA+F8H7ymY
         AkNZCpxsiTQfe0XRmefXBvT82/3Wnq/R7+W+Dc195BoXoXm3NxY3jx6fhADMTjgo2ZDN
         4Onzbk+H6sTnkhdgzv7O4OOSO/csJHyyJn6Mz73f1WDRE/lYGlRqBp+jCTYqz4XJtUlD
         WhN2e+8+09qJ90X8cql4g9vMVXvF8HZXhmAp7SXQ2gvtV5c75/VwyBQyjSXFwqleuXbC
         mLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=RAsbC5cqN6MKFPQ6PG5e5K6xQzBWVJ78zoRaemBgaGg=;
        b=af6vOl3EN/q8VmCjcKoajb2HLrCuB8qWUIWFPgfq1kGqqfCg+n4OfofVpK/zJJocnV
         5HechkXzOWmkg6VHT8u0tNyOBC+/dbGcYUywT3MWs2T4Q2ItZtw2y/x40lOW2gIuEy2L
         XihA/Wm9QAZAGt5Ka33ZbGsILbxi4PolU3GhhOgpIBB/k+k23DoQMZOAuWG0d1p0Yy9t
         SLkeb4eqQ4r1geQsbvjT9lC0MdUbffUJGyTLe9RBu3fCEc7xWCy51Mw8fnIrsYyvg5RW
         1QmvzJobEJxIX9OaIBZNfo5Gsh/m2rDWOarp8be+eId/ms7/vaLZYakQ4qkDr7EcTS+U
         H94Q==
X-Gm-Message-State: APjAAAV2JnZgHCThITAU9+YQ+Q1fIuWQ6wxNKm9nn+US1zV2Wgn4ASMo
        v0NZ4fWdGWluo6G+/yb469o=
X-Google-Smtp-Source: APXvYqxgC0o7yY6+/wa5jNY1ByPzl8EwYMqBcVDLKKwFraG7QLXiwa/WDguruEd1xtBPdhlcSdCT9w==
X-Received: by 2002:ac2:4946:: with SMTP id o6mr432258lfi.170.1575315220244;
        Mon, 02 Dec 2019 11:33:40 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:39 -0800 (PST)
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
Subject: [PATCH v1 19/26] drm/panel: ronbo-rb070d30: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:23 +0100
Message-Id: <20191202193230.21310-20-sam@ravnborg.org>
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
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index 746a3a221100..ef18559e237e 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -7,7 +7,6 @@
  * This file based on panel-ilitek-ili9881c.c
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -29,7 +28,6 @@
 struct rb070d30_panel {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi;
-	struct backlight_device *backlight;
 	struct regulator *supply;
 
 	struct {
@@ -84,22 +82,13 @@ static int rb070d30_panel_enable(struct drm_panel *panel)
 	if (ret)
 		return ret;
 
-	ret = backlight_enable(ctx->backlight);
-	if (ret)
-		goto out;
-
 	return 0;
-
-out:
-	mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
-	return ret;
 }
 
 static int rb070d30_panel_disable(struct drm_panel *panel)
 {
 	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
 
-	backlight_disable(ctx->backlight);
 	return mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
 }
 
@@ -208,11 +197,9 @@ static int rb070d30_panel_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(ctx->gpios.shlr);
 	}
 
-	ctx->backlight = devm_of_find_backlight(&dsi->dev);
-	if (IS_ERR(ctx->backlight)) {
-		DRM_DEV_ERROR(&dsi->dev, "Couldn't get our backlight\n");
-		return PTR_ERR(ctx->backlight);
-	}
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
 
 	ret = drm_panel_add(&ctx->panel);
 	if (ret < 0)
-- 
2.20.1

