Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86486343711
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 04:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhCVDC6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 23:02:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35456 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhCVDCa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 23:02:30 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFB4C1491;
        Mon, 22 Mar 2021 04:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616382144;
        bh=fSMyE55kwmqHdv+QNGjjhC7fi3fZJdw8eG2Ngoz3D+0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DgHZEa/pCNrZwOKxAcKv3zyUD08EtJjZYrGJF1GL8s3Yi1RMRPXtkPgnP7RRksfhg
         vzTYmL7Q3OR+IVUiS5lcsAeQb4gfwLHPOMeG8LU+3YBn2G2J8Mf3q30UMNttHE0/U8
         B/5kVsasXXUOUKXNN9ftxKFEdBBAyymY6hP5FXUk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH 10/11] drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
Date:   Mon, 22 Mar 2021 05:01:27 +0200
Message-Id: <20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Despite the SN65DSI86 being an eDP bridge, on some systems its output is
routed to a DisplayPort connector. Enable DisplayPort mode when the next
component in the display pipeline is not a panel, and disable eDP
features in that case.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 32 ++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e2527d597ccb..f792227142a7 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -55,6 +55,7 @@
 #define SN_LN_ASSIGN_REG			0x59
 #define  LN_ASSIGN_WIDTH			2
 #define SN_ENH_FRAME_REG			0x5A
+#define  ASSR_CONTROL				BIT(0)
 #define  VSTREAM_ENABLE				BIT(3)
 #define  LN_POLRS_OFFSET			4
 #define  LN_POLRS_MASK				0xf0
@@ -86,6 +87,8 @@
 #define SN_DATARATE_CONFIG_REG			0x94
 #define  DP_DATARATE_MASK			GENMASK(7, 5)
 #define  DP_DATARATE(x)				((x) << 5)
+#define SN_TRAINING_SETTING_REG			0x95
+#define  SCRAMBLE_DISABLE			BIT(4)
 #define SN_ML_TX_MODE_REG			0x96
 #define  ML_TX_MAIN_LINK_OFF			0
 #define  ML_TX_NORMAL_MODE			BIT(0)
@@ -723,6 +726,11 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
 	regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
 			   DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
 
+	/* For DisplayPort, use the standard DP scrambler seed. */
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
+		regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG,
+				   ASSR_CONTROL, 0);
+
 	/* enable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
 
@@ -734,6 +742,11 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
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
@@ -1288,18 +1301,20 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 	pdata->dev = &client->dev;
 
 	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
-					  &pdata->panel, NULL);
+					  &pdata->panel, &pdata->next_bridge);
 	if (ret) {
 		DRM_ERROR("could not find any panel node\n");
 		return ret;
 	}
 
-	pdata->next_bridge = devm_drm_panel_bridge_add(pdata->dev,
-						       pdata->panel);
-	if (IS_ERR(pdata->next_bridge)) {
-		DRM_ERROR("failed to create panel bridge\n");
-		ret = PTR_ERR(pdata->next_bridge);
-		return ret;
+	if (!pdata->next_bridge) {
+		pdata->next_bridge = devm_drm_panel_bridge_add(pdata->dev,
+							       pdata->panel);
+		if (IS_ERR(pdata->next_bridge)) {
+			DRM_ERROR("failed to create panel bridge\n");
+			ret = PTR_ERR(pdata->next_bridge);
+			return ret;
+		}
 	}
 
 	dev_set_drvdata(&client->dev, pdata);
@@ -1351,7 +1366,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = client->dev.of_node;
 	pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
-	pdata->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	pdata->bridge.type = pdata->panel ? DRM_MODE_CONNECTOR_eDP
+			   : DRM_MODE_CONNECTOR_DisplayPort;
 
 	drm_bridge_add(&pdata->bridge);
 
-- 
Regards,

Laurent Pinchart

