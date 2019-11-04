Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 239BDEE554
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2019 17:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfKDQ6S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Nov 2019 11:58:18 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:23786 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728174AbfKDQ6S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Nov 2019 11:58:18 -0500
X-IronPort-AV: E=Sophos;i="5.68,267,1569250800"; 
   d="scan'208";a="30581906"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Nov 2019 01:58:17 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 530BB4005E08;
        Tue,  5 Nov 2019 01:58:13 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 1/4] drm/bridge: Repurpose lvds-encoder.c
Date:   Mon,  4 Nov 2019 16:58:00 +0000
Message-Id: <1572886683-4919-2-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

lvds-encoder.c implementation is also suitable for LVDS decoders,
not just LVDS encoders.
Instead of creating a new driver for addressing support for
transparent LVDS decoders, repurpose lvds-encoder.c for the greater
good.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v1->v2:
* No change
---
 drivers/gpu/drm/bridge/Kconfig        |   8 +-
 drivers/gpu/drm/bridge/Makefile       |   2 +-
 drivers/gpu/drm/bridge/lvds-codec.c   | 169 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/bridge/lvds-encoder.c | 155 -------------------------------
 4 files changed, 174 insertions(+), 160 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/lvds-codec.c
 delete mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 3436297..9e75ca4e 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -45,14 +45,14 @@ config DRM_DUMB_VGA_DAC
 	  Support for non-programmable RGB to VGA DAC bridges, such as ADI
 	  ADV7123, TI THS8134 and THS8135 or passive resistor ladder DACs.
 
-config DRM_LVDS_ENCODER
-	tristate "Transparent parallel to LVDS encoder support"
+config DRM_LVDS_CODEC
+	tristate "Transparent LVDS encoders and decoders support"
 	depends on OF
 	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
 	help
-	  Support for transparent parallel to LVDS encoders that don't require
-	  any configuration.
+	  Support for transparent LVDS encoders and LVDS decoders that don't
+	  require any configuration.
 
 config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
 	tristate "MegaChips stdp4028-ge-b850v3-fw and stdp2690-ge-b850v3-fw"
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 4934fcf..8a9178a 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -2,7 +2,7 @@
 obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
-obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
+obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
 obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
