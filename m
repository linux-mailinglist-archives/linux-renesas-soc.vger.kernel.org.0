Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4F32590E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 22:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbfEUUd2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 16:33:28 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38586 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727575AbfEUUdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 16:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=GFTA6XoVc8f7GVZsJe6WRkalSk7oBHlXKcBiE/MyZiU=; b=Ysw/XRcMLvsb
        8rmnjcDbby3DTuHJ3o/1zHbk3+XQMKQfNfAvgBEfp00ZEt71k3WuPGtAZmytfXV6dN2afxss+7Ldz
        hiO65Uo5MBf3BFTyKT7jhftqPLM/h7YcCYTyb2qo4EkZrIz/dtx85N9p9INm8EaFEKDiFuDdI0ovs
        BhzNI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hTBRX-000220-Nk; Tue, 21 May 2019 20:33:03 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 8B2A11126D18; Tue, 21 May 2019 21:33:00 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Steve Twiss <stwiss.opensource@diasemi.com>
Subject: Applied "regulator: da9063: move definitions out of a header into the driver" to the regulator tree
In-Reply-To: <20190520093446.30895-3-wsa+renesas@sang-engineering.com>
X-Patchwork-Hint: ignore
Message-Id: <20190521203300.8B2A11126D18@debutante.sirena.org.uk>
Date:   Tue, 21 May 2019 21:33:00 +0100 (BST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   regulator: da9063: move definitions out of a header into the driver

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 824bd1be3ed01d67197098650d0c62b176087b11 Mon Sep 17 00:00:00 2001
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Mon, 20 May 2019 11:34:45 +0200
Subject: [PATCH] regulator: da9063: move definitions out of a header into the
 driver

Those definitions are only used within the driver meanwhile, so put them
there.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/da9063-regulator.c | 44 ++++++++++++++++++++++++-
 include/linux/mfd/da9063/pdata.h     | 49 ----------------------------
 2 files changed, 43 insertions(+), 50 deletions(-)

diff --git a/drivers/regulator/da9063-regulator.c b/drivers/regulator/da9063-regulator.c
index 43aa0df30346..da95197fdb4f 100644
--- a/drivers/regulator/da9063-regulator.c
+++ b/drivers/regulator/da9063-regulator.c
@@ -19,7 +19,6 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/mfd/da9063/core.h>
-#include <linux/mfd/da9063/pdata.h>
 #include <linux/mfd/da9063/registers.h>
 
 
@@ -28,6 +27,49 @@
 	REG_FIELD(_reg, __builtin_ffs((int)_mask) - 1, \
 		sizeof(unsigned int) * 8 - __builtin_clz((_mask)) - 1)
 
+/* DA9063 and DA9063L regulator IDs */
+enum {
+	/* BUCKs */
+	DA9063_ID_BCORE1,
+	DA9063_ID_BCORE2,
+	DA9063_ID_BPRO,
+	DA9063_ID_BMEM,
+	DA9063_ID_BIO,
+	DA9063_ID_BPERI,
+
+	/* BCORE1 and BCORE2 in merged mode */
+	DA9063_ID_BCORES_MERGED,
+	/* BMEM and BIO in merged mode */
+	DA9063_ID_BMEM_BIO_MERGED,
+	/* When two BUCKs are merged, they cannot be reused separately */
+
+	/* LDOs on both DA9063 and DA9063L */
+	DA9063_ID_LDO3,
+	DA9063_ID_LDO7,
+	DA9063_ID_LDO8,
+	DA9063_ID_LDO9,
+	DA9063_ID_LDO11,
+
+	/* DA9063-only LDOs */
+	DA9063_ID_LDO1,
+	DA9063_ID_LDO2,
+	DA9063_ID_LDO4,
+	DA9063_ID_LDO5,
+	DA9063_ID_LDO6,
+	DA9063_ID_LDO10,
+};
+
+/* Old regulator platform data */
+struct da9063_regulator_data {
+	int				id;
+	struct regulator_init_data	*initdata;
+};
+
+struct da9063_regulators_pdata {
+	unsigned			n_regulators;
+	struct da9063_regulator_data	*regulator_data;
+};
+
 /* Regulator capabilities and registers description */
 struct da9063_regulator_info {
 	struct regulator_desc desc;
diff --git a/include/linux/mfd/da9063/pdata.h b/include/linux/mfd/da9063/pdata.h
index 50bed4f89c1a..21a2d107f0cf 100644
--- a/include/linux/mfd/da9063/pdata.h
+++ b/include/linux/mfd/da9063/pdata.h
@@ -16,55 +16,6 @@
 #ifndef __MFD_DA9063_PDATA_H__
 #define __MFD_DA9063_PDATA_H__
 
-#include <linux/regulator/machine.h>
-
-/*
- * Regulator configuration
- */
-/* DA9063 and DA9063L regulator IDs */
-enum {
-	/* BUCKs */
-	DA9063_ID_BCORE1,
-	DA9063_ID_BCORE2,
-	DA9063_ID_BPRO,
-	DA9063_ID_BMEM,
-	DA9063_ID_BIO,
-	DA9063_ID_BPERI,
-
-	/* BCORE1 and BCORE2 in merged mode */
-	DA9063_ID_BCORES_MERGED,
-	/* BMEM and BIO in merged mode */
-	DA9063_ID_BMEM_BIO_MERGED,
-	/* When two BUCKs are merged, they cannot be reused separately */
-
-	/* LDOs on both DA9063 and DA9063L */
-	DA9063_ID_LDO3,
-	DA9063_ID_LDO7,
-	DA9063_ID_LDO8,
-	DA9063_ID_LDO9,
-	DA9063_ID_LDO11,
-
-	/* DA9063-only LDOs */
-	DA9063_ID_LDO1,
-	DA9063_ID_LDO2,
-	DA9063_ID_LDO4,
-	DA9063_ID_LDO5,
-	DA9063_ID_LDO6,
-	DA9063_ID_LDO10,
-};
-
-/* Regulators platform data */
-struct da9063_regulator_data {
-	int				id;
-	struct regulator_init_data	*initdata;
-};
-
-struct da9063_regulators_pdata {
-	unsigned			n_regulators;
-	struct da9063_regulator_data	*regulator_data;
-};
-
-
 /*
  * RGB LED configuration
  */
-- 
2.20.1

