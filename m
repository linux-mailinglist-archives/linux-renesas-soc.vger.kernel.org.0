Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C82274012
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Sep 2020 12:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgIVK4J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Sep 2020 06:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIVK4J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 06:56:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330DDC061755
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2020 03:56:09 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14D7A2D7;
        Tue, 22 Sep 2020 12:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600772165;
        bh=eErgGqe2rgkajTOEVNeYkNX3PBv3faxqi44L46D6WLI=;
        h=From:To:Cc:Subject:Date:From;
        b=MZBuipCy8LcJQXjZFYyPVx0MyH8prX4CJc7IGiY+NetFhHQQeokWB3/CQxnx0FWDq
         UcLZZIKiuypdP608T49d7jVTcK4nMugcLgBnjO9n4x2EAt95lbOVUT4wW5kJLC+sqh
         FMQY6F9KkkdmV7FsEsXvF/t8Al5IlhKwNu3lXVzU=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3] drm/bridge: lvds-codec: Add support for regulator
Date:   Tue, 22 Sep 2020 13:55:26 +0300
Message-Id: <20200922105526.5252-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the support for enabling optional regulator that may be used as VCC
source.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
[Replaced 'error' variable with 'ret']
[Renamed regulator from 'vcc' to 'power']
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Use the correct regulator name
---
 drivers/gpu/drm/bridge/lvds-codec.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index f19d9f7a5db2..f52ccffc1bd1 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -10,13 +10,16 @@
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 
 #include <drm/drm_bridge.h>
 #include <drm/drm_panel.h>
 
 struct lvds_codec {
+	struct device *dev;
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct regulator *vcc;
 	struct gpio_desc *powerdown_gpio;
 	u32 connector_type;
 };
@@ -38,6 +41,14 @@ static int lvds_codec_attach(struct drm_bridge *bridge,
 static void lvds_codec_enable(struct drm_bridge *bridge)
 {
 	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
+	int ret;
+
+	ret = regulator_enable(lvds_codec->vcc);
+	if (ret) {
+		dev_err(lvds_codec->dev,
+			"Failed to enable regulator \"vcc\": %d\n", ret);
+		return;
+	}
 
 	if (lvds_codec->powerdown_gpio)
 		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 0);
@@ -46,9 +57,15 @@ static void lvds_codec_enable(struct drm_bridge *bridge)
 static void lvds_codec_disable(struct drm_bridge *bridge)
 {
 	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
+	int ret;
 
 	if (lvds_codec->powerdown_gpio)
 		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
+
+	ret = regulator_disable(lvds_codec->vcc);
+	if (ret)
+		dev_err(lvds_codec->dev,
+			"Failed to disable regulator \"vcc\": %d\n", ret);
 }
 
 static const struct drm_bridge_funcs funcs = {
@@ -63,12 +80,24 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
+	int ret;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
 	if (!lvds_codec)
 		return -ENOMEM;
 
+	lvds_codec->dev = &pdev->dev;
 	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
+
+	lvds_codec->vcc = devm_regulator_get(lvds_codec->dev, "power");
+	if (IS_ERR(lvds_codec->vcc)) {
+		ret = PTR_ERR(lvds_codec->vcc);
+		if (ret != -EPROBE_DEFER)
+			dev_err(lvds_codec->dev,
+				"Unable to get \"vcc\" supply: %d\n", ret);
+		return ret;
+	}
+
 	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
 							     GPIOD_OUT_HIGH);
 	if (IS_ERR(lvds_codec->powerdown_gpio))
-- 
Regards,

Laurent Pinchart

