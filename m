Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1C5B115CA4
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfLGOEl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:41 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35277 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfLGOEl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:41 -0500
Received: by mail-lj1-f195.google.com with SMTP id j6so10737519lja.2;
        Sat, 07 Dec 2019 06:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ajEOdCUpT16GVN8gH4RbvIy9yc0BScTRBZ/ljCGiME=;
        b=del00zw1hnJOSv6lindha+LEL+pXCeIab6795BI3uAGU4qQMEuuUbjQwOGzbrRfYnV
         sLSpfj7wW3bvryQATj7Q51EwRQD7wRWf62nDjfn6BJFcMaN5LBIhK6IJMt0XJ1Ebfo6J
         XUVLV3X2Ol3AiWrAA9fIpAo3H6pPHhti2T+aMNzt8UWn1Bt5wiHgZX3ad8qBtPltlD/C
         46l3GHw3p5o3zqTX2ZlVW52Bzx2xLd494I1jvveB4FXyii3QJbWyltaWAjdwlm7zXUoI
         jqbYvwE1QXqvMA4YnM5UQcphd58kDP+oaaRq+YP7wmtRkB5l6+6cYecRYZcs/vzQN+4A
         dMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=9ajEOdCUpT16GVN8gH4RbvIy9yc0BScTRBZ/ljCGiME=;
        b=hMaSCUKV6ZBR+17rz9Scry1Si0/vh5qsB9rYBA0r9ki0VQZT9+g1ZTPmrzP1Otn1u2
         Z2Xz//4s4d18/dPJYQt4FdXfdBxXrQEYkWRhtf/tS9vRrZ1nKpRUD4rMVa6bX0zaR0+5
         EGawq0mqzRZdk+FrjNmk2l4OpNQDhRJVnufBv26019X1KprT/9pSD5gpg+bmWURXI4l6
         cmDtKyyQoHEJ0j5ZJDEC1rCdKY0ZxbxQ3KIozmg6sEcX7lphLdim7u2qN3aUWhSc/H6h
         TnOCVfmdcxWwL3gf4Hff9sSiR8FFz9r2hiXfv5crUeiGbvpN9OD1+smwBoTJYyrJdMuF
         UsJQ==
X-Gm-Message-State: APjAAAUWtqtXGUXwIBhWvK7Kmg5aBsBbWyH1mrz5BegvGUQCdq1x9eRl
        5gmO+x2vjczkmpUdzub7NuA=
X-Google-Smtp-Source: APXvYqzCbSGlblzAZsh3pGQCv4tblDf1OnHgS/cPV5hd9q+X+WS1X5hlR+rDAbIA4PDjxaKo1Ddq2Q==
X-Received: by 2002:a2e:9890:: with SMTP id b16mr11789523ljj.190.1575727478849;
        Sat, 07 Dec 2019 06:04:38 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:38 -0800 (PST)
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
Subject: [PATCH v2 16/25] drm/panel: raydium-rm68200: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:44 +0100
Message-Id: <20191207140353.23967-17-sam@ravnborg.org>
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

