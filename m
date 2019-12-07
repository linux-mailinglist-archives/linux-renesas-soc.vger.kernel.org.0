Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85DD7115C98
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfLGOEg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:36 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43545 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfLGOEf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:35 -0500
Received: by mail-lf1-f65.google.com with SMTP id 9so7397647lfq.10;
        Sat, 07 Dec 2019 06:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=66uC10NTDsBRb7X6vStnogHiILcbdjND8PJjJ30cYbk=;
        b=eXo50RX1awgOgNqXA1euoTjADMDxJIIFt7Pu3nB1qA9kL/D53Wde7x1V7fPKl2ER6f
         mKPD6elw1ZuMST7wwxBb3iv3VN9n4mHUZuCyvBBdvRZ+zO9nzDUfgM+nr89reyidFjk2
         5bl5lEnsZ5a+YLW/5u7sk+EqFefyVyztWmjYqKsrM0j+3Hu9JYA32AFZOHg/zXqQEhil
         EaIetBjkLamIOXtQH7Ef+AHxOdglN5O/sqEFpPCFljHdlSqIYsq3aggg2FUtPigLHmwG
         Qwnhq8a1y98GH4vItHdyUv4SzuVygkRRme4IlJZiEXPhgPjwJOXY5+RKh3KzTEoOj3Oe
         uylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=66uC10NTDsBRb7X6vStnogHiILcbdjND8PJjJ30cYbk=;
        b=dgt49aLqQDnIN1WNdCM9h5ZkF8nUOmnKUBECeyTsbba6EovVnRNc7UROYb2oY9/OfB
         JzH64YZJMfhxzHJbF2YiuaAWDT4MIOfdfOiJZ1EWiMmv+IwUjG3JKrE/6Y3ffWOe4mPA
         JdDVephxqBH8DFY12M8leOOii9u5ZrV8xBxJgcAdCMEm9fmso/6S0W1vVI8OYkLtZ3L8
         YnnQiFqkGP1MSaM6IaAdLE/i4qvNMr3RhN59g3lGuAis0V9MjFB2H9/3tP0Lg+/ayjvZ
         60lJYsPsQZlcl5WhJu+j5gLbXOkRUEhnr/MgVYEfKEr35htolY7kX8ZQ4X6h2/5EGQML
         z6/Q==
X-Gm-Message-State: APjAAAVkj/xpikuxgAhw2geQMIsuKka3Uc5zckmKE3aY0MQSArvgfg1w
        Ko2DQyoKD000p1Ohxa+WaV4=
X-Google-Smtp-Source: APXvYqxVNVpfDn6H4MM9EgRQ26sPL400SlH6382v5r0u3Jj20zEKSwiT5FQB/2Gog+qGIuLc4xC8dA==
X-Received: by 2002:a19:550a:: with SMTP id n10mr10813033lfe.104.1575727473305;
        Sat, 07 Dec 2019 06:04:33 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:32 -0800 (PST)
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
        Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH v2 13/25] drm/panel: olimex-lcd-olinuxino: use drm_panel backlight support
Date:   Sat,  7 Dec 2019 15:03:41 +0100
Message-Id: <20191207140353.23967-14-sam@ravnborg.org>
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
Cc: Stefan Mavrodiev <stefan@olimex.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/panel/panel-olimex-lcd-olinuxino.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index e553e584399b..09deb99981a4 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -6,7 +6,6 @@
  *   Author: Stefan Mavrodiev <stefan@olimex.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/crc32.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -68,7 +67,6 @@ struct lcd_olinuxino {
 	bool prepared;
 	bool enabled;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 	struct gpio_desc *enable_gpio;
 
@@ -87,8 +85,6 @@ static int lcd_olinuxino_disable(struct drm_panel *panel)
 	if (!lcd->enabled)
 		return 0;
 
-	backlight_disable(lcd->backlight);
-
 	lcd->enabled = false;
 
 	return 0;
@@ -134,8 +130,6 @@ static int lcd_olinuxino_enable(struct drm_panel *panel)
 	if (lcd->enabled)
 		return 0;
 
-	backlight_enable(lcd->backlight);
-
 	lcd->enabled = true;
 
 	return 0;
@@ -283,13 +277,13 @@ static int lcd_olinuxino_probe(struct i2c_client *client,
 	if (IS_ERR(lcd->enable_gpio))
 		return PTR_ERR(lcd->enable_gpio);
 
-	lcd->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(lcd->backlight))
-		return PTR_ERR(lcd->backlight);
-
 	drm_panel_init(&lcd->panel, dev, &lcd_olinuxino_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
 
+	ret = drm_panel_of_backlight(&lcd->panel);
+	if (ret)
+		return ret;
+
 	return drm_panel_add(&lcd->panel);
 }
 
@@ -299,8 +293,8 @@ static int lcd_olinuxino_remove(struct i2c_client *client)
 
 	drm_panel_remove(&panel->panel);
 
-	lcd_olinuxino_disable(&panel->panel);
-	lcd_olinuxino_unprepare(&panel->panel);
+	drm_panel_disable(&panel->panel);
+	drm_panel_unprepare(&panel->panel);
 
 	return 0;
 }
-- 
2.20.1

