Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9E010F072
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbfLBTdt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:49 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35635 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728154AbfLBTds (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:48 -0500
Received: by mail-lj1-f196.google.com with SMTP id j6so861486lja.2;
        Mon, 02 Dec 2019 11:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EQCdMhhHkJLZcD9BzMhwIb5xb1irL0uJ2pcFEXKepFw=;
        b=OY1yeCPDNfjdMrvsRARHHhgFlNUaTixpvh8ETXE7pMJprdmFTKVV1we1+8cJAz4XT/
         TZOFneS+bmAmVo2/1FarsnUNlF/HQ+i0a79binQ5VeON+J+QbN06Nj4uz7Ma4ZX7Igvl
         NXSUqN+sktPvX04ns9obPeU83zwmI1ihE6txwTCk4mACiFSc0Q+/zOjZfeleVpUs3cTe
         /fi4PLHiLkuNCu2ibSyeRs7p/Vqvx3bApaueyaqYsXJJJtQcMDWNS4q1uTGpF1hcRUau
         gBOAK7Vue7m8v3F+YcSlkj9YA2E3ShmHOkJj0JQcPrWeqpoS0NMGuWbKaARELG4bbetw
         SW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=EQCdMhhHkJLZcD9BzMhwIb5xb1irL0uJ2pcFEXKepFw=;
        b=QFkgfjjMgXiT0S6mclc6vFCOk8nR9SHjBri6R7yUkCKByzhLA6Mkm5+QdR5qeZO0kz
         dDaEvrGO8qU5NxU/B04NIAAdQl9nLpKno5s6KBT5A4uZUI/5aN0wzt8uJRsHpfa0nhhS
         XbXYFR3p0v1suIDld/bXAH91yoNFuZ9TYgxCeykQcESCM3ScDlBRuDhp73pqQQ4TpKpw
         FdW568wOXpwSK7ZjMNtjuCQibN1F/v1wFeuQ2OITP+ZC927NgxGet+FkOM96XYMNKedI
         HNRQLBdTEfCPr+SKF1hdoHeMyjwptVtufya/NvqrFnZKPqIeqSmA7OG6fR+xHohm3rH9
         xLWg==
X-Gm-Message-State: APjAAAVnj54cmpBrqU4dn8mAWkmh4s9WvgF+74DclCTfUIudUZrb82Ke
        ezs3GNXmIpMQ0B4YFpWVC2A=
X-Google-Smtp-Source: APXvYqzBtPgnZJO2C3FgsAdYxGahX1PcJUcy/5pxg4ftOozbwWlQs9ZDIf/3+yVVuJ09OIxficg0uA==
X-Received: by 2002:a2e:c42:: with SMTP id o2mr277018ljd.222.1575315225817;
        Mon, 02 Dec 2019 11:33:45 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:45 -0800 (PST)
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
Subject: [PATCH v1 22/26] drm/panel: sharp-ls043t1le01: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:26 +0100
Message-Id: <20191202193230.21310-23-sam@ravnborg.org>
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

