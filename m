Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0917359FAC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 15:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237976AbiHXNBA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 09:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237990AbiHXNA6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 09:00:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA5A97B23
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 06:00:56 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB5A8A32;
        Wed, 24 Aug 2022 15:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661346053;
        bh=exXFE5kKYKIE9sGir+KYCuChXXnVItB3xItSp1bIFkY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sSHZZhwMer9R+hXqxAAKHA2f21ezDJAKB/ZTBgysgXCjd/aOodjirSNnrLqO+jAj7
         fxY7c4UV3tonNOHt89KaotuVFSUYMq/KXodOQAHEAhYxKDAC51mpXd/NsPuprfwquj
         4eHIiW4EmsJMf5lr9ickcdz8hHh8qmvMbqrkizCI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v5 3/4] drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
Date:   Wed, 24 Aug 2022 16:00:33 +0300
Message-Id: <20220824130034.196041-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Despite the SN65DSI86 being an eDP bridge, on some systems its output is
routed to a DisplayPort connector. Enable DisplayPort mode when the next
component in the display pipeline is detected as a DisplayPort
connector, and disable eDP features in that case.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reworked to set bridge type based on the next bridge/connector.
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
--
Changes since v1/RFC:
 - Rebased on top of "drm/bridge: ti-sn65dsi86: switch to
   devm_drm_of_get_bridge"
 - eDP/DP mode determined from the next bridge connector type.

Changes since v2:
 - Remove setting of Standard DP Scrambler Seed. (It's read-only).
 - Prevent setting DP_EDP_CONFIGURATION_SET in
   ti_sn_bridge_atomic_enable()
 - Use Doug's suggested text for disabling ASSR on DP mode.

Changes since v3:
 - Remove ASSR_CONTROL definition

Changes since v4:
 - Refactor code to configure the DP/eDP scrambler in one place.
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f085a037ff5b..a6b15ea4e84d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -92,6 +92,8 @@
 #define SN_DATARATE_CONFIG_REG			0x94
 #define  DP_DATARATE_MASK			GENMASK(7, 5)
 #define  DP_DATARATE(x)				((x) << 5)
+#define SN_TRAINING_SETTING_REG			0x95
+#define  SCRAMBLE_DISABLE			BIT(4)
 #define SN_ML_TX_MODE_REG			0x96
 #define  ML_TX_MAIN_LINK_OFF			0
 #define  ML_TX_NORMAL_MODE			BIT(0)
@@ -1075,12 +1077,23 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	/*
 	 * The SN65DSI86 only supports ASSR Display Authentication method and
-	 * this method is enabled by default. An eDP panel must support this
+	 * this method is enabled for eDP panels. An eDP panel must support this
 	 * authentication method. We need to enable this method in the eDP panel
 	 * at DisplayPort address 0x0010A prior to link training.
+	 *
+	 * As only ASSR is supported by SN65DSI86, for full DisplayPort displays
+	 * we need to disable the scrambler.
 	 */
-	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
-			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP) {
+		drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
+				   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
+
+		regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
+				   SCRAMBLE_DISABLE, 0);
+	} else {
+		regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
+				   SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);
+	}
 
 	bpp = ti_sn_bridge_get_bpp(connector);
 	/* Set the DP output format (18 bpp or 24 bpp) */
@@ -1246,6 +1259,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = np;
+	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
+			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
 	drm_bridge_add(&pdata->bridge);
 
-- 
2.34.1

