Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25C5223072
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 11:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbfETJfM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 05:35:12 -0400
Received: from sauhun.de ([88.99.104.3]:49566 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727626AbfETJfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 05:35:08 -0400
Received: from localhost (p54B333DA.dip0.t-ipconnect.de [84.179.51.218])
        by pokefinder.org (Postfix) with ESMTPSA id 81FC82C65C7;
        Mon, 20 May 2019 11:35:06 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH RESEND 2/3] regulator: da9063: move definitions out of a header into the driver
Date:   Mon, 20 May 2019 11:34:45 +0200
Message-Id: <20190520093446.30895-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190520093446.30895-1-wsa+renesas@sang-engineering.com>
References: <20190520093446.30895-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Those definitions are only used within the driver meanwhile, so put them
there.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>
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
2.19.1

