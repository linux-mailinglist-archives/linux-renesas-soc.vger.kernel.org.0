Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEA0357778A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Jul 2022 19:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbiGQRpU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Jul 2022 13:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiGQRpT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jul 2022 13:45:19 -0400
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799A9DF89
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2022 10:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=AfH9Qs5wD3KTt5THnRe+Ywjg0HUrKrXd9QuokU8dlm0=;
        b=Whtuk9yCXNltyVJGmT82ZE4RWmxFP7coq6NApU3N75TVhXACkuISqTzMPgwY3klO2WNeY+jCl3zVT
         cvHoial7JYydrOcg9fv+SqI0Sd+rk+osanLTDy7He13QxZuomFQuS4At/XvbMfYdloXKi3a6dWHtmh
         K9ebjOe3pMxB2vMUKtvscXqEx34W8uUULIqlxt8SWUhNWHHjCZo9tQMNSTkTvfhyWVrUk/VjFcYQET
         U7jPe2MjAjdMAP4WCXCbCltkT1fTYo0VEtBqG5iB6Mr+c91FFX4YsupMFADh1X9H58XNT9iuHp5bIN
         ghBXg1IPcvLuRMEY15JCJsCqziMtLFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=AfH9Qs5wD3KTt5THnRe+Ywjg0HUrKrXd9QuokU8dlm0=;
        b=GmKuQ7a3DwmGvbT3CzG3kUtioZ1YWa2gzXDCeVLowhKKayjpOz3rDyS2iPsoetCSiHFRqO12MrH2e
         5ipeInWBg==
X-HalOne-Cookie: 281e936c87613b4ea5f8a9a665e5e773c0d67fb2
X-HalOne-ID: 3745decf-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 3745decf-05f8-11ed-823f-d0431ea8bb10;
        Sun, 17 Jul 2022 17:45:16 +0000 (UTC)
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 07/12] drm/bridge: tc358767: Use drm_bridge_funcs.atomic_check
Date:   Sun, 17 Jul 2022 19:44:49 +0200
Message-Id: <20220717174454.46616-8-sam@ravnborg.org>
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

When atomic_check() is defined, then mode_fixup() is ignored,
so it had no effect that drm_bridge_funcs.mode_fixup was assigned.
Embed the original implementation in the caller and drop the function.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 02bd757a8987..b2ab967504af 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1496,26 +1496,18 @@ tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
 		dev_err(tc->dev, "main link disable error: %d\n", ret);
 }
 
-static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adj)
-{
-	/* Fixup sync polarities, both hsync and vsync are active low */
-	adj->flags = mode->flags;
-	adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
-	adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
-
-	return true;
-}
-
 static int tc_common_atomic_check(struct drm_bridge *bridge,
 				  struct drm_bridge_state *bridge_state,
 				  struct drm_crtc_state *crtc_state,
 				  struct drm_connector_state *conn_state,
 				  const unsigned int max_khz)
 {
-	tc_bridge_mode_fixup(bridge, &crtc_state->mode,
-			     &crtc_state->adjusted_mode);
+	struct drm_display_mode *adj = &crtc_state->adjusted_mode;
+
+	/* Fixup sync polarities, both hsync and vsync are active low */
+	adj->flags = crtc_state->mode.flags;
+	adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 
 	if (crtc_state->adjusted_mode.clock > max_khz)
 		return -EINVAL;
@@ -1783,7 +1775,6 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
 	.atomic_check = tc_edp_atomic_check,
 	.atomic_enable = tc_edp_bridge_atomic_enable,
 	.atomic_disable = tc_edp_bridge_atomic_disable,
-	.mode_fixup = tc_bridge_mode_fixup,
 	.detect = tc_bridge_detect,
 	.get_edid = tc_get_edid,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-- 
2.34.1

