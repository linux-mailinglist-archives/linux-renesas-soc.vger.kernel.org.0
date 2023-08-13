Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7764C77A5A6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Aug 2023 10:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjHMIvn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Aug 2023 04:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjHMIvn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Aug 2023 04:51:43 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1FAA0170C
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Aug 2023 01:51:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,169,1684767600"; 
   d="scan'208";a="172815530"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Aug 2023 17:51:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2114740083E6;
        Sun, 13 Aug 2023 17:51:38 +0900 (JST)
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
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Zhu Wang <wangzhu9@huawei.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support for ID table
Date:   Sun, 13 Aug 2023 09:51:37 +0100
Message-Id: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The driver has ID  table, but still it uses device_get_match_data()
for retrieving match data. Replace device_get_match_data->
i2c_get_match_data() for retrieving OF/ACPI/I2C match data by adding
match data for ID table similar to OF table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is only compile tested
---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 800555aef97f..f56a46b993a7 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1259,7 +1259,7 @@ static int anx78xx_i2c_probe(struct i2c_client *client)
 	}
 
 	/* Map slave addresses of ANX7814 */
-	i2c_addresses = device_get_match_data(&client->dev);
+	i2c_addresses = i2c_get_match_data(client);
 	for (i = 0; i < I2C_NUM_ADDRESSES; i++) {
 		struct i2c_client *i2c_dummy;
 
@@ -1368,7 +1368,7 @@ static void anx78xx_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id anx78xx_id[] = {
-	{ "anx7814", 0 },
+	{ "anx7814", (kernel_ulong_t)anx781x_i2c_addresses },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, anx78xx_id);
-- 
2.25.1

