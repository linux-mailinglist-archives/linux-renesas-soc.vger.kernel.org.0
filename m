Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45D04577787
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Jul 2022 19:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiGQRpQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Jul 2022 13:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiGQRpQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jul 2022 13:45:16 -0400
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62C0E038
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2022 10:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=tUNzKCt4Zms15cwedQlM5lolVcnjoxkbNdM9xZbtnXY=;
        b=HdFn1ETyit4OaCqBQQGlXtNovIrF5rsy8lLAHWcEcybftrSgiT5SCEwEt72LJrOHNE2arLyDhwwam
         PR28Mf/SOxeBE/mtbQmHDcINjP8Gb038jncvvFlMp/FwdDn8Vyg/pYBfUBM9651pUIxN3qB0Ijw1fz
         LUgVEmwfBhU/sgSVPfRFJmwTnbKEGmOFX7ocgIJGLqNdaUloXEgjWnfaoYCSaoew7QYNfklTOBOm5c
         Vw1b5xHu5hmm+1R7u1EZVZGYWd8JXe+FbmhMnUYstOJSSxINZFiBZBjDh+HFuv9+yI6eP2HbA85Ys4
         vL6jXWNWdDL8gTcY60TOIXPESd1Z3hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=tUNzKCt4Zms15cwedQlM5lolVcnjoxkbNdM9xZbtnXY=;
        b=KEmxVha5B+qyEWKB+Yxxo71t4ryP28oUobas/F9bGwH0PvgiUzrAUENXT4o5Oa9vcpdEQUPfW15dr
         H17Zrc5Ag==
X-HalOne-Cookie: c5eba13afd76c8abb22d288d6bb6ff2fa5436d67
X-HalOne-ID: 3503b0f2-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 3503b0f2-05f8-11ed-823f-d0431ea8bb10;
        Sun, 17 Jul 2022 17:45:12 +0000 (UTC)
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
Subject: [PATCH v1 04/12] drm/bridge: Drop drm_bridge_chain_mode_fixup
Date:   Sun, 17 Jul 2022 19:44:46 +0200
Message-Id: <20220717174454.46616-5-sam@ravnborg.org>
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

There are no users left of drm_bridge_chain_mode_fixup() and we
do not want to have this function available, so drop it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_bridge.c | 37 ------------------------------------
 include/drm/drm_bridge.h     |  3 ---
 2 files changed, 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index bb7fc09267af..b6f56d8f3547 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -430,43 +430,6 @@ void drm_bridge_detach(struct drm_bridge *bridge)
  *   needed, in order to gradually transition to the new model.
  */
 
-/**
- * drm_bridge_chain_mode_fixup - fixup proposed mode for all bridges in the
- *				 encoder chain
- * @bridge: bridge control structure
- * @mode: desired mode to be set for the bridge
- * @adjusted_mode: updated mode that works for this bridge
- *
- * Calls &drm_bridge_funcs.mode_fixup for all the bridges in the
- * encoder chain, starting from the first bridge to the last.
- *
- * Note: the bridge passed should be the one closest to the encoder
- *
- * RETURNS:
- * true on success, false on failure
- */
-bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adjusted_mode)
-{
-	struct drm_encoder *encoder;
-
-	if (!bridge)
-		return true;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (!bridge->funcs->mode_fixup)
-			continue;
-
-		if (!bridge->funcs->mode_fixup(bridge, mode, adjusted_mode))
-			return false;
-	}
-
-	return true;
-}
-EXPORT_SYMBOL(drm_bridge_chain_mode_fixup);
-
 /**
  * drm_bridge_chain_mode_valid - validate the mode against all bridges in the
  *				 encoder chain.
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1eca9c4c3346..7496f41535b1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -845,9 +845,6 @@ drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
 #define drm_for_each_bridge_in_chain(encoder, bridge)			\
 	list_for_each_entry(bridge, &(encoder)->bridge_chain, chain_node)
 
-bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adjusted_mode);
 enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 			    const struct drm_display_info *info,
-- 
2.34.1

