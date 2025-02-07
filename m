Return-Path: <linux-renesas-soc+bounces-12941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D49A2C1AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 12:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A8283AB36F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 11:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FD92417ED;
	Fri,  7 Feb 2025 11:37:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511961A2C0E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Feb 2025 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928232; cv=none; b=LsO+7MSwOMgxUlViXG9XcdI2RpCx/nmDDm4+tUGNZ1gSJQA3Z0mfgYAflSsS/VJ3Jgyj++vzf+n2OLZRDxL9S2YTz1mABEsH9EacQEjS3JV3vgsnMFNu7V68GjwARlR4XdeZ8ZHkryTpIZmQMQQZxRmQabiIoHNoTUXeNpFk5DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928232; c=relaxed/simple;
	bh=0ojGATkfD8X3BAs+N0zeXSILTGGkWleCPcqL87tO+FA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQHkXNZDuGlQleT2asPdZ7j/p5xqIlSobnw0Qjpp9W5+r15a8W41aKcBHCuwHRotugNkkSQKV36d5ZhkKP/yltyzSEnOqoNasUinQNvl1+Oj3Foq78ZCEt6eai2/6iC9FIdE/aVsBC0DONXvbRSSGBbV+X6FFYUu1T2tGJxr19A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: jaQ/nz6+Rjmfoxf8Zuh02Q==
X-CSE-MsgGUID: lEB6/vpCTnyPbvIU4hzYnQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Feb 2025 20:37:10 +0900
Received: from localhost.localdomain (unknown [10.226.93.6])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DAE99400F31D;
	Fri,  7 Feb 2025 20:37:07 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 03/12] irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
Date: Fri,  7 Feb 2025 11:36:35 +0000
Message-ID: <20250207113653.21641-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250207113653.21641-1-biju.das.jz@bp.renesas.com>
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com>
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
v3->v4:
 * Collected the tags.
v3:
 * New patch 
---
 drivers/irqchip/irq-renesas-rzv2h.c | 37 +++++++++++++++--------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index fd432b43506b..fd678947df83 100644
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


