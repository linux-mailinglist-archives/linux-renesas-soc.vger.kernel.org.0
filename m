Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A86EC115C83
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfLGOE0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:26 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42092 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfLGOE0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:26 -0500
Received: by mail-lj1-f196.google.com with SMTP id e28so10675555ljo.9;
        Sat, 07 Dec 2019 06:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a/X1ku96PJtMOzhRmVeY8hbSu7FlKPaZgSc8fbXe+3Q=;
        b=euqtqE1pfc3hrle5JL0T16PR1L5s+gJEwTWJzevgh0O7PZ66Jv2B50bf0spx1cau+t
         QePMKRl0lP8NMT/G0y+Ypfpy91xuYEAdflY9cuxYUJR/0OtX6NIbaI0Er2rS3gOxnFdt
         tg16hWbgLAlhru+jIbcRH4wTMqohJwkGHXeWOqt1JIFNw5fgO/4JyanxyGnXsyCZDap7
         wtYXIJhQABWszpbteIBw62xqiMfEYV29xOzGzGBNS/teKsSMj9y40x3IcYVfhxsgzd1u
         w/xEqE68bfhC3Sm5xv8oSO/g158a13sKqoy5QP+n5wZILCXOqSVde3mfFu4Il/I6sGtq
         bLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=a/X1ku96PJtMOzhRmVeY8hbSu7FlKPaZgSc8fbXe+3Q=;
        b=b/gZ866KcNw8/Ai6+rIUyls6hKIJHWVG3df8gS+pg8F8sZfNQ06mXBREhbeQ+ipBlg
         am4MInAa7YH7kLH8LWEo0HxA51VGZhop2fbm1ZwmGYcpUaJSymrs0ELX4huAVYRuV5he
         IwvFvzPSCecL0uNpjtZik0YM4+SrBaqkNf+TD63n91zUgRiSZJuw0C9QOjdVdSDhS0Bq
         hxN3n9thVn8Viu86tSyhZPW2M/5iqYCdh67JzgLse8VF6mG2JpOcGULCI6uYtUO9U8Z7
         RTAdgnRR8QMv+Bc7VUaV+Fb2J6lcssKcMvR7bv96AJcbkY34bILO/htTaxEt8o2XVbXk
         bMww==
X-Gm-Message-State: APjAAAVM6U/KVVDFqAAdWjmfsA47VefrxaC4aphpni5Jcshvk2Zh+/kJ
        r+LUSUW85bNysVLfj/y2HIA=
X-Google-Smtp-Source: APXvYqwFENSCVyDVwakZNKkQAOC32yhJVErz1ubaDfyLjZVYnCk6bftAg9IioG6emITjn57KtG6AsQ==
X-Received: by 2002:a2e:2e0e:: with SMTP id u14mr11617285lju.106.1575727464491;
        Sat, 07 Dec 2019 06:04:24 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:24 -0800 (PST)
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
Subject: [PATCH v2 08/25] drm/panel: feiyang-fy07024di26a30d: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:36 +0100
Message-Id: <20191207140353.23967-9-sam@ravnborg.org>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index 0157d1844e3e..95b789ab9d29 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -9,7 +9,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
-#include <linux/backlight.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -22,7 +21,6 @@ struct feiyang {
 	struct drm_panel	panel;
 	struct mipi_dsi_device	*dsi;
 
-	struct backlight_device	*backlight;
 	struct regulator	*dvdd;
 	struct regulator	*avdd;
 	struct gpio_desc	*reset;
@@ -102,7 +100,6 @@ static int feiyang_enable(struct drm_panel *panel)
 	msleep(200);
 
 	mipi_dsi_dcs_set_display_on(ctx->dsi);
-	backlight_enable(ctx->backlight);
 
 	return 0;
 }
@@ -111,7 +108,6 @@ static int feiyang_disable(struct drm_panel *panel)
 {
 	struct feiyang *ctx = panel_to_feiyang(panel);
 
-	backlight_disable(ctx->backlight);
 	return mipi_dsi_dcs_set_display_off(ctx->dsi);
 }
 
@@ -225,9 +221,9 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(ctx->reset);
 	}
 
-	ctx->backlight = devm_of_find_backlight(&dsi->dev);
-	if (IS_ERR(ctx->backlight))
-		return PTR_ERR(ctx->backlight);
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
 
 	ret = drm_panel_add(&ctx->panel);
 	if (ret < 0)
-- 
2.20.1

