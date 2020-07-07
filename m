Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D21216C63
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 13:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgGGL7J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 07:59:09 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:54798 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727827AbgGGL7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 07:59:08 -0400
X-IronPort-AV: E=Sophos;i="5.75,323,1589209200"; 
   d="scan'208";a="51316743"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Jul 2020 20:59:06 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 820F642325F3;
        Tue,  7 Jul 2020 20:59:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 2/2] mmc: core: Add MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND
Date:   Tue,  7 Jul 2020 20:58:42 +0900
Message-Id: <1594123122-13156-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594123122-13156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1594123122-13156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The commit 5a36d6bcdf23 ("mmc: core: Add DT-bindings for
MMC_CAP2_FULL_PWR_CYCLE") added the "full-pwr-cycle" property which
is possible to perform a full power cycle of the card at any time.

However, some environment (like r8a77951-salvator-xs) is possible
to perform a full power cycle of the card in suspend via firmware
(PSCI on arm-trusted-firmware). So, in worst case, since we are
not doing a graceful shutdown of the eMMC device (just cut VCCQ
while the eMMC is "sleeping") in suspend, it could lead to internal
data corruptions. So, add MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND
to do a graceful shutdown which issues Power Off notification
before entering system suspend.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/core/host.c  | 2 ++
 drivers/mmc/core/mmc.c   | 3 ++-
 include/linux/mmc/host.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 6141a85..7f87f44 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -277,6 +277,8 @@ int mmc_of_parse(struct mmc_host *host)
 		host->caps |= MMC_CAP_SDIO_IRQ;
 	if (device_property_read_bool(dev, "full-pwr-cycle"))
 		host->caps2 |= MMC_CAP2_FULL_PWR_CYCLE;
+	if (device_property_read_bool(dev, "full-pwr-cycle-in-suspend"))
+		host->caps2 |= MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND;
 	if (device_property_read_bool(dev, "keep-power-in-suspend"))
 		host->pm_caps |= MMC_PM_KEEP_POWER;
 	if (device_property_read_bool(dev, "wakeup-source") ||
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 4203303..b3fa193 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2038,7 +2038,8 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
 		goto out;
 
 	if (mmc_can_poweroff_notify(host->card) &&
-		((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend))
+	    ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend ||
+	     (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND)))
 		err = mmc_poweroff_notify(host->card, notify_type);
 	else if (mmc_can_sleep(host->card))
 		err = mmc_sleep(host);
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 1fa4fa1..c5b6e97 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -352,6 +352,7 @@ struct mmc_host {
 
 #define MMC_CAP2_BOOTPART_NOACC	(1 << 0)	/* Boot partition no access */
 #define MMC_CAP2_FULL_PWR_CYCLE	(1 << 2)	/* Can do full power cycle */
+#define MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND (1 << 3) /* Can do full power cycle in suspend */
 #define MMC_CAP2_HS200_1_8V_SDR	(1 << 5)        /* can support */
 #define MMC_CAP2_HS200_1_2V_SDR	(1 << 6)        /* can support */
 #define MMC_CAP2_HS200		(MMC_CAP2_HS200_1_8V_SDR | \
-- 
2.7.4

