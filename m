Return-Path: <linux-renesas-soc+bounces-12256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 124D4A169DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD76318879A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 09:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187131A9B49;
	Mon, 20 Jan 2025 09:47:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D7418801A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737366469; cv=none; b=Hq6evHokBMsG4aDBjBJ34zdcrcVd7qnvxzQlWMy0SMWQfByn1cLjDqvwFB2c55ZH6D8sZlLwiuC7SQokHitlqo7S3ulS1V4fYv09CYVS/ybgfSelyK317URFPL0DzdbjN8hzCGjAfS8zQMcvcaUq14sVFDr36iITz37ilFrPVms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737366469; c=relaxed/simple;
	bh=ip9hWimIMhqxUlxyDdu0RZBGaVzHeR7Rl3IJxiuIEns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EpJPLf+LEr6+eMWQEzGjPAtRZdQPFifkAz5CVj2XSYt5gX9XW4oEZVftgYs0JodU6Fv/repCblwNNDN2AP/fjwJXJxL6UizY6E/QwJqhAAbLB6+9m2jtNrE+ztfqyU8PCjJ48fjth0BB0rTXy1IfDkspALXHPeGv1OsCoHAWliU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: sf8iisVGRVSjXzeY2XsvLA==
X-CSE-MsgGUID: uhEkJTbCSpuU5SJb52uVLA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Jan 2025 18:47:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 73C09400F73B;
	Mon, 20 Jan 2025 18:47:31 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 04/11] irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
Date: Mon, 20 Jan 2025 09:47:00 +0000
Message-ID: <20250120094715.25802-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify rzv2h_icu_init() by using newly added devm_* helpers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index fd432b43506b..a02d47529564 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -456,23 +456,23 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 		goto put_dev;
 	}
 
-	resetn = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	resetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, NULL);
 	if (IS_ERR(resetn)) {
 		ret = PTR_ERR(resetn);
+		dev_err(&pdev->dev, "failed to acquire deasserted reset: %d\n", ret);
 		goto put_dev;
 	}
 
-	ret = reset_control_deassert(resetn);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n", ret);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "devm_pm_runtime_enable failed, %d\n", ret);
 		goto put_dev;
 	}
 
-	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d\n", ret);
-		goto pm_disable;
+		goto put_dev;
 	}
 
 	raw_spin_lock_init(&rzv2h_icu_data->lock);
@@ -493,9 +493,6 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 
 pm_put:
 	pm_runtime_put(&pdev->dev);
-pm_disable:
-	pm_runtime_disable(&pdev->dev);
-	reset_control_assert(resetn);
 put_dev:
 	put_device(&pdev->dev);
 
-- 
2.43.0


