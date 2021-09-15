Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6A440C635
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Sep 2021 15:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234662AbhIONVm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Sep 2021 09:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234474AbhIONVl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 09:21:41 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E65DC061766
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Sep 2021 06:20:20 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id uDLH2500p4C55Sk06DLHoT; Wed, 15 Sep 2021 15:20:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQUng-004eT9-2x; Wed, 15 Sep 2021 15:18:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQRVr-002T07-RM; Wed, 15 Sep 2021 11:47:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] irqchip/renesas-rza1: Use semicolons instead of commas
Date:   Wed, 15 Sep 2021 11:47:30 +0200
Message-Id: <b1710bb6ea5faa7a7fe74404adb0beb951e0bf8c.1631699160.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This code works, but it is cleaner to use semicolons at the end of
statements instead of commas.

Extracted from a big anonymous patch by Julia Lawall
<julia.lawall@inria.fr>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-rza1.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rza1.c b/drivers/irqchip/irq-renesas-rza1.c
index b0d46ac42b892340..72c06e883d1c5fd5 100644
--- a/drivers/irqchip/irq-renesas-rza1.c
+++ b/drivers/irqchip/irq-renesas-rza1.c
@@ -223,12 +223,12 @@ static int rza1_irqc_probe(struct platform_device *pdev)
 		goto out_put_node;
 	}
 
-	priv->chip.name = "rza1-irqc",
-	priv->chip.irq_mask = irq_chip_mask_parent,
-	priv->chip.irq_unmask = irq_chip_unmask_parent,
-	priv->chip.irq_eoi = rza1_irqc_eoi,
-	priv->chip.irq_retrigger = irq_chip_retrigger_hierarchy,
-	priv->chip.irq_set_type = rza1_irqc_set_type,
+	priv->chip.name = "rza1-irqc";
+	priv->chip.irq_mask = irq_chip_mask_parent;
+	priv->chip.irq_unmask = irq_chip_unmask_parent;
+	priv->chip.irq_eoi = rza1_irqc_eoi;
+	priv->chip.irq_retrigger = irq_chip_retrigger_hierarchy;
+	priv->chip.irq_set_type = rza1_irqc_set_type;
 	priv->chip.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
 
 	priv->irq_domain = irq_domain_add_hierarchy(parent, 0, IRQC_NUM_IRQ,
-- 
2.25.1

