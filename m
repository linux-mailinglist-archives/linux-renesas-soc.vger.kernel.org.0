Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0DC10F080
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbfLBTd5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:57 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38335 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbfLBTdu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:50 -0500
Received: by mail-lf1-f67.google.com with SMTP id r14so787519lfm.5;
        Mon, 02 Dec 2019 11:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u1P14KeAOzrkL3LNTshRMs65q8V9CfCv8YTP7h0aK64=;
        b=JrpzjoCoLqwt9XJXm9NiiM6/tImyc78Qynmiev/loI9ukXyLXuVueEfltQnqgtLMsR
         JycYlyEvffuZWj7Z7TOdRqlz+dyRHYl5icP+sjNhYoVrW/GPm5XmLAsdlYd8VGUI4aOj
         vGYTy8sjIrLh/pcKwJ/iOhlyeCR3u06MCTKDI8Cvb8bFmM3gyXY+jwIWsXaDh8bqssFz
         hQw5MqZ1KqhzUUum8KD0GL3eFU2X6gW0+rpXl5mpPep81T1FBL9xtPRbI0xjfS3u78is
         Dx9sJKJwySbgX5RyJ+xbNW1dS8FbwR58QRkO08VBKwazlwTmeO0U0FJ9N15PZT741s1A
         Ru/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=u1P14KeAOzrkL3LNTshRMs65q8V9CfCv8YTP7h0aK64=;
        b=KjovvWsRiOCm3whPRK5jx1QCdzD+EdsW1ofXFJNlwu2oRpEM6Fr1rsufKyoep7lHgR
         ISJTRjMXz7jlrJFELkme/JTNk+kudj1zVcRCl8wxs/8gZo6ztrFrvTjru+iJtuc9pjos
         sklsIi7+50ZDDln2jFqsUM/T01AlyQCVyexSOCJTSNd7vR/dPk8qSWRk84FTFErbaULO
         kRHH7vfRXgD+DQxNKMAMa394qbsWfWFlcPAL+5Ei7TiHYHPDRpWeShwq2PgeFwlEcpy8
         RZnYTiyK5gvxGkaYPH1ibOV1970aSjYv+s+EDggqt20IBpHhINqni5nG7OIGmiVr5qbH
         aGiQ==
X-Gm-Message-State: APjAAAXtpYCz7H2enW65gShqq57xJI/HDSIWzitdNg+J/1WsgoZonxT0
        eq6Kr81w8VwxBafHMLnGSYs=
X-Google-Smtp-Source: APXvYqxwbVLzsiX6A4ZpKGEcYM1Fgrfee7HhMpCObNZmnZ3kty6IsgrehL3h2mIoslhqWhw9cf4q1A==
X-Received: by 2002:a05:6512:499:: with SMTP id v25mr439414lfq.9.1575315227477;
        Mon, 02 Dec 2019 11:33:47 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:46 -0800 (PST)
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
Subject: [PATCH v1 23/26] drm/panel: sitronix-st7701: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:27 +0100
Message-Id: <20191202193230.21310-24-sam@ravnborg.org>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index c08a865a2a93..4b4f2558e3b4 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -9,7 +9,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
-#include <linux/backlight.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -103,7 +102,6 @@ struct st7701 {
 	struct mipi_dsi_device *dsi;
 	const struct st7701_panel_desc *desc;
 
-	struct backlight_device *backlight;
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset;
 	unsigned int sleep_delay;
@@ -223,7 +221,6 @@ static int st7701_enable(struct drm_panel *panel)
 	struct st7701 *st7701 = panel_to_st7701(panel);
 
 	ST7701_DSI(st7701, MIPI_DCS_SET_DISPLAY_ON, 0x00);
-	backlight_enable(st7701->backlight);
 
 	return 0;
 }
@@ -232,7 +229,6 @@ static int st7701_disable(struct drm_panel *panel)
 {
 	struct st7701 *st7701 = panel_to_st7701(panel);
 
-	backlight_disable(st7701->backlight);
 	ST7701_DSI(st7701, MIPI_DCS_SET_DISPLAY_OFF, 0x00);
 
 	return 0;
@@ -366,10 +362,6 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(st7701->reset);
 	}
 
-	st7701->backlight = devm_of_find_backlight(&dsi->dev);
-	if (IS_ERR(st7701->backlight))
-		return PTR_ERR(st7701->backlight);
-
 	drm_panel_init(&st7701->panel, &dsi->dev, &st7701_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
@@ -384,6 +376,10 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 	 */
 	st7701->sleep_delay = 120 + desc->panel_sleep_delay;
 
+	ret = drm_panel_of_backlight(&st7701->panel);
+	if (ret)
+		return ret;
+
 	ret = drm_panel_add(&st7701->panel);
 	if (ret < 0)
 		return ret;
-- 
2.20.1

