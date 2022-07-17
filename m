Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEB1577786
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Jul 2022 19:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiGQRpP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Jul 2022 13:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiGQRpO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jul 2022 13:45:14 -0400
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CD0DF89
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2022 10:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=khsqBXRM54QJ2q7TOizpyWUV+ilhMIlPa9CBnk0oMYM=;
        b=JqMVyi++sVW9vegkEzG1P8/bWVglvBFotUUJ7xMMP1WjvBA/fdg1s7FRHhRrGG4k7nbk0/eCVB1Ts
         xm84rftCcNrZusJ5wtb3S/mhScM3y7tF8aGomk8cqAPor/rRsEzUKR8TPilTBKW+nr6Wg1xYS0/Ksw
         XOhZupgkIVKYoYxQFoEOc2Pn7A1Hr2A+oOdv1EGDX09/Beb1da9H5vlfXIBYGQe+9730nxblEztuv5
         xnzigYW5Wm77uoCTqA7CYzD0FxuNoB+yhuniEYPNpiURqPS5f40OYNwvSmqmxDEMwpHYpx+nveDW4q
         XpNd11d0hlPcKRc6nI8CVP7gGnctDUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=khsqBXRM54QJ2q7TOizpyWUV+ilhMIlPa9CBnk0oMYM=;
        b=8nI+HJ6COK6NBXeBpaMj21RW9LZPgXsN1/LCu8lKQCSM5tDQ2G3jIbOgOwmV8AI/vIjVrukxxeD/G
         AfOclUnCg==
X-HalOne-Cookie: 170ca66534e4be9ddd0a7847aca552fa493452f1
X-HalOne-ID: 34560b44-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 34560b44-05f8-11ed-823f-d0431ea8bb10;
        Sun, 17 Jul 2022 17:45:11 +0000 (UTC)
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
Subject: [PATCH v1 03/12] drm/mediatek: Drop chain_mode_fixup call in mode_valid()
Date:   Sun, 17 Jul 2022 19:44:45 +0200
Message-Id: <20220717174454.46616-4-sam@ravnborg.org>
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

The mode_valid implementation had a call to
drm_bridge_chain_mode_fixup() which would be wrong as the mode_valid is
not allowed to change anything - only to validate the mode.

As the next bridge is often/always a connector the call had no effect
anyway. So drop it.

From the git history I could see this call was included in the original
version of the driver so there was no help there to find out why it was
added in the first place. But a lot has changed since the initial driver
were added and is seems safe to remove the call now.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 3196189429bc..a63b76055f81 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1208,22 +1208,11 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 				      const struct drm_display_mode *mode)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
-	struct drm_bridge *next_bridge;
 
 	dev_dbg(hdmi->dev, "xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
 		mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
 		!!(mode->flags & DRM_MODE_FLAG_INTERLACE), mode->clock * 1000);
 
-	next_bridge = drm_bridge_get_next_bridge(&hdmi->bridge);
-	if (next_bridge) {
-		struct drm_display_mode adjusted_mode;
-
-		drm_mode_copy(&adjusted_mode, mode);
-		if (!drm_bridge_chain_mode_fixup(next_bridge, mode,
-						 &adjusted_mode))
-			return MODE_BAD;
-	}
-
 	if (hdmi->conf) {
 		if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
 			return MODE_BAD;
-- 
2.34.1

