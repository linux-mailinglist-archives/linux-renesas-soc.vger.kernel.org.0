Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D693910F014
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbfLBTdO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:14 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37503 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbfLBTdO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:14 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so790370lfc.4;
        Mon, 02 Dec 2019 11:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pufhdufTBZ4mSzYNhIa1SU1Zolx0dEUNyE9ky7d08jw=;
        b=Xc6+bsYYLAQi0yIiEPOOsVDOPaXWqYmWsAGZ6RV2VEhV9pVuYL3BsbW3SnM25cmwS0
         AsFNImSjUufwoeD5cU+LBWRxqTjiJH101E6dTd3gVzgmMmtK58WMi8tmDd+mVB21AmMC
         26jmrpI4LIUFW0dI+ZsdH8Q1mmDOZStyy22dGfVi5SFBwBXnx+9b+4YGdwabSu5izF+q
         g2z+T9DJKp1MlZMjk0NZ8IU8ALfdq3ChwuVCiDhpkJSFWVd6XkgBm3fIsgaiReytTE46
         +rc+yBbEdFNNpEPaDtJ8Zfjhx9UiBauYue5/xd2TiCqtdq8EX05A4ejtJKNoE5aJJhTM
         /THA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=pufhdufTBZ4mSzYNhIa1SU1Zolx0dEUNyE9ky7d08jw=;
        b=pGlJPC2c4GAVBdiH1ct2q8Qu5/scPa/J/BHt1ATsFgqilDv2ZRjLT1excpxR+CRqtn
         TBurcrqRnn+PKEOgX6qgDNBhGuK7U8TM5hGBylvVRepHkUGuF2JZ5pIKK7lhZTN5Ly7z
         fU5+urPUvTPXB9aJJZnXeFOPlen+ngvx3yPsPJVe27AKCJaGrl5yvU8WQw1rV+zS+mAY
         wKngKqCkC+n6hO110ydUJCmcOdqxPrs0EyyQKCs/4BBmn656ZPNTPwdXHhJCHZ7KeqMo
         aole6TRkpyqxQ2SsGNrsmupumvYnEcJeWnHertyf1LVPnDUA+7llqLcJxuINaeZeDeHK
         CEMg==
X-Gm-Message-State: APjAAAXC41F6q3cAcro5upIzQLZA9P0sA5vy+RSXEQIL8F49izX8OUXm
        lO8joH72kwHXd0OfCJlv3AE=
X-Google-Smtp-Source: APXvYqzrv6BigKOuGAiecc+JD92dfDaiQ3Shj7lT0vkeRMJRgmrSt0RVk2kjEFu87HKmvnxxHrbwUw==
X-Received: by 2002:ac2:52a5:: with SMTP id r5mr427632lfm.19.1575315190884;
        Mon, 02 Dec 2019 11:33:10 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:10 -0800 (PST)
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
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Eric Anholt <eric@anholt.net>
Subject: [PATCH v1 04/26] drm: get drm_bridge_panel connector via helper
Date:   Mon,  2 Dec 2019 20:32:08 +0100
Message-Id: <20191202193230.21310-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The drm_connector created by drm_panel_bridge was accessed
via drm_panel.connector.
Avoid the detour around drm_panel by providing a simple get method.
This avoids direct access to the connector field in drm_panel in
the two users.

Update pl111 and tve200 to use the new helper.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Eric Anholt <eric@anholt.net>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/bridge/panel.c      | 16 ++++++++++++++++
 drivers/gpu/drm/pl111/pl111_drv.c   |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c |  2 +-
 include/drm/drm_bridge.h            |  1 +
 4 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index f4e293e7cf64..c5e27b81588a 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -289,3 +289,19 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 	return bridge;
 }
 EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);
+
+/**
+ * drm_panel_bridge_connector - return pointer to connector
+ *
+ * drm_panel_bridge creates the connector.
+ * This function gives external access to the connector.
+ *
+ * Returns: Pointer to drm_conneector
+ */
+struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
+{
+	struct panel_bridge * panel_bridge;
+	panel_bridge = drm_bridge_to_panel_bridge(bridge);
+
+	return &panel_bridge->connector;
+}
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 63dfcda04147..aa8aa8d9e405 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -166,7 +166,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 	priv->bridge = bridge;
 	if (panel) {
 		priv->panel = panel;
-		priv->connector = panel->connector;
+		priv->connector = drm_panel_bridge_connector(bridge);
 	}
 
 	ret = pl111_display_init(dev);
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 954b09c948eb..00ba9e5ce130 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -110,7 +110,7 @@ static int tve200_modeset_init(struct drm_device *dev)
 	}
 
 	priv->panel = panel;
-	priv->connector = panel->connector;
+	priv->connector = drm_panel_bridge_connector(bridge);
 	priv->bridge = bridge;
 
 	dev_info(dev->dev, "attached to panel %s\n",
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index c0a2286a81e9..9a4902accfe5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -438,6 +438,7 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 						   struct drm_panel *panel,
 						   u32 connector_type);
+struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
 #endif
 
 #endif
-- 
2.20.1

