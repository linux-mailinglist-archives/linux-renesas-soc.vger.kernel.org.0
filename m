Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9220AFB431
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 16:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbfKMPwH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 10:52:07 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:21771 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728002AbfKMPwH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 10:52:07 -0500
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; 
   d="scan'208";a="31593920"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:06 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CBC4B400ED5C;
        Thu, 14 Nov 2019 00:52:01 +0900 (JST)
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
Subject: [PATCH v4 05/13] drm/bridge: Repurpose lvds-encoder.c
Date:   Wed, 13 Nov 2019 15:51:24 +0000
Message-Id: <1573660292-10629-6-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

lvds-encoder.c implementation is also suitable for LVDS decoders,
not just LVDS encoders.
Instead of creating a new driver for addressing support for
transparent LVDS decoders, repurpose lvds-encoder.c for the greater
good with this patch.

This patch only "rebrands" the lvds-encoder.c driver, to make it
suitable for hosting LVDS decoders support. The actual support for
LVDS decoders will come with a later patch.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v3->v4:
* The patch now only renames the driver (with related data structures
  and build options), changes the description of the module, and
  refreshes the copyright
v2->v3:
* No change
v1->v2:
* No change
---
 drivers/gpu/drm/bridge/Kconfig                     |  8 +-
 drivers/gpu/drm/bridge/Makefile                    |  2 +-
 .../drm/bridge/{lvds-encoder.c => lvds-codec.c}    | 97 +++++++++++-----------
 3 files changed, 53 insertions(+), 54 deletions(-)
 rename drivers/gpu/drm/bridge/{lvds-encoder.c => lvds-codec.c} (45%)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 3436297..fbbea46 100644
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
+	  Support for transparent LVDS encoders and decoders that don't
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
diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-codec.c
similarity index 45%
rename from drivers/gpu/drm/bridge/lvds-encoder.c
rename to drivers/gpu/drm/bridge/lvds-codec.c
index e2132a8..b5801a2 100644
--- a/drivers/gpu/drm/bridge/lvds-encoder.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (C) 2019 Renesas Electronics Corporation
  * Copyright (C) 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
@@ -12,65 +13,62 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_panel.h>
 
-struct lvds_encoder {
+struct lvds_codec {
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
 	struct gpio_desc *powerdown_gpio;
 };
 
-static int lvds_encoder_attach(struct drm_bridge *bridge)
+static int lvds_codec_attach(struct drm_bridge *bridge)
 {
-	struct lvds_encoder *lvds_encoder = container_of(bridge,
-							 struct lvds_encoder,
-							 bridge);
+	struct lvds_codec *lvds_codec = container_of(bridge,
+						     struct lvds_codec, bridge);
 
-	return drm_bridge_attach(bridge->encoder, lvds_encoder->panel_bridge,
+	return drm_bridge_attach(bridge->encoder, lvds_codec->panel_bridge,
 				 bridge);
 }
 
-static void lvds_encoder_enable(struct drm_bridge *bridge)
+static void lvds_codec_enable(struct drm_bridge *bridge)
 {
-	struct lvds_encoder *lvds_encoder = container_of(bridge,
-							 struct lvds_encoder,
-							 bridge);
+	struct lvds_codec *lvds_codec = container_of(bridge,
+						     struct lvds_codec, bridge);
 
-	if (lvds_encoder->powerdown_gpio)
-		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 0);
+	if (lvds_codec->powerdown_gpio)
+		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 0);
 }
 
-static void lvds_encoder_disable(struct drm_bridge *bridge)
+static void lvds_codec_disable(struct drm_bridge *bridge)
 {
-	struct lvds_encoder *lvds_encoder = container_of(bridge,
-							 struct lvds_encoder,
-							 bridge);
+	struct lvds_codec *lvds_codec = container_of(bridge,
+						     struct lvds_codec, bridge);
 
-	if (lvds_encoder->powerdown_gpio)
-		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 1);
+	if (lvds_codec->powerdown_gpio)
+		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
 }
 
 static struct drm_bridge_funcs funcs = {
-	.attach = lvds_encoder_attach,
-	.enable = lvds_encoder_enable,
-	.disable = lvds_encoder_disable,
+	.attach = lvds_codec_attach,
+	.enable = lvds_codec_enable,
+	.disable = lvds_codec_disable,
 };
 
