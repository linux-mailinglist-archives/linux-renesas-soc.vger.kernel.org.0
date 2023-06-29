Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0AC742419
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jun 2023 12:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjF2KmJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Jun 2023 06:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbjF2KmI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Jun 2023 06:42:08 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1C5821FC1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jun 2023 03:42:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,168,1684767600"; 
   d="scan'208";a="166039164"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Jun 2023 19:42:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.226])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4C30041FE010;
        Thu, 29 Jun 2023 19:42:03 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] regulator: raa215300: Change the scope of the variables {clkin_name, xin_name}
Date:   Thu, 29 Jun 2023 11:42:00 +0100
Message-Id: <20230629104200.102663-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.7 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Change the scope of the variables {clkin_name, xin_name} from global->local
to fix the below warning.

drivers/regulator/raa215300.c:42:12: sparse: sparse: symbol 'xin_name' was
not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306250552.Fan9WTiN-lkp@intel.com/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Invert the second if-condition and exchange the two branches,
   to make the code flow easier to follow for the casual reader.
 * Pre-initialized clk_name to NULL and clk_name is set only when
   ret > 0.
 * RTC driver is instantiated only when there is valid clock. So replaced the
   if conditional check ret->clk_name.
 * Added Rb tag from Geert.
---
 drivers/regulator/raa215300.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/raa215300.c b/drivers/regulator/raa215300.c
index 24a1c89f5dbc..8e1a4c86b978 100644
--- a/drivers/regulator/raa215300.c
+++ b/drivers/regulator/raa215300.c
@@ -38,8 +38,6 @@
 #define RAA215300_REG_BLOCK_EN_RTC_EN	BIT(6)
 #define RAA215300_RTC_DEFAULT_ADDR	0x6f
 
-const char *clkin_name = "clkin";
-const char *xin_name = "xin";
 static struct clk *clk;
 
 static const struct regmap_config raa215300_regmap_config = {
@@ -71,8 +69,10 @@ static int raa215300_clk_present(struct i2c_client *client, const char *name)
 static int raa215300_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	const char *clk_name = xin_name;
+	const char *clkin_name = "clkin";
 	unsigned int pmic_version, val;
+	const char *xin_name = "xin";
+	const char *clk_name = NULL;
 	struct regmap *regmap;
 	int ret;
 
@@ -114,15 +114,17 @@ static int raa215300_i2c_probe(struct i2c_client *client)
 	ret = raa215300_clk_present(client, xin_name);
 	if (ret < 0) {
 		return ret;
-	} else if (!ret) {
+	} else if (ret) {
+		clk_name = xin_name;
+	} else {
 		ret = raa215300_clk_present(client, clkin_name);
 		if (ret < 0)
 			return ret;
-
-		clk_name = clkin_name;
+		if (ret)
+			clk_name = clkin_name;
 	}
 
-	if (ret) {
+	if (clk_name) {
 		char *name = pmic_version >= 0x12 ? "isl1208" : "raa215300_a0";
 		struct device_node *np = client->dev.of_node;
 		u32 addr = RAA215300_RTC_DEFAULT_ADDR;
-- 
2.25.1

