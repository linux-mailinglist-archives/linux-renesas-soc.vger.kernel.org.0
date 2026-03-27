Return-Path: <linux-renesas-soc+bounces-30504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RNdkMePkxmnrPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:13:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 405E534AADD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF98C30CA3B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2872E393DF9;
	Fri, 27 Mar 2026 20:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2kJla1Qu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B00D39183F;
	Fri, 27 Mar 2026 20:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642268; cv=none; b=jieJsPoGfmyeG6sN10bhPjgROhEjX9RLVzx6Z1jo12KqyIhiBQYrcQ3/a8UkQYcTWzzgrgCUqJUSSLphBWrBDujRCWtvDTpfXTtwsFP6GB+tOr8D8dd4Eu14nm+W2JnlzgOCQPOjMpOvxLcu4pLu4rrLBW+KcAQYfwC4KeJZQdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642268; c=relaxed/simple;
	bh=Texga47YbF0bZROj1zWl0qeWjvFGYpvoTnvEHB7VFHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rFVa89fh0/8lOVEOYVNI57rUI+KVJXOnwMHyZ4FgmC0aKBdySEM59fWFZJn6dIxjyHV/oasukqgymIJC3AvOxTFMVFLf+EOjNaIzQKvIZAh3UqCZVwRJYwem6vC9VCDP597L16uocpU88lkooSWY3K1XiamYAyTJPrPJIzWtDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2kJla1Qu; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 344791A3032;
	Fri, 27 Mar 2026 20:11:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0239860268;
	Fri, 27 Mar 2026 20:11:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEC3A10451AF7;
	Fri, 27 Mar 2026 21:11:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XECnex5AFDMpEwhqr4QZ6gZV3+vm9bgxJLNcNDz5vuw=;
	b=2kJla1Qu5t5vjjuuuvIX0AAD2r79XGuc3E+lVgebFaDqaIGXTo4lMe3Dtbk1Qvr7fZEK7q
	CVwg4CYmPkcNwTgnEpzuBAwY0irxIXFjgT7Eqp526scDhn746byL8+xmEZyexoIdBf030y
	HFGyoHxSSd9HQda3KskIc38k3XyFoivhZs2IaoDH8jC+/QhhY9o7hRF7uanFXTG3SZB6pv
	KQKTn0MlBgrRawir0Hi3m6IttNrXbRbouF3hQS7OdMo8U7iHo8rOxfaPMv7QkYCBtevn26
	BpAGuo6tpnGL1nf0vhyiQoOzp+Zb+m3TOg9TiZhpLGNYQh6gFkADuILY3rJNbQ==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:34 +0100
Subject: [PATCH 12/16] irqchip/eip201-aic: Add support for Safexcel EIP-201
 AIC
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-12-5e6ff7853994@bootlin.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Jayesh Choudhary <j-choudhary@ti.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Antoine Tenart <atenart@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30504-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,se.com:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 405E534AADD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe the EIP-201 Advanced Interrupt Controller from Inside Secure,
typically found in a bigger block named EIP-150. This controller is
rather simple and is driven using the generic irqchip model. Its
own interrupt domain is limited to just a few interrupts connected to
other inner blocks, such as a Random Number Generator and a Public Key
Accelerator.

The one I used receives only rising edge interrupts and uses its own
logic to track them. It is theoretically possible to wire devices with
level interrupts, but not in the context of the EIP-150.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/irqchip/Kconfig          |   8 ++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-eip201-aic.c | 221 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 230 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index f07b00d7fef9..b098bb00a224 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -826,4 +826,12 @@ config SUNPLUS_SP7021_INTC
 	  chained controller, routing all interrupt source in P-Chip to
 	  the primary controller on C-Chip.
 
+config SAFEXCEL_EIP201_AIC
+        tristate "Safexcel EIP201 AIC"
+	select IRQ_DOMAIN
+	help
+	  Support for the Advanced Interrupt Controller (AIC) typically
+	  inside Safexcel EIP150 IPs, gathering Public Key Accelerator
+	  and True Random Number Generator interrupts.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 26aa3b6ec99f..80784a02f4a8 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -136,3 +136,4 @@ obj-$(CONFIG_APPLE_AIC)			+= irq-apple-aic.o
 obj-$(CONFIG_MCHP_EIC)			+= irq-mchp-eic.o
 obj-$(CONFIG_SOPHGO_SG2042_MSI)		+= irq-sg2042-msi.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+= irq-sp7021-intc.o