-static int lvds_encoder_probe(struct platform_device *pdev)
+static int lvds_codec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *port;
 	struct device_node *endpoint;
 	struct device_node *panel_node;
 	struct drm_panel *panel;
-	struct lvds_encoder *lvds_encoder;
+	struct lvds_codec *lvds_codec;
 
-	lvds_encoder = devm_kzalloc(dev, sizeof(*lvds_encoder), GFP_KERNEL);
-	if (!lvds_encoder)
+	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
+	if (!lvds_codec)
 		return -ENOMEM;
 
-	lvds_encoder->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
-							       GPIOD_OUT_HIGH);
-	if (IS_ERR(lvds_encoder->powerdown_gpio)) {
-		int err = PTR_ERR(lvds_encoder->powerdown_gpio);
+	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
+							     GPIOD_OUT_HIGH);
+	if (IS_ERR(lvds_codec->powerdown_gpio)) {
+		int err = PTR_ERR(lvds_codec->powerdown_gpio);
 
 		if (err != -EPROBE_DEFER)
 			dev_err(dev, "powerdown GPIO failure: %d\n", err);
@@ -105,51 +103,52 @@ static int lvds_encoder_probe(struct platform_device *pdev)
 		return PTR_ERR(panel);
 	}
 
-	lvds_encoder->panel_bridge =
+	lvds_codec->panel_bridge =
 		devm_drm_panel_bridge_add_typed(dev, panel,
 						DRM_MODE_CONNECTOR_LVDS);
-	if (IS_ERR(lvds_encoder->panel_bridge))
-		return PTR_ERR(lvds_encoder->panel_bridge);
+	if (IS_ERR(lvds_codec->panel_bridge))
+		return PTR_ERR(lvds_codec->panel_bridge);
 
-	/* The panel_bridge bridge is attached to the panel's of_node,
+	/*
+	 * The panel_bridge bridge is attached to the panel's of_node,
 	 * but we need a bridge attached to our of_node for our user
 	 * to look up.
 	 */
-	lvds_encoder->bridge.of_node = dev->of_node;
-	lvds_encoder->bridge.funcs = &funcs;
-	drm_bridge_add(&lvds_encoder->bridge);
+	lvds_codec->bridge.of_node = dev->of_node;
+	lvds_codec->bridge.funcs = &funcs;
+	drm_bridge_add(&lvds_codec->bridge);
 
-	platform_set_drvdata(pdev, lvds_encoder);
+	platform_set_drvdata(pdev, lvds_codec);
 
 	return 0;
 }
 
-static int lvds_encoder_remove(struct platform_device *pdev)
+static int lvds_codec_remove(struct platform_device *pdev)
 {
-	struct lvds_encoder *lvds_encoder = platform_get_drvdata(pdev);
+	struct lvds_codec *lvds_codec = platform_get_drvdata(pdev);
 
-	drm_bridge_remove(&lvds_encoder->bridge);
+	drm_bridge_remove(&lvds_codec->bridge);
 
 	return 0;
 }
 
-static const struct of_device_id lvds_encoder_match[] = {
+static const struct of_device_id lvds_codec_match[] = {
 	{ .compatible = "lvds-encoder" },
 	{ .compatible = "thine,thc63lvdm83d" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, lvds_encoder_match);
+MODULE_DEVICE_TABLE(of, lvds_codec_match);
 
-static struct platform_driver lvds_encoder_driver = {
-	.probe	= lvds_encoder_probe,
-	.remove	= lvds_encoder_remove,
+static struct platform_driver lvds_codec_driver = {
+	.probe	= lvds_codec_probe,
+	.remove	= lvds_codec_remove,
 	.driver		= {
-		.name		= "lvds-encoder",
-		.of_match_table	= lvds_encoder_match,
+		.name		= "lvds-codec",
+		.of_match_table	= lvds_codec_match,
 	},
 };
-module_platform_driver(lvds_encoder_driver);
+module_platform_driver(lvds_codec_driver);
 
 MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
-MODULE_DESCRIPTION("Transparent parallel to LVDS encoder");
+MODULE_DESCRIPTION("LVDS encoders and decoders");
 MODULE_LICENSE("GPL");
-- 
2.7.4

