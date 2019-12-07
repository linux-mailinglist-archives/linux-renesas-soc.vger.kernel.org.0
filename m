Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6987C115CAB
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfLGOEp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:45 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41261 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfLGOEo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:44 -0500
Received: by mail-lj1-f195.google.com with SMTP id h23so10694758ljc.8;
        Sat, 07 Dec 2019 06:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FyzdtrGlFpa66vBX6d0CokXkZKTeTI49fgevppwlQZg=;
        b=OxXSoMt5KqlihAHzAB1tJW/fsjhsEVaVIHQaxDsigHnPvpF+WpEYROGZBvnoIyXDMc
         iTKm69RRPHv7BTKCbm9ObKOcHrT32z/UPlc/Glf9bUIo528EwwWmQZx7GAt+6Jsb10Om
         fcHNr+GJBKvKi5S1pnU9KrJ02ERnGk7w1kOORaWMN1Pt+X1ZEfJpsICzjXkuyzSIz8pZ
         NpVBk28gMihwGzY1CDV9Y0LcT2EqA6Iu9DV3egrmbtWVtlPTTyxQw05se5aFkzoao3yl
         Crfxl/Rn3rB20oEjkeD7xmWORzd3XpiPpJBrpwgakGE9FpVGwYL10TAsQFhHJysyftoA
         +tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=FyzdtrGlFpa66vBX6d0CokXkZKTeTI49fgevppwlQZg=;
        b=jLfFcHQjvU6d4of9ExdbkNfe0FxxSNtvfUlLUL2nbncIQU9DVGG0S/RaHkTGoTg8/e
         QdeXzADcsFY3GcS5Ogf0PkxaYMMvMMdaycUpEF6WggCUFoi/+e1RmO0e+oJupLnofhgJ
         nqZvV7fDL14OohnaOGhOK9wtTu/j1u8b48SiplNkqJebrTOf0Bit8CgJfer1mnkneoeE
         Uc5hOgJQfZQblctebR/NOL6BAfhFhW/KcukOjrhLDhmNNbj3wH1AQzn+W1gQ1Sd4eoAc
         S2LVpRNS/lcepf4OG689Eb/f7H3Agl6afYuVYe7TRWLaJL6IdRiUJ8iDRhsYSbFw0uAC
         r1xw==
X-Gm-Message-State: APjAAAXDywCdBIgtkoJllfyUl4i8p9twjc0y72VmGqn3czR7biFnIC6m
        NfjBvlxvDfbcGBsROctO0rE=
X-Google-Smtp-Source: APXvYqzmbqgsvM4MYLG+23AC8GtnbZ5+HS2M1nUpn3JGh1VQ6K7SA75id3AxcVjTkWFzhcRKBys3yw==
X-Received: by 2002:a2e:9194:: with SMTP id f20mr11614068ljg.154.1575727482524;
        Sat, 07 Dec 2019 06:04:42 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:42 -0800 (PST)
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
Subject: [PATCH v2 18/25] drm/panel: ronbo-rb070d30: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:46 +0100
Message-Id: <20191207140353.23967-19-sam@ravnborg.org>
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

