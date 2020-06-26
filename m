Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4A620AF08
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2020 11:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgFZJcb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jun 2020 05:32:31 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:59362 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725768AbgFZJca (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jun 2020 05:32:30 -0400
X-IronPort-AV: E=Sophos;i="5.75,283,1589209200"; 
   d="scan'208";a="50657262"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jun 2020 18:32:28 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 58F57420331D;
        Fri, 26 Jun 2020 18:32:28 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v4 1/4] regulator: core: add prepare and resume_early
Date:   Fri, 26 Jun 2020 18:32:19 +0900
Message-Id: <1593163942-5087-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The regulator-fixed driver is possible to be off by firmware
like PSCI while the system is suspended. If a consumer could get
such a condition from regulator_is_enabled(), it's useful by
consumers.

The regulator subsystem already has regulator-state-(standby|mem|disk)
sub-nodes and regulator-off-in-suspend property. However,
suitable regulator_ops APIs didn't exist.

So, add new regulator_ops APIs and prepare()/resume_early() in
the regulator_pm_ops to set/clear the condition by new APIs before
suspend() functions of consumers are called.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/regulator/core.c         | 42 ++++++++++++++++++++++++++++++++++++++++
 include/linux/regulator/driver.h |  6 ++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 03154f5..93eb2a3 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -5286,6 +5286,46 @@ void regulator_unregister(struct regulator_dev *rdev)
 EXPORT_SYMBOL_GPL(regulator_unregister);
 
 #ifdef CONFIG_SUSPEND
+static int regulator_prepare(struct device *dev)
+{
+	struct regulator_dev *rdev = dev_to_rdev(dev);
+	suspend_state_t state = pm_suspend_target_state;
+	struct regulator_state *rstate;
+	int ret = 0;
+
+	rstate = regulator_get_suspend_state(rdev, state);
+	if (rstate == NULL)
+		return 0;
+
+	regulator_lock(rdev);
+	if (rstate->enabled == DISABLE_IN_SUSPEND &&
+	    rdev->desc->ops->set_prepare_disable)
+		ret = rdev->desc->ops->set_prepare_disable(rdev);
+	regulator_unlock(rdev);
+
+	return ret;
+}
+
+static int regulator_resume_early(struct device *dev)
+{
+	struct regulator_dev *rdev = dev_to_rdev(dev);
+	suspend_state_t state = pm_suspend_target_state;
+	struct regulator_state *rstate;
+	int ret = 0;
+
+	rstate = regulator_get_suspend_state(rdev, state);
+	if (rstate == NULL)
+		return 0;
+
+	regulator_lock(rdev);
+	if (rstate->enabled == DISABLE_IN_SUSPEND &&
+	    rdev->desc->ops->clear_resume_early_disable)
+		ret = rdev->desc->ops->clear_resume_early_disable(rdev);
+	regulator_unlock(rdev);
+
+	return ret;
+}
+
 /**
  * regulator_suspend - prepare regulators for system wide suspend
  * @dev: ``&struct device`` pointer that is passed to _regulator_suspend()
@@ -5336,6 +5376,8 @@ static int regulator_resume(struct device *dev)
 
 #ifdef CONFIG_PM
 static const struct dev_pm_ops __maybe_unused regulator_pm_ops = {
+	.prepare	= regulator_prepare,
+	.resume_early	= regulator_resume_early,
 	.suspend	= regulator_suspend,
 	.resume		= regulator_resume,
 };
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 7eb9fea..299a504 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -115,6 +115,10 @@ enum regulator_status {
  *                      suspended.
  * @set_suspend_disable: Mark the regulator as disabled when the system is
  *                       suspended.
+ * @set_prepare_disable: Mark the regulator as disabled when the system is
+ *                       suspending.
+ * @clear_resume_early_disable: Unmark the regulator as disabled when
+ *                              the system is resuming.
  * @set_suspend_mode: Set the operating mode for the regulator when the
  *                    system is suspended.
  *
@@ -195,6 +199,8 @@ struct regulator_ops {
 	/* enable/disable regulator in suspend state */
 	int (*set_suspend_enable) (struct regulator_dev *);
 	int (*set_suspend_disable) (struct regulator_dev *);
+	int (*set_prepare_disable) (struct regulator_dev *);
+	int (*clear_resume_early_disable) (struct regulator_dev *);
 
 	/* set regulator suspend operating mode (defined in consumer.h) */
 	int (*set_suspend_mode) (struct regulator_dev *, unsigned int mode);
-- 
2.7.4

