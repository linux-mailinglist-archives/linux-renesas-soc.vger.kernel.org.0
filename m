Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBDC240A8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 17:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbgHJPWg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 11:22:36 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:5536 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728225AbgHJPWe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 11:22:34 -0400
X-IronPort-AV: E=Sophos;i="5.75,457,1589209200"; 
   d="scan'208";a="54088463"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Aug 2020 00:22:34 +0900
Received: from localhost.localdomain (unknown [172.29.52.120])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 32CE44008545;
        Tue, 11 Aug 2020 00:22:31 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/3] drm/bridge: lvds-codec: Add support for regulator
Date:   Mon, 10 Aug 2020 16:22:18 +0100
Message-Id: <20200810152219.6254-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the support for enabling optional regulator that may be used as VCC
source.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
New Patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
---
 drivers/gpu/drm/bridge/lvds-codec.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 24fb1befdfa2..5858a29aafe6 100644
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
+	int error;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
 	if (!lvds_codec)
 		return -ENOMEM;
 
+	lvds_codec->dev = &pdev->dev;
 	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
+
+	lvds_codec->vcc = devm_regulator_get(lvds_codec->dev, "vcc");
+	if (IS_ERR(lvds_codec->vcc)) {
+		error = PTR_ERR(lvds_codec->vcc);
+		if (error != -EPROBE_DEFER)
+			dev_err(lvds_codec->dev,
+				"Unable to get \"vcc\" supply: %d\n", error);
+		return error;
+	}
+
 	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
 							     GPIOD_OUT_HIGH);
 	if (IS_ERR(lvds_codec->powerdown_gpio)) {
-- 
2.17.1

