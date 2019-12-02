Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEC010F047
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbfLBTdj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:39 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35603 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728002AbfLBTdj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:39 -0500
Received: by mail-lj1-f194.google.com with SMTP id j6so860852lja.2;
        Mon, 02 Dec 2019 11:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YHyg1Dv+yW1P3woHHern0IWhA1ZSh1oVCkpM4/quUn4=;
        b=UXVhIwS9hxqLyUKpFsi/9B+m1W8tz6O8LM+RB3HfE3wlqNoBarTzpBZk+cRfYXcKbn
         lA8UgPBM4FenshUYYPFPqreNDBD0AdQLGp+x3aW+O9T9/S+2zSZDnb0GB1Y0loieXdeD
         x4GtLZtb2OTb7W9PgYDmkjvrt2X/t6hZEa2L5ksHtQTbwiEOw1Lk1rgsxYN+OLJdJypE
         SyLoO7QNk3W0D2lNr5wmo+W5RLt+tCMvGf1qO/QjC6NNh8geO0+GKYkbHCQLQ5BOzjqz
         s/tm2pU99xfXKIdoDFCpO4LL9AXdqOSsLBqTrS/FhG5fmQTOIcEBokwV07Xlex9BHEN3
         Urnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=YHyg1Dv+yW1P3woHHern0IWhA1ZSh1oVCkpM4/quUn4=;
        b=Q9g8/d0HLEf5XMvPiG0WJxsEWPHNhci5p+l9aKWPMtfzkS4D+AS9avQ/ctPzRar2/e
         UNGEK98RnJOEpadCIbepfk5c4sXV4XNKDleySmMcqH9gSgRAdUyT6xulPCu8DQQLAPOb
         9G/T1lmJ1gissqjtf7O/QfdaDFFsJgIqZ0iupjIXBpaCqjfhy8BnHvKITB0xlp13/yDD
         6/jfpsSMF/4lqUsmN7fI87+dYr/UdriX6fhhcHkY01hDbzI/gPfyBXD6HpxBPh3JWMqJ
         Euivwyx4nvPmjP5yrN2QVmz7N3Xe6mmMNNjC0QmgcztLStNwmcLSOt49hotBLZyxO9Sf
         B7Gw==
X-Gm-Message-State: APjAAAVrBYAfniThBCpdWw53Ua1V+RJTswQesLE91kpTVoC00u+gncYj
        7DDrogda5AiRwqDcxb9P4V8=
X-Google-Smtp-Source: APXvYqz3r+laN9FnmWTYFLLBUS6ZnkiUvsIMFFNjcED2AJXxTlqVCVCVhK5M16rTTToSSV/kHLG6ng==
X-Received: by 2002:a2e:b007:: with SMTP id y7mr253216ljk.215.1575315216701;
        Mon, 02 Dec 2019 11:33:36 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:36 -0800 (PST)
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
Subject: [PATCH v1 17/26] drm/panel: raydium-rm68200: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:21 +0100
Message-Id: <20191202193230.21310-18-sam@ravnborg.org>
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
 drivers/gpu/drm/panel/panel-raydium-rm68200.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
index d6a03328e594..e8982948e0ea 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
@@ -6,9 +6,9 @@
  *          Yannick Fertre <yannick.fertre@st.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
 
@@ -78,7 +78,6 @@ struct rm68200 {
 	struct drm_panel panel;
 	struct gpio_desc *reset_gpio;
 	struct regulator *supply;
-	struct backlight_device *backlight;
 	bool prepared;
 	bool enabled;
 };
@@ -242,8 +241,6 @@ static int rm68200_disable(struct drm_panel *panel)
 	if (!ctx->enabled)
 		return 0;
 
-	backlight_disable(ctx->backlight);
-
 	ctx->enabled = false;
 
 	return 0;
@@ -328,8 +325,6 @@ static int rm68200_enable(struct drm_panel *panel)
 	if (ctx->enabled)
 		return 0;
 
-	backlight_enable(ctx->backlight);
-
 	ctx->enabled = true;
 
 	return 0;
@@ -392,10 +387,6 @@ static int rm68200_probe(struct mipi_dsi_device *dsi)
 		return ret;
 	}
 
-	ctx->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(ctx->backlight))
-		return PTR_ERR(ctx->backlight);
-
 	mipi_dsi_set_drvdata(dsi, ctx);
 
 	ctx->dev = dev;
@@ -408,6 +399,10 @@ static int rm68200_probe(struct mipi_dsi_device *dsi)
 	drm_panel_init(&ctx->panel, dev, &rm68200_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
 	drm_panel_add(&ctx->panel);
 
 	ret = mipi_dsi_attach(dsi);
-- 
2.20.1

