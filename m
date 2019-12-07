Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A97CA115C76
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfLGOET (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:19 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35249 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfLGOET (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:19 -0500
Received: by mail-lj1-f193.google.com with SMTP id j6so10736842lja.2;
        Sat, 07 Dec 2019 06:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gDEv0RS9u1sLbcP7aKD5NbZuatHNrJrYBV8mFE5d35g=;
        b=kStv8JKNews1ASDw7z7ddDiOlhdDEBCUGAHaTsm2tqKG4s4k0usHJl0qikxyLF9l9i
         b+pAsI3DhJaJ4XzVpar+XAqSpOTNRuZt5OzO/ynvbcmOcibfSycfMibvGO8KC0Racviq
         WDgEemyCuEarftv/+KvkNawtDborBcOYRqnGjIv5g1chot9s2DDqXvAJ/i8SLatpn3gu
         /befl/LXxlDAYDEaCocPaBINxBC+2eQ9QuiKj0lqbRFuYFoMycJZb4CpUXGuURBnuJ8D
         Mp0RLVdvzCvOakf/ZYceQr9QM6xIbMwxYbXvZbnsuwdSKukz28Dn1/CgjJC0NItO/h1P
         +fjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=gDEv0RS9u1sLbcP7aKD5NbZuatHNrJrYBV8mFE5d35g=;
        b=Fk0GxKDLVPAFJjp83i9OVp94hWvK/M3Zo4fC3pQcfwjhwQrPc1PkHYyyuOtp3s7JJL
         IyzeHnq7of+T7uikrdIOv/kF3+440EuHmOyFIwHE702CzvJWJFL/yyTgyKWBv3su1u9i
         HsotTN3mebIabC5NF4Zawfohvyd1eecvfv3fOHLieqR4vpyg5aCaPyagDHhIlWAVxTMu
         XX0Xk3ksqDHOSBPEOSwiwEtOb/1EiyOHPh4LJfV5f3j5iTglt4RfhGnAF6ZvescPCmKQ
         5Qnc9JWqvsKNJcLd3MRRRX3cKiw4myjcl2cGrLC+xEyqTfneXM4CJVa6v5MIgtMSKVFM
         kyaQ==
X-Gm-Message-State: APjAAAVfzAbN+j7+kiL53D4O7aI8duDDpr8+GwnbworY/9dNVnXcZc43
        5mQWatTJalqQIXzieS/rWi8=
X-Google-Smtp-Source: APXvYqzZ+jdskQadQ/ngsbumGhCcPqqfliYALT5+d2ISdCnkwPth2IL1jzPJ+7K6rUHJWF2qX8vUWw==
X-Received: by 2002:a05:651c:1110:: with SMTP id d16mr11870528ljo.86.1575727455771;
        Sat, 07 Dec 2019 06:04:15 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:15 -0800 (PST)
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
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 04/25] drm: get drm_bridge_panel connector via helper
Date:   Sat,  7 Dec 2019 15:03:32 +0100
Message-Id: <20191207140353.23967-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
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

The change is done in preparation for removal of drm_panel.connector.

Update pl111 and tve200 to use the new helper.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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
 drivers/gpu/drm/bridge/panel.c      | 17 +++++++++++++++++
 drivers/gpu/drm/pl111/pl111_drv.c   |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c |  2 +-
 include/drm/drm_bridge.h            |  1 +
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index f4e293e7cf64..554da47f6d62 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -289,3 +289,20 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 	return bridge;
 }
 EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);
+
+/**
+ * drm_panel_bridge_connector - return the connector for the panel bridge
+ *
+ * drm_panel_bridge creates the connector.
+ * This function gives external access to the connector.
+ *
+ * Returns: Pointer to drm_connector
+ */
+struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
+{
+	struct panel_bridge *panel_bridge;
+
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

