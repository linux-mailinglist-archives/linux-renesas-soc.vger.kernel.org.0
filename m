Return-Path: <linux-renesas-soc+bounces-13981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB7AA4F268
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 01:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77623188F690
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 00:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8C3824A3;
	Wed,  5 Mar 2025 00:21:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AC15103F;
	Wed,  5 Mar 2025 00:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741134100; cv=none; b=ppmpu/JlrgEwAqH7PlB6zAat8NPKQ/u6Ao8fFXn9hjY2QbQVuvKC3XOpGDgCmXW7XgQmuHG7z9fRniCRyZq5IbzIroCKvByh+ZiVLjlqWd11vC3TF2n0a3toUGav7gSWi/Aj5XjEbPgN8M+OA3iLBFcU6OTudJzVGUk1VVutCKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741134100; c=relaxed/simple;
	bh=jHg9UV/o53Zk9dbuO2mJftCCA6UOJYE7C/BMKxOvDEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y3VFc3iTjEYj8XC29q3xAbYSX0MX5QFFe3RobfymMJlrrcd/FcC6ldOGPiZGj1rp8yn+hPRz9KIGL5sg5L+H5v80lTKIBF+/ZWbPmqke3wh9XUL8fvJwMl+AQezUVgRVxzUXlKJs6K/mKgo+epDgUAPXBZVLlj8OQRvRlptGiJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 2NaJYcmLQyGpart02jAK5Q==
X-CSE-MsgGUID: yteeM9zzTBWuKcC9WEdOtA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Mar 2025 09:21:38 +0900
Received: from mulinux.home (unknown [10.226.92.17])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4B5DD404D874;
	Wed,  5 Mar 2025 09:21:35 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 3/6] irqchip/renesas-rzv2h: Add rzv2h_icu_register_dma_req()
Date: Wed,  5 Mar 2025 00:21:09 +0000
Message-Id: <20250305002112.5289-4-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305002112.5289-1-fabrizio.castro.jz@renesas.com>
References: <20250305002112.5289-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Renesas RZ/V2H(P) family of SoCs, DMAC IPs are connected
to the Interrupt Control Unit (ICU).
For DMA transfers, a request number must be registered with the
ICU, which means that the DMAC driver has to be able to instruct
the ICU driver with the registration of such id.

Export rzv2h_icu_register_dma_req() so that the DMAC driver can
register the DMAC request number.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
v4->v5:
* Dropped the registration of ACK No.
* Removed some #define in the driver and in the header file.
* Renamed the exported function to rzv2h_icu_register_dma_req.
* Rebased on top of the latest ICU related changes from Biju.
* Reworked changelog and title.
* Dropped Thomas' Reviewed-by tag as too much has changed since v4.
v3->v4:
* No change.
v2->v3:
* Replaced rzv2h_icu_register_dma_req_ack with
  rzv2h_icu_register_dma_req_ack() in changelog.
* Added dummy for rzv2h_icu_register_dma_req_ack().
* Added Rb Thomas.
v1->v2:
* Improved macros.
* Shared new macros for minimum values.
---
 drivers/irqchip/irq-renesas-rzv2h.c       | 35 +++++++++++++++++++++++
 include/linux/irqchip/irq-renesas-rzv2h.h | 23 +++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 include/linux/irqchip/irq-renesas-rzv2h.h

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 3d5b5fdf9bde..c0322bdfc69f 100644
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
@@ -103,6 +106,15 @@ struct rzv2h_hw_info {
 	u8		field_width;
 };
 
+/* DMAC */
+#define ICU_DMAC_DkRQ_SEL_MASK			GENMASK(9, 0)
+
+#define ICU_DMAC_DMAREQ_SHIFT(up)		((up) * 16)
+#define ICU_DMAC_DMAREQ_MASK(up)		(ICU_DMAC_DkRQ_SEL_MASK \
+						 << ICU_DMAC_DMAREQ_SHIFT(up))
+#define ICU_DMAC_PREP_DMAREQ(sel, up)		(FIELD_PREP(ICU_DMAC_DkRQ_SEL_MASK, (sel)) \
+						 << ICU_DMAC_DMAREQ_SHIFT(up))
+
 /**
  * struct rzv2h_icu_priv - Interrupt Control Unit controller private data structure.
  * @base:	Controller's base address
@@ -117,6 +129,27 @@ struct rzv2h_icu_priv {
 	const struct rzv2h_hw_info	*info;
 };
 
+void rzv2h_icu_register_dma_req(struct platform_device *icu_dev, u8 dmac_index, u8 dmac_channel,
+				u16 req_no)
+{
+	struct rzv2h_icu_priv *priv = platform_get_drvdata(icu_dev);
+	u32 icu_dmksely, dmareq, dmareq_mask;
+	u8 y, upper;
+
+	y = dmac_channel / 2;
+	upper = dmac_channel % 2;
+
+	dmareq = ICU_DMAC_PREP_DMAREQ(req_no, upper);
+	dmareq_mask = ICU_DMAC_DMAREQ_MASK(upper);
+
+	guard(raw_spinlock_irqsave)(&priv->lock);
+
+	icu_dmksely = readl(priv->base + ICU_DMkSELy(dmac_index, y));
+	icu_dmksely = (icu_dmksely & ~dmareq_mask) | dmareq;
+	writel(icu_dmksely, priv->base + ICU_DMkSELy(dmac_index, y));
+}
+EXPORT_SYMBOL_GPL(rzv2h_icu_register_dma_req);
+
 static inline struct rzv2h_icu_priv *irq_data_to_priv(struct irq_data *data)
 {
 	return data->domain->host_data;
@@ -483,6 +516,8 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 	if (!rzv2h_icu_data)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, rzv2h_icu_data);
+
 	rzv2h_icu_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
 	if (IS_ERR(rzv2h_icu_data->base))
 		return PTR_ERR(rzv2h_icu_data->base);
diff --git a/include/linux/irqchip/irq-renesas-rzv2h.h b/include/linux/irqchip/irq-renesas-rzv2h.h
new file mode 100644
index 000000000000..618a60d2eac0
--- /dev/null
+++ b/include/linux/irqchip/irq-renesas-rzv2h.h
@@ -0,0 +1,23 @@
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
+
+#ifdef CONFIG_RENESAS_RZV2H_ICU
+void rzv2h_icu_register_dma_req(struct platform_device *icu_dev, u8 dmac_index, u8 dmac_channel,
+				u16 req_no);
+#else
+static inline void rzv2h_icu_register_dma_req(struct platform_device *icu_dev, u8 dmac_index,
+					      u8 dmac_channel, u16 req_no) { }
+#endif
+
+#endif /* __LINUX_IRQ_RENESAS_RZV2H */
-- 
2.34.1


