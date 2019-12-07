Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67F0E115C9F
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfLGOEk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:40 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44956 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfLGOEj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:39 -0500
Received: by mail-lj1-f193.google.com with SMTP id c19so10648032lji.11;
        Sat, 07 Dec 2019 06:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nh+auvkxV6hzFWp6G1ySZlQ+h5mj84VTfDwYW3UcNEg=;
        b=GLR0ghga41ugllFnX9V68j3o6mCPObjN2evzL1OX/t2lGBgTB8wmIPLgwwMBOpjpDq
         Nk8zbYrhiz40wWzyaxFyDCOx9Qp3c7eNa8A/95q5A1Qqh83tyWD1BVp0y4VctW8mG+WZ
         DAA9mowrjQXH5AcAt80VyzXd/OACUG56WyF75bVLrPavuEBdVpRprBVKB4AV35/ONJLz
         6OVdFjErq0R1IIbK1uTpO/rvDNpe+vSvtO8NekSaF7kbDOnEy/SGbQ4OnXGYt3pmaEeA
         mb8xoiJxNRlo37czxRawcLQfn8YURT2gt7i/+ojRcPc73xXdZuJ4AZGjcgILa50pJKcz
         KvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=nh+auvkxV6hzFWp6G1ySZlQ+h5mj84VTfDwYW3UcNEg=;
        b=USwkPAt9pJBwAdOasOfF/pkl9BapnDy15ZH0fnmwwfKWNe/uxoihBGGzDBFG6lrWtQ
         xyX0gnZuo3A+sTO3tVlR8BeYFE6sLV1AxW3MjoKgS2bSpd4k3gRAt2SBEFz2nJsSXZK8
         mMAgqY9Zaw//VfTrpkQiTXT86ZduSrRMKWe0jRs9O8w9hpU1p2uNfDze0bMUa4j2/wcW
         WrSJHdeqVIVx/ia7sBVFq874o4/h6NmKM9pSzfVcS8QlEtSWdmDmLb1gPW1d0+7u3HOr
         cQ1ko/HXb4319YtFSgM6ISCwPvkuXcgdIWJAO170dyw78qqQXcZ86icV9ewrL078ilO3
         ApLA==
X-Gm-Message-State: APjAAAV/YgLX9moqYZwCSyXmNUzMFdU7lXu/Njr63DzJ+hxrbRHP0GTX
        mIAOaoICO/60VHt+wSp/7gY=
X-Google-Smtp-Source: APXvYqwiY4N+GIwVJEZXPGgmoqNV1sicVH+q4kCFtsUl1LtIrxYJcm5qUL/ngh8pFMnKlvdyCiPdfA==
X-Received: by 2002:a2e:2418:: with SMTP id k24mr12093950ljk.49.1575727477038;
        Sat, 07 Dec 2019 06:04:37 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:36 -0800 (PST)
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
Subject: [PATCH v2 15/25] drm/panel: panasonic-vvx10f034n00: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:43 +0100
Message-Id: <20191207140353.23967-16-sam@ravnborg.org>
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
 .../drm/panel/panel-panasonic-vvx10f034n00.c  | 45 +++----------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 579ac0d86ea4..4e15bff5a1b5 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -7,7 +7,6 @@
  * Based on AUO panel driver by Rob Clark <robdclark@gmail.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -31,7 +30,6 @@ struct wuxga_nt_panel {
 	struct drm_panel base;
 	struct mipi_dsi_device *dsi;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 
 	bool prepared;
@@ -62,12 +60,6 @@ static int wuxga_nt_panel_disable(struct drm_panel *panel)
 
 	mipi_ret = mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
 
-	if (wuxga_nt->backlight) {
-		wuxga_nt->backlight->props.power = FB_BLANK_POWERDOWN;
-		wuxga_nt->backlight->props.state |= BL_CORE_FBBLANK;
-		bl_ret = backlight_update_status(wuxga_nt->backlight);
-	}
-
 	wuxga_nt->enabled = false;
 
 	return mipi_ret ? mipi_ret : bl_ret;
@@ -142,12 +134,6 @@ static int wuxga_nt_panel_enable(struct drm_panel *panel)
 	if (wuxga_nt->enabled)
 		return 0;
 
-	if (wuxga_nt->backlight) {
-		wuxga_nt->backlight->props.power = FB_BLANK_UNBLANK;
-		wuxga_nt->backlight->props.state &= ~BL_CORE_FBBLANK;
-		backlight_update_status(wuxga_nt->backlight);
-	}
-
 	wuxga_nt->enabled = true;
 
 	return 0;
@@ -206,7 +192,6 @@ MODULE_DEVICE_TABLE(of, wuxga_nt_of_match);
 static int wuxga_nt_panel_add(struct wuxga_nt_panel *wuxga_nt)
 {
 	struct device *dev = &wuxga_nt->dsi->dev;
-	struct device_node *np;
 	int ret;
 
 	wuxga_nt->mode = &default_mode;
@@ -215,38 +200,20 @@ static int wuxga_nt_panel_add(struct wuxga_nt_panel *wuxga_nt)
 	if (IS_ERR(wuxga_nt->supply))
 		return PTR_ERR(wuxga_nt->supply);
 
-	np = of_parse_phandle(dev->of_node, "backlight", 0);
-	if (np) {
-		wuxga_nt->backlight = of_find_backlight_by_node(np);
-		of_node_put(np);
-
-		if (!wuxga_nt->backlight)
-			return -EPROBE_DEFER;
-	}
-
 	drm_panel_init(&wuxga_nt->base, &wuxga_nt->dsi->dev,
 		       &wuxga_nt_panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
-	ret = drm_panel_add(&wuxga_nt->base);
-	if (ret < 0)
-		goto put_backlight;
-
-	return 0;
-
-put_backlight:
-	if (wuxga_nt->backlight)
-		put_device(&wuxga_nt->backlight->dev);
+	ret = drm_panel_of_backlight(&wuxga_nt->base);
+	if (ret)
+		return ret;
 
-	return ret;
+	return drm_panel_add(&wuxga_nt->base);
 }
 
 static void wuxga_nt_panel_del(struct wuxga_nt_panel *wuxga_nt)
 {
 	if (wuxga_nt->base.dev)
 		drm_panel_remove(&wuxga_nt->base);
-
-	if (wuxga_nt->backlight)
-		put_device(&wuxga_nt->backlight->dev);
 }
 
 static int wuxga_nt_panel_probe(struct mipi_dsi_device *dsi)
@@ -281,7 +248,7 @@ static int wuxga_nt_panel_remove(struct mipi_dsi_device *dsi)
 	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = wuxga_nt_panel_disable(&wuxga_nt->base);
+	ret = drm_panel_disable(&wuxga_nt->base);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
 
@@ -298,7 +265,7 @@ static void wuxga_nt_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
 
-	wuxga_nt_panel_disable(&wuxga_nt->base);
+	drm_panel_disable(&wuxga_nt->base);
 }
 
 static struct mipi_dsi_driver wuxga_nt_panel_driver = {
-- 
2.20.1

