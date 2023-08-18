Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8255378110C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 18:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378803AbjHRQzf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 12:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378844AbjHRQzO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 12:55:14 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 455C32D64
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 09:55:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,183,1684767600"; 
   d="scan'208";a="176985276"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Aug 2023 01:55:10 +0900
Received: from localhost.localdomain (unknown [10.226.93.81])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1246B4021B55;
        Sat, 19 Aug 2023 01:55:05 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Phong LE <ple@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] drm: bridge: it66121: Simplify probe()
Date:   Fri, 18 Aug 2023 17:54:52 +0100
Message-Id: <20230818165452.320984-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230818165452.320984-1-biju.das.jz@bp.renesas.com>
References: <20230818165452.320984-1-biju.das.jz@bp.renesas.com>
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

Simplify probe() by replacing of_device_get_match_data() and ID lookup
for retrieving match data by i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped sentence for dropping local variable as it is integral part of
   the patch.
---
 drivers/gpu/drm/bridge/ite-it66121.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index ba95ad46e259..a80246ef4ffe 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1501,7 +1501,6 @@ static const char * const it66121_supplies[] = {
 
 static int it66121_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
 	struct device_node *ep;
 	int ret;
@@ -1523,10 +1522,7 @@ static int it66121_probe(struct i2c_client *client)
 
 	ctx->dev = dev;
 	ctx->client = client;
-	if (dev_fwnode(&client->dev))
-		ctx->info = of_device_get_match_data(&client->dev);
-	else
-		ctx->info = (const struct it66121_chip_info *) id->driver_data;
+	ctx->info = i2c_get_match_data(client);
 
 	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
 	of_node_put(ep);
-- 
2.25.1

