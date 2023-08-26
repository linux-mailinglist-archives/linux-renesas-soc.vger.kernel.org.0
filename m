Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 304DD789433
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 09:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjHZHT0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Aug 2023 03:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbjHZHTS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 03:19:18 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D21952136
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Aug 2023 00:19:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400"; 
   d="scan'208";a="177732758"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2023 16:19:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DE9874167444;
        Sat, 26 Aug 2023 16:19:10 +0900 (JST)
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
        Douglas Anderson <dianders@chromium.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Zhu Wang <wangzhu9@huawei.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 1/2] drm/bridge/analogix/anx78xx: Drop ID table
Date:   Sat, 26 Aug 2023 08:19:00 +0100
Message-Id: <20230826071901.29420-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230826071901.29420-1-biju.das.jz@bp.renesas.com>
References: <20230826071901.29420-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The driver has an ID table, but it uses the wrong API for retrieving match
data and that will lead to a crash, if it is instantiated by user space or
using ID. From this, there is no user for the ID table and let's drop it
from the driver as it saves some memory.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v3->v4:
 * Added Rb tag from Laurent and Douglas Anderson.
v2->v3:
 * Updated commit header.
v1->v2:
 * Dropped ID table support.
---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 800555aef97f..6169db73d2fe 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1367,12 +1367,6 @@ static void anx78xx_i2c_remove(struct i2c_client *client)
 	kfree(anx78xx->edid);
 }
 
-static const struct i2c_device_id anx78xx_id[] = {
-	{ "anx7814", 0 },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(i2c, anx78xx_id);
-
 static const struct of_device_id anx78xx_match_table[] = {
 	{ .compatible = "analogix,anx7808", .data = anx7808_i2c_addresses },
 	{ .compatible = "analogix,anx7812", .data = anx781x_i2c_addresses },
@@ -1389,7 +1383,6 @@ static struct i2c_driver anx78xx_driver = {
 		  },
 	.probe = anx78xx_i2c_probe,
 	.remove = anx78xx_i2c_remove,
-	.id_table = anx78xx_id,
 };
 module_i2c_driver(anx78xx_driver);
 
-- 
2.25.1

