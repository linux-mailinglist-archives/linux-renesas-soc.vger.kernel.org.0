Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1CD123A7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 00:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbfLQXIL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 18:08:11 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56846 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfLQXIL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 18:08:11 -0500
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CDEC9BF;
        Wed, 18 Dec 2019 00:08:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576624088;
        bh=NoESLuNwhUWuSEIYC8RP9oN9z8nm/7YUMajGPicxqWc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JzcmqTbturKTYVvj5xIMuauSBCYextC1eVTLp5edHPJix0lFkCTsnhvh7kbtgeu9K
         ITtc9i4rhahMNvgB2JOR2T6ijpPR2CWnjJzoko6GnzKwbElHc35Y+RjAy/pwldzsZW
         +QJ5yNF1gV9WgJQpLI47Jthl22ZkMGawaWG9DOsc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v4.1 06/13] drm/bridge: lvds-codec: Add "lvds-decoder" support
Date:   Wed, 18 Dec 2019 01:07:53 +0200
Message-Id: <20191217230753.2999-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add support for transparent LVDS decoders by adding a new
compatible string ("lvds-decoder") to the driver.
This patch also adds member connector_type to struct lvds_codec,
and that's because LVDS decoders have a different connector type
from LVDS encoders. We fill this new member up with the data
matching the compatible string.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
[Fix pointer to int cast warning]
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v4:

- Fix compiler warning to to a cast from 64-bit pointer to 32-bit
  integer

v3->v4:
* New patch
---
 drivers/gpu/drm/bridge/lvds-codec.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index b5801a287a0a..d072a76b20d9 100644
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
 
+	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
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
Regards,

Laurent Pinchart

