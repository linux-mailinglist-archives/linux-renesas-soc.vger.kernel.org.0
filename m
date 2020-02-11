Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93D64159814
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730250AbgBKSTq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:46 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:45408 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730895AbgBKSTf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:35 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 1WKV2200a5USYZQ01WKVvx; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002oI-Qq; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yk-PG; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 14/34] crypto: ccree - simplify Runtime PM handling
Date:   Tue, 11 Feb 2020 19:19:08 +0100
Message-Id: <20200211181928.15178-15-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently, a large part of the probe function runs before Runtime PM is
enabled.  As the driver manages the device's clock manually, this may
work fine on some systems, but may break on platforms with a more
complex power hierarchy.

Fix this by moving the initialization of Runtime PM before the first
register access (in cc_wait_for_reset_completion()), and putting the
device to sleep only after the last access (in cc_set_ree_fips_status()).

This allows to remove the pm_on flag, which was used to track manually
if Runtime PM had been enabled or not.
Remove the cc_pm_{init,go,fini}() wrappers, as they are called only
once, and obscure operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_driver.c | 43 +++++++++++++++++++-------------
 drivers/crypto/ccree/cc_driver.h |  1 -
 drivers/crypto/ccree/cc_pm.c     | 38 +++-------------------------
 drivers/crypto/ccree/cc_pm.h     | 12 ---------
 4 files changed, 29 insertions(+), 65 deletions(-)

diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_driver.c
index a7b7f65939e2f620..c7e44f212d4b0ac5 100644
--- a/drivers/crypto/ccree/cc_driver.c
+++ b/drivers/crypto/ccree/cc_driver.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/of_address.h>
+#include <linux/pm_runtime.h>
 
 #include "cc_driver.h"
 #include "cc_request_mgr.h"
@@ -360,6 +361,16 @@ static int init_cc_resources(struct platform_device *plat_dev)
 
 	new_drvdata->sec_disabled = cc_sec_disable;
 
+	pm_runtime_set_autosuspend_delay(dev, CC_SUSPEND_TIMEOUT);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	rc = pm_runtime_get_sync(dev);
+	if (rc < 0) {
+		dev_err(dev, "pm_runtime_get_sync() failed: %d\n", rc);
+		goto post_pm_err;
+	}
+
 	/* wait for Crytpcell reset completion */
 	if (!cc_wait_for_reset_completion(new_drvdata)) {
 		dev_err(dev, "Cryptocell reset not completed");
@@ -372,7 +383,7 @@ static int init_cc_resources(struct platform_device *plat_dev)
 			dev_err(dev, "Invalid CC signature: SIGNATURE=0x%08X != expected=0x%08X\n",
 				val, hw_rev->sig);
 			rc = -EINVAL;
-			goto post_clk_err;
+			goto post_pm_err;
 		}
 		sig_cidr = val;
 		hw_rev_pidr = cc_ioread(new_drvdata, new_drvdata->ver_offset);
@@ -383,7 +394,7 @@ static int init_cc_resources(struct platform_device *plat_dev)
 			dev_err(dev, "Invalid CC PIDR: PIDR0124=0x%08X != expected=0x%08X\n",
 				val,  hw_rev->pidr_0124);
 			rc = -EINVAL;
-			goto post_clk_err;
+			goto post_pm_err;
 		}
 		hw_rev_pidr = val;
 
@@ -392,7 +403,7 @@ static int init_cc_resources(struct platform_device *plat_dev)
 			dev_err(dev, "Invalid CC CIDR: CIDR0123=0x%08X != expected=0x%08X\n",
 			val,  hw_rev->cidr_0123);
 			rc = -EINVAL;
-			goto post_clk_err;
+			goto post_pm_err;
 		}
 		sig_cidr = val;
 
@@ -411,7 +422,7 @@ static int init_cc_resources(struct platform_device *plat_dev)
 		default:
 			dev_err(dev, "Unsupported engines configuration.\n");
 			rc = -EINVAL;
-			goto post_clk_err;
+			goto post_pm_err;
 		}
 
 		/* Check security disable state */
@@ -437,14 +448,14 @@ static int init_cc_resources(struct platform_device *plat_dev)
 			      new_drvdata);
 	if (rc) {
 		dev_err(dev, "Could not register to interrupt %d\n", irq);
-		goto post_clk_err;
+		goto post_pm_err;
 	}
 	dev_dbg(dev, "Registered to IRQ: %d\n", irq);
 
 	rc = init_cc_regs(new_drvdata, true);
 	if (rc) {
 		dev_err(dev, "init_cc_regs failed\n");
-		goto post_clk_err;
+		goto post_pm_err;
 	}
 
 	rc = cc_debugfs_init(new_drvdata);
@@ -483,12 +494,6 @@ static int init_cc_resources(struct platform_device *plat_dev)
 		goto post_req_mgr_err;
 	}
 
-	rc = cc_pm_init(new_drvdata);
-	if (rc) {
-		dev_err(dev, "cc_pm_init failed\n");
-		goto post_buf_mgr_err;
-	}
-
 	/* Allocate crypto algs */
 	rc = cc_cipher_alloc(new_drvdata);
 	if (rc) {
@@ -509,15 +514,13 @@ static int init_cc_resources(struct platform_device *plat_dev)
 		goto post_hash_err;
 	}
 
-	/* All set, we can allow autosuspend */
-	cc_pm_go(new_drvdata);
-
 	/* If we got here and FIPS mode is enabled
 	 * it means all FIPS test passed, so let TEE
 	 * know we're good.
 	 */
 	cc_set_ree_fips_status(new_drvdata, true);
 
