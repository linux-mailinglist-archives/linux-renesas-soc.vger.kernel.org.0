Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B52C2B432
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2019 14:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfE0MEr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 May 2019 08:04:47 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:41508 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbfE0MEQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 May 2019 08:04:16 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id HQ4D2000Q3XaVaC01Q4DLC; Mon, 27 May 2019 14:04:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEMP-0001Pg-J1; Mon, 27 May 2019 14:04:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEMP-00015d-Hn; Mon, 27 May 2019 14:04:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/5] irqchip/renesas-irqc: Add helper variable dev = &pdev->dev
Date:   Mon, 27 May 2019 14:04:10 +0200
Message-Id: <20190527120412.4071-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527120412.4071-1-geert+renesas@glider.be>
References: <20190527120412.4071-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The probe function uses "&pdev->dev" a lot, hence add a shorthand for
that.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
  - Add Reviewed-by,
---
 drivers/irqchip/irq-renesas-irqc.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index 0955ffe12b32eb36..3cc428ba495c3793 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -124,10 +124,11 @@ static irqreturn_t irqc_irq_handler(int irq, void *dev_id)
 
 static int irqc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	const char *name = dev_name(dev);
 	struct irqc_priv *p;
 	struct resource *io;
 	struct resource *irq;
-	const char *name = dev_name(&pdev->dev);
 	int ret;
 	int k;
 
@@ -140,13 +141,13 @@ static int irqc_probe(struct platform_device *pdev)
 	p->pdev = pdev;
 	platform_set_drvdata(pdev, p);
 
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
 
 	/* get hold of manadatory IOMEM */
 	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!io) {
-		dev_err(&pdev->dev, "not enough IOMEM resources\n");
+		dev_err(dev, "not enough IOMEM resources\n");
 		ret = -EINVAL;
 		goto err1;
 	}
@@ -164,7 +165,7 @@ static int irqc_probe(struct platform_device *pdev)
 
 	p->number_of_irqs = k;
 	if (p->number_of_irqs < 1) {
-		dev_err(&pdev->dev, "not enough IRQ resources\n");
+		dev_err(dev, "not enough IRQ resources\n");
 		ret = -EINVAL;
 		goto err1;
 	}
@@ -178,12 +179,11 @@ static int irqc_probe(struct platform_device *pdev)
 
 	p->cpu_int_base = p->iomem + IRQC_INT_CPU_BASE(0); /* SYS-SPI */
 
-	p->irq_domain = irq_domain_add_linear(pdev->dev.of_node,
-					      p->number_of_irqs,
+	p->irq_domain = irq_domain_add_linear(dev->of_node, p->number_of_irqs,
 					      &irq_generic_chip_ops, p);
 	if (!p->irq_domain) {
 		ret = -ENXIO;
-		dev_err(&pdev->dev, "cannot initialize irq domain\n");
+		dev_err(dev, "cannot initialize irq domain\n");
 		goto err2;
 	}
 
@@ -191,7 +191,7 @@ static int irqc_probe(struct platform_device *pdev)
 					     1, name, handle_level_irq,
 					     0, 0, IRQ_GC_INIT_NESTED_LOCK);
 	if (ret) {
-		dev_err(&pdev->dev, "cannot allocate generic chip\n");
+		dev_err(dev, "cannot allocate generic chip\n");
 		goto err3;
 	}
 
@@ -209,13 +209,13 @@ static int irqc_probe(struct platform_device *pdev)
 	for (k = 0; k < p->number_of_irqs; k++) {
 		if (request_irq(p->irq[k].requested_irq, irqc_irq_handler,
 				0, name, &p->irq[k])) {
-			dev_err(&pdev->dev, "failed to request IRQ\n");
+			dev_err(dev, "failed to request IRQ\n");
 			ret = -ENOENT;
 			goto err4;
 		}
 	}
 
-	dev_info(&pdev->dev, "driving %d irqs\n", p->number_of_irqs);
+	dev_info(dev, "driving %d irqs\n", p->number_of_irqs);
 
 	return 0;
 err4:
@@ -227,8 +227,8 @@ static int irqc_probe(struct platform_device *pdev)
 err2:
 	iounmap(p->iomem);
 err1:
-	pm_runtime_put(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
 	kfree(p);
 err0:
 	return ret;
-- 
2.17.1

