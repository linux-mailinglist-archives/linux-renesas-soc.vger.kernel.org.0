Return-Path: <linux-renesas-soc+bounces-9664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B99998DB0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 18:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2A811F24759
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 16:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5C1197A93;
	Thu, 10 Oct 2024 16:42:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E332C1957E4;
	Thu, 10 Oct 2024 16:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728578533; cv=none; b=FQOUlD+wAYulWkuGQhVktxHsjWRj1ccNSSXoyt9bJGpVEaQQUHf5PZlHihCiRjciJz4H0hqIKtORu66BDzg2Y3UkOEhQs79ktH3ZLiJQ91ftpbPgXocgYjr5lWe/QSfE6XRfYVkskR1jNm9yiOObTcoqT7ju6JtYaNwyLg4ngfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728578533; c=relaxed/simple;
	bh=Dmshi+PkdsB3yfDD62dAlBPBe+ZQIBgl8Rq8tKU7WZg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F1yEPeRNMBNUy/SzCWfAJGf3WKYtgB1OI+DjnncIjnsnfZEl9h9wb7ma3rMzFNikxRPz00ZILrzLyNwJ0njsXQ1E44bMsU7/AxiEn04pEKHuPuLazTSdDFbfM4C2qfLfgeJA/rHdZKjPnLn5PWjCU419h4H0hCI51a+XKDEfjMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.11,193,1725289200"; 
   d="scan'208";a="221574508"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Oct 2024 01:42:09 +0900
Received: from mulinux.home (unknown [10.226.92.34])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id BCA844025507;
	Fri, 11 Oct 2024 01:41:57 +0900 (JST)
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
Subject: [PATCH v3] irqchip/renesas-rzg2l: Fix missing put_device
Date: Thu, 10 Oct 2024 17:41:55 +0100
Message-Id: <20241010164155.808931-1-fabrizio.castro.jz@renesas.com>
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
successfully returning from rzg2l_irqc_common_init, however, that's
a false positive.

Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller driver")
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---

v2->v3:
* Fixed typo in commit log (rzv2h_icu_init replaced with rzg2l_irqc_common_init).

v1->v2:
* Dropped put_device from the successful path, and added a comment to prevent
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


