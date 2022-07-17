Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4068E57779C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Jul 2022 19:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiGQR6Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Jul 2022 13:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiGQR6P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jul 2022 13:58:15 -0400
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093C613D5D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2022 10:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=Ie8mdCntK7qyM1ThoHTn0tAb6FNFfAz8fYfoPn1nKpM=;
        b=Owd4TR+EIAcR/w4IS9ir8ZcJOxNC7zfMKnLLOvEYaWyNhBD6xHyXdMeyWVSlHv8yuBoUu6GTdlV0M
         +N5PjTde+3Ugkzo3EnTrBclAEoZabbMu5LbWyaFQ2Xqq1dsx+GvCku2SfiQseFlvC9y1szOx/UjCz7
         sVDLt2A+KV6QCO4bTytrBcXafvcny+Bw9DonGSumNPJmvm9J4HlydnWkQO0E87ZmJfQsSsjO69Tpe4
         X3QqfpcIY1s30KdBaNVnCsaxv1IxTL7VGjS9nDe3aC9eTCv8FRR3uMzBT3QSRCcVccCY4NtCo1BXuQ
         0nJuEkYd8XyKOt8aZfKhOB6lxCuNSgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=Ie8mdCntK7qyM1ThoHTn0tAb6FNFfAz8fYfoPn1nKpM=;
        b=SJAzZOPeRrw1zNoIoWtZEdkJbmL6Ihhfv4xQ6otdBCl2YYmEUOZQyubn0ANmkK9oD5aYtc7xczVbI
         J81A1uACg==
X-HalOne-Cookie: 1e041dfdbe31dc4e91bc574cc7fddbd785b1642b
X-HalOne-ID: 05046757-05fa-11ed-be7f-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 05046757-05fa-11ed-be7f-d0431ea8bb03;
        Sun, 17 Jul 2022 17:58:11 +0000 (UTC)
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
Subject: [PATCH v1 08/12] drm/mediatek: Drop mtk_hdmi_bridge_mode_fixup
Date:   Sun, 17 Jul 2022 19:57:57 +0200
Message-Id: <20220717175801.78668-1-sam@ravnborg.org>
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

The implementation of drm_bridge_funcs.mode_fixup is optional
so there is no need to provide an empty implementation.
Drop mtk_hdmi_bridge_mode_fixup() so the driver no longer uses the
deprecated drm_bridge_funcs.mode_fixup() operation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index a63b76055f81..7321aa1ee6f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1293,13 +1293,6 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 	return 0;
 }
 
-static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
-				       const struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 					   struct drm_bridge_state *old_bridge_state)
 {
@@ -1399,7 +1392,6 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.attach = mtk_hdmi_bridge_attach,
-	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
 	.atomic_disable = mtk_hdmi_bridge_atomic_disable,
 	.atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
 	.mode_set = mtk_hdmi_bridge_mode_set,
-- 
2.34.1

