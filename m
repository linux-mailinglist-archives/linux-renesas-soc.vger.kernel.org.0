Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFB985777A1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Jul 2022 19:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbiGQR6Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Jul 2022 13:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiGQR6X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jul 2022 13:58:23 -0400
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1A613D61
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2022 10:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=Q5AK+4NypIlk8rRS3I711RmXejfY0OnnESySL2cldlE=;
        b=h+bfBHFSeG2CbL7laYU1YY2xRf6vZMMRMk5qvEAomwTsvBfDLqtntGSkQ9DVsG5VCzhE/TlCDpbRS
         neJVUzwik7sUmhoAVmFTXOJbY8kXjBNIIs1i5+3fZ3LZnsGMSqKX+UVW+SANGh7k2nmfI/SB5yj86d
         paP/zrB7Rn7Q30OjeHsEIPW3J0lYufB9/6t78mO3XPlgjFEyjfDhOlcTlayHPhErDiKzuDnRknKbj9
         /ietNxnf15VZVa7EvobBvv9v0idp2Oq1KKLek7bFj+83PZA4AjxNqS0qWmbk4b6qWOiE0EPVSLAWLj
         F2gBFwxUkXOyRGDYStplHVVE6fn+QtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=Q5AK+4NypIlk8rRS3I711RmXejfY0OnnESySL2cldlE=;
        b=bQm2AFkfu8hxjpuiE8TTBMzELBXKR/wSzafBmVuen8WRQNu21XRea3D9JUrytgKpVLGuhsbs8Jt2e
         2sP1etwAA==
X-HalOne-Cookie: 24d84fb73bff50a580c06332d25b99da2f041561
X-HalOne-ID: 0a676264-05fa-11ed-be7f-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 0a676264-05fa-11ed-be7f-d0431ea8bb03;
        Sun, 17 Jul 2022 17:58:19 +0000 (UTC)
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
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 11/12] drm/bridge: Drop drm_bridge_funcs.mode_fixup
Date:   Sun, 17 Jul 2022 19:58:00 +0200
Message-Id: <20220717175801.78668-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717175801.78668-1-sam@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
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

All users are converted over to drm_bridge_funcs.atomic_check()
so it is safe to drop the mode_fixup support.

Update the comment for atomic_check with relevant parts from mode_fixup.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_bridge.c |  7 +----
 include/drm/drm_bridge.h     | 60 ++++++++++--------------------------
 2 files changed, 17 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index b6f56d8f3547..3f5acb19957c 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -685,10 +685,6 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 						  crtc_state, conn_state);
 		if (ret)
 			return ret;
-	} else if (bridge->funcs->mode_fixup) {
-		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
-					       &crtc_state->adjusted_mode))
-			return -EINVAL;
 	}
 
 	return 0;
@@ -934,8 +930,7 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
  * @conn_state: new connector state
  *
  * First trigger a bus format negotiation before calling
- * &drm_bridge_funcs.atomic_check() (falls back on
- * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder chain,
+ * &drm_bridge_funcs.atomic_check() op for all the bridges in the encoder chain,
  * starting from the last bridge to the first. These are called before calling
  * &drm_encoder_helper_funcs.atomic_check()
  *
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 7496f41535b1..8c93369bcc74 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -106,7 +106,7 @@ struct drm_bridge_funcs {
 	 * to look at anything else but the passed-in mode, and validate it
 	 * against configuration-invariant hardward constraints. Any further
 	 * limits which depend upon the configuration can only be checked in
-	 * @mode_fixup.
+	 * @atomic_check.
 	 *
 	 * RETURNS:
 	 *
@@ -116,46 +116,6 @@ struct drm_bridge_funcs {
 					   const struct drm_display_info *info,
 					   const struct drm_display_mode *mode);
 
-	/**
-	 * @mode_fixup:
-	 *
-	 * This callback is used to validate and adjust a mode. The parameter
-	 * mode is the display mode that should be fed to the next element in
-	 * the display chain, either the final &drm_connector or the next
-	 * &drm_bridge. The parameter adjusted_mode is the input mode the bridge
-	 * requires. It can be modified by this callback and does not need to
-	 * match mode. See also &drm_crtc_state.adjusted_mode for more details.
-	 *
-	 * This is the only hook that allows a bridge to reject a modeset. If
-	 * this function passes all other callbacks must succeed for this
-	 * configuration.
-	 *
-	 * The mode_fixup callback is optional. &drm_bridge_funcs.mode_fixup()
-	 * is not called when &drm_bridge_funcs.atomic_check() is implemented,
-	 * so only one of them should be provided.
-	 *
-	 * NOTE:
-	 *
-	 * This function is called in the check phase of atomic modesets, which
-	 * can be aborted for any reason (including on userspace's request to
-	 * just check whether a configuration would be possible). Drivers MUST
-	 * NOT touch any persistent state (hardware or software) or data
-	 * structures except the passed in @state parameter.
-	 *
-	 * Also beware that userspace can request its own custom modes, neither
-	 * core nor helpers filter modes to the list of probe modes reported by
-	 * the GETCONNECTOR IOCTL and stored in &drm_connector.modes. To ensure
-	 * that modes are filtered consistently put any bridge constraints and
-	 * limits checks into @mode_valid.
-	 *
-	 * RETURNS:
-	 *
-	 * True if an acceptable configuration is possible, false if the modeset
-	 * operation should be rejected.
-	 */
-	bool (*mode_fixup)(struct drm_bridge *bridge,
-			   const struct drm_display_mode *mode,
-			   struct drm_display_mode *adjusted_mode);
 	/**
 	 * @disable:
 	 *
@@ -466,9 +426,7 @@ struct drm_bridge_funcs {
 	 * &drm_bridge_funcs.atomic_check() hooks are called in reverse
 	 * order (from the last to the first bridge).
 	 *
-	 * This method is optional. &drm_bridge_funcs.mode_fixup() is not
-	 * called when &drm_bridge_funcs.atomic_check() is implemented, so only
-	 * one of them should be provided.
+	 * This method is optional.
 	 *
 	 * If drivers need to tweak &drm_bridge_state.input_bus_cfg.flags or
 	 * &drm_bridge_state.output_bus_cfg.flags it should happen in
@@ -478,6 +436,20 @@ struct drm_bridge_funcs {
 	 * &drm_connector.display_info.bus_flags if the bridge is the last
 	 * element in the chain.
 	 *
+	 * NOTE:
+	 *
+	 * This function is called in the check phase of atomic modesets, which
+	 * can be aborted for any reason (including on userspace's request to
+	 * just check whether a configuration would be possible). Drivers MUST
+	 * NOT touch any persistent state (hardware or software) or data
+	 * structures except the passed in @state parameter.
+	 *
+	 * Also beware that userspace can request its own custom modes, neither
+	 * core nor helpers filter modes to the list of probe modes reported by
+	 * the GETCONNECTOR IOCTL and stored in &drm_connector.modes. To ensure
+	 * that modes are filtered consistently put any bridge constraints and
+	 * limits checks into @mode_valid.
+	 *
 	 * RETURNS:
 	 * zero if the check passed, a negative error code otherwise.
 	 */
-- 
2.34.1