new file mode 100644
index 0000000..8a1979c
--- /dev/null
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_panel.h>
+
+struct lvds_codec {
+	struct drm_bridge bridge;
+	struct drm_bridge *panel_bridge;
+	struct gpio_desc *powerdown_gpio;
+	u32 connector_type;
+};
+
+static int lvds_codec_attach(struct drm_bridge *bridge)
+{
+	struct lvds_codec *lvds_codec = container_of(bridge,
+							 struct lvds_codec,
+							 bridge);
+
+	return drm_bridge_attach(bridge->encoder, lvds_codec->panel_bridge,
+				 bridge);
+}
+
+static void lvds_codec_enable(struct drm_bridge *bridge)
+{
+	struct lvds_codec *lvds_codec = container_of(bridge,
+							 struct lvds_codec,
+							 bridge);
+
+	if (lvds_codec->powerdown_gpio)
+		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 0);
+}
+
+static void lvds_codec_disable(struct drm_bridge *bridge)
+{
+	struct lvds_codec *lvds_codec = container_of(bridge,
+							 struct lvds_codec,
+							 bridge);
+
+	if (lvds_codec->powerdown_gpio)
+		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
+}
+
+static struct drm_bridge_funcs funcs = {
+	.attach = lvds_codec_attach,
+	.enable = lvds_codec_enable,
+	.disable = lvds_codec_disable,
+};
+
+static int lvds_codec_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *port;
+	struct device_node *endpoint;
+	struct device_node *panel_node;
+	struct drm_panel *panel;
+	struct lvds_codec *lvds_codec;
+
+	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
+	if (!lvds_codec)
+		return -ENOMEM;
+
+	lvds_codec->connector_type = (u32)
+		of_device_get_match_data(&pdev->dev);
+	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
+							       GPIOD_OUT_HIGH);
+	if (IS_ERR(lvds_codec->powerdown_gpio)) {
+		int err = PTR_ERR(lvds_codec->powerdown_gpio);
+
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "powerdown GPIO failure: %d\n", err);
+		return err;
+	}
+
+	/* Locate the panel DT node. */
+	port = of_graph_get_port_by_id(dev->of_node, 1);
+	if (!port) {
+		dev_dbg(dev, "port 1 not found\n");
+		return -ENXIO;
+	}
+
+	endpoint = of_get_child_by_name(port, "endpoint");
+	of_node_put(port);
+	if (!endpoint) {
+		dev_dbg(dev, "no endpoint for port 1\n");
+		return -ENXIO;
+	}
+
+	panel_node = of_graph_get_remote_port_parent(endpoint);
+	of_node_put(endpoint);
+	if (!panel_node) {
+		dev_dbg(dev, "no remote endpoint for port 1\n");
+		return -ENXIO;
+	}
+
+	panel = of_drm_find_panel(panel_node);
+	of_node_put(panel_node);
+	if (IS_ERR(panel)) {
+		dev_dbg(dev, "panel not found, deferring probe\n");
+		return PTR_ERR(panel);
+	}
+
+	lvds_codec->panel_bridge =
+		devm_drm_panel_bridge_add_typed(dev, panel,
+						lvds_codec->connector_type);
+	if (IS_ERR(lvds_codec->panel_bridge))
+		return PTR_ERR(lvds_codec->panel_bridge);
+
+	/* The panel_bridge bridge is attached to the panel's of_node,
+	 * but we need a bridge attached to our of_node for our user
+	 * to look up.
+	 */
+	lvds_codec->bridge.of_node = dev->of_node;
+	lvds_codec->bridge.funcs = &funcs;
+	drm_bridge_add(&lvds_codec->bridge);
+
+	platform_set_drvdata(pdev, lvds_codec);
+
+	return 0;
+}
+
+static int lvds_codec_remove(struct platform_device *pdev)
+{
+	struct lvds_codec *lvds_codec = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&lvds_codec->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id lvds_codec_match[] = {
+	{
+		.compatible = "lvds-encoder",
+		.data = (void *)DRM_MODE_CONNECTOR_LVDS
+	},
+	{
+		.compatible = "thine,thc63lvdm83d",
+		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
+	},
+	{
+		.compatible = "lvds-decoder",
+		.data = (void *)DRM_MODE_CONNECTOR_Unknown,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, lvds_codec_match);
+
+static struct platform_driver lvds_codec_driver = {
+	.probe	= lvds_codec_probe,
+	.remove	= lvds_codec_remove,
+	.driver		= {
+		.name		= "lvds-codec",
+		.of_match_table	= lvds_codec_match,
+	},
+};
+module_platform_driver(lvds_codec_driver);
+
+MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
+MODULE_DESCRIPTION("Driver for transparent LVDS encoders and LVDS decoders");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
deleted file mode 100644
index e2132a8..0000000
--- a/drivers/gpu/drm/bridge/lvds-encoder.c
+++ /dev/null
@@ -1,155 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- */
-
-#include <linux/gpio/consumer.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_graph.h>
-#include <linux/platform_device.h>
-
-#include <drm/drm_bridge.h>
-#include <drm/drm_panel.h>
-
-struct lvds_encoder {
-	struct drm_bridge bridge;
-	struct drm_bridge *panel_bridge;
-	struct gpio_desc *powerdown_gpio;
-};
-
-static int lvds_encoder_attach(struct drm_bridge *bridge)
-{
-	struct lvds_encoder *lvds_encoder = container_of(bridge,
-							 struct lvds_encoder,
-							 bridge);
-
-	return drm_bridge_attach(bridge->encoder, lvds_encoder->panel_bridge,
-				 bridge);
-}
-
-static void lvds_encoder_enable(struct drm_bridge *bridge)
-{
-	struct lvds_encoder *lvds_encoder = container_of(bridge,
-							 struct lvds_encoder,
-							 bridge);
-
-	if (lvds_encoder->powerdown_gpio)
-		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 0);
-}
-
-static void lvds_encoder_disable(struct drm_bridge *bridge)
-{
-	struct lvds_encoder *lvds_encoder = container_of(bridge,
-							 struct lvds_encoder,
-							 bridge);
-
-	if (lvds_encoder->powerdown_gpio)
-		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 1);
-}
-
-static struct drm_bridge_funcs funcs = {
-	.attach = lvds_encoder_attach,
-	.enable = lvds_encoder_enable,
-	.disable = lvds_encoder_disable,
-};
-
-static int lvds_encoder_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct device_node *port;
-	struct device_node *endpoint;
-	struct device_node *panel_node;
-	struct drm_panel *panel;
-	struct lvds_encoder *lvds_encoder;
-
-	lvds_encoder = devm_kzalloc(dev, sizeof(*lvds_encoder), GFP_KERNEL);
-	if (!lvds_encoder)
-		return -ENOMEM;
-
-	lvds_encoder->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
-							       GPIOD_OUT_HIGH);
-	if (IS_ERR(lvds_encoder->powerdown_gpio)) {
-		int err = PTR_ERR(lvds_encoder->powerdown_gpio);
-
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "powerdown GPIO failure: %d\n", err);
-		return err;
-	}
-
-	/* Locate the panel DT node. */
-	port = of_graph_get_port_by_id(dev->of_node, 1);
-	if (!port) {
-		dev_dbg(dev, "port 1 not found\n");
-		return -ENXIO;
-	}
-
-	endpoint = of_get_child_by_name(port, "endpoint");
-	of_node_put(port);
-	if (!endpoint) {
-		dev_dbg(dev, "no endpoint for port 1\n");
-		return -ENXIO;
-	}
-
-	panel_node = of_graph_get_remote_port_parent(endpoint);
-	of_node_put(endpoint);
-	if (!panel_node) {
-		dev_dbg(dev, "no remote endpoint for port 1\n");
-		return -ENXIO;
-	}
-
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
-	if (IS_ERR(panel)) {
-		dev_dbg(dev, "panel not found, deferring probe\n");
-		return PTR_ERR(panel);
-	}
-
-	lvds_encoder->panel_bridge =
-		devm_drm_panel_bridge_add_typed(dev, panel,
-						DRM_MODE_CONNECTOR_LVDS);
-	if (IS_ERR(lvds_encoder->panel_bridge))
-		return PTR_ERR(lvds_encoder->panel_bridge);
-
-	/* The panel_bridge bridge is attached to the panel's of_node,
-	 * but we need a bridge attached to our of_node for our user
-	 * to look up.
-	 */
-	lvds_encoder->bridge.of_node = dev->of_node;
-	lvds_encoder->bridge.funcs = &funcs;
-	drm_bridge_add(&lvds_encoder->bridge);
-
-	platform_set_drvdata(pdev, lvds_encoder);
-
-	return 0;
-}
-
-static int lvds_encoder_remove(struct platform_device *pdev)
-{
-	struct lvds_encoder *lvds_encoder = platform_get_drvdata(pdev);
-
-	drm_bridge_remove(&lvds_encoder->bridge);
-
-	return 0;
-}
-
-static const struct of_device_id lvds_encoder_match[] = {
-	{ .compatible = "lvds-encoder" },
-	{ .compatible = "thine,thc63lvdm83d" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, lvds_encoder_match);
-
-static struct platform_driver lvds_encoder_driver = {
-	.probe	= lvds_encoder_probe,
-	.remove	= lvds_encoder_remove,
-	.driver		= {
-		.name		= "lvds-encoder",
-		.of_match_table	= lvds_encoder_match,
-	},
-};
-module_platform_driver(lvds_encoder_driver);
-
-MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
-MODULE_DESCRIPTION("Transparent parallel to LVDS encoder");
-MODULE_LICENSE("GPL");
-- 
2.7.4

