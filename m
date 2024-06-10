Return-Path: <linux-renesas-soc+bounces-6015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F90902761
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 19:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30D91B29EB4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 16:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014E31E898;
	Mon, 10 Jun 2024 16:48:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC1E1482F6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718038134; cv=none; b=ujQnqH+BXod4whoeR9SWe/kiFmZIl/azWAGESlaGCnrPI1MN/IGjYRA6GmafBU2wH96Uy5tgY+Qb6jrmnvbUVBxC6MfI6ckDOZH23DMvfdwr6H453ADOorkFfO/7B+ojZDnNyO1qODhPjWxozmbjRy66mE/sAlMVibR56+C3ZJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718038134; c=relaxed/simple;
	bh=wDz9j2Hp7WS/VB5/jLmyYNaj1RdVo42/qs3oSWfZrU4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t7/p/2O+kA9rNuZ7/DH+eMi/2qVuBtfD71fEm0ndl/zEpcK/GTiHB+xO0zXOtbmqTI/dlKs8Hj82HE9df6m3eJyEpd1z05BZ1K7hgYueWEhTpvtdpKsT2/aOfcNPkEfAUBSTidrb/kZHE/3wGIqzpABFJjVBHS6OBWgTffDeipU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,227,1712588400"; 
   d="scan'208";a="211315762"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2024 01:48:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.192])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CED614012AFE;
	Tue, 11 Jun 2024 01:48:48 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] reset: rzg2l-usbphy-ctrl: Move reset controller registration
Date: Mon, 10 Jun 2024 17:48:45 +0100
Message-Id: <20240610164845.89666-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As soon as the reset controller is registered, it could be used by a
reset consumer. That means hardware setup to be done first and then the
registration of the reset controller. So move the registration of reset
controller at the end of probe().

While at it, fix the issue that the reset is not re-asserted in case
devm_reset_controller_register() fails and also use goto statements to
simplify the error path in probe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit header and description
 * Moved reset controller registration at the end of the probe()
 * Fixed the issue that the reset is not re-asserted in case
   devm_reset_controller_register() fails
 * Used goto statements to simplify the error path in probe().
 * Restored the blank line before devm_reset_controller_register().
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 32 +++++++++++++++----------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 8f6fbd978591..29b852a8ac5a 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -125,25 +125,14 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	priv->rcdev.ops = &rzg2l_usbphy_ctrl_reset_ops;
-	priv->rcdev.of_reset_n_cells = 1;
-	priv->rcdev.nr_resets = NUM_PORTS;
-	priv->rcdev.of_node = dev->of_node;
-	priv->rcdev.dev = dev;
-
-	error = devm_reset_controller_register(dev, &priv->rcdev);
-	if (error)
-		return error;
-
 	spin_lock_init(&priv->lock);
 	dev_set_drvdata(dev, priv);
 
 	pm_runtime_enable(&pdev->dev);
 	error = pm_runtime_resume_and_get(&pdev->dev);
 	if (error < 0) {
-		pm_runtime_disable(&pdev->dev);
-		reset_control_assert(priv->rstc);
-		return dev_err_probe(&pdev->dev, error, "pm_runtime_resume_and_get failed");
+		dev_err_probe(&pdev->dev, error, "pm_runtime_resume_and_get failed");
+		goto err_pm_disable_reset_deassert;
 	}
 
 	/* put pll and phy into reset state */
@@ -153,7 +142,24 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	writel(val, priv->base + RESET);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
+	priv->rcdev.ops = &rzg2l_usbphy_ctrl_reset_ops;
+	priv->rcdev.of_reset_n_cells = 1;
+	priv->rcdev.nr_resets = NUM_PORTS;
+	priv->rcdev.of_node = dev->of_node;
+	priv->rcdev.dev = dev;
+
+	error = devm_reset_controller_register(dev, &priv->rcdev);
+	if (error)
+		goto err_pm_runtime_put;
+
 	return 0;
+
+err_pm_runtime_put:
+	pm_runtime_put(&pdev->dev);
+err_pm_disable_reset_deassert:
+	pm_runtime_disable(&pdev->dev);
+	reset_control_assert(priv->rstc);
+	return error;
 }
 
 static void rzg2l_usbphy_ctrl_remove(struct platform_device *pdev)
-- 
2.25.1


