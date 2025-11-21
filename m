Return-Path: <linux-renesas-soc+bounces-24916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACF4C78BFD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DCF194EFC9B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B28E34A773;
	Fri, 21 Nov 2025 11:15:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC5F347BA8;
	Fri, 21 Nov 2025 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723722; cv=none; b=WROuvgzeRrSmGhKtsUe5Z+elSxdXManBFC5T2iv6ucPFcDXKUoskHwARP9NQnjqgxVjcXq89eE0nkMVnmkRAPt6LhDrS43oijXONVM46hi8C5W8KpLYjSKGXr2M8Wim1n5pHq3XTIr93wVnKcDGbSeQQUhCHTONPJ2Wls8/QznA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723722; c=relaxed/simple;
	bh=hQ71peqZGgkKc6iuO4Gka2FYEu+trALTHmm5oO8WF9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRCkHw1jYfqCATGlMfoJQ4EVPMTikiDE7HO1MlLOJq5OhQ4BEux2A/njg9fXoKTrMC5ped8vAFJXeg/D/DAeLu9TUH2zAinalbgkruLAjB/ZGp40TRskJIuzAop81EOrXScen7h5dl9qwmussnv633IKxgo5Doksf/f1yNC1eTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: hFLTq4dFRbysvxj36reP4w==
X-CSE-MsgGUID: mBeEmkB8SWqO4PVo3l399A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Nov 2025 20:15:18 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.224])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8EEE5430ED4F;
	Fri, 21 Nov 2025 20:15:14 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller (ICU) driver
Date: Fri, 21 Nov 2025 13:14:21 +0200
Message-ID: <20251121111423.1379395-3-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
an Interrupt Controller (ICU) that supports interrupts from external
pins IRQ0 to IRQ15, and SEI, and software-triggered interrupts INTCPU0
to INTCPU15.

INTCPU0 to INTCPU13, IRQ0 to IRQ13 are non-safety interrupts, while
INTCPU14, INTCPU15, IRQ14, IRQ15 and SEI are safety interrupts, and are
exposed via a separate register space.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/irqchip/Kconfig                   |   8 +
 drivers/irqchip/Makefile                  |   1 +
 drivers/irqchip/irq-renesas-rzt2h.c       | 288 ++++++++++++++++++++++
 drivers/soc/renesas/Kconfig               |   1 +
 include/linux/irqchip/irq-renesas-rzt2h.h |  23 ++
 5 files changed, 321 insertions(+)
 create mode 100644 drivers/irqchip/irq-renesas-rzt2h.c
 create mode 100644 include/linux/irqchip/irq-renesas-rzt2h.h

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index f334f49c9791..118d0c16e633 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -297,6 +297,14 @@ config RENESAS_RZG2L_IRQC
 	  Enable support for the Renesas RZ/G2L (and alike SoC) Interrupt Controller
 	  for external devices.
 
+config RENESAS_RZT2H_ICU
+	bool "Renesas RZ/{T2H,N2H} ICU support" if COMPILE_TEST
+	select GENERIC_IRQ_CHIP
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	  Enable support for the Renesas RZ/{T2H,N2H} Interrupt Controller
+	  (ICU).
+
 config RENESAS_RZV2H_ICU
 	bool "Renesas RZ/V2H(P) ICU support" if COMPILE_TEST
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 6a229443efe0..26aa3b6ec99f 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_RENESAS_INTC_IRQPIN)	+= irq-renesas-intc-irqpin.o
 obj-$(CONFIG_RENESAS_IRQC)		+= irq-renesas-irqc.o
 obj-$(CONFIG_RENESAS_RZA1_IRQC)		+= irq-renesas-rza1.o
 obj-$(CONFIG_RENESAS_RZG2L_IRQC)	+= irq-renesas-rzg2l.o
+obj-$(CONFIG_RENESAS_RZT2H_ICU)		+= irq-renesas-rzt2h.o
 obj-$(CONFIG_RENESAS_RZV2H_ICU)		+= irq-renesas-rzv2h.o
 obj-$(CONFIG_VERSATILE_FPGA_IRQ)	+= irq-versatile-fpga.o
 obj-$(CONFIG_ARCH_NSPIRE)		+= irq-zevio.o
