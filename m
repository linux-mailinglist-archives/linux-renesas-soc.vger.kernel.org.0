Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4E778DC9C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Aug 2023 20:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242526AbjH3SqH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Aug 2023 14:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245051AbjH3OY5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2023 10:24:57 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79A78132
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Aug 2023 07:24:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,213,1688396400"; 
   d="scan'208";a="178194115"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Aug 2023 23:24:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CBC7842170F5;
        Wed, 30 Aug 2023 23:24:47 +0900 (JST)
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
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 7/8] drm: adv7511: Add link_config variable to struct adv7511_chip_info
Date:   Wed, 30 Aug 2023 15:23:57 +0100
Message-Id: <20230830142358.275459-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
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
it. Add a variable link_config to struct adv7511_chip_info to handle
this difference.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v1->v2:
 * Add Rb tag from Laurent.
 * Replaced variable type from unsigned->bool.
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 0dd56e311039..0d39e32b0793 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -341,6 +341,7 @@ struct adv7511_chip_info {
 	unsigned int num_supplies;
 	unsigned int reg_cec_offset;
 	bool has_dsi;
+	bool link_config;
 };
 
 struct adv7511 {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9d88c29b6f59..e0ec3c098225 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1203,7 +1203,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	memset(&link_config, 0, sizeof(link_config));
 
-	if (adv7511->info->type == ADV7511)
+	if (adv7511->info->link_config)
 		ret = adv7511_parse_dt(dev->of_node, &link_config);
 	else
 		ret = adv7533_parse_dt(dev->of_node, adv7511);
@@ -1292,7 +1292,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, adv7511);
 
-	if (adv7511->info->type == ADV7511)
+	if (adv7511->info->link_config)
 		adv7511_set_link_config(adv7511, &link_config);
 
 	ret = adv7511_cec_init(dev, adv7511);
@@ -1358,6 +1358,7 @@ static const struct adv7511_chip_info adv7511_chip_info = {
 	.type = ADV7511,
 	.supply_names = adv7511_supply_names,
 	.num_supplies = ARRAY_SIZE(adv7511_supply_names),
+	.link_config = true,
 };
 
 static const struct adv7511_chip_info adv7533_chip_info = {
-- 
2.25.1

