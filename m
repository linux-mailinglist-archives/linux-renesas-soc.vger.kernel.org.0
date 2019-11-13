Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77CFEFB433
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 16:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbfKMPwN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 10:52:13 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:54368 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726276AbfKMPwN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 10:52:13 -0500
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; 
   d="scan'208";a="31380894"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:11 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C4296400ED5C;
        Thu, 14 Nov 2019 00:52:06 +0900 (JST)
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
Subject: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder" support
Date:   Wed, 13 Nov 2019 15:51:25 +0000
Message-Id: <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for transparent LVDS decoders by adding a new
compatible string ("lvds-decoder") to the driver.
This patch also adds member connector_type to struct lvds_codec,
and that's because LVDS decoders have a different connector type
from LVDS encoders. We fill this new member up with the data
matching the compatible string.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v3->v4:
* New patch
---
 drivers/gpu/drm/bridge/lvds-codec.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index b5801a2..c32e125 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -7,6 +7,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 
@@ -17,6 +18,7 @@ struct lvds_codec {
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
 	struct gpio_desc *powerdown_gpio;
+	u32 connector_type;
 };
 
 static int lvds_codec_attach(struct drm_bridge *bridge)
@@ -65,6 +67,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	if (!lvds_codec)
 		return -ENOMEM;
 
+	lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
 	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
 							     GPIOD_OUT_HIGH);
 	if (IS_ERR(lvds_codec->powerdown_gpio)) {
@@ -105,7 +108,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 
 	lvds_codec->panel_bridge =
 		devm_drm_panel_bridge_add_typed(dev, panel,
-						DRM_MODE_CONNECTOR_LVDS);
+						lvds_codec->connector_type);
 	if (IS_ERR(lvds_codec->panel_bridge))
 		return PTR_ERR(lvds_codec->panel_bridge);
 
@@ -133,8 +136,18 @@ static int lvds_codec_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id lvds_codec_match[] = {
-	{ .compatible = "lvds-encoder" },
-	{ .compatible = "thine,thc63lvdm83d" },
+	{
+		.compatible = "lvds-decoder",
+		.data = (void *)DRM_MODE_CONNECTOR_DPI,
+	},
+	{
+		.compatible = "lvds-encoder",
+		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
+	},
+	{
+		.compatible = "thine,thc63lvdm83d",
+		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, lvds_codec_match);
-- 
2.7.4