diff --git a/drivers/irqchip/irq-renesas-rzt2h.c b/drivers/irqchip/irq-renesas-rzt2h.c
new file mode 100644
index 000000000000..68c163b7ba77
--- /dev/null
+++ b/drivers/irqchip/irq-renesas-rzt2h.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitfield.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/irq-renesas-rzt2h.h>
+#include <linux/irqdomain.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#define RZT2H_ICU_INTCPU_NS_START		0
+#define RZT2H_ICU_INTCPU_NS_COUNT		14
+
+#define RZT2H_ICU_INTCPU_S_START		(RZT2H_ICU_INTCPU_NS_START + \
+						 RZT2H_ICU_INTCPU_NS_COUNT)
+#define RZT2H_ICU_INTCPU_S_COUNT		2
+
+#define RZT2H_ICU_IRQ_NS_START			(RZT2H_ICU_INTCPU_S_START + \
+						 RZT2H_ICU_INTCPU_S_COUNT)
+#define RZT2H_ICU_IRQ_NS_COUNT			14
+
+#define RZT2H_ICU_IRQ_S_START			(RZT2H_ICU_IRQ_NS_START + \
+						 RZT2H_ICU_IRQ_NS_COUNT)
+#define RZT2H_ICU_IRQ_S_COUNT			2
+
+#define RZT2H_ICU_SEI_START			(RZT2H_ICU_IRQ_S_START + \
+						 RZT2H_ICU_IRQ_S_COUNT)
+#define RZT2H_ICU_SEI_COUNT			1
+
+#define RZT2H_ICU_NUM_IRQ			(RZT2H_ICU_INTCPU_NS_COUNT + \
+						 RZT2H_ICU_INTCPU_S_COUNT + \
+						 RZT2H_ICU_IRQ_NS_COUNT + \
+						 RZT2H_ICU_IRQ_S_COUNT + \
+						 RZT2H_ICU_SEI_COUNT)
+
+#define RZT2H_ICU_IRQ_IN_RANGE(n, type) \
+	((n) >= RZT2H_ICU_##type##_START && \
+	 (n) <  RZT2H_ICU_##type##_START + RZT2H_ICU_##type##_COUNT)
+
+#define RZT2H_ICU_PORTNF_MD			0xc
+#define RZT2H_ICU_PORTNF_MDi_MASK(i)		(GENMASK(1, 0) << ((i) * 2))
+#define RZT2H_ICU_PORTNF_MDi_PREP(i, val)	(FIELD_PREP(GENMASK(1, 0), val) << ((i) * 2))
+
+#define RZT2H_ICU_MD_LOW_LEVEL			0b00
+#define RZT2H_ICU_MD_FALLING_EDGE		0b01
+#define RZT2H_ICU_MD_RISING_EDGE		0b10
+#define RZT2H_ICU_MD_BOTH_EDGES			0b11
+
+#define RZT2H_ICU_DMACn_RSSELi(n, i)		(0x7d0 + 0x18 * (n) + 0x4 * (i))
+#define RZT2H_ICU_DMAC_REQ_SELx_MASK(x)		(GENMASK(9, 0) << ((x) * 10))
+#define RZT2H_ICU_DMAC_REQ_SELx_PREP(x, val)	(FIELD_PREP(GENMASK(9, 0), val) << ((x) * 10))
+
+struct rzt2h_icu_priv {
+	void __iomem			*base_ns;
+	void __iomem			*base_s;
+	struct irq_fwspec		fwspec[RZT2H_ICU_NUM_IRQ];
+	raw_spinlock_t			lock;
+};
+
+void rzt2h_icu_register_dma_req(struct platform_device *icu_dev, u8 dmac_index,
+				u8 dmac_channel, u16 req_no)
+{
+	struct rzt2h_icu_priv *priv = platform_get_drvdata(icu_dev);
+	u8 y, upper;
+	u32 val;
+
+	y = dmac_channel / 3;
+	upper = dmac_channel % 3;
+
+	guard(raw_spinlock_irqsave)(&priv->lock);
+
+	val = readl(priv->base_ns + RZT2H_ICU_DMACn_RSSELi(dmac_index, y));
+	val &= ~RZT2H_ICU_DMAC_REQ_SELx_MASK(upper);
+	val |= RZT2H_ICU_DMAC_REQ_SELx_PREP(upper, req_no);
+	writel(val, priv->base_ns + RZT2H_ICU_DMACn_RSSELi(dmac_index, y));
+}
+EXPORT_SYMBOL_GPL(rzt2h_icu_register_dma_req);
+
+static inline struct rzt2h_icu_priv *irq_data_to_priv(struct irq_data *data)
+{
+	return data->domain->host_data;
+}
+
+static inline int rzt2h_icu_irq_to_offset(struct irq_data *d, void __iomem **base,
+					  unsigned int *offset)
+{
+	struct rzt2h_icu_priv *priv = irq_data_to_priv(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_NS)) {
+		*offset = hwirq - RZT2H_ICU_IRQ_NS_START;
+		*base = priv->base_ns;
+	} else if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_S) ||
+		   /* SEI follows safety IRQs in registers and in IRQ numbers. */
+		   RZT2H_ICU_IRQ_IN_RANGE(hwirq, SEI)) {
+		*offset = hwirq - RZT2H_ICU_IRQ_S_START;
+		*base = priv->base_s;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rzt2h_icu_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct rzt2h_icu_priv *priv = irq_data_to_priv(d);
+	unsigned int parent_type;
+	unsigned int offset;
+	void __iomem *base;
+	u32 val, md;
+	int ret;
+
+	ret = rzt2h_icu_irq_to_offset(d, &base, &offset);
+	if (ret)
+		return ret;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_LEVEL_LOW:
+		md = RZT2H_ICU_MD_LOW_LEVEL;
+		parent_type = IRQ_TYPE_LEVEL_HIGH;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		md = RZT2H_ICU_MD_FALLING_EDGE;
+		parent_type = IRQ_TYPE_EDGE_RISING;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		md = RZT2H_ICU_MD_RISING_EDGE;
+		parent_type = IRQ_TYPE_EDGE_RISING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		md = RZT2H_ICU_MD_BOTH_EDGES;
+		parent_type = IRQ_TYPE_EDGE_RISING;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	guard(raw_spinlock)(&priv->lock);
+	val = readl_relaxed(base + RZT2H_ICU_PORTNF_MD);
+	val &= ~RZT2H_ICU_PORTNF_MDi_MASK(offset);
+	val |= RZT2H_ICU_PORTNF_MDi_PREP(offset, md);
+	writel_relaxed(val, base + RZT2H_ICU_PORTNF_MD);
+
+	return irq_chip_set_type_parent(d, parent_type);
+}
+
+static int rzt2h_icu_set_type(struct irq_data *d, unsigned int type)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+
+	/* IRQn and SEI are selectable, others are edge-only. */
+	if (RZT2H_ICU_IRQ_IN_RANGE(hw_irq, IRQ_NS) ||
+	    RZT2H_ICU_IRQ_IN_RANGE(hw_irq, IRQ_S) ||
+	    RZT2H_ICU_IRQ_IN_RANGE(hw_irq, SEI))
+		return rzt2h_icu_irq_set_type(d, type);
+
+	if ((type & IRQ_TYPE_SENSE_MASK) != IRQ_TYPE_EDGE_RISING)
+		return -EINVAL;
+
+	return irq_chip_set_type_parent(d, IRQ_TYPE_EDGE_RISING);
+}
+
+static const struct irq_chip rzt2h_icu_chip = {
+	.name = "rzt2h-icu",
+	.irq_mask = irq_chip_mask_parent,
+	.irq_unmask = irq_chip_unmask_parent,
+	.irq_eoi = irq_chip_eoi_parent,
+	.irq_set_type = rzt2h_icu_set_type,
+	.irq_set_wake = irq_chip_set_wake_parent,
+	.irq_set_affinity = irq_chip_set_affinity_parent,
+	.irq_retrigger = irq_chip_retrigger_hierarchy,
+	.irq_get_irqchip_state = irq_chip_get_parent_state,
+	.irq_set_irqchip_state = irq_chip_set_parent_state,
+	.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SET_TYPE_MASKED |
+		 IRQCHIP_SKIP_SET_WAKE,
+};
+
+static int rzt2h_icu_alloc(struct irq_domain *domain, unsigned int virq,
+			   unsigned int nr_irqs, void *arg)
+{
+	struct rzt2h_icu_priv *priv = domain->host_data;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	int ret;
+
+	ret = irq_domain_translate_twocell(domain, arg, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, &rzt2h_icu_chip,
+					    NULL);
+	if (ret)
+		return ret;
+
+	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
+					    &priv->fwspec[hwirq]);
+}
+
+static const struct irq_domain_ops rzt2h_icu_domain_ops = {
+	.alloc		= rzt2h_icu_alloc,
+	.free		= irq_domain_free_irqs_common,
+	.translate	= irq_domain_translate_twocell,
+};
+
+static int rzt2h_icu_parse_interrupts(struct rzt2h_icu_priv *priv,
+				      struct device_node *np)
+{
+	struct of_phandle_args map;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < RZT2H_ICU_NUM_IRQ; i++) {
+		ret = of_irq_parse_one(np, i, &map);
+		if (ret)
+			return ret;
+
+		of_phandle_args_to_fwspec(np, map.args, map.args_count,
+					  &priv->fwspec[i]);
+	}
+
+	return 0;
+}
+
+static int rzt2h_icu_init(struct platform_device *pdev,
+			  struct device_node *parent)
+{
+	struct irq_domain *irq_domain, *parent_domain;
+	struct device_node *node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct rzt2h_icu_priv *priv;
+	int ret;
+
+	parent_domain = irq_find_host(parent);
+	if (!parent_domain)
+		return dev_err_probe(dev, -ENODEV, "cannot find parent domain\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->base_ns = devm_of_iomap(dev, dev->of_node, 0, NULL);
+	if (IS_ERR(priv->base_ns))
+		return PTR_ERR(priv->base_ns);
+
+	priv->base_s = devm_of_iomap(dev, dev->of_node, 1, NULL);
+	if (IS_ERR(priv->base_s))
+		return PTR_ERR(priv->base_s);
+
+	ret = rzt2h_icu_parse_interrupts(priv, node);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "cannot parse interrupts: %d\n", ret);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "devm_pm_runtime_enable failed: %d\n", ret);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "pm_runtime_resume_and_get failed: %d\n", ret);
+
+	raw_spin_lock_init(&priv->lock);
+
+	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, RZT2H_ICU_NUM_IRQ,
+						 dev_fwnode(dev),
+						 &rzt2h_icu_domain_ops, priv);
+	if (!irq_domain) {
+		pm_runtime_put(dev);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+IRQCHIP_PLATFORM_DRIVER_BEGIN(rzt2h_icu)
+IRQCHIP_MATCH("renesas,r9a09g077-icu", rzt2h_icu_init)
+IRQCHIP_PLATFORM_DRIVER_END(rzt2h_icu)
+MODULE_AUTHOR("Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/T2H ICU Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 340a1ff7e92b..198baf890b14 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -423,6 +423,7 @@ config ARCH_R9A09G057
 config ARCH_R9A09G077
 	bool "ARM64 Platform support for R9A09G077 (RZ/T2H)"
 	default y if ARCH_RENESAS
+	select RENESAS_RZT2H_ICU
 	help
 	  This enables support for the Renesas RZ/T2H SoC variants.
 
diff --git a/include/linux/irqchip/irq-renesas-rzt2h.h b/include/linux/irqchip/irq-renesas-rzt2h.h
new file mode 100644
index 000000000000..1a5bfd461fe4
--- /dev/null
+++ b/include/linux/irqchip/irq-renesas-rzt2h.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Renesas RZ/T2H Interrupt Control Unit (ICU)
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation.
+ */
+
+#ifndef __LINUX_IRQ_RENESAS_RZT2H
+#define __LINUX_IRQ_RENESAS_RZT2H
+
+#include <linux/platform_device.h>
+
+#define RZT2H_ICU_DMAC_REQ_NO_DEFAULT		0x3ff
+
+#ifdef CONFIG_RENESAS_RZT2H_ICU
+void rzt2h_icu_register_dma_req(struct platform_device *icu_dev, u8 dmac_index,
+				u8 dmac_channel, u16 req_no);
+#else
+static inline void rzt2h_icu_register_dma_req(struct platform_device *icu_dev, u8 dmac_index,
+					      u8 dmac_channel, u16 req_no) { }
+#endif
+
+#endif /* __LINUX_IRQ_RENESAS_RZT2H */
-- 
2.52.0


