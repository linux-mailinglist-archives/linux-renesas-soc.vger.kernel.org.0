Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA54577783
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Jul 2022 19:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiGQRpN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Jul 2022 13:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiGQRpM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jul 2022 13:45:12 -0400
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA077DF89
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2022 10:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=WpiIdNNw+YlTh9md/y+SUXBy5qWi7g/wD1nN6Hjb1fc=;
        b=SjCvmsX9tnzAHlHfFQXP3UhAFt18chTJzMiyXQ+UoMt0QyZf7K0VE1DoIAW1C/Duvc7sWvoumlhce
         j2i3Qd7o6D5Q/dk2n0Dz/XxdCpxxtoz2El2RB0bokmhqvF187EjAXnbBMQBG6w9IX0jZK9Gh0mHPlP
         O0i0RQm85ZiWrlMs2z8nNBvZSgg0+z75rj9wSxH+oXW+vbKhmj9a8zSkat0T6aaIpCKl3WecyGewmk
         7yXtGASEKJ8AcFEoKUTypPWlfwrrgaensGSjEAxYwuUjB/ukU//Ewhm8b5Uyp/fNO2qchgWHM/W8/l
         YxgkfgDlNmsmCAMfpdWqRcKDSxFw/jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=WpiIdNNw+YlTh9md/y+SUXBy5qWi7g/wD1nN6Hjb1fc=;
        b=ZWBPwkyfGgn0kvJgaogmSdBAPG6nzGfyaPcxggdpAs13BTMtZRIg4j7psRs7rpYPlCJi1YhA99Biz
         HN2hVycAA==
X-HalOne-Cookie: 8bc88d894888cda86d4c72cfc609f8fc5424586e
X-HalOne-ID: 32858be4-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 32858be4-05f8-11ed-823f-d0431ea8bb10;
        Sun, 17 Jul 2022 17:45:08 +0000 (UTC)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Benson Leung <bleung@chromium.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        chrome-platform@lists.linux.dev,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philip Chen <philipchen@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 01/12] drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
Date:   Sun, 17 Jul 2022 19:44:43 +0200
Message-Id: <20220717174454.46616-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717174454.46616-1-sam@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLACK autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The atomic variants of enable/disable in drm_bridge_funcs are the
preferred operations - introduce these.

The ps8640 driver used the non-atomic variants of the drm_bridge_chain_pre_enable/
drm_bridge_chain_post_disable - convert these to the atomic variants.

v2:
  - Init state operations in drm_bridge_funcs (Laurent)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Philip Chen <philipchen@chromium.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 31e88cb39f8a..bb8076fb8625 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -15,6 +15,7 @@
 
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
@@ -409,7 +410,8 @@ static const struct dev_pm_ops ps8640_pm_ops = {
 				pm_runtime_force_resume)
 };
 
-static void ps8640_pre_enable(struct drm_bridge *bridge)
+static void ps8640_atomic_pre_enable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
@@ -443,7 +445,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
 	ps_bridge->pre_enabled = true;
 }
 
-static void ps8640_post_disable(struct drm_bridge *bridge)
+static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
+				       struct drm_bridge_state *old_bridge_state)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 
@@ -521,7 +524,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 	 * EDID, for this chip, we need to do a full poweron, otherwise it will
 	 * fail.
 	 */
-	drm_bridge_chain_pre_enable(bridge);
+	drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
 
 	edid = drm_get_edid(connector,
 			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
@@ -531,7 +534,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 	 * before, return the chip to its original power state.
 	 */
 	if (poweroff)
-		drm_bridge_chain_post_disable(bridge);
+		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
 
 	return edid;
 }
@@ -546,8 +549,11 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.attach = ps8640_bridge_attach,
 	.detach = ps8640_bridge_detach,
 	.get_edid = ps8640_bridge_get_edid,
-	.post_disable = ps8640_post_disable,
-	.pre_enable = ps8640_pre_enable,
+	.atomic_post_disable = ps8640_atomic_post_disable,
+	.atomic_pre_enable = ps8640_atomic_pre_enable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static int ps8640_bridge_get_dsi_resources(struct device *dev, struct ps8640 *ps_bridge)
-- 
2.34.1

