Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2310F293833
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Oct 2020 11:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392945AbgJTJhG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Oct 2020 05:37:06 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:32951 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2392757AbgJTJhE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Oct 2020 05:37:04 -0400
X-IronPort-AV: E=Sophos;i="5.77,396,1596466800"; 
   d="scan'208";a="60282705"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Oct 2020 18:37:03 +0900
Received: from localhost.localdomain (unknown [172.29.52.189])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DCD80400090B;
        Tue, 20 Oct 2020 18:36:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/bridge: lvds-codec: Use dev_err_probe for error handling
Date:   Tue, 20 Oct 2020 10:36:55 +0100
Message-Id: <20201020093655.3584-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

dev_err_probe function simplifies error handling. So use the same in probe
function wherever possible.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/bridge/lvds-codec.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index f52ccffc1bd1..dcf579a4cf83 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -80,7 +80,6 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
-	int ret;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
 	if (!lvds_codec)
@@ -90,13 +89,9 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
 
 	lvds_codec->vcc = devm_regulator_get(lvds_codec->dev, "power");
-	if (IS_ERR(lvds_codec->vcc)) {
-		ret = PTR_ERR(lvds_codec->vcc);
-		if (ret != -EPROBE_DEFER)
-			dev_err(lvds_codec->dev,
-				"Unable to get \"vcc\" supply: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(lvds_codec->vcc))
+		return dev_err_probe(dev, PTR_ERR(lvds_codec->vcc),
+				     "Unable to get \"vcc\" supply\n");
 
 	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
 							     GPIOD_OUT_HIGH);
-- 
2.17.1

