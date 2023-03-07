Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B556ADE29
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Mar 2023 12:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjCGL7W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Mar 2023 06:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjCGL7V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 06:59:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CBE2CC71
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2023 03:59:19 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyJ-0006X3-Sx; Tue, 07 Mar 2023 12:59:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyJ-002TFj-3J; Tue, 07 Mar 2023 12:59:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyH-002yjZ-7t; Tue, 07 Mar 2023 12:59:09 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 16/31] phy: renesas: phy-rcar-gen3-usb2: Convert to platform remove callback returning void
Date:   Tue,  7 Mar 2023 12:58:45 +0100
Message-Id: <20230307115900.2293120-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WisVgHy/RqhTnCNgdYwPxuA+rXdOAoFKX4xzSp7mOGM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkBybCf172hI2FEdzd6qcjfdpKwuPcNTNkKt/lI ild1Mld8mSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAcmwgAKCRDB/BR4rcrs CaB3B/9htB59Zb6+vGy4TZi/SsjCvK6NYDRBH9UiQc71SXPB/xbdpjGYJDHbPJZofbS2qiU9+ER 7sbxsXdf7gvad6zxhkNr0suFzP1fbGI7dNrywWSfHw2xU6c5FmTUVrsO/hFipBvNPumQq4DPFkJ n4St9UoN81F72l1LPJ1151EaMRAHaAQxE1Irnv7rSTEewEPFaZ8+aapCXuz2BQAuH0uusCXnEaD fp7xcyU3kopv/dNmK9xAV19QHTRSrESNJfBZ5rj8QQktqdhEUCNE4ACeT55EBCIT7sdy9J22l3K ZV5qiYX0/1PPke74RAg9eks12djalhaMfZfDyDQkYfAvBy4p
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 9de617ca9daa..d4e2ee7e4efb 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -755,7 +755,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
+static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 {
 	struct rcar_gen3_chan *channel = platform_get_drvdata(pdev);
 
@@ -763,8 +763,6 @@ static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 };
 
 static struct platform_driver rcar_gen3_phy_usb2_driver = {
@@ -773,7 +771,7 @@ static struct platform_driver rcar_gen3_phy_usb2_driver = {
 		.of_match_table	= rcar_gen3_phy_usb2_match_table,
 	},
 	.probe	= rcar_gen3_phy_usb2_probe,
-	.remove = rcar_gen3_phy_usb2_remove,
+	.remove_new = rcar_gen3_phy_usb2_remove,
 };
 module_platform_driver(rcar_gen3_phy_usb2_driver);
 
-- 
2.39.1

