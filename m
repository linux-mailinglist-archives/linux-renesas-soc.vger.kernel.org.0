Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 696E5115CC3
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbfLGOEx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:53 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39546 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfLGOEx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:53 -0500
Received: by mail-lj1-f196.google.com with SMTP id e10so10697734ljj.6;
        Sat, 07 Dec 2019 06:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MB8F/gszf2cRKXpRo2VrQVMb2VRddLrgS3cljPlLt24=;
        b=U4xN8GN0VPGdaO0AWtyf6QNMU6m6GH++MkTsmxwi2KAjxIa1YJgJ8HSo/kVZ/oXAzn
         q83znx4fzd/G/OpFJmM6CAiN8Pgp0sCApYTH2XNHRcbDRklBLdWaY75dTGz3YrNod2VA
         RkaVGJC49ElYYqCRnVrHZunYO9+hDv9eBo931BevMWXMwqisYsqZDen0w3833qVKdgG9
         s4fx3xuCFRmxJ5nHIgrOtwi22oS6HxZLNe+rnRUZh8C9XNOdtzIyv3NGUJT8er74Pdh0
         WBvUy9rr9uNu8/DnprIlGZdSvditWsW7o3qXTjedfkIoteUK0Tphpvjdf74rklqpqMao
         kIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=MB8F/gszf2cRKXpRo2VrQVMb2VRddLrgS3cljPlLt24=;
        b=GtNPbGY1+v1n9Xxoy1rcAumG3C5bRgvpUVJ9cGcKBljXtogd4JQffVyVijt50HPXAz
         lR7Ej2Lm+v/FH50uP84GMnbeWFqfrazJDnfwUN1h8ZGzrm8+ftosv6BWbsbGkPckq4H8
         MUBmtbxEZOMesHFnyDWJ4m5+WCAE7lfc16YvQOdcXOqrLD9vdnNtSxDomqC3f6NIui8E
         IWmqZDCWfM3+GvYcU+WeDnTeycHX4pJ5er73QLxnXXZkf7rFDFs06ejfwuQ2P4eNW2yl
         ZfEHLp//VkCmV9X9GWejZzbV5cTnvc0tfPiYqiX5znlZI/O7K439PUqUo48dN3Cx6HYK
         rEdA==
X-Gm-Message-State: APjAAAVM2/TAK83VCD05rxEgOBLYxxX6M7dUBxI7rX7gQfTBrNti7KHo
        O7ROA8bjv4ddZDH6yIMsJTs=
X-Google-Smtp-Source: APXvYqx9J1DRR8LiccaW8h+Ak6WWGoNOve+yafSt4KrzKSCNMRhs/EjfonWGrZJnRRbGVrZODAwZ4Q==
X-Received: by 2002:a2e:144b:: with SMTP id 11mr11535632lju.216.1575727490861;
        Sat, 07 Dec 2019 06:04:50 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:50 -0800 (PST)
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
Subject: [PATCH v2 23/25] drm/panel: sitronix-st7789v: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:51 +0100
Message-Id: <20191207140353.23967-24-sam@ravnborg.org>
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

