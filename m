Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4422AD411
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 11:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgKJKs6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 05:48:58 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:34081 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726428AbgKJKs6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 05:48:58 -0500
X-IronPort-AV: E=Sophos;i="5.77,466,1596466800"; 
   d="scan'208";a="62235375"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Nov 2020 19:48:56 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BC0CE425DF06;
        Tue, 10 Nov 2020 19:48:56 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3] mmc: core: Issue power off notification in mmc_remove()
Date:   Tue, 10 Nov 2020 19:48:50 +0900
Message-Id: <1605005330-7178-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

User is possible to turn the power off after a host was removed.
So, call mmc_poweroff_notify(EXT_CSD_NO_POWER_NOTIFICATION)
in mmc_remove(). Note that the mmc and host driver will be
in the following modes when mmc_remove() is called:

 1. mmc_card_suspended() == false &&
    power_off_notification == EXT_CSD_POWER_ON
 2. mmc_card_suspended() == true &&
    power_off_notification == EXT_CSD_POWER_OFF_{SHORT,LONG}
 3. mmc_card_suspended() == true && mmc_sleep() was called

So, mmc_remove() calls _mmc_resume() anyway for the cases.
Otherwise:

 - _mmc_resume will be called via mmc_runtime_resume() and then
   power_off_notification will be set to EXT_CSD_POWER_ON.
 - timeout will happen in mmc_blk_part_switch() via mmc_blk_remove()
   if "part_curr" of mmc block is not set to default.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v2:
 - Fix an issue which timeout happens if part_curr is not default.
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/1604311475-15307-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/

 Changes from v1:
 - Reuse _mmc_suspend() instead of direct mmc_poweroff_notify() calling
  to check suspended flag while removing.
  https://patchwork.kernel.org/project/linux-renesas-soc/patch/1602581312-23607-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/


 drivers/mmc/core/mmc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index ff3063c..18413f2 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1983,11 +1983,35 @@ static int mmc_poweroff_notify(struct mmc_card *card, unsigned int notify_type)
 	return err;
 }
 
+static int _mmc_resume(struct mmc_host *host);
 /*
  * Host is being removed. Free up the current card.
  */
 static void mmc_remove(struct mmc_host *host)
 {
+	/*
+	 * The mmc and host driver will be in the following modes here:
+	 *  1. mmc_card_suspended() == false &&
+	 *     power_off_notification == EXT_CSD_POWER_ON
+	 *  2. mmc_card_suspended() == true &&
+	 *     power_off_notification == EXT_CSD_POWER_OFF_{SHORT,LONG}
+	 *  3. mmc_card_suspended() == true && mmc_sleep() was called
+	 *
+	 * So, call _mmc_resume() here anyway for the cases. Otherwise:
+	 *  - _mmc_resume will be called via mmc_runtime_resume() and then
+	 *    power_off_notification will be set to EXT_CSD_POWER_ON.
+	 *  - timeout will happen in mmc_blk_part_switch() via mmc_blk_remove()
+	 *    if "part_curr" of mmc block is not set to default.
+	 */
+	_mmc_resume(host);
+
+	/* Disable power_off_notification byte in the ext_csd register */
+	if (host->card->ext_csd.rev >= 6) {
+		mmc_claim_host(host);
+		mmc_poweroff_notify(host->card, EXT_CSD_NO_POWER_NOTIFICATION);
+		mmc_release_host(host);
+	}
+
 	mmc_remove_card(host->card);
 	host->card = NULL;
 }
-- 
2.7.4

