Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83984115C71
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2019 15:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfLGOEP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Dec 2019 09:04:15 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34724 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfLGOEP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Dec 2019 09:04:15 -0500
Received: by mail-lf1-f65.google.com with SMTP id l18so7432300lfc.1;
        Sat, 07 Dec 2019 06:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IAuPLO1NXXX2GjlvTopVslbL6mzsD4aerKxWopEcOV0=;
        b=JNdIVTzd6hQQR40rf18YTN5f5Q4Fe4/2lb99BbqbpfnGZU2hooEMtpBwrqswQgbwH2
         l5ZdY3rh5F+K8ww1hsp2bIC0eVB+FviQ+SQHIkoIZyirWeskQD/aUi+YsUgSOLXCdW7k
         XaHFzu8l1uWmE7zrcMkyE24irdFrvx8CRWH/7OEN6MnIVxM7opSCoVZJOrE5B7XyUTc6
         +/JDRgydJj91C3F69+BuQF4vm3gIkIEYeONJIetsChdLXbwFqbRw4UEjw7GzJmuV8815
         DAv5H9f+AezQ+Jhlp930lnBdD0Bt4uQ95sDaoPrxl/gyiTe/PO1xsMDUEz8fKDhvG680
         ixSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=IAuPLO1NXXX2GjlvTopVslbL6mzsD4aerKxWopEcOV0=;
        b=AEe2P7wlT13VNb66tfp5WHfPDvSx+T1o5YOiu30rq7g0E7Qdws4L7HRmbOlrZKzEHx
         MdsqsXNRDfo+VhFlH8ijIXxP0RWmgsvE+da88io5svonUeNnMhIh6zw7aA68ttdBLTQP
         x9Z5kDB7twHh6ap/+dq5GHrKhp69DCzh4iHqS8/qHB9/nFiTG7Mir3WcdPP4783Wn9Fm
         9hGD9iex+hSpsD3Y2gpXoxqcHfWu7PhLmxEOc9oBQrwQ+7oU955cjnkYoId6JwqQhtyJ
         PC8jUFzU6/ynuKJic/Y6PVmLbIqRLjG7RXXt5SYYsXgSlm/qSO8IGns3mNeuj7AdMTZ7
         xzpA==
X-Gm-Message-State: APjAAAWaD2Yxz8EDZjceink9BBNYoHMlmutxi0BPuoeYiaexogdQ2cQ5
        UPosbnAApa/vZrEfxDGmumA=
X-Google-Smtp-Source: APXvYqxmrzRpkskz4b2beRWGwblJ8U53QdScC/djuvK/AuxHBlhrUpqau4y6mRBIbKrsHRxbDv56yw==
X-Received: by 2002:ac2:4436:: with SMTP id w22mr10814360lfl.185.1575727452027;
        Sat, 07 Dec 2019 06:04:12 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id w17sm5644188lfn.22.2019.12.07.06.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 06:04:11 -0800 (PST)
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
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v2 02/25] drm/panel: add backlight support
Date:   Sat,  7 Dec 2019 15:03:30 +0100
Message-Id: <20191207140353.23967-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
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

There is one caveat with the backlight support.
If drm_panel_(enable|disable) are called multiple times
in row then backlight_(enable|disable) will be called multiple times.

The above will happen when a panel drivers unconditionally
calls drm_panel_disable() in their shutdown() function,
whan the panel is already disabled and then shutdown() is called.

Reading the backlight code it seems safe to call
the backlight_(enable|disable) several times.

v3:
- Improve comments, fix grammar (Laurent)
- Do not fail in drm_panel_of_backlight() if no DT support (Laurent)
- Log if backlight_(enable|disable) fails (Laurent)
- Improve drm_panel_of_backlight() docs
- Updated changelog with backlight analysis (triggered by Laurent)

v2:
- Drop test of CONFIG_DRM_PANEL in header-file (Laurent)
- do not enable backlight if ->enable() returns an error

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_panel.c | 58 ++++++++++++++++++++++++++++++++++++-
 include/drm/drm_panel.h     | 25 ++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 4ab7229fb22b..c312d5eb214d 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -21,11 +21,13 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/backlight.h>
 #include <linux/err.h>
 #include <linux/module.h>
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 
 static DEFINE_MUTEX(panel_lock);
 static LIST_HEAD(panel_list);
@@ -196,11 +198,20 @@ EXPORT_SYMBOL(drm_panel_unprepare);
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
+
+	if (ret < 0)
+		return ret;
+
+	ret = backlight_enable(panel->backlight);
+	if (ret < 0)
+		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n", ret);
 
 	return 0;
 }
@@ -218,9 +229,15 @@ EXPORT_SYMBOL(drm_panel_enable);
  */
 int drm_panel_disable(struct drm_panel *panel)
 {
+	int ret;
+
 	if (!panel)
 		return -EINVAL;
 
+	ret = backlight_disable(panel->backlight);
+	if (ret < 0)
+		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n", ret);
+
 	if (panel->funcs && panel->funcs->disable)
 		return panel->funcs->disable(panel);
 
@@ -289,6 +306,45 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_panel);
 #endif
 
+#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
+/**
+ * drm_panel_of_backlight - use backlight device node for backlight
+ * @panel: DRM panel
+ *
+ * Use this function to enable backlight handling if your panel
+ * uses device tree and has a backlight phandle.
+ *
+ * When the panel is enabled backlight will be enabled after a
+ * successfull call to &drm_panel_funcs.enable()
+ *
+ * When the panel is disabled backlight will be disabled before the
+ * call to &drm_panel_funcs.disable().
+ *
+ * A typical implementation for a panel driver supporting device tree
+ * will call this function at probe time. Backlight will then be handled
+ * transparently without requiring any intervention from the driver.
+ * drm_panel_of_backlight() must be called after the call to drm_panel_init().
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
index d71655b2634c..c751c9b17df0 100644
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
+ * drm_panel_of_backlight(). Then the driver does not need to implement the
+ * functionality to enable/disable backlight.
  */
 struct drm_panel_funcs {
 	/**
@@ -146,6 +151,17 @@ struct drm_panel {
 	 */
 	struct device *dev;
 
+	/**
+	 * @backlight:
+	 *
+	 * Backlight device, used to turn on backlight after the call
+	 * to enable(), and to turn off backlight before the call to
+	 * disable().
+	 * backlight is set by drm_panel_of_backlight() and drivers
+	 * shall not assign it.
+	 */
+	struct backlight_device *backlight;
+
 	/**
 	 * @funcs:
 	 *
@@ -197,4 +213,13 @@ static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
+int drm_panel_of_backlight(struct drm_panel *panel);
+#else
+static inline int drm_panel_of_backlight(struct drm_panel *panel)
+{
+	return 0;
+}
+#endif
+
 #endif
-- 
2.20.1

