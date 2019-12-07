Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5C80115CBA
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfLGOEu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:50 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37762 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfLGOEt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:49 -0500
Received: by mail-lj1-f195.google.com with SMTP id u17so10724329lja.4;
        Sat, 07 Dec 2019 06:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hw0rPta+AA/XFBLEBOh9a+kLNOAcb6jsKbJs4LtSRgU=;
        b=dujt1IVs5McsvvCsS7c3G0D/mTHDXUMi51mW2f99aBVUYnNM0USN10IKau9DTLbIXD
         N0w1Bxp2ZJQY4VWNYQZf6FDQd51O3sGNhWrqkB3oiiorl2hyxenjXW8v4i4n6DjmTHyv
         TWUFLU2Ow2/imOgILveZLZKmvAdZgNY/Ts4dRuLUCXML6td1LGA3UNom6LzqQ6gCV+t5
         gdcatQfkQ1WDpmFlbC+4HbLPGQ+gzXqkgVRKSHc9MEGkGFjFiZzolhPxEI5C3cKVent2
         vdsdkW1wpeBn3ajpWNmRLDC2AQapSvlxsrHAwg/JfiHH2CzarAQZBYcSc6lVbsqE8Pzt
         DAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=hw0rPta+AA/XFBLEBOh9a+kLNOAcb6jsKbJs4LtSRgU=;
        b=ZoCcwxpdLrIDD8NTx6YbRvVMPIxVOIgyUtBnvATu+QxSozh/VQErqzqgAV1WK18Dx3
         rSrBNcB6yPFwQOacZqm4GRnIbcKkpm1QcNdjwK+F6wr8ryTGnFW4GykL7FYH9ULzM93X
         kTCY+rTNYGpROJBZoMiFdSQv6/3ziM6cYe1tJ+Feqc7mr1OU+/kVCjdK9ln7a/uMSd+q
         w+dHBdD1ePWoy0R6Fiwf/b/bf1zrdd23NQlNxazCiXiAz2uGcrc6a7W7Vn5eefJ1MCu0
         PcTa8GtoLYVALxvo97N+jrv4x3BOiJ9baHqLazrlhdadcca4H+4mSLItdVUJb0CqrbyM
         u9rw==
X-Gm-Message-State: APjAAAUUhSunaXY/taqyyHYAxC97brGTqMMdX28TIingt4sI2HVoFKY4
        hrtqT/wbrOcQZkGzAv7aAbY=
X-Google-Smtp-Source: APXvYqyWqS/UYClZRuV+PVSMCxa4dLKzGzQrOw/21c5lNjINDm39XRuZVV8pygqFWhwuQDk08wN9Sw==
X-Received: by 2002:a2e:b017:: with SMTP id y23mr11611110ljk.229.1575727487602;
        Sat, 07 Dec 2019 06:04:47 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:47 -0800 (PST)
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
Subject: [PATCH v2 21/25] drm/panel: sharp-ls043t1le01: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:49 +0100
Message-Id: <20191207140353.23967-22-sam@ravnborg.org>
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
 .../gpu/drm/panel/panel-sharp-ls043t1le01.c   | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index 7995cf5a9fc4..b60c4db1ed6d 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -7,7 +7,6 @@
  * Based on AUO panel driver by Rob Clark <robdclark@gmail.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -25,7 +24,6 @@ struct sharp_nt_panel {
 	struct drm_panel base;
 	struct mipi_dsi_device *dsi;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 	struct gpio_desc *reset_gpio;
 
@@ -107,8 +105,6 @@ static int sharp_nt_panel_disable(struct drm_panel *panel)
 	if (!sharp_nt->enabled)
 		return 0;
 
-	backlight_disable(sharp_nt->backlight);
-
 	sharp_nt->enabled = false;
 
 	return 0;
@@ -190,8 +186,6 @@ static int sharp_nt_panel_enable(struct drm_panel *panel)
 	if (sharp_nt->enabled)
 		return 0;
 
-	backlight_enable(sharp_nt->backlight);
-
 	sharp_nt->enabled = true;
 
 	return 0;
@@ -244,6 +238,7 @@ static const struct drm_panel_funcs sharp_nt_panel_funcs = {
 static int sharp_nt_panel_add(struct sharp_nt_panel *sharp_nt)
 {
 	struct device *dev = &sharp_nt->dsi->dev;
+	int ret;
 
 	sharp_nt->mode = &default_mode;
 
@@ -260,14 +255,13 @@ static int sharp_nt_panel_add(struct sharp_nt_panel *sharp_nt)
 		gpiod_set_value(sharp_nt->reset_gpio, 0);
 	}
 
-	sharp_nt->backlight = devm_of_find_backlight(dev);
-
-	if (IS_ERR(sharp_nt->backlight))
-		return PTR_ERR(sharp_nt->backlight);
-
 	drm_panel_init(&sharp_nt->base, &sharp_nt->dsi->dev,
 		       &sharp_nt_panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
+	ret = drm_panel_of_backlight(&sharp_nt->base);
+	if (ret)
+		return ret;
+
 	return drm_panel_add(&sharp_nt->base);
 }
 
@@ -309,7 +303,7 @@ static int sharp_nt_panel_remove(struct mipi_dsi_device *dsi)
 	struct sharp_nt_panel *sharp_nt = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = sharp_nt_panel_disable(&sharp_nt->base);
+	ret = drm_panel_disable(&sharp_nt->base);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
 
@@ -326,7 +320,7 @@ static void sharp_nt_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct sharp_nt_panel *sharp_nt = mipi_dsi_get_drvdata(dsi);
 
-	sharp_nt_panel_disable(&sharp_nt->base);
+	drm_panel_disable(&sharp_nt->base);
 }
 
 static const struct of_device_id sharp_nt_of_match[] = {
-- 
2.20.1

