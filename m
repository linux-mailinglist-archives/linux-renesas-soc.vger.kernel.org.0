Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 474997A52DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Sep 2023 21:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjIRTTm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Sep 2023 15:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjIRTTl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2023 15:19:41 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B9B10E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 12:19:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiJmI-0002pJ-DK; Mon, 18 Sep 2023 21:19:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiJmH-007I2j-R2; Mon, 18 Sep 2023 21:19:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiJmH-002m28-HM; Mon, 18 Sep 2023 21:19:25 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     =?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH net-next 8/9] net: dsa: rzn1_a5psw: Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 21:19:15 +0200
Message-Id: <20230918191916.1299418-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918191916.1299418-1-u.kleine-koenig@pengutronix.de>
References: <20230918191916.1299418-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ezyudjUK4jIuPLH326xqFF9neMeYNSsuRfOsYBz5gvg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCKKvoBwuhrUuoRID8Z2Soqek7Ut9EwW+QL87D g3myEVETM+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQiirwAKCRCPgPtYfRL+ Tii3CACgF4qFBSPHUz8six+xtbBPHMhhYtqdE7EEvaOLAm+wSN9sKz6S5dMAxBJJw0/s9nQS1zV /D2a2jcwgrE25gSF7TbOvbk9o8OKUtaJ27fTY1q3WJ8rNOgAkFtyPWruMVn3pcK2Bg7Et9ZnmKC dQY4goGrLqBBPT5wIKfpFLcaHHiCOO4oJv4/hJ6wjnt0/9C3fyHDgZv33e61q1dh/DqXy+7lVKg rdTxGPVm2KavswseZe6eC3PC/K3XKYcYSkHJclD90TFV7YvMF5ZyikFmN7znQwpIPMGvxgt2VaC O2Q5pGmRpv9XTwUgUTjLJfApAugZzmuk1FNqmg7SEaHMamkD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
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
 drivers/net/dsa/rzn1_a5psw.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 2eda10b33f2e..10092ea85e46 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1272,19 +1272,17 @@ static int a5psw_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int a5psw_remove(struct platform_device *pdev)
+static void a5psw_remove(struct platform_device *pdev)
 {
 	struct a5psw *a5psw = platform_get_drvdata(pdev);
 
 	if (!a5psw)
-		return 0;
+		return;
 
 	dsa_unregister_switch(&a5psw->ds);
 	a5psw_pcs_free(a5psw);
 	clk_disable_unprepare(a5psw->hclk);
 	clk_disable_unprepare(a5psw->clk);
-
-	return 0;
 }
 
 static void a5psw_shutdown(struct platform_device *pdev)
@@ -1311,7 +1309,7 @@ static struct platform_driver a5psw_driver = {
 		.of_match_table = a5psw_of_mtable,
 	},
 	.probe = a5psw_probe,
-	.remove = a5psw_remove,
+	.remove_new = a5psw_remove,
 	.shutdown = a5psw_shutdown,
 };
 module_platform_driver(a5psw_driver);
-- 
2.40.1

