Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AB829D2D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Oct 2020 22:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgJ1VhD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Oct 2020 17:37:03 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:47630 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgJ1Vg7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:36:59 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4CLt714S6QzN68Ls
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2020 16:39:57 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id lTfw2304W4C55Sk06Tfxz5; Wed, 28 Oct 2020 16:39:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnYK-000pTp-M8; Wed, 28 Oct 2020 16:39:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnYK-007Hp8-6a; Wed, 28 Oct 2020 16:39:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] irqchip/renesas-intc-irqpin: Merge irlm_bit and needs_irlm
Date:   Wed, 28 Oct 2020 16:39:55 +0100
Message-Id: <20201028153955.1736767-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Get rid of the separate flag to indicate if the IRLM bit is present in
the INTC/Interrupt Control Register 0, by considering -1 an invalid
irlm_bit value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on r8a7778/bock-w, r8a7779/marzen, r8a7740/armadillo. and
sh73a0/kzm9g.

 drivers/irqchip/irq-renesas-intc-irqpin.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-renesas-intc-irqpin.c
index 3819185bfd02c63f..cb7f60b3b4a920c2 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -71,8 +71,7 @@ struct intc_irqpin_priv {
 };
 
 struct intc_irqpin_config {
-	unsigned int irlm_bit;
-	unsigned needs_irlm:1;
+	int irlm_bit;		/* -1 if non-existent */
 };
 
 static unsigned long intc_irqpin_read32(void __iomem *iomem)
@@ -349,11 +348,10 @@ static const struct irq_domain_ops intc_irqpin_irq_domain_ops = {
 
 static const struct intc_irqpin_config intc_irqpin_irlm_r8a777x = {
 	.irlm_bit = 23, /* ICR0.IRLM0 */
-	.needs_irlm = 1,
 };
 
 static const struct intc_irqpin_config intc_irqpin_rmobile = {
-	.needs_irlm = 0,
+	.irlm_bit = -1,
 };
 
 static const struct of_device_id intc_irqpin_dt_ids[] = {
@@ -470,7 +468,7 @@ static int intc_irqpin_probe(struct platform_device *pdev)
 	}
 
 	/* configure "individual IRQ mode" where needed */
-	if (config && config->needs_irlm) {
+	if (config && config->irlm_bit >= 0) {
 		if (io[INTC_IRQPIN_REG_IRLM])
 			intc_irqpin_read_modify_write(p, INTC_IRQPIN_REG_IRLM,
 						      config->irlm_bit, 1, 1);
-- 
2.25.1

