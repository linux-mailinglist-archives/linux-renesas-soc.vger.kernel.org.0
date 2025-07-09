Return-Path: <linux-renesas-soc+bounces-19451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF4AFF165
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 21:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 561A017A46F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 19:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C43523F413;
	Wed,  9 Jul 2025 19:04:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806E222256F;
	Wed,  9 Jul 2025 19:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752087874; cv=none; b=OUpBgQERjeaCDXA63tlv0VkxDC3puvsfTYMz4flrv1LXex5op1yhe13F6sXaLEl4m5yclnNTcMNmedAkOL/p9zIliW9pJpB/aVJ3lKtNgtR54rPnO4QOFAokObw4yzHgBlEDx9D4rHYVqatagjxxjLDuLPCZpNEfP85+wZYVtqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752087874; c=relaxed/simple;
	bh=jovnTXB6WxhgvmJH2lguWxFV1byK6fmMl6jbB48F5dE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZdYk0NaQVMMHnc/6u61i/4xhnIrbr3+jDhMCRtGsk6Kd9DEVEaaYHRcVwLL0Ch2Cd9jhluWubFuKdErm0VRocWBPLllsjfNYG8rbVmb5sn8dZlH2h2XMVwra+VsK4O/7fnBXlNP9TcuiYarozdzeZazoFAdlSvKnLk5gXj0bhkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50287C4CEF0;
	Wed,  9 Jul 2025 19:04:32 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] thermal: rcar: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  9 Jul 2025 21:04:17 +0200
Message-ID: <4bf4c21a72abeb53649ea545a3db768355b03d50.1752087838.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas R-Car thermal driver from SIMPLE_DEV_PM_OPS() to
DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
check for CONFIG_PM_SLEEP, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled, while increasing build coverage.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/thermal/renesas/rcar_thermal.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 00a66ee0a5b00c5f..4323b96670e7571f 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -534,7 +534,6 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 	return ret;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int rcar_thermal_suspend(struct device *dev)
 {
 	struct rcar_thermal_common *common = dev_get_drvdata(dev);
@@ -567,15 +566,14 @@ static int rcar_thermal_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(rcar_thermal_pm_ops, rcar_thermal_suspend,
-			 rcar_thermal_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rcar_thermal_pm_ops, rcar_thermal_suspend,
+				rcar_thermal_resume);
 
 static struct platform_driver rcar_thermal_driver = {
 	.driver	= {
 		.name	= "rcar_thermal",
-		.pm = &rcar_thermal_pm_ops,
+		.pm = pm_sleep_ptr(&rcar_thermal_pm_ops),
 		.of_match_table = rcar_thermal_dt_ids,
 	},
 	.probe		= rcar_thermal_probe,
-- 
2.43.0


