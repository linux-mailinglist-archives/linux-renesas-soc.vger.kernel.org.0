Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087B57075D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 May 2023 01:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbjEQXC6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 May 2023 19:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjEQXC5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 May 2023 19:02:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602B594
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 May 2023 16:02:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-00085d-N8; Thu, 18 May 2023 01:02:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAU-000wqa-Qt; Thu, 18 May 2023 01:02:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAT-005UXm-WA; Thu, 18 May 2023 01:02:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Herve Codina <herve.codina@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 40/97] usb: gadget/renesas_usbf: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:42 +0200
Message-Id: <20230517230239.187727-41-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1752; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=cJqX22+C542QnbrYKQvU9OlVT/9BrTtjw4Gf97OHUis=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTUGDORlOb1veydDLGBntdqbTdmnV3TzVs7R9A1U0Z+2 8rYk9WdjMYsDIxcDLJiiiz2jWsyrarkIjvX/rsMM4iVCWQKAxenAEzE35b9n11hRsUub9NinycL NXY7VAia6e13fNud7Lb4zWJ3rZp/5Wf2CHEHecnVNK+zSshhUC/MUl65U0WUvSE4eVugtE+cmvT biMe9xW2eC74/uNkQ7hTfctSmZ0XVv3mtPvNz1/DyHDVp5FmW0OC7Y7mq5B1V587MWv45HXum7T +2/avpw6BvE7OmOBYtunjo0OsTDZ0dL3T2ssx70MXCMvHkk+7PPqsZNDwO1mXP8niY5lh/4dq5B UusK8SmFbx2Lda7VSqgu2J9eMf1uZMvFZVFqThfOSqV96/YP7vDsir72tUdDm+9jukJftqluOzE tE62q1b+98wFd6m+luMO/JVQI2uqnS4v+iP/w28T/+sA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart from
emitting a warning) and this typically results in resource leaks. To improve
here there is a quest to make the remove callback return void. In the first
step of this quest all drivers are converted to .remove_new() which already
returns void. Eventually after all drivers are converted, .remove_new() is
renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/gadget/udc/renesas_usbf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
index 84ac9fe4ce7f..6cd0af83e91e 100644
--- a/drivers/usb/gadget/udc/renesas_usbf.c
+++ b/drivers/usb/gadget/udc/renesas_usbf.c
@@ -3361,15 +3361,13 @@ static int usbf_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int usbf_remove(struct platform_device *pdev)
+static void usbf_remove(struct platform_device *pdev)
 {
 	struct usbf_udc *udc = platform_get_drvdata(pdev);
 
 	usb_del_gadget_udc(&udc->gadget);
 
 	pm_runtime_put(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id usbf_match[] = {
@@ -3385,7 +3383,7 @@ static struct platform_driver udc_driver = {
 		.of_match_table = usbf_match,
 	},
 	.probe          = usbf_probe,
-	.remove         = usbf_remove,
+	.remove_new     = usbf_remove,
 };
 
 module_platform_driver(udc_driver);
-- 
2.39.2

