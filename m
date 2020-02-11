Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41C96159806
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731148AbgBKSTd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:52106 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729060AbgBKSTc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:32 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id 1WKW220025USYZQ01WKW7D; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002oP-TR; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yq-S2; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 16/34] crypto: ccree - remove cc_pm_is_dev_suspended() wrapper
Date:   Tue, 11 Feb 2020 19:19:10 +0100
Message-Id: <20200211181928.15178-17-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If CONFIG_PM=y, cc_pm_is_dev_suspended() is just a wrapper around
pm_runtime_suspended().
If CONFIG_PM=n, cc_pm_is_dev_suspended() a dummy that behaves exactly
the same as the dummy for pm_runtime_suspended().

Hence remove cc_pm_is_dev_suspended(), and call pm_runtime_suspended()
directly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_driver.c | 2 +-
 drivers/crypto/ccree/cc_pm.c     | 6 ------
 drivers/crypto/ccree/cc_pm.h     | 7 -------
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_driver.c
index e365ede32cc0e6a0..02442596310cd98d 100644
--- a/drivers/crypto/ccree/cc_driver.c
+++ b/drivers/crypto/ccree/cc_driver.c
@@ -136,7 +136,7 @@ static irqreturn_t cc_isr(int irq, void *dev_id)
 
 	/* STAT_OP_TYPE_GENERIC STAT_PHASE_0: Interrupt */
 	/* if driver suspended return, probably shared interrupt */
-	if (cc_pm_is_dev_suspended(dev))
+	if (pm_runtime_suspended(dev))
 		return IRQ_NONE;
 
 	/* read the interrupt status */
diff --git a/drivers/crypto/ccree/cc_pm.c b/drivers/crypto/ccree/cc_pm.c
index f7729fc1ee597e9a..3b4927c41a177752 100644
--- a/drivers/crypto/ccree/cc_pm.c
+++ b/drivers/crypto/ccree/cc_pm.c
@@ -74,9 +74,3 @@ void cc_pm_put_suspend(struct device *dev)
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
-
-bool cc_pm_is_dev_suspended(struct device *dev)
-{
-	/* check device state using runtime api */
-	return pm_runtime_suspended(dev);
-}
diff --git a/drivers/crypto/ccree/cc_pm.h b/drivers/crypto/ccree/cc_pm.h
index 2dcf53fa108e77a6..1fe1fc827f62f49e 100644
--- a/drivers/crypto/ccree/cc_pm.h
+++ b/drivers/crypto/ccree/cc_pm.h
@@ -19,7 +19,6 @@ int cc_pm_suspend(struct device *dev);
 int cc_pm_resume(struct device *dev);
 int cc_pm_get(struct device *dev);
 void cc_pm_put_suspend(struct device *dev);
-bool cc_pm_is_dev_suspended(struct device *dev);
 
 #else
 
@@ -30,12 +29,6 @@ static inline int cc_pm_get(struct device *dev)
 
 static inline void cc_pm_put_suspend(struct device *dev) {}
 
-static inline bool cc_pm_is_dev_suspended(struct device *dev)
-{
-	/* if PM not supported device is never suspend */
-	return false;
-}
-
 #endif
 
 #endif /*__POWER_MGR_H__*/
-- 
2.17.1

