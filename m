Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71781E609
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 17:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbfD2PUS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 11:20:18 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:57806 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728635AbfD2PUL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 11:20:11 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id 6FL72000v3XaVaC06FL7ki; Mon, 29 Apr 2019 17:20:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL84d-0002Y2-Qp; Mon, 29 Apr 2019 17:20:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL84d-0005tU-PT; Mon, 29 Apr 2019 17:20:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] irqchip/renesas-irqc: Convert to managed initializations
Date:   Mon, 29 Apr 2019 17:20:06 +0200
Message-Id: <20190429152006.22593-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429152006.22593-1-geert+renesas@glider.be>
References: <20190429152006.22593-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Simplify error handling by converting the driver to use managed
allocations and initializations.

Note that platform_get_resource() and ioremap_nocache() are combined in
devm_platform_ioremap_resource().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-irqc.c | 54 +++++++++---------------------
 1 file changed, 15 insertions(+), 39 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index af03ee31a87bb11d..cde9f9c0687e94a4 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -126,16 +126,13 @@ static int irqc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	const char *name = dev_name(dev);
 	struct irqc_priv *p;
-	struct resource *io;
 	struct resource *irq;
 	int ret;
 	int k;
 
-	p = kzalloc(sizeof(*p), GFP_KERNEL);
-	if (!p) {
-		ret = -ENOMEM;
-		goto err0;
-	}
+	p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
 
 	p->dev = dev;
 	platform_set_drvdata(pdev, p);
@@ -143,14 +140,6 @@ static int irqc_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	/* get hold of manadatory IOMEM */
-	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!io) {
-		dev_err(dev, "not enough IOMEM resources\n");
-		ret = -EINVAL;
-		goto err1;
-	}
-
 	/* allow any number of IRQs between 1 and IRQC_IRQ_MAX */
 	for (k = 0; k < IRQC_IRQ_MAX; k++) {
 		irq = platform_get_resource(pdev, IORESOURCE_IRQ, k);
@@ -166,14 +155,14 @@ static int irqc_probe(struct platform_device *pdev)
 	if (p->number_of_irqs < 1) {
 		dev_err(dev, "not enough IRQ resources\n");
 		ret = -EINVAL;
-		goto err1;
+		goto err_runtime_pm_disable;
 	}
 
 	/* ioremap IOMEM and setup read/write callbacks */
-	p->iomem = ioremap_nocache(io->start, resource_size(io));
-	if (!p->iomem) {
-		ret = -ENXIO;
-		goto err2;
+	p->iomem = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(p->iomem)) {
+		ret = PTR_ERR(p->iomem);
+		goto err_runtime_pm_disable;
 	}
 
 	p->cpu_int_base = p->iomem + IRQC_INT_CPU_BASE(0); /* SYS-SPI */
@@ -183,7 +172,7 @@ static int irqc_probe(struct platform_device *pdev)
 	if (!p->irq_domain) {
 		ret = -ENXIO;
 		dev_err(dev, "cannot initialize irq domain\n");
-		goto err2;
+		goto err_runtime_pm_disable;
 	}
 
 	ret = irq_alloc_domain_generic_chips(p->irq_domain, p->number_of_irqs,
@@ -191,7 +180,7 @@ static int irqc_probe(struct platform_device *pdev)
 					     0, 0, IRQ_GC_INIT_NESTED_LOCK);
 	if (ret) {
 		dev_err(dev, "cannot allocate generic chip\n");
-		goto err3;
+		goto err_remove_domain;
 	}
 
 	p->gc = irq_get_domain_generic_chip(p->irq_domain, 0);
@@ -206,46 +195,33 @@ static int irqc_probe(struct platform_device *pdev)
 
 	/* request interrupts one by one */
 	for (k = 0; k < p->number_of_irqs; k++) {
-		if (request_irq(p->irq[k].requested_irq, irqc_irq_handler,
-				0, name, &p->irq[k])) {
+		if (devm_request_irq(dev, p->irq[k].requested_irq,
+				     irqc_irq_handler, 0, name, &p->irq[k])) {
 			dev_err(dev, "failed to request IRQ\n");
 			ret = -ENOENT;
-			goto err4;
+			goto err_remove_domain;
 		}
 	}
 
 	dev_info(dev, "driving %d irqs\n", p->number_of_irqs);
 
 	return 0;
-err4:
-	while (--k >= 0)
-		free_irq(p->irq[k].requested_irq, &p->irq[k]);
 
-err3:
+err_remove_domain:
 	irq_domain_remove(p->irq_domain);
-err2:
-	iounmap(p->iomem);
-err1:
+err_runtime_pm_disable:
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
-	kfree(p);
-err0:
 	return ret;
 }
 
 static int irqc_remove(struct platform_device *pdev)
 {
 	struct irqc_priv *p = platform_get_drvdata(pdev);
-	int k;
-
-	for (k = 0; k < p->number_of_irqs; k++)
-		free_irq(p->irq[k].requested_irq, &p->irq[k]);
 
 	irq_domain_remove(p->irq_domain);
-	iounmap(p->iomem);
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	kfree(p);
 	return 0;
 }
 
-- 
2.17.1

