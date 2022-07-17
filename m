Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D8D577788
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Jul 2022 19:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbiGQRpR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Jul 2022 13:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiGQRpQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jul 2022 13:45:16 -0400
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D97D6DF89
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2022 10:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=Fr26D2ca3PHdfYt82xP4O3qHYRqQcjO5dKvaWIOgNBE=;
        b=JSzummkp8PX0dmwtxN7hkOfqVk7KPXZXT7dncb2h2pW3SYrZ/UfnCOkF4nppkRoKbtxjnWZwl2gnJ
         FeSMcCKfdkQ4EK7Y6LYEeJr5oWd+ugr7K8yF14/xdIE5VNrJWK674ChkoxvC+lN5mB5m2qcpZOQ1aJ
         ek8Ws35wRL8qerXjhvihzyUYJOQ6xKVMIUIJ649yQgXsIUKJ2pBxE6q48HqA+yODr0tIwUTCV16qbz
         yvq8byD+gr3niIpINXHUXMCOOFzfCID9YqSSnAAA5XPmJP5ikuQ6syRVMiAoXRxUwphkz01y+rPKxA
         9w/kYQVbMh9QwmGl2ugD1ltNGVQyh0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=Fr26D2ca3PHdfYt82xP4O3qHYRqQcjO5dKvaWIOgNBE=;
        b=bp33bWHdJ/F16zfPQlZFJBx92uYHy/9BWgyz/kR+lggXBSx57hYIjg8TJIbpKYHWB1EyGye2UDt18
         DYaeHfzBQ==
X-HalOne-Cookie: 31248d9cf3a18da4ee56357dc78f2dda447207e8
X-HalOne-ID: 35c44d3c-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 35c44d3c-05f8-11ed-823f-d0431ea8bb10;
        Sun, 17 Jul 2022 17:45:13 +0000 (UTC)
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
Subject: [PATCH v1 05/12] drm/bridge: sii8620: Use drm_bridge_funcs.atomic_check
Date:   Sun, 17 Jul 2022 19:44:47 +0200
Message-Id: <20220717174454.46616-6-sam@ravnborg.org>
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

Replace the deprecated drm_bridge_funcs.mode_fixup() with
drm_bridge_funcs.atomic_check().

drm_bridge_funcs.atomic_check() requires the atomic state operations,
update these to the default implementations.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/sil-sii8620.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index ab0bce4a988c..b6e5c285c8ea 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -8,6 +8,7 @@
 
 #include <asm/unaligned.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/bridge/mhl.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
@@ -2262,26 +2263,30 @@ static enum drm_mode_status sii8620_mode_valid(struct drm_bridge *bridge,
 	}
 }
 
-static bool sii8620_mode_fixup(struct drm_bridge *bridge,
-			       const struct drm_display_mode *mode,
-			       struct drm_display_mode *adjusted_mode)
+static int sii8620_atomic_check(struct drm_bridge *bridge,
+				struct drm_bridge_state *bridge_state,
+				struct drm_crtc_state *crtc_state,
+				struct drm_connector_state *conn_state)
 {
 	struct sii8620 *ctx = bridge_to_sii8620(bridge);
 
 	mutex_lock(&ctx->lock);
 
-	ctx->use_packed_pixel = sii8620_is_packing_required(ctx, adjusted_mode);
+	ctx->use_packed_pixel = sii8620_is_packing_required(ctx, &crtc_state->adjusted_mode);
 
 	mutex_unlock(&ctx->lock);
 
-	return true;
+	return 0;
 }
 
 static const struct drm_bridge_funcs sii8620_bridge_funcs = {
 	.attach = sii8620_attach,
 	.detach = sii8620_detach,
-	.mode_fixup = sii8620_mode_fixup,
+	.atomic_check = sii8620_atomic_check,
 	.mode_valid = sii8620_mode_valid,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static int sii8620_probe(struct i2c_client *client,
-- 
2.34.1

