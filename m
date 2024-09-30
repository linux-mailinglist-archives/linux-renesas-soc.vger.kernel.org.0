Return-Path: <linux-renesas-soc+bounces-9200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE8A98A7E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED7211C23873
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 14:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1186F190471;
	Mon, 30 Sep 2024 14:56:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2183018E755;
	Mon, 30 Sep 2024 14:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727708162; cv=none; b=PKvnYq4LOzNcDSYuqMXfgC2uALAhBFjqILLui3h90xvnbtSV19EMK1QUcR3Od3MP5mBZAk8kMqtaAY3dhMSzaSEgdeeOaSHJz+XDM2t7ruEMQgPCGUgqYWzvMAEjXRcpiY3fR9z5OnX8yOvNQwfK2KnHabzo93xlQION54nv+Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727708162; c=relaxed/simple;
	bh=gJ6PsIOZiM2cIBuDM/fsMvk8lDnGPaNbcWXuXHUeb98=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AVhda6TtsKZahvFk4s3tIS622ASz6zMiR4sU0ODvL1GoyHoZlhe6k+bBs7JY1lCybV9gPlXHCDEUVZypM9NiQKr5X4atWOkXbvqL4JSvb076yLIL1e0fyVSAgiunqxP4q4IDeRH55tbwM5ZWfwNI2fMKt5n9luLqKGccZVE5E1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="220366721"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Sep 2024 23:55:58 +0900
Received: from mulinux.home (unknown [10.226.92.226])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 12DB540071E5;
	Mon, 30 Sep 2024 23:55:43 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] irqchip/renesas-rzg2l: Fix missing put_device
Date: Mon, 30 Sep 2024 15:55:39 +0100
Message-Id: <20240930145539.357573-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rzg2l_irqc_common_init calls of_find_device_by_node, but the
corresponding put_device call is missing.

Make sure we call put_device both when failing and when
succeeding.

Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller driver")
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 693ff285ca2c..2bc9d3befa61 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -542,33 +542,40 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		dev_err(&pdev->dev, "cannot find parent domain\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto put_dev;
 	}
 
 	rzg2l_irqc_data = devm_kzalloc(&pdev->dev, sizeof(*rzg2l_irqc_data), GFP_KERNEL);
-	if (!rzg2l_irqc_data)
-		return -ENOMEM;
+	if (!rzg2l_irqc_data) {
+		ret = -ENOMEM;
+		goto put_dev;
+	}
 
 	rzg2l_irqc_data->irqchip = irq_chip;
 
 	rzg2l_irqc_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
-	if (IS_ERR(rzg2l_irqc_data->base))
-		return PTR_ERR(rzg2l_irqc_data->base);
+	if (IS_ERR(rzg2l_irqc_data->base)) {
+		ret = PTR_ERR(rzg2l_irqc_data->base);
+		goto put_dev;
+	}
 
 	ret = rzg2l_irqc_parse_interrupts(rzg2l_irqc_data, node);
 	if (ret) {
 		dev_err(&pdev->dev, "cannot parse interrupts: %d\n", ret);
-		return ret;
+		goto put_dev;
 	}
 
 	resetn = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(resetn))
-		return PTR_ERR(resetn);
+	if (IS_ERR(resetn)) {
+		ret = PTR_ERR(resetn);
+		goto put_dev;
+	}
 
 	ret = reset_control_deassert(resetn);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n", ret);
-		return ret;
+		goto put_dev;
 	}
 
 	pm_runtime_enable(&pdev->dev);
@@ -591,6 +598,7 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 
 	register_syscore_ops(&rzg2l_irqc_syscore_ops);
 
+	put_device(&pdev->dev);
 	return 0;
 
 pm_put:
@@ -598,6 +606,9 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 pm_disable:
 	pm_runtime_disable(&pdev->dev);
 	reset_control_assert(resetn);
+put_dev:
+	put_device(&pdev->dev);
+
 	return ret;
 }
 
-- 
2.34.1


