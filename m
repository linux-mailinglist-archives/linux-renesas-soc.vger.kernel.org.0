Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8127780C8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 15:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377155AbjHRNbo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 09:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377206AbjHRNba (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 09:31:30 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 73524E4F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 06:31:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,183,1684767600"; 
   d="scan'208";a="173283175"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 18 Aug 2023 22:31:23 +0900
Received: from localhost.localdomain (unknown [10.226.93.81])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 523884217EBA;
        Fri, 18 Aug 2023 22:31:21 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regulator: raa215300: Change rate from 32000->32768
Date:   Fri, 18 Aug 2023 14:31:17 +0100
Message-Id: <20230818133117.290897-1-biju.das.jz@bp.renesas.com>
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

Replace the rate 32000->32768 in devm_clk_hw_register_fixed_rate() as the
32kHz frequency mentioned in the hardware manual is actually 32.768kHz.

While at it, add the missing space in the comment block and also add
module description to Kconfig.

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/all/ZN3%2FSjL50ls+3dnD@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/regulator/Kconfig     | 7 ++++++-
 drivers/regulator/raa215300.c | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 086596239356..e02b21c40416 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1072,7 +1072,12 @@ config REGULATOR_RAA215300
 	depends on COMMON_CLK
 	depends on I2C
 	help
-	  Support for the Renesas RAA215300 PMIC.
+	  If you say yes to this option, support will be included for the
+	  regulators found in Renesas RAA215300 PMICs.
+
+	  Say M here if you want to include support for the regulators on the
+	  Renesas RAA215300 PMICs as a module. The module will be named
+	  "raa215300".
 
 config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
 	tristate "Raspberry Pi 7-inch touchscreen panel ATTINY regulator"
diff --git a/drivers/regulator/raa215300.c b/drivers/regulator/raa215300.c
index bdbf1e4ce468..6982565c8aa4 100644
--- a/drivers/regulator/raa215300.c
+++ b/drivers/regulator/raa215300.c
@@ -86,7 +86,7 @@ static int raa215300_i2c_probe(struct i2c_client *client)
 	val &= RAA215300_REG_BLOCK_EN_RTC_EN;
 	regmap_write(regmap, RAA215300_REG_BLOCK_EN, val);
 
-	/*Clear the latched registers */
+	/* Clear the latched registers */
 	regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_1, &val);
 	regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_1, val);
 	regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_2, &val);
@@ -127,7 +127,7 @@ static int raa215300_i2c_probe(struct i2c_client *client)
 		struct clk_hw *hw;
 		ssize_t size;
 
-		hw = devm_clk_hw_register_fixed_rate(dev, clk_name, NULL, 0, 32000);
+		hw = devm_clk_hw_register_fixed_rate(dev, clk_name, NULL, 0, 32768);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);
 
-- 
2.25.1

