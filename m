Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63036781B5B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 01:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjHSXhT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Aug 2023 19:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjHSXhR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Aug 2023 19:37:17 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CA58C2204C9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Aug 2023 11:31:59 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="173349262"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 20 Aug 2023 03:31:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.22])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 73A114050728;
        Sun, 20 Aug 2023 03:31:57 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mfd: mc13xxx: Simplify probe()
Date:   Sat, 19 Aug 2023 19:31:55 +0100
Message-Id: <20230819183155.22335-1-biju.das.jz@bp.renesas.com>
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

Simplify probe() by replacing of_match_device() and ID lookup
for retrieving match data by i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 * This patch is only compile tested.
---
 drivers/mfd/mc13xxx-i2c.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mfd/mc13xxx-i2c.c b/drivers/mfd/mc13xxx-i2c.c
index de59b498c925..6bc0e755ba34 100644
--- a/drivers/mfd/mc13xxx-i2c.c
+++ b/drivers/mfd/mc13xxx-i2c.c
@@ -53,7 +53,6 @@ static const struct regmap_config mc13xxx_regmap_i2c_config = {
 
 static int mc13xxx_i2c_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct mc13xxx *mc13xxx;
 	int ret;
 
@@ -73,13 +72,7 @@ static int mc13xxx_i2c_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	if (client->dev.of_node) {
-		const struct of_device_id *of_id =
-			of_match_device(mc13xxx_dt_ids, &client->dev);
-		mc13xxx->variant = of_id->data;
-	} else {
-		mc13xxx->variant = (void *)id->driver_data;
-	}
+	mc13xxx->variant = i2c_get_match_data(client);
 
 	return mc13xxx_common_init(&client->dev);
 }
-- 
2.25.1

