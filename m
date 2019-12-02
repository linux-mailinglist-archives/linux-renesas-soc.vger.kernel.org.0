Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18F8410F00C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbfLBTdK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:33:10 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42914 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbfLBTdK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:10 -0500
Received: by mail-lj1-f196.google.com with SMTP id e28so798494ljo.9;
        Mon, 02 Dec 2019 11:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kQQWTzPxFOvUW0DGcl4YpgZWZHH+8BFvj48Hp2FKfa8=;
        b=P7qfmJB7gvDRX9cK4SwTcYkfCK+h7HfN6dil8iCxOUJpUAmm2axESYkmf6IUXBX3Uq
         WcmlNpE+pVguPwT3omJfvN4fWDZrMuwuXEfiWzGRCml/b3t3ZWCkG9cu3t157dFuaOZ4
         knqGQ/aw7yV6rIykXAsY3sKhFeY0GXLkogBkJISKrtaz0Sg96uheXMKaETsEE+NqE9IT
         ZdhniU0NKn8/PWLne5hKZW5BgXUi5yRzYPX6+vg4Ld9cFLnyLSViVJjpseH9TI5H5NnG
         s3acjDx6kOTjbCM4IaA1oKdjgaptx3ddRgMYzaOgdb/V3KEUtBt6imN+MtGr+WV3pNPE
         w16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=kQQWTzPxFOvUW0DGcl4YpgZWZHH+8BFvj48Hp2FKfa8=;
        b=Ila2nrzMGiomJsOiIeK2bl9sLRedoaUTbbI3I/2vbgbMh3EOqemmdklRL8YoDzGwdy
         B2MSPyxpa3AEF26FGV+QUf631j9Q/ZL5sFYH1jitngwK4jo1HR6n2lEJyN/nKFkTyUjw
         x5C6vlCEZeFweSkU8yF9uAayApEZ/IrdSUHANfDWjIhomzNPRhP2W1qR3koPYrHWO4+N
         lzbnIS3ynxMpXDEAg6bHd47MquPaCpL9nL8Gdf+7NzVXWH62e2wGIpLS9w54BVRx+Qdq
         ENZLjoG2pWRhRLZib4LmtXeJymGmZoRWwqKjiv6xviU9F5oK2WFyXB3c+w/enx9gobC2
         Wgkw==
X-Gm-Message-State: APjAAAV5gMnXnCYZiFxx1uSFPBsvSLYTgpPwW9CLYz6K6hLTpsrOXeeY
        dY7/3NQO2OghfWpGdmxCvSw=
X-Google-Smtp-Source: APXvYqwYpJfjizEaD5IBDV4xc3cEeqEstQeeKZaXT9Z/vSBZFIXZ28HzUNDZprk6Zlxob1NmomY5yg==
X-Received: by 2002:a2e:7202:: with SMTP id n2mr243436ljc.194.1575315187338;
        Mon, 02 Dec 2019 11:33:07 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:06 -0800 (PST)
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
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v1 02/26] drm/panel: add backlight support
Date:   Mon,  2 Dec 2019 20:32:06 +0100
Message-Id: <20191202193230.21310-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Panels often supports backlight as specified in a device tree.
Update the drm_panel infrastructure to support this to
simplify the drivers.

With this the panel driver just needs to add the following to the
probe() function:

    err = drm_panel_of_backlight(panel);
    if (err)
            return err;

Then drm_panel will handle all the rest.

v2:
- Drop test of CONFIG_DRM_PANEL in header-file (Laurent)
- do not enable backlight if ->enable() returns an error

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_panel.c | 49 +++++++++++++++++++++++++++++++++++--
 include/drm/drm_panel.h     | 23 +++++++++++++++++
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 2d59cdd05e50..35609c90e467 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/backlight.h>
 #include <linux/err.h>
 #include <linux/module.h>
 
@@ -196,13 +197,18 @@ EXPORT_SYMBOL(drm_panel_unprepare);
  */
 int drm_panel_enable(struct drm_panel *panel)
 {
+	int ret = 0;
+
 	if (!panel)
 		return -EINVAL;
 
 	if (panel->funcs && panel->funcs->enable)
-		return panel->funcs->enable(panel);
+		ret = panel->funcs->enable(panel);
 
-	return 0;
+	if (ret >= 0)
+		backlight_enable(panel->backlight);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_panel_enable);
 
@@ -221,6 +227,8 @@ int drm_panel_disable(struct drm_panel *panel)
 	if (!panel)
 		return -EINVAL;
 
+	backlight_disable(panel->backlight);
+
 	if (panel->funcs && panel->funcs->disable)
 		return panel->funcs->disable(panel);
 
@@ -289,6 +297,43 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_panel);
 #endif
 
+#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
+/**
+ * drm_panel_of_backlight - use backlight device node for backlight
+ * @panel: DRM panel
+ *
+ * Use this function to enable backlight handling if your panel
+ * uses device tree and has a backlight handle.
+ *
+ * When panel is enabled backlight will be enabled after a
+ * successfull call to &drm_panel_funcs.enable()
+ *
+ * When panel is disabled backlight will be disabled before the
+ * call to &drm_panel_funcs.disable().
+ *
+ * A typical implementation for a panel driver supporting device tree
+ * will call this function and then backlight just works.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_of_backlight(struct drm_panel *panel)
+{
+	struct backlight_device *backlight;
+
+	if (!panel || !panel->dev)
+		return -EINVAL;
+
+	backlight = devm_of_find_backlight(panel->dev);
+
+	if (IS_ERR(backlight))
+                return PTR_ERR(backlight);
+
+	panel->backlight = backlight;
+	return 0;
+}
+EXPORT_SYMBOL(drm_panel_of_backlight);
+#endif
+
 MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
 MODULE_DESCRIPTION("DRM panel infrastructure");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index ce8da64022b4..d30c98567384 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -28,6 +28,7 @@
 #include <linux/errno.h>
 #include <linux/list.h>
 
+struct backlight_device;
 struct device_node;
 struct drm_connector;
 struct drm_device;
@@ -59,6 +60,10 @@ struct display_timing;
  *
  * To save power when no video data is transmitted, a driver can power down
  * the panel. This is the job of the .unprepare() function.
+ *
+ * Backlight can be handled automatically if configured using
+ * drm_panel_of_backlight(). Then the driver do not need to implement the
+ * functionality to enable/disable backlight.
  */
 struct drm_panel_funcs {
 	/**
@@ -132,6 +137,15 @@ struct drm_panel {
 	 */
 	struct device *dev;
 
+	/**
+	 * @backlight:
+	 *
+	 * Backlight device, used to turn on backlight after
+	 * the call to enable(), and to turn off
+	 * backlight before call to disable().
+	 */
+	struct backlight_device *backlight;
+
 	/**
 	 * @funcs:
 	 *
@@ -183,4 +197,13 @@ static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
+int drm_panel_of_backlight(struct drm_panel *panel);
+#else
+static inline int drm_panel_of_backlight(struct drm_panel *panel)
+{
+	return -EINVAL;
+}
+#endif
+
 #endif
-- 
2.20.1

