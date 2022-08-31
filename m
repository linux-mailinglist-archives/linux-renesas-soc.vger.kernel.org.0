Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C57015A7904
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Aug 2022 10:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbiHaI1Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Aug 2022 04:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbiHaI1Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2022 04:27:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE9B9A9C7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Aug 2022 01:27:14 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A6B9749;
        Wed, 31 Aug 2022 10:27:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661934431;
        bh=sc0etUTjXQN9f68TAFcomrI0mFtb5ro25RwpfPIju90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QtvJ7WAE90cbyQljXjEeF7n0ZloNHi4rI3mfZDUXbpYgegGFoBYL63D+JMdoXyquE
         n3IGX1VQ9a59Gjmec3ZcjGwjn3YFFh8ShZgAHfveHAcQcPdc9RG37GsUGb3slxJmSR
         SMz+fTddzSBY3aebxXywu12LUJdr3O7D6nMc6k78=
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
Subject: [PATCH v6 3/3] drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP
Date:   Wed, 31 Aug 2022 11:26:53 +0300
Message-Id: <20220831082653.20449-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831082653.20449-1-tomi.valkeinen@ideasonboard.com>
References: <20220831082653.20449-1-tomi.valkeinen@ideasonboard.com>
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

Implement the bridge connector-related .get_edid() and .detect()
operations for full DP mode, and report the related bridge capabilities
and type.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---
Changes since v1:

- The connector .get_modes() operation doesn't rely on EDID anymore,
  __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
  together
 - Fix on top of Sam Ravnborg's DRM_BRIDGE_STATE_OPS

Changes since v2: [Kieran]
 - Only support EDID on DRM_MODE_CONNECTOR_DisplayPort modes.

Changes since v3: [Kieran]
 - Remove PM calls in ti_sn_bridge_get_edid() and simplify

Changes since v4:
 - Add .detect()
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6e053e2af229..3c3561942eb6 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -29,6 +29,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -68,6 +69,7 @@
 #define  BPP_18_RGB				BIT(0)
 #define SN_HPD_DISABLE_REG			0x5C
 #define  HPD_DISABLE				BIT(0)
+#define  HPD_DEBOUNCED_STATE			BIT(4)
 #define SN_GPIO_IO_REG				0x5E
 #define  SN_GPIO_INPUT_SHIFT			4
 #define  SN_GPIO_OUTPUT_SHIFT			0
@@ -1158,10 +1160,33 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(pdata->dev);
 }
 
+static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	int val = 0;
+
+	pm_runtime_get_sync(pdata->dev);
+	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
+	pm_runtime_put_autosuspend(pdata->dev);
+
+	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
+					 : connector_status_disconnected;
+}
+
+static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
+					  struct drm_connector *connector)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+
+	return drm_get_edid(connector, &pdata->aux.ddc);
+}
+
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
+	.get_edid = ti_sn_bridge_get_edid,
+	.detect = ti_sn_bridge_detect,
 	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
 	.atomic_enable = ti_sn_bridge_atomic_enable,
 	.atomic_disable = ti_sn_bridge_atomic_disable,
@@ -1257,6 +1282,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
+		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+
 	drm_bridge_add(&pdata->bridge);
 
 	ret = ti_sn_attach_host(pdata);
-- 
2.34.1

