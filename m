Return-Path: <linux-renesas-soc+bounces-12925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FDDA2B4B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 23:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D97EE163F8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 22:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E3923908E;
	Thu,  6 Feb 2025 22:03:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564BD23AE74;
	Thu,  6 Feb 2025 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738879417; cv=none; b=oHig99ZFZVqQM/Vg+9w/roV62eRxjbv/gDyRed1W5hGC5lnzBUihdtUq3FJJtBYLEi9NEc8gbobYCv18B1W/QjQAiFlONluyF4o7pzyZ8VRVOL1sJJcb/y6yxqYmsYAkYYwLZ514yDdOwF3N+bdaWUzH+C3Lt7mhBXC7BIsdfJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738879417; c=relaxed/simple;
	bh=a5V2P83UdWQGsFHOrXM1fYOOBUBQht1jtYPrERkq910=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SyIlPT6gyoGmoRfhTChvxqpXccWLadf5nVeGqMlZd4W/KL4qGyy0ewuENY3mTUkgI2hTxPSdi3moR2d0X0j10ukcfkMVHjQX+YMAzWewawASrGYlZRXmmDc1hha0xjB77dxWCijPr7d+4Z/5CY0bvF48cC6LZzQWu90bW9g6Z4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: e1bwZSMmQOaUZBgzLM3Rfg==
X-CSE-MsgGUID: 9uuRVnmeTkObsqF/nvMNLQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Feb 2025 07:03:34 +0900
Received: from mulinux.example.org (unknown [10.226.93.55])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E3F7440AF4A4;
	Fri,  7 Feb 2025 07:03:31 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/7] irqchip/renesas-rzv2h: Add rzv2h_icu_register_dma_req_ack
Date: Thu,  6 Feb 2025 22:03:05 +0000
Message-Id: <20250206220308.76669-5-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206220308.76669-1-fabrizio.castro.jz@renesas.com>
References: <20250206220308.76669-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Renesas RZ/V2H(P) family of SoCs, DMAC IPs are connected
to the Interrupt Control Unit (ICU).
For DMA transfers, a request number and an ack number must be
registered with the ICU, which means that the DMAC driver has
to be able to instruct the ICU driver with the registration of
such ids.

Export rzv2h_icu_register_dma_req_ack so that the DMA driver
can register both ids in one go.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c       | 61 +++++++++++++++++++++++
 include/linux/irqchip/irq-renesas-rzv2h.h | 19 +++++++
 2 files changed, 80 insertions(+)
 create mode 100644 include/linux/irqchip/irq-renesas-rzv2h.h

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index fe2d29e91026..0fdbf9ce89a9 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/irq-renesas-rzv2h.h>
 #include <linux/irqdomain.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -41,6 +42,8 @@
 #define ICU_TSCLR				0x24
 #define ICU_TITSR(k)				(0x28 + (k) * 4)
 #define ICU_TSSR(k)				(0x30 + (k) * 4)
+#define ICU_DMkSELy(k, y)			(0x420 + (k) * 0x20 + (y) * 4)
+#define ICU_DMACKSELk(k)			(0x500 + (k) * 4)
 
 /* NMI */
 #define ICU_NMI_EDGE_FALLING			0
@@ -80,6 +83,19 @@
 #define ICU_TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
 #define ICU_PB5_TINT				0x55
 
