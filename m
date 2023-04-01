Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 499916D328C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Apr 2023 18:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjDAQUE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 Apr 2023 12:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDAQUD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Apr 2023 12:20:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3762D5E
        for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Apr 2023 09:20:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxN-00009j-2u; Sat, 01 Apr 2023 18:19:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxL-008GSm-JT; Sat, 01 Apr 2023 18:19:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxK-009khY-Dj; Sat, 01 Apr 2023 18:19:54 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 39/49] mtd: rawnand: renesas: Convert to platform remove callback returning void
Date:   Sat,  1 Apr 2023 18:19:28 +0200
Message-Id: <20230401161938.2503204-40-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=gCkd0kQYH0yqAD5z8JJPYsdxxLL+nMTSfiU1Ye2kvJc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlKGrs3kW0HWbv+BREGmgko7MmQtzQoVAwq7 zzJ9BT3s1yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZSgAKCRCPgPtYfRL+ TkRICACMByzQD3H+9q4YrpmHGekHt0ruPg7GY+C+TJtCYkyukcmEXeTnZBkeODX7YvXVzBxmWp0 CaMbHGN7ZLksa/nCsz7cbI+67PmuRbXx3Zbeilu0mag7qk2QW0TXkGISSLIRGKWK3kpfiQuMIsg KkuIZj2DhvloKHcpKcO2nQ/e0GfU0BCF0KicViStmPeRwnoqOvbjwJpsMJDmms0D88OohjKMVy+ HHtrC1ApF5TYf3iAftr8YhDfqZtqrP1YYQFTTYNzzliLq8+zxca6aXtqmwSu0LSIjnfYSomKI3+ nV+VNY2T+DqAzMP1KCSyFHyCpGQvD30+dM1BB1WIJbukPdOZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 1620e25a1147..589021ea9eb2 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1386,15 +1386,13 @@ static int rnandc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rnandc_remove(struct platform_device *pdev)
+static void rnandc_remove(struct platform_device *pdev)
 {
 	struct rnandc *rnandc = platform_get_drvdata(pdev);
 
 	rnandc_chips_cleanup(rnandc);
 
 	pm_runtime_put(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id rnandc_id_table[] = {
@@ -1410,7 +1408,7 @@ static struct platform_driver rnandc_driver = {
 		.of_match_table = rnandc_id_table,
 	},
 	.probe = rnandc_probe,
-	.remove = rnandc_remove,
+	.remove_new = rnandc_remove,
 };
 module_platform_driver(rnandc_driver);
 
-- 
2.39.2

