Return-Path: <linux-renesas-soc+bounces-13074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0380A324A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 12:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4499E1616BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 11:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F482208966;
	Wed, 12 Feb 2025 11:17:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7811F2365
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Feb 2025 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739359073; cv=none; b=mFfdNy83KB3DAS2T2vQ2/lWw6zQOvUd4p0YPq71mpTajDUh8BTxwwW3syE0mnBDIAlYWyeEwML8skuFvmvDHP8/pW9jONiedubwtmZHvxfouf2FbIXrdRpsRFsude5vsL7hgzyBqDSI2rQPwuhgy83mBFNNgSXEOazb0FFI8Ye8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739359073; c=relaxed/simple;
	bh=hZKzQQ4DoxaTAFnQu58uQ4pio2uY0aM90Sir1qGEl/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HC//+fUJUhpZgA+hWN8Q4by5H51XvCS0m+lVoibKocUqJDblHwzkHry3zVx4mFD1yigiQ60Okke9ekJcdl5QaEf1dqFaRJwWJ7NUAK0S0JEm19aLIaf9l6f147V4Xp5FHCXuroQpl+3WlE4NBgjr3HfkYS6FLQv61kRJjCVNlDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: TvhWnjQZSMCK9vs8MbR62A==
X-CSE-MsgGUID: aFTnSiiWQ2SxMPA4xoZiDQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Feb 2025 20:12:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6663C425C777;
	Wed, 12 Feb 2025 20:12:47 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 04/12] irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
Date: Wed, 12 Feb 2025 11:12:13 +0000
Message-ID: <20250212111231.143277-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_add_action_or_reset() for calling put_device in error path
of rzv2h_icu_init() to simplify the code by using recently added devm_*
helpers.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected the tags.
v3:
 * New patch 
---
 drivers/irqchip/irq-renesas-rzv2h.c | 37 +++++++++++++++--------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 0573062c89c4..d724f32dde8f 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -419,6 +419,11 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv, struct device
 	return 0;
 }
 
+static void rzv2h_icu_put_device(void *data)
+{
+	put_device(data);
+}
+
 static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 {
 	struct irq_domain *irq_domain, *parent_domain;
@@ -431,41 +436,39 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 	if (!pdev)
 		return -ENODEV;
 
+	ret = devm_add_action_or_reset(&pdev->dev, rzv2h_icu_put_device,
+				       &pdev->dev);
+	if (ret < 0)
+		return ret;
+
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		dev_err(&pdev->dev, "cannot find parent domain\n");
-		ret = -ENODEV;
-		goto put_dev;
+		return -ENODEV;
 	}
 
 	rzv2h_icu_data = devm_kzalloc(&pdev->dev, sizeof(*rzv2h_icu_data), GFP_KERNEL);
-	if (!rzv2h_icu_data) {
-		ret = -ENOMEM;
-		goto put_dev;
-	}
+	if (!rzv2h_icu_data)
+		return -ENOMEM;
 
 	rzv2h_icu_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
-	if (IS_ERR(rzv2h_icu_data->base)) {
-		ret = PTR_ERR(rzv2h_icu_data->base);
-		goto put_dev;
-	}
+	if (IS_ERR(rzv2h_icu_data->base))
+		return PTR_ERR(rzv2h_icu_data->base);
 
 	ret = rzv2h_icu_parse_interrupts(rzv2h_icu_data, node);
 	if (ret) {
 		dev_err(&pdev->dev, "cannot parse interrupts: %d\n", ret);
-		goto put_dev;
+		return ret;
 	}
 
 	resetn = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(resetn)) {
-		ret = PTR_ERR(resetn);
-		goto put_dev;
-	}
+	if (IS_ERR(resetn))
+		return PTR_ERR(resetn);
 
 	ret = reset_control_deassert(resetn);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n", ret);
-		goto put_dev;
+		return ret;
 	}
 
 	pm_runtime_enable(&pdev->dev);
@@ -496,8 +499,6 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 pm_disable:
 	pm_runtime_disable(&pdev->dev);
 	reset_control_assert(resetn);
-put_dev:
-	put_device(&pdev->dev);
 
 	return ret;
 }
-- 
2.43.0


