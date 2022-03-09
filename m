Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A13994D3182
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Mar 2022 16:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbiCIPMT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Mar 2022 10:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233609AbiCIPMT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Mar 2022 10:12:19 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 25CD817DB98
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Mar 2022 07:11:20 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,167,1643641200"; 
   d="scan'208";a="113853373"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Mar 2022 00:11:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.170])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B7B1B400D0E2;
        Thu, 10 Mar 2022 00:11:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sia Jee Heng <jee.heng.sia@intel.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] drm/bridge: adv7533: Add option to disable lane switching
Date:   Wed,  9 Mar 2022 15:11:09 +0000
Message-Id: <20220309151109.20957-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
References: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Renesas RZ/{G2L,V2L} platforms changing the lanes from 4 to 3 at
lower frequencies causes display instability. On such platforms, it
is better to avoid switching lanes from 4 to 3 as it needs different
set of PLL parameter constraints to make the display stable with 3
lanes.

This patch adds an option to disable lane switching if
'adi,disable-lanes-override' property is present in DT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h | 1 +
 drivers/gpu/drm/bridge/adv7511/adv7533.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 592ecfcf00ca..7505601f10fb 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -368,6 +368,7 @@ struct adv7511 {
 	struct mipi_dsi_device *dsi;
 	u8 num_dsi_lanes;
 	bool use_timing_gen;
+	bool override_lanes;
 
 	enum adv7511_type type;
 	struct platform_device *audio_pdev;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index eb7579dec40a..7f6a8e95d70e 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -108,7 +108,7 @@ void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode)
 	if (adv->num_dsi_lanes != 4)
 		return;
 
-	if (mode->clock > 80000)
+	if (!adv->override_lanes || mode->clock > 80000)
 		lanes = 4;
 	else
 		lanes = 3;
@@ -195,6 +195,9 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 	adv->use_timing_gen = !of_property_read_bool(np,
 						"adi,disable-timing-generator");
 
+	adv->override_lanes = !of_property_read_bool(np,
+						"adi,disable-lanes-override");
+
 	/* TODO: Check if these need to be parsed by DT or not */
 	adv->rgb = true;
 	adv->embedded_sync = false;
-- 
2.17.1

