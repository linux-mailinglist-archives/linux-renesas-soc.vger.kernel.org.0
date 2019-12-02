Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A72BA10F07D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbfLBTd4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:56 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34812 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728003AbfLBTdz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:55 -0500
Received: by mail-lf1-f67.google.com with SMTP id l18so808122lfc.1;
        Mon, 02 Dec 2019 11:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CU1uoHEr1EClqVOFtZU3zB21PkkAQa6gthbvOIOjhXw=;
        b=sQ5sz84ahngu04detfdJb7WzDQ0QcopqKxnDfHTl6wWuDWFdmsW99YWf0HBWKVWdCP
         RtINs73RJ+Sk7G71eUzuQ9dzzWizDYLIb9hlwzETpJLExqI+mi5bryV4yuHDhM1bk64b
         vEQDA0fYt2NVXGAInm08lTk2qc9z8Zuy/bBxOD7ZeK96/nmYABuBHoroyzZmnlYo/3hL
         e6lBlbFUTJ/vQgNEhqRXR+CF6RtFCvzDPOJRsXl7kAidChgKhYB4T34t/JadF6qMZ/54
         Ia1/574eLMCCnimEAcJi1a8cMBlCfwJLuzWlre+3Lh7dtm0Umq9xTA63WTRQ+KYk8fR2
         Esxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CU1uoHEr1EClqVOFtZU3zB21PkkAQa6gthbvOIOjhXw=;
        b=k0fRxTQTqbDyjaDSe+ASYQfli1ub7asoCpHBIWVW5ObyIhdsMoAcUxfSP2oVqIEPdf
         nBtfkbBhsM4D0hVDz7LtUZWkVQyslePClS5NnYfagArLHNHh/c7gK8gUjQ5oC7UU5lpP
         CBWc//cdLFD2KPI4RWMfOUqoAGwE4jpcd/CjwloKfyCWN+fG8cnPaVaZQFaT9cfk3OOk
         2NP3pbAY1D3k91q/oifRv+6o309S7o0hDLuuIEp6P3cqxTfbH86t1LPZlxjukVL8FhDE
         7fmu+4wht5eYN4ei5gFUUWRLpgI9/xrQBK6rqkUIZJA1EwaTMOGcbPbfLJnr8t/4n9CY
         7NjQ==
X-Gm-Message-State: APjAAAXVZmGymqbU6bmCculr1PvlbhS36H4kEW9lIzHB0OLjYQYaQ8Rq
        VPEedGu0XIMTcgvCzM6bGU8=
X-Google-Smtp-Source: APXvYqy6JtwNRfjOhSCiLRMY0PnjwO80lGs4bEHgQWo2w/EjSnAnF5rp0zEQoTYkYl1Ki13jCNJp3w==
X-Received: by 2002:ac2:5388:: with SMTP id g8mr412443lfh.43.1575315232849;
        Mon, 02 Dec 2019 11:33:52 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:52 -0800 (PST)
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
Subject: [PATCH v1 26/26] drm/panel: tpo-tpg110: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:30 +0100
Message-Id: <20191202193230.21310-27-sam@ravnborg.org>
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
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-tpo-tpg110.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
index bee213ea1a42..8472d018c16f 100644
--- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
+++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
@@ -14,13 +14,13 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
-#include <linux/backlight.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 
@@ -76,10 +76,6 @@ struct tpg110 {
 	 * @panel: the DRM panel instance for this device
 	 */
 	struct drm_panel panel;
-	/**
-	 * @backlight: backlight for this panel
-	 */
-	struct backlight_device *backlight;
 	/**
 	 * @panel_type: the panel mode as detected
 	 */
@@ -356,8 +352,6 @@ static int tpg110_disable(struct drm_panel *panel)
 	val &= ~TPG110_CTRL2_PM;
 	tpg110_write_reg(tpg, TPG110_CTRL2_PM, val);
 
-	backlight_disable(tpg->backlight);
-
 	return 0;
 }
 
@@ -366,8 +360,6 @@ static int tpg110_enable(struct drm_panel *panel)
 	struct tpg110 *tpg = to_tpg110(panel);
 	u8 val;
 
-	backlight_enable(tpg->backlight);
-
 	/* Take chip out of standby */
 	val = tpg110_read_reg(tpg, TPG110_CTRL2_PM);
 	val |= TPG110_CTRL2_PM;
@@ -432,11 +424,6 @@ static int tpg110_probe(struct spi_device *spi)
 	if (ret)
 		DRM_DEV_ERROR(dev, "no panel height specified\n");
 
-	/* Look for some optional backlight */
-	tpg->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(tpg->backlight))
-		return PTR_ERR(tpg->backlight);
-
 	/* This asserts the GRESTB signal, putting the display into reset */
 	tpg->grestb = devm_gpiod_get(dev, "grestb", GPIOD_OUT_HIGH);
 	if (IS_ERR(tpg->grestb)) {
@@ -459,6 +446,11 @@ static int tpg110_probe(struct spi_device *spi)
 
 	drm_panel_init(&tpg->panel, dev, &tpg110_drm_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
+
+	ret = drm_panel_of_backlight(&tpg->panel);
+	if (ret)
+		return ret;
+
 	spi_set_drvdata(spi, tpg);
 
 	return drm_panel_add(&tpg->panel);
-- 
2.20.1

