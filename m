Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8587077A582
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Aug 2023 10:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjHMIF1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Aug 2023 04:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjHMIF0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Aug 2023 04:05:26 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 900F49D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Aug 2023 01:05:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,169,1684767600"; 
   d="scan'208";a="176498261"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Aug 2023 17:05:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 98FA341A1FFF;
        Sun, 13 Aug 2023 17:05:22 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Phong LE <ple@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: bridge: it66121: Extend match support for OF tables
Date:   Sun, 13 Aug 2023 09:05:20 +0100
Message-Id: <20230813080520.65813-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The driver has OF match table, still it uses ID lookup table for
retrieving match data. Replace ID look up with i2c_get_match_data()
for retrieving OF/ACPI/I2C match data by adding similar match data for
OF table.

While at it, drop unused local varibale id from probe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 This patch is only compile tested.
---
 drivers/gpu/drm/bridge/ite-it66121.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 466641c77fe9..a80246ef4ffe 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1501,7 +1501,6 @@ static const char * const it66121_supplies[] = {
 
 static int it66121_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
 	struct device_node *ep;
 	int ret;
@@ -1523,7 +1522,7 @@ static int it66121_probe(struct i2c_client *client)
 
 	ctx->dev = dev;
 	ctx->client = client;
-	ctx->info = (const struct it66121_chip_info *) id->driver_data;
+	ctx->info = i2c_get_match_data(client);
 
 	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
 	of_node_put(ep);
@@ -1609,13 +1608,6 @@ static void it66121_remove(struct i2c_client *client)
 	mutex_destroy(&ctx->lock);
 }
 
-static const struct of_device_id it66121_dt_match[] = {
-	{ .compatible = "ite,it66121" },
-	{ .compatible = "ite,it6610" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, it66121_dt_match);
-
 static const struct it66121_chip_info it66121_chip_info = {
 	.id = ID_IT66121,
 	.vid = 0x4954,
@@ -1628,6 +1620,13 @@ static const struct it66121_chip_info it6610_chip_info = {
 	.pid = 0x0611,
 };
 
+static const struct of_device_id it66121_dt_match[] = {
+	{ .compatible = "ite,it66121", &it66121_chip_info },
+	{ .compatible = "ite,it6610", &it6610_chip_info },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, it66121_dt_match);
+
 static const struct i2c_device_id it66121_id[] = {
 	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
 	{ "it6610", (kernel_ulong_t) &it6610_chip_info },
-- 
2.25.1

