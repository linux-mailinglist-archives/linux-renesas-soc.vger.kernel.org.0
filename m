Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1A3769160
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Jul 2023 11:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbjGaJSJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 05:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbjGaJRj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 05:17:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C065119A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:16:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQP1C-0000Cb-Ju; Mon, 31 Jul 2023 11:16:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQP1B-0005lM-TJ; Mon, 31 Jul 2023 11:16:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQP1A-009GVx-Uw; Mon, 31 Jul 2023 11:16:44 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 12/12] ata/sata_rcar: Convert to platform remove callback returning void
Date:   Mon, 31 Jul 2023 11:16:36 +0200
Message-Id: <20230731091636.693193-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731091636.693193-1-u.kleine-koenig@pengutronix.de>
References: <20230731091636.693193-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=BS+HPWqvfpOOyfh762W1BEcrMJu/vYZRKWMg/5yzIIA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkx3uL+qb/o+R3rCzSDrte8YLmWlyIL+7LO5gHl 2/kjB3WhS+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMd7iwAKCRCPgPtYfRL+ TiKGB/9vi0RA/Hm7pYrZWn/yuZwc4Xqh6iiclc3N2DPxOTsRKh9HEut50dsIlo5TV62krShS5gB M5/8zbVlTzmkOtHtqYUWkpKQNqPucnyfDc/M0pyNE0Ibtbcdl8E3UtDoe1sKWEm+/DUsu+KBqRG uxfVxwOUTbvTQF64UA++6Rkda3KX1Do7zqj0ErC1gI7fgJ3/QgGkuBRA0YJuAf+9XCVY0mzmzto 1mJ9+2Pc4BqjDUPHFdOs/oOCszFvqZS6yTym2Uq2gBmzxBZxoqwWRTUblCkv1xi6ZWxRh6oVML9 FO2NuvxTOQhCDQTxJqQVAjEfU34CA6Ceix1N0n58u7HoQyOZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/ata/sata_rcar.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index 34790f15c1b8..1a0752255959 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -914,7 +914,7 @@ static int sata_rcar_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sata_rcar_remove(struct platform_device *pdev)
+static void sata_rcar_remove(struct platform_device *pdev)
 {
 	struct ata_host *host = platform_get_drvdata(pdev);
 	struct sata_rcar_priv *priv = host->private_data;
@@ -930,8 +930,6 @@ static int sata_rcar_remove(struct platform_device *pdev)
 
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1016,7 +1014,7 @@ static const struct dev_pm_ops sata_rcar_pm_ops = {
 
 static struct platform_driver sata_rcar_driver = {
 	.probe		= sata_rcar_probe,
-	.remove		= sata_rcar_remove,
+	.remove_new	= sata_rcar_remove,
 	.driver = {
 		.name		= DRV_NAME,
 		.of_match_table	= sata_rcar_match,
-- 
2.39.2

