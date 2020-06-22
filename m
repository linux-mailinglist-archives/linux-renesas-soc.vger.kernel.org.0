Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A31202E4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 04:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731037AbgFVCZP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Jun 2020 22:25:15 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:41498 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731034AbgFVCZO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Jun 2020 22:25:14 -0400
X-IronPort-AV: E=Sophos;i="5.75,265,1589209200"; 
   d="scan'208";a="50022858"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Jun 2020 11:25:13 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D1543415E8F7;
        Mon, 22 Jun 2020 11:25:12 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mark.rutland@arm.com, lorenzo.pieralisi@arm.com,
        ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 1/2] firmware: psci: call pm_set_suspend_via_firmware()
Date:   Mon, 22 Jun 2020 11:24:58 +0900
Message-Id: <1592792699-24638-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Call pm_set_suspend_via_firmware() in .begin() of psci_suspend_ops
to use pm_suspend_via_firmware() on PSCI environment.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/firmware/psci/psci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 92013ec..1c22b01 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -309,6 +309,13 @@ static int psci_system_suspend(unsigned long unused)
 			      __pa_symbol(cpu_resume), 0, 0);
 }
 
+static int psci_system_suspend_begin(suspend_state_t state)
+{
+	pm_set_suspend_via_firmware();
+
+	return 0;
+}
+
 static int psci_system_suspend_enter(suspend_state_t state)
 {
 	return cpu_suspend(0, psci_system_suspend);
@@ -316,6 +323,7 @@ static int psci_system_suspend_enter(suspend_state_t state)
 
 static const struct platform_suspend_ops psci_suspend_ops = {
 	.valid          = suspend_valid_only_mem,
+	.begin          = psci_system_suspend_begin,
 	.enter          = psci_system_suspend_enter,
 };
 
-- 
2.7.4

