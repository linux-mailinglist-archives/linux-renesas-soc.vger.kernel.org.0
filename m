Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D7F77AA7E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Aug 2023 20:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjHMSF6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Aug 2023 14:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbjHMSF6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Aug 2023 14:05:58 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D915E1708
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Aug 2023 11:05:59 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,170,1684767600"; 
   d="scan'208";a="176521235"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Aug 2023 03:05:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C6301405E63A;
        Mon, 14 Aug 2023 03:05:53 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        Adam Ford <aford173@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/7] drm: adv7511: Add link_config feature bit to struct adv7511_chip_info
Date:   Sun, 13 Aug 2023 19:05:11 +0100
Message-Id: <20230813180512.307418-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The ADV7511 needs link configuration whereas ADV75{33,35} does not need
it. Add a feature bit link_config to struct adv7511_chip_info to handle
this difference.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 2a017bb31a14..627531f48f84 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -340,6 +340,7 @@ struct adv7511_chip_info {
 	const char * const *supply_names;
 	unsigned int num_supplies;
 	unsigned has_dsi:1;
+	unsigned link_config:1;
 };
 
 struct adv7511 {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 66b3f8fcf67d..6974c267b1d5 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1208,7 +1208,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	memset(&link_config, 0, sizeof(link_config));
 
-	if (adv7511->info->type == ADV7511)
+	if (info->link_config)
 		ret = adv7511_parse_dt(dev->of_node, &link_config);
 	else
 		ret = adv7533_parse_dt(dev->of_node, adv7511);
@@ -1297,7 +1297,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, adv7511);
 
-	if (info->type == ADV7511)
+	if (info->link_config)
 		adv7511_set_link_config(adv7511, &link_config);
 
 	ret = adv7511_cec_init(dev, adv7511);
@@ -1362,7 +1362,8 @@ static void adv7511_remove(struct i2c_client *i2c)
 static const struct adv7511_chip_info adv7511_chip_info = {
 	.type = ADV7511,
 	.supply_names = adv7511_supply_names,
-	.num_supplies = ARRAY_SIZE(adv7511_supply_names)
+	.num_supplies = ARRAY_SIZE(adv7511_supply_names),
+	.link_config = 1
 };
 
 static const struct adv7511_chip_info adv7533_chip_info = {
-- 
2.25.1

