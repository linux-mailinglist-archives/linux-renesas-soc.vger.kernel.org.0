Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D515D6C9542
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Mar 2023 16:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbjCZOcz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 26 Mar 2023 10:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232460AbjCZOcu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA4561B1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Mar 2023 07:32:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQH-0008Ot-Jw; Sun, 26 Mar 2023 16:32:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQE-006rcy-T6; Sun, 26 Mar 2023 16:32:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-0088XA-V1; Sun, 26 Mar 2023 16:32:36 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 053/117] media: rcar_jpu: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:20 +0200
Message-Id: <20230326143224.572654-56-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=UC83YHmOk2BnQQT107sHqxKNVaZy0TsF7OXm3Ya2aec=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbGZpPNJXshYJpSZIZPl7ON0Mv3wqX3a9uDe 73Tu+VHWP2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWxgAKCRCPgPtYfRL+ TtW8B/9hjmx3lhg/gDaDsBClWctoiJQOeg5+Iz+4DsJC6iqi0PXY63AU1esmV4yR2B/6IZFvdqN P1rEu2PWOz2ipOCoXqzW0MhBIM1IaVAYNqI8JehuUXskj0zFgg7svFLmD1mmayi6ObQqtI8/RwR RN1Skl0aW7v9U98MR3ZWhQQLQwQdOjb+5SNKwciXyDPgYmRyP9VPXBmxgtjtqfsfLRKWSiDFvzP ir6oGtgz5JTUwwmmeVk4TFc0AvX5LrJS3AOaFhRJbRfuxl97oeSQJUIrRsXTd7OL8u1xfiB0EYJ xtsFbiTm8ba48Te+3wpDoKJh6Uy4gaH5Elm0o7kISyEqxXVG
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
 drivers/media/platform/renesas/rcar_jpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index 2f4377cfbb42..e7f604807825 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -1702,7 +1702,7 @@ static int jpu_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int jpu_remove(struct platform_device *pdev)
+static void jpu_remove(struct platform_device *pdev)
 {
 	struct jpu *jpu = platform_get_drvdata(pdev);
 
@@ -1710,8 +1710,6 @@ static int jpu_remove(struct platform_device *pdev)
 	video_unregister_device(&jpu->vfd_encoder);
 	v4l2_m2m_release(jpu->m2m_dev);
 	v4l2_device_unregister(&jpu->v4l2_dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1746,7 +1744,7 @@ static const struct dev_pm_ops jpu_pm_ops = {
 
 static struct platform_driver jpu_driver = {
 	.probe = jpu_probe,
-	.remove = jpu_remove,
+	.remove_new = jpu_remove,
 	.driver = {
 		.of_match_table = jpu_dt_ids,
 		.name = DRV_NAME,
-- 
2.39.2

