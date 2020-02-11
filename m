Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB5F1159846
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731011AbgBKSTd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:59460 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731049AbgBKSTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 1WKW220025USYZQ06WKWaX; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002oS-Uy; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yt-T7; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 17/34] crypto: ccree - make cc_pm_{suspend,resume}() static
Date:   Tue, 11 Feb 2020 19:19:11 +0100
Message-Id: <20200211181928.15178-18-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

cc_pm_suspend() and cc_pm_resume() are not used outside
drivers/crypto/ccree/cc_pm.c.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_pm.c | 12 ++++++------
 drivers/crypto/ccree/cc_pm.h |  2 --
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/ccree/cc_pm.c b/drivers/crypto/ccree/cc_pm.c
index 3b4927c41a177752..d39e1664fc7edfd3 100644
--- a/drivers/crypto/ccree/cc_pm.c
+++ b/drivers/crypto/ccree/cc_pm.c
@@ -15,11 +15,7 @@
 #define POWER_DOWN_ENABLE 0x01
 #define POWER_DOWN_DISABLE 0x00
 
-const struct dev_pm_ops ccree_pm = {
-	SET_RUNTIME_PM_OPS(cc_pm_suspend, cc_pm_resume, NULL)
-};
-
-int cc_pm_suspend(struct device *dev)
+static int cc_pm_suspend(struct device *dev)
 {
 	struct cc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -30,7 +26,7 @@ int cc_pm_suspend(struct device *dev)
 	return 0;
 }
 
-int cc_pm_resume(struct device *dev)
+static int cc_pm_resume(struct device *dev)
 {
 	int rc;
 	struct cc_drvdata *drvdata = dev_get_drvdata(dev);
@@ -62,6 +58,10 @@ int cc_pm_resume(struct device *dev)
 	return 0;
 }
 
+const struct dev_pm_ops ccree_pm = {
+	SET_RUNTIME_PM_OPS(cc_pm_suspend, cc_pm_resume, NULL)
+};
+
 int cc_pm_get(struct device *dev)
 {
 	int rc = pm_runtime_get_sync(dev);
diff --git a/drivers/crypto/ccree/cc_pm.h b/drivers/crypto/ccree/cc_pm.h
index 1fe1fc827f62f49e..50cac33de11832bc 100644
--- a/drivers/crypto/ccree/cc_pm.h
+++ b/drivers/crypto/ccree/cc_pm.h
@@ -15,8 +15,6 @@
 
 extern const struct dev_pm_ops ccree_pm;
 
-int cc_pm_suspend(struct device *dev);
-int cc_pm_resume(struct device *dev);
 int cc_pm_get(struct device *dev);
 void cc_pm_put_suspend(struct device *dev);
 
-- 
2.17.1

