Return-Path: <linux-renesas-soc+bounces-617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F49280334F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 13:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EB981F2102A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 12:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBCC2377D;
	Mon,  4 Dec 2023 12:45:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 28CFCAA
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 04:45:12 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,249,1695654000"; 
   d="scan'208";a="185257219"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Dec 2023 21:45:12 +0900
Received: from localhost.localdomain (unknown [10.226.93.142])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E0F4440083D9;
	Mon,  4 Dec 2023 21:45:09 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mfd: da9062: Simplify obtaining I2C match data
Date: Mon,  4 Dec 2023 12:45:07 +0000
Message-Id: <20231204124507.124758-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify probe() by replacing of_device_get_match_data() and ID lookup for
retrieving match data by i2c_get_match_data().

Some minor cleanups:
 * Remove the trailing comma in the terminator entry for the ID
   table making code robust against (theoretical) misrebases or other
   similar things where the new entry goes _after_ the termination without
   the compiler noticing.
 * Move OF table near to the user.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mfd/da9062-core.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index 45da007d3e70..73a22107900c 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -588,16 +588,8 @@ static struct regmap_config da9062_regmap_config = {
 	.volatile_table = &da9062_aa_volatile_table,
 };
 
-static const struct of_device_id da9062_dt_ids[] = {
-	{ .compatible = "dlg,da9061", .data = (void *)COMPAT_TYPE_DA9061, },
-	{ .compatible = "dlg,da9062", .data = (void *)COMPAT_TYPE_DA9062, },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, da9062_dt_ids);
-
 static int da9062_i2c_probe(struct i2c_client *i2c)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
 	struct da9062 *chip;
 	unsigned int irq_base = 0;
 	const struct mfd_cell *cell;
@@ -611,10 +603,7 @@ static int da9062_i2c_probe(struct i2c_client *i2c)
 	if (!chip)
 		return -ENOMEM;
 
-	if (i2c->dev.of_node)
-		chip->chip_type = (uintptr_t)of_device_get_match_data(&i2c->dev);
-	else
-		chip->chip_type = id->driver_data;
+	chip->chip_type = (uintptr_t)i2c_get_match_data(i2c);
 
 	i2c_set_clientdata(i2c, chip);
 	chip->dev = &i2c->dev;
@@ -714,10 +703,17 @@ static void da9062_i2c_remove(struct i2c_client *i2c)
 	regmap_del_irq_chip(i2c->irq, chip->regmap_irq);
 }
 
+static const struct of_device_id da9062_dt_ids[] = {
+	{ .compatible = "dlg,da9061", .data = (void *)COMPAT_TYPE_DA9061 },
+	{ .compatible = "dlg,da9062", .data = (void *)COMPAT_TYPE_DA9062 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, da9062_dt_ids);
+
 static const struct i2c_device_id da9062_i2c_id[] = {
 	{ "da9061", COMPAT_TYPE_DA9061 },
 	{ "da9062", COMPAT_TYPE_DA9062 },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da9062_i2c_id);
 
-- 
2.25.1


