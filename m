Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC6D4D05D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Mar 2022 19:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238652AbiCGSBE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 13:01:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236338AbiCGSBD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 13:01:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E50606F7
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Mar 2022 10:00:09 -0800 (PST)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7C80A49;
        Mon,  7 Mar 2022 19:00:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646676006;
        bh=IgcfP7PHmrGq9GErZHV8bP+/Yp5z+H6A/PAo+JqfC6w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t3cwr96/q1+qC5P/oYr05NrUXqns/jzO+MLJ2kIRoXPMgQUMCsKJWEW8reSb2lTY5
         3AXQmsN9RIVNppiv0kQXZLmxHBPmChyPIbufES7a7QgdbGRb7WaPTD/91obZBY2og6
         MR/jkU6FXfVqPY+/7K64JElWYTABHSmTrEZKnJxc=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
Date:   Mon,  7 Mar 2022 17:59:54 +0000
Message-Id: <20220307175955.363057-4-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
--
Changes since v1/RFC:
 - Rebased on top of "drm/bridge: ti-sn65dsi86: switch to
   devm_drm_of_get_bridge"
 - eDP/DP mode determined from the next bridge connector type.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 29f5f7123ed9..461f963faa0b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -60,6 +60,7 @@
 #define SN_LN_ASSIGN_REG			0x59
 #define  LN_ASSIGN_WIDTH			2
 #define SN_ENH_FRAME_REG			0x5A
+#define  ASSR_CONTROL				BIT(0)
 #define  VSTREAM_ENABLE				BIT(3)
 #define  LN_POLRS_OFFSET			4
 #define  LN_POLRS_MASK				0xf0
@@ -91,6 +92,8 @@
 #define SN_DATARATE_CONFIG_REG			0x94
 #define  DP_DATARATE_MASK			GENMASK(7, 5)
 #define  DP_DATARATE(x)				((x) << 5)
+#define SN_TRAINING_SETTING_REG			0x95
+#define  SCRAMBLE_DISABLE			BIT(4)
 #define SN_ML_TX_MODE_REG			0x96
 #define  ML_TX_MAIN_LINK_OFF			0
 #define  ML_TX_NORMAL_MODE			BIT(0)
@@ -1005,6 +1008,11 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 	regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
 			   DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
 
+	/* For DisplayPort, use the standard DP scrambler seed. */
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
+		regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG,
+				   ASSR_CONTROL, 0);
+
 	/* enable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
 
@@ -1016,6 +1024,11 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 		goto exit;
 	}
 
+	/* For DisplayPort, disable scrambling mode. */
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
+		regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
+				   SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);
+
 	/*
 	 * We'll try to link train several times.  As part of link training
 	 * the bridge chip will write DP_SET_POWER_D0 to DP_SET_POWER.  If
@@ -1260,7 +1273,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = np;
 	pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
-	pdata->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
+			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
 	drm_bridge_add(&pdata->bridge);
 
-- 
2.32.0

