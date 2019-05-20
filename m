Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E11F2306F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 11:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbfETJfI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 05:35:08 -0400
Received: from sauhun.de ([88.99.104.3]:49556 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbfETJfH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 05:35:07 -0400
Received: from localhost (p54B333DA.dip0.t-ipconnect.de [84.179.51.218])
        by pokefinder.org (Postfix) with ESMTPSA id 27A5E2C5DC5;
        Mon, 20 May 2019 11:35:06 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH RESEND 1/3] regulator: da9063: remove platform_data support
Date:   Mon, 20 May 2019 11:34:44 +0200
Message-Id: <20190520093446.30895-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190520093446.30895-1-wsa+renesas@sang-engineering.com>
References: <20190520093446.30895-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are no in-kernel users anymore, so remove this outdated interface.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>
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
2.19.1

