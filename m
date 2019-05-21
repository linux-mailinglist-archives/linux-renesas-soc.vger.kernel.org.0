Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34E59258FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 22:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbfEUUdH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 16:33:07 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38538 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727428AbfEUUdH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 16:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=jGakuFrJnhjSPXCSydvZnq98XscxkYg4Ru/035twrF0=; b=tTM4c6QQLuWq
        tUkW9af2J6OG3PFeRDyuS5a5MCrWA8r4BMKK/SJ3UgLbThLxHsehWfxLdPBkCJjcMcMbcNIB5m/C9
        0mL/7Emv36GzhF537d31erv8vxi0XQCox8pmataSw/pjf+HFKAbg2SZwdCkJO9ROmsMkCN6639BA9
        gLYpw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hTBRV-00021o-8r; Tue, 21 May 2019 20:33:01 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id C5CDB1126D1A; Tue, 21 May 2019 21:33:00 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Steve Twiss <stwiss.opensource@diasemi.com>
Subject: Applied "regulator: da9063: remove platform_data support" to the regulator tree
In-Reply-To: <20190520093446.30895-2-wsa+renesas@sang-engineering.com>
X-Patchwork-Hint: ignore
Message-Id: <20190521203300.C5CDB1126D1A@debutante.sirena.org.uk>
Date:   Tue, 21 May 2019 21:33:00 +0100 (BST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   regulator: da9063: remove platform_data support

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

From 662307294f27975096f0a45e1b2dc5c84a966c1b Mon Sep 17 00:00:00 2001
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Mon, 20 May 2019 11:34:44 +0200
Subject: [PATCH] regulator: da9063: remove platform_data support

There are no in-kernel users anymore, so remove this outdated interface.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/da9063-regulator.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/regulator/da9063-regulator.c b/drivers/regulator/da9063-regulator.c
index 6f9ce1a6e44d..43aa0df30346 100644
--- a/drivers/regulator/da9063-regulator.c
+++ b/drivers/regulator/da9063-regulator.c
@@ -683,7 +683,6 @@ static struct da9063_regulators_pdata *da9063_parse_regulators_dt(
 static int da9063_regulator_probe(struct platform_device *pdev)
 {
 	struct da9063 *da9063 = dev_get_drvdata(pdev->dev.parent);
-	struct da9063_pdata *da9063_pdata = dev_get_platdata(da9063->dev);
 	struct of_regulator_match *da9063_reg_matches = NULL;
 	struct da9063_regulators_pdata *regl_pdata;
 	const struct da9063_dev_model *model;
@@ -693,11 +692,7 @@ static int da9063_regulator_probe(struct platform_device *pdev)
 	bool bcores_merged, bmem_bio_merged;
 	int id, irq, n, n_regulators, ret, val;
 
-	regl_pdata = da9063_pdata ? da9063_pdata->regulators_pdata : NULL;
-
-	if (!regl_pdata)
-		regl_pdata = da9063_parse_regulators_dt(pdev,
-							&da9063_reg_matches);
+	regl_pdata = da9063_parse_regulators_dt(pdev, &da9063_reg_matches);
 
 	if (IS_ERR(regl_pdata) || regl_pdata->n_regulators == 0) {
 		dev_err(&pdev->dev,
-- 
2.20.1