+obj-$(CONFIG_SAFEXCEL_EIP201_AIC)	+= irq-eip201-aic.o
diff --git a/drivers/irqchip/irq-eip201-aic.c b/drivers/irqchip/irq-eip201-aic.c
new file mode 100644
index 000000000000..514fd39e2777
--- /dev/null
+++ b/drivers/irqchip/irq-eip201-aic.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Schneider Electric
+ * Authored by Miquel Raynal <miquel.raynal@bootlin.com>
+ * Based on the work from Mathieu Hadjimegrian <mathieu.hadjimegrian@non.se.com>
+ */
+
+#include "linux/irq.h"
+#include "linux/stddef.h"
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irqdomain.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/interrupt-controller/inside-secure,safexcel-eip201.h>
+
+#define EIP201_AIC_POL_CTRL 0x0 /* RO */
+#define   EIP201_AIC_POL_LOW_FALLING 0
+#define   EIP201_AIC_POL_HIGH_RISING 1
+
+#define EIP201_AIC_TYP_CTRL 0x4 /* RO */
+#define   EIP201_AIC_TYP_LEVEL 0
+#define   EIP201_AIC_TYP_EDGE 1
+
+#define EIP201_AIC_ENABLE_SET 0xC /* WO */
+#define EIP201_AIC_ENABLED_STAT 0x10 /* RO */
+#define EIP201_AIC_ENABLE_CLR 0x14 /* WO */
+#define EIP201_AIC_ACK 0x10 /* WO */
+
+#define EIP201_AIC_REVISION 0x3FFC
+#define   EIP201_AIC_REV_NUM(reg) FIELD_GET(GENMASK(7, 0), reg)
+#define   EIP201_AIC_REV_COMP_NUM(reg) FIELD_GET(GENMASK(15, 8), reg)
+
+#define EIP201_AIC_INT(reg, int) field_get(BIT(int), reg)
+#define EIP201_AIC_NINT 7
+#define EIP201_AIC_INT_MASK (BIT(EIP201_AIC_NINT) - 1)
+
+struct eip201_aic {
+	struct device *dev;
+	void __iomem *regs;
+	struct irq_domain *domain;
+	struct irq_chip_generic *gc;
+	u32 type;
+	u32 pol;
+};
+
+static struct eip201_aic *irq_domain_to_aic(struct irq_domain *d)
+{
+	return d->host_data;
+}
+
+static int eip201_aic_irq_domain_xlate(struct irq_domain *d, struct device_node *ctrlr,
+				       const u32 *intspec, unsigned int intsize,
+				       irq_hw_number_t *out_hwirq, unsigned int *out_type)
+{
+	struct eip201_aic *aic = irq_domain_to_aic(d);
+	int ret;
+
+	ret = irq_domain_xlate_twocell(d, ctrlr, intspec, intsize, out_hwirq, out_type);
+	if (ret)
+		return ret;
+
+	/* One interrupt is reserved, two are for Inside Secure debugging purposes only */
+	switch (*out_hwirq) {
+	case AIC_PKA_INT0:
+	case AIC_PKA_INT1:
+	case AIC_RESERVED:
+		return -EINVAL;
+	default:
+		break;
+	}
+
+	/*
+	 * Flow type is implementation specific and hardcoded, make sure it is corect,
+	 * even though the documentation says EIP blocks generate edge interrupts.
+	 */
+
+	/* Type register indicates:
+	 * - '1' for edge interrupts
+	 * - '0' for level interrupts
+	 */
+	if (*out_type & IRQ_TYPE_LEVEL_MASK &&
+	    EIP201_AIC_INT(aic->type, *out_hwirq))
+		return -EINVAL;
+
+	/*
+	 * Polarity register indicates:
+	 * - '1' for level high or rising edge
+	 * - '0' for level low or falling edge
+	 */
+	if (*out_type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING) &&
+	    EIP201_AIC_INT(aic->pol, *out_hwirq))
+		return -EINVAL;
+
+	return 0;
+}
+
+const struct irq_domain_ops eip201_aic_chip_ops = {
+	.map	= irq_map_generic_chip,
+	.unmap  = irq_unmap_generic_chip,
+	.xlate	= eip201_aic_irq_domain_xlate,
+};
+
+static irqreturn_t eip201_aic_irq_handler(int irq, void *dev_id)
+{
+	struct eip201_aic *aic = dev_id;
+	unsigned long pending;
+	irq_hw_number_t hwirq;
+
+	pending = readl(aic->regs + EIP201_AIC_ENABLED_STAT);
+	if (!pending)
+		return IRQ_NONE;
+
+	/* Ack interrupts ASAP to decrease the likelyhood of missing an edge one */
+	writel(pending, aic->regs + EIP201_AIC_ACK);
+
+	for_each_set_bit(hwirq, &pending, EIP201_AIC_NINT)
+		generic_handle_domain_irq(aic->domain, hwirq);
+
+	return IRQ_HANDLED;
+}
+
+static int eip201_aic_probe(struct platform_device *pdev)
+{
+	struct eip201_aic *aic;
+	struct clk *clk;
+	u32 rev;
+	int irq;
+	int ret;
+
+	aic = devm_kzalloc(&pdev->dev, sizeof(*aic), GFP_KERNEL);
+	if (!aic)
+		return -ENOMEM;
+
+	aic->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (!aic->regs)
+		return -EINVAL;
+
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	rev = readl(aic->regs + EIP201_AIC_REVISION);
+	if (!(EIP201_AIC_REV_NUM(rev) ^ EIP201_AIC_REV_COMP_NUM(rev)))
+		return -ENXIO;
+
+	platform_set_drvdata(pdev, aic);
+	aic->dev = &pdev->dev;
+
+	/* Cache the RO type and polarity of all interrupts */
+	aic->type = readl(aic->regs + EIP201_AIC_TYP_CTRL);
+	aic->pol = readl(aic->regs + EIP201_AIC_POL_CTRL);
+
+	/* Disable/clear all interrupts */
+	writel(EIP201_AIC_INT_MASK, aic->regs + EIP201_AIC_ENABLE_CLR);
+	writel(EIP201_AIC_INT_MASK, aic->regs + EIP201_AIC_ACK);
+
+	aic->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), EIP201_AIC_NINT,
+					       &eip201_aic_chip_ops, aic);
+	if (!aic->domain)
+		return -ENXIO;
+
+	ret = irq_alloc_domain_generic_chips(aic->domain, EIP201_AIC_NINT, 1, "eip201-aic",
+					     handle_edge_irq, 0, 0, 0);
+	if (ret)
+		goto remove_domain;
+
+	aic->gc = irq_get_domain_generic_chip(aic->domain, 0);
+	aic->gc->reg_base = aic->regs;
+	aic->gc->chip_types[0].regs.ack = EIP201_AIC_ACK;
+	aic->gc->chip_types[0].regs.enable = EIP201_AIC_ENABLE_SET;
+	aic->gc->chip_types[0].regs.disable = EIP201_AIC_ENABLE_CLR;
+	aic->gc->chip_types[0].chip.irq_ack = irq_gc_ack_set_bit;
+	aic->gc->chip_types[0].chip.irq_mask = irq_gc_mask_disable_reg;
+	aic->gc->chip_types[0].chip.irq_unmask = irq_gc_unmask_enable_reg;
+	aic->gc->chip_types[0].chip.flags = IRQCHIP_MASK_ON_SUSPEND;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(&pdev->dev, irq, eip201_aic_irq_handler, 0,
+			       dev_name(&pdev->dev), aic);
+	if (ret < 0)
+		goto remove_gc;
+
+	return 0;
+
+remove_gc:
+	irq_remove_generic_chip(aic->gc, EIP201_AIC_INT_MASK, 0, 0);
+remove_domain:
+	irq_domain_remove(aic->domain);
+
+	return ret;
+}
+
+static void eip201_aic_remove(struct platform_device *pdev)
+{
+	struct eip201_aic *aic = platform_get_drvdata(pdev);
+
+	irq_remove_generic_chip(aic->gc, EIP201_AIC_INT_MASK, 0, 0);
+	irq_domain_remove(aic->domain);
+}
+
+static const struct of_device_id eip201_aic_of_match[] = {
+	{ .compatible = "inside-secure,safexcel-eip201", },
+	{},
+};
+
+static struct platform_driver eip201_aic_driver = {
+	.probe = eip201_aic_probe,
+	.remove = eip201_aic_remove,
+	.driver = {
+		.name = "safexcel-eip201-aic",
+		.of_match_table = eip201_aic_of_match,
+	},
+};
+module_platform_driver(eip201_aic_driver);

-- 
2.51.1


