Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C50975656C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 15:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbjGQNsR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 09:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbjGQNsQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 09:48:16 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 11877A6;
        Mon, 17 Jul 2023 06:48:14 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="169508546"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jul 2023 22:48:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 95430400CF1C;
        Mon, 17 Jul 2023 22:48:12 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] i2c: mux: ltc4306: Simplify probe()
Date:   Mon, 17 Jul 2023 14:48:06 +0100
Message-Id: <20230717134807.265302-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230717134807.265302-1-biju.das.jz@bp.renesas.com>
References: <20230717134807.265302-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The ltc4306_id[].driver_data could store a pointer to the chips,
like for DT-based matching, making I2C and DT-based matching
more similar.

After that, we can simplify the probe() by replacing of_device_get_
match_data() and i2c_match_id() by i2c_get_match_data() as we have
similar I2C and DT-based matching table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added Rb tag from Geert.
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 5a03031519be..c7dfd5eba413 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -192,8 +192,8 @@ static int ltc4306_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 }
 
 static const struct i2c_device_id ltc4306_id[] = {
-	{ "ltc4305", ltc_4305 },
-	{ "ltc4306", ltc_4306 },
+	{ "ltc4305", .driver_data = (kernel_ulong_t)&chips[ltc_4305] },
+	{ "ltc4306", .driver_data = (kernel_ulong_t)&chips[ltc_4306] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc4306_id);
@@ -216,10 +216,9 @@ static int ltc4306_probe(struct i2c_client *client)
 	unsigned int val = 0;
 	int num, ret;
 
-	chip = of_device_get_match_data(&client->dev);
-
+	chip = i2c_get_match_data(client);
 	if (!chip)
-		chip = &chips[i2c_match_id(ltc4306_id, client)->driver_data];
+		return -ENODEV;
 
 	idle_disc = device_property_read_bool(&client->dev,
 					      "i2c-mux-idle-disconnect");
-- 
2.25.1

