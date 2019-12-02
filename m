Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E08110F04D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbfLBTdm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:42 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34158 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbfLBTdl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:41 -0500
Received: by mail-lj1-f195.google.com with SMTP id m6so869315ljc.1;
        Mon, 02 Dec 2019 11:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9l88xihpsr+Oq7AiOCDQfFuIMQfThGtVnWiYKe7NjT4=;
        b=NXrsvTVyKTVDN70+OK/7PF45HUHG5iMhS69DUkYT2xofsK/0mFMX5121dT/vftSM7R
         qpWNdC7qTqqXqAThmb+h5aQ9rm2oVx2VUbwhav5ehLUT6ffVSkzCmxdk4CfDL/Ex4G0W
         SodcXhFAjBSa16VNI+zM+1tj8zgBvTgKX4T3rTKedBUL8+Bsk3ogVw4MlixwlgKh4M8T
         Q02q2gq4vhycml3qIipLMtXIqfBm0UWXxBQzF6UdxFcxXL4UsH1fWSnPj+ZEP61vy2cu
         Wpp3fOUqsu8zeLeEcGbwxyDwq7ejHwvJ/M+G1AKiP/8ZbX/Gu9jjG75b0nywoWL8Pg5J
         dzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=9l88xihpsr+Oq7AiOCDQfFuIMQfThGtVnWiYKe7NjT4=;
        b=HX86nZa8ob7ibihDEhCr6Ipq1jtKcpnsvnZnUfc947cxzT9ex7DBwNQ44VGZ6VLe8+
         zZ6Fj6YkgB2mcThNbQjThf/WCoul16zBrArjCujIYDYDbgEYuj+mc5YoHpS6Uf1aMidu
         J4kPpTbq1I/IIgPonOdsiA0FQ+7Ez9wi49HNyWOE9UIkbzFtjwVM+R2AV7FxiwuWlEyG
         Edw602zQRDiwO9DukTKog3u30NWtJIdnBq1GZaRB2kLJExvgfPUEYX2736LTa4OirDDa
         YIje9eKB2OA2GwpcwLfvKs79NSs6Q1wDIGRmM6RDEXTJyO/LF+U53l8S7Kh7GnpuLbYp
         gB3w==
X-Gm-Message-State: APjAAAUuDQzyroqTNgBiBzRunSbkVEZPaF2lvLvNcRQlnjTny8nRbDpU
        Z7ImdsXFahLMfpma0n11eg8=
X-Google-Smtp-Source: APXvYqzS7SokA6A/WeeKZw1vsjDaKZ/zMqV2/WXPSZ5E+ZDr9kYmre74jF/nrnnSX3bYrjhN+JwTpg==
X-Received: by 2002:a2e:b5ae:: with SMTP id f14mr256760ljn.31.1575315218380;
        Mon, 02 Dec 2019 11:33:38 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:37 -0800 (PST)
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
        Sam Ravnborg <sam@ravnborg.org>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v1 18/26] drm/panel: rocktech-jh057n00900: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:22 +0100
Message-Id: <20191202193230.21310-19-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the backlight support in drm_panel to simplify the driver.
While touching the include files sort them
and divide them up in blocks.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "Guido Günther" <agx@sigxcpu.org>
Cc: Purism Kernel Team <kernel@puri.sm>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../drm/panel/panel-rocktech-jh057n00900.c    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
index 3a4f1c0fce86..38ff742bc120 100644
--- a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
+++ b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
@@ -5,20 +5,22 @@
  * Copyright (C) Purism SPC 2019
  */
 
-#include <drm/drm_mipi_dsi.h>
-#include <drm/drm_modes.h>
-#include <drm/drm_panel.h>
-#include <drm/drm_print.h>
-#include <linux/backlight.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/media-bus-format.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
+
 #include <video/display_timing.h>
 #include <video/mipi_display.h>
 
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
 #define DRV_NAME "panel-rocktech-jh057n00900"
 
 /* Manufacturer specific Commands send via DSI */
@@ -47,7 +49,6 @@ struct jh057n {
 	struct device *dev;
 	struct drm_panel panel;
 	struct gpio_desc *reset_gpio;
-	struct backlight_device *backlight;
 	struct regulator *vcc;
 	struct regulator *iovcc;
 	bool prepared;
@@ -152,7 +153,7 @@ static int jh057n_enable(struct drm_panel *panel)
 		return ret;
 	}
 
-	return backlight_enable(ctx->backlight);
+	return 0;
 }
 
 static int jh057n_disable(struct drm_panel *panel)
@@ -160,7 +161,6 @@ static int jh057n_disable(struct drm_panel *panel)
 	struct jh057n *ctx = panel_to_jh057n(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 
-	backlight_disable(ctx->backlight);
 	return mipi_dsi_dcs_set_display_off(dsi);
 }
 
@@ -321,10 +321,6 @@ static int jh057n_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
 		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 
-	ctx->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(ctx->backlight))
-		return PTR_ERR(ctx->backlight);
-
 	ctx->vcc = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(ctx->vcc)) {
 		ret = PTR_ERR(ctx->vcc);
@@ -347,6 +343,10 @@ static int jh057n_probe(struct mipi_dsi_device *dsi)
 	drm_panel_init(&ctx->panel, dev, &jh057n_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
 	drm_panel_add(&ctx->panel);
 
 	ret = mipi_dsi_attach(dsi);
-- 
2.20.1

