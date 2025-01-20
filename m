Return-Path: <linux-renesas-soc+bounces-12255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3246CA169DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B80B71887A90
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 09:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA8719995A;
	Mon, 20 Jan 2025 09:47:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF191A9B49
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737366467; cv=none; b=RYfrh/lxlz5SKIr92RZLdQU1t+JzXI7xF8NZKgJ6BF5JbizXN5aMdsP2OWzJQUQP5/2GqWzyW2Z8YHuPm7ZbdQhpittaz8RLn5r2CAFph7b6ScjzYiK30ZsHZXofRcaUxZGAYskcdm7RhzhJrWtrBITyl/RC/LWUe+L13PL0u84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737366467; c=relaxed/simple;
	bh=d0ryn+E4c37PmZNw277t3a1DIk3+dTx3wwMScf6EyvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VzhrF2KK4UrBUODFji5UGJokeOLBcOKEwS5uPcDWodXgNoZtCxd8IXfaIvL61nLY3ND13Yls9wWykC3iTmmjmn2RT9mn5g+2wqx8ywdFI8d6b1Vs6LWpZaMywxI1eYlx0usNavkNJjEWtEjqkR5ETZFneGp6mZQ7qeNBL/E21tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: zbN2QBUoQFenfX5RpCbuhA==
X-CSE-MsgGUID: ApPIly7uS9u50bpD7jktOQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Jan 2025 18:47:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 30F3F401831B;
	Mon, 20 Jan 2025 18:47:33 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 05/11] irqchip/renesas-rzv2h: Add struct rzv2h_hw_info with t_offs variable
Date: Mon, 20 Jan 2025 09:47:01 +0000
Message-ID: <20250120094715.25802-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ICU block on the RZ/G3E SoC is almost identical to the one found on
the RZ/V2H SoC, with the following differences:
 - The TINT register offset starts at 0x830 instead of 0x30.
 - The number of GPIO interrupts for TINT selection is 141 instead of 86.
 - The pin index and TINT selection index are not in the 1:1 map
 - The number of TSSR registers is 15 instead of 8
 - Each TSSR register can program 2 TINTs instead of 4 TINTs

Introduce struct rzv2h_hw_info to handle these differences and add t_offs
variable to take care of the TINT register offset difference between
RZ/G3E and RZ/V2H.

Refactor the code by moving rzv2h_icu_init() into rzv2h_icu_init_common()
and pass the varable containing hw difference to support both these SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 46 +++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index a02d47529564..195ce9c5e5b5 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -80,16 +80,26 @@
 #define ICU_TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
 #define ICU_PB5_TINT				0x55
 
+/**
+ * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @t_offs: TINT offset
+ */
+struct rzv2h_hw_info {
+	u16 t_offs;
+};
+
 /**
  * struct rzv2h_icu_priv - Interrupt Control Unit controller private data structure.
  * @base:	Controller's base address
  * @fwspec:	IRQ firmware specific data
  * @lock:	Lock to serialize access to hardware registers
+ * @info:	Pointer to struct rzv2h_hw_info
  */
 struct rzv2h_icu_priv {
 	void __iomem			*base;
 	struct irq_fwspec		fwspec[ICU_NUM_IRQ];
 	raw_spinlock_t			lock;
+	const struct rzv2h_hw_info	*info;
 };
 
 static inline struct rzv2h_icu_priv *irq_data_to_priv(struct irq_data *data)
@@ -109,7 +119,7 @@ static void rzv2h_icu_eoi(struct irq_data *d)
 			tintirq_nr = hw_irq - ICU_TINT_START;
 			bit = BIT(tintirq_nr);
 			if (!irqd_is_level_type(d))
