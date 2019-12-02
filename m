Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC20910F079
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbfLBTdz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:55 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41340 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728203AbfLBTdv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:51 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so807944ljc.8;
        Mon, 02 Dec 2019 11:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hAKrkmNcCozl3LAaqRfeNwt0Xqu/w+s6/exQHnAaPSg=;
        b=X6seJeavAuZ4rDdxOy9hEnXoLG0oobxXRy+xY8wWgitF4tTB87MsPXIcIuEVV0uvti
         W0R5e8qXxki30sA5dYdKwlmPgklxVKxb9+aHG3PRzFh67me+5fs4qU+wAFieX4NtPJRF
         2rGj0gksOxyaY6AI60t4e0xlhYM6OlmvJoiWNC3RYbIUiNJFWLIl8b6KjN07Tv5Xu2Xa
         DRWiNyEud2lLwiSrC+fJQ4G1SvpUCCuVsxuERVCrTeQsJsBzRFAmyhlurYrx1WrWpRH7
         9wuWiasSHXHEw7O6gYBiF5ZPb+ywMbAa1wk7mSydtG0bzvyJPFr+gutNvONhGKFwSg0Q
         /Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=hAKrkmNcCozl3LAaqRfeNwt0Xqu/w+s6/exQHnAaPSg=;
        b=Swzq9IzkB1nvclplhPuZgiSZPZkTVMj2AxA1+KuLXYs/YaT2R7d8vOVuA+QJc5l9Dn
         D4+c19/Cr5yOu+lZxVYqTnsltMS/ePUISRY3xN+SXVzP//tOZbm2Ncf+q58IOoyKJyNu
         iq0qLKY6wuAX3lnT1lMJIcUuJjoOCKw6EhdtotaskuzvuuUkwUOobRr+V21oXhb8RFEW
         8/UFLRcWPmLEP18TDd4zMi0D+a6ytQ3Qz95qhuf1jw8R53iRIMR3RzS3RNoCLslQt+Fc
         Ts8DNY0uR8giXehkq2RIRUcZiUKLTpuE+yMdfOlAhobBlwNxLVgdHfR+GawdGodzh9MN
         CW+g==
X-Gm-Message-State: APjAAAUbIRtLCARCBF3/23EMZcokxZY/IUgswgYJfN1p39iQPRRzsv3v
        yn+0Rfex4q5eX2Umgkp/OXM=
X-Google-Smtp-Source: APXvYqwkSwEanVTfqqupRACq5bTVVsNocJ7zo+uG5n6CAnsmd9lWBvGtWMlkSAMwbQN9o+Rbbx6T4A==
X-Received: by 2002:a2e:970e:: with SMTP id r14mr254679lji.57.1575315229302;
        Mon, 02 Dec 2019 11:33:49 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:48 -0800 (PST)
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
Subject: [PATCH v1 24/26] drm/panel: sitronix-st7789v: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:28 +0100
Message-Id: <20191202193230.21310-25-sam@ravnborg.org>
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
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 37 ++-----------------
 1 file changed, 4 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index ebefe2f4c26b..cc02c54c1b2e 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2017 Free Electrons
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -116,7 +115,6 @@ struct st7789v {
 	struct drm_panel panel;
 	struct spi_device *spi;
 	struct gpio_desc *reset;
-	struct backlight_device *backlight;
 	struct regulator *power;
 };
 
@@ -323,12 +321,6 @@ static int st7789v_enable(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
 
-	if (ctx->backlight) {
-		ctx->backlight->props.state &= ~BL_CORE_FBBLANK;
-		ctx->backlight->props.power = FB_BLANK_UNBLANK;
-		backlight_update_status(ctx->backlight);
-	}
-
 	return st7789v_write_command(ctx, MIPI_DCS_SET_DISPLAY_ON);
 }
 
@@ -339,12 +331,6 @@ static int st7789v_disable(struct drm_panel *panel)
 
 	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_SET_DISPLAY_OFF));
 
-	if (ctx->backlight) {
-		ctx->backlight->props.power = FB_BLANK_POWERDOWN;
-		ctx->backlight->props.state |= BL_CORE_FBBLANK;
-		backlight_update_status(ctx->backlight);
-	}
-
 	return 0;
 }
 
@@ -370,7 +356,6 @@ static const struct drm_panel_funcs st7789v_drm_funcs = {
 
 static int st7789v_probe(struct spi_device *spi)
 {
-	struct device_node *backlight;
 	struct st7789v *ctx;
 	int ret;
 
@@ -394,26 +379,15 @@ static int st7789v_probe(struct spi_device *spi)
 		return PTR_ERR(ctx->reset);
 	}
 
-	backlight = of_parse_phandle(spi->dev.of_node, "backlight", 0);
-	if (backlight) {
-		ctx->backlight = of_find_backlight_by_node(backlight);
-		of_node_put(backlight);
-
-		if (!ctx->backlight)
-			return -EPROBE_DEFER;
-	}
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
 
 	ret = drm_panel_add(&ctx->panel);
 	if (ret < 0)
-		goto err_free_backlight;
+		return ret;
 
 	return 0;
-
-err_free_backlight:
-	if (ctx->backlight)
-		put_device(&ctx->backlight->dev);
-
-	return ret;
 }
 
 static int st7789v_remove(struct spi_device *spi)
@@ -422,9 +396,6 @@ static int st7789v_remove(struct spi_device *spi)
 
 	drm_panel_remove(&ctx->panel);
 
-	if (ctx->backlight)
-		put_device(&ctx->backlight->dev);
-
 	return 0;
 }
 
-- 
2.20.1

