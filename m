Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049A5115CB1
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfLGOEr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:47 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37757 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfLGOEr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:47 -0500
Received: by mail-lj1-f196.google.com with SMTP id u17so10724223lja.4;
        Sat, 07 Dec 2019 06:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7mwo6xIwy/U2XO5N1RPHN+wQVnB1gT7AErUd+pEX6s=;
        b=msAonKM+50sxoUWm6s+q2esLV9oiyaLLag111TzDTz8SQ+I/uiTt4rgjySC6KQ24ZP
         fXT8q42NVcWNBBOldzoyC2oxgwuojTx+oMy8sGrVOxFJc+sIFep2xsKxiGPLGuvCUOQb
         +DehKKaI9EjFDPgvxBfkGTlkJ6+EeOEQ26qQrsfCpTK5BlwPzwkP21+KBhAIynRdYqh0
         Jw7CBJeqjUi/cNctV7ufzixPmO4vWRS6LCKWGG3X/IuYWOWD+ogcWxss+SUNRHoQhGxd
         rb3/XNYedJL3zRiwMkBCAYztTMbOApa0sT+M+ObavSMPtvRbjj3Ie40+20QGBlMIpb2P
         +9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=e7mwo6xIwy/U2XO5N1RPHN+wQVnB1gT7AErUd+pEX6s=;
        b=KrMGBdv37IS5K0+g+mfxCSfA63tyGenjVm+VPMTh0eQEWI+t2svKfiiv2WhVZTCw4d
         u4pcS47CyV4NeeZewDhJM9+txLDaOyCcJxGOsK6xs6uOoDVqR9um8EEfL6zGYNRjgCQN
         +h2sJ9ks4FA0smNyXLz3AVchsQ/0vJ1rD++khgP9aLoGU9t49ch/I6hmQAMoDNGyWIV0
         sE7e4WAqK7lc+e7UrwNuG08gMwuZs97hefBA9mjB28fld5kUUE18xsLdNkv5wrxMBmET
         xu/RZgUynmI84SJa4yJnXmUcQLu0taqyKh8Vdh3DZE2pxKnLdMjfkq2c34zwCKPbHAQh
         T/jw==
X-Gm-Message-State: APjAAAWEIWl/CTHKa5lADl4QmeACaqLUriw9wn5TFqKut4teJbubvsxB
        PFY6pkydJJlaHq7EGsnWSa8=
X-Google-Smtp-Source: APXvYqwmQQwd5PYZLccoPw95nR8Lj7iniKv3EdQE4SgC0FhGKWQQgOWwqa3PijSftjOtij17f88rLg==
X-Received: by 2002:a2e:2d11:: with SMTP id t17mr3482709ljt.177.1575727484353;
        Sat, 07 Dec 2019 06:04:44 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:43 -0800 (PST)
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
Subject: [PATCH v2 19/25] drm/panel: seiko-43wvf1g: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:47 +0100
Message-Id: <20191207140353.23967-20-sam@ravnborg.org>
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
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 36 ++++-----------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 18e745104aaf..40fcbbbacb2c 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -6,7 +6,6 @@
  * Based on Panel Simple driver by Thierry Reding <treding@nvidia.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -46,7 +45,6 @@ struct seiko_panel {
 	bool prepared;
 	bool enabled;
 	const struct seiko_panel_desc *desc;
-	struct backlight_device *backlight;
 	struct regulator *dvdd;
 	struct regulator *avdd;
 };
@@ -127,12 +125,6 @@ static int seiko_panel_disable(struct drm_panel *panel)
 	if (!p->enabled)
 		return 0;
 
-	if (p->backlight) {
-		p->backlight->props.power = FB_BLANK_POWERDOWN;
-		p->backlight->props.state |= BL_CORE_FBBLANK;
-		backlight_update_status(p->backlight);
-	}
-
 	p->enabled = false;
 
 	return 0;
@@ -196,12 +188,6 @@ static int seiko_panel_enable(struct drm_panel *panel)
 	if (p->enabled)
 		return 0;
 
-	if (p->backlight) {
-		p->backlight->props.state &= ~BL_CORE_FBBLANK;
-		p->backlight->props.power = FB_BLANK_UNBLANK;
-		backlight_update_status(p->backlight);
-	}
-
 	p->enabled = true;
 
 	return 0;
@@ -245,7 +231,6 @@ static const struct drm_panel_funcs seiko_panel_funcs = {
 static int seiko_panel_probe(struct device *dev,
 					const struct seiko_panel_desc *desc)
 {
-	struct device_node *backlight;
 	struct seiko_panel *panel;
 	int err;
 
@@ -265,18 +250,13 @@ static int seiko_panel_probe(struct device *dev,
 	if (IS_ERR(panel->avdd))
 		return PTR_ERR(panel->avdd);
 
-	backlight = of_parse_phandle(dev->of_node, "backlight", 0);
-	if (backlight) {
-		panel->backlight = of_find_backlight_by_node(backlight);
-		of_node_put(backlight);
-
-		if (!panel->backlight)
-			return -EPROBE_DEFER;
-	}
-
 	drm_panel_init(&panel->base, dev, &seiko_panel_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
 
+	err = drm_panel_of_backlight(&panel->base);
+	if (err)
+		return err;
+
 	err = drm_panel_add(&panel->base);
 	if (err < 0)
 		return err;
@@ -291,11 +271,7 @@ static int seiko_panel_remove(struct platform_device *pdev)
 	struct seiko_panel *panel = dev_get_drvdata(&pdev->dev);
 
 	drm_panel_remove(&panel->base);
-
-	seiko_panel_disable(&panel->base);
-
-	if (panel->backlight)
-		put_device(&panel->backlight->dev);
+	drm_panel_disable(&panel->base);
 
 	return 0;
 }
@@ -304,7 +280,7 @@ static void seiko_panel_shutdown(struct platform_device *pdev)
 {
 	struct seiko_panel *panel = dev_get_drvdata(&pdev->dev);
 
-	seiko_panel_disable(&panel->base);
+	drm_panel_disable(&panel->base);
 }
 
 static const struct display_timing seiko_43wvf1g_timing = {
-- 
2.20.1

