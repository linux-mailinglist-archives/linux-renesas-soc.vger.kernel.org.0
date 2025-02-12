Return-Path: <linux-renesas-soc+bounces-13089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCFFA32E8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 19:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B4EB188541D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 18:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E394261372;
	Wed, 12 Feb 2025 18:20:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0901225EFA3;
	Wed, 12 Feb 2025 18:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739384450; cv=none; b=QKw6+4WBF/+gCxRXdtrstqZGvScSUXX4v7Ww/ExZBh+7G2YX3wUVkI0W+QgHdtLKzVhZ86Mdw6+UFXGW+tmT2ckWfKLFYvaMhGzEHcXOxZuwweNJVEWbNdgqkdSbIfCQ9FN83pbrn50ku97dKPD/71D3eItB4uU87cKXEyb9Du4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739384450; c=relaxed/simple;
	bh=X+1P98n1IWnJTnHdZxnGM/QWqOujuNNlyw/QLgcIcFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j5rgsHhcNHpc70PUEJj3HVRZawaMmBcUMX3PdRrUbdtecbMgPkoNagXEhT+cAMHavjUq7ixSq0xC4xFwdHlkMVprqn5r17ByNW0Gl0CEtAO+UWwVJVOnHF5nc9Ow8NESk02hY0nQ1ozxnSebR3NjLbUbJP8qzwEUOcpRLIzY+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: vaQDwI5dRhSm4dybD2utVQ==
X-CSE-MsgGUID: NKApMWWDRAeCFjvKEB8vOg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Feb 2025 03:20:45 +0900
Received: from mulinux.example.org (unknown [10.226.93.8])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 05C094019C77;
	Thu, 13 Feb 2025 03:20:42 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/6] irqchip/renesas-rzg2l: Use local dev pointer in rzg2l_irqc_common_init()
Date: Wed, 12 Feb 2025 18:20:29 +0000
Message-Id: <20250212182034.366167-2-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212182034.366167-1-fabrizio.castro.jz@renesas.com>
References: <20250212182034.366167-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace direct references to `&pdev->dev` with the local `dev` pointer
in rzg2l_irqc_common_init() to avoid redundant dereferencing.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
Hi Geert,

I have taken the liberty of adding your Suggested-by, I hope that's
okay?

I have also added a few more patches to further tidy up
rzg2l_irqc_common_init().

Thanks!

Fab
---
 drivers/irqchip/irq-renesas-rzg2l.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 99e27e01b0b1..a7c3a3cc6b9f 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -542,40 +542,40 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
-		dev_err(&pdev->dev, "cannot find parent domain\n");
+		dev_err(dev, "cannot find parent domain\n");
 		return -ENODEV;
 	}
 
-	rzg2l_irqc_data = devm_kzalloc(&pdev->dev, sizeof(*rzg2l_irqc_data), GFP_KERNEL);
+	rzg2l_irqc_data = devm_kzalloc(dev, sizeof(*rzg2l_irqc_data), GFP_KERNEL);
 	if (!rzg2l_irqc_data)
 		return -ENOMEM;
 
 	rzg2l_irqc_data->irqchip = irq_chip;
 
-	rzg2l_irqc_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
+	rzg2l_irqc_data->base = devm_of_iomap(dev, dev->of_node, 0, NULL);
 	if (IS_ERR(rzg2l_irqc_data->base))
 		return PTR_ERR(rzg2l_irqc_data->base);
 
 	ret = rzg2l_irqc_parse_interrupts(rzg2l_irqc_data, node);
 	if (ret) {
-		dev_err(&pdev->dev, "cannot parse interrupts: %d\n", ret);
+		dev_err(dev, "cannot parse interrupts: %d\n", ret);
 		return ret;
 	}
 
-	resetn = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	resetn = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(resetn))
 		return PTR_ERR(resetn);
 
 	ret = reset_control_deassert(resetn);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n", ret);
+		dev_err(dev, "failed to deassert resetn pin, %d\n", ret);
 		return ret;
 	}
 
-	pm_runtime_enable(&pdev->dev);
-	ret = pm_runtime_resume_and_get(&pdev->dev);
+	pm_runtime_enable(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d\n", ret);
+		dev_err(dev, "pm_runtime_resume_and_get failed: %d\n", ret);
 		goto pm_disable;
 	}
 
@@ -585,7 +585,7 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 					      node, &rzg2l_irqc_domain_ops,
 					      rzg2l_irqc_data);
 	if (!irq_domain) {
-		dev_err(&pdev->dev, "failed to add irq domain\n");
+		dev_err(dev, "failed to add irq domain\n");
 		ret = -ENOMEM;
 		goto pm_put;
 	}
@@ -606,9 +606,9 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 	return 0;
 
 pm_put:
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put(dev);
 pm_disable:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 	reset_control_assert(resetn);
 	return ret;
 }
-- 
2.34.1


