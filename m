Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14E502590F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 22:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbfEUUdc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 16:33:32 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38572 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbfEUUdH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 16:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=bmvIEiaPvwxNBEi4qOTqIIqruPuqAhv0uMnLt/PR814=; b=efPrerpMolvq
        GWiuiBc9rz+esC5ci9CbPZBTwAi4lCYuefM31UnNVRzI78IpwO3+hMcQolU2V9PxJIGEM3ygRgvQt
        TyUJfwerRoZRP+g4FBgxZTUaOhP68zKiWqDLPyZ8enZx5N0KhHKTheMCLg6MK0v85LmyXFNNJoEUU
        Mlsvo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hTBRU-00021l-RC; Tue, 21 May 2019 20:33:00 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 4FAAB1126D13; Tue, 21 May 2019 21:33:00 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Steve Twiss <stwiss.opensource@diasemi.com>
Subject: Applied "regulator: da9063: platform_data is gone, depend on OF" to the regulator tree
In-Reply-To: <20190520093446.30895-4-wsa+renesas@sang-engineering.com>
X-Patchwork-Hint: ignore
Message-Id: <20190521203300.4FAAB1126D13@debutante.sirena.org.uk>
Date:   Tue, 21 May 2019 21:33:00 +0100 (BST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   regulator: da9063: platform_data is gone, depend on OF

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

From 973af54c5218335dbca2695fd97c20be2564438a Mon Sep 17 00:00:00 2001
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Mon, 20 May 2019 11:34:46 +0200
Subject: [PATCH] regulator: da9063: platform_data is gone, depend on OF

With OF being the only configuration possibility left, depend on it to
simplify some code.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/Kconfig            |  2 +-
 drivers/regulator/da9063-regulator.c | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index b8e39109cbc6..5e3a9e6547b0 100644
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
2.20.1

