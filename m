Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14DBAE604
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 17:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbfD2PUK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 11:20:10 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:58808 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728642AbfD2PUK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 11:20:10 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id 6FL72000K3XaVaC01FL7wa; Mon, 29 Apr 2019 17:20:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL84d-0002Xw-Pn; Mon, 29 Apr 2019 17:20:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL84d-0005tP-Oa; Mon, 29 Apr 2019 17:20:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] irqchip/renesas-irqc: Replace irqc_priv.pdev by irqc_priv.dev
Date:   Mon, 29 Apr 2019 17:20:05 +0200
Message-Id: <20190429152006.22593-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429152006.22593-1-geert+renesas@glider.be>
References: <20190429152006.22593-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Nothing really uses irqc_priv.pdev, all users need irqc_priv.pdev->dev.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-irqc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index 3cc428ba495c3793..af03ee31a87bb11d 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -47,7 +47,7 @@ struct irqc_priv {
 	void __iomem *cpu_int_base;
 	struct irqc_irq irq[IRQC_IRQ_MAX];
 	unsigned int number_of_irqs;
-	struct platform_device *pdev;
+	struct device *dev;
 	struct irq_chip_generic *gc;
 	struct irq_domain *irq_domain;
 	atomic_t wakeup_path;
@@ -60,8 +60,7 @@ static struct irqc_priv *irq_data_to_priv(struct irq_data *data)
 
 static void irqc_dbg(struct irqc_irq *i, char *str)
 {
-	dev_dbg(&i->p->pdev->dev, "%s (%d:%d)\n",
-		str, i->requested_irq, i->hw_irq);
+	dev_dbg(i->p->dev, "%s (%d:%d)\n", str, i->requested_irq, i->hw_irq);
 }
 
 static unsigned char irqc_sense[IRQ_TYPE_SENSE_MASK + 1] = {
@@ -138,7 +137,7 @@ static int irqc_probe(struct platform_device *pdev)
 		goto err0;
 	}
 
-	p->pdev = pdev;
+	p->dev = dev;
 	platform_set_drvdata(pdev, p);
 
 	pm_runtime_enable(dev);
-- 
2.17.1

