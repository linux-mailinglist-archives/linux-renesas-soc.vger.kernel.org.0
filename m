Return-Path: <linux-renesas-soc+bounces-719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1B0805412
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 13:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26E091C20B7B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 12:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884045B206;
	Tue,  5 Dec 2023 12:26:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725BCFA
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Dec 2023 04:26:40 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAUVX-0005XX-Ey; Tue, 05 Dec 2023 13:26:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAUVX-00Djur-2H; Tue, 05 Dec 2023 13:26:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAUVW-00EhQd-PT; Tue, 05 Dec 2023 13:26:34 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 2/8] regulator: bd9571mwv: Convert to platform remove callback returning void
Date: Tue,  5 Dec 2023 13:26:17 +0100
Message-ID:  <639e796b36815a219ff1172cc758ba7378211d74.1701778038.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701778038.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701778038.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=xHLhRqowwhFDnR1Zz3hrHDK3dQ0zi02Jx4061ISe4MM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlbxboQOaQkKi2vEhgf7ZGG0FfDWxXYpAN6cRlW K/zmQb5HeqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZW8W6AAKCRCPgPtYfRL+ TtJqB/9e48xXfRTGrxFhfDHXi37CoQOy9e3v7lcsWmzELvxm0TOXy6bKEhcgZNuCqJP5wwUk1N0 8xFFcSEr4zOn2UBM1VtvoVU9IX/9QGmYZxwmZT9MPJwax4LswsO8+CreHzbtc2DR5iNx0Je5Eeh NdL7c9NSnyNi2eB+PZoTa+lfrerh03l7ETvyltKcIhf4heaqw6CJ0mfFg+I2hB9lmFnDw2+rMIA qM+W++qoJpzP7LwL/R/P1Z7Yjre1h8l5+pbo+dyWl4vIhNDIeVZtXEI/g9G/mTk4MfuElMviw/Y j9Cy0KNqDouDLaGjr0yEI4dBeDfxuZnzsGaCIFBHxq2PlmW/
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/regulator/bd9571mwv-regulator.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/bd9571mwv-regulator.c b/drivers/regulator/bd9571mwv-regulator.c
index d469481d8442..c7ceba56e7dc 100644
--- a/drivers/regulator/bd9571mwv-regulator.c
+++ b/drivers/regulator/bd9571mwv-regulator.c
@@ -260,10 +260,9 @@ static const struct dev_pm_ops bd9571mwv_pm  = {
 	SET_SYSTEM_SLEEP_PM_OPS(bd9571mwv_suspend, bd9571mwv_resume)
 };
 
-static int bd9571mwv_regulator_remove(struct platform_device *pdev)
+static void bd9571mwv_regulator_remove(struct platform_device *pdev)
 {
 	device_remove_file(&pdev->dev, &dev_attr_backup_mode);
-	return 0;
 }
 #define DEV_PM_OPS	&bd9571mwv_pm
 #else
@@ -357,7 +356,7 @@ static struct platform_driver bd9571mwv_regulator_driver = {
 		.pm = DEV_PM_OPS,
 	},
 	.probe = bd9571mwv_regulator_probe,
-	.remove = bd9571mwv_regulator_remove,
+	.remove_new = bd9571mwv_regulator_remove,
 	.id_table = bd9571mwv_regulator_id_table,
 };
 module_platform_driver(bd9571mwv_regulator_driver);
-- 
2.42.0


