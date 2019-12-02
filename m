Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE2E410F02F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbfLBTd2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:28 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44140 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbfLBTd2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:28 -0500
Received: by mail-lj1-f195.google.com with SMTP id c19so784199lji.11;
        Mon, 02 Dec 2019 11:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SZWMV+Yn1n2qxRJClXssw0x9jjzxt8p36cqP16qYlFw=;
        b=frMI18ND0CrGpRVoz0OF84/PH36Owh77oBXHkdHxFAhthah1O0rNVYydhRQb7d6viP
         BCk+dD/GzECwi/F2n2DqleQS893D3L2lqkpbbYK95/S/TIv4XagcmzI9eAo5q4uRuQg0
         xzhWOqXqvMgPDG5cYICG3bapo4zCav/4T+Idmji0shD088h5xUCqyDVlZ+zxlkn8tIGx
         a9ZHWmSRGNggrqIV3w7Q/5tL1+kql/xXrReYl5u34OrzQgWnRXjkGuFAd0M1X2aHk0B+
         eG8VKd22Sio2oqOYiybikcVPNtv+psbbAuVYKAjE7br9TYNcnyCgpNhutdtXJUOxwbc8
         CkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=SZWMV+Yn1n2qxRJClXssw0x9jjzxt8p36cqP16qYlFw=;
        b=hgwM+gAdIIlnIxyySdEfMz9lJnWViKjwdmZxm7WtoVaSXk56uVPlfi/qN7+FkMrZOH
         Pzu97VftZPakZPqAzOTXFdKH8Wo7/0gANiwnu2P/8QxC6vLcPHWxMREfhFLi32Jw/ets
         3FSTTkFPK/zHCXNZoRjrXe8/C4QhatnkXVwThuhmjKrrRFL8yTiY2DSBe1LJQl1uxwYb
         rjNgO29SZeoiPemDvRJsthAdqpPgVIy916AZBS7kI9tT4ucZxsRblN/M2iypJlu92wuV
         EhWd/0GSH21LC4HfwWZ/muIFqaxTRcva67oZnLFPvI/tcyG7KLWvadqWvltaIgw6la4T
         +efQ==
X-Gm-Message-State: APjAAAU7bBa5qExJ7w8pfLD/7FLfoK/QvwbtpU03g99UjNVIQ14Pg9aK
        Ok5NyEkaoSSxIFac3EGchmo=
X-Google-Smtp-Source: APXvYqyXXdCnUTLi1SoZH1pKdgl0Vb/3Bp3QBgnJto+WVAY2jbGBVOdB3Q4OelNXtyNkSlqln2bYfQ==
X-Received: by 2002:a2e:89c6:: with SMTP id c6mr264410ljk.113.1575315203864;
        Mon, 02 Dec 2019 11:33:23 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:23 -0800 (PST)
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
Subject: [PATCH v1 10/26] drm/panel: ilitek-ili9881c: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:14 +0100
Message-Id: <20191202193230.21310-11-sam@ravnborg.org>
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

