Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93ED61D9557
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 13:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgESLdg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 07:33:36 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8524 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726508AbgESLdf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 07:33:35 -0400
X-IronPort-AV: E=Sophos;i="5.73,409,1583161200"; 
   d="scan'208";a="47264943"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 May 2020 20:33:34 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 90CA640065AA;
        Tue, 19 May 2020 20:33:34 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC] mmc: core: Issue power_off_notify for eMMC Suspend-to-RAM
Date:   Tue, 19 May 2020 20:33:08 +0900
Message-Id: <1589887988-7362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The commit 432356793415 ("mmc: core: Enable power_off_notify for
eMMC shutdown sequence") enabled the power off notification
even if MMC_CAP2_POWEROFF_NOTIFY (MMC_CAP2_FULL_PWR_CYCLE now) is
not set. However, the mmc core lacks to issue the power off
notificaiton when Suspend-to-{RAM,Disk} happens on the system.

So, add Suspend-to-RAM support at first because this is easy to
check by using pm_suspend_target_state condition on _mmc_suspend().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/core/mmc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 4203303..4a23f83 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/stat.h>
+#include <linux/suspend.h>
 #include <linux/pm_runtime.h>
 
 #include <linux/mmc/host.h>
@@ -2027,6 +2028,12 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
 	int err = 0;
 	unsigned int notify_type = is_suspend ? EXT_CSD_POWER_OFF_SHORT :
 					EXT_CSD_POWER_OFF_LONG;
+	bool s2ram = false;
+
+#ifdef CONFIG_PM_SLEEP
+	if (pm_suspend_target_state == PM_SUSPEND_MEM)
+		s2ram = true;
+#endif
 
 	mmc_claim_host(host);
 
@@ -2038,7 +2045,7 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
 		goto out;
 
 	if (mmc_can_poweroff_notify(host->card) &&
-		((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend))
+	    ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend || s2ram))
 		err = mmc_poweroff_notify(host->card, notify_type);
 	else if (mmc_can_sleep(host->card))
 		err = mmc_sleep(host);
-- 
2.7.4

