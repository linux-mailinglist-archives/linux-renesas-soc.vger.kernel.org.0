Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32821E60F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 17:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbfD2PUg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 11:20:36 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:57790 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728634AbfD2PUJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 11:20:09 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id 6FL72000r3XaVaC06FL7kg; Mon, 29 Apr 2019 17:20:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL84d-0002Xu-Op; Mon, 29 Apr 2019 17:20:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL84d-0005tL-Nq; Mon, 29 Apr 2019 17:20:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] irqchip/renesas-irqc: Add helper variable dev = &pdev->dev
Date:   Mon, 29 Apr 2019 17:20:04 +0200
Message-Id: <20190429152006.22593-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429152006.22593-1-geert+renesas@glider.be>
References: <20190429152006.22593-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

