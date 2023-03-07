Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFD026ADE2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Mar 2023 12:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjCGL7Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Mar 2023 06:59:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjCGL7X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 06:59:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BB730B3F
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2023 03:59:21 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyJ-0006Vu-It; Tue, 07 Mar 2023 12:59:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyI-002TFN-Ca; Tue, 07 Mar 2023 12:59:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyH-002yjd-Ff; Tue, 07 Mar 2023 12:59:09 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 17/31] phy: renesas: phy-rcar-gen3-usb3: Convert to platform remove callback returning void
Date:   Tue,  7 Mar 2023 12:58:46 +0100
Message-Id: <20230307115900.2293120-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1688; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=S8xN6/D58vDbFZKshID6jaGWz2r8GuFPoFdy8ZZjYq8=; b=owEBbAGT/pANAwAKAcH8FHityuwJAcsmYgBkBybF+TZqDPzF/qGCk4H08UpsFE6WpXIMxBick 085AWCe92GJATIEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAcmxQAKCRDB/BR4rcrs CQDBB/iJEXB1/Ahed08wq1tOfLj5XOMp40mLot7ba+rO2H/qW1GeGuZI7ipcgxITzfQnlIfc1wj hYt11Y4Uk36rMbgrZLAB/ESF5aeYK+lrmf2z0pKkP2gbOmK1lUWVp34d5mHHTTy6MA8gndSlXLZ TZ+tjs4kqnSb5VRDkM1dZ2A35K1TkMvT2I1i/VLmsGcG1nX1IJjix8NGTIRLyEvCzhtNGKSysp5 NtvzBpC3AStrLWPUxHsrN0nvLOZNwPs88bwU+Gbdbsk8Hk2oWTW7RjdZGk67qxpIZaUkiFvhcr5 7Uf2OEAoUmekrjcuXEdQKmErTlCPdxjo/FLmSfBs6wv//tE=
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
 drivers/phy/renesas/phy-rcar-gen3-usb3.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb3.c b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
index f27d6f471629..e2d630edd992 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb3.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
@@ -199,11 +199,9 @@ static int rcar_gen3_phy_usb3_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rcar_gen3_phy_usb3_remove(struct platform_device *pdev)
+static void rcar_gen3_phy_usb3_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 };
 
 static struct platform_driver rcar_gen3_phy_usb3_driver = {
@@ -212,7 +210,7 @@ static struct platform_driver rcar_gen3_phy_usb3_driver = {
 		.of_match_table	= rcar_gen3_phy_usb3_match_table,
 	},
 	.probe	= rcar_gen3_phy_usb3_probe,
-	.remove = rcar_gen3_phy_usb3_remove,
+	.remove_new = rcar_gen3_phy_usb3_remove,
 };
 module_platform_driver(rcar_gen3_phy_usb3_driver);
 
-- 
2.39.1

