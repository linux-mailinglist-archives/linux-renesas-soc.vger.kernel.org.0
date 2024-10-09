Return-Path: <linux-renesas-soc+bounces-9636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2124299788A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 00:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD6B7284EC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 22:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A0818E740;
	Wed,  9 Oct 2024 22:36:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F28185949;
	Wed,  9 Oct 2024 22:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728513376; cv=none; b=qO89jWxQftWX8d/P711kKRUaayZdamRoUgBslfyotq1DhP37notQhaUnx2ee/nItpZK727qMOGq6ZsEg47ngiB+Ron8rexPWZdcW33RMxIfBlBp2N1S2PRDMI3+seZp5VC5ZhYq3LY+DvhtQOKWd5bihOKI4YES6V98S1/Ugm54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728513376; c=relaxed/simple;
	bh=AWjjCwnq013AX7dWTrv59eo3VnUf8vzVKLfDvjrLUbc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZOuXM8hlMfIE+CbRrQCQsIxsMy5qZ1obOmMUmJJS3Y2MJnSGb//2CgzLAiRdq99q1s5FsyBwYz1N+XOJ2z6oClSw6XwJTmjZ2b0J13LHxG883kNhJNsacMOtTvHaa59vH226KSrU28qJA1gl6Va32l4jjtdfnT9NJCW4wDBhXKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.11,191,1725289200"; 
   d="scan'208";a="221479426"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 10 Oct 2024 07:36:07 +0900
Received: from mulinux.home (unknown [10.226.93.36])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7870240071F5;
	Thu, 10 Oct 2024 07:35:52 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] irqchip/renesas-rzg2l: Fix missing put_device
Date: Wed,  9 Oct 2024 23:35:39 +0100
Message-Id: <20241009223539.788638-1-fabrizio.castro.jz@renesas.com>
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

Make sure we call put_device when failing.

"make coccicheck" will complain about a missing put_device before
successfully returning from rzv2h_icu_init, however, that's a false
positive.

Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller driver")
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---

v1->v2:
* Drop put_device from the successful path, and add a comment to prevent
  others from acting upon make coccicheck output.

 drivers/irqchip/irq-renesas-rzg2l.c | 32 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 693ff285ca2c..040463e3b39c 100644
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
@@ -591,6 +598,10 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 
 	register_syscore_ops(&rzg2l_irqc_syscore_ops);
 
+	/*
+	 * coccicheck complains about a missing put_device call before returning, but it's a false
+	 * positive. We still need &pdev->dev after successfully returning from this function.
+	 */
 	return 0;
 
 pm_put:
@@ -598,6 +609,9 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
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