+/* DMAC */
+#define ICU_DMAC_DkSEL_CLRON_MASK		BIT(15)
+#define ICU_DMAC_DkRQ_SEL_MASK			GENMASK(9, 0)
+#define ICU_DMAC_DMAREQ_MASK			(ICU_DMAC_DkRQ_SEL_MASK | \
+						 ICU_DMAC_DkSEL_CLRON_MASK)
+
+#define ICU_DMAC_PREP_DkSEL_CLRON(x)		FIELD_PREP(ICU_DMAC_DkSEL_CLRON_MASK, (x))
+#define ICU_DMAC_PREP_DkRQ_SEL(x)		FIELD_PREP(ICU_DMAC_DkRQ_SEL_MASK, (x))
+#define ICU_DMAC_PREP_DMAREQ(sel, clr)		(ICU_DMAC_PREP_DkRQ_SEL(sel) | \
+						ICU_DMAC_PREP_DkSEL_CLRON(clr))
+
+#define ICU_DMAC_DACK_SEL_MASK			GENMASK(6, 0)
+
 /**
  * struct rzv2h_icu_priv - Interrupt Control Unit controller private data structure.
  * @base:	Controller's base address
@@ -94,6 +110,50 @@ struct rzv2h_icu_priv {
 	raw_spinlock_t			lock;
 };
 
+void rzv2h_icu_register_dma_req_ack(struct platform_device *icu_dev, u8 dmac_index, u8 dmac_channel,
+				    u16 req_no, u8 ack_no)
+{
+	struct rzv2h_icu_priv *priv = platform_get_drvdata(icu_dev);
+	u32 icu_dmackselk, dmaack, dmaack_mask;
+	u32 icu_dmksely, dmareq, dmareq_mask;
+	u8 k, field_no;
+	u8 y, upper;
+
+	if (req_no >= 0x1b5)
+		req_no = RZV2H_ICU_DMAC_REQ_NO_DEFAULT;
+
+	if (ack_no >= 0x50)
+		ack_no = RZV2H_ICU_DMAC_ACK_NO_DEFAULT;
+
+	y = dmac_channel / 2;
+	upper = dmac_channel % 2;
+
+	dmareq = ICU_DMAC_PREP_DMAREQ(req_no, 0);
+	dmareq_mask = ICU_DMAC_DMAREQ_MASK;
+
+	if (upper) {
+		dmareq <<= 16;
+		dmareq_mask <<= 16;
+	}
+
+	k  = ack_no / 4;
+	field_no = ack_no % 4;
+
+	dmaack_mask = ICU_DMAC_DACK_SEL_MASK << (field_no * 8);
+	dmaack = ack_no << (field_no * 8);
+
+	guard(raw_spinlock_irqsave)(&priv->lock);
+
+	icu_dmksely = readl(priv->base + ICU_DMkSELy(dmac_index, y));
+	icu_dmksely = (icu_dmksely & ~dmareq_mask) | dmareq;
+	writel(icu_dmksely, priv->base + ICU_DMkSELy(dmac_index, y));
+
+	icu_dmackselk = readl(priv->base + ICU_DMACKSELk(k));
+	icu_dmackselk = (icu_dmackselk & ~dmaack_mask) | dmaack;
+	writel(icu_dmackselk, priv->base + ICU_DMACKSELk(k));
+}
+EXPORT_SYMBOL_GPL(rzv2h_icu_register_dma_req_ack);
+
 static inline struct rzv2h_icu_priv *irq_data_to_priv(struct irq_data *data)
 {
 	return data->domain->host_data;
@@ -446,6 +506,7 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 		goto put_dev;
 	}
 
+	platform_set_drvdata(pdev, rzv2h_icu_data);
 	rzv2h_icu_data->irqchip = &rzv2h_icu_chip;
 
 	rzv2h_icu_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
diff --git a/include/linux/irqchip/irq-renesas-rzv2h.h b/include/linux/irqchip/irq-renesas-rzv2h.h
new file mode 100644
index 000000000000..686d050a239a
--- /dev/null
+++ b/include/linux/irqchip/irq-renesas-rzv2h.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Renesas RZ/V2H(P) Interrupt Control Unit (ICU)
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation.
+ */
+
+#ifndef __LINUX_IRQ_RENESAS_RZV2H
+#define __LINUX_IRQ_RENESAS_RZV2H
+
+#include <linux/platform_device.h>
+
+#define RZV2H_ICU_DMAC_REQ_NO_DEFAULT		0x3ff
+#define RZV2H_ICU_DMAC_ACK_NO_DEFAULT		0x7f
+
+void rzv2h_icu_register_dma_req_ack(struct platform_device *icu_dev, u8 dmac_index, u8 dmac_channel,
+				    u16 req_no, u8 ack_no);
+
+#endif
-- 
2.34.1


