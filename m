Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A59EB23071
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 11:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731888AbfETJfM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 05:35:12 -0400
Received: from sauhun.de ([88.99.104.3]:49576 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727720AbfETJfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 05:35:08 -0400
Received: from localhost (p54B333DA.dip0.t-ipconnect.de [84.179.51.218])
        by pokefinder.org (Postfix) with ESMTPSA id DE2372C6EF1;
        Mon, 20 May 2019 11:35:06 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH RESEND 3/3] regulator: da9063: platform_data is gone, depend on OF
Date:   Mon, 20 May 2019 11:34:46 +0200
Message-Id: <20190520093446.30895-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190520093446.30895-1-wsa+renesas@sang-engineering.com>
References: <20190520093446.30895-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

With OF being the only configuration possibility left, depend on it to
simplify some code.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>
---
 drivers/regulator/Kconfig            |  2 +-
 drivers/regulator/da9063-regulator.c | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 6c37f0df9323..d63d8cbbee1d 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -257,7 +257,7 @@ config REGULATOR_DA9062
 
 config REGULATOR_DA9063
 	tristate "Dialog Semiconductor DA9063 regulators"
-	depends on MFD_DA9063
+	depends on MFD_DA9063 && OF
 	help
 	  Say y here to support the BUCKs and LDOs regulators found on
 	  DA9063 PMICs.
diff --git a/drivers/regulator/da9063-regulator.c b/drivers/regulator/da9063-regulator.c
index da95197fdb4f..02f816318fba 100644
--- a/drivers/regulator/da9063-regulator.c
+++ b/drivers/regulator/da9063-regulator.c
@@ -634,7 +634,6 @@ static const struct regulator_init_data *da9063_get_regulator_initdata(
 	return NULL;
 }
 
-#ifdef CONFIG_OF
 static struct of_regulator_match da9063_matches[] = {
 	[DA9063_ID_BCORE1]           = { .name = "bcore1"           },
 	[DA9063_ID_BCORE2]           = { .name = "bcore2"           },
@@ -712,15 +711,6 @@ static struct da9063_regulators_pdata *da9063_parse_regulators_dt(
 	*da9063_reg_matches = da9063_matches;
 	return pdata;
 }
-#else
-static struct da9063_regulators_pdata *da9063_parse_regulators_dt(
-		struct platform_device *pdev,
-		struct of_regulator_match **da9063_reg_matches)
-{
-	*da9063_reg_matches = NULL;
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 static int da9063_regulator_probe(struct platform_device *pdev)
 {
-- 
2.19.1

