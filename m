Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65F9477E319
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Aug 2023 15:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235528AbjHPN43 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Aug 2023 09:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244037AbjHPN4A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2023 09:56:00 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0DAEA1FCE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2023 06:55:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,177,1684767600"; 
   d="scan'208";a="176786537"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Aug 2023 22:55:58 +0900
Received: from localhost.localdomain (unknown [10.226.92.162])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3470F420C318;
        Wed, 16 Aug 2023 22:55:55 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, stable@kernel.org
Subject: [PATCH 1/2] regulator: raa215300: Fix resource leak in case of error
Date:   Wed, 16 Aug 2023 14:55:49 +0100
Message-Id: <20230816135550.146657-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230816135550.146657-1-biju.das.jz@bp.renesas.com>
References: <20230816135550.146657-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The clk_register_clkdev() allocates memory by calling vclkdev_alloc() and
this memory is not freed in the error path. Similarly, resources allocated
by clk_register_fixed_rate() are not freed in the error path.

Fix these issues by using devm_clk_hw_register_fixed_rate() and
devm_clk_hw_register_clkdev().

After this, the static variable clk is not needed. Replace it with 
local variable hw in probe() and drop calling clk_unregister_fixed_rate()
from raa215300_rtc_unregister_device().

Fixes: 7bce16630837 ("regulator: Add Renesas PMIC RAA215300 driver")
Cc: stable@kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/regulator/raa215300.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/raa215300.c b/drivers/regulator/raa215300.c
index 848a03a2fbd4..898f53cac02c 100644
--- a/drivers/regulator/raa215300.c
+++ b/drivers/regulator/raa215300.c
@@ -38,8 +38,6 @@
 #define RAA215300_REG_BLOCK_EN_RTC_EN	BIT(6)
 #define RAA215300_RTC_DEFAULT_ADDR	0x6f
 
-static struct clk *clk;
-
 static const struct regmap_config raa215300_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -49,10 +47,6 @@ static const struct regmap_config raa215300_regmap_config = {
 static void raa215300_rtc_unregister_device(void *data)
 {
 	i2c_unregister_device(data);
-	if (!clk) {
-		clk_unregister_fixed_rate(clk);
-		clk = NULL;
-	}
 }
 
 static int raa215300_clk_present(struct i2c_client *client, const char *name)
@@ -130,10 +124,16 @@ static int raa215300_i2c_probe(struct i2c_client *client)
 		u32 addr = RAA215300_RTC_DEFAULT_ADDR;
 		struct i2c_board_info info = {};
 		struct i2c_client *rtc_client;
+		struct clk_hw *hw;
 		ssize_t size;
 
-		clk = clk_register_fixed_rate(NULL, clk_name, NULL, 0, 32000);
-		clk_register_clkdev(clk, clk_name, NULL);
+		hw = devm_clk_hw_register_fixed_rate(dev, clk_name, NULL, 0, 32000);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		ret = devm_clk_hw_register_clkdev(dev, hw, clk_name, NULL);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to initialize clkdev\n");
 
 		if (np) {
 			int i;
-- 
2.25.1

