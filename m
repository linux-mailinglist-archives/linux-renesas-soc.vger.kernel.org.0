Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0E715987C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729603AbgBKS0Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:26:16 -0500
Received: from newton.telenet-ops.be ([195.130.132.45]:35798 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728713AbgBKS0P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:26:15 -0500
X-Greylist: delayed 403 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Feb 2020 13:26:15 EST
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 48H9z71xGszMrKJb
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2020 19:19:31 +0100 (CET)
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id 1WKV2200S5USYZQ01WKV79; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002nz-JJ; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yS-Hv; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 08/34] crypto: ccree - clean up clock handling
Date:   Tue, 11 Feb 2020 19:19:02 +0100
Message-Id: <20200211181928.15178-9-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use devm_clk_get_optional() instead of devm_clk_get() and explicit
optional clock handling.
As clk_prepare_enable() and clk_disable_unprepare() handle optional
clocks fine, the cc_clk_on() and cc_clk_off() wrappers can be removed.

While at it, use the new "%pe" format specifier to print error codes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_driver.c | 55 ++++++--------------------------
 drivers/crypto/ccree/cc_driver.h |  2 --
 drivers/crypto/ccree/cc_pm.c     |  4 +--
 3 files changed, 11 insertions(+), 50 deletions(-)

diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_driver.c
index f8aba89e48730e4d..a7b7f65939e2f620 100644
--- a/drivers/crypto/ccree/cc_driver.c
+++ b/drivers/crypto/ccree/cc_driver.c
@@ -302,22 +302,12 @@ static int init_cc_resources(struct platform_device *plat_dev)
 	platform_set_drvdata(plat_dev, new_drvdata);
 	new_drvdata->plat_dev = plat_dev;
 
-	clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(clk))
-		switch (PTR_ERR(clk)) {
-		/* Clock is optional so this might be fine */
-		case -ENOENT:
-			break;
-
-		/* Clock not available, let's try again soon */
-		case -EPROBE_DEFER:
-			return -EPROBE_DEFER;
-
-		default:
-			dev_err(dev, "Error getting clock: %ld\n",
-				PTR_ERR(clk));
-			return PTR_ERR(clk);
-		}
+	clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(clk)) {
+		if (PTR_ERR(clk) != -EPROBE_DEFER)
+			dev_err(dev, "Error getting clock: %pe\n", clk);
+		return PTR_ERR(clk);
+	}
 	new_drvdata->clk = clk;
 
 	new_drvdata->coherent = of_dma_is_coherent(np);
@@ -362,7 +352,7 @@ static int init_cc_resources(struct platform_device *plat_dev)
 		return rc;
 	}
 
-	rc = cc_clk_on(new_drvdata);
+	rc = clk_prepare_enable(new_drvdata->clk);
 	if (rc) {
 		dev_err(dev, "Failed to enable clock");
 		return rc;
@@ -545,7 +535,7 @@ static int init_cc_resources(struct platform_device *plat_dev)
 post_regs_err:
 	fini_cc_regs(new_drvdata);
 post_clk_err:
-	cc_clk_off(new_drvdata);
+	clk_disable_unprepare(new_drvdata->clk);
 	return rc;
 }
 
@@ -569,23 +559,7 @@ static void cleanup_cc_resources(struct platform_device *plat_dev)
 	cc_fips_fini(drvdata);
 	cc_debugfs_fini(drvdata);
 	fini_cc_regs(drvdata);
-	cc_clk_off(drvdata);
-}
-
-int cc_clk_on(struct cc_drvdata *drvdata)
-{
-	struct clk *clk = drvdata->clk;
-	int rc;
-
-	if (IS_ERR(clk))
-		/* Not all devices have a clock associated with CCREE  */
-		return 0;
-
-	rc = clk_prepare_enable(clk);
-	if (rc)
-		return rc;
-
-	return 0;
+	clk_disable_unprepare(drvdata->clk);
 }
 
 unsigned int cc_get_default_hash_len(struct cc_drvdata *drvdata)
@@ -596,17 +570,6 @@ unsigned int cc_get_default_hash_len(struct cc_drvdata *drvdata)
 		return HASH_LEN_SIZE_630;
 }
 
-void cc_clk_off(struct cc_drvdata *drvdata)
-{
-	struct clk *clk = drvdata->clk;
-
-	if (IS_ERR(clk))
-		/* Not all devices have a clock associated with CCREE */
-		return;
-
-	clk_disable_unprepare(clk);
-}
-
 static int ccree_probe(struct platform_device *plat_dev)
 {
 	int rc;
diff --git a/drivers/crypto/ccree/cc_driver.h b/drivers/crypto/ccree/cc_driver.h
index c227718ba9923472..b983e721f2f758fe 100644
--- a/drivers/crypto/ccree/cc_driver.h
+++ b/drivers/crypto/ccree/cc_driver.h
@@ -212,8 +212,6 @@ static inline void dump_byte_array(const char *name, const u8 *the_array,
 bool cc_wait_for_reset_completion(struct cc_drvdata *drvdata);
 int init_cc_regs(struct cc_drvdata *drvdata, bool is_probe);
 void fini_cc_regs(struct cc_drvdata *drvdata);
-int cc_clk_on(struct cc_drvdata *drvdata);
-void cc_clk_off(struct cc_drvdata *drvdata);
 unsigned int cc_get_default_hash_len(struct cc_drvdata *drvdata);
 
 static inline void cc_iowrite(struct cc_drvdata *drvdata, u32 reg, u32 val)
diff --git a/drivers/crypto/ccree/cc_pm.c b/drivers/crypto/ccree/cc_pm.c
index 24c368b866f6b5ea..81376173c3ecf48f 100644
--- a/drivers/crypto/ccree/cc_pm.c
+++ b/drivers/crypto/ccree/cc_pm.c
@@ -26,7 +26,7 @@ int cc_pm_suspend(struct device *dev)
 	dev_dbg(dev, "set HOST_POWER_DOWN_EN\n");
 	fini_cc_regs(drvdata);
 	cc_iowrite(drvdata, CC_REG(HOST_POWER_DOWN_EN), POWER_DOWN_ENABLE);
-	cc_clk_off(drvdata);
+	clk_disable_unprepare(drvdata->clk);
 	return 0;
 }
 
@@ -37,7 +37,7 @@ int cc_pm_resume(struct device *dev)
 
 	dev_dbg(dev, "unset HOST_POWER_DOWN_EN\n");
 	/* Enables the device source clk */
-	rc = cc_clk_on(drvdata);
+	rc = clk_prepare_enable(drvdata->clk);
 	if (rc) {
 		dev_err(dev, "failed getting clock back on. We're toast.\n");
 		return rc;
-- 
2.17.1

