Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA55D73D2DB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Jun 2023 20:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjFYSJM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Jun 2023 14:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjFYSJL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Jun 2023 14:09:11 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3D8911BC
        for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Jun 2023 11:09:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,157,1684767600"; 
   d="scan'208";a="168938942"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2023 03:09:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.45])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 220274005B48;
        Mon, 26 Jun 2023 03:09:06 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] regulator: raa215300: Change the scope of the variables {clkin_name, xin_name}
Date:   Sun, 25 Jun 2023 19:09:03 +0100
Message-Id: <20230625180903.142994-1-biju.das.jz@bp.renesas.com>
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
---
 drivers/regulator/raa215300.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/raa215300.c b/drivers/regulator/raa215300.c
index 24a1c89f5dbc..f58edb888e9f 100644
--- a/drivers/regulator/raa215300.c
+++ b/drivers/regulator/raa215300.c
@@ -38,8 +38,6 @@
 #define RAA215300_REG_BLOCK_EN_RTC_EN	BIT(6)
 #define RAA215300_RTC_DEFAULT_ADDR	0x6f
 
-const char *clkin_name = "clkin";
-const char *xin_name = "xin";
 static struct clk *clk;
 
 static const struct regmap_config raa215300_regmap_config = {
@@ -71,9 +69,11 @@ static int raa215300_clk_present(struct i2c_client *client, const char *name)
 static int raa215300_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	const char *clk_name = xin_name;
+	const char *clkin_name = "clkin";
 	unsigned int pmic_version, val;
+	const char *xin_name = "xin";
 	struct regmap *regmap;
+	const char *clk_name;
 	int ret;
 
 	regmap = devm_regmap_init_i2c(client, &raa215300_regmap_config);
@@ -120,6 +120,8 @@ static int raa215300_i2c_probe(struct i2c_client *client)
 			return ret;
 
 		clk_name = clkin_name;
+	} else {
+		clk_name = xin_name;
 	}
 
 	if (ret) {
-- 
2.25.1

