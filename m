Return-Path: <linux-renesas-soc+bounces-663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827C2803D07
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 19:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E529281155
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 18:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC1A2FC27;
	Mon,  4 Dec 2023 18:31:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2863BB0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 10:31:33 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj3-00039G-3o; Mon, 04 Dec 2023 19:31:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj2-00DZmY-Ea; Mon, 04 Dec 2023 19:31:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj2-00EE7J-5P; Mon, 04 Dec 2023 19:31:24 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	kernel@pengutronix.de,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net-next v2 3/9] net: pcs: rzn1-miic: Convert to platform remove callback returning void
Date: Mon,  4 Dec 2023 19:30:43 +0100
Message-ID:  <82b728e14a68c421e269eff3b8083d9d6e62d956.1701713943.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=i2Z/P9sGagmWu34TWxQ4CGYIrQslMBYPtFr1evQ8ocA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlbhrZZQzhaE2Njvl74xVu88W/97/IYyx7lh2fL 9ZgukGWjZiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZW4a2QAKCRCPgPtYfRL+ TmZKB/4y1UoT4nRM6Irp0y1hLaDsiyo8WbvOCoLMAlDkrCyJphl6+TjtElz3Wd2MsDLEXmeeUQ+ eb8Yqx8kjUo0G0l9jEyIIkLvuXHhW112S6g80zqRO2zuAB+76fyqWJv/e66b/0J3CyqwFbUrDvi 3v76RpJpZzOQjaqrR7E0f2lvJsuj9OukWIkULqIGcsendvpFKHpCoP+uYZ3Cld7Yd9HJLThzSHt DL80L9TqR6HX+nJXWlblCrXFJaAc3gXxmbeFxz7iWK8D/YMYV/9awQXSq+FOUl+sXUYP3dPgRIN hfyeELifJVhkQEh73cvSIh0bHLtaemfM00B3je0y1lrg6KwI
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/r/20231117095922.876489-5-u.kleine-koenig@pengutronix.de
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 97139c07130f..d93f84fbb1fd 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -505,11 +505,9 @@ static int miic_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int miic_remove(struct platform_device *pdev)
+static void miic_remove(struct platform_device *pdev)
 {
 	pm_runtime_put(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id miic_of_mtable[] = {
@@ -525,7 +523,7 @@ static struct platform_driver miic_driver = {
 		.of_match_table = miic_of_mtable,
 	},
 	.probe = miic_probe,
-	.remove = miic_remove,
+	.remove_new = miic_remove,
 };
 module_platform_driver(miic_driver);
 
-- 
2.42.0