+	pm_runtime_put(dev);
 	return 0;
 
 post_hash_err:
@@ -534,7 +537,10 @@ static int init_cc_resources(struct platform_device *plat_dev)
 	cc_debugfs_fini(new_drvdata);
 post_regs_err:
 	fini_cc_regs(new_drvdata);
-post_clk_err:
+post_pm_err:
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
 	clk_disable_unprepare(new_drvdata->clk);
 	return rc;
 }
@@ -547,18 +553,21 @@ void fini_cc_regs(struct cc_drvdata *drvdata)
 
 static void cleanup_cc_resources(struct platform_device *plat_dev)
 {
+	struct device *dev = &plat_dev->dev;
 	struct cc_drvdata *drvdata =
 		(struct cc_drvdata *)platform_get_drvdata(plat_dev);
 
 	cc_aead_free(drvdata);
 	cc_hash_free(drvdata);
 	cc_cipher_free(drvdata);
-	cc_pm_fini(drvdata);
 	cc_buffer_mgr_fini(drvdata);
 	cc_req_mgr_fini(drvdata);
 	cc_fips_fini(drvdata);
 	cc_debugfs_fini(drvdata);
 	fini_cc_regs(drvdata);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
 	clk_disable_unprepare(drvdata->clk);
 }
 
diff --git a/drivers/crypto/ccree/cc_driver.h b/drivers/crypto/ccree/cc_driver.h
index d7928b164a3b57e5..9e94a29d84ae61f1 100644
--- a/drivers/crypto/ccree/cc_driver.h
+++ b/drivers/crypto/ccree/cc_driver.h
@@ -158,7 +158,6 @@ struct cc_drvdata {
 	int std_bodies;
 	bool sec_disabled;
 	u32 comp_mask;
-	bool pm_on;
 };
 
 struct cc_crypto_alg {
diff --git a/drivers/crypto/ccree/cc_pm.c b/drivers/crypto/ccree/cc_pm.c
index 81376173c3ecf48f..f7729fc1ee597e9a 100644
--- a/drivers/crypto/ccree/cc_pm.c
+++ b/drivers/crypto/ccree/cc_pm.c
@@ -64,23 +64,15 @@ int cc_pm_resume(struct device *dev)
 
 int cc_pm_get(struct device *dev)
 {
-	int rc = 0;
-	struct cc_drvdata *drvdata = dev_get_drvdata(dev);
-
-	if (drvdata->pm_on)
-		rc = pm_runtime_get_sync(dev);
+	int rc = pm_runtime_get_sync(dev);
 
 	return (rc == 1 ? 0 : rc);
 }
 
 void cc_pm_put_suspend(struct device *dev)
 {
-	struct cc_drvdata *drvdata = dev_get_drvdata(dev);
-
-	if (drvdata->pm_on) {
-		pm_runtime_mark_last_busy(dev);
-		pm_runtime_put_autosuspend(dev);
-	}
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 }
 
 bool cc_pm_is_dev_suspended(struct device *dev)
@@ -88,27 +80,3 @@ bool cc_pm_is_dev_suspended(struct device *dev)
 	/* check device state using runtime api */
 	return pm_runtime_suspended(dev);
 }
-
-int cc_pm_init(struct cc_drvdata *drvdata)
-{
-	struct device *dev = drvdata_to_dev(drvdata);
-
-	/* must be before the enabling to avoid redundant suspending */
-	pm_runtime_set_autosuspend_delay(dev, CC_SUSPEND_TIMEOUT);
-	pm_runtime_use_autosuspend(dev);
-	/* set us as active - note we won't do PM ops until cc_pm_go()! */
-	return pm_runtime_set_active(dev);
-}
-
-/* enable the PM module*/
-void cc_pm_go(struct cc_drvdata *drvdata)
-{
-	pm_runtime_enable(drvdata_to_dev(drvdata));
-	drvdata->pm_on = true;
-}
-
-void cc_pm_fini(struct cc_drvdata *drvdata)
-{
-	pm_runtime_disable(drvdata_to_dev(drvdata));
-	drvdata->pm_on = false;
-}
diff --git a/drivers/crypto/ccree/cc_pm.h b/drivers/crypto/ccree/cc_pm.h
index 80a18e11cae43f3d..2dcf53fa108e77a6 100644
--- a/drivers/crypto/ccree/cc_pm.h
+++ b/drivers/crypto/ccree/cc_pm.h
@@ -15,9 +15,6 @@
 
 extern const struct dev_pm_ops ccree_pm;
 
-int cc_pm_init(struct cc_drvdata *drvdata);
-void cc_pm_go(struct cc_drvdata *drvdata);
-void cc_pm_fini(struct cc_drvdata *drvdata);
 int cc_pm_suspend(struct device *dev);
 int cc_pm_resume(struct device *dev);
 int cc_pm_get(struct device *dev);
@@ -26,15 +23,6 @@ bool cc_pm_is_dev_suspended(struct device *dev);
 
 #else
 
-static inline int cc_pm_init(struct cc_drvdata *drvdata)
-{
-	return 0;
-}
-
-static inline void cc_pm_go(struct cc_drvdata *drvdata) {}
-
-static inline void cc_pm_fini(struct cc_drvdata *drvdata) {}
-
 static inline int cc_pm_get(struct device *dev)
 {
 	return 0;
-- 
2.17.1

