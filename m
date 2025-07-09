Return-Path: <linux-renesas-soc+bounces-19443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE7AAFF108
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 20:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0B751C80F69
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 18:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C37239E86;
	Wed,  9 Jul 2025 18:45:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143B923BCEB;
	Wed,  9 Jul 2025 18:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086708; cv=none; b=A/em0mqcC9zbSoiGa2Ur0jWDWv23Z3lJrksvFsaL7iFhj3My4G/EH/gx5fiV3fqXdTrp038R1/6OPAFq5yoiuZJd1bmTD2aMJCGPUCsw/gMzI3NWjjWDRRcmMigX5yD3wN41zQOa3iUXsu64p7BsPlRkZ0sknfACDxyntdBqaks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086708; c=relaxed/simple;
	bh=csSeS/fzyGVN71RyVkg11xjtxoCkIfFqxEDVn/Ra2O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MpPHimL4H9iEzj+QW8W69JrE769YCMp+mGTK+4lcC9j69hleFg3wGCgFSRWQfX4WWqWEJ1i9NBz5payq96owfYL1FP8m+hmE0NK5ucQrkhwXPOxixoM+gV1GY00zbPnyhyHU3snlKNTjHIcviw38Ev8tVn8Jofze0fO+BtOGQTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B26C4CEEF;
	Wed,  9 Jul 2025 18:45:06 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@linutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] irqchip/renesas-intc-irqpin: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  9 Jul 2025 20:45:01 +0200
Message-ID: <865e5274cc516d8c345048330a46e753e2bda677.1752086656.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas INTC External IRQ Pin driver from
SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
This lets us drop the __maybe_unused annotations from its suspend
callbacks, and reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP
is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-intc-irqpin.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-renesas-intc-irqpin.c
index 117b74b635ea8b76..7951292d2d9b1d6c 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -570,7 +570,7 @@ static void intc_irqpin_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused intc_irqpin_suspend(struct device *dev)
+static int intc_irqpin_suspend(struct device *dev)
 {
 	struct intc_irqpin_priv *p = dev_get_drvdata(dev);
 
@@ -580,7 +580,7 @@ static int __maybe_unused intc_irqpin_suspend(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(intc_irqpin_pm_ops, intc_irqpin_suspend, NULL);
+static DEFINE_SIMPLE_DEV_PM_OPS(intc_irqpin_pm_ops, intc_irqpin_suspend, NULL);
 
 static struct platform_driver intc_irqpin_device_driver = {
 	.probe		= intc_irqpin_probe,
@@ -588,7 +588,7 @@ static struct platform_driver intc_irqpin_device_driver = {
 	.driver		= {
 		.name		= "renesas_intc_irqpin",
 		.of_match_table	= intc_irqpin_dt_ids,
-		.pm		= &intc_irqpin_pm_ops,
+		.pm		= pm_sleep_ptr(&intc_irqpin_pm_ops),
 	}
 };
 
-- 
2.43.0


