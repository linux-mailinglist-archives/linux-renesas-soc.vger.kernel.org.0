Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E78577785
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Jul 2022 19:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbiGQRpO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Jul 2022 13:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiGQRpN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jul 2022 13:45:13 -0400
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5245AE038
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2022 10:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=vrmH6j/pag/TAHd5gacgg6+hIq0bIhmlmYC9SVvEMUk=;
        b=tur3vjZ7J5oe2xh9gBjsYeCwZv849URfw9ROdiNmQiSlkx0FQYkXfzsaeNFbePNG+TyzDCuniVR3k
         pVjTv1kIAJSjnXcn0NaeDCnMKFdBmpdPNQ16pcpfPU67FATNXCLI+7evlJSV0oa3N1rO6d7mndQ77N
         JfBqYGnw0ZJzb18en13cKmkcjZzr5D7wnw6lKgbXvPitNf5pIbxUZLNUV1Y2flWr0oqfeqq1IQFh+f
         sMXwMRJhbPpMrwV3cLWY/ch5f2BLFyu6dW7WMgkcVf/dgJIT0yI+pE+N7I2p4oOFaxWdZ5pUceTRtK
         KL6h8JXqTa6tPM4tz0q/m54ThuLhv1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=vrmH6j/pag/TAHd5gacgg6+hIq0bIhmlmYC9SVvEMUk=;
        b=+m/XHXsgtEpjZ5j3R9aVPSvnjjYAZc6JEPKo8LoxlH/6YgxdDvNrg3llrRha5yJ/VYTjnqkt2rIqy
         hevrPu3BA==
X-HalOne-Cookie: da2ff8231e04c1e7940b3ca9b98092ce5455aff1
X-HalOne-ID: 336b8041-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 336b8041-05f8-11ed-823f-d0431ea8bb10;
        Sun, 17 Jul 2022 17:45:09 +0000 (UTC)
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
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v1 02/12] drm/bridge: Drop unused drm_bridge_chain functions
Date:   Sun, 17 Jul 2022 19:44:44 +0200
Message-Id: <20220717174454.46616-3-sam@ravnborg.org>
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

The drm_bridge_chain_{pre_enable,enable,disable,post_disable} has no
users left and we have atomic variants that should be used.
Drop them so they do not gain new users.

Adjust a few comments to avoid references to the dropped functions.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
---
 drivers/gpu/drm/drm_bridge.c | 110 -----------------------------------
 include/drm/drm_bridge.h     |  28 ---------
 2 files changed, 138 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 1545c50fd1c8..bb7fc09267af 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -509,61 +509,6 @@ drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
 
-/**
- * drm_bridge_chain_disable - disables all bridges in the encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.disable op for all the bridges in the encoder
- * chain, starting from the last bridge to the first. These are called before
- * calling the encoder's prepare op.
- *
- * Note: the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_disable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->disable)
-			iter->funcs->disable(iter);
-
-		if (iter == bridge)
-			break;
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_disable);
-
-/**
- * drm_bridge_chain_post_disable - cleans up after disabling all bridges in the
- *				   encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.post_disable op for all the bridges in the
- * encoder chain, starting from the first bridge to the last. These are called
- * after completing the encoder's prepare op.
- *
- * Note: the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->post_disable)
-			bridge->funcs->post_disable(bridge);
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_post_disable);
-
 /**
  * drm_bridge_chain_mode_set - set proposed mode for all bridges in the
  *			       encoder chain
@@ -593,61 +538,6 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
-/**
- * drm_bridge_chain_pre_enable - prepares for enabling all bridges in the
- *				 encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
- * chain, starting from the last bridge to the first. These are called
- * before calling the encoder's commit op.
- *
- * Note: the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->pre_enable)
-			iter->funcs->pre_enable(iter);
-
-		if (iter == bridge)
-			break;
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
-
-/**
- * drm_bridge_chain_enable - enables all bridges in the encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.enable op for all the bridges in the encoder
- * chain, starting from the first bridge to the last. These are called
- * after completing the encoder's commit op.
- *
- * Note that the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_enable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->enable)
-			bridge->funcs->enable(bridge);
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_enable);
-
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index dba5d81e3b4a..1eca9c4c3346 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -297,12 +297,6 @@ struct drm_bridge_funcs {
 	 * not enable the display link feeding the next bridge in the chain (if
 	 * there is one) when this callback is called.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from
-	 * &drm_bridge_chain_pre_enable. It would be prudent to also provide an
-	 * implementation of @pre_enable if you are expecting driver calls into
-	 * &drm_bridge_chain_pre_enable.
-	 *
 	 * The @atomic_pre_enable callback is optional.
 	 */
 	void (*atomic_pre_enable)(struct drm_bridge *bridge,
@@ -323,11 +317,6 @@ struct drm_bridge_funcs {
 	 * callback must enable the display link feeding the next bridge in the
 	 * chain if there is one.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from &drm_bridge_chain_enable.
-	 * It would be prudent to also provide an implementation of @enable if
-	 * you are expecting driver calls into &drm_bridge_chain_enable.
-	 *
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
@@ -345,12 +334,6 @@ struct drm_bridge_funcs {
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is still running when this callback is called.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from
-	 * &drm_bridge_chain_disable. It would be prudent to also provide an
-	 * implementation of @disable if you are expecting driver calls into
-	 * &drm_bridge_chain_disable.
-	 *
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
@@ -370,13 +353,6 @@ struct drm_bridge_funcs {
 	 * signals) feeding it is no longer running when this callback is
 	 * called.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from
-	 * &drm_bridge_chain_post_disable.
-	 * It would be prudent to also provide an implementation of
-	 * @post_disable if you are expecting driver calls into
-	 * &drm_bridge_chain_post_disable.
-	 *
 	 * The @atomic_post_disable callback is optional.
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
@@ -876,13 +852,9 @@ enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 			    const struct drm_display_info *info,
 			    const struct drm_display_mode *mode);
-void drm_bridge_chain_disable(struct drm_bridge *bridge);
-void drm_bridge_chain_post_disable(struct drm_bridge *bridge);
 void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 			       const struct drm_display_mode *mode,
 			       const struct drm_display_mode *adjusted_mode);
-void drm_bridge_chain_pre_enable(struct drm_bridge *bridge);
-void drm_bridge_chain_enable(struct drm_bridge *bridge);
 
 int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
 				  struct drm_crtc_state *crtc_state,
-- 
2.34.1

