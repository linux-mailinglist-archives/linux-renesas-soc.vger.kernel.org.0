Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF6AF115CCB
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfLGOE5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:57 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36212 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfLGOE5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:57 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so10734833ljg.3;
        Sat, 07 Dec 2019 06:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ax5u03O4GlUXYUvsqNfWqp3nl/wfPRGvWRKaUynTqzE=;
        b=MOsjEX8G2hTD3/Fqw0NAaEC1u+eRNTD8YHbsDUThxCNZ0y7lK+EPqSY7l0iB0EIoBu
         WR15mn/7DrpvWuejz3eWKvcRkQgfLwrUvNhSp1gY7/7ZlXFmSX2+iE1tyP4SKPER/keM
         AWg11mGYe7VbBl0OhcfPXQafEzJMP7xS6RJ2GlKsZ4uct5p4piuCX67LTXP/8Cavq5ES
         rNHvpjQTrS87tvX0PN23KywnIG3H2tBDf13yBTNiJ0TVC23/BCL2XGnKZMCACyg0zM7l
         GYvBqeAxr9/24mGWgBOXYagq5hgYuZyDuiQQqr+zUDXeJdI4Dsy103KEw0gG1d9kuI+p
         w8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Ax5u03O4GlUXYUvsqNfWqp3nl/wfPRGvWRKaUynTqzE=;
        b=FxKlZvfUQ6ZbnwXopqPLTbZMj7U5oX/9tDlbhgxuWJSHeif9fFujZ0DZ+ho8x2Jncn
         rWRP7VD05t8o+3Anq+6e9RjhhMz6+i3+DUYKFVIJlZp5oKd1Ktd6v3hrchJwZmM0mj+O
         lR67jbY/haC3IM8P3o9ucG8He0G1Lf6xpdCAFX37MxusHrMzAvck/d67wLt6zZkcv2K9
         gta8iK3V45cs/+NFIsjOVw478/NBOjjlf44CAx3rUhCC9C189sPMMVJzIrGCfxAmyEpS
         gQ1Q8YFC54sqaVHFvOBL7v9L2kLvBap5sAGMy1HFdr/1f5IixkDG3kxW9lNFt6DtM04t
         T0Wg==
X-Gm-Message-State: APjAAAUtniUocO4Y+QnnE6o9bByuEIQFtn2fHwyrzLvOMB2SeoLY1nje
        v6UqKm5cEbJ4O2c4+31Dw+c=
X-Google-Smtp-Source: APXvYqwuVFG+u6wmnSLIj8XDvpMwmzMMOJBAB41245Fellx5JQ1423tL59LT5rneoJWV6nyNmS7r1A==
X-Received: by 2002:a05:651c:1b5:: with SMTP id c21mr12024851ljn.115.1575727494401;
        Sat, 07 Dec 2019 06:04:54 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:53 -0800 (PST)
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
Subject: [PATCH v2 25/25] drm/panel: tpo-tpg110: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:53 +0100
Message-Id: <20191207140353.23967-26-sam@ravnborg.org>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

