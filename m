Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31C9210F033
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbfLBTda (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:30 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35579 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbfLBTda (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:30 -0500
Received: by mail-lj1-f193.google.com with SMTP id j6so860104lja.2;
        Mon, 02 Dec 2019 11:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cxn0Dcc3ud33ZBWmj1R8mFjw49Jkrh1PBlMx23F/Da8=;
        b=qLmPiWAobxUJw64smnCCOogyLzv7N8HXUOD52nBOHcR1TbPQWz2CjYMaJeV9hZxMFp
         IhWr7KlnrQcRyiWqkQcP/lO7bfilF2ldyM2yoCfL+Q7ZsS9U15XSasotNs3SmwowTNHD
         X88J9ufOwalKfq2JTZrtLQn19ZukH2S+PVaIi/Rjvl1vT+JwcieCQUGRUXkOXySRQm6g
         JEsBt9jRS2lKLzVVxfkEWHko76+T+y2P5ZsWwY1QfVcXWBsQB7ZQfBD18vTommfNs6/h
         lZJSs9I6X9WB28WLqTUZhd9cw1wIcWJ151gIqbrWpe7y3D5gdKBHo+L/0QP6i0MFFOyd
         OTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Cxn0Dcc3ud33ZBWmj1R8mFjw49Jkrh1PBlMx23F/Da8=;
        b=grIoBeE8ILkcUpMc2rrq+R19zrN8wyA9PhlyKdFpKEc1Y2a3iXxPgR7HV1tqur5GRn
         oIlLrai3uSFrS131JeDPzdv1g2roR4dNfF60NSOLm6qVJ/NT4K+6sBHZgnxTMdPpbj4a
         8Co9VuplAvU9lpWXcCwccxxluoeKYGTgsUzkzxgIgY1lLUj9B1esAgxasdQkndCQO67v
         loHy+pBXHpBUqd/cNIlaaLX1jdNFJunz0n8QxK521IcNDzSjlo5b0v6KzgB5mt/B4ryv
         NrNkSkrYVRHi4vJC0sgn+jubUDjEEt1kI/fRfwystWnBNhMaFWzK816Z9gOmCLhy1GPm
         r8Fw==
X-Gm-Message-State: APjAAAUAFEYFuLyU/tUOJyhvYu/7aQaXTG/HmPVuygPQITm3WRZOK2N/
        RwMXoPYvouSMw/QWgnDS/SE=
X-Google-Smtp-Source: APXvYqz/FMOrR16VQIW0JGwmevwl6PeUROPkg5uiylseK6QdXCQ6GjK97RCcja1bW2oF1wD3BFSBmw==
X-Received: by 2002:a05:651c:1064:: with SMTP id y4mr271748ljm.168.1575315205934;
        Mon, 02 Dec 2019 11:33:25 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:25 -0800 (PST)
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
Subject: [PATCH v1 11/26] drm/panel: innolux-p079zca: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:15 +0100
Message-Id: <20191202193230.21310-12-sam@ravnborg.org>
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
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 28 ++++++-------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index b9de37a8a0c5..7419f1f0acee 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2017, Fuzhou Rockchip Electronics Co., Ltd
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -52,7 +51,6 @@ struct innolux_panel {
 	struct mipi_dsi_device *link;
 	const struct panel_desc *desc;
 
-	struct backlight_device *backlight;
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *enable_gpio;
 
@@ -72,8 +70,6 @@ static int innolux_panel_disable(struct drm_panel *panel)
 	if (!innolux->enabled)
 		return 0;
 
-	backlight_disable(innolux->backlight);
-
 	innolux->enabled = false;
 
 	return 0;
@@ -204,18 +200,10 @@ static int innolux_panel_prepare(struct drm_panel *panel)
 static int innolux_panel_enable(struct drm_panel *panel)
 {
 	struct innolux_panel *innolux = to_innolux_panel(panel);
-	int ret;
 
 	if (innolux->enabled)
 		return 0;
 
-	ret = backlight_enable(innolux->backlight);
-	if (ret) {
-		DRM_DEV_ERROR(panel->dev,
-			      "Failed to enable backlight %d\n", ret);
-		return ret;
-	}
-
 	innolux->enabled = true;
 
 	return 0;
@@ -482,13 +470,13 @@ static int innolux_panel_add(struct mipi_dsi_device *dsi,
 		innolux->enable_gpio = NULL;
 	}
 
-	innolux->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(innolux->backlight))
-		return PTR_ERR(innolux->backlight);
-
 	drm_panel_init(&innolux->base, dev, &innolux_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	err = drm_panel_of_backlight(&innolux->base);
+	if (err)
+		return err;
+
 	err = drm_panel_add(&innolux->base);
 	if (err < 0)
 		return err;
@@ -526,12 +514,12 @@ static int innolux_panel_remove(struct mipi_dsi_device *dsi)
 	struct innolux_panel *innolux = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = innolux_panel_unprepare(&innolux->base);
+	err = drm_panel_unprepare(&innolux->base);
 	if (err < 0)
 		DRM_DEV_ERROR(&dsi->dev, "failed to unprepare panel: %d\n",
 			      err);
 
-	err = innolux_panel_disable(&innolux->base);
+	err = drm_panel_disable(&innolux->base);
 	if (err < 0)
 		DRM_DEV_ERROR(&dsi->dev, "failed to disable panel: %d\n", err);
 
@@ -549,8 +537,8 @@ static void innolux_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct innolux_panel *innolux = mipi_dsi_get_drvdata(dsi);
 
-	innolux_panel_unprepare(&innolux->base);
-	innolux_panel_disable(&innolux->base);
+	drm_panel_unprepare(&innolux->base);
+	drm_panel_disable(&innolux->base);
 }
 
 static struct mipi_dsi_driver innolux_panel_driver = {
-- 
2.20.1

