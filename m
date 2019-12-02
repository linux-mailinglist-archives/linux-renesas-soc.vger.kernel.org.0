Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9585110F028
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbfLBTd2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:28 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38161 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbfLBTd2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:28 -0500
Received: by mail-lj1-f194.google.com with SMTP id k8so838062ljh.5;
        Mon, 02 Dec 2019 11:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Y1mqiAE5RcwUiFVegDkD/kI5NKO3CN9zEHEAS4n6tI=;
        b=eLSVwBKzRfmXzJ69INKynMpE4N+QQ7C9joHALFYJRJTjHtsbtAjm27xqORSgSJupcp
         S0nGdqqVn2kkSardiQERm/a90jeAPPwGzVanVoD35JhitHcJH53uxrfd7S2Zi58vhbzD
         FUorU2ibBmatCrIxrMQB+K6o40M7+/0VcP3JSzDRyM1/xNcRLTV/gvQg2ucde6SD5EbP
         KLhChZtOknbLmrQ7u8kIrf6AmS0NqVBWY/0VOEMtArY1WWLoUolWQKGFBK/eWf8pcYxE
         TmnkPIOHMXGihWqlXSE1d4uJJhE7omNjuBNqZznXzaSsMk2nsVlWG+zqWOJ3mzb1lva1
         xjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=2Y1mqiAE5RcwUiFVegDkD/kI5NKO3CN9zEHEAS4n6tI=;
        b=ghU7GvEcJ//Oa+//I3EXUAAvfGTQLksznMNKwZ9tDQMdqffqM/MriTHbDV6+DfB77P
         FUdcOWQJVUIky9JFF40WAJ/ETbX2YtZ/9zxupdQUxYRLtTqhknYrSJayKqpWg1m92TX7
         kKu9/3+LQs5U9KzXIEpqfNwKEagjEIe/IEGwxN1sHIgJu2Ws77qW0oirMoiPtMdZRUZp
         pyjSnqvGEZeetKjVqmEXjGM/8nuCHiBDpcnuey3lgYQ91w394OJSUZhYapXNArmzbcFM
         AbSX9L3weTIe9r4whFYVzD1VRdrMOJzxvnNfjfGsN2uilNj5Q0ZY0rpTVebXNxQVM62T
         cJsg==
X-Gm-Message-State: APjAAAVP6NiOZMIegesBQQbe7eJhBfnZM7wbUnBJtxMWgTuFvdB8KXm+
        3B0nFOxVlyMHB+qBe7yeTEE=
X-Google-Smtp-Source: APXvYqxkxVmRA7p6+jFuEl6sc6enaU4TOldkVPnjP/5gpD+fwCWFbaI2otg2zdXHDExHl1Fmyas7wg==
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr265078ljg.3.1575315202212;
        Mon, 02 Dec 2019 11:33:22 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:21 -0800 (PST)
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
Subject: [PATCH v1 09/26] drm/panel: feiyang-fy07024di26a30d: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:13 +0100
Message-Id: <20191202193230.21310-10-sam@ravnborg.org>
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