-				writel_relaxed(bit, priv->base + ICU_TSCLR);
+				writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
 		} else if (hw_irq >= ICU_IRQ_START) {
 			tintirq_nr = hw_irq - ICU_IRQ_START;
 			bit = BIT(tintirq_nr);
@@ -137,12 +147,12 @@ static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
 	tssel_n = ICU_TSSR_TSSEL_N(tint_nr);
 
 	guard(raw_spinlock)(&priv->lock);
-	tssr = readl_relaxed(priv->base + ICU_TSSR(k));
+	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
 	if (enable)
 		tssr |= ICU_TSSR_TIEN(tssel_n);
 	else
 		tssr &= ~ICU_TSSR_TIEN(tssel_n);
-	writel_relaxed(tssr, priv->base + ICU_TSSR(k));
+	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(k));
 }
 
 static void rzv2h_icu_irq_disable(struct irq_data *d)
@@ -245,8 +255,8 @@ static void rzv2h_clear_tint_int(struct rzv2h_icu_priv *priv, unsigned int hwirq
 	u32 bit = BIT(tint_nr);
 	int k = tint_nr / 16;
 
-	tsctr = readl_relaxed(priv->base + ICU_TSCTR);
-	titsr = readl_relaxed(priv->base + ICU_TITSR(k));
+	tsctr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSCTR);
+	titsr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TITSR(k));
 	titsel = ICU_TITSR_TITSEL_GET(titsr, titsel_n);
 
 	/*
@@ -255,7 +265,7 @@ static void rzv2h_clear_tint_int(struct rzv2h_icu_priv *priv, unsigned int hwirq
 	 */
 	if ((tsctr & bit) && ((titsel == ICU_TINT_EDGE_RISING) ||
 			      (titsel == ICU_TINT_EDGE_FALLING)))
-		writel_relaxed(bit, priv->base + ICU_TSCLR);
+		writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
 }
 
 static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
@@ -306,21 +316,21 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 
 	guard(raw_spinlock)(&priv->lock);
 
-	tssr = readl_relaxed(priv->base + ICU_TSSR(tssr_k));
+	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 	tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n) | tien);
 	tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n);
 
-	writel_relaxed(tssr, priv->base + ICU_TSSR(tssr_k));
+	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 
-	titsr = readl_relaxed(priv->base + ICU_TITSR(titsr_k));
+	titsr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TITSR(titsr_k));
 	titsr &= ~ICU_TITSR_TITSEL_MASK(titsel_n);
 	titsr |= ICU_TITSR_TITSEL_PREP(sense, titsel_n);
 
-	writel_relaxed(titsr, priv->base + ICU_TITSR(titsr_k));
+	writel_relaxed(titsr, priv->base + priv->info->t_offs + ICU_TITSR(titsr_k));
 
 	rzv2h_clear_tint_int(priv, hwirq);
 
-	writel_relaxed(tssr | tien, priv->base + ICU_TSSR(tssr_k));
+	writel_relaxed(tssr | tien, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 
 	return 0;
 }
@@ -419,7 +429,8 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv, struct device
 	return 0;
 }
 
-static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
+static int rzv2h_icu_init_common(struct device_node *node, struct device_node *parent,
+				 const struct rzv2h_hw_info *hw_info)
 {
 	struct irq_domain *irq_domain, *parent_domain;
 	struct rzv2h_icu_priv *rzv2h_icu_data;
@@ -485,6 +496,8 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 		goto pm_put;
 	}
 
+	rzv2h_icu_data->info = hw_info;
+
 	/*
 	 * coccicheck complains about a missing put_device call before returning, but it's a false
 	 * positive. We still need &pdev->dev after successfully returning from this function.
@@ -499,6 +512,15 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 	return ret;
 }
 
+static const struct rzv2h_hw_info rzv2h_hw_params = {
+	.t_offs = 0,
+};
+
+static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
+{
+	return rzv2h_icu_init_common(node, parent, &rzv2h_hw_params);
+}
+
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzv2h_icu)
 IRQCHIP_MATCH("renesas,r9a09g057-icu", rzv2h_icu_init)
 IRQCHIP_PLATFORM_DRIVER_END(rzv2h_icu)
-- 
2.43.0


