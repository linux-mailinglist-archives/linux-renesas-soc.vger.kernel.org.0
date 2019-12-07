Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 644CB115CC6
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfLGOEz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:55 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33907 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfLGOEy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:54 -0500
Received: by mail-lj1-f195.google.com with SMTP id m6so10743582ljc.1;
        Sat, 07 Dec 2019 06:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SbAZsoLI4xe9I1FggVPS6JxgD/wZYj776xJ1KOhYNIk=;
        b=DCzX7740hQWDvyui4A8ga8DkYDCncQFz4GDyBUZdgaMJdfBOLfab/YXEKbqNxeNt15
         3tHZkpiTr/zuL6N3ZElvYBLM+CewDl04mfT5TD53GI0I0rsUs+yrDHc7ZwmEvlvVgLcn
         Sh1p51fhuIU9LaCeS7pZRZt/EGRmsq2zDF56PCT8PQX0dh0SOe7piwguDWq3xVxCh+1+
         YOynvNp9Vpl9YGZRC9ZB1L8Oc0/NBQNlmtAoxgBtKnG2Tg2IZcYjOkRp8hVxt0WChfIi
         9FaIqOlPVaofR8kankX4QZE3AbRYT2FdIbF6MztPJ6s25nfdKHjJFl1UwUOdY5WHme4Q
         2ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=SbAZsoLI4xe9I1FggVPS6JxgD/wZYj776xJ1KOhYNIk=;
        b=jJDo4CvmJ9wbPiyMHvQW0AqN/tNI3XPyeaLAdf+iKocRntH9qClQeMmxC4ZXE1nizH
         24+eVQ0fKbU886QRtzMCTl6VmBo9tyTQislzwK0xO/s5Ojj23JPKVQCI/a89ghTqWEdz
         xiNCdLZe+KwRPFn+jeGp7K7N+vhowPBrIfzECn1xKyNp0EuPc8fQAAC5KatZ0T972QfV
         6JS8Smjg4Ut83Ui5h4IlvYfUnZHb43V1M7+dBw6WgYB8+DJCt+LsTC0VG27/s6RszLBc
         iLT6HT4QXrbzgoCf2pOhg5Z3zZCaXF7Gg85u7CrPrXs3eaH2YarB0DwBW2r91tI9VByf
         BiZg==
X-Gm-Message-State: APjAAAV8xRgM1OZ7sE2FbvdyNW8oDmTVjK2T7h4Wq0FCdiuANgCY9IM9
        Q6jmgI51K6YIGpJ6U82HFTzBi5K4MIkemA==
X-Google-Smtp-Source: APXvYqyueXqxzfVF1B9uqOsm+QnSO4hj8wBzhQU9+hnmAtFQMkiDT971EwDtMKEqiCRZcigJkrKh8A==
X-Received: by 2002:a2e:9e16:: with SMTP id e22mr4087572ljk.220.1575727492532;
        Sat, 07 Dec 2019 06:04:52 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:52 -0800 (PST)
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
Subject: [PATCH v2 24/25] drm/panel: tpo-td028ttec1: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:52 +0100
Message-Id: <20191207140353.23967-25-sam@ravnborg.org>
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
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
index 37252590b541..cf29405a2dbe 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
@@ -17,7 +17,6 @@
  * H. Nikolaus Schaller <hns@goldelico.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
@@ -83,7 +82,6 @@ struct td028ttec1_panel {
 	struct drm_panel panel;
 
 	struct spi_device *spi;
-	struct backlight_device *backlight;
 };
 
 #define to_td028ttec1_device(p) container_of(p, struct td028ttec1_panel, panel)
@@ -243,8 +241,6 @@ static int td028ttec1_enable(struct drm_panel *panel)
 	if (ret)
 		return ret;
 
-	backlight_enable(lcd->backlight);
-
 	return 0;
 }
 
@@ -252,8 +248,6 @@ static int td028ttec1_disable(struct drm_panel *panel)
 {
 	struct td028ttec1_panel *lcd = to_td028ttec1_device(panel);
 
-	backlight_disable(lcd->backlight);
-
 	jbt_ret_write_0(lcd, JBT_REG_DISPLAY_OFF, NULL);
 
 	return 0;
@@ -334,10 +328,6 @@ static int td028ttec1_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, lcd);
 	lcd->spi = spi;
 
-	lcd->backlight = devm_of_find_backlight(&spi->dev);
-	if (IS_ERR(lcd->backlight))
-		return PTR_ERR(lcd->backlight);
-
 	spi->mode = SPI_MODE_3;
 	spi->bits_per_word = 9;
 
@@ -350,6 +340,10 @@ static int td028ttec1_probe(struct spi_device *spi)
 	drm_panel_init(&lcd->panel, &lcd->spi->dev, &td028ttec1_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
 
+	ret = drm_panel_of_backlight(&lcd->panel);
+	if (ret)
+		return ret;
+
 	return drm_panel_add(&lcd->panel);
 }
 
-- 
2.20.1

