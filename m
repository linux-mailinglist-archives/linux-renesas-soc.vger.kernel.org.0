Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEABFB443
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 16:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbfKMPwm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 10:52:42 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:12714 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726074AbfKMPwm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 10:52:42 -0500
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; 
   d="scan'208";a="31593960"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:41 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B3A1D400EE6B;
        Thu, 14 Nov 2019 00:52:36 +0900 (JST)
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
Subject: [PATCH v4 12/13] [HACK] drm/bridge: lvds-codec: Enforce device specific compatible strings
Date:   Wed, 13 Nov 2019 15:51:31 +0000
Message-Id: <1573660292-10629-13-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The lvds-codec driver is a generic stub for transparent LVDS
encoders and decoders.
It's good practice to list a device specific compatible string
before the generic fallback (if any) in the DT node for the relevant
LVDS encoder/decoder, and it's also required by the dt-bindings.
A notable exception to the generic fallback mechanism is the case
of "thine,thc63lvdm83d", as documented in:
Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
This patch enforces the adoption of a device specific compatible
string (as fist string in the list), by using markers for the
compatible string we match against and the index of the matching
compatible string in the list.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
Hi Laurent,

I don't think we need to do anything in the driver to address your
comment, as we can "enforce" this with the bindings (please see the
next patch, as it would help with the "enforcing" of the compatible
string for the thine device).
I am sending this patch only so that you can see what a possible
solution in the driver could look like.

v3->v4:
* New patch addressing the below comment from Laurent:
"I think the lvds-decoder driver should error out at probe time if only
one compatible string is listed."
---
 drivers/gpu/drm/bridge/lvds-codec.c | 55 +++++++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 784bbd3..145c25d 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -14,11 +14,16 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_panel.h>
 
+struct lvds_codec_data {
+	u32 connector_type;
+	bool device_specific;
+};
+
 struct lvds_codec {
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
 	struct gpio_desc *powerdown_gpio;
-	u32 connector_type;
+	const struct lvds_codec_data *data;
 };
 
 static int lvds_codec_attach(struct drm_bridge *bridge)
@@ -65,7 +70,30 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	if (!lvds_codec)
 		return -ENOMEM;
 
-	lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
+	lvds_codec->data = of_device_get_match_data(&pdev->dev);
+	if (!lvds_codec->data)
+		return -EINVAL;
+
+	/*
+	 * If we haven't matched a device specific compatible string, we need
+	 * to work out if the generic compatible string we matched against was
+	 * listed first in the compatible property.
+	 */
+	if (!lvds_codec->data->device_specific) {
+		const struct of_device_id *match;
+		int compatible_index;
+
+		match = of_match_node(dev->driver->of_match_table,
+				      dev->of_node);
+		compatible_index = of_property_match_string(dev->of_node,
+							    "compatible",
+							    match->compatible);
+		if (compatible_index == 0) {
+			dev_err(dev, "Device specific compatible needed\n");
+			return -EINVAL;
+		}
+	}
+
 	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
 							     GPIOD_OUT_HIGH);
 	if (IS_ERR(lvds_codec->powerdown_gpio)) {
@@ -92,7 +120,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 
 	lvds_codec->panel_bridge =
 		devm_drm_panel_bridge_add_typed(dev, panel,
-						lvds_codec->connector_type);
+					lvds_codec->data->connector_type);
 	if (IS_ERR(lvds_codec->panel_bridge))
 		return PTR_ERR(lvds_codec->panel_bridge);
 
@@ -119,18 +147,33 @@ static int lvds_codec_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct lvds_codec_data lvds_codec_decoder_data = {
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+	.device_specific = false,
+};
+
+static const struct lvds_codec_data lvds_codec_encoder_data = {
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+	.device_specific = false,
+};
+
+static const struct lvds_codec_data lvds_codec_thc63lvdm83d_data = {
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+	.device_specific = true,
+};
+
 static const struct of_device_id lvds_codec_match[] = {
 	{
 		.compatible = "lvds-decoder",
-		.data = (void *)DRM_MODE_CONNECTOR_DPI,
+		.data = &lvds_codec_decoder_data,
 	},
 	{
 		.compatible = "lvds-encoder",
-		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
+		.data = &lvds_codec_encoder_data,
 	},
 	{
 		.compatible = "thine,thc63lvdm83d",
-		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
+		.data = &lvds_codec_thc63lvdm83d_data,
 	},
 	{},
 };
-- 
2.7.4

